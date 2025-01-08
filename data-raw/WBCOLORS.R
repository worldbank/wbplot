## code to prepare `WBCOLORS` dataset goes here

WBCOLORS <- jsonlite::read_json("data-raw/wb-colors.json", simplifyVector = TRUE)

usethis::use_data(WBCOLORS, overwrite = TRUE)

seqPalettes <- c("seq", "seqRev", "seqB", "seqY", "seqP")
divPalettes <- c("divPosNeg", "divLR")

seqPalettesValues <- vector(mode = "list", length = 5)
names(seqPalettesValues) <- seqPalettes
for (pal in seqPalettes){
  seqPalettesValues[[pal]] <- colorRampPalette(
    space = 'Lab',
    c(
      WBCOLORS[[paste0(pal, '1')]],
      WBCOLORS[[paste0(pal, '2')]],
      WBCOLORS[[paste0(pal, '3')]],
      WBCOLORS[[paste0(pal, '4')]],
      WBCOLORS[[paste0(pal, '5')]])
    )(256)
}

divPalettesValues <- vector(mode = "list", length = 2)
names(divPalettesValues) <- divPalettes
divPalettesValues[['divPosNeg']] <- colorRampPalette(
  space = 'Lab',
  c(
    WBCOLORS$divPos3,
    WBCOLORS$divPos2,
    WBCOLORS$divPos1,
    WBCOLORS$divMid,
    WBCOLORS$divNeg1,
    WBCOLORS$divNeg2,
    WBCOLORS$divNeg3)
  )(256)
divPalettesValues[['divLR']] <- colorRampPalette(
  space = 'Lab',
  c(
    WBCOLORS$div2L3,
    WBCOLORS$div2L2,
    WBCOLORS$div2L1,
    WBCOLORS$div2Mid,
    WBCOLORS$div2R1,
    WBCOLORS$div2R2,
    WBCOLORS$div2R3)
  )(256)

WBPALETTES <- c(seqPalettesValues, divPalettesValues)
usethis::use_data(WBPALETTES, overwrite = TRUE)
