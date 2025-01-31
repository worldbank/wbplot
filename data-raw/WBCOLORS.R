# Code to prepare `WBCOLORS` dataset goes here

## All the colors, as a named list
WBCOLORS <- jsonlite::read_json("data-raw/wb-colors.json", simplifyVector = TRUE)

usethis::use_data(WBCOLORS, overwrite = TRUE)

## Sequential and diverging palettes
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

## Discrete palettes
discretePalettesValues <- vector(mode = "list", length = 9)
names(discretePalettesValues) <- c('default', 'defaultText', 'region', 'regionText', 'income', 'gender', 'urbanisation', 'age', 'binary')

defaultPalette <- c(
  WBCOLORS$cat1,
  WBCOLORS$cat2,
  WBCOLORS$cat3,
  WBCOLORS$cat4,
  WBCOLORS$cat5,
  WBCOLORS$cat6,
  WBCOLORS$cat7,
  WBCOLORS$cat8,
  WBCOLORS$cat9
  )
discretePalettesValues[['default']] <- defaultPalette

defaultTextPalette <- c(
  WBCOLORS$cat1Text,
  WBCOLORS$cat2Text,
  WBCOLORS$cat3Text,
  WBCOLORS$cat4Text,
  WBCOLORS$cat5Text,
  WBCOLORS$cat6Text,
  WBCOLORS$cat7Text,
  WBCOLORS$cat8Text,
  WBCOLORS$cat9Text
)
discretePalettesValues[['defaultText']] <- defaultTextPalette

regionPalette <- c(
  WBCOLORS$wld,
  WBCOLORS$nac,
  WBCOLORS$lcn,
  WBCOLORS$sas,
  WBCOLORS$mea,
  WBCOLORS$ecs,
  WBCOLORS$eas,
  WBCOLORS$ssf,
  WBCOLORS$afe,
  WBCOLORS$afw,
  WBCOLORS$wld#,
  # WBCOLORS$nac,
  # WBCOLORS$lcn,
  # WBCOLORS$sas,
  # WBCOLORS$mea,
  # WBCOLORS$ecs,
  # WBCOLORS$eas,
  # WBCOLORS$ssf,
  # WBCOLORS$afe,
  # WBCOLORS$afw,
  # WBCOLORS$wld,
  # WBCOLORS$nac,
  # WBCOLORS$lcn,
  # WBCOLORS$sas,
  # WBCOLORS$mea,
  # WBCOLORS$ecs,
  # WBCOLORS$eas,
  # WBCOLORS$ssf,
  # WBCOLORS$afe,
  # WBCOLORS$afw
)
names(regionPalette) <- c(
  "wld",
  "nac",
  "lcn",
  "sas",
  "mea",
  "ecs",
  "eas",
  "ssf",
  "afe",
  "afw"#,
  # "NAC",
  # "LCN",
  # "SAS",
  # "MEA",
  # "ECS",
  # "EAS",
  # "SSF",
  # "AFE",
  # "AFW",
  # "World",
  # "North America",
  # "Latin America & Caribbean",
  # "South Asia",
  # "Middle East & North Africa",
  # "Europe & Central Asia",
  # "East Asia & Pacific",
  # "Sub-Saharan Africa",
  # "Africa Eastern and Southern",
  # "Africa Western and Central"
)
discretePalettesValues[['region']] <- regionPalette

regionTextPalette <- c(
  WBCOLORS$wldText,
  WBCOLORS$nacText,
  WBCOLORS$lcnText,
  WBCOLORS$sasText,
  WBCOLORS$meaText,
  WBCOLORS$ecsText,
  WBCOLORS$easText,
  WBCOLORS$ssfText,
  WBCOLORS$afeText,
  WBCOLORS$afwText
)
names(regionTextPalette) <- c(
  "wld",
  "nac",
  "lcn",
  "sas",
  "mea",
  "ecs",
  "eas",
  "ssf",
  "afe",
  "afw"
)
discretePalettesValues[['regionText']] <- regionTextPalette

incomePalette <- c(
  WBCOLORS$hic,
  WBCOLORS$umc,
  WBCOLORS$lmc,
  WBCOLORS$lic
)
names(incomePalette) <- c(
  "hic",
  "umc",
  "lmc",
  "lic"
)
discretePalettesValues[['income']] <- incomePalette

genderPalette <- c(
  WBCOLORS$male,
  WBCOLORS$female,
  WBCOLORS$diverse
)
names(genderPalette) <- c(
  "male",
  "female",
  "diverse"
)
discretePalettesValues[['gender']] <- genderPalette

urbanisationPalette <- c(
  WBCOLORS$rural,
  WBCOLORS$urban
)
names(urbanisationPalette) <- c(
  "rural",
  "urban"
)
discretePalettesValues[['urbanisation']] <- urbanisationPalette

agePalette <- c(
  WBCOLORS$youngestAge,
  WBCOLORS$youngerAge,
  WBCOLORS$middleAge,
  WBCOLORS$olderAge,
  WBCOLORS$oldestAge
)
names(agePalette) <- c(
  "youngestAge",
  "youngerAge",
  "middleAge",
  "olderAge",
  "oldestAge"
)
discretePalettesValues[['age']] <- agePalette

binaryPalette <- c(
  WBCOLORS$yes,
  WBCOLORS$no
)
names(binaryPalette) <- c(
  "yes",
  "no"
)
discretePalettesValues[['binary']] <- binaryPalette

WBPALETTES <- c(seqPalettesValues, divPalettesValues, discretePalettesValues)
usethis::use_data(WBPALETTES, overwrite = TRUE)
