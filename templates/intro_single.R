
dataFolder <- list.dirs("{{ PathToAligned }}/{{ SampleId }}/outs/filtered_gene_bc_matrices", recursive=F)
fdata <- Read10X(dataFolder)
whole <- CreateSeuratObject(raw.data=fdata, project = "{{ SampleName }}")
