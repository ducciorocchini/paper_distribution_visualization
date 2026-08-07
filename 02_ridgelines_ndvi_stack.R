library(terra)
library(imageRy)

im.list()

nevi <- im.import("Sentinel2_2020")

names(ndvi) <- c("02-February", "05-May", "08-August", "11-November")

plot(ndvi, range = c(-0.4, 0.9))

im.ridgeline(ndvi, scale=2)
