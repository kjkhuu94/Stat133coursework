mpg2 <- read.csv("mpg2.csv.bz2", stringsAsFactors=FALSE,  strip.white=TRUE)
mpg2$make_orig  <- mpg2$make
mpg2$make_lower <- tolower(mpg2$make)
  mpg2$make_lowerclean <- NA
mpg2$country <- NA
mpg2[mpg2$make_lower == "cadillac", ]$make_lowerclean <- "cadillac"
mpg2[mpg2$make_lower == "cadillac", ]$country <- "USA"
mpg2[mpg2$make_lower == "lincoln", ]$make_lowerclean <- "lincoln"
mpg2[mpg2$make_lower == "lincoln", ]$country <- "USA"


mpg2[mpg2$make_lower == "acura", ]$make_lowerclean <- "acura"
mpg2[mpg2$make_lower == "acura", ]$country <- "Japan"
mpg2[mpg2$make_lower == "lexus", ]$make_lowerclean <- "lexus"
mpg2$trans_dscr<- NULL
mpg2$guzzler<-!is.na(mpg2$guzzler)&mpg2$guzzler=="G"
mpg2[mpg2$make_lower == "lexus", ]$country <- "Japan"
mpg2[mpg2$make_lower == "infiniti", ]$make_lowerclean <- "infiniti"
mpg2[mpg2$make_lower == "infiniti", ]$country <- "Japan"
mpg2[mpg2$make_lower == "mercedes-benz", ]$make_lowerclean <- "mercedes-benz"
mpg2[mpg2$make_lower == "mercedes-benz", ]$country <-   "Germany"
mpg2[mpg2$make_lower == "bmw", ]$make_lowerclean <- "bmw"
mpg2[mpg2$make_lower == "bmw", ]$country <- "Germany"
mpg2[mpg2$make_lower == "audi", ]$make_lowerclean <- "audi"
mpg2[mpg2$make_lower == "audi", ]$country <- "Germany"
mpg2[mpg2$make_lower == "jaguar", ]$make_lowerclean <- "jaguar"
mpg2[mpg2$make_lower == "jaguar", ]$country <- "Britain"
mpg2[mpg2$make_lower == "bmw alpina", ]$make_lowerclean <- "bmw"
mpg2[mpg2$make_lower == "bmw alpina", ]$country <- "Germany"
mpg2 <- mpg2[is.na(mpg2$country) == FALSE, ]
mpg2$eng_dscr<- NULL
mpg2$z <- c("Two Seaters"="Two Seaters","Minicompact Cars"="Minicompact Cars","Subcompact Cars"="Subcompact Cars","Compact Cars"="Compact Cars","Midsize Cars"="Midsize Cars","Large Cars"="Large Cars","Small Station Wagons"="Small Station Wagons","Midsize Station Wagons"="Midsize Station Wagons","Midsize-Large Station Wagons"="Large Station Wagons","Special Purpose Vehicles"="Special Purpose Vehicles","Special Purpose Vehicle 2WD"="Special Purpose Vehicles","Special Purpose Vehicle 4WD"="Special Purpose Vehicles","Special Purpose Vehicles/2wd"="Special Purpose Vehicles","Special Purpose Vehicles/4wd"="Special Purpose Vehicles","Sport Utility Vehicle - 2WD"="Sport Utility Vehicles","Sport Utility Vehicle - 4WD"="Sport Utility Vehicles","Small Pickup Trucks"="Small Pickup Trucks","Small Pickup Trucks 2WD"="Small Pickup Trucks","Small Pickup Trucks 4WD"="Small Pickup Trucks","Standard Pickup Trucks"="Standard Pickup Trucks","Standard Pickup Trucks 2WD"="Standard Pickup Trucks","Standard Pickup Trucks 4WD"="Standard Pickup Trucks","Standard Pickup Trucks/2wd"="Standard Pickup Trucks","Minivan - 2WD"="Minivans","Minivan - 4WD"="Minivans","Vans"="Vans","Vans Passenger"="Vans","Vans,Cargo Type"="Vans","Vans,Passenger Type"="Vans")[mpg2$vclass]
write.csv(subset(mpg2, year >= 2000), "mpg2-clean.csv")
