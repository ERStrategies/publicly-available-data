#extracts data from urban ed data portal
#SAPIE Poverty Esimates
#https://educationdata.urban.org/documentation/school-districts.html#saipe_poverty-estimates

library(educationdata)
library(data.table)

#set variables
save_location <-"/Education Resource Strategies/ERS Data - Documents/Public Data/SAIPE Pov Estimates"
user_name <- "C:/Users/jdavidow" #update to you username

#get the data 
data <- setDT(get_education_data(level = "school-districts",
                                  source = "saipe",
                                  filters = list(year = 2008:2018)))


##set directory, save it and set it for files
wd<- setwd(paste0(user_name,save_location))

##write data to a flat file from R. 
fwrite(data, "saipe.csv") 
