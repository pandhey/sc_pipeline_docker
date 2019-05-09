
dataFolder <- "{{ PathToAligned }}"

dataFolders <- list()
{% for SampleId in SampleIds %}
dataFolders[[{{ loop.index }}]] <- paste(dataFolder,"/{{ SampleId }}/outs/filtered_feature_bc_matrix", sep="")
{% endfor %}

fdata <- list()
{% for SampleName in SampleNames %}
fdata[[{{ loop.index }}]] <- Read10X(dataFolders[[{{ loop.index }}]])
{% endfor %}

whole <- list()
{% for SampleName in SampleNames %}
whole[[{{ loop.index }}]] <- CreateSeuratObject(counts=fdata[[{{ loop.index }}]], project = "{{ SampleName }}")
{% endfor %}

#merge all samples
whole <- merge(x=whole[[1]], y=list(whole[[2]]{% for i in range(3, SampleIds|length + 1) %}, whole[[{{i}}]]{% endfor %}), add.cell.ids = c("{{ SampleNames[0] }}" {% for i in ( SampleNames[1:]) %}, "{{i}}"{% endfor %} ))

