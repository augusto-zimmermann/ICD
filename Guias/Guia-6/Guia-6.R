library(nycflights13)
library(tidyverse)

library(dplyr)
library(lubridate)

?flights
data <- flights

data(weather)
glimpse(weather)

view(flights)
view(weather)

# Filter for rows where the hour is exactly 3 AM
df_filtered <- weather %>%
  filter(hour(time_hour) == 18) %>%
  filter(origin == "LGA")

view(df_filtered)

vuelos_filtrados <- flights %>%
  group_by(carrier) %>%
  summarise(total_vuelos = n()) %>%
  filter(total_vuelos > 1000) %>%
  filter(time_hour = )
  filter(origin == "LGA") %>%
  ungroup()

view(vuelos_filtrados)