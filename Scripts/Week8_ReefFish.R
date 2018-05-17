# Read in data

reef_fish <- read.csv("Data/Supplemental201.csv")
View(reef_fish)

# Isolate useful columns

library(tidyverse)

reef_fish_bootless <- select(reef_fish, Genus, species, Bootless, Museum.Bootless, Fished)
View(reef_fish_bootless)

reef_fish_bootless_fished <- filter(reef_fish_bootless, Fished == "fished" | Fished == "Fished")
View(reef_fish_bootless_fished)

reef_fish_bootless_notfished <- filter(reef_fish_bootless, Fished == "not fished")
View(reef_fish_bootless_notfished)