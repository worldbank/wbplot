#' Discrete shape scale, with filled shapes
#'
#'
#' @param ... Arguments passed to scale_shape_manual()
#'
#' @return None
#'
#' @examples
#' scale_shape_wb()
#'
#' @export

scale_shape_wb <- function(...) {
    ggplot2::scale_shape_manual(
      values = c(21, 22, 23, 24, 25),
      guide = ggplot2::guide_legend(
        theme = ggplot2::theme(
          legend.key.height = ggplot2::unit(0.5, "lines"),
          legend.text.position = "top",
          legend.text = ggplot2::element_text(
            color = WBCOLORS$textSubtle,
            margin = ggplot2::margin(0, 0, 4, 0)),
          legend.key.width = ggplot2::unit(1, "null")
        ),
      ),
      ...
    )
}
