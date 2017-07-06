library("readr")
library("dplyr")
library("ggplot2")

medals <- read_csv("medals_recipients.csv")
medals <- medals %>%
  mutate(su = ifelse(year < 1991, "Soviet Union", "Russia")) %>%
  filter(country != "SU" & country != "Russia")

ggplot(medals, aes(x = country, fill = country)) +
  geom_bar() +
  scale_y_continuous(breaks = seq(0,12,2), labels = seq(0,12,2)) +
  facet_grid(su ~ .) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1),
        panel.background = element_rect(fill = "white", colour = "grey50"),
        panel.grid.major.y = element_line(colour = "grey50"),
        panel.grid.major.x = element_blank(),
        plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5)) +
  guides(fill = FALSE) +
  labs(x = "", y = "", colour = "") + 
  ggtitle("Recipients of Lomonosov Medal (by country, domestic excluded)", subtitle = "1967-1989, 1993-2016")
