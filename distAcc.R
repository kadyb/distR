distAcc = function(points, raster, directions = 8) {
   library("sf")
   library("raster")
   library("gdistance")
   
   P_list = st_coordinates(points)
   
   ras_list = list() # initialize list to store output
   
   elevDiff = function(x) {abs(x[2] - x[1])}
   dist = transition(raster, elevDiff, directions)
   dist = geoCorrection(dist)
   
   for(p in 1:nrow(P_list)) {
      dist_acc  = accCost(dist, P_list[p, ])
      dist_acc[dist_acc == Inf] = NA
      names(dist_acc) = paste0("P", p, "_", "distAcc")
      ras_list = append(ras_list, dist_acc)
   }
   
   return(stack(ras_list))
}

# Info:
### Calculate the cumulative distance between vector points using the terrain elevation.
# Input:
### points - sf point layer
### raster - raster in the metric coordinate system
### directions - direction of the pixel connection (4, 8, 16 or matrix)

# Example:
# p = st_read("points.gpkg")
# r = raster("DTM.tif")
# dist_Acc = distAcc(p, r)
# plot(dist_Acc[[1:5]])

