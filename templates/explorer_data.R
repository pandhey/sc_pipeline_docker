expData <- GetAssayData(object = whole, slot = 'data')
save(expData, file="expData.Rda")

dataForPlot <- as.data.frame(whole@reductions$tsne@cell.embeddings)
dataForPlot$Sample <- whole@meta.data$orig.ident
dataForPlot$Cluster <-  Idents(object = whole)
dataForPlot$nUmi <- whole@meta.data$nCount_RNA
dataForPlot$nGene <- whole@meta.data$nFeature_RNA
dataForPlot$nUmiLog2 <- log2(whole@meta.data$nCount_RNA)
dataForPlot$nGeneLog2 <- log2(whole@meta.data$nFeature_RNA)

write.table(dataForPlot, "data_for_plot.tsv", sep="\t", quote=F)
