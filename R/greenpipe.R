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
arm <- function(expr, fun)
{
  substitute({
    expr %T>% fun
  },
  list(
    fun = substitute(fun),
    expr = substitute(expr)
  )
  )
}

pipe_with <- function(expr) function(lhs, rhs)
{
  parent <- parent.frame()
  lhs <- eval(call("arm", substitute(lhs), expr), parent, parent)
  eval(call("%>%", lhs, substitute(rhs)), parent, parent)
}

warp <- function(x) {
  beep(system.file("sound", "smb_pipe.wav", package="greenpipeR"))
}

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
