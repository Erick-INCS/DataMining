## Evaluation unit 2
For this practice we implement an advanced plot.

Libraries
```R
library("dplyr")
library("ggplot2")
install.packages('extrafont')
library(extrafont)
font_import()
```

Loading the dataframe
```R
df <- read.csv('https://raw.githubusercontent.com/jcromerohdz/DataMining/master/Datasets/Project-Data.csv')
```

Filtering the dataframe
```R
df <- df[which(df$Genre=="action"|df$Genre=="adventure"|
               df$Genre=="animation"|df$Genre=="comedy"|
               df$Genre=="drama"),]
```

Selecting columns
```R
df <-  df[which(df$Studio=="Buena Vista Studios"|df$Studio=="Fox"|
  df$Studio=="Paramount Pictures"|df$Studio=="Sony"|
  df$Studio=="Universal"|df$Studio=="WB"),]
```

Final plot
```R
plot <- ggplot(df, aes(x=Genre, y=Gross...US))+
  geom_jitter(shape = 20, aes(size = Budget...mill.,color=Studio))+
  geom_boxplot(size=0.5, alpha=0.7, outlier.shape = NA)

plot + 
  xlab("Genre") +
  ylab("Gross % us") +
  ggtitle("Domestic Gross % by Genre")+
  theme(axis.title.x = element_text(family = "Comic Sans MS", color = "Purple", size = 15),
        axis.title.y = element_text(family = "Comic Sans MS", color = "Purple", size = 1),
        legend.justification = c(1,1),
        plot.title = element_text(family = "Comic Sans MS", color = "Black", size = 18, hjust=0.5))
```
![Domestic Gross by genre](plots/Domestic%20Gross_by_genre.png)