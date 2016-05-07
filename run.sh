#! /usr/bin/env bash


####
# Investigating if copy number variations (CNVs) are more frequently associated with early or late replicating regions.
  
#
####

# library(bedtools)
# moldule load bedops 

###
# the following uses bedops tool called closest feature to measure distance to closest replication region. 
###

# this will add to each entry in our sorted outcnv.bed file the position and distance to the nearest region in the early replication file outrepstarts.bed, negative distances are downstream positive upstream and zeros are overlapping  

# sorts bed files 
sort-bed cnv.bed > sortedcnv.bed
sort-bed repstarts.bed > sortedrepstarts.bed
sort-bed repvalleys.bed > sortedrepvalleys.bed


# closest early replication signal
closest-features --dist sortedcnv.bed sortedrepstarts.bed > early.bed

# replaces '|' with 'tabs' then prints cnv regions and their distance to nearest replication signal
tr '\|' '\t' < early.bed | awk ' {print $1, $2, $3, $19, $29} ' > earlydist.bed 

# closest late replication signal 
closest-features --dist sortedcnv.bed sortedrepvalleys.bed > late.bed
tr '\|' '\t' < late.bed | awk ' {print $1, $2, $3, $19, $29} ' > latedist.bed

# finds closest feature and makes new file for distances only 
cat earlydist.bed | awk '{ if ($4*-1 < $5) print $0,$4*-1; else print $0,$5; }'| awk '{print $6}' > dist_to_earlyreps.bed
cat latedist.bed | awk '{ if ($4*-1 < $5) print $0, $4*-1; else print $0, $5 }'| awk '{print $6}' > dist_to_latereps.bed







