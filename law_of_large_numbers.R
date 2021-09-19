setwd('/HDD/Code/R/DataMining')

n <- 10000
n.sample <- rnorm(n, mean=0, sd=1)

# Quantity of numbers that falls between -1 and 1
percent <- sum((n.sample >= -1) & (n.sample <= 1)) / n

# Result
print(paste(
  percent * 100,
  "% falls between -1 and 1"
))

# Plot
plot(n.sample)
abline(h=1, col="green")
abline(h=-1, col="green")
