#K-Means Clustering

#Importing the dataset
dataset = read.csv('Mall_Customers.csv')
x = dataset[4:5]

#Using the Elbow method to find the optimal number of clusters
#set.seed(6) 
wcss = vector()
for (i in 1:10) wcss[i] = sum(kmeans(x, i)$withinss)
plot(1:10,
     wcss, 
     type = 'b', 
     main = paste('Elbow method'), 
     xlab = "Number of Clusters", 
     ylab = "wcss") 

#optimal number of clusters are 5 from the Elbow method

#Fitting K-Means algorithm to our dataset
kmeans = kmeans(x, 5, iter.max = 10, nstart = 10)
y_kmeans = kmeans$cluster
                                              
#Visualising the clusters
#install('cluster')
library(cluster)
clusplot(x,
         kmeans$cluster,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = 'Annual Income ',
         ylab = 'Spending score')








