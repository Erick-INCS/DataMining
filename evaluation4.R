
	# Importing the dataset
  dataset = read.csv(file = file.choose())
	# Creating different datasets with specific columns
	dataset = dataset[1:4]
	sepal_dataset=dataset[1:2]
	petal_dataset=dataset[3:4]
	
	# Using the elbow method to find the optimal number of clusters
	set.seed(15)
	wcss = vector()
	for (i in 1:10) wcss[i] = sum(kmeans(dataset, i)$withinss)
	plot(1:10,
	wcss,
	type = 'b',
	main = paste('The Elbow Method'),
	xlab = 'Number of clusters',
	ylab = 'WCSS')
	
	

	# Getting the clusters in the petal data
	petal_kmeans = kmeans(x = petal_dataset, centers = 3, iter=1)
	petal_clusters = petal_kmeans$cluster
	# Visualising the clusters using petal data
	# install.packages('cluster')
	library(cluster)
	clusplot(petal_dataset,
	petal_clusters,
	lines = 0,
	shade = TRUE,
	color = TRUE,
	labels = 2,
	plotchar = FALSE,
	span = TRUE,
	main = paste('Clusters of petal Iris'),
	xlab = 'Petal length',
	ylab = 'Petal witdth')
	


	# getting the clusters in the sepal data
	sepal_kmeans = kmeans(x = sepal_dataset, centers = 3)
	sepal_clusters = sepal_kmeans$cluster
	# Visualising the clusters using sepal data
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
	ylab = 'Sepal witdth')
	


	# Getting the clusters in all the data
	kmeans = kmeans(x = dataset, centers = 3)
	y_clusters = kmeans$cluster
	# Visualizing the clusters using all data
	# install.packages('cluster')
	set.seed(12)
	library(cluster)
	clusplot(dataset,
	y_clusters,
	lines = 0,
	shade = TRUE,
	color = TRUE,
	labels = 2,
	plotchar = FALSE,
	span = TRUE,
	main = paste('Clusters of Iris'),
	xlab = 'x label',
	ylab = 'y label')
