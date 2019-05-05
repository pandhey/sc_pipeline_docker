mito.genes <- c(grep("^MT-", rownames(x = whole), value = T),
                grep("^mt-", rownames(x = whole), value = T))
percent.mito <- Matrix::colSums(x = GetAssayData(object = whole, slot = 'counts')[mito.genes, ]) / Matrix::colSums(x = GetAssayData(object = whole, slot = 'counts'))
whole[['percent.mito']] <- percent.mito

{% if FilterMito %}
whole <- subset(x = whole, subset = percent.mito <= {{ FilterMitoPercent }})
{% endif %}
whole <- NormalizeData(object = whole, normalization.method = "LogNormalize", scale.factor = 10000)
whole <- FindVariableFeatures(object = whole, selection.method = 'mean.var.plot', mean.cutoff = c(0.0125, 3), dispersion.cutoff = c(0.5, Inf))
{% if RegressMito and RegressUmi %}
whole <- ScaleData(object = whole, features = VariableFeatures(object = whole), vars.to.regress = c("nCount_RNA", "percent.mito"))
{% elif RegressMito %}
whole <- ScaleData(object = whole, features = VariableFeatures(object = whole), vars.to.regress = c("percent.mito"))
{% elif RegressUmi %}
whole <- ScaleData(object = whole, features = VariableFeatures(object = whole), vars.to.regress = c("nCount_RNA"))
{% endif %}
gc()
