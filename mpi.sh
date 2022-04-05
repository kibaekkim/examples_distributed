#!/bin/bash

#SBATCH --job-name=julia_test
#SBATCH --account=NEXTGENOPT
#SBATCH --partition=bdwall
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=32
#SBATCH --time=00:05:00

# Setup My Environment
export I_MPI_FABRICS=shm:tmi

# Run My Program
srun -n 64 julia --project=. mpi.jl

