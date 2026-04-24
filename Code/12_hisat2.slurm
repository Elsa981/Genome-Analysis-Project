#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH -J HISAT2
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load HISAT2/2.2.1-gompi-2024a

REF=/home/elsasu/Genome-Analysis-Project/Data/06_Pilon_polish/pilon_assembly.fasta.masked
IDX=/home/elsasu/Genome-Analysis-Project/Data/12_hisat2_build_index/genome_index
F1=/home/elsasu/Genome-Analysis-Project/Data/11_trimmomatic_rna/*f1_trimmed_paired.fq.gz
OUT=/home/elsasu/Genome-Analysis-Project/Data/12_hisat2_out

hisat2-build $REF $IDX

for k in $F1
do 
    BASE=$(basename $k _f1_trimmed_paired.fq.gz)
    R2=/home/elsasu/Genome-Analysis-Project/Data/11_trimmomatic_rna/${BASE}_r2_trimmed_paired.fq.gz

    cd $OUT
    hisat2 -x $IDX -1 $k -2 $R2 --threads 2 \
    | samtools sort -o $OUT/${BASE}_mapped.bam

    samtools index $OUT/${BASE}_mapped.bam



