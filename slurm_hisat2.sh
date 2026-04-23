#!/bin/bash
##########################################################################
## A script template for submitting batch jobs. To submit a batch job, 
## please type
##
##    sbatch script_name.sh
##
## Please note that anything after the characters "#SBATCH" on a line
## will be treated as a Slurm option.
##########################################################################

## Specify a partition. Check available partitions using sinfo Slurm command.
#SBATCH --partition=long

## The following line will send an email notification to your registered email
## address when the job ends or fails.
#SBATCH --mail-type=END,FAIL

## Specify the amount of memory that your job needs. This is for the whole job.
## Asking for much more memory than needed will mean that it takes longer to
## start when the cluster is busy.
#SBATCH --mem=20G

## Specify the number of CPU cores that your job can use. This is only relevant for
## jobs which are able to take advantage of additional CPU cores. Asking for more
## cores than your job can use will mean that it takes longer to start when the
## cluster is busy.
#SBATCH --ntasks=8

## Specify the maximum amount of time that your job will need to run. Asking for
## the correct amount of time can help to get your job to start quicker. Time is
## specified as DAYS-HOURS:MINUTES:SECONDS. This example is one hour.
#SBATCH --time=0-01:00:00

## Provide file name (files will be saved in directory where job was ran) or path
## to capture the terminal output and save any error messages. This is very useful
## if you have problems and need to ask for help.
#SBATCH --output=%j_%x.out
#SBATCH --error=%j_%x.err

## ################### CODE TO RUN ##########################
# Load modules (if required - e.g. when not using conda) 
# module load R-base/4.3.0

# Execute these commands 

#fastqc  --nogroup --threads 1 --extract -o /path/to/my_output_directory /path/to/my/sample_1.fastq.gz
hisat2 --threads 8 \
	-x /project/shared/linux/5_rnaseq/hisat2_index/grcm39 \
	-1 /project/quee3379/linux/2_rnaseq/1_fastq/cd8_rep1_read1.fastq.gz \
	-2 /project/quee3379/linux/2_rnaseq/1_fastq/cd8_rep1_read2.fastq.gz \
	--rna-strandness RF \
	--summary-file /project/quee3379/linux/2_rnaseq/3_analysis/cd8_rep1_stats.txt \
	-S /project/quee3379/linux/2_rnaseq/3_analysis/cd8_rep1.sam
