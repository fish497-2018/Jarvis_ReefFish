# Read in data

reef_fish <- read.csv("Data/Supplemental201.csv")
View(reef_fish)

# Isolate useful columns, filter out rows where species were not present at either location

library(tidyverse)

reef_fish_bootless <- select(reef_fish, Genus, species, Bootless, Museum.Bootless, Fished) %>% 
  filter(Bootless > 0 | Museum.Bootless > 0) %>% 
  filter(Bootless < 50) %>% 
  gather(`Museum.Bootless`, `Bootless`, key = "location", value = "catch_code")
View(reef_fish_bootless)

# Make tables of fished and not fished species at both locations, filter out rows where species were not present at either location

reef_fish_bootless_fished <- filter(reef_fish_bootless, Fished == "fished" | Fished == "Fished")
View(reef_fish_bootless_fished)

reef_fish_bootless_notfished <- filter(reef_fish_bootless, Fished == "not fished")
View(reef_fish_bootless_notfished)

# count fish at each site based on genus, listing number of species

reef_fish_bootless_sp <- group_by(reef_fish_bootless, Genus, location) %>%
  summarize(total_catch = sum(catch_code))
View(reef_fish_bootless_sp)

# Same procedure for fished/not fished

bootless_fished_sp <- group_by(reef_fish_bootless_fished, Genus, location) %>% 
  summarise(total_catch = sum(catch_code))
View(bootless_fished_sp)

bootless_notfished_sp <- group_by(reef_fish_bootless_notfished, Genus, location) %>% 
  summarise(total_catch = sum(catch_code))
View(bootless_notfished_sp)

# Graphs of species present by locaion vs total species at each location

ggplot(reef_fish_bootless_sp) +
  geom_histogram(aes(x = total_catch, fill = location), position = "dodge") +
  labs(x = "Species per Genus Present by Location", y = "Frequency") +
  ggtitle("Species Richness in Bootless Bay Over Time")
ggsave("Figures/Species_Bootless_vs_Museum.jpg")

# Same procedure for fished/not fished

ggplot(bootless_fished_sp) +
  geom_histogram(aes(x = total_catch, fill = location), position = "dodge") +
  labs(x = "Species per Genus Present by Location", y = "Frequency") +
  ggtitle("Species Richness in Bootless Bay Over Time: Species Under Fishing Pressure")
ggsave("Figures/Species_Fished.jpg")

ggplot(bootless_notfished_sp) +
  geom_histogram(aes(x = total_catch, fill = location), position = "dodge") +
  labs(x = "Species per Genus Present by Location", y = "Frequency") +
  ggtitle("Species Richness in Bootless Bay Over Time: Species Free from Fishing Pressure")
ggsave("Figures/Species_NotFished.jpg")