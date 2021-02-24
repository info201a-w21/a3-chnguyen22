library(tidyverse)
library(maptools)
library(maps)
library(mapproj)
library(patchwork)


national <- read.csv("incarceration_trends.csv")


recent_info <- national %>%
  filter(year == max(year))

county_shapes <- map_data("county") %>%
  unite(polyname, region, subregion, sep = ",") %>%
  left_join(county.fips, by = "polyname")

map_data <- county_shapes %>%
  left_join(recent_info, by = "fips") %>%
  filter(state == "WA")

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(),        # remove axis lines
    axis.text = element_blank(),        # remove axis labels
    axis.ticks = element_blank(),       # remove axis ticks
    axis.title = element_blank(),       # remove axis titles
    plot.background = element_blank(),  # remove gray background
    panel.grid.major = element_blank(), # remove major grid lines
    panel.grid.minor = element_blank(), # remove minor grid lines
    panel.border = element_blank()      # remove border around plot
  )

incar_map <- ggplot(map_data) + 
  geom_polygon(mapping = aes(x = long, y = lat, group = group, fill = total_jail_pop), 
                             color = "gray", size = 0.3) + coord_map() + 
  scale_fill_continuous("Total Jail Population", limits = c(0, max(map_data$total_jail_pop)), 
                        na.value = "white", low = "yellow", high = "red") + blank_theme +
  ggtitle("Incarcerated Populations Across Washington State") +
  theme(plot.title = element_text(size = 15, face = "bold")) 


