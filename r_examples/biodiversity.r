# Examples of biodiversity measurements using abundance.r

source("r_examples/abundance.r")

# Using vegan
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

# Rank-abundance plot

# All types of models (looking at site D7)
abun_fit <- radfit(abundance_table["D7",])
plot(abun_fit)

# Log-normal (looking at site D7)
abun_fit <- rad.lognormal(abundance_table["D7",])
plot(abun_fit)
plot(abun_fit)