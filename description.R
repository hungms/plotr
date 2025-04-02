pkgs <- c(
    "tidyverse", "patchwork", "cowplot", "viridis", "ggrepel", "wesanderson", "RColorBrewer")

for(x in pkgs){
    usethis::use_package(x, type = "depends")} #, type = "depends"