#' Save plots with good default dimensions
#'
#'
#' @param filename The name of your image file to save
#' @param units Units of the dimensions of the imagefile
#' @param width The width of the image file
#' @param height The height of the image file
#' @param dpi The resolution of the image file
#' @param ... Other arguments passed to ggsave()
#'
#' @return None
#'
#' @examples
#' \dontrun{
#' ggsave_wb(filename = "name-of-your-plot.jpg")
#' }
#'
#' @export

ggsave_wb <- function(
    filename = "my-worldbank-plot.png",
    units = "px",
    width = 960,
    height = 540,
    dpi = 200,
    ...) {
  ggplot2::ggsave(
    filename = filename,
    units = "px",
    width = width,
    height = height,
    dpi = dpi,
    ...)
}
