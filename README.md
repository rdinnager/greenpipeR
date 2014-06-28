![a green pipe](A_green_pipe.gif)

__version 0.2__ (currently broken with new version of `magrittr`. Should be fixed soon.)

This package introduces the new pipe operator `%W>%` &mdash; also known as the "warp" operator &mdash; which is inspired by a certain famous _plumber_. It does exactly the same thing as the `%>%` operator from [`magrittr`](https://github.com/smbache/magrittr): it pipes the left-hand side into an expression on the right-hand side, with one very small addition. When you use `%W>%` it recreates what goes through my head (and probably yours if you are from a certain generation) everytime I use a pipe in R. So if you are a `magrittr` _plumber_, and you can't get enough of piping/warping objects into functions/dungeon levels, then you may enjoy this package.

It requires [`magrittr`](https://github.com/smbache/magrittr) (the latest version from github) and [`beepr`](https://github.com/rasmusab/beepr) (now on [CRAN!](http://cran.r-project.org/web/packages/beepr/index.html)). You can install `greenpipeR` by running the following in R:

```
## install magrittr dependency
devtools::install_github("smbache/magrittr")
## install greenpipeR
devtools::install_github("rdinnager/greenpipeR")
```

__Warning::__ If you have easily annoyed office mates, then use this package with caution. Also, in case you were wondering, this package is not _Useful_, only fun. Not suitable for those with high maturity level. Personally I now always use `%W>%` in place of `%>%`, but your mileage may vary.

If you haven't figured out by now what `%W>%` does, make sure the sound on your computer is on (but not too loud!) before you use it. :)

<<<<<<< HEAD
__Note:__ This package is currently _broken_ in you install the latest version of `magritte` from github. I will provide a fix soon! Sorry for any inconvenience.
=======
__Note:__ `greenpipeR` now works with the newest version of magrittr that is on github, but sounds will overlap if `%W>%` operators are executed in quick succession. Thanks very much to Stefan Milton Bache, ([\@smbache](https://github.com/smbache)) who provided the key code to get it working again.
>>>>>>> magrittr-dev

###Examples

Here's a few examples to get you started:

```
library(greenpipeR)

seq(1,10,0.1) %W>% sin %T>% print %T>% plot(type = 'l') %T>% l(x -> Sys.sleep(1)) %W>%
sin %T>% print %T>% plot(type = 'l') %T>% l(x -> Sys.sleep(1)) %W>% 
sin %T>% print %T>% plot(type = 'l')
```

```
library(dplyr)
library(Lahman)

Batting %W>%
group_by(playerID) %T>% print %T>% l(x -> Sys.sleep(2)) %W>%
summarise(total = sum(G)) %T>% print %T>% l(x -> Sys.sleep(2)) %W>%
arrange(desc(total)) 
```

###Acknowledgements

This package brings me delight and was created with only two lines of code, thanks entirely to the awesome work of the developers of [`magrittr`](https://github.com/smbache/magrittr): [Stefan Milton Bache](https://github.com/smbache) and [Hadley Wickham](https://github.com/hadley), and [`beepr`](https://github.com/rasmusab/beepr): [Rasmus Bååth](https://github.com/rasmusab). Thanks very much to them!
