library(dplyr)

incarceration_trends <- read.csv("incarceration_trends.csv")
View(incarceration_trends)

highest_division <- incarceration_trends %>%
  group_by(division) %>%
  filter(division == max(division)) %>%
  pull(division)

highest_area <- incarceration_trends %>%
  group_by(V15) %>%
  filter(V15 == max(V15)) %>%
  pull(V15)

View(incarceration_trends_jail_jurisdiction)
View(incarceration_trends)
