#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 30:00:00
#SBATCH -J polishing_assembly_pilon
#SBATCH --mem=16GB
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err


#modules
module load Pilon/1.24-Java-17

REF=/home/elsasu/Genome-Analysis-Project/Data/04_Flye/assembly.fasta
ALIGNED_READS=/home/elsasu/Genome-Analysis-Project/Data/05_mapping_BWA/chr3_bwa_aligned_reads.bam
OUT=/home/elsasu/Genome-Analysis-Project/Data/06_Pilon_polish


#commands
java -Xmx8G -jar $EBROOTPILON/pilon.jar \
--genome $REF \
--bam $ALIGNED_READS \
--output pilon_assembly \
--outdir $OUT \
--threads 2  