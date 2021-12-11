# setwd('/HDD/Code/R/DataMining/unit-2')

#Installation of libraries
library(ggplot2)
# install.packages('reshape2')
library(reshape2)
library(dplyr)

#create dataframe, choosing file from PC files
df <- read.csv(file = file.choose())

# Relation between eating disorders and depression
ggplot(df, aes(x = Eating.disorders, y = Depression)) + #Asisgment of variables in axis on each axis
  geom_point(colour='darkseagreen') + theme_grey() + #style of the points
  ggtitle("Relation Eating disorders vs Depression") + #title
  theme(axis.line = element_line(size = 3, colour = "grey80"), #theme customization
        panel.border = element_rect(linetype = "dashed", fill = NA))


# Subplots
intervals <- 4
(interval.size <- round(diff(range(df$Year))/intervals))

#year filter
start.year <- min(df$Year)
last.year <- max(df$Year)
df$YearCat = ''


#start cycle
while (start.year < last.year) { #comparison by year 
  df[(df$Year < (start.year + interval.size)) & (df$YearCat == ''),"YearCat"] <-
    paste(start.year, '-', start.year + interval.size - 1)
  print(paste(start.year, '-', start.year + interval.size - 1)) #print result
  start.year <- start.year + interval.size
  
}

#cat dataframe
cat.df <- melt(df[,c(4,5,6,7,8,9,10,11)], id.vars = "YearCat")

#create plot 
ggplot(cat.df, aes(y = value, x = variable)) + 
  geom_bar(position = "dodge",
           stat = "summary",
           fun = "mean",
           fill='darkseagreen') + 
  facet_wrap('YearCat') + theme_grey() +
  ggtitle("Mean probability by time period") +
  scale_x_discrete(labels= c(
    "Schizophrenia"="Sha", "Bipolar.disorder"="BD", "Eating.disorders"="ED",     
    "Anxiety.disorders"="AD", "Drug.use.disorders"="DUD",
    "Alcohol.use.disorders"="AUD"
  )) + 
  theme(axis.line = element_line(size = 3, colour = "grey80"),#theme customization
        panel.border = element_rect(linetype = "dashed", fill = NA))


# Statistical plots
corr.df <- cor(df[,c(4,5,6,7,8,9,10)])
(melted_cormat <- melt(corr.df))

#create map
ggheatmap <- ggplot(melted_cormat, aes(Var2, Var1, fill = value))+
  geom_tile()+
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                       midpoint = 0, limit = c(-1,1), space = "Lab", 
                       name="Pearson\nCorrelation") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                   size = 12, hjust = 1))
print(ggheatmap) #print map


# Depression histogram
ggplot(df, aes(x=Depression)) +
  geom_histogram(binwidth=.5, colour="black", fill="white") + #histogram style
  geom_vline(aes(xintercept=mean(Depression, na.rm=T)),   # Ignore NA values for mean
             color="red", linetype="dashed", size=1) + #lines style
  theme(axis.line = element_line(size = 3, colour = "grey80"), #theme customization
        panel.border = element_rect(linetype = "dashed", fill = NA))
