

AQR <- Adjusted_Data %>%
  filter(
    Net_Asst_2019_AVG != 0 &
      Index..Fund != "Yes" &
      !is.na(Annual.Report..Net.Expense..Ratio..Year2019) &
      Firm.Name == "AQR Funds"
  ) %>%
  group_by(Firm.Name) %>%
  mutate(
    Count = n(),
    Sum_Assets_2019 = sum(Net_Asst_2019_AVG, na.rm = TRUE)
  ) %>%
  summarise(
    Count = n(),
    Sum_Assts_Wted_2017 = sum(Asst_By_Fee_2017, na.rm = TRUE),
    Sum_Assets_2017 = sum(Net_Asst_2017_AVG, na.rm = TRUE),
    Fee_Wted_2017 = Sum_Assts_Wted_2017 / Sum_Assets_2017,
    Sum_Assts_Wted_2018 = sum(Asst_By_Fee_2018, na.rm = TRUE),
    Sum_Assets_2018 = sum(Net_Asst_2018_AVG, na.rm = TRUE),
    Fee_Wted_2018 = Sum_Assts_Wted_2018 / Sum_Assets_2018,
    Sum_Assts_Wted_2019 = sum(Asst_By_Fee_2019, na.rm = TRUE),
    Sum_Assets_2019 = sum(Net_Asst_2019_AVG, na.rm = TRUE),
    Fee_Wted_2019 = Sum_Assts_Wted_2019 / Sum_Assets_2019
  )
