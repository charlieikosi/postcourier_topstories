library(rvest)
library(tidyverse)
library(tibble)


scrape_topstories <- function(url, pages){
  
  print("Scraping Now...")
  
  page <- read_html(url)

  total_pages <- as.numeric(pages)
  # while-loop counter
  i <- 1
  
  # Empty vectors for tibble
  pubDate <- c()
  pubTitle <- c()
  pubUrl <- c()
  
  
  # While-loop
  while (i <= total_pages) {
    
    page <- read_html(url)
    
    pc_topstories <- page %>%
      html_nodes("#main .entry-title a")
    
    pc_topstories_title <- pc_topstories %>%
      html_text()
    pubTitle <- append(pubTitle, pc_topstories_title)
    
    pc_topstories_url <- pc_topstories %>%
      html_attr("href")
    pubUrl <- append(pubUrl, pc_topstories_url)
    
    pc_topstories_date <- page %>%
      html_nodes("#main .published") %>%
      html_text()
    pubDate <- append(pubDate, pc_topstories_date)
    
    print(i)
    
    i <- i + 1
    
    # Next page url
    url <- page %>%
      html_nodes(".next") %>%
      html_attr("href")

  }
  
  # Create tibbles from vectors
  df <- tibble(
    Pub.Date = pubDate,
    Top.Stories = pubTitle,
    URL = pubUrl
  )
  
  print("Scrapping Completed!")
  
  return(df)
  
}












