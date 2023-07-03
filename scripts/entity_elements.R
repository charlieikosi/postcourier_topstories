library(tidyverse)
library(rvest)
source("scripts/keyword_vectors.R")

# Load headlines db
df <- read.csv("data/db/headlinesdb.csv", stringsAsFactors = FALSE)
# Vectorize url column
links <- df$URL
url_length <- length(links)


#---------- Politics Entity --------------------
# Set looping index
index <- 0

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print(paste0("accessing link", index, "of", url_length))
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% politics_key) {
      print("Match Found!")
      df$Entity.Politics[index] <- "Politics"
    }
  }
}

#---------- MPs Entity --------------------

# Set looping index
index <- 0

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print(paste0("accessing link", index, "of", url_length))
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% members) {
      print("Match Found!")
      df$Entity.MP[index] <- word
    }
  }
}

#---------- Defence Entity --------------------

# Set looping index
index <- 0

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print(paste0("accessing link", index, "of", url_length))
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% defence) {
      print("Match Found!")
      df$Entity.Defence[index] <- word
    }
  }
}

#---------- Tourism Entity --------------------

# Set looping index
index <- 0

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print(paste0("accessing link", index, "of", url_length))
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% tourism) {
      print("Match Found!")
      df$Entity.Tourism[index] <- "Tourism"
    }
  }
}

#---------- Agriculture Entity --------------------

# Set looping index
index <- 0

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print(paste0("accessing link", index, "of", url_length))
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% agriculture_keys) {
      print("Match Found!")
      df$Entity.Agriculture.Livestock[index] <- word
    }
  }
}

#---------- Extractive Entity --------------------

# Set looping index
index <- 0

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print(paste0("accessing link ", index, " of ", url_length))
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% industry) {
      print("Match Found!")
      df$Entity.Extractive.Industry[index] <- word
    }
  }
}
