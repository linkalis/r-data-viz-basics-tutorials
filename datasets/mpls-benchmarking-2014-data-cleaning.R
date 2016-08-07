library(stringr)

data <- read.csv("mpls_benchmarking_2014.csv", header=TRUE, na.strings=c("N/A", "Not Available"))

data$prop_type <- as.character(data$prop_type)
data$org_name <- as.character(data$org_name)
data$prop_name <- as.character(data$prop_name)

# If the prop_type starts with "Other, then extract all info after ad put into extra_info column
data$prop_type_extra_info <- ifelse(str_detect(data$prop_type, "Other"), str_replace(data$prop_type, "Other - ", ""), NA)

data$prop_type <- ifelse(str_detect(data$prop_type, "Other"), "Other", data$prop_type)

data$org_name <- ifelse(data$org_name == "", "Private", data$org_name)
data$prop_name <- ifelse(data$prop_name == "", "Private", data$prop_name)
