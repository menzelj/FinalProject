library(dplyr)

# makes files readible by R
# files have been grouped into homozygous deletions, heterozygous deletions, and ampfications

homo_early <- read.table("homo_early.bed")
homo_early$num <- c(1)
homo_late <- read.table("homo_late.bed")
homo_late$num <- c(1)
het_early <- read.table("het_early.bed")
het_early$num <- c(1)
het_late <- read.table("homo_late.bed")
het_late$num <- c(1)
amp_early <- read.table("amp_early.bed")
amp_early$num <- c(1)
amp_late <- read.table("amp_late.bed")
amp_late$num <- c(1)



# makes histograms of distances  


### Homozygous
hist(homo_early$V1, main="Homo-deletion Distances to Early Replication Region", col="green", xlab = "Distances", ylim = c(0,30))
hist(homo_late$V1, main="Homo-deletion Distances to Late Replication Region", col="red", xlab = "Distances", ylim = c(0,30))

# Homo statistical tests 
wilcox.test(homo_early$V1, homo_late$V1)
# W = cannot compute exact p-value with ties
t.test(homo_early$V1, homo_late$V1)
# t = -0.7745, df = 9.4794, p-value = 0.4575



### heterozygous
hist(het_early$V1, main="Het-deletion Distances to Early Replication Region", col="green", xlab = "Distances", ylim = c(0,30))
hist(het_late$V1, main="Het-deletion Distances to late Replication Region", col="red", xlab = "Distances", ylim = c(0,30))

# Het statistical tests 
wilcox.test(het_early$V1, het_late$V1)
# W = 240, p-value = 0.4924
t.test(het_early$V1, het_late$V1)
# t = 0.11266, df = 8.6705, p-value = 0.9129



### Amplification
hist(amp_early$V1, main="Amplification Distances to Early Replication Region", col="green", xlab = "Distances", ylim = c(0,30))
hist(amp_late$V1, main="Amplification Distances to Late Replication Region", col="red", xlab = "Distances", ylim = c(0,30))

# Amp statistical tests 
wilcox.test(amp_early$V1, amp_late$V1)
# cannot compute exact p-value with ties
t.test(amp_early$V1, amp_late$V1)
# t = -1.1105, df = 44.996, p-value = 0.2727





