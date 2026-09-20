# ============================================
# LIFE EXPECTANCY ANALYSIS (1990-2021)
# Author: Simon Duramps
# ============================================

# --- HOW TO USE THIS SCRIPT -----------------
#
# 1. Install R and RStudio
# 2. Install the "tidyverse" package:
#    install.packages("tidyverse")
# 3. Download the dataset from Kaggle (link in README)
# 4. Place the CSV file in the same folder as this script
# 5. Change the file path below (line "DATA IMPORT")
# 6. Run the script (Ctrl + Shift + Enter)
#
# TO CHANGE THE COUNTRY:
#   - Modify the line "filter(Country == 'Afghanistan')"
#   - Replace "Afghanistan" with any country name from the dataset
#
# TO SEE BOTH PLOTS:
#   - Click the arrows ◀ ▶ in the "Plots" tab (bottom right of RStudio)
#
# ============================================

library(tidyverse)

# --- Data import ----------------------------


#Enter the path to the CSV file (the data) here. 
data <- read_csv("data/life_expectancy.csv")
#[You can find the CSV file containing the data here: https://www.kaggle.com/datasets/iamsouravbanerjee/life-expectancy-at-birth-across-the-globe]


#Example for me :) (Windows) : data <- read_csv("C:/Users/duram/Desktop/Documents_R/Life Expectancy at Birth.csv")



# --------------------------------------------

data <- data %>%
  rename_with(~ str_replace_all(., "\\.", " "))


# --- Plot 1:(defaulting to Afghanistan) --------------------

afg <- data %>%
  filter(Country == "Afghanistan") %>% # <-- replace the name of the country you're interested in here and select 'run' 
  pivot_longer(
    cols = starts_with("Life Expectancy at Birth"),
    names_to = "Year",
    values_to = "Life_Expectancy"
  ) %>%
  mutate(Year = str_extract(Year, "\\d{4}"))

ggplot(afg, aes(x = Year, y = Life_Expectancy, group = 1)) +
  geom_line(color = "steelblue") +
  labs(
    title = "Life Expectancy in Afghanistan (1990-2021)",
    x = "Year",
    y = "Life Expectancy (years)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# --- Plot 2: Country comparison -------------

countries <- data %>%
  filter(Country %in% c("Afghanistan", "France", "China", "United States")) %>% #replace the names of the country you're interested in here and select 'run'  
  pivot_longer(
    cols = starts_with("Life Expectancy at Birth"),
    names_to = "Year",
    values_to = "Life_Expectancy"
  ) %>%
  mutate(Year = str_extract(Year, "\\d{4}"))

ggplot(countries, aes(x = Year, y = Life_Expectancy, color = Country, group = Country)) +
  geom_line(linewidth = 1) +
  labs(
    title = "Life Expectancy Evolution (1990-2021)",
    x = "Year",
    y = "Life Expectancy (years)"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


