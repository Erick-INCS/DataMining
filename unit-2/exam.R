# Libraries
library("dplyr")
library("ggplot2")

# Loading the dataframe
df <- read.csv('https://raw.githubusercontent.com/jcromerohdz/DataMining/master/Datasets/Project-Data.csv')

# View available genres
unique(df$Genre)

# df[
df <- df[df$Genre %in%  c("action", "adventure", "animation", "comedy", "drama"),]

# Selecting columns
names(df)
df <- select(df, c("Gross...US", "Genre", "Budget...mill.", "Studio"))

df$Gross...US
df$Genre <- as.factor(df$Genre)
df$Studio <- as.factor(df$Studio)


# Plot
ggplot(df, aes(y="Gross...US")) + 
  geom_boxplot()+
  labs(title="Domestic Gross % by Genre", y="Gross % US")+
  theme_classic()
# bp <- ggplot(ToothGrowth, aes(x=dose, y=len, fill=dose)) + 
#   geom_boxplot()+
#   labs(title="Plot of length  per dose",x="Dose (mg)", y = "Length")
# bp + theme_classic()