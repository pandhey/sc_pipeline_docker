#!/bin/bash

cd {{ AnalysisFolder }}


LSF_DOCKER_PRESERVE_ENVIRONMENT=false bsub -q research-hpc \
     -J analysis.stg -n 5 -M 60000000 -o analysis.string.out \
     -e analysis.string.err -R 'select[mem>60000] rusage[mem=60000]' \
     -a "docker(psandhey/seurat_docker)" /bin/bash -c "Rscript analysis.R"
