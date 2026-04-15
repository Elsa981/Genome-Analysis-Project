#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 30:00:00
#SBATCH -J polishing_assembly_pilon
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err


#modules
module load Pilon/1.24-Java-17

#commands
java -Xmx8G -jar 
