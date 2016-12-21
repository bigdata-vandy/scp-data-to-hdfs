#!/bin/bash

#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --mem=1G

#SBATCH --array=1-6
#SBATCH --time=01:02:00

#SBATCH --output=output/slurm_%A_%a.out


SOURCE_PATH=$(awk "NR==$SLURM_ARRAY_TASK_ID { print }" file_list.txt )
BASE=$(basename $SOURCE_PATH)
TARGET_PREFIX="/user/<vunetid>/stack-archives/xml/stackoverflow.com"

#scp -r $SOURCE_PATH abd740:$TARGET_PREFIX/.

scp -r $SOURCE_PATH abd740:/tmp/$BASE

ssh abd740 "hadoop fs -moveFromLocal /tmp/$BASE $TARGET_PREFIX/$BASE" 
