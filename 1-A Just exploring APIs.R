##define the base url
base_url <- 'https://exhibits.library.dartmouth.edu/api/items'
API_url <- paste0(base_url)
## use the GET command to get data
raw_data <- GET(API_url)
status_code(raw_data)
raw_data_string <- str(content(raw_data))
str(raw_data)

AJM <- content(raw_data,
        "text", encoding = "UTF-8")
AJM

AJM1 <- fromJSON(AJM,
         flatten = TRUE)












## https://www.geeksforgeeks.org/accessing-rest-api-using-r-programming/
call <- "http://www.omdbapi.com/?i=tt3896198&apikey=948d3551&plot=full&r=json"

# Getting details in API
get_movie_details <- GET(url = call)

# Getting status of HTTP Call
status_code(get_movie_details)

# Content in the API
str(content(get_movie_details))

# Converting content to text
get_movie_text <- content(get_movie_details,
                          "text", encoding = "UTF-8")
get_movie_text

# Parsing data in JSON
get_movie_json <- fromJSON(get_movie_text,
                           flatten = TRUE)
get_movie_json

# Converting into dataframe
get_movie_dataframe <- as.data.frame(get_movie_json)
