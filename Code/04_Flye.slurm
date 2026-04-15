#!/bin/bash
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 55:00:00
#SBATCH -J Flye_nanopore
#SBATCH --mem=45GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load Flye/2.9.6-GCC-13.3.0 


# Your commands
flye \
--nano-raw /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_clean_nanopore.fq.gz \
--out-dir /home/elsasu/Genome-Analysis-Project/Data/04_Flye \
--threads 2

