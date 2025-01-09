#' Add a note or source
#'
#' Add a note or source to the bottom of a plot
#'
#' @param noteTitle The title of the note, usually "Note:" or "Source:"
#' @param note The content of the note
#'
#' @return None
#'
#' @examples
#' add_note_wb(noteTitle = "Source:", note = "World Bank")

#' @export
add_note_wb <- function(noteTitle = "", note = "") {
  return(list(
    ggplot2::labs(
      caption = bquote(bold(.(noteTitle))~.(note))
    )
  ))
}
