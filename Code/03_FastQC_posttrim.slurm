#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:40:00
#SBATCH -J FastQC_Illumina_posttrim
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load FastQC/0.12.1-Java-17


# Your commands
fastqc -o /home/elsasu/Genome-Analysis-Project/Data/03_FastQC_posttrim -t 1 /home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R1_trimmed_paired.fastq.gz /home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R2_trimmed_paired.fastq.gz 
