#read data from excel
data <- read.xlsx("./data/hpi-data.xlsx", sheetName = "Complete HPI Dataset", 
                  startRow = 6, as.data.frame = T)
data <- data[1:151,2:12]
nm <- names(data)
nm[1] <- "HPI Rank"
nm[4] <- "Life Expectancy" 
nm[5] <- "Well Being"
nm[6] <- "Happy Life Years"
nm[7] <- "Ecological Footprint"
nm[8] <- "Happy Planet Index"
names(data) <- nm
#write the cleaned data, to be used by server.R
write.csv(data, file = "/data/cleanHPI")
