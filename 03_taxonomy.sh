module purge
module load biocontainers/default
module load qiime2/2024.10

cd "/scratch/bell/mart2776/RawMartinez - Phosphate Cycling Project"

qiime feature-classifier classify-sklearn \
  --i-classifier silva-classifier-v34.qza \
  --i-reads rep_seqs_run1.qza \
  --o-classification taxonomy.qza

qiime metadata tabulate \
  --m-input-file taxonomy.qza \
  --o-visualization taxonomy.qzv

