#!/bin/bash

NAME=$1

export LSF_DOCKER_VOLUMES="/storage1/fs1/martyomov/Active/:/storage1/fs1/martyomov/Active/  /scratch1/fs1/martyomov:/scratch1/fs1/martyomov /home/IDC-ID-63498:/home/IDC-ID-63498"
cd {{ PathToAligned }}


LSF_DOCKER_PRESERVE_ENVIRONMENT=false bsub -q general -G compute-martyomov \
        -J ${NAME}.stg -n 8 -M 64GB -o ${NAME}.string.out \
        -e ${NAME}.string.err -R 'select[mem>64MB] rusage[mem=64GB] span[hosts=1]' \
        -a "docker(psandhey/cellranger)" /bin/bash -c "cellranger count --id=$NAME \
        --transcriptome={{ Genome }} \
        --fastqs={{ PathToFastq }}/${NAME} \
        --nosecondary \
        --localmem=64 \
        --localcores=16"
