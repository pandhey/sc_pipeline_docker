library(Seurat)
library(dplyr)
library(Matrix)

## GATHERING DATA TOGETHER
{% if AnalysisType == "single" %}
    {% include 'intro_single.R' %}
{% elif AnalysisType == "many" %}
    {% include 'intro_merge.R' %}
{% endif %}

## Number of cells before
{% include 'cells_before.R' %}

## NORMALIZATION
{% include 'normalization.R' %}


## PCA
{% include 'pca.R' %}


## TSNE
{% include 'tsne.R' %}


## CLUSTERING
{% include 'clustering.R' %}


## SAVING DATA FOR EXPLORER
{% include 'explorer_data.R' %}


## FINDING ANS SAVING MARKERS
{% include 'markers.R' %}


## SAVING
{% include 'save.R' %}

## Number of cells after
{% include 'cells_after.R' %}


