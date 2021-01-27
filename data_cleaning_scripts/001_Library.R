##### LOAD PACKAGES

#check for updates
options(pkgType = "binary")
update.packages()

library(terra)
library(raster)
library(ggplot2)
library(lme4)
library(lubridate)
library(reshape2)
library(beepr)
library(rgdal)
library(sp)
library(MASS)
library(rgeos)
library(maptools)
library(rgdal)
library(reshape)
#library(SDMTools)
#library(velox)
library(gdalUtils)
library(sf)
library(plyr)
library(dplyr)
library(ggplot2)
#library(corrplot)
#library(scales)
library(tidyverse)
library(units)
#library(stringi)
#library(lwgeom)
library(measurements)
library(miceadds)
library(plotKML)
library(tmaptools)
library(GGally)
library(knitr)
library(lavaan)
library(standardize)
#library(arm) conflicts with tidyverse apparently
library(caret)
library(pROC)
library(lmtest)
library(car)
library(effects)
library(psycho)
#library(landscapemetrics)
library(installr)
library(RColorBrewer)
library(vcdExtra)
library(ResourceSelection)
library(corrplot)
library(MuMIn)
library(lavaanPlot)

#-- Conflicts ------------------------------------------ tidyverse_conflicts() --
# x lubridate::as.difftime() masks base::as.difftime()
# x lubridate::date()        masks base::date()
# x tidyr::expand()          masks Matrix::expand()
# x tidyr::extract()         masks raster::extract()
# x dplyr::filter()          masks stats::filter()
# x lubridate::intersect()   masks raster::intersect(), base::intersect()
# x dplyr::lag()             masks stats::lag()
# x dplyr::select()          masks raster::select()
# x lubridate::setdiff()     masks base::setdiff()
# x lubridate::union()       masks raster::union(), base::union()



#### settings

options(scipen=999) #disable scientific notation
options(stringsAsFactors = FALSE) #disable strings as factors



#### source custom functions
source.all("functions/")



##### OBJECTS SPECIFIC TO THIS PROJECT


## Coordinate reference systems


NPLAEA <-  CRS("+init=EPSG:3573")
AEA <- CRS("+proj=aea +lat_1=50 +lat_2=70 +lat_0=40 +lon_0=-96 +x_0=0 +y_0=0 +datum=NAD83 +units=m +no_defs +ellps=GRS80 +towgs84=0,0,0")
LCC <- wkt(CRS("+proj=lcc +lat_1=49 +lat_2=77 +lat_0=0 +lon_0=-95 +x_0=0 +y_0=0 +datum=NAD83 +ellps=GRS80 +units=m +no_defs"))
WGS84 <- CRS("+init=EPSG:4326")
NAD83 <- CRS("+init=EPSG:4269")



