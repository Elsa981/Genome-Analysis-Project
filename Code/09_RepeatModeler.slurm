#!/bin/bash 
#SBATCH -A uppmax2026-1-61
#SBATCH -p pelle
#SBATCH -c 2
#SBATCH -t 08:00:00
#SBATCH -J repeatmodeler
#SBATCH --mail-type=ALL
#SBATCH --mail-user elsa.sundh.9566@student.uu.se
#SBATCH -o /home/elsasu/Genome-Analysis-Project/output_slurm/out_%x_%j.out
#SBATCH -e /home/elsasu/Genome-Analysis-Project/error_slurm/err_%x_%j.err

#modules
module load RepeatModeler/2.0.7-foss-2024a
module load RepeatMasker/4.2.1-foss-2024a

ASSEMBLY=/home/elsasu/Genome-Analysis-Project/Data/06_Pilon_polish/NAME
OUT_MODEL=/home/elsasu/Genome-Analysis-Project/Data/09_repeatmodeler
DBNAME=njap_chr3_db
OUT_MASK=/home/elsasu/Genome-Analysis-Project/Data/09_repeatmasker

cd $OUT_MODEL
#commands
#Build database
BuildDatabase -name $DBNAME $ASSEMBLY

#run repeatmodeler
RepeatModeler -database $DBNAME --threads 2

#run repeatmasker
RepeatMasker -xsmall -nolow -lib NAME njap_chr3_db -pa 2 -gff $ASSEMBLY

