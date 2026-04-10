#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 04:00:00
#SBATCH -J Trimmomatic_Illumina
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

# Load modules
module load Trimmomatic/0.39-Java-17 


# Your commands
java -jar /sw/arch/eb/software/Trimmomatic/0.39-Java-17/trimmomatic-0.39.jar PE -threads 2 \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz \
/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz \
/home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R1_trimmed_paired.fastq.gz \
/home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R1_trimmed_unpaired.fastq.gz \
/home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R2_trimmed_paired.fastq.gz \
/home/elsasu/Genome-Analysis-Project/Data/02_Trimmomatic_out/chr3_illumina_R2_trimmed_unpaired.fastq.gz \
ILLUMINACLIP:/sw/arch/eb/software/Trimmomatic/0.39-Java-17/adapters/TruSeq3-PE.fa:2:30:10 \
LEADING:20 TRAILING:20 SLIDINGWINDOW:4:15 MINLEN:50
