#Run FastQC on the first pair of reads
fastqc cd8_rep1_read* -o /project/quee3379/linux/2_rnaseq/3_analysis/1_fastqc/
cd ../3_analysis_1_fastqc

#Open new terminal and make a folder to download the html files
cd ./Downloads
mkdir obds
cd ./obds
rsync -avz obds:/project/quee3379/linux/2_rnaseq/3_analysis/1_fastqc/*.html . #this downloads the html files to the current directory '.'

#Update conda 
conda create -f /project/shared/linux/3_conda/obds-rnaseq2.yml
conda activate obds-rnaseq2

#Check alias
alias load_conda
nano ~/.bash_aliases #add 2 to the end of 'obds-rnaseq'

#Run multi-qc
cd /project/quee3379/linux/2_rnaseq/3_analysis/1_fastqc
multiqc . -o ../reports/ 

#Update rna_seqcommands.sh you created previously for uploading to git
nano rna_seqcommands.sh

#update and commit
cp rna_seqcommands.sh /project/quee3379/git/obds_linux
cd /project/quee3379/git/obds_linux
git status
git add rna_seqcommands.sh
git status
git commit
git push


