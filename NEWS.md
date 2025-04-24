# plotr NEWS

## v0.1.3
### New Features
* Added `save_jupyter_plot()` function to save plots into pdf files.
* Added `add_strip_pal()` function to customize strip background colors

## v0.1.2
### New Features
* Added `theme_scatter()` function to plot lines at x = 0 and y = 0

## v0.1.1

### New Features
* Added `no_gridlines()` function to remove gridlines from plots
* Added `no_axis_text()` function to remove axis text from plots

## v0.1.0

### Breaking Changes
* Removed backward compatibility for legacy palette names
* All color palettes now use the systematic naming scheme with a `pal_` prefix followed by the palette name and the number of colors available
* Palettes are now functions that retrieve values from a package environment, requiring `()` when used (e.g., `pal_kelly_20()` instead of `pal_kelly_20`)

### Improvements
* Standardized color palette naming system for better clarity and usability
* Updated documentation to reflect the new naming scheme throughout
* Streamlined palette list in the package
* Enhanced vignettes and examples to use the new palette names
* Implemented package environment for palette storage, improving performance and memory management
* Modified `get_palette()` to handle palette functions directly

## v0.0.0.9000 (Development version)

### New Features
* Added various theme functions for ggplot2:
  * `theme_text()`: Typography settings with Helvetica font
  * `theme_border()`: Clean border style
  * `theme_line()`: Line-based theme with no border
  * `theme_noaxisticks()`: Theme without axis ticks
  * `theme_gridlines()`: Lighter gridlines styling
  * `facet_aes()`: Enhanced facet_wrap aesthetics
  * `umap_aes()`: Special aesthetics for dimension reduction plots (UMAP, tSNE, PCA)
* Added `plot_percent()` for creating percentage/frequency bar plots
* Included multiple color palettes:
  * Various standard palettes (godsnot, zeileis, etc.)
  * WesAnderson-inspired palettes
  * Colorblind-friendly options (kelly, greenarmytage)
  * Color utilities like `get_palette()` for accessing palettes

### Infrastructure
* Initial package setup with documentation
* GitHub Pages setup with pkgdown 