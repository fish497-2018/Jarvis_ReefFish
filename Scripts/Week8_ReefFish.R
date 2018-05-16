# Read in data

reef_fish <- read.csv("Data/Supplemental201.csv")
View(reef_fish)

# Isolate useful columns

library(tidyverse)

reef_fish_bootless <- select(reef_fish, Genus, species, Bootless, Museum.Bootless, Fished)
View(reef_fish_bootless)




#count fish at each site based on genus, listing number of species
group_by(reef_fish_bootless, Genus) %>%
  summarise(
    bootless = sum(Bootless),
    Museum.Bootless = sum(Museum.Bootless),
    n_species = n())


