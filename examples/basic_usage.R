###############################################
# Basic examples of plotr package functionality
###############################################

library(plotr)
library(ggplot2)
library(dplyr)

# Create the examples directory if it doesn't exist
dir.create("examples/output", recursive = TRUE, showWarnings = FALSE)

#############################
# 1. Theme examples
#############################

# Basic scatter plot with default theme
p_default <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  labs(title = "Default ggplot theme",
       x = "Weight",
       y = "MPG",
       color = "Cylinders")

# Same plot with theme_border
p_border <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_border() +
  theme_text() +
  labs(title = "plotr theme_border",
       x = "Weight",
       y = "MPG",
       color = "Cylinders")

# Same plot with theme_line  
p_line <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_line() +
  theme_text() +
  labs(title = "plotr theme_line",
       x = "Weight",
       y = "MPG",
       color = "Cylinders")

ggsave("examples/output/theme_examples.png", 
       gridExtra::grid.arrange(p_default, p_border, p_line, ncol = 3),
       width = 15, height = 5)

#############################
# 2. Color palette examples
#############################

# Display all available palettes (new naming scheme only)
palette_plot <- display_palettes()
ggsave("examples/output/all_palettes.png", palette_plot, width = 10, height = 8)

# Using different color palettes with the same plot
p1 <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_line() +
  theme_text() +
  scale_color_manual(values = get_palette(pal_kelly_20(), n = 3)) +
  labs(title = "Kelly palette (colorblind-friendly)",
       color = "Cylinders")

p2 <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_line() +
  theme_text() +
  scale_color_manual(values = get_palette(pal_zissou_5(), n = 3)) +
  labs(title = "Zissou palette (Wes Anderson)",
       color = "Cylinders")

p3 <- ggplot(mtcars, aes(wt, mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_line() +
  theme_text() +
  scale_color_manual(values = get_palette(pal_viridis, n = 3)) +
  labs(title = "Viridis palette",
       color = "Cylinders")

ggsave("examples/output/palette_examples.png", 
       gridExtra::grid.arrange(p1, p2, p3, ncol = 3),
       width = 15, height = 5)

#############################
# 3. Plot percent examples
#############################

# Prepare data
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- as.factor(mtcars$am)
mtcars$vs <- as.factor(mtcars$vs)

# Basic percentage plot
p_basic <- plot_percent(mtcars, group.by = "am", variable = "cyl")

# With custom colors from a palette
p_colored <- plot_percent(mtcars, 
                         group.by = "am", 
                         variable = "cyl", 
                         cols = get_palette(pal_blues, n = 3))

# With faceting
p_facet <- plot_percent(mtcars, 
                       group.by = "am", 
                       variable = "cyl", 
                       facet.by = "vs",
                       cols = get_palette(pal_kelly_20(), n = 3))

# Horizontal orientation with theme_border
p_horiz <- plot_percent(mtcars, 
                       group.by = "am", 
                       variable = "cyl", 
                       orientation = "horizontal",
                       theme = "border",
                       cols = get_palette(pal_zissou_5(), n = 3))

ggsave("examples/output/basic_percent.png", p_basic, width = 7, height = 5)
ggsave("examples/output/colored_percent.png", p_colored, width = 7, height = 5)
ggsave("examples/output/facet_percent.png", p_facet, width = 10, height = 5)
ggsave("examples/output/horizontal_percent.png", p_horiz, width = 7, height = 5)

# Combined examples
ggsave("examples/output/percent_examples.png", 
       gridExtra::grid.arrange(p_basic, p_colored, p_facet, p_horiz, 
                               ncol = 2, nrow = 2),
       width = 12, height = 10)

#############################
# 4. UMAP theming example
#############################

# Create sample UMAP data
set.seed(123)
umap_data <- data.frame(
  UMAP1 = rnorm(100),
  UMAP2 = rnorm(100),
  cluster = sample(LETTERS[1:5], 100, replace = TRUE)
)

# Plot with umap_aes
p_umap <- ggplot(umap_data, aes(UMAP1, UMAP2, color = cluster)) +
  geom_point(size = 3) +
  theme_text() +
  scale_color_manual(values = get_palette(pal_brewerplus_41(), n = 5)) +
  labs(title = "UMAP with plotr theming") +
  umap_aes()

ggsave("examples/output/umap_example.png", p_umap, width = 7, height = 7)

# Compare different palette types on the same data
p_sci <- ggplot(umap_data, aes(UMAP1, UMAP2, color = cluster)) +
  geom_point(size = 3) +
  theme_text() +
  scale_color_manual(values = get_palette(pal_godsnot_102(), n = 5)) +
  labs(title = "Scientific Palette") +
  umap_aes()

p_cb <- ggplot(umap_data, aes(UMAP1, UMAP2, color = cluster)) +
  geom_point(size = 3) +
  theme_text() +
  scale_color_manual(values = get_palette(pal_kelly_20(), n = 5)) +
  labs(title = "Colorblind-Friendly") +
  umap_aes()

p_wa <- ggplot(umap_data, aes(UMAP1, UMAP2, color = cluster)) +
  geom_point(size = 3) +
  theme_text() +
  scale_color_manual(values = get_palette(pal_darjeeling_5(), n = 5)) +
  labs(title = "Wes Anderson Theme") +
  umap_aes()

p_div <- ggplot(umap_data, aes(UMAP1, UMAP2, color = cluster)) +
  geom_point(size = 3) +
  theme_text() +
  scale_color_manual(values = get_palette(pal_prgn_11(), n = 5)) +
  labs(title = "Diverging Colors") +
  umap_aes()

ggsave("examples/output/palette_comparison.png", 
       gridExtra::grid.arrange(p_sci, p_cb, p_wa, p_div, ncol = 2),
       width = 12, height = 10)

cat("All examples have been saved to the examples/output directory\n") 