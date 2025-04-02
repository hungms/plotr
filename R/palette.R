#' @importFrom stringr str_detect
#' @importFrom wesanderson wes_palette
#' @importFrom viridis viridis inferno plasma magma cividis mako rocket turbo
#' @importFrom RColorBrewer brewer.pal
NULL

# Create package environment to store palettes
.plotr <- new.env(parent = emptyenv())

#' Color palettes from various sources
#' 
#' @section Sources:
#' - pal_godsnot_102, pal_zeileis_28: scanpy palettes
#' - pal_royal_4, pal_asteroid_5, pal_darjeeling_5, pal_zissou_5: WesAnderson palettes
#' - pal_kelly_20, pal_greenarmytage_25: Colorblind-friendly palettes
#' - pal_vega10, pal_vega20, pal_vega20c: Vega visualization library palettes
#' - pal_piyg_11, pal_brbg_11, pal_prgn_11: ColorBrewer-inspired diverging palettes
#' - pal_blackpink_6, pal_calc_11: Miscellaneous palettes
#' - pal_brewerplus_41: Extended ColorBrewer palette
#' 
#' @name color_palettes
NULL

# Getter functions for each palette, exported to the user
# ===== Scanpy palettes =====
#' @rdname color_palettes
#' @format Character vector of 102 colors
#' @export
pal_godsnot_102 <- function() {
  .plotr$pal_godsnot_102
}

#' @rdname color_palettes
#' @format Character vector of 28 colors
#' @export
pal_zeileis_28 <- function() {
  .plotr$pal_zeileis_28
}

# ===== WesAnderson palettes =====
#' @rdname color_palettes 
#' @format Character vector of 4 colors
#' @export
pal_royal_4 <- function() {
  .plotr$pal_royal_4
}

#' @rdname color_palettes
#' @format Character vector of 5 colors
#' @export
pal_asteroid_5 <- function() {
  .plotr$pal_asteroid_5
}

#' @rdname color_palettes
#' @format Character vector of 5 colors
#' @export
pal_darjeeling_5 <- function() {
  .plotr$pal_darjeeling_5
}

#' @rdname color_palettes
#' @format Character vector of 5 colors
#' @export
pal_zissou_5 <- function() {
  .plotr$pal_zissou_5
}

# ===== Colorblind-friendly palettes =====
#' @rdname color_palettes
#' @format Character vector of 20 colors
#' @export
pal_kelly_20 <- function() {
  .plotr$pal_kelly_20
}

#' @rdname color_palettes
#' @format Character vector of 25 colors
#' @export
pal_greenarmytage_25 <- function() {
  .plotr$pal_greenarmytage_25
}

#' @rdname color_palettes
#' @format Character vector of 41 colors
#' @export
pal_brewerplus_41 <- function() {
  .plotr$pal_brewerplus_41
}

# ===== Additional palettes =====
#' @rdname color_palettes
#' @format Character vector of 11 colors
#' @export
pal_calc_11 <- function() {
  .plotr$pal_calc_11
}

#' @rdname color_palettes
#' @format Character vector of 11 colors
#' @export
pal_piyg_11 <- function() {
  .plotr$pal_piyg_11
}

#' @rdname color_palettes
#' @format Character vector of 11 colors
#' @export
pal_brbg_11 <- function() {
  .plotr$pal_brbg_11
}

#' @rdname color_palettes
#' @format Character vector of 11 colors
#' @export
pal_prgn_11 <- function() {
  .plotr$pal_prgn_11
}

#' @rdname color_palettes
#' @format Character vector of 6 colors
#' @export
pal_blackpink_6 <- function() {
  .plotr$pal_blackpink_6
}

# ===== Vega palettes =====
#' @rdname color_palettes
#' @format Character vector of 10 colors
#' @export
pal_vega10 <- function() {
  .plotr$pal_vega10
}

#' @rdname color_palettes
#' @format Character vector of 20 colors
#' @export
pal_vega20 <- function() {
  .plotr$pal_vega20
}

#' @rdname color_palettes
#' @format Character vector of 20 colors
#' @export
pal_vega20c <- function() {
  .plotr$pal_vega20c
}

#' Available palette list
#'
#' List of all available palettes in the package
#' @export
palette_list <- function() {
  list(
    "pal_godsnot_102" = pal_godsnot_102(),
    "pal_zeileis_28" = pal_zeileis_28(),
    "pal_royal_4" = pal_royal_4(),
    "pal_asteroid_5" = pal_asteroid_5(),
    "pal_darjeeling_5" = pal_darjeeling_5(),
    "pal_zissou_5" = pal_zissou_5(),
    "pal_kelly_20" = pal_kelly_20(),
    "pal_greenarmytage_25" = pal_greenarmytage_25(),
    "pal_brewerplus_41" = pal_brewerplus_41(),
    "pal_calc_11" = pal_calc_11(),
    "pal_blackpink_6" = pal_blackpink_6(),
    "pal_piyg_11" = pal_piyg_11(),
    "pal_brbg_11" = pal_brbg_11(),
    "pal_prgn_11" = pal_prgn_11(),
    "pal_vega10" = pal_vega10(),
    "pal_vega20" = pal_vega20(),
    "pal_vega20c" = pal_vega20c()
  )
}

