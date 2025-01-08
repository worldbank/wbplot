#' ggplot theme for World Bank visualizations
#'
#' Creates overrides for a ggplot theme, using the World Bank data visualization style
#'
#' @return None
#'
#' @examples
#' theme_wb()
#'

# TODO
# [x] Get colors from color names
# [x] Open Sans
# [x] Color scales
# [] Make everything pixel units
# [] nodeTitle in bold: will require ggtext
# [] zeroLine
# [] All the spacing: line heights, ggsave::scale, ...
# [] Chart type specific styling
# [] Legend styling: https://www.tidyverse.org/blog/2024/02/ggplot2-3-5-0-legends/
# [] Logo?
#' @export
#'



theme_wb <- function() {

  # Inventory all font files
  font_files <- sysfonts::font_files()
  if(!any(grepl(x = font_files$file, pattern = "^OpenSans"))) {
    sysfonts::font_add_google(
      name = "Open Sans"
    )
  }

  showtext::showtext_auto()

  ggplot2::theme(
    panel.background = ggplot2::element_blank(),

    plot.title = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$l,
      face = WBSTYLE$title$weight,
      color = get_color(WBSTYLE$title$color)
    ),
    plot.title.position = "plot",

    plot.subtitle = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$m,
      face = "plain",
      color = get_color(WBSTYLE$subTitle$color)
    ),

    plot.caption = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$s,
      face = "plain",
      color = get_color(WBSTYLE$note$color),
      hjust = 0
    ),
    plot.caption.position = "plot",

    axis.title = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$m,
      face = "plain",
      color = get_color(WBSTYLE$axisLabel$color)
    ),

    axis.text = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$m,
      face = "plain",
      color = get_color(WBSTYLE$tickLabel$color)
    ),

    axis.ticks = ggplot2::element_blank(),

    panel.grid.major = ggplot2::element_line(
      color = WBCOLORS$middle,
      linewidth = WBCOLORS$gridLine$lineWidth,
      linetype = "42"
    ),

    panel.grid.minor = ggplot2::element_blank(),

    legend.text = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$s,
      color = WBCOLORS$lightText
    ),
    legend.key.width = ggplot2::unit(1, "null"),
    legend.position = "bottom"
  )
}
