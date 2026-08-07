setwd("~/Downloads/ndvi")

library(terra)

ndvi01jan <- rast("Sentinel2_2020-01-24_ndvi.tif")
ndvi02feb <- rast("Sentinel2_2020-02-21_ndvi.tif ")
ndvi03mar <- rast("Sentinel2_2020-03-12_ndvi.tif")
ndvi04apr <- rast("Sentinel2_2020-04-11_ndvi.tif")
ndvi05may <- rast("Sentinel2_2020-05-08_ndvi.tif")
ndvi06jun <- rast("Sentinel2_2020-05-21_ndvi.tif")
ndvi07jul <- rast("Sentinel2_2020-07-05_ndvi.tif")
ndvi08aug <- rast("Sentinel2_2020-08-01_ndvi.tif")
ndvi09sep <- rast("Sentinel2_2020-09-05_ndvi.tif")
ndvi10oct <- rast("Sentinel2_2020-10-10_ndvi.tif")
ndvi11nov <- rast("Sentinel2_2020-11-27_ndvi.tif")
ndvi12dec <- rast("Sentinel2_2020-12-17_ndvi.tif")

extent_ref <- ext(ndvi01jan)

ndvi02feb <- crop(ndvi02feb, extent_ref)

# export feb image
writeRaster(ndvi02feb, "Sentinel2_2020-02-21_ndvi.tif", overwrite=TRUE)

ndvi <- c(ndvi01jan, ndvi02feb, ndvi03mar, ndvi04apr, ndvi05may, ndvi06jun, ndvi07jul, ndvi08aug, ndvi09sep, ndvi10oct, ndvi11nov, ndvi12dec)

plot(ndvi)
ndvi02feb

# export ndvi
writeRaster(ndvi, "ndvi_2020.tif", overwrite=TRUE)

# import ndvi
ndvi <- rast("ndvi_2020.tif")

# show the names for every image in ndvi
names(ndvi)

# inside ndvi rename the february image
names(ndvi)[2] <- "Sentinel2_2020-02-21_ndvi"

names(ndvi)

im.ridgeline(ndvi, scale=2)
im.ridgeline(ndvi, scale=2, color="quartile")
