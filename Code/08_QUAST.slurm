#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 1
#SBATCH -t 00:30:00
#SBATCH -J QUAST_eval
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

#modules
module load QUAST/5.3.0-gfbf-2024a

ASSEMBLY=/home/elsasu/Genome-Analysis-Project/Data/06_Pilon_polish/NAME
OUT=/home/elsasu/Genome-Analysis-Project/Data/08_quast

#commands
quast $ASSEMBLY -o $OUT --threads 1
