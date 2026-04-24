#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH -J Trimmomatic_Illumina_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load Trimmomatic/0.39-Java-17 

F1=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/*f1.fq.gz
OUT=/home/elsasu/Genome-Analysis-Project/Data/11_trimmomatic_rna

for k in $F1
do
    BASE=$(basename $k _f1.fq.gz)
    R2=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/${BASE}_r2.fq.gz

    java -jar /sw/arch/eb/software/Trimmomatic/0.39-Java-17/trimmomatic-0.39.jar PE -threads 2 \
    $k $R2 \
    $OUT/${BASE}_f1_trimmed_paired.fq.gz \
    $OUT/${BASE}_f1_trimmed_unpaired.fq.gz \
    $OUT/${BASE}_r2_trimmed_paired.fq.gz \
    $OUT/${BASE}_r2_trimmed_unpaired.fq.gz \
    ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50

done