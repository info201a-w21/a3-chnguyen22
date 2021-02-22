library(tidyverse)

incarceration_trends <- read.csv("incarceration_trends.csv")
incarceration_trends_jurisdiction <- read.csv("incarceration_trends_jail_jurisdiction.csv")

incarceration_trends <- incarceration_trends %>%
  mutate(aapi_ratio = aapi_jail_pop/aapi_pop_15to64, na.rm = T)

recent_aapi_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(aapi_ratio)

incarceration_trends <- incarceration_trends %>%
  mutate(white_ratio = white_jail_pop/white_pop_15to64, na.rm = T)

recent_white_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(white_ratio)
  
incarceration_trends <- incarceration_trends %>%
  mutate(black_ratio = black_jail_pop/black_pop_15to64, na.rm = T)

recent_black_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(black_ratio)  
  
incarceration_trends <- incarceration_trends %>%
  mutate(latinx_ratio = latinx_jail_pop/latinx_pop_15to64, na.rm = T)

recent_latinx_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(latinx_ratio)  

incarceration_trends <- incarceration_trends %>%
  mutate(native_ratio = native_jail_pop/native_pop_15to64, na.rm = T)

recent_native_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(native_ratio)  




  highest_divsion <- incarceration_trends %>%
  filter(division == max(division, na.rm = T)) %>%
  pull(division)

aapi_men_pop <- incarceration_trends %>%
  filter()

highest_area <- incarceration_trends %>%
  group_by(V15) %>%
  filter(V15 == max(V15)) %>%
  pull(V15)

