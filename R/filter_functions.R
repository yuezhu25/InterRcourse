#' Convert an RGB pixel to grayscale
#'
#' This function takes a raw RGB vector (length 3) and converts it to
#' a grayscale pixel using the standard luminance formula:
#' 0.299 * R + 0.587 * G + 0.114 * B.
#'
#' @param rgb_vec A raw vector of length 3 representing R, G, and B values.
#' @return A raw vector of length 3 where all values are equal (grayscale).
#' @examples
#' rgb_to_greyscale(as.raw(c(50, 120, 10)))
#'
#' @export
rgb_to_greyscale <- function(rgb_vec) {
  R <- as.integer(rgb_vec[1])
  G <- as.integer(rgb_vec[2])
  B <- as.integer(rgb_vec[3])

  grey <- as.integer(R * 0.299 + G * 0.587 + B * 0.114)

  raw(c(grey, grey, grey))
}

#' Apply a red cutoff filter to an RGB pixel
#'
#' This function first converts a pixel to grayscale. If the grayscale value
#' is below the cutoff (default = 127), it returns a pure red pixel.
#' Otherwise, it returns black.
#'
#' @param rgb_vec A raw RGB pixel.
#' @param cutoff Integer threshold between 0 and 255.
#' @return A raw vector (RGB).
#' @export
rgb_to_red_cutoff <- function(rgb_vec, cutoff = 127) {
  grey_val <- as.integer(rgb_to_greyscale(rgb_vec)[1])

  if (grey_val < cutoff) {
    raw(c(255, 0, 0))  # red
  } else {
    raw(c(0, 0, 0))    # black
  }
}

#' Apply a green cutoff filter to an RGB pixel
#'
#' Same logic as red cutoff but outputs green.
#'
#' @param rgb_vec A raw RGB pixel.
#' @param cutoff Integer threshold between 0 and 255.
#' @return A raw RGB pixel.
#' @export
rgb_to_green_cutoff <- function(rgb_vec, cutoff = 127) {
  grey_val <- as.integer(rgb_to_greyscale(rgb_vec)[1])

  if (grey_val < cutoff) {
    raw(c(0, 255, 0))  # green
  } else {
    raw(c(0, 0, 0))    # black
  }
}

#' Apply a blue cutoff filter to an RGB pixel
#'
#' Same logic as red/green cutoff but outputs blue.
#'
#' @param rgb_vec A raw RGB pixel.
#' @param cutoff Integer threshold between 0 and 255.
#' @return A raw RGB pixel.
#' @export
rgb_to_blue_cutoff <- function(rgb_vec, cutoff = 127) {
  grey_val <- as.integer(rgb_to_greyscale(rgb_vec)[1])

  if (grey_val < cutoff) {
    raw(c(0, 0, 255))  # blue
  } else {
    raw(c(0, 0, 0))    # black
  }
}
