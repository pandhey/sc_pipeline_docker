dataFolder <- "{{ PathToAligned }}"

dataFolders <- list()
dataFolders[[1]] <- paste(dataFolder,"/{{ SampleId }}/outs/filtered_feature_bc_matrix", recursive=F)

fdata <- list()
fdata[[1]] <- Read10X(dataFolders[[1]])

whole <- CreateSeuratObject(counts=fdata[[1]], project = "{{ SampleName }}")
