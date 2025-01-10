# wbplot

A World Bank ggplot2 theme.

## Installation

Install the package with `devtools::install_github("worldbank/wbplot")` or `remotes::install_github("worldbank/wbplot")`.

You might get an authentication error. To overcome this, generate a token on [github.com/settings/personal-access-tokens](https://github.com/settings/personal-access-tokens) and run 

```r
devtools::install_github("worldbank/wbplot", auth_token = "MyPersonalToken")
```

## Using the package

When the package is installed, load it into your R session with `library(wbplot)`. The following functions and variables will become available.

### theme_wb()

`theme_wb()` is the main ggplot theme, which you should add to a ggplot object:

```
ggplot(data, aes(...)) +
  geom_xyz() +
  theme_wb()
```

This will style the plot according to the World Bank Data Visualization Style Guide.

### axes_wb()

Add the `axes_wb()` function to a ggplot object after adding `theme_wb()` to it, to configure some axis options. The available parameters are

- extendYToZero: make the y scale extend to zero. Default is FALSE.
- addZeroLine: add a horizontal line to mark the zero value on the y axis. When added, the y axis will be extended to zero to include the zero line, even if extendYToZero is FALSE. Default is FALSE.
- addExpansion: expand the x and y scale to create some margins around the data. ggplot adds this by default, but here the default is FALSE.
- hideVerticalGrid: hide the vertical grid lines. Should be true for date/time scales. Default is FALSE
- hideHorizontalGrid: hide the horizontal grid lines. Should be true for bar charts and beeswarm plots. Default is FALSE

### Colors

TODO: Sequential, diverging and categorical color palettes

TODO: All WB colors

### add_note_wb.R

TODO

## Saving plots

TODO

