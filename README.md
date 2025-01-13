# wbplot

The World Bank ggplot2 theme.

## Installation

Install the package with `devtools::install_github("worldbank/wbplot")` or `remotes::install_github("worldbank/wbplot")`.

You might run into an authentication error. To overcome this, generate a token on [github.com/settings/personal-access-tokens](https://github.com/settings/personal-access-tokens) and run 

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

- `extendYToZero`: make the y scale extend to zero. Default is FALSE.
- `addZeroLine`: add a horizontal line to mark the zero value on the y axis. When added, the y axis will be extended to zero to include the zero line, even if `extendYToZero` is FALSE. Default is FALSE.
- `addExpansion`: expand the x and y scale to create some margins around the data. ggplot adds this by default, but here the default is FALSE.
- `hideVerticalGrid`: hide the vertical grid lines. Should be true for date/time scales. Default is FALSE.
- `hideHorizontalGrid`: hide the horizontal grid lines. Should be true for bar charts and beeswarm plots. Default is FALSE.

```
ggplot(data, aes(...)) +
  geom_xyz() +
  theme_wb() +
  axis_wb(extendYToZero = TRUE, addZeroLine = FALSE, addExpansion = TRUE, hideVerticalGrid = TRUE, hideHorizontalGrid = FALSE)
```

### Colors

#### All colors

All World Bank Data Visualization colors are available through the `WBCOLORS` global variables. Access the colors with `WBCOLORS[['colorName']]` or `WBCOLORS$colorName`. See `WBCOLORS` for all available colors.

#### Color scales

wbplot comes with 4 color scale functions:

- `scale_color_wb_c`and `scale_fill_wb_c`, for mapping continuous variables to the fill and color aesthetics. The `palette` parameter determines the color palette to use, and should be one of 'seq', 'seqRev', 'seqB', 'seqY', 'seqP' (these are the sequential color palettes), or 'divPosNeg' or 'divLR' (these are the diverging color palettes). The direction of the palette can be reversed by setting `direction = -1`. NA values will be colored in with `WBCOLORS$noData`.
- `scale_color_wb_d`and `scale_fill_wb_d`, for mapping continuous variables to the fill and color aesthetics. When the `palette` parameter matches the mapped level variable, the levels will be automatically matched to their corresponding colors. The available palettes and their levels are
    - `default`: the default palette, with 9 distinct colors
    - `defaultText`: darker colors for the `default` palette, to be used for text
    - `region`: colors for regions. Matches the levels "wld", "nac", "lcn", "sas", "mea", "ecs", "eas", "ssf", "afe" and "afw"
    - `regionText`: darker colors for the `regions` palette, to be used for text. Matches the levels "nacText", "ssfText", "afeText", "meaText", "sasText", "easText", "wldText", "lcnText", "ecsText" and"afwText"
    - `income`: colors for income classes. Matches the levels "hic", "umic", "lmic" and"lic".
    - `gender`: colors for gender. Matches the levels "male", "female" and "diverse"
    - `urbanisation`: colors for urbanisation. Matches the levels "urban" and "rural".
    - `age`: colors for age classes. Matches the levels "youngestAge", "youngerAge", "middleAge", "olderAge" and "oldestAge"
    - `binary`: colors for binary variables. Matches the levels "yes" and "no"

```    
ggplot(data, aes(..., fill = region_iso3c)) +
  geom_xyz() +
  theme_wb() +
  color_fill_wb_c(palette = "region")
```

#### add_note_wb()

To add a note or source reference at the bottom of your plot, add the `add_note_wb()` to your ggplot. Use the `noteTitle` for the title of the note (which will be displayed in bold), and the `note` parameter for the body of the note.

```
ggplot(data, aes(...)) +
  geom_xyz() +
  theme_wb() +
  add_note_wb(noteTitle = "Source:", note = "World Bank")
```

## Bar charts

For (horizontal) bar charts, add `axes_barchart_wb()` to your plot, and set `barChart` to TRUE in `theme_wb()`.

`axes_barchart_wb()` will move the x axis to the top, hide both the horizontal and the vertical grids, and make the categorical labels uppercase. If the data labels for your bars are cut off, you can use the `xExpansion` parameter to create more space on the right side of the plot.

`theme_wb(barChart = TRUE)` will style the axis ticks and axis labels correctly.

```
ggplot(countries, aes(x = gdp, y = country)) +
  geom_bar(stat="identity", width = 0.66) +
  geom_text(aes(label = round(latitude, gdp)), hjust = 0, nudge_x = 0.5) +
  labs(
    title = "The biggest economies",
    subtitle = "Total GDP, 2024, $") +
  add_note_wb(noteTitle = "Source:", note = "World Bank") +
  theme_wb(barChart = TRUE) +
  axes_barchart_wb()
```

## Saving plots

TODO

