#' Style axes based on the World Bank data visualization style guide
#'
#' Add this function to a ggplot2 object to
#' - extend the y limits to include zero
#' - remove the expansion on the x and y scales
#' - add a horizontal line at y = 0
#'
#' @param extendYToZero Boolean to extend the y limits to include zero
#' @param addExpansion Boolean to expand the scales
#' @param addZeroLine Boolean to add a zero line for the Y scale. This will also extend the Y scale to zero
#'
#' @return None
#'
#' @examples
#' axes_wb(extendYToZero = TRUE, addExpansion = TRUE, addZeroLine = TRUE)

#' @export
axes_wb <- function(extendYToZero = FALSE, addExpansion = FALSE, addZeroLine = TRUE) {
  scaleSettings <- list(
    ggplot2::scale_x_continuous(
      # Should the number of ticks be part of the style?
      breaks = scales::breaks_pretty(5)
    ),
    ggplot2::scale_y_continuous(
      limits = if(extendYToZero == TRUE) c(0, NA) else c(NA, NA),
      breaks = scales::breaks_pretty(5)
    ),
    ggplot2::coord_cartesian(
      expand = addExpansion,
      clip = 'off'
    ),
    ggplot2::geom_hline(
      yintercept = 0,
      color = get_color(WBSTYLE$zeroLine$color),
      linewidth = WBSTYLE$zeroLine$lineWidth)
  )
  if(addZeroLine == FALSE){
    scaleSettings <- head(scaleSettings, -1)
  }
  return(scaleSettings)
}
