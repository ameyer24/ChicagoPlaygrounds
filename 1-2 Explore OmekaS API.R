## Define path to Omeka S install.
path <- "http://www.chicagoplaygrounds.com"

## GET the data
get_data <- GET(url = path)

## Status code / should be 200 for a good connection
status_code(get_data)

str(content(get_data))

## Parse data
raw_data <- get_data
raw_data_json <- content(raw_data, "text")
raw_data_json
## get the data from JSON
data <- fromJSON(raw_data_json)
data
id <- data$'schema:identifier'
id
nrow(id)
## make data frame
omeka_data <- as.data.frame(data)



