whole <- FindNeighbors(object = whole, dims = 1:{{ Clustering.GraphBased.PcaComponents }})
whole <- FindClusters(object = whole, resolution = {{ Clustering.GraphBased.Resolution }})

DimPlot(object = whole, reduction="tsne")
