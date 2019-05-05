#!/bin/bash


module load R
path=$1

R -e "stats <- read.csv(\"$1\");print(stats[, c(4, 1, 3, 20)])"

