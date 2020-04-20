#Hierarchical Clustering

#Importing the dataset
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

#Importing the mall dataset
dataset = pd.read_csv('Mall_Customers.csv')
x = dataset.iloc[:, [3, 4]].values

#Finding the optimal number of clusters using Dendrodrams
import scipy.cluster.hierarchy as sch
dendrogram = sch.dendrogram(sch.linkage(x, method = 'ward'))
plt.title('Dendrogram')
plt.xlabel('Customers')
plt.ylabel('Euclidean distance')
plt.show()

#Optimal number of clusters are 5 from the plot

#Fitting Hierarchical Clustering to our dataset with 5 clusters
from sklearn.cluster import AgglomerativeClustering
hc = AgglomerativeClustering(n_clusters = 5, affinity = 'euclidean', linkage = 'ward')
y_hc = hc.fit_predict(x)

#Visualising the clusters
plt.scatter(x[y_hc == 0, 0], x[y_hc==0, 1], s = 100, c = 'red', label = 'cluster1')
plt.scatter(x[y_hc == 1, 0], x[y_hc==1, 1], s = 100, c = 'blue', label = 'cluster2')
plt.scatter(x[y_hc == 2, 0], x[y_hc==2, 1], s = 100, c = 'cyan', label = 'cluster3')
plt.scatter(x[y_hc == 3, 0], x[y_hc==3, 1], s = 100, c = 'green', label = 'cluster4')
plt.scatter(x[y_hc == 4, 0], x[y_hc==4, 1], s = 100, c = 'magenta', label = 'cluster5')
plt.title('Cluster of Clients')
plt.xlabel('Annual Income(k$)')
plt.ylabel('Spending Score(1-100)')
plt.legend()
plt.show()  