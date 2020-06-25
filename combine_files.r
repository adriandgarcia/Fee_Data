library(tidyverse)
library(lubridate)

READ <- function(FILE, OUTPUT) {
  read_csv(FILE,
           trim_ws = TRUE,
           guess_max = nrow(read_csv(FILE)) -12,
           n_max = nrow(read_csv(FILE)) -12
  )
  }

Data1 <- READ("DATA/MS_Fee_Report_062520_5000.csv")
Data2 <- READ("DATA/MS_Fee_Report_062520_10000.csv")
Data3 <- READ("DATA/MS_Fee_Report_062520_15000.csv")
Data4 <- READ("DATA/MS_Fee_Report_062520_20000.csv")
Data5 <- READ("DATA/MS_Fee_Report_062520_25000.csv")
Data6 <- READ("DATA/MS_Fee_Report_062520_25616.csv")

Full_DATA <- full_join(Data1, Data2) %>%
  full_join(., Data3) %>% 
  full_join(., Data4) %>% 
  full_join(., Data5) %>% 
  full_join(., Data6)


write_csv(Full_DATA, "MS_Fee_Report_062520_Full.csv")

rm(list=c("Data1","Data2","Data3","Data4","Data5","Data6","READ","Full_DATA"))