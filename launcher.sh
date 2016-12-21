#!/bin/bash

# Simple wrapper to allow file copying to HDFS

# Paths to copy are stored in a file; should be full paths
FILE_LIST=file_list.txt

# Counts the number of lines in the file list
NUM_LINES=$(wc -l $FILE_LIST | cut -d" " -f1)

# Replaces variables in batch_template SLURM directives  with literals
sed -e "s/\${file_list_wc}/$NUM_LINES/" batch_template.txt \
    > batch_job.slurm

# Launches sbatch
sbatch batch_job.slurm
