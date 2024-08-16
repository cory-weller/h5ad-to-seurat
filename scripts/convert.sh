#!/usr/bin/env bash
#SBATCH --nodes 1
#SBATCH --time 2:59:00
#SBATCH --mem 250G
#SBATCH --cpus-per-task 4
#SBATCH --partition quick,norm

source myconda

mamba activate bpcells/

Rscript scripts/convert.R
