#' Get the font weight from the font face
#'
#'
#' @param fontFace The font face name
#'
#' @returns The font weight
#'
#' @examples
#' get_font_weight('semibold')
#'
#' @export


get_font_weight <- function(fontFace){
  fontWeight <- 400
  if(fontFace == "regular"){
    fontWeight <- 400
  }
  else if(fontFace == "semibold"){
    fontWeight <- 600
  } else if(fontFace == "bold"){
    fontWeight <- 700
  }
  return(fontWeight)
}
