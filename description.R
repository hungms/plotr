pkgs <- c(
    "tidyverse", "cowplot", "viridis", "ggrepel", "patchwork", "wesanderson", "RColorBrewer")

for(x in pkgs){
    usethis::use_package(x)}