#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 02:00:00
#SBATCH -J FastQC_Illumina_RNA
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load FastQC/0.12.1-Java-17

OUT=/home/elsasu/Genome-Analysis-Project/Data/10_fastqc_rna

C1F=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_f1.fq.gz 
C2F=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_2_f1.fq.gz 
C3F=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_3_f1.fq.gz
C1R=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_r2.fq.gz 
C2R=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_2_r2.fq.gz 
C3R=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_3_r2.fq.gz 

H1F=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_1_f1.fq.gz 
H2F=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_2_f1.fq.gz 
H3F=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_3_f1.fq.gz 
H1R=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_1_r2.fq.gz 
H2R=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_2_r2.fq.gz 
H3R=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Heat_treated_42_12h_3_r2.fq.gz 


# Your commands
fastqc -o $OUT -t 1 $C1F $C1R $C2F $C2R $C3F $C3R $H1F $H1R $H2F $H2R $H3F $H3R
