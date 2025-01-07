## code to prepare `WBSTYLE` dataset goes here

WBSTYLE <- jsonlite::read_json("data-raw/wb-style.json")

usethis::use_data(WBSTYLE, overwrite = TRUE)
