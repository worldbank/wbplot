#' Discrete fill scales with WB palettes
#'
#'
#' @param palette The discrete WB color palette to use. One of 'default', 'defaultText', 'region', 'regionText', 'income', 'gender', 'urbanisation', 'age', or 'binary'
#' @param na.value Color to use for NA values
#' @param ... Other arguments passed to scale_colour_discrete()
#'
#' @return None
#'
#' @examples
#' scale_fill_wb_d(palette = "default")
#'
#' @export

scale_fill_wb_d <- function(...,
                             palette = "default",
                             na.value = WBCOLORS[["noData"]]) {

  makeUpperCase <- function(lowcase){
    return(toupper(lowcase))
  }

  if(palette %in% c('default', 'defaultText', 'region', 'regionText', 'income', 'gender', 'urbanisation', 'age', 'binary')){
    pal <- WBPALETTES[[palette]]

    ggplot2::scale_fill_manual(
      aesthetics = "fill",
      values = pal,
      na.value = na.value,
      labels = makeUpperCase,
      guide = ggplot2::guide_legend(nrow = 1),
      ...
    )
  } else {
    cat("The palette does not exist. It should be 'default', 'defaultText', 'region', 'regionText', 'income', 'gender', 'urbanisation', 'age', or 'binary'")
  }
}
