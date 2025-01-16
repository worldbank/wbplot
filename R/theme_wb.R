#' ggplot theme for World Bank visualizations
#'
#' Creates overrides for a ggplot theme, using the World Bank data visualization style
#'
#' @param chartType Activates chart specific styling. Should be one of "line", "bar", "beeswarm" or "scatter"
#' @param xExpansion Expand the x axis to make room for data labels on bar and beeswarm charts
#' @param addXZeroLine Boolean for adding a line for zero on continuous X axes
#' @param addYZeroLine Boolean for adding a line for zero on continous Y axes
#' @param addYAxisTitle Boolean for overruling the hiding of the Y axis title of line charts
#' @param addXAxisTitle Boolean for overruling the hiding of the Y axis title of bar and beeswarm charts
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
# [x] Legend styling: https://www.tidyverse.org/blog/2024/02/ggplot2-3-5-0-legends/
# [x] Chart type specific styling
# [] Make everything pixel units => won't fix: use ggplot's defaults
# [] All the spacing: line heights, ggsave::scale, ... => won't fix: use ggplot's defaults
# [] geom specific, non-aesthetic defaults (bar width, lineend) => very hard to change, should be set manually
# [] Adding a logo? => Not for now
#
#' @export
#'

theme_wb <- function(
    chartType = "",
    xExpansion = 0,
    addXZeroLine = FALSE,
    addYZeroLine = FALSE,
    addYAxisTitle = FALSE,
    addXAxisTitle = FALSE
    ) {

  # Warnings for cases where zero lines can't be added
  if(addXZeroLine & chartType == "bar") warning("Zero lines can't be added to bar charts")
  if(addYZeroLine & chartType == "bar") warning("Zero lines can't be added to bar charts")
  if(addYZeroLine & chartType == "beeswarm") warning("Zero lines can't be added discrete scales")
  if(addXZeroLine & chartType == "line") warning("Zero lines can't be added to date/time scales")

  # Makes text uppercase, used for the labels on categorical axes and for categorical legend labesl
  makeUpperCase <- function(lowcase){
    return(toupper(lowcase))
  }

  # Check if the Open Sans font is installed
  # If not, add the regular, semibold and bold fonts
  # They become available as the "Open Sans 400", "Open Sans 600" and "Open Sans 700" font families
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
  showtext::showtext_opts(dpi = 300)
  showtext::showtext_auto()

  # Change default color palettes
  options(ggplot2.discrete.colour = WBPALETTES$default)
  options(ggplot2.discrete.fill = WBPALETTES$default)
  options(ggplot2.continuous.colour = WBPALETTES$seq)
  options(ggplot2.continuous.fill = WBPALETTES$seq)

  # Change default geom aesthetics
  ggplot2::update_geom_defaults("point", ggplot2::aes(shape = 21, size = 2, color = "white"))
  ggplot2::update_geom_defaults("bar", ggplot2::aes(fill = WBCOLORS$cat1))
  ggplot2::update_geom_defaults("line", ggplot2::aes(linewidth = 0.8))
  ggplot2::update_geom_defaults("text", ggplot2::aes(
    hjust = 0,
    size = baseSize*0.8/ggplot2::.pt,
    color = WBCOLORS$darkText,
    family = "Open Sans 600")
  )

  baseSize <- 11

  # Zero lines
  xZeroLine <- ggplot2::geom_vline(
    xintercept = 0,
    color = get_color(WBSTYLE$zeroLine$color),
    linewidth = WBSTYLE$zeroLine$lineWidth/3
  )
  yZeroLine <- ggplot2::geom_hline(
    yintercept = 0,
    color = get_color(WBSTYLE$zeroLine$color),
    linewidth = WBSTYLE$zeroLine$lineWidth/3
  )

  theme_custom <- ggplot2::theme_minimal(base_size = baseSize) +
  # General theme settings
  ggplot2::theme(
    panel.background = ggplot2::element_blank(),

    plot.margin = ggplot2::margin(
      t = 10,
      b = 10,
      l = 8,
      r = 8
    ),

    # Plot title styling
    plot.title = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$title$weight)),
      color = get_color(WBSTYLE$title$color)
    ),
    # Aligns the title to the plot, instead of to the plot panel
    plot.title.position = "plot",

    # Plot subtitle
    plot.subtitle = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$subTitle$weight)),
      color = get_color(WBSTYLE$subTitle$color)
    ),

    # Plot caption styling. The caption is used for the chart note
    plot.caption = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$note$weight)),
      color = get_color(WBSTYLE$note$color),
      hjust = 0
    ),
    plot.caption.position = "plot",

    # Axis title styling
    axis.title = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$axisLabel$weight)),
      color = get_color(WBSTYLE$axisLabel$color)
    ),

    # Axis labels styling
    axis.text = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$tickLabel$weight)),
      color = get_color(WBSTYLE$tickLabel$color)
    ),

    # Axis ticks are removed by default
    axis.ticks = ggplot2::element_blank(),

    # Plot grid styling
    panel.grid.major = ggplot2::element_line(
      color = get_color(WBSTYLE$gridLine$color),
      linewidth = WBCOLORS$gridLine$lineWidth/2,
      linetype = "42"
    ),
    panel.grid.minor = ggplot2::element_blank(),

    # Legend styling
    legend.location = "plot",
    legend.position = "bottom",
    legend.justification.bottom = "left",
    legend.margin = ggplot2::margin(0,0,4,0),
    legend.title = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$legendTitle$weight)),
      color = get_color(WBSTYLE$legendTitle$color),
      hjust = 0,
      margin = ggplot2::margin(0,0,0,0)
    ),
    legend.title.position = "top",
    legend.text = ggplot2::element_text(
      family = paste(WBSTYLE$font$fontFamily, get_font_weight(WBSTYLE$categoryLabel$weight)),
      color = get_color(WBSTYLE$categoryLabel$color),
      margin = ggplot2::margin(0, 0, 0, 0)
    ),
    legend.key.spacing.y = ggplot2::unit(0.7, "lines")
  )

  # Bar and beeswarm chart styling
  if(chartType == "bar" | chartType == "beeswarm"){
    theme_custom <- theme_custom + ggplot2::theme(

      # Continuous axis styling
      axis.ticks.x = ggplot2::element_line(color = WBCOLORS$lighter),
      axis.ticks.length.x = ggplot2::unit(0.3, "lines"),
      axis.text.x = ggplot2::element_text(
        color = WBCOLORS$lightText,
      ),
      axis.title.x = if(addXAxisTitle == FALSE) ggplot2::element_blank() else ggplot2::element_text(),

      # Discrete axis styling
      axis.ticks.y = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_text(
        color = WBCOLORS$darkText,
        family = "Open Sans 600",
        hjust = 0
      ),
      axis.title.y = ggplot2::element_blank()
    )
    theme_custom <- list(
      theme_custom,

      # Continuous scale settings
      ggplot2::scale_x_continuous(
        breaks = scales::breaks_pretty(5),
        position = if(chartType == "bar") 'top' else 'bottom',
        expand = ggplot2::expansion(add = c(0,xExpansion))
      ),
      ggplot2::scale_y_discrete(
        labels = makeUpperCase,
      ),

      # Discrete scale settings
      ggplot2::coord_cartesian(
        clip = 'off'
      ),

      # Remove the grids when needed
      ggplot2::theme(
        panel.grid.major.x = if(chartType == "bar") ggplot2::element_blank() else ggplot2::element_line(),
        panel.grid.major.y = ggplot2::element_blank()
      )
    )

    if(chartType == "beeswarm" & addXZeroLine){
      theme_custom <- list(
        theme_custom,
        xZeroLine
      )
    }
  }

  if(chartType == "line"){
    theme_custom <- theme_custom + ggplot2::theme(

      # Remove axis titles when needed
      axis.title.x = ggplot2::element_blank(),
      axis.title.y = if(addYAxisTitle == FALSE) ggplot2::element_blank() else ggplot2::element_text(),

      # Remove vertical grid
      panel.grid.major.x = ggplot2::element_blank()
    )
    theme_custom <- list(
      theme_custom,
      ggplot2::coord_cartesian(
        expand = FALSE,
        clip = 'off'
      )
    )
    if(addYZeroLine){
      theme_custom <- list(
        theme_custom,
        yZeroLine
      )
    }
  }

  if(chartType == "scatter"){
    if(addXZeroLine){
      theme_custom <- list(
        theme_custom,
        xZeroLine
      )
    }
    if(addYZeroLine){
      theme_custom <- list(
        theme_custom,
        yZeroLine
      )
    }
  }

  theme_custom

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

#' Country data
#'
#' @format Data frame of available countries and regions from the World Bank API, as returned by wbstats::wbcountries
#' @source https://api.worldbank.org/v2/country
"countries"

#' Life expactancy data
#'
#' @format Data frame of time series data for the SP.DYN.LE00.IN indicator for all countries and regions, as returned by wbstats::wb_data("SP.DYN.LE00.IN")
#' @source https://data.worldbank.org/indicator/SP.DYN.LE00.IN
"life.expectancy"
