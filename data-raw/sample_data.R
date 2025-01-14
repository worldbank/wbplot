## Add some data from the World Bank API

countries <- wbstats::wb_countries()
life.expectancy <- wbstats::wb_data("SP.DYN.LE00.IN")

usethis::use_data(countries, overwrite = TRUE)
usethis::use_data(life.expectancy, overwrite = TRUE)
