module purge
module load biocontainers/default
module load qiime2/2024.10

cd "/scratch/bell/mart2776/RawMartinez - Phosphate Cycling Project"

echo "sample-id,absolute-filepath,direction" > manifest_long.csv

for f in raw/*.R1.fq.gz; do
    sample=$(basename "$f" | sed 's/\.R1\.fq\.gz//')
    echo "${sample},$(pwd)/raw/${sample}.R1.fq.gz,forward" >> manifest_long.csv
    echo "${sample},$(pwd)/raw/${sample}.R2.fq.gz,reverse" >> manifest_long.csv
done

qiime tools import \
  --type 'SampleData[PairedEndSequencesWithQuality]' \
  --input-path manifest_long.csv \
  --output-path demux.qza \
  --input-format PairedEndFastqManifestPhred33

qiime demux summarize \
  --i-data demux.qza \
  --o-visualization demux.qzv

