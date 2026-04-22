module purge
module load biocontainers/default
module load qiime2/2024.10

cd "/scratch/bell/mart2776/RawMartinez - Phosphate Cycling Project"

qiime diversity core-metrics-phylogenetic \
  --i-phylogeny rooted-tree.qza \
  --i-table table_run1.qza \
  --p-sampling-depth 20000 \
  --m-metadata-file PSB.meta.data.Martinez.qiime.tsv \
  --output-dir core-metrics-results

