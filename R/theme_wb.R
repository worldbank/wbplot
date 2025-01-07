#' ggplot theme for World Bank visualizations
#'
#' Creates overrides for a ggplot theme, using the World Bank data visualization style
#'
#' @return None
#'
#' @examples
#' theme_wb()
#'

#' @export
theme_wb <- function() {
  ggplot2::theme(
    panel.background = ggplot2::element_blank(),

    plot.title = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$l,
      face = WBSTYLE$chartTitle$weight,
      color = WBCOLORS$darkText),

    plot.subtitle = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$m,
      face = "plain",
      color = WBCOLORS$lighText),

    legend.position = "bottom"
  )
}
