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
# [x] zeroLine
# [x] noteTitle in bold
# [] Legend styling: https://www.tidyverse.org/blog/2024/02/ggplot2-3-5-0-legends/
# [] Make everything pixel units
# [] All the spacing: line heights, ggsave::scale, ...
# [] Chart type specific styling
# [] Semibold font
# [] Logo?
#
# Questions:
# - number of breaks
# - date formatting
# - scale expansion
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

    plot.margin = ggplot2::margin(
      t = 20,
      b = 20,
      l = 16,
      r = 16
    ),

    plot.title = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$l,
      face = WBSTYLE$title$weight,
      color = get_color(WBSTYLE$title$color),
      # This doesn't seem to work
      lineheight = WBSTYLE$title$height/100
    ),
    plot.title.position = "plot",

    plot.subtitle = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$m,
      face = "plain",
      color = get_color(WBSTYLE$subTitle$color),
      margin = ggplot2::margin(0,0,30,0)
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
    axis.title.y = ggplot2::element_text(
      margin = ggplot2::margin(0, 10, 0, 0)
    ),
    axis.title.x = ggplot2::element_text(
      margin = ggplot2::margin(10, 0, 0, 0)
    ),

    axis.text = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$m,
      face = "plain",
      color = get_color(WBSTYLE$tickLabel$color)
    ),

    axis.ticks = ggplot2::element_blank(),

    panel.grid.major = ggplot2::element_line(
      color = get_color(WBSTYLE$gridLine$color),
      linewidth = WBCOLORS$gridLine$lineWidth,
      linetype = "42"
    ),

    panel.grid.minor = ggplot2::element_blank(),

    legend.title = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$s,
      color = get_color(WBSTYLE$legendTitle$color)
    ),
    legend.text = ggplot2::element_text(
      family = WBSTYLE$font$fontFamily,
      size = WBSTYLE$chartLarge$fontSize$s,
      color = get_color(WBSTYLE$categoryLabel$color),
      face = "bold"
    ),
    #legend.key.height = ggplot2::unit(2, "null"),
    #legend.key.width = ggplot2::unit(2, "null"),
    legend.position = "bottom"
  )
}
