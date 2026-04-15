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


#Index
bwa-mem2 index referense/genome/assembly/path

#mem
bwa-mem2 mem -t 2 path/to/assembly path/to/illumina/pairdend/reads/trimmed/R1 path/to/illumina/pairdend/reads/trimmed/R2 | \ 
samtools view -bS - | samtools sort -o path/to/output.bam

samtools index path/to/output.bam


