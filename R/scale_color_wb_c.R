#' Continuous colour scales with WB palettes
#'
#'
#' @param palette The WB color palette to use. One of 'seq', 'seqRev', 'seqB', 'seqY', 'seqP', 'divPosNeg', or 'divLR'
#' @param direction Sets the order of colors in the scale. 1 is the default, if -1, the order of colors is reversed
#' @param na.value Color to use for NA values
#' @param ... Other arguments passed to scale_colour_continuous()
#'
#' @return None
#'
#' @examples
#' scale_color_wb_c(palette = "seq")
#'
#' @export

scale_color_wb_c <- function(...,
                               palette = "seq",
                               direction = 1,
                               na.value = WBCOLORS[["noData"]]) {

  if(palette %in% c('seq', 'seqRev', 'seqB', 'seqY', 'seqP', 'divPosNeg', 'divLR')){
    pal <- WBPALETTES[[palette]]

    ggplot2::continuous_scale(
      aesthetics = "colour",
      palette = scales::gradient_n_pal(pal),
      na.value = na.value,
      guide = guide_colourbar(
        theme = theme(
          legend.key.height = unit(0.5, "lines"),
          legend.frame = element_rect(colour = WBCOLORS$middle, linewidth = 0.25),
          legend.text.position = "top",
          legend.ticks = element_line(colour = WBCOLORS$middle, linewidth = 0.25),
          legend.ticks.length = unit(0.5, "lines"),
          legend.text = element_text(
            color = WBCOLORS$lightText,
            margin = ggplot2::margin(0, 0, 4, 0)),
          legend.key.width = ggplot2::unit(1, "null")
        ),

      ),
      ...
    )
  } else {
    cat("The palette does not exist. It should be 'seq', 'seqRev', 'seqB', 'seqY', 'seqP', 'divPosNeg', or 'divLR'")
  }
}
