library(readxl)
library(dplyr)

df <- read_excel("house prices.xlsx")

names(df)[2] <- paste("Districts") 

df$Districts <- as.factor(df$Districts)

Bay_Plenty <- c("Opotiki", "Kawerau", "Western Bay of Plenty", "Whakatane", "Rotorua", "Tauranga", "Greater Tauranga")
Hawke_Bay <- c("Central Hawke's Bay", "Hastings", "Wairoa")
Manawatu <- c("Horowhenua", "Manawatu", "Ruapehu", "Whanganui", "Tararua", "Rangitikei")
Northland <- c("Far North", "Kaipara", "Whangarei", "Wanganui")
Taranaki <- c("New Plymouth", "South Taranaki", "Stratford")
Waikato <- c("Hauraki", "Matamata-Piako", "Waitomo", "Otorohanga", "Taupo", "South Waikato", "Thames-Coromandel", "Waikato", "Waipa")
Wellington <- c("Carterton", "Masterton", "Kapiti Coast", "South Wairarapa", "Upper Hutt", "Lower Hutt", "Porirua", "Wellington", "Greater Wellington")

Canterbury <- c("Ashburton", "Hurunui", "Kaikoura", "Mackenzie", "Selwyn",
                "Timaru", "Waimakariri", "Waimate", "Waitaki")
Otago <- c("Central Otago", "Clutha", "Queenstown-Lakes")
Southland <- c("Southland", "Gore")
West_Coast <- c("Buller", "Westland", "Grey")
Christchurch <- c("Greater Christchurch", "Greater Christchurch UDS", "Christchurch")
Hamilton <- c("Hamilton", "Greater Hamilton")
Nelson <- c("Nelson", "Nelson-Tasman")
Napier <- c("Napier", "Napier-Hastings")

df %>% mutate(Regions = ifelse(Districts %in% Bay_Plenty, "Bay of Plenty", 
                               ifelse(Districts %in% Hawke_Bay, "Hawke's Bay", 
                                      ifelse(Districts %in% Manawatu, "Manawatu-Wanganui", 
                                             ifelse(Districts %in% Northland, "Northland", 
                                                    ifelse(Districts %in% Taranaki, "Taranaki", 
                                                           ifelse(Districts %in% Waikato, "Waikato", 
                                                                  ifelse(Districts %in% Wellington, "Wellington", 
                                                                         ifelse(Districts %in% Canterbury, "Canterbury", 
                                                                                ifelse(Districts %in% Otago, "Otago", 
                                                                                       ifelse(Districts %in% Southland, "Southland", 
                                                                                              ifelse(Districts %in% West_Coast, "West Coast", 
                                                                                                     ifelse(Districts == "Gisborne", "Gisborne",
                                                                                                            ifelse(Districts == "Marlborough", "Marlborough", 
                                                                                                                   ifelse(Districts == "Tasman", "Tasman", 
                                                                                                                          ifelse(Districts == "Auckland", "Auckland", 
                                                                                                                                 ifelse(Districts %in% Hamilton, "Hamilton", 
                                                                                                                                        ifelse(Districts == "New Plymouth", "New Plymouth", 
                                                                                                                                               ifelse(Districts %in% Napier, "Napier", 
                                                                                                                                                      ifelse(Districts == "Hastings", "Hastings", 
                                                                                                                                                             ifelse(Districts == "Palmerston North", "Palmerston North", 
                                                                                                                                                                    ifelse(Districts %in% Nelson, "Nelson", 
                                                                                                                                                                           ifelse(Districts %in% Christchurch, "Christchurch", 
                                                                                                                                                                                  ifelse(Districts == "Timaru", "Timaru", 
                                                                                                                                                                                         ifelse(Districts == "Dunedin", "Dunedin", 
                                                                                                                                                                                                ifelse(Districts == "Invercargill", "Invercargill", NA)))))))))))))))))))))))))) -> df
              
df %>% filter(!is.na(Districts)) -> df

write.csv(df, "House_prices_withDistrict.csv")
