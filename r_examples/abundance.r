# Abundance of insect from aerial collections

data <- read.csv("data/aerial_collection.csv", header = TRUE,
                stringsAsFactors = TRUE)

## Family level
individuals <- NULL
family <- NULL
site <- NULL

counter <- 1

for (i in levels(data$family)) {
  for (j in levels(data$site)) {
    individuals[counter] <- length(data$family[data$family == i
                                    & data$site == j])
    family[counter] <- i
    site[counter] <- j
    counter <- counter + 1
  }
}

abundance <- data.frame(family, individuals, site, stringsAsFactors = TRUE)
