#' Add a palette to the strip of a plot
#'
#' This function adds a palette to the strip of a plot.
#'
#' @param plot The plot to add the palette to.
#' @param pal The palette to add to the strip.
#' @return The plot with the palette added to the strip.    
#' @export
add_strip_pal <- function (plot, pal) {

    g <- ggplot_gtable(ggplot_build(plot))
    stripr <- which(grepl("strip-t", g$layout$name))
    k <- 1
    for (i in stripr) {
        j <- which(grepl("rect", g$grobs[[i]]$grobs[[1]]$childrenOrder))
        g$grobs[[i]]$grobs[[1]]$children[[j]]$gp$fill <- pal[k]
        k <- k + 1}

    plot <- as.ggplot(g)
    return(plot)}