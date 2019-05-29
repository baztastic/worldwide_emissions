## https://informationisbeautiful.net/visualizations/how-to-reduce-the-worlds-carbon-footprint-by-2050/

library(stringr)
library(ggplot2)
raw_sector <- read.csv("energy_by_sector.csv")
raw_totals <- read.csv("total_worldwide_emissions.csv")
sector <- raw_sector
totals <- raw_totals

sector <- setNames(data.frame(sector$Sector, sector$Baseline.Annual.Emissions), c("Sector", "Emissions"))
sector <- sector[2:7,]
rownames(sector) <- 1:6
sector$Emissions <- as.numeric(as.character(sector$Emissions))

totals <- setNames(data.frame(totals$Note..data.from.2012, totals$percent.total.GHGs, totals$GHGs..MtCO2.eq.), c("Sector", "Percent", "Emissions"))
totals$Emissions <- gsub(",", "", as.character(totals$Emissions))
totals$Emissions <- as.numeric(totals$Emissions)
totals$Sector <- gsub("-", "", totals$Sector)
category <- c("Industry", "Industry", "Industry", "Industry", "Industry", "Industry", "Industry", "Industry", "Buildings", "Buildings", "Buildings", "Transport", "Transport", "Transport", "Transport", "Transport", "Agriculture Forestry and Land Use", "Agriculture Forestry and Land Use", "Agriculture Forestry and Land Use", "Agriculture Forestry and Land Use", "Agriculture Forestry and Land Use", "Agriculture Forestry and Land Use", "Landfills and Waste Water", "Landfills and Waste Water", "Landfills and Waste Water", "Other Energy", "Other Energy", "Other Energy", "Other Energy")
totals$Category <- category
totals$Category <- factor(totals$Category)
rem <- c(1, 9, 12, 17, 23, 26)
breakdown <- totals[!(seq(1,29) %in% rem),]
rownames(breakdown) <- seq(1,23)
breakdown$Sector <- str_to_title(breakdown$Sector)
breakdown[breakdown$Sector =="Oil And Gas Extraction. Refining And Processing","Sector"] <- "Oil And Gas Extraction, Refining And Processing"

ggplot(breakdown, aes(reorder(Sector, -Emissions), Percent)) + 
  geom_bar(stat="identity",aes(fill=Category)) + 
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) + 
  geom_text(aes(label=Sector),
            angle=90,
            hjust = 1.1,
            color = "white",
            size = 3,
            fontface="bold")


ggplot(sector, aes(reorder(Sector, -Emissions), Emissions)) + geom_bar(stat="identity",aes(fill=Sector)) + theme(axis.text.x = element_text(angle = 45, hjust = 1))

