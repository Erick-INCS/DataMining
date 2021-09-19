vect = c(10, -10, 11, 9, 14, 33, 9)
num.sample = rnorm(100, 7, 3)

# 1) getwd: Gets the current working directory
getwd()
"
[1] \"/HDD/Code/R/DataMining\"
"

# 2) setwd: Sets the working direcory
setwd("/HDD/Code/R/DataMining")

# 3) dir: Shows all the files in the current working directory
dir()
"
[1] \"law_of_large_numbers.R\" \"r_functions.R\"          \"README.md\" 
"

# 4) max: Returns the maximum value of a series of numbers
max(1, 2, -3)
max(vect)

# 5) min: Returns the minimum value of a series of numbers
min(1, 2, -3)
min(vect)

# 6) sd: Returns the standard deviation of a series of numbers
sd(vect)

# 7) mean: Returns the statistical mean of a series of numbers
mean(vect)

# 8) median: Returns the statistical median of a series of numbers
median(vect)

# 9) quantile: Produces sample quantiles corresponding to the given probabilities
quantile(num.sample)
quantile(num.sample, probs = .45)
quantile(num.sample, probs = c(.1, .95))

# 10) IQR: Returns the interquartile range
IQR(num.sample)

# 11) matrix: creates a matrix from the given set of values
matrix(c(1, 1, 3, 6, 2, 4, 5, 25), nrow=4)
matrix(c('1 1', '3 6', '2 4', '5 25'), ncol = 2)

# 12) lappy: Apply the same Function to each element of a list or vector
lapply(vect, function(n) {n + 1})

# 13) unlist: Given a list structure x, unlist simplifies it to produce a vector which contains all the atomic components which occur in x.
a.mess <- lapply(vect, function(n) {n + 1})
"
> a.mess
[[1]]
[1] 11

[[2]]
[1] -9

[[3]]
[1] 12

[[4]]
[1] 10

[[5]]
[1] 15

[[6]]
[1] 34

[[7]]
[1] 10
"

a.mess <- unlist(a.mess)
"
> a.mess
[1] 11 -9 12 10 15 34 10
"

# 14) head: Returns the first part of a vector, matrix, table, data frame or function
head(num.sample)
head(num.sample, 3)

# 15) head: Returns the last part of a vector, matrix, table, data frame or function
tail(num.sample)
tail(num.sample, 3)

# 16) hist: Shows an histogram
hist(num.sample)

# 17) var: Returns the variance
var(num.sample)

# 18) cor: Returns the correlation
cor(num.sample, num.sample + rnorm(100))

# 19) cov: Returns the covariance 
cov(num.sample, num.sample + rnorm(100))

# 20) table: build a contingency table of the counts at each combination of factor levels.
table(vect)
"
vect
-10   9  10  11  14  33 
  1   2   1   1   1   1 
"