#!/bin/bash
#SBATCH --job-name=snop_gs_join_experiment        # Job name
#SBATCH --output=output.txt           # Standard output file
#SBATCH --error=error.txt             # Standard error file
#SBATCH --account=nexus 
#SBATCH --cpus-per-task=4             # Number of CPU cores per task
#SBATCH --time=24:00:00                # Maximum runtime (D-HH:MM:SS)
#SBATCH --mem=32G
#SBATCH --gres=gpu:rtxa6000                

module load ffmpeg
module load gitlfs

#cuda config
module load cuda/11.8.0

cd /fs/nexus-scratch/bgunduz/matrix/algorithms/Refining-Object-Pose-via-3DGS
source ~/.bashrc
micromamba activate ./.mmamba

sh yp_experiment_joint.sh