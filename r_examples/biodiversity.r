# Examples of biodiversity measurements using abundance.r

source("abundance.r")

# Using BiodiversityR and vegan
library(BiodiversityR)
library(vegan)

# Vegan expects a specific format for the abundance table

abundance_table <- matrix(NA, ncol = nlevels(abundance$family),
                    nrow = nlevels(abundance$site))
colnames(abundance_table) <- levels(abundance$family)
rownames(abundance_table) <- levels(abundance$site)

for (i in levels(abundance$site)){
  for (j in levels(abundance$family)){
    n <- sum(abundance$individuals[abundance$site == i & abundance$family == j])
    abundance_table[i, j] <- n
  }
}

# Rank-abundance and plot

# All sites together

total_rank <- rankabundance(abundance_table)
plot(total_rank, type = "l")

# Rank abundance for a particular site
D7_rank <- rankabundance(abundance_table, site, factor = "site", level = "D7")
plot(rank, type = "l")