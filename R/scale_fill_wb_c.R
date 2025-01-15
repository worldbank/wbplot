#' Continuous fill scales with WB palettes
#'
#'
#' @param palette The WB color palette to use. One of 'seq', 'seqRev', 'seqB', 'seqY', 'seqP', 'divPosNeg', or 'divLR'
#' @param direction Sets the order of colors in the scale. 1 is the default, if -1, the order of colors is reversed
#' @param na.value Color to use for NA values
#' @param ... Other arguments passed to scale_fill_continuous()
#'
#' @return None
#'
#' @examples
#' scale_fill_wb_c(palette = "seq")
#'
#' @export

scale_fill_wb_c <- function(...,
                           palette = "seq",
                           direction = 1,
                           na.value = WBCOLORS[["noData"]]) {

  if(palette %in% c('seq', 'seqRev', 'seqB', 'seqY', 'seqP', 'divPosNeg', 'divLR')){
    pal <- WBPALETTES[[palette]]

    ggplot2::continuous_scale(
      aesthetics = "fill",
      palette = scales::gradient_n_pal(pal),
      na.value = na.value,
      guide = ggplot2::guide_colourbar(
        theme = ggplot2::theme(
          legend.key.height = ggplot2::unit(0.5, "lines"),
          legend.frame = ggplot2::element_rect(colour = WBCOLORS$middle, linewidth = 0.25),
          legend.text.position = "top",
          legend.ticks = ggplot2::element_line(colour = WBCOLORS$middle, linewidth = 0.25),
          legend.ticks.length = ggplot2::unit(0.5, "lines"),
          legend.text = ggplot2::element_text(
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
