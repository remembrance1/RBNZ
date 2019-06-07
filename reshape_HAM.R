setwd("C:/Users/zm679xs/Desktop/RBNZ")

library(readxl)

df <- read_excel("HAM.xlsx")

library(reshape2)

df <- melt(df, id = c("Quarter", "Tenure"))

colnames(df) <- c("Quarter", "Tenure", "Region", "HAM")

write.csv(df, "HAM_Reshaped.csv")
