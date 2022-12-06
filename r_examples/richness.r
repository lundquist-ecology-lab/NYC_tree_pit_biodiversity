# Read in data
data <- read.csv("../data/aerial_collection.csv", header = TRUE,
                stringsAsFactors = TRUE)

# Order-level total richness
length(unique(data$order))

# Family-level total richness
length(unique(data$family))

# Family-level richness per site
site_fam_r <- NULL
site <- NULL

count <- 1

for (i in levels(data$site)) {
    x <- subset(data, data$site == i)
    site_fam_r[count] <- length(unique(x$family))
    site[count] <- i
    count <- count + 1
}

# New data frame
site_rich <- data.frame(site_fam_r, site)
names(site_rich) <- c("richness", "site")

print(site_rich)

# Family-level richness per city block per site
block_fam_r <- NULL
block <- NULL
site <- NULL

count <- 1

for (i in levels(data$site)) {
    for (j in levels(data$block)) {
        if (i == "D10" && j == "S5") { # Note: We were unable to
            site_fam_r[count] <- NA   # collect from D10, S5, so there is
            block[count] <- j
            site[count] <- i
            count <- count + 1
        } else {                       # no data.
            x <- subset(data, data$site == i & data$block == j)
            block_fam_r[count] <- length(unique(x$family))
            block[count] <- j
            site[count] <- i
            count <- count + 1
        }
    }
}

# New data frame
block_rich <- data.frame(block_fam_r, block, site)
names(block_rich) <- c("richness", "block", "site")

print(block_rich)
