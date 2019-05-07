#!/bin/bash

NAME=$1


cd {{ PathToAligned }}


LSF_DOCKER_PRESERVE_ENVIRONMENT=false bsub -q research-hpc \
        -J ${NAME}.stg -n 8 -M 64000000 -o ${NAME}.string.out \
        -e ${NAME}.string.err -R 'select[mem>64000] rusage[mem=64000]' \
        -a "docker(fbrundu/cellranger)" /bin/bash -c "cellranger count --id=$NAME \
        --transcriptome={{ Genome }} \
        --fastqs={PathToFastq}/${NAME} \
        --nosecondary \
        --localmem=64 \
        --localcores=16"
