# Jarvis_ReefFish

Analysis of data comparing the presence and absence of 470 coral reef fish species in 5 dive sites in Papua New Guinea, as well as a historical museum collection from one site (Bootless Bay)

Data source: https://figshare.com/articles/Species_of_coral_reef_fish_considered_in_analysis/4072587

Experimental questions: How have the species present in Bootless Bay changed over time? Does fishing pressure have any relationship to these changes?

Install and load packages "dplyr" and "ggplot2"

# Plan for Data Analysis

1. Use select() to isolate Genus, species, Bootless, Museum.Bootless, and Fished columns

2. Use filter() to create tables of species fished and not fished at Bootless

3. Use group_by() and summarize() to create tables of number of species in each genus 

4. Use filter() to remove rows with no representatives from a Genus from Bootless Bay and Museum.Bootless

5. Use geom_point() to create scatterplots of species present by location vs the total species count for both locations

# Files:

1. Data/Supplemental201.csv -- Data file showing presence or absence of species in 5 Papua New Guinea and a historical museum collection.

2. Scripts/Week8_ReefFishR -- Script of code used to analyze data

3. Figures/Species_Bootless_vs_Museum.jpg -- Species present by location at Bootless Bay (blue) and the Bootless Museum collection (red) versus the total species count

4. Figures/Species_Fished.jpg -- Species present by location at Bootless Bay (blue) and the Bootless Museum collection (red) versus the total species count for only commercially fished species

5. Figures/Species_NotFished.jpg -- Species present by location at Bootless Bay (blue) and the Bootless Museum collection (red) versus the total species count for only unfished species