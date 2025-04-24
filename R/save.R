#' Get the name of an object
#'
#' This function searches the global environment for an object and returns its name.
#'
#' @param obj The object to search for
#' @return The name of the object, or NULL if not found
#' @examples
#' \dontrun{
#' get_name(my_plot)
#' }
#' @export
get_name <- function(obj) {
  var_names <- ls(envir = .GlobalEnv) # List all variable names in the global environment
  for (var in var_names) {
    if (identical(get(var, envir = .GlobalEnv), obj)) {
      return(var)}}
  return(NULL)}


#' Save a plot in Jupyter notebook
#'
#' This function saves a plot as a PDF file in the specified directory.
#' It uses the Cairo PDF device if available, or falls back to standard PDF if not.
#'
#' @param plot The plot to save
#' @param save_dir The directory to save the plot
#' @param width The width of the plot
#' @param height The height of the plot
#' @return None. Creates a PDF file in the specified directory
#' @examples
#' \dontrun{
#' save_jupyter_plot(my_plot, "figures")
#' }
#' @export
save_jupyter_plot <- function(plot, save_dir, width = getOption("repr.plot.width"), height = getOption("repr.plot.height")){
    # Create directory if it doesn't exist
    if(!dir.exists(save_dir)){
        dir.create(save_dir, recursive = TRUE)
    }
    
    # Construct file path
    file_path <- paste0(save_dir, "/", get_name(plot), ".pdf")
    print(plot)

    # Try using Cairo if available, otherwise use standard PDF
    tryCatch({
        if (requireNamespace("Cairo", quietly = TRUE)) {
            Cairo::CairoPDF(file = file_path, width = width, height = height)
        } else {
            pdf(file = file_path, width = width, height = height)
        }
        print(plot)
        dev.off()
    }, error = function(e) {
        # If Cairo fails, try standard PDF
        message("Cairo PDF failed, using standard PDF device instead: ", e$message)
        pdf(file = file_path, width = width, height = height)
        print(plot)
        dev.off()
    })
    
    # Return the file path invisibly
    invisible(file_path)
}

