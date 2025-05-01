library(tidyverse)
conflict_prefer(dplyr::filter(), dplyr::lag())

read_csv("data/GLB.Ts+dSST.csv",skip= 1, na = "***") %>%
  select(year = Year, t_diff = `J-D`) %>%
  ggplot(aes(x = year , y = t_diff))+ 
  geom_line(aes(color = "1")) + 
  geom_point(fill = "white", aes(color = "1"),shape = 21)+
  scale_x_continuous(breaks = seq(1880,2024,20),expand=c(0,0))+
  scale_y_continuous(limits = c(-0.5,1.5), expand=c(0,0))+
  labs(
    x = "YEAR",
    y = "Temperature anomaly (C)",
    title = "GLOBAL LAND-OCEAN TEMPERATURE INDEX",
    subtitle = "Data Source: NASA's Goddard Institute for Space Studies (GISS).\nCredit: NASA/GISS"
  )+
  geom_smooth(se = FALSE,span = 0.14, aes(color = "2"),size = 0.8)+
  theme_light()+
  theme(
    axis.ticks = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(size = 10, margin = margin(b=8), 
                              color = "red", face = "bold"),
    plot.subtitle = element_text(size = 8, color ="gray")
  )

  