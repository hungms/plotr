#' theme_text
#' 
#' ggplot2 aesthetic option with texts
#' @export 
theme_text <- function(){
    theme(
        text = element_text(family = "Helvetica"),
        legend.title = element_text(size = 14),
        legend.text = element_text(size = 12),
        axis.text.x = element_text(angle = 0, hjust = 0.5),
        axis.ticks.length = unit(0.2, "cm"),
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),
        axis.title = element_text(size = 14),
        axis.text = element_text(size = 14))}

#' theme_border
#'
#' ggplot2 aesthetic option with borders
#' @export
theme_border <- function(){
    list(
        ggplot2::theme_bw() %+replace%
        theme(
            panel.background = element_blank()),
        theme_gridlines())}

#' theme_line
#'
#' ggplot2 aesthetic option with borders
#' @export
theme_line <- function(){
    list(
        scale_y_continuous(expand = expansion(mult = c(0.05, 0.05))),
        
        ggplot2::theme_bw() %+replace%
        theme(
            panel.background = element_blank(),
            panel.border = element_blank(),
            axis.line = element_line(color = "black")),
        theme_gridlines())}

#' theme_noaxisticks
#'
#' ggplot2 aesthetic option with no grid lines
#' @export
theme_noaxisticks <- function(){
    theme(
        panel.grid = element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()
        )}

#' theme_gridlines,
#'
#' ggplot2 aesthetic option with lighter grid lines
#' @export
theme_gridlines <- function(){
    theme(
        panel.grid.major = element_line(color = "grey60", size = 0.15, linetype = "dashed"),
        panel.grid.minor = element_line(color = "grey60", size = 0.1, linetype = "dashed"))}

#' facet_aes
#'
#' ggplot2 aesthetic option with facet_wraps
#' @export
facet_aes <- function(){
    theme(
        strip.text = element_text(face="bold", size=16))}

#' umap_aes
#'
#' ggplot2 aesthetic option with UMAPs
#' @param type reduction type - "UMAP", "tSNE", "PC"
#' @export
umap_aes <- function(type = "UMAP"){
    list(
	    xlab(paste0(type, "1")),
        ylab(paste0(type, "2")),
        theme_gridlines(),
        theme(
            panel.background = element_rect(fill = "white"),
            panel.border = element_rect(colour = "black", fill=NA, size=0.8),
            aspect.ratio = 1))}

#' plot_percent
#'
#' plot percentage for cells
#' @param df dataframe
#' @param group.by column to group by
#' @param variable variable to color by
#' @param facet.by column to facet by
#' @param cols vector of colors
#' @param legend.ncol no. of legend columns
#' @export
plot_percent <- function(df, group.by, variable, facet.by = NULL, cols = NULL, legend.ncol = 1){
    
    stopifnot(c(group.by, variable, facet.by) %in% colnames(df))

    group <- c(group.by, facet.by)
    metadata <- df

    plot <- metadata %>%
        filter(!is.na(!!sym(variable))) %>%
        group_by_at(c(group, variable)) %>%
        summarize(count = n()) %>%
        group_by_at(group) %>%
        mutate(pct = count*100/sum(count)) %>%
        ggplot(aes_string(x = group.by, y = "pct", fill = variable)) +
        geom_col(width = 0.85, position = "stack", col = "white") +
        guides(fill = guide_legend(title = "", ncol = legend.ncol)) +
        theme_line() +
        theme_text() +
        xlab("") +
        ylab("Frequency (%)")
    
    if(length(cols) > 0){
        plot <- plot +
            scale_fill_manual(values = cols)}

    if(length(facet.by) == 1){
        plot <- plot +
            facet_wrap(as.formula(paste0("~ ", facet.by)), nrow = 1) +
            facet_aes()}

    return(plot)}