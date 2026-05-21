#Install DESeq2
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("DESeq2")

library(DESeq2)

#set working directory
setwd("C:/Users/46769/OneDrive - Uppsala universitet/Year 4/Genomanalys/Project_data")

getwd()

#Get the count data
counts <- read.table ("counts.txt", header = TRUE, sep = "\t", comment.char = "#", row.names = 1)

#remove unimportant columns and rename the ones left:
counts <- counts[, -(1:5)]
colnames(counts) <- c("Control_1", "Control_2", 
                      "Control_3", "Heat_treated_42_12h_1", 
                      "Heat_treated_42_12h_2", "Heat_treated_42_12h_3")
#Metadata for the different samples
meta_data = data.frame(
  row.names = colnames(counts),
  condition = c("Control", "Control", "Control",
                "Treated", "Treated", "Treated"))

#Create a DESeq2 dataset:
dds <- DESeqDataSetFromMatrix( 
  countData = counts, colData = meta_data,
  design = ~ condition
)

#Filter the dataset:
dds <- dds[rowSums(counts(dds)) > 10, ]

#Run DESeq2
dds <- DESeq(dds)

#Extract results
res <- results(dds)

head(res)

write.csv(as.data.frame(res), "DE_genes.csv")
