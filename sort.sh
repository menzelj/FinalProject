#! /usr/bin/env bash


####
#
# This will sort my bed files by chrom and start intervals  
#
####

#library(bedtools)
#library(bedops) 

# sorts cnv file by chrom then by column 2

for i in {1..22}; do

	 cat cnv.bed | grep -w chr${i} | sort -k2n >> sortedcnv.bed
done 
cat cnv.bed | grep -w chrX | sort -k2n >> sortedcnv.bed
cat cnv.bed | grep -w chrY | sort -k2n >> sortedcnv.bed

# sorts early replication file 
for i in {1..22}; do
	cat repstarts.bed | grep -w chr${i} | sort -k2n >> sortedrepstarts.bed
done
cat repstarts.bed | grep -w chrX | sort -k2n >> sortedrepstarts.bed
cat repstarts.bed | grep -w chrY | sort -k2n >> sortedrepstarts.bed

# sorts late replication file
for i in {1..22}; do
	cat repvalleys.bed | grep -w chr${i} | sort -k2n >> sortedrepvalleys.bed
done
cat repvalleys.bed | grep -w chrX | sort -k2n >> sortedrepvalleys.bed
cat repvalleys.bed | grep -w chrY | sort -k2n >> sortedrepvalleys.bed






