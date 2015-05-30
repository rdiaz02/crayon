
#' Switch on or off a style
#'
#' Make a style active. The text printed to the screen from now
#' on will use this style.
#'
#' @details
#' This function is very rarely needed, e.g. for colored user
#' input. For other reasons, just call the style as a function on
#' the string.
#'
#' @export
#' @method start crayon
#' @examples
#' ## The input is red (if color is supported)
#' get_name <- function() {
#'   cat("Enter your name:", start(red))
#'   input <- readline()
#'   cat(finish(red))
#'   input
#' }
#' name <- get_name()
#' name

start.crayon <- function(x) {
  if (has_color()) {
    paste(
      vapply(attr(x, "_styles"), "[[", "", "open"),
      collapse = ""
    )
  } else {
    ""
  }
}

#' @export

start <- function(...)
  UseMethod("start")

#' @export

finish <- function(...)
  UseMethod("finish")

#' @rdname start.crayon
#' @export
#' @method finish crayon

finish.crayon <- function(x) {
  if (has_color()) {
    paste(
      rev(vapply(attr(x, "_styles"), "[[", "", "close")),
      collapse = ""
    )
  } else {
    ""
  }
}
