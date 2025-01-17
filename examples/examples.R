library(wbstats)
library(dplyr)
library(wbplot)
library(ggplot2)

countries <- wb_countries()
gdp <- wb_data("NY.GDP.PCAP.PP.CD")
gdp.22 <- filter(gdp, date == 2022) %>%
  select(iso3c, NY.GDP.PCAP.PP.CD)
life <- wb_data("SP.DYN.LE00.IN")
life.22 <- filter(life, date == 2022) %>%
  select(iso3c, SP.DYN.LE00.IN)

data <- left_join(gdp.22, life.22, by = "iso3c") %>%
  left_join(countries, by = "iso3c")

p <- ggplot(data, aes(NY.GDP.PCAP.PP.CD, SP.DYN.LE00.IN, color = region_iso3c)) +
  geom_point() +
  scale_x_continuous() +
  labs(
    title = "Richer countries have higher life expectancy",
    subtitle = "GDP (per capita $ PPP) vs total life expectancy at birth (years)",
    x = "GDP per capita",
    y = "Life expectancy"
  )
p

ggsave_wb(filename = "examples/Examples - ggplot-scatter.png", height = 960)

p.wb <- p + theme_wb(chartType = "scatter") +
  aes(color = NULL, fill = tolower(region_iso3c)) +
  scale_fill_wb_d(palette = "region", name = "Region")
p.wb

ggsave_wb(filename = "examples/Examples - wb-scatter.png", height = 960)

