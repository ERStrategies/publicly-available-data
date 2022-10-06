library(rvest)
library(data.table)
library(readxl)
install.packages('xlsx')
library(xlsx)


#set variables
url <- "https://edunomicslab.org/fy20-data/"
save_location <-"/Education Resource Strategies/ERS Data - Documents/Public Data/$NERDS Edunomics"
user_name <- "C:/Users/jdavidow" #update to you username

#get the links from the website
excel_links <- read_html(url)%>%
  html_nodes("a") %>% 
  html_attr("href") %>% 
  grep("\\.xlsx",.,value=TRUE)

##set directory, save it and set it for files
wd<- setwd(paste0(user_name,save_location))

## download them all
lapply(excel_links, \(x) download.file(x, basename(x), mode="wb"))

