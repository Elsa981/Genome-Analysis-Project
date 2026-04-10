#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 00:40:00
#SBATCH -J FastQC_Illumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load FastQC/0.12.1-Java-17


# Your commands
fastqc -o /home/elsasu/Genome-Analysis-Project/Data/01_FastQC/Illumina -t 2 /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz

