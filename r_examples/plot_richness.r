# Plot the richness data from richness.r

source("richness.r")

# Means and standard errors
library(Rmisc)
summary_stats <- summarySE(data = block_rich, measurevar = "richness",
                           groupvars = "site", na.rm = TRUE)

# Plot with error bars
library(ggplot2)

# Get proper heights and placements for error bars
ht <- NULL

for (i in levels(as.factor(summary_stats$site))) {
  a <- max(summary_stats$richness[summary_stats$site == i])
  ht[i] <- a
}

ht <- c(ht[1], ht[2], ht[3], ht[4]) # Extract values

# Error bar dodge
pd <- position_dodge(.9)

# Order sites numerically, not alphabetically
summary_stats$site <- factor(summary_stats$site,
                            levels = c("D7", "D8", "D9", "D10"))

## Barplot with ggplot2
ggplot(summary_stats, aes(x = site, y = richness, fill = site)) +
    geom_bar(stat = "identity", colour = "black", size = 0.3) +
    scale_fill_manual(values = c(rep("#69b3a2", 4))) +
    geom_errorbar(aes(ymin = richness - se, ymax = richness + se),
        colour = "black", width = .1, position = pd) +
    ggtitle("Method: Aerial Net") +
    xlab("Community district") +
    ylab("Taxonomic richness") +
    scale_y_continuous(limits = c(0, 16),
                     expand = c(0, 0), # Set y range
                     breaks = 0:100 * 2) +
    theme_bw(base_size = 25) + theme(panel.grid = element_blank()) +
    theme(legend.position = "none")