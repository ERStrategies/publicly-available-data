#Authour: Jenny Katz
#Date: 3/1/2023
#Description:  gets chapter titles and URLS from Linked IN
#https:

#load libraries
library(rvest)
library(tidyverse)
library(openxlsx)

# Specify the URLs of the courses you want to scrape
urls <- c("https://www.linkedin.com/learning/learning-the-r-tidyverse/welcome?autoplay=true&resume=false&u=2236913",
          "https://www.linkedin.com/learning/learning-r-18748884/r-in-context?autoplay=true&resume=false&u=2236913")

file_path="C:/Users/jdavidow/Education Resource Strategies/ERS Data - Documents/Public Data/LinkedIn Learning Courses"

# Define a function to extract chapter links from a single URL
get_chapter_links <- function(url) {
  page <- read_html(url)
  chapter_links <- page %>%
    html_nodes(".toc-item a") %>%
    html_attr("href")
  course_chapter <- str_extract(chapter_links, "(?<=learning-the-r-tidyverse/|learning-r-18748884/)[^?]+")
  course_name <- str_extract(url, "(?<=learning/)[^/]+")
  data.frame(course_name, course_section, course_chapter, chapter_links, stringsAsFactors = FALSE)
}

# Loop through the URLs and apply the function
chapter_data <- do.call(rbind, lapply(urls, get_chapter_links))

#save to folder
write.xlsx(chapter_data, paste0(file_path, "\\linkedin_learning_r_course_details.xlsx"),rowNames = FALSE)

