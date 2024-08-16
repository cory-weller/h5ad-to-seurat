#!/usr/bin/env bash
#SBATCH --nodes 1
#SBATCH --time 2:00:00
#SBATCH --mem 300G
#SBATCH --cpus-per-task 4
#SBATCH --partition quick,norm

source myconda
mamba deactivate
mamba activate convert/

ANNDATA=${1}

python scripts/split.py ${ANNDATA} 1
python scripts/split.py ${ANNDATA} 2


