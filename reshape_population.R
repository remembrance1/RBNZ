setwd("C:/Users/zm679xs/Desktop/RBNZ")

library(readxl)

df <- read_excel("Population Demographics.xlsx")

library(reshape2)

df <- melt(df, id = c("Country", "Area", "Type"))

colnames(df) <- c("Country", "Region", "Type", "Year", "Population")

write.csv(df, "population_reshaped.csv")
