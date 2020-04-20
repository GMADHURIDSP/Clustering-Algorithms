#Hierarchical Clustering

#Importing the dataset
dataset = read.csv('Mall_Customers.csv')
x = dataset[4:5]

#Finding optimal number of clusters from the dendrograms
dendrogram = hclust(dist(x, method = 'euclidean'), method = 'ward.D')
plot(dendrogram,
     main = paste('dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distance')
     
#optimal number of clusters are 5 from the dendrogram

#fitting Hierarchical Clustering to the Mall dataset
hc = hclust(dist(x, method = 'euclidean'), method = 'ward.D')
y_hc = cutree(hc, 5)

#Visualising the clusters
#install('cluster')
library(cluster)
clusplot(x,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Clients'),
         xlab = 'Annual Income ',
         ylab = 'Spending score')