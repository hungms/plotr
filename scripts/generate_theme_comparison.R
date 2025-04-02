library(plotr)
library(ggplot2)
library(dplyr)
library(patchwork)

# Create directory for images if it doesn't exist
if (!dir.exists("man/figures")) {
  dir.create("man/figures", recursive = TRUE)
}

# Example 1: Scatter plot with three different themes
# Default ggplot theme_bw()
theme_bw_plot <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_bw() +
  labs(title = "theme_bw()",
       x = "Weight",
       y = "Miles Per Gallon",
       color = "Cylinders")

# plotr theme_border()
theme_border_plot <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_border() + 
  theme_text() +
  labs(title = "theme_border()",
       x = "Weight",
       y = "Miles Per Gallon",
       color = "Cylinders")

# plotr theme_line()
theme_line_plot <- ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl))) +
  geom_point(size = 3) +
  theme_line() + 
  theme_text() +
  labs(title = "theme_line()",
       x = "Weight",
       y = "Miles Per Gallon",
       color = "Cylinders")

# Combine plots
theme_comparison <- theme_bw_plot + theme_border_plot + theme_line_plot + 
  plot_layout(ncol = 3, guides = "collect") & 
  theme(legend.position = "bottom")

# Save theme comparison
ggsave("man/figures/theme_comparison.png", theme_comparison, width = 15, height = 5, dpi = 150)

# Example 2: Bar plot with three different themes
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$am <- as.factor(mtcars$am)

# Default ggplot theme_bw
theme_bw_bar <- ggplot(mtcars, aes(x = am, fill = cyl)) +
  geom_bar(position = "fill") +
  scale_y_continuous(labels = scales::percent) +
  theme_bw() +
  labs(title = "theme_bw()",
       x = "Transmission (0 = Auto, 1 = Manual)",
       y = "Proportion",
       fill = "Cylinders")

# plotr theme_border
theme_border_bar <- ggplot(mtcars, aes(x = am, fill = cyl)) +
  geom_bar(position = "fill", width = 0.85, color = "white") +
  scale_y_continuous(labels = scales::percent) +
  theme_border() +
  theme_text() +
  labs(title = "theme_border()",
       x = "Transmission (0 = Auto, 1 = Manual)",
       y = "Proportion",
       fill = "Cylinders")

# plotr theme_line
theme_line_bar <- ggplot(mtcars, aes(x = am, fill = cyl)) +
  geom_bar(position = "fill", width = 0.85, color = "white") +
  scale_y_continuous(labels = scales::percent) +
  theme_line() +
  theme_text() +
  labs(title = "theme_line()",
       x = "Transmission (0 = Auto, 1 = Manual)",
       y = "Proportion",
       fill = "Cylinders")

# Combine bar plots
bar_comparison <- theme_bw_bar + theme_border_bar + theme_line_bar + 
  plot_layout(ncol = 3, guides = "collect") & 
  theme(legend.position = "bottom")

# Save bar comparison
ggsave("man/figures/bar_theme_comparison.png", bar_comparison, width = 15, height = 5, dpi = 150)

cat("Theme comparison plots have been generated in the man/figures directory\n") 