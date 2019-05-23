# distR
Functions for calculating the distance between vector points

## dist.R
Calculate the XY(Z) Euclidean distance between vector points. If you want to include the terrain elevation, use DTM. Otherwise, only raster with area is enough. Function requires these arguments:
- `points` - sf point layer
- `raster` - raster in the metric coordinate system
- `method` - "XY" or "XYZ" ("XY" with elevation)

**Example**
``` r
p = st_read("points.gpkg")
r = raster("DTM.tif")
dist_XYZ = dist(p, r, "XYZ")
plot(dist_XYZ[[1:5]]) # plot selected rasters
```

## distAcc.R
Calculate the cumulative distance between vector points using the terrain elevation. Function requires these arguments:
- `points` - sf point layer
- `raster` - raster in the metric coordinate system
- `directions` - direction of the pixel connection (4, 8, 16 or matrix)

**Example**
``` r
p = st_read("points.gpkg")
r = raster("DTM.tif")
dist_Acc = distAcc(p, r)
plot(dist_Acc[[1:5]]) # plot selected rasters
```
## Sample output:
![Sample output](/img/sample_output.png)
