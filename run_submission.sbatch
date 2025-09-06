#!/bin/bash
#SBATCH --job-name=l2rpn_test          # Job name
#SBATCH --partition cpu                #Partition
#SBATCH --nodes=1                      # Number of nodes
#SBATCH --ntasks=1                     # Number of tasks
#SBATCH --cpus-per-task=4              # Number of CPUs
#SBATCH --mem=16G                      # Memory
#SBATCH --output=slurm-%j.out          # Output log file

# Load Pyxis/Enroot if necessary
module load pyxis enroot

# Start container with mounts and run script inside it
srun --container-name=pyxis_l2rpn \
     --container-image=docker://bdonnot/l2rpn:wcci.2022.1 \
     --container-mounts=/home/ka/ka_iai/ka_jp7970/maze_project/starting_kit:/starting_kit,\
/home/ka/ka_iai/ka_jp7970/maze_project/maze-l2rpn-2022-submission:/submission \
     --container-writable \
     --container-remap-root \
     bash -c "python /submission/submission/check_your_submission.py --model_dir /submission/submission"
