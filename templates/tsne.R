whole <- RunTSNE(object = whole, dims = 1:{{ PcaComponentsTsne }})
whole <- RunUMAP(object = whole, dims = 1:{{ PcaComponentsTsne }})
