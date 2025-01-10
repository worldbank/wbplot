#' ggplot theme for World Bank visualizations
#'
#' Creates overrides for a ggplot theme, using the World Bank data visualization style
#'
#' @return None
#'
#' @examples
#' theme_wb()
#'
#' @importFrom utils head

# TODO
# [x] Get colors from color names
# [x] Open Sans
# [x] Color scales
# [x] zeroLine
# [x] noteTitle in bold
# [x] Semibold font
# [] Legend styling: https://www.tidyverse.org/blog/2024/02/ggplot2-3-5-0-legends/
# [] Make everything pixel units
# [] All the spacing: line heights, ggsave::scale, ...
# [] Chart type specific styling
# [] Logo?
#
# Questions:
# - number of breaks
# - date formatting
# - scale expansion
#' @export
#'



theme_wb <- function() {

  ggplot2::update_geom_defaults("point", ggplot2::aes(shape = 21, size = 2, color = "white"))

  # Inventory all font files
  font_files <- sysfonts::font_files()
  if(!any(grepl(x = font_files$file, pattern = "^OpenSans"))) {
    weights <- c(400, 600, 700)
    for(weight in weights){
      sysfonts::font_add_google(
        name = "Open Sans",
        family = paste0("Open Sans ", weight),
        regular.wt = weight
      )
    }

  }

  showtext::showtext_auto()

  ggplot2::theme_minimal(base_size = 22) +
  ggplot2::theme(
    panel.background = ggplot2::element_blank(),

    plot.margin = ggplot2::margin(
      t = 10,
      b = 10,
      l = 8,
      r = 8
    ),

    plot.title = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$title$weight)),
      #size = WBSTYLE$chartLarge$fontSize$l,
      color = get_color(WBSTYLE$title$color),
      # This doesn't seem to work
      lineheight = WBSTYLE$title$height/100
    ),
    plot.title.position = "plot",

    plot.subtitle = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$subTitle$weight)),
      #size = WBSTYLE$chartLarge$fontSize$m,
      color = get_color(WBSTYLE$subTitle$color),
      #margin = ggplot2::margin(0,0,15,0)
    ),

    plot.caption = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$note$weight)),
      size = WBSTYLE$chartLarge$fontSize$s,
      color = get_color(WBSTYLE$note$color),
      hjust = 0
    ),
    plot.caption.position = "plot",

    axis.title = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$axisLabel$weight)),
      size = WBSTYLE$chartLarge$fontSize$m,
      color = get_color(WBSTYLE$axisLabel$color)
    ),
    axis.title.y = ggplot2::element_text(
      #margin = ggplot2::margin(0, 5, 0, 0)
    ),
    axis.title.x = ggplot2::element_text(
      #margin = ggplot2::margin(5, 0, 0, 0)
    ),

    axis.text = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$tickLabel$weight)),
      size = WBSTYLE$chartLarge$fontSize$m,
      color = get_color(WBSTYLE$tickLabel$color)
    ),

    axis.ticks = ggplot2::element_blank(),

    panel.grid.major = ggplot2::element_line(
      color = get_color(WBSTYLE$gridLine$color),
      linewidth = WBCOLORS$gridLine$lineWidth/2,
      linetype = "42"
    ),

    panel.grid.minor = ggplot2::element_blank(),

    legend.title = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$legendTitle$weight)),
      size = WBSTYLE$chartLarge$fontSize$s,
      color = get_color(WBSTYLE$legendTitle$color)
    ),
    legend.text = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$categoryLabel$weight)),
      size = WBSTYLE$chartLarge$fontSize$s,
      color = get_color(WBSTYLE$categoryLabel$color),
    ),
    #legend.key.height = ggplot2::unit(2, "null"),
    #legend.key.width = ggplot2::unit(2, "null"),
    legend.position = "bottom"
  )
}

#' World Bank colors
#'
#' @format A named character vector of all World Bank colors
"WBCOLORS"

#' World Bank color palettes
#'
#' @format A named list with the sequential, diverging and categorical color palettes, derived from data-raw/wb-colors.json file
"WBPALETTES"

#' World Bank data visualization style
#'
#' @format A nested list with the World Bank visualization styling, derived from ingesting data-raw/wb-style.json file
"WBSTYLE"
