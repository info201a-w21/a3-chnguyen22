# Ratio of incarcerated racial population over its entire racial population in King County. 
# Plot shows trends over time.

library("ggplot2")    
library(tidyverse)
library(dplyr)

incarceration_trends_filtered <- read.csv("incarceration_filtered_for_trends.csv")

incarceration_trends_filtered <- incarceration_trends_filtered %>%
  mutate(aapi_ratio = aapi_jail_pop/aapi_pop_15to64, na.rm = T)

recent_aapi_ratio <- incarceration_trends_filtered %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(aapi_ratio)

incarceration_trends_filtered <- incarceration_trends_filtered %>%
  mutate(white_ratio = white_jail_pop/white_pop_15to64, na.rm = T)

recent_white_ratio <- incarceration_trends_filtered %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(white_ratio)

incarceration_trends_filtered <- incarceration_trends_filtered %>%
  mutate(black_ratio = black_jail_pop/black_pop_15to64, na.rm = T)

recent_black_ratio <- incarceration_trends_filtered %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(black_ratio)  

incarceration_trends_filtered <- incarceration_trends_filtered %>%
  mutate(latinx_ratio = latinx_jail_pop/latinx_pop_15to64, na.rm = T)

recent_latinx_ratio <- incarceration_trends_filtered %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(latinx_ratio)  

incarceration_trends_filtered <- incarceration_trends_filtered %>%
  mutate(native_ratio = native_jail_pop/native_pop_15to64, na.rm = T)

recent_native_ratio <- incarceration_trends_filtered %>%
  filter(state == "WA") %>%
  filter(county_name == "King County") %>%
  pull(native_ratio)  


trends_graph <- ggplot(data = incarceration_trends_filtered) +
  geom_line(mapping = aes(x = year, y = recent_white_ratio, color = "White Ratio")) + 
                          xlim (1990, 2020) + ylim(0.0, 0.015) +
  geom_line(mapping = aes(x = year, y = recent_latinx_ratio, color = "Latinx Ratio")) +
  geom_line(mapping = aes(x = year, y = recent_native_ratio, color = "Native Ratio")) +
  geom_line(mapping = aes(x = year, y = recent_black_ratio, color = "Black Ratio")) +
  geom_line(mapping = aes(x = year, y = recent_aapi_ratio, color = "AAPI Ratio")) +
  ggtitle("Changes in Incarceration Rates Among Racial Groups", subtitle = "From 1990 to 2018") +
  xlab('Year') +
  ylab('Ratio of Incarcerated Racial Population to Total Racial Population') +
  scale_color_discrete(name = "Ratios") +
  theme(plot.title = element_text(size = 15, face = "bold"))
