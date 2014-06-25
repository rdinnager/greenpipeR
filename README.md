greenpipeR
===========

This package introduces the new pipe operator `%W>%`, which is also known as the "warp" operator, which is inspired by a certain famous _plumber_. It does exactly the same thing as the `%>%` operator from `magrittr`, upon which this package depends, with one very small addition. When you use `%W>%` it recreates what goes through my head (and probably yours if you are from a certain generation) everytime I use a pipe in R. So if you are a `magrittr` _plumber_, and you can't get enough of piping/warping objects into functions/dungeon levels, then you may enjoy this package.

It requires [`magrittr`](https://github.com/smbache/magrittr) and [`pingr`](https://github.com/rasmusab/pingr) (which is currently not on CRAN, but can be grabbed from [github](https://github.com/rasmusab/pingr)). You can install `greenpipeR` by running the following in R:

```
## install pingr dependency
devtools::install_github("rasmusab/pingr")
## install greenpipeR
devtools::install_github("rdinnager/greenpipeR")
```

__Warning::__ If you have easily annoyed office mates, then use this package with caution. Also, in case you were wondering, this package is not _Useful_, only fun. Not suitable for those with high maturity level. Personally I now always use `%W>%` in place of `%>%`, but your mileage may vary.

###Acknowledgements

This package brings me delight and was created with only two lines of code, thanks entirely to the awesome work of the developers of [`magrittr`](https://github.com/smbache/magrittr) and [`pingr`](https://github.com/rasmusab/pingr). Thanks very much to them!
