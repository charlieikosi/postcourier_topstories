# Vector of Key Political words
politics_key <- c("Minister", "MP", "MPs", "Member", "PM", "Govt", "govt", "Government", "government",
                  "parliament", "Parliament", "Parliamentary", "electorate", "Electorates", "electorates",
                  "election", "Election", "Prime")

#------------------------------------------------
library(rvest)
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

#------------------------------------------------

# Create vector of key Defence words
defence <- c("Army", "Defence Force", "Defence", "PNGDF", "Military", "military",
             "Soldier", "soldier", "soldiers", "Army Baracks", "Baracks")

#------------------------------------------------
# Create vector of key tourism words
tourism <- c("Tourist", "Tourism", "tourist", "tourists", "Tourists", "tourism", "Festival", 
             "festival", "hotel", "Hotel", "Hotels", "hotels", "lodge", "Lodge", "resort", 
             "Resort")

#------------------------------------------------
# Create vector of key agriculture words
agriculture_keys <- c("Livestock", "farm", "Farming", "Agriculture", "agriculture", "Cocoa", "cocoa",
                      "Coffee", "coffee", "dairy", "Dairy", "beef", "Beef", "Cattle", "cattle",
                      "onion", "garlic", "fresh", "vegetables","Vegetable", "spice", "vanila")

#------------------------------------------------
# Create vector for key extractive industries words

industry <- c("Mine", "Mining", "mine", "mining", "Petroleum", "petroleum", "Oil",
              "oil", "Newcrest", "gas", "oil", "exploration", "tenement", "MMJV", "OTML",
              "otml", "copper", "Copper", "Gold", "gold", "Exploration", "Frieda", "mines", "Mines",
              "Exxon", "Mobil", "Golpu")

#------------------------------------------------
# Create vector f key extractive industries














