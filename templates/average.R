cluster.averages <- AverageExpression(object = whole)
write.table(cluster.averages, "clusters.tsv", sep="\t", quote=F, col.names=NA)

