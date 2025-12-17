#!/bin/bash
#SBATCH --job-name=pi_par
#SBATCH --partition=hpc-bio-mendel
#SBATCH --chdir=/home/alumno25/lab-py-advan
#SBATCH --output=salida-pi-%j.out
#SBATCH --error=error-pi-%j.err
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

module load anaconda/2025.06

echo "Ejecutando con $1 trials"

export OMP_NUM_THREADS=1
echo "1 nucleo:"
ipython pi-par-solution-alumno25.ipynb $1

export OMP_NUM_THREADS=2
echo ""
echo "2 nucleos:"
ipython pi-par-solution-alumno25.ipynb $1

export OMP_NUM_THREADS=4
echo ""
echo "4 nucleos:"
ipython pi-par-solution-alumno25.ipynb $1

export OMP_NUM_THREADS=8
echo ""
echo "8 nucleos:"
ipython pi-par-solution-alumno25.ipynb $1

module purge

