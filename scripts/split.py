import scanpy as sc
import anndata as ad
import gc
import sys

adobj = sys.argv[1]
half = sys.argv[2]


o = sc.read_h5ad(adobj)



# Full object
split_start = 0
split_half = int(len(o)/2.0)
split_end = len(o)

if half == '1':
    subset = o[split_start:split_half,].to_memory()
    subset.write_h5ad('data/first.h5ad', compression=None)
    subset.obs.to_csv('data/first.obs.csv')
elif half == '2':
    subset = o[split_half:split_end+1,].to_memory()
    subset.write_h5ad('data/second.h5ad', compression=None)
    subset.obs.to_csv('data/second.obs.csv')

