setwd("C:/Users/zm679xs/Desktop/RBNZ")

library(readxl)

df <- read_excel("housingloans_raw.xlsx", col_types = NULL)

colnames(df) <- df[1,]
df <- df[-1,]

df <- as.data.frame(sapply(df, as.numeric))

df$Year <- as.Date(df$Year, origin = '1899-01-01')

df$`Other Loans` <- df$`M. Total loans (M1+M2+M3)` - df$`M2. Total housing loans (M2.1+M2.2+M2.3)` - df$`M3. Student loans`

#colnames(df) <- c("Year", "Total Household Financial Assets" , "Total Housing Loans", "Total Houshold Liabilities" ,"Other Liabilities", "Remaining")
library(reshape2)

df <- melt(df, id = c("Year", "Population"))
colnames(df) <- c("Year", "Population", "Type of Finances","Amount")

write.csv(df, "Housing_loans.csv")
