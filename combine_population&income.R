setwd("C:/Users/zm679xs/Desktop/RBNZ")

#combine income and population data
library(readxl)

income <- read_excel("Income.xlsx")

colnames(income) <- income[1,]
income <- income[-1,]

source("reshape_population.R")

#left join

combined <- merge(income, df, by=c("Country", "Region", "Year"), all.x = T)
combined <- unique(combined)

write.csv(combined, "combiendincome_population.csv")
