#!/bin/bash
#SBATCH --job-name=primes_paralelo
#SBATCH --partition=hpc-bio-mendel
#SBATCH --chdir=/home/alumno25/lab-py-advan
#SBATCH --output=salida-primes-%j.out
#SBATCH --error=error-primes-%j.err
#SBATCH --ntasks=1


module load anaconda/2025.06

echo "Ejecutando con $1 elementos"


export OMP_NUM_THREADS=1
echo "1 nucleo:"
ipython primes-par-alumno25.ipynb $1

export OMP_NUM_THREADS=2
echo ""
echo "2 nucleos:"
ipython primes-par-alumno25.ipynb $1

export OMP_NUM_THREADS=4
echo ""
echo "4 nucleos:"
ipython primes-par-alumno25.ipynb $1


export OMP_NUM_THREADS=8
echo ""
echo "8 nucleos:"
ipython primes-par-alumno25.ipynb $1

module purge

