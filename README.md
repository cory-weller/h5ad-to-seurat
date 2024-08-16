# Converting big anndatas!

Create conversion (anndata) environment
```bash
mamba create -p envs/convert 'scanpy' 'anndata'
```


Create Seurat5 + BPCells environment
```bash
source myconda
mamba create -p envs/bpcells 'r-seurat>=5' 'r-remotes' 'hdf5'
mamba activate envs/bpcells/
Rscript -e 'remotes::install_github("bnprks/BPCells/r")'
```

Submit jobs (takes ~220 GB of memory for my 22 GB h5ad object)

```bash
sbatch scripts/split.sh data/04_ad-ftd_anndata_object.h5ad
sbatch scripts/convert.sh
```