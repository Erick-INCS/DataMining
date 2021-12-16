## KMeans

k-means clustering is a method of vector quantization, originally from signal processing, that aims to partition n observations into k clusters in which each observation belongs to the cluster with the nearest mean (cluster centers or cluster centroid), serving as a prototype of the cluster.
k-means clustering minimizes within-cluster variances (squared Euclidean distances), but not regular Euclidean distances, which would be the more difficult Weber problem: the mean optimizes squared errors, whereas only the geometric median minimizes Euclidean distances.
For instance, better Euclidean solutions can be found using k-medians and k-medoids.

Importing the dataset
```R
dataset = read.csv(file = file.choose())
```

Creating different datasets with specific columns
```R
dataset = dataset[1:4]
sepal_dataset=dataset[1:2]
petal_dataset=dataset[3:4]
```

Using the elbow method to find the optimal number of clusters
```R
set.seed(15)
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
plot(
  1:10,
  wcss,
  type = 'b',
  main = paste('The Elbow Method'),
  xlab = 'Number of clusters',
  ylab = 'WCSS'
)
```

Getting the clusters in the petal data
```R
petal_kmeans = kmeans(x = petal_dataset, centers = 3, iter=1)
petal_clusters = petal_kmeans$cluster
```

Visualising the clusters using petal data
```R
# install.packages('cluster')
library(cluster)
clusplot(
  petal_dataset,
  petal_clusters,
  lines = 0,
  shade = TRUE,
  color = TRUE,
  labels = 2,
  plotchar = FALSE,
  span = TRUE,
  main = paste('Clusters of petal Iris'),
  xlab = 'Petal length',
  ylab = 'Petal witdth'
)
```

Getting the clusters in the sepal data
```R
sepal_kmeans = kmeans(x = sepal_dataset, centers = 3)
sepal_clusters = sepal_kmeans$cluster
```

Visualising the clusters using sepal data
```R
# install.packages('cluster')
set.seed(12)
library(cluster)
clusplot(sepal_dataset,
  sepal_clusters,
  lines = 0,
  shade = TRUE,
  color = TRUE,
  labels = 2,
  plotchar = FALSE,
  span = TRUE,
  main = paste('Clusters of Sepal Iris'),
  xlab = 'Sepal length',
  ylab = 'Sepal witdth'
)
```

Getting the clusters in all the data
```R
kmeans = kmeans(x = dataset, centers = 3)
y_clusters = kmeans$cluster
```

Visualizing the clusters using all data
```R
# install.packages('cluster')
set.seed(12)
library(cluster)
clusplot(
  dataset,
  y_clusters,
  lines = 0,
  shade = TRUE,
  color = TRUE,
  labels = 2,
  plotchar = FALSE,
  span = TRUE,
  main = paste('Clusters of Iris'),
  xlab = 'x label',
  ylab = 'y label'
)
```
