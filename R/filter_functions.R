# ---- GREYSCALE FILTER ----
grey_filter <- function(rgb_raw) {
  rgb_num <- as.numeric(rgb_raw)

  grey_val <- rgb_num[1] * 0.299 +
    rgb_num[2] * 0.587 +
    rgb_num[3] * 0.114

  grey_val <- max(min(round(grey_val), 255), 0)
  rep(as.raw(grey_val), 3)
}

# ---- GENERIC CUTOFF FILTER ----
cutoff_filter <- function(rgb_raw,
                          cutoff = 0.5,
                          on_color  = c(255, 0, 0),
                          off_color = c(0, 0, 0)) {

  rgb_num <- as.numeric(rgb_raw)
  grey_val <- rgb_num[1] * 0.299 +
    rgb_num[2] * 0.587 +
    rgb_num[3] * 0.114

  if (cutoff <= 1) {
    cutoff_val <- cutoff * 255
  } else {
    cutoff_val <- cutoff
  }

  if (grey_val >= cutoff_val) {
    out <- on_color
  } else {
    out <- off_color
  }

  as.raw(pmax(pmin(round(out), 255), 0))
}

# ---- COLOR FILTERS ----
red_filter   <- function(rgb_raw, cutoff = 0.5) cutoff_filter(rgb_raw, cutoff, c(255, 0, 0), c(0,0,0))
green_filter <- function(rgb_raw, cutoff = 0.5) cutoff_filter(rgb_raw, cutoff, c(0,255,0), c(0,0,0))
blue_filter  <- function(rgb_raw, cutoff = 0.5) cutoff_filter(rgb_raw, cutoff, c(0,0,255), c(0,0,0))
