warp <- local({
  timing <- proc.time()[3]
  function(x) {
    soundtime <- proc.time()[3] - timing
    cl <- match.call()
    counter <- gregexpr("%W>%", cl[[2]], fixed = TRUE)[[1]]
    if (counter[1] == -1) count <- 1 else count <- length(counter) + 1
    if (count == 1 || soundtime > 0.6) {
      ping(system.file("sound", "smb_pipe.wav", package="greenpipeR"))
      timing <<- proc.time()[3]
    }
  }
})

#' Pipe/warp an object downwards into a function call/expression/dungeon level.
#'
#' Also known as the "warp" operator, \code{\%W>\%} does exactly the same thing as \code{\link{\%>\%}}:
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
#' 
#' seq(1,10,0.1) %W>% sin %T>% print %T>% plot(type = 'l') %T>% l(x -> Sys.sleep(1)) %W>%
#' sin %T>% print %T>% plot(type = 'l') %T>% l(x -> Sys.sleep(1)) %W>% 
#' sin %T>% print %T>% plot(type = 'l')
#' 
#' \dontrun{
#' 
#' library(dplyr)
#' library(Lahman)
#' Batting %W>%
#' group_by(playerID) %T>% print %T>% l(x -> Sys.sleep(2)) %W>%
#' summarise(total = sum(G)) %T>% print %T>% l(x -> Sys.sleep(2)) %W>%
#' arrange(desc(total)) 
#'
#' }
`%W>%` <- pipe_with(warp)
