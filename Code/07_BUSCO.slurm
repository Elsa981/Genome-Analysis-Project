#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J BUSCO_eval
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

#modules
module load BUSCO/5.8.2-gfbf-2024a

ASSEMBLY=/home/elsasu/Genome-Analysis-Project/Data/06_Pilon_polish/pilon_assembly.fasta
OUT=/home/elsasu/Genome-Analysis-Project/Data/07_busco


#commands
busco -i $ASSEMBLY -m genome -c 1 -l embryophyta_odb10 --out_path $OUT -o busco_result