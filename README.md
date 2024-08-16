# Converting big anndatas!
Note that in my case `source myconda` is a script within ${PATH} that initializes conda.

Create conversion (anndata) environment
```bash
mamba create -p envs/convert 'scanpy' 'anndata'
```


Create Seurat5 + BPCells environment
```bash
mamba create -p envs/bpcells 'r-seurat>=5' 'r-remotes' 'hdf5'
mamba activate bpcells/
Rscript -e 'remotes::install_github("bnprks/BPCells/r")'
mamba deactivate
```

Submit jobs (takes ~220 GB of memory for my 22 GB h5ad object)

```bash
sbatch scripts/split.sh data/04_ad-ftd_anndata_object.h5ad
sbatch scripts/convert.sh
```