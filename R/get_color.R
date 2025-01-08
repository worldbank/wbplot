#' Get the color from its name
#'
#'
#' @param colorName The name of the color
#'
#' @returns Hex code of the color
#'
#' @examples
#' get_color('darkText')
#'
#' @export


get_color <- function(colorName){
    return(WBCOLORS[[colorName]])
}
