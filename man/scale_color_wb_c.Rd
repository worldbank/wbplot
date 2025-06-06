% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale_color_wb_c.R
\name{scale_color_wb_c}
\alias{scale_color_wb_c}
\title{Continuous colour scales with WB palettes}
\usage{
scale_color_wb_c(
  ...,
  palette = "seq",
  direction = 1,
  na.value = WBCOLORS[["noData"]]
)
}
\arguments{
\item{...}{Other arguments passed to scale_colour_continuous()}

\item{palette}{The WB color palette to use. One of 'seq', 'seqRev', 'seqB', 'seqY', 'seqP', 'divPosNeg', or 'divLR'}

\item{direction}{Sets the order of colors in the scale. 1 is the default, if -1, the order of colors is reversed}

\item{na.value}{Color to use for NA values}
}
\value{
None
}
\description{
Continuous colour scales with WB palettes
}
\examples{
scale_color_wb_c(palette = "seq")

}
