# Read in data

reef_fish <- read.csv("Data/Supplemental201.csv")
View(reef_fish)

# Isolate useful columns

library(tidyverse)

reef_fish_bootless <- select(reef_fish, Genus, species, Bootless, Museum.Bootless, Fished)
View(reef_fish_bootless)

# Make tables of fished and not fished species at both locations

reef_fish_bootless_fished <- filter(reef_fish_bootless, Fished == "fished" | Fished == "Fished")
View(reef_fish_bootless_fished)

reef_fish_bootless_notfished <- filter(reef_fish_bootless, Fished == "not fished")
View(reef_fish_bootless_notfished)

# count fish at each site based on genus, listing number of species

reef_fish_bootless_sp <- group_by(reef_fish_bootless, Genus) %>%
  summarise(
    bootless = sum(Bootless),
    Museum.Bootless = sum(Museum.Bootless),
    n_species = n()) %>% 
View(reef_fish_bootless_sp)

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