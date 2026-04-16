#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH -J DNA_mapping_BWA
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.22.1-GCC-13.3.0

REF=/home/elsasu/Genome-Analysis-Project/Data/04_Flye/assembly.fasta
READ1=/home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R1_trimmed_paired.fastq.gz
READ2=/home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R2_trimmed_paired.fastq.gz
OUT=/home/elsasu/Genome-Analysis-Project/Data/05_mapping_BWA/chr3_bwa_aligned_reads.bam

#Index
bwa-mem2 index $REF

#mem
bwa-mem2 mem -t 2 $REF $READ1 $READ2 | samtools view -bS - | samtools sort -o $OUT

samtools index $OUT


