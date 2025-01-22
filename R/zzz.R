.onLoad <- function(libname, pkgname){
  # Check if the Open Sans font is installed
  # If not, add the regular, semibold and bold fonts
  # They become available as the "Open Sans 400", "Open Sans 600" and "Open Sans 700" font families
  font_files <- sysfonts::font_files()
  if(!any(grepl(x = font_files$file, pattern = "^OpenSans"))) {
    weights <- c(400, 600, 700)
    for(weight in weights){
      sysfonts::font_add_google(
        name = "Open Sans",
        family = paste0("Open Sans ", weight),
        regular.wt = weight
      )
    }
    packageStartupMessage("Adding 'Open Sans 400', 'Open Sans 600' and 'Open Sans 700' font families")
  }
  showtext::showtext_opts(dpi = 300)
  showtext::showtext_auto()
}

.onAttach <- function(libname, pkgname) {
  # to show a startup message
  packageStartupMessage("Attaching package 'wbplot'")
}
