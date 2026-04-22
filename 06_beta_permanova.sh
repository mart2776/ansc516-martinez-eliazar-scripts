module purge
module load biocontainers/default
module load qiime2/2024.10

cd "/scratch/bell/mart2776/RawMartinez - Phosphate Cycling Project"

# Bray-Curtis PERMANOVA by crop- Corn and soy
qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file PSB.meta.data.Martinez.qiime.tsv \
  --m-metadata-column crop \
  --p-method permanova \
  --o-visualization core-metrics-results/bray_curtis_crop_permanova.qzv

# Bray-Curtis PERMANOVA by bag type - 1, 45, 1000 and none
qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file PSB.meta.data.Martinez.qiime.tsv \
  --m-metadata-column bag \
  --p-method permanova \
  --o-visualization core-metrics-results/bray_curtis_bag_permanova.qzv

# Bray-Curtis PERMANOVA by farm.type- Conventional vs. Conservation
qiime diversity beta-group-significance \
  --i-distance-matrix core-metrics-results/bray_curtis_distance_matrix.qza \
  --m-metadata-file PSB.meta.data.Martinez.qiime.tsv \
  --m-metadata-column farm.type \
  --p-method permanova \
  --o-visualization core-metrics-results/bray_curtis_farmtype_permanova.qzv
