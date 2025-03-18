.onLoad <- function(libname, pkgname) {
  ### load default packages
  packages <- c(
    "tidyverse", "patchwork", "cowplot", "viridis", "ggrepel", "wesanderson", "RColorBrewer")
  invisible(lapply(packages, library, character.only = TRUE))

  ### start up settings
  options(dplyr.summarise.inform = FALSE)
  set.seed(123)
  errorMessage <- NULL

  ### load essential scripts
  #dir <- system.file("essentials", package = pkgname)
  #scripts <- list.files(dir, full.names = TRUE)
  #for(script in scripts){
  #  source(script)}

}
