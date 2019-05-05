library(Seurat)
library(dplyr)
library(Matrix)


load("whole_object.Robj")
cluster.averages <- AverageExpression(object = whole)

write.table(cluster.averages, "clusters.tsv", sep="\t", quote=F, col.names=NA)
