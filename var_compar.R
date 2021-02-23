# Second chart that you'll create and include will show how two different continuous
# are related to one another.

library("ggplot2")    
library(tidyverse)
library(dplyr)

incarceration_trends_filtered <- read.csv("incarceration_filtered_for_trends.csv")

var_compar_graph <- ggplot(data = incarceration_trends_filtered) +
  geom_point(mapping = aes(x = latinx_pop_15to64 , y = latinx_jail_pop)) +
  ggtitle("Latinx Population Growth to Latinx Incarceration Population", subtitle = "From 1990 to 2018") +
  xlab('Latinx Population in King County') +
  ylab('Incarcerated Latinx People') +
  theme(plot.title = element_text(size = 15, face = "bold"))

