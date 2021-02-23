library(tidyverse)

incarceration_trends <- read.csv("incarceration_trends.csv")
incarceration_trends_jurisdiction <- read.csv("incarceration_trends_jail_jurisdiction.csv")

incarceration_trends <- incarceration_trends %>%
  mutate(aapi_ratio = aapi_jail_pop/aapi_pop_15to64, na.rm = T)

analysis <- list(incarceration_trends)
analysis$recent_aapi_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(aapi_ratio)

incarceration_trends <- incarceration_trends %>%
  mutate(white_ratio = white_jail_pop/white_pop_15to64, na.rm = T)

analysis$recent_white_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(white_ratio)
  
incarceration_trends <- incarceration_trends %>%
  mutate(black_ratio = black_jail_pop/black_pop_15to64, na.rm = T)

analysis$recent_black_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(black_ratio)  
  
incarceration_trends <- incarceration_trends %>%
  mutate(latinx_ratio = latinx_jail_pop/latinx_pop_15to64, na.rm = T)

analysis$recent_latinx_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(latinx_ratio)  

incarceration_trends <- incarceration_trends %>%
  mutate(native_ratio = native_jail_pop/native_pop_15to64, na.rm = T)

analysis$recent_native_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(native_ratio)  



incarceration_trends <- incarceration_trends %>%
  mutate(aapi_of_jail_pop = aapi_jail_pop/total_jail_pop, na.rm = T)

incarceration_trends <- incarceration_trends %>%
  mutate(black_of_jail_pop = black_jail_pop/total_jail_pop, na.rm = T)

incarceration_trends <- incarceration_trends %>%
  mutate(latinx_of_jail_pop = latinx_jail_pop/total_jail_pop, na.rm = T)

incarceration_trends <- incarceration_trends %>%
  mutate(native_of_jail_pop = native_jail_pop/total_jail_pop, na.rm = T)

incarceration_trends <- incarceration_trends %>%
  mutate(white_of_jail_pop = white_jail_pop/total_jail_pop, na.rm = T)

analysis$recent_ratio_aapi_of_jail_pop <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(aapi_of_jail_pop)  

analysis$recent_ratio_black_of_jail_pop <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(black_of_jail_pop)  

analysis$recent_ratio_latinx_of_jail_pop <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(latinx_of_jail_pop)  

analysis$recent_ratio_native_of_jail_pop <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(native_of_jail_pop)  

analysis$recent_ratio_white_of_jail_pop <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(white_of_jail_pop)  

