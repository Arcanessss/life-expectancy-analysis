# life-expectancy-analysis

Life expectancy analysis (1990-2021) using R and the tidyverse.

**Dataset** :

- *Source*: [Kaggle – Life Expectancy at Birth Across the Globe](https://www.kaggle.com/datasets/iamsouravbanerjee/life-expectancy-at-birth-across-the-globe)
- *Coverage*: 195 countries, 1990–2021
- *Variables*: Country, Continent, Hemisphere, HDI Rank, Life Expectancy per year

**Tools** :

- R (version 4.5.2)
- tidyverse (dplyr, tidyr, ggplot2)

I just imported the CSV dataset, reshaped the data from wide to long format using `pivot_longer()` and visualised life expectancy trends over time with `ggplot2`.

## Author

**Simon Duramps**  
L1 Life Sciences – Université de Pau et des Pays de l'Adour (UPPA)
