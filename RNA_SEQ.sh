#!/bin/bash

SECONDS=0

# change working directory
#cd /Users/kr/Desktop/demo/RNASeq_pipeline/



# STEP 1: Run fastqc
#fastqc data/demo.fastq -o data/


# run trimmomatic to trim reads with poor quality
#java -jar ~/Desktop/demo/tools/Trimmomatic-0.39/trimmomatic-0.39.jar SE -threads 4 data/demo.fastq data/demo_trimmed.fastq TRAILING:10 -phred33
#echo "Trimmomatic finished running!"

#fastqc data/demo_trimmed.fastq -o data/


# STEP 2: Run HISAT2
# mkdir HISAT2
# get the genome indices
# wget https://genome-idx.s3.amazonaws.com/hisat/grch38_genome.tar.gz


# run alignment
#/Users/hetvichudasama/Documents/RNA_SEQ_Project/hisat2-2.2.1/hisat2 -q --rna-strandness R -x /Users/hetvichudasama/Documents/RNA_SEQ_Project/grch38/genome -U /Users/hetvichudasama/Documents/RNA_SEQ_Project/Data/demo_trimmed.fastq | /opt/homebrew/bin/samtools sort -o /Users/hetvichudasama/Documents/RNA_SEQ_Project/Data/demo_trimmed.bam
#echo "HISAT2 finished running!"


# get gtf
#wget http://ftp.ensembl.org/pub/release-106/gtf/homo_sapiens/Homo_sapiens.GRCh38.106.gtf.gz
featureCounts -S 2 -a /Users/hetvichudasama/Documents/RNA_SEQ_Project/Script/Homo_sapiens.GRCh38.106.gtf -o /Users/hetvichudasama/Documents/RNA_SEQ_Project/Data/demo_featurecounts.txt /Users/hetvichudasama/Documents/RNA_SEQ_Project/Data/demo_trimmed.bam
echo "featureCounts finished running!"

cat demo_featurecounts.txt| cut -f1, 7 |less

duration=$SECONDS
echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."



