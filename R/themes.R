#' @importFrom ggplot2 theme element_text unit theme_bw %+replace% element_blank element_line scale_y_continuous expansion element_rect xlab ylab
NULL

#' Theme for text elements
#' 
#' Apply consistent text styling to ggplot2 graphics
#' 
#' @param base_family Base font family. Default is "Helvetica".
#' @param base_size Base font size. Default is 14.
#' @param title_size Plot title size. Default is 16.
#' @param title_face Plot title face. Default is "bold".
#' @param legend_title_size Legend title size. Default is 14.
#' @param legend_text_size Legend text size. Default is 12.
#' @param axis_title_size Axis title size. Default is 14.
#' @param axis_text_size Axis text size. Default is 14.
#' @param x_text_angle X axis text angle. Default is 0.
#' @param x_text_hjust X axis text horizontal justification. Default is 0.5.
#' 
#' @return A theme object that can be added to a ggplot object
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   theme_text()
#' }
#' @export 
theme_text <- function(
    base_family = "Helvetica",
    base_size = 14,
    title_size = 16,
    title_face = "bold",
    legend_title_size = 14,
    legend_text_size = 12,
    axis_title_size = 14,
    axis_text_size = 14,
    x_text_angle = 0,
    x_text_hjust = 0.5
){
    theme(
        text = element_text(family = base_family, size = base_size),
        plot.title = element_text(
            hjust = 0.5, 
            size = title_size, 
            face = title_face
        ),
        legend.title = element_text(size = legend_title_size),
        legend.text = element_text(size = legend_text_size),
        axis.title = element_text(size = axis_title_size),
        axis.text = element_text(size = axis_text_size),
        axis.text.x = element_text(
            angle = x_text_angle, 
            hjust = x_text_hjust
        ),
        axis.ticks.length = unit(0.2, "cm")
    )
}

#' Theme with borders
#'
#' A ggplot2 theme with clean borders
#'
#' @return A list of ggplot2 theme elements
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   theme_border()
#' }
#' @export
theme_border <- function(){
    list(
        ggplot2::theme_bw() %+replace%
        theme(
            panel.background = element_blank()),
        theme_gridlines())
}

#' Theme with axis lines
#'
#' A ggplot2 theme with axis lines instead of full borders
#'
#' @return A list of ggplot2 theme elements
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   theme_line()
#' }
#' @export
theme_line <- function(){
    list(
        scale_y_continuous(expand = expansion(mult = c(0.05, 0.05))),
        
        ggplot2::theme_bw() %+replace%
        theme(
            panel.background = element_blank(),
            panel.border = element_blank(),
            axis.line = element_line(color = "black")),
        theme_gridlines())
}

#' Theme without axis ticks
#'
#' A ggplot2 theme with no axis ticks or grid lines
#' 
#' @return A theme object that can be added to a ggplot object
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   theme_noaxisticks()
#' }
#' @export
theme_noaxisticks <- function(){
    theme(
        panel.grid = element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.text.y=element_blank(),
        axis.ticks.y=element_blank()
        )
}

#' Theme with customized grid lines
#'
#' A ggplot2 theme with lighter grid lines
#' 
#' @return A theme object that can be added to a ggplot object
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   theme_gridlines()
#' }
#' @export
theme_gridlines <- function(){
    theme(
        panel.grid.major = element_line(color = "grey60", size = 0.15, linetype = "dashed"),
        panel.grid.minor = element_line(color = "grey60", size = 0.1, linetype = "dashed"))
}

#' Theme for facet panels
#'
#' Enhance facet wrap panels with better text styling
#' 
#' @param face Font face for strip text. Default is "bold".
#' @param size Font size for strip text. Default is 16.
#' 
#' @return A theme object that can be added to a ggplot object
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   facet_wrap(~cyl) +
#'   facet_aes()
#' }
#' @export
facet_aes <- function(face = "bold", size = 16){
    theme(
        strip.text = element_text(face = face, size = size))
}

#' Theme for dimension reduction plots
#'
#' Special aesthetics for dimension reduction plots like UMAP, tSNE, or PCA
#'
#' @param type Reduction type - "UMAP", "tSNE", or "PC". Default is "UMAP".
#' @param aspect_ratio Aspect ratio for the plot. Default is 1.
#' @param border_size Border size in mm. Default is 0.8.
#' 
#' @return A list of ggplot2 theme elements
#' @examples
#' \dontrun{
#' library(ggplot2)
#' # Assuming df has UMAP1 and UMAP2 columns
#' ggplot(df, aes(UMAP1, UMAP2, color = cluster)) + 
#'   geom_point() + 
#'   umap_aes()
#' }
#' @export
umap_aes <- function(type = "UMAP", aspect_ratio = 1, border_size = 0.8){
    list(
        xlab(paste0(type, "1")),
        ylab(paste0(type, "2")),
        theme_gridlines(),
        theme(
            panel.background = element_rect(fill = "white"),
            panel.border = element_rect(colour = "black", fill = NA, size = border_size),
            aspect.ratio = aspect_ratio))
} 

#' Theme with no grid lines
#'
#' A ggplot2 theme with no grid lines
#'
#' @return A theme object that can be added to a ggplot object
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   no_gridlines()
#' }
#' @export
no_gridlines <- function(){
    theme(
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
}


#' Theme with no axis text
#'
#' A ggplot2 theme with no axis text
#'
#' @return A theme object that can be added to a ggplot object
#' @examples
#' \dontrun{
#' library(ggplot2)
#' ggplot(mtcars, aes(wt, mpg)) + 
#'   geom_point() + 
#'   no_axis_text()
#' }
#' @export
no_axis_text <- function(){
    theme(
        axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks.y = element_blank())}