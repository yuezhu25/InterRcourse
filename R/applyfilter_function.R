apply_filter_bitmap <- function(bitmap, filter_fun, ...) {
  stopifnot(length(dim(bitmap)) == 3)
  stopifnot(dim(bitmap)[1] == 3)

  out <- bitmap
  width  <- dim(bitmap)[2]
  height <- dim(bitmap)[3]

  for (x in seq_len(width)) {
    for (y in seq_len(height)) {
      out[, x, y] <- filter_fun(bitmap[, x, y], ...)
    }
  }

  out
}
