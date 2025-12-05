# InterRcourse – Image Filter Package

This R package implements simple pixel-based image filters, developed for the course exam.  
The package provides functions to apply **greyscale**, **red**, **green**, and **blue** filters to images using raw RGB pixel data.

All filters operate at the pixel level and are then applied to the entire bitmap using a general `apply_filter_bitmap()` function.

---

## 📦 Installation

Install the package directly from GitHub:

```r
# install.packages("devtools")
devtools::install_github("yuezhu25/InterRcourse")
library(InterRcourse)

## Tutorial
library(magick)
library(InterRcourse)

# Load image
img <- image_read("Test image-1.jpg")

# Extract the bitmap (3D raw array: RGB × width × height)
bitmap <- img[[1]]

# Apply greyscale filter
grey_bitmap <- apply_filter_bitmap(bitmap, grey_filter)

# Convert back to magick image
grey_image <- image_read(grey_bitmap)

# Display result
print(grey_image)

