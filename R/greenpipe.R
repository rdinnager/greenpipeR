#' Arm a value with a function which fires when evaluated.
#'
#' @param expr an expression
#' @param fun a function of one argument.
#'
#' @return an expression which when evaluated returns the result of expr,
#' after evaluating fun(expr).
#' @export
#' @details Thanks very much to Stefan Milton Bache for providing the code to replace the 
#' now defunct \code{pipe_with} function which uses \code{arm}, which is necessary for \code{\%W>\%} 
#' to function. Retrieved from this gist: \url{https://gist.github.com/smbache/86fe703fa46e39df33ea}
arm <- function(expr, fun, count)
{
  substitute({
    expr %T>% fun
  },
  list(
    fun = substitute(call("fun", count)),
    expr = substitute(expr)
  )
  )
}

pipe_with <- function(expr) function(lhs, rhs)
{
  parent <- parent.frame()
  print(substitute(lhs))
  counter <- gregexpr("%W>%", substitute(lhs), fixed = TRUE)[[1]]
  if (counter[1] == -1) count <- 1 else count <- length(counter) + 1
  print(count)
  lhs <- eval(call("arm", substitute(lhs), expr, count), parent, parent)
  eval(call("%>%", lhs, rhs), parent, parent)
}

warp <- local({
  timing <- proc.time()[3]
  function(x, count) {
    soundtime <- proc.time()[3] - timing
    cl <- match.call()
    #counter <- gregexpr("%W>%", cl[[2]], fixed = TRUE)[[1]]
    #if (counter[1] == -1) count <- 1 else count <- length(counter) + 1
    print(cl)
    print(soundtime)
    if (count == 1 || soundtime > 0.6) {
      beep(system.file("sound", "smb_pipe.wav", package="greenpipeR"))
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
#' @import magrittr beepr
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
