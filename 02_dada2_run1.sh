module purge
module load biocontainers/default
module load qiime2/2024.10

cd "/scratch/bell/mart2776/RawMartinez - Phosphate Cycling Project"

qiime dada2 denoise-paired \
  --i-demultiplexed-seqs demux.qza \
  --p-trim-left-f 0 \
  --p-trim-left-r 0 \
  --p-trunc-len-f 150 \
  --p-trunc-len-r 145 \
  --o-table table_run1.qza \
  --o-representative-sequences rep_seqs_run1.qza \
  --o-denoising-stats stats-dada2_run1.qza

# Visualizations

qiime feature-table summarize \
  --i-table table_run1.qza \
  --o-visualization table_run1.qzv \
  --m-sample-metadata-file PSB.meta.data.Martinez.qiime.tsv

qiime feature-table tabulate-seqs \
  --i-data rep_seqs_run1.qza \
  --o-visualization rep_seqs_run1.qzv

qiime metadata tabulate \
  --m-input-file stats-dada2_run1.qza \
  --o-visualization stats-dada2_run1.qzv
