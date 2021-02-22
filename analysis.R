library(dplyr)

incarceration_trends <- read.csv("incarceration_trends.csv")
incarceration_trends_jurisdiction <- read.csv("incarceration_trends_jail_jurisdiction.csv")

incarceration_trends <- mutate(incarceration_trends, 
                               aapi_ratio = aapi_jail_pop/aapi_pop_15to64)
recent_aapi_ratio <- incarceration_trends %>%
  filter(year == max(year)) %>%
  filter(county_name = "King County")
  pull(total_pop)

highest_divsion <- incarceration_trends %>%
  filter(division == max(division, na.rm = T)) %>%
  pull(division)

aapi_men_pop <- incarceration_trends %>%
  filter()

highest_area <- incarceration_trends %>%
  group_by(V15) %>%
  filter(V15 == max(V15)) %>%
  pull(V15)

