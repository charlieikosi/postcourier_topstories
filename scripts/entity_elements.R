library(tidyverse)
library(rvest)

# Load headlines db
df <- read.csv("data/db/headlinesdb.csv", stringsAsFactors = FALSE)
# Vectorize url column
links <- df$URL

#---------- Politics Entity --------------------


# Set looping index
index <- 0

# Create Vector of Key Political words
politics_key <- c("Minister", "MP", "MPs", "Member", "PM", "Govt", "govt", "Government", "government",
                  "parliament", "Parliament", "Parliamentary", "electorate", "Electorates", "electorates",
                  "election", "Election", "Prime")

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print("accessing link...")
  
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

# Scrape latest MPs and create vector of MP names
content <- read_html("https://en.wikipedia.org/wiki/Members_of_the_National_Parliament_of_Papua_New_Guinea,_2022%E2%80%932027")
tables <- content %>% html_table(fill = TRUE)
first_table <- tables[[3]]
members <- first_table$Member
content <- read_html("https://en.wikipedia.org/wiki/Members_of_the_National_Parliament_of_Papua_New_Guinea,_2022%E2%80%932027")
tables <- content %>% html_table(fill = TRUE)
first_table <- tables[[3]]
members <- first_table$Member

# Split MPs names
members <- unlist(strsplit(members, " "))

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print("accessing link...")
  
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

# Create vector of key Defence words
defence <- c("Army", "Defence Force", "Defence", "PNGDF", "Military", "military",
             "Soldier", "soldier", "soldiers", "Army Baracks", "Baracks")

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print("accessing link...")
  
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

# Create vector of key tourism words
tourism <- c("Tourist", "Tourism", "tourist", "tourists", "Tourists", "tourism", "Festival", 
             "festival", "hotel", "Hotel", "Hotels", "hotels", "lodge", "Lodge", "resort", 
             "Resort")

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print("accessing link...")
  
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

# Create vector of key tourism words
tourism <- c("Livestock", "farm", "Farming", "Agriculture", "agriculture", "Cocoa", "cocoa",
             "Coffee", "coffee", "dairy", "Dairy", "beef", "Beef", "Cattle", "cattle",
             "onion", "garlic", "fresh", "vegetables","Vegetable", "spice", "vanila")

for (link in links) {
  index <- index + 1
  page <- read_html(link)
  article <- page %>% html_nodes("p") %>%
    html_text()
  
  print("accessing link...")
  
  words <- unlist(strsplit(article, " "))
  
  for (word in words) {
    if (word %in% tourism) {
      print("Match Found!")
      df$Entity.Agriculture.Livestock[index] <- word
    }
  }
}
