#!/bin/bash
#SBATCH -J MonteCarlo
#SBATCH -A cs475-575
#SBATCH -p class
#SBATCH --gres=gpu:1
#SBATCH -o p5.out
#SBATCH -e p5.err
#SBATCH --mail-type=END
#SBATCH --mail-user=liuchenx@oregonstate.edu
for trial in 16384 32768 65536 131072 262144 524288 1048576
do
	for block_size in 16 32 64 128
	do
		/usr/local/apps/cuda/cuda-10.1/bin/nvcc -DBLOCKSIZE=${block_size} -DNUMTRIALS=${trial} -o p5 p5.cu
		./p5
	done
done
