module purge
module load biocontainers/default
module load qiime2/2024.10

cd "/scratch/bell/mart2776/RawMartinez - Phosphate Cycling Project"

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences rep_seqs_run1.qza \
  --o-alignment aligned-rep-seqs_run1.qza \
  --o-masked-alignment masked-aligned-rep-seqs_run1.qza \
  --o-tree unrooted-tree_run1.qza \
  --o-rooted-tree rooted-tree.qza
