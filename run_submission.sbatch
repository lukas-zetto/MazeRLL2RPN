#!/bin/bash
#SBATCH --job-name=l2rpn_test          # Job name
#SBATCH --partition=cpu                # Partition
#SBATCH --nodes=1                      # Number of nodes
#SBATCH --time=8:00:00                 # Walltime
#SBATCH --ntasks=1                     # Number of tasks
#SBATCH --cpus-per-task=4              # Number of CPUs
#SBATCH --mem=16G                      # Memory
#SBATCH --output=slurm-%j.out          # Output log file

# Run inside container with mounted folders
enroot start --rw \
    -m /home/ka/ka_iai/ka_jp7970/maze_project/starting_kit:/starting_kit \
    -m /home/ka/ka_iai/ka_jp7970/maze_project/maze-l2rpn-2022-submission:/submission \
    l2rpn \
    bash -c "cd /starting_kit/L2RPN_wcci2022_starting_kit && python check_your_submission.py --model_dir /submission/submission"
