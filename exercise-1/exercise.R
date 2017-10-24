### Exercise 1 ###

# Load the httr and jsonlite libraries for accessing data
library("httr")
library("jsonlite")

## For these questions, look at the API documentation to identify the appropriate endpoint and information.
## Then send GET() request to fetch the data, then extract the answer to the question

# How many forks does the most popular repository (by number of forks) have when you search for the term "d3"?
# (search for the term, and sort descending by the number of forks)
api.url <- "https://api.github.com"
url.search <- "/search/repositories"
base.url <- paste0(api.url, url.search)
query.param <- list(q = "d3", sort = "forks")
response <- GET(base.url, query = query.param)
body <- content(response, "text")
data <- fromJSON(body)
most.popular <- data$items[1,]
# How many public repositories does our course organization have?
org.repo <- "/orgs/info201a-au17/repos"
url.full <- paste0(api.url, org.repo)
qu <- list(type = "public")
request <- GET(url.full, query = qu)
content <- content(request, "text")
repo.data <- fromJSON(content)
num.repos <- nrow(repo.data)