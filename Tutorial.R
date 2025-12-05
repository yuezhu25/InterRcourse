install.packages("devtools")
library(devtools)
devtools::install('InterRcourse')

library(magick)
library(InterRcourse)
# Load image
img <- image_read("../../InterRcourse/Test image-1.jpg")

# Extract bitmap
bitmap <- img[[1]]

# Apply filters
grey_bitmap <- apply_filter_bitmap(bitmap, grey_filter)
red_bitmap  <- apply_filter_bitmap(bitmap, red_filter)
green_bitmap <- apply_filter_bitmap(bitmap, green_filter)
blue_bitmap  <- apply_filter_bitmap(bitmap, blue_filter)

# Convert back to image
grey_img  <- image_read(grey_bitmap)
red_img   <- image_read(red_bitmap)
green_img <- image_read(green_bitmap)
blue_img  <- image_read(blue_bitmap)

# Show results
print(grey_img)
print(red_img)
print(green_img)
print(blue_img)
