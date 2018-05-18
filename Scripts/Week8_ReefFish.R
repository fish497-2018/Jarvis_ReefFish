# Read in data

reef_fish <- read.csv("Data/Supplemental201.csv")
View(reef_fish)

# Isolate useful columns, filter out rows where species were not present at either location

library(tidyverse)

reef_fish_bootless <- select(reef_fish, Genus, species, Bootless, Museum.Bootless, Fished) %>% 
  filter(Bootless > 0 | Museum.Bootless > 0) %>% 
  filter(Bootless < 50)
View(reef_fish_bootless)

# Make tables of fished and not fished species at both locations, filter out rows where species were not present at either location

reef_fish_bootless_fished <- filter(reef_fish_bootless, Fished == "fished" | Fished == "Fished") %>% 
  filter(Bootless > 0 | Museum.Bootless > 0) %>% 
  filter(Bootless < 50)
View(reef_fish_bootless_fished)

reef_fish_bootless_notfished <- filter(reef_fish_bootless, Fished == "not fished") %>% 
  filter(Bootless > 0 | Museum.Bootless > 0) %>% 
  filter(Bootless < 50)
View(reef_fish_bootless_notfished)

# count fish at each site based on genus, listing number of species

reef_fish_bootless_sp <- group_by(reef_fish_bootless, Genus) %>%
  summarise(
    bootless = sum(Bootless),
    Museum.Bootless = sum(Museum.Bootless),
    n_species = n())
View(reef_fish_bootless_sp)

# Same procedure for fished/not fished

bootless_fished_sp <- group_by(reef_fish_bootless_fished, Genus) %>% 
  summarise(
    bootless = sum(Bootless),
    Museum.Bootless = sum(Museum.Bootless),
    n_species = n())
View(bootless_fished_sp)

bootless_notfished_sp <- group_by(reef_fish_bootless_notfished, Genus) %>% 
  summarise(
    bootless = sum(Bootless),
    Museum.Bootless = sum(Museum.Bootless),
    n_species = n())
View(bootless_notfished_sp)

# Graphs of species present by locaion vs total species at each location

ggplot(reef_fish_bootless_sp) +
  geom_point(aes(x = bootless, y = n_species), color = "blue", size = 3, alpha = 0.4) +
  geom_point(aes(x = Museum.Bootless, y = n_species), color = "red", size = 3, alpha = 0.4) +
  labs(x = "Species Present by Location", y = "Total Species Count")
ggsave("Figures/Species_Bootless_vs_Museum.jpg")

# Same procedure for fished/not fished

ggplot(bootless_fished_sp) +
  geom_point(aes(x = bootless, y = n_species), color = "blue", size = 3, alpha = 0.4) +
  geom_point(aes(x = Museum.Bootless, y = n_species), color = "red", size = 3, alpha = 0.4) +
  labs(x = "Species Present by Location", y = "Total Species Count")
ggsave("Figures/Species_Fished.jpg")

ggplot(bootless_notfished_sp) +
  geom_point(aes(x = bootless, y = n_species), color = "blue", size = 3, alpha = 0.4) +
  geom_point(aes(x = Museum.Bootless, y = n_species), color = "red", size = 3, alpha = 0.4) +
  labs(x = "Species Present by Location", y = "Total Species Count")
ggsave("Figures/Species_NotFished.jpg")