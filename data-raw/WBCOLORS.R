## code to prepare `WBCOLORS` dataset goes here

WBCOLORS <- jsonlite::read_json("data-raw/wb-colors.json")

usethis::use_data(WBCOLORS, overwrite = TRUE)
