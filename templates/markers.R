whole.markers <- FindAllMarkers(object = whole,
                                only.pos = TRUE,
                                min.pct = 0.10,
                                thresh.use = 0.10)
write.table(whole.markers, "markers.tsv", sep="\t", quote=F, row.names=F)
