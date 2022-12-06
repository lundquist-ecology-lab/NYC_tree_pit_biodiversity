# Generalized linear model from data in richness.r
source("r_examples/richness.r")

# Generalized Linear Model assuming Poisson distribution for count data
library(lme4)
model <- glm(richness ~ site, data = block_rich, family = poisson)

# Analysis of Deviance
anova(model, test = "Chisq")