#' Get color palette
#'
#' Get a vector of hexadecimal color codes based on the specified palette.
#'
#' @param palette A function that returns a color palette, a vector of hexadecimal color codes,
#'   the name of a palette from "RColorBrewer" or "viridis", or one of the package's palette functions.
#' @param n Number of colors to return. Default is 9.
#' @param direction Direction of the palette vector (1 for forward, -1 for reverse).
#' @return A vector of hexadecimal color codes.
#' @examples
#' \dontrun{
#' # Using a predefined package palette function
#' colors <- get_palette(pal_kelly_20, n = 5)
#' 
#' # Using a palette directly  
#' colors <- get_palette(pal_kelly_20(), n = 5)
#' 
#' # Using a viridis palette name
#' colors <- get_palette("viridis", n = 10)
#' 
#' # Using a ColorBrewer palette name
#' colors <- get_palette("Blues", n = 7)
#' 
#' # Reverse direction
#' colors <- get_palette(pal_kelly_20, direction = -1)
#' }
#' @export
get_palette <- function(palette, n = 9, direction = 1) {
    # If palette is a function name (not a function call), call it
    if (is.function(palette)) {
        # Check if the function takes an 'n' parameter
        if ("n" %in% names(formals(palette))) {
            palette <- palette(n = n)
        } else {
            palette <- palette()
        }
    }
    
    # Handle string inputs that reference viridis or brewer palettes
    if (is.character(palette) && length(palette) == 1) {
        if (palette %in% c("viridis", "magma", "plasma", "inferno", "cividis", "mako", "rocket", "turbo")) {
            palette <- eval(parse(text = paste0("viridis::", palette, "(", n, ")")))
        } else if (palette %in% rownames(RColorBrewer::brewer.pal.info)) {
            max_colors <- RColorBrewer::brewer.pal.info[palette, "maxcolors"]
            palette <- RColorBrewer::brewer.pal(min(n, max_colors), palette)
            
            # If we need more colors than available, interpolate
            if (n > max_colors) {
                palette <- grDevices::colorRampPalette(palette)(n)
            }
        }
    }
    
    # Validate the palette consists of hex colors
    if (is.character(palette) && length(palette) > 1) {
        # Check if these are valid hex colors - accept 3, 6, or 8 characters (with alpha)
        valid_hex <- grepl("^#([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3}|[0-9A-Fa-f]{8})$", palette)
        
        if (!all(valid_hex)) {
            invalid_colors <- palette[!valid_hex]
            stop(paste("Invalid hex color code(s):", paste(invalid_colors, collapse=", ")))
        }
    } else if (!is.character(palette)) {
        stop("Palette must be a character vector of colors, a color palette function, or a valid palette name")
    }

    # Apply direction
    if (direction < 0) {
        palette <- rev(palette)
    }
    
    # If n is less than the length of the palette, subset it
    if (n < length(palette)) {
        palette <- palette[1:n]
    } else if (n > length(palette)) {
        # If we need more colors than available, interpolate
        palette <- grDevices::colorRampPalette(palette)(n)
    }
    
    return(palette)
}

#' Display available palettes
#'
#' Creates a visualization of all available color palettes in the package
#'
#' @param n Number of colors to display from each palette. Default is NULL (all colors).
#' @return A ggplot2 object displaying the palettes
#' @examples
#' \dontrun{
#' # Display all palettes
#' display_palettes()
#' 
#' # Display first 5 colors of each palette
#' display_palettes(n = 5)
#' }
#' @export
display_palettes <- function(n = NULL) {
    # Get all palettes
    all_palettes <- palette_list()
    palette_names <- names(all_palettes)
    
    # Create data for plotting
    palette_data <- data.frame(
        palette = rep(palette_names, sapply(all_palettes, length)),
        color = unlist(all_palettes),
        position = unlist(lapply(sapply(all_palettes, length), function(x) 1:x))
    )
    
    # Subset if n is provided
    if (!is.null(n)) {
        palette_data <- palette_data[palette_data$position <= n, ]
    }
    
    # Order by palette name
    palette_data$palette <- factor(palette_data$palette, levels = palette_names)
    
    # Create the plot
    ggplot2::ggplot(palette_data, ggplot2::aes(x = position, y = palette, fill = color)) +
        ggplot2::geom_tile(color = "white", size = 0.5) +
        ggplot2::scale_fill_identity() +
        ggplot2::theme_minimal() +
        ggplot2::labs(title = "Available Color Palettes",
                     x = "Color Position", y = "Palette Name") +
        ggplot2::theme(panel.grid = ggplot2::element_blank(),
                      axis.text.x = ggplot2::element_text(size = 8),
                      axis.text.y = ggplot2::element_text(size = 10))
}
