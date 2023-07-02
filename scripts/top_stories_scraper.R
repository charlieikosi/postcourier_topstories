source("scripts/postcourierR/postcourierR.R")

# Url for page to scrape
pc_url <- "https://www.postcourier.com.pg/top-stories/"

df <- scrape_topstories(pc_url, pages = 150)

# Save
write_csv(df, "data/raw/raw_scrape.csv")

# Select rows up to Jan 2023
df_2023 <- df[1:1306,]

# Save
write_csv(df_2023, "data/raw/stories_jan-jun.csv")

# Create Columns
headlines$Entity.Infrastructure <- NA
df_2023$Entity.Health <- NA
df_2023$Entity.Police <- NA
df_2023$Entity.Education <- NA
df_2023$Entity.Politics <- NA
df_2023$Entity.Extractive.Industry <- NA
df_2023$Entity.Agriculture.Livestock <- NA
df_2023$Entity.Defence <- NA
df_2023$Entity.Tourism <- NA

# Save
write.csv(df_2023, "data/headlinesdb.csv")