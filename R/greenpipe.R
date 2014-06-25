
warp <- function(x) {
  ping("inst/sound/smb_pipe.wav") 
}

#' Pipe/warp an object downwards into a function call/expression/dungeon level.
#'
#' The \code{\%W>\%} operator does exactly the same thing as \code{\link{\%>\%}}:
#' it pipes the left-hand side into an expression on the right-hand side. But with
#' a bonus: when you use \code{\%W>\%} you hear the sound that --- if you are anything
#' like me --- goes through your head every time you use a pipe, only for real! 
#'
#' @param lhs That which is to be warped
#' @param rhs the function/dungeon level to be warped into
#' @rdname warp
#' @import magrittr pingr
#' @export
#' @examples
#' \dontrun{
#' library(dplyr)
#' library(Lahman)
#'
#' Batting %W>%
#' group_by(playerID) %W>%
#' summarise(total = sum(G)) %W>%
#' arrange(desc(total)) %W>%
#' head(5)
#'
#' }
`%W>%` <- pipe_with(warp)
