#' @importFrom ggplot2 ggplot aes_string geom_col guides guide_legend xlab ylab scale_fill_manual facet_wrap
#' @importFrom dplyr filter group_by_at summarize mutate
#' @importFrom magrittr %>%
#' @importFrom rlang sym
NULL

#' Create percentage bar plots
#'
#' Generate bar plots showing percentages or frequencies across groups.
#' This function calculates percentages within groups and creates a stacked bar plot.
#'
#' @param df Dataframe containing the data to plot.
#' @param group.by Column name to group data by (x-axis).
#' @param variable Column name for variable to show as different colors (fill).
#' @param facet.by Optional column name to facet the plot by. Default is NULL.
#' @param cols Optional vector of colors for fill. Default is NULL (uses default ggplot colors).
#' @param legend.ncol Number of columns for the legend. Default is 1.
#' @param position Position adjustment for bars. Options are "stack" (default) or "fill".
#' @param bar.width Width of the bars. Default is 0.85.
#' @param bar.color Color of the bar borders. Default is "white".
#' @param orientation Plot orientation. Options are "vertical" (default) or "horizontal".
#' @param y.label Label for the y-axis. Default is "Frequency (%)".
#' @param x.label Label for the x-axis. Default is "" (empty).
#' @param theme Theme to apply. Default is "line". Options are "line" or "border".
#' @return A ggplot object
#' @examples
#' \dontrun{
#' # Basic percentage plot
#' plot_percent(mtcars, group.by = "am", variable = "cyl")
#' 
#' # With custom colors
#' plot_percent(mtcars, 
#'              group.by = "am", 
#'              variable = "cyl", 
#'              cols = c("red", "blue", "green"))
#'              
#' # With faceting
#' plot_percent(mtcars, 
#'              group.by = "am", 
#'              variable = "cyl", 
#'              facet.by = "vs")
#'              
#' # Horizontal orientation
#' plot_percent(mtcars, 
#'              group.by = "am", 
#'              variable = "cyl", 
#'              orientation = "horizontal")
#' }
#' @export
plot_percent <- function(
    df, 
    group.by, 
    variable, 
    facet.by = NULL, 
    cols = NULL, 
    legend.ncol = 1,
    position = "stack",
    bar.width = 0.85,
    bar.color = "white",
    orientation = "vertical",
    y.label = "Frequency (%)",
    x.label = "",
    theme = "line"
){
    # Check inputs
    stopifnot(c(group.by, variable) %in% colnames(df))
    if (!is.null(facet.by)) {
        stopifnot(facet.by %in% colnames(df))
    }
    
    stopifnot(orientation %in% c("vertical", "horizontal"))
    stopifnot(position %in% c("stack", "fill"))
    stopifnot(theme %in% c("line", "border"))
    
    # Group variables
    group <- c(group.by, facet.by)
    metadata <- df

    # Calculate percentages
    plot_data <- metadata %>%
        filter(!is.na(!!sym(variable))) %>%
        group_by_at(c(group, variable)) %>%
        summarize(count = n(), .groups = "drop") %>%
        group_by_at(group) %>%
        mutate(pct = count*100/sum(count))
    
    # Create plot with appropriate orientation
    if (orientation == "vertical") {
        plot <- ggplot(plot_data, aes_string(x = group.by, y = "pct", fill = variable))
    } else {
        plot <- ggplot(plot_data, aes_string(y = group.by, x = "pct", fill = variable))
    }
    
    # Add bars and other plot elements
    plot <- plot +
        geom_col(width = bar.width, position = position, color = bar.color) +
        guides(fill = guide_legend(title = "", ncol = legend.ncol))
    
    # Apply theme
    if (theme == "line") {
        plot <- plot + theme_line()
    } else {
        plot <- plot + theme_border()
    }
    
    # Add text theme
    plot <- plot + theme_text()
    
    # Add labels
    if (orientation == "vertical") {
        plot <- plot + 
            xlab(x.label) + 
            ylab(y.label)
    } else {
        plot <- plot + 
            ylab(x.label) + 
            xlab(y.label)
    }
    
    # Add colors if provided
    if (length(cols) > 0) {
        plot <- plot + scale_fill_manual(values = cols)
    }

    # Add facets if requested
    if (length(facet.by) == 1) {
        plot <- plot +
            facet_wrap(as.formula(paste0("~ ", facet.by)), nrow = 1) +
            facet_aes()
    }

    return(plot)
} 