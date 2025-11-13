.onLoad <- function(libname, pkgname){
  # Add the regular, semibold and bold Open Sans font families
  # They become available as "Open Sans 400", "Open Sans 600" and "Open Sans 700"
    weights <- c(400, 600, 700)
    for(weight in weights){
      sysfonts::font_add_google(
        name = "Open Sans",
        family = paste0("Open Sans ", weight),
        regular.wt = weight
      )
  }
  showtext::showtext_opts(dpi = 300)
  showtext::showtext_auto()
}

.onAttach <- function(libname, pkgname) {
  # to show a startup message
  packageStartupMessage("Attaching package 'wbplot'")
}

.onDetach <- function(libpath){
  ggplot2::reset_geom_defaults()
}
