#' Style axes for bar charts, based on the World Bank data visualization style guide
#'
#' Add this function to a ggplot2 object to style the axes of a horizontal bar chart
#'
#' @param xExpansion Number to exand the right side of the x scale, to give room for data labels
#'
#' @return None
#'
#' @examples
#' axes_barchart_wb()

#' @export
axes_barchart_wb <- function(xExpansion = 0) {

  makeUpperCase <- function(lowcase){
    return(toupper(lowcase))
  }

  scaleSettings <- list(
    ggplot2::scale_x_continuous(
      # Should the number of ticks be part of the style?
      breaks = scales::breaks_pretty(5),
      position = 'top',
      expand = ggplot2::expansion(add = c(0,xExpansion))
    ),
    ggplot2::scale_y_discrete(
      labels = makeUpperCase,
    ),
    ggplot2::coord_cartesian(
      #expand = FALSE,
      clip = 'off'
    ),
    ggplot2::theme(
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_blank()
    )
  )

  return(scaleSettings)
}
