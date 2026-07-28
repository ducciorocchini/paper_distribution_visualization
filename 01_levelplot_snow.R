# Levelplot
library(terra)
library(imageRy)

# List files

# Import image
blet <- im.import("bach")
blet <- flip(blet)

# Plot
plot(blet)

# Levelplot
im.levelplot(blet, layer = 3, custom_colors = "mako", margin = "median")
