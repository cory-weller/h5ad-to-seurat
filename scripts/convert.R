#!/usr/bin/env Rscript

library(BPCells)
library(Seurat)
library(SeuratObject)
# library(SeuratDisk)
# library(SeuratData)
# library(Azimuth)



file.dir <- "data/"
files.set <- c("first.h5ad", "second.h5ad")

# Loop through h5ad files and output BPCells matrices on-disk
data.list <- c()
metadata.list <- c()


for (i in 1:length(files.set)) {
  path <- paste0(file.dir, files.set[i])
  obs_path <- gsub('.h5ad', '.obs.csv', path)
  data <- open_matrix_anndata_hdf5(path)
   write_matrix_dir(
     mat = data,
     dir = paste0(gsub(".h5ad", "", path), "_BP")
   )
  # Load in BP matrices
  mat <- open_matrix_dir(dir = paste0(gsub(".h5ad", "", path), "_BP"))
  # Get metadata
  #metadata.list[[i]] <- LoadH5ADobs(path = path)
  metadata.list[[i]] <- read.csv(obs_path)

  data.list[[i]] <- mat
}

# Name layers
names(data.list) <- c("part1", "part2")

metadata <- Reduce(rbind, metadata.list)


merged.object <- CreateSeuratObject(counts = data.list, meta.data = metadata)
merged.object <- JoinLayers(merged.object)

saveRDS(merged.object, file='data/merged.RDS')
