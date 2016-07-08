#Cleaning WDI data
library(dplyr)
library(data.table)		#fread() for faster read than read.csv()
library(reshape2)             #Melt()

#Setting working directory
setwd("C://Users//Preet//Desktop//WDI Project//raw data")

#Extracting dataset          #Must extract complete dataset later, below
dat <- fread("WDI_Data.csv", header = TRUE, sep = ",",
		  colClasses = c(rep("character",4),rep("numeric",56)), data.table=FALSE)

#Cleaning up a little
colnames(dat)[5:60] <- gsub("X", "", colnames(dat)[5:60])
dat <- melt(dat)
colnames(dat)[5:6] <- c("Year", "Value")
