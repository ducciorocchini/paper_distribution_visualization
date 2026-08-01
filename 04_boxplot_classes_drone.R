library(terra)
library(imageRy)
library(viridis)

# Import the UAV RGB image
canale <- rast("https://zenodo.org/records/21326622/files/dji_fly_20250409_063452_0009_1744199090642_photo.JPG")
plot(canale)

# Partition the image into four spectral classes using k-means clustering
classes <- im.classify(
  canale,
  num_clusters = 4,
  seed = 42
)

# Compare the distribution of the red band (layer 2) among the four classes
# using kernel density boxplots
im.boxplot.classes(
  canale,
  classes,
  layer = 2,
  density = TRUE,
  median_labels = TRUE,
  limits = c(0.01, 0.99),
  custom_colors = viridis::viridis(4, end = 0.5)
)
