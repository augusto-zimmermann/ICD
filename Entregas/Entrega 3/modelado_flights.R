library(nycflights13)
library(tidyverse)

# Scatter plot entre arr_delay (eje Y) y dep_delay (eje X) con la recta 1:1 en rojo
ggplot(flights, aes(x = dep_delay, y = arr_delay)) +
  geom_point(alpha = 0.2, color = "#17BEBB") +
  geom_abline(intercept = 0, slope = 1, color = "red", size = 1) +
  labs(
    title = "Relación entre retraso en el despegue y la llegada",
    subtitle = "Dataset nycflights13 (Línea roja: y = x)",
    x = "Retraso en el despegue (dep_delay) en minutos",
    y = "Retraso en la llegada (arr_delay) en minutos"
  ) +
  theme_minimal()

# 1. Ajuste del modelo lineal (arr_delay = a * dep_delay + b)
modelo <- lm(arr_delay ~ dep_delay, data = flights)
summary(modelo)

# 2. Scatter plot con puntos en negro y la recta de ajuste en rojo
ggplot(flights, aes(x = dep_delay, y = arr_delay)) +
  geom_point(color = "black", alpha = 0.2) +
  geom_smooth(method = "lm", color = "red", se = FALSE, size = 1) +
  labs(
    title = "Ajuste lineal: Retraso en la llegada vs. Retraso en el despegue",
    subtitle = "Dataset nycflights13",
    x = "Retraso en el despegue (dep_delay) [minutos]",
    y = "Retraso en la llegada (arr_delay) [minutos]"
  ) +
  theme_minimal()

# Ajuste con month como factor
modelo_mes <- lm(arr_delay ~ dep_delay + factor(month), data = flights)
summary(modelo_mes)

# Ajuste del modelo de regresión con la variable distance
modelo_dist <- lm(arr_delay ~ dep_delay + factor(month) + distance, data = flights)
summary(modelo_dist)

# Unión de flights y planes
vuelos_aviones <- flights %>%
  left_join(planes, by = "tailnum")
head(vuelos_aviones)

# Unión de flights y weather usando left_join
vuelos_clima <- flights %>%
  left_join(weather, by = c("origin", "year", "month", "day", "hour"))
head(vuelos_clima)

# 1. Unir flights y planes para combinar dep_delay con seats
vuelos_asientos <- flights %>%
  left_join(planes, by = "tailnum")
head(vuelos_asientos)

# 2. Visualizar la relación mediante un Scatter Plot / geom_jitter
ggplot(vuelos_asientos, aes(x = seats, y = dep_delay)) +
  geom_jitter(alpha = 0.1, color = "darkslateblue") +
  coord_cartesian(ylim = c(-20, 200)) +
  labs(
    title = "Retraso en la salida vs. Cantidad de asientos del avión",
    x = "Cantidad de asientos (seats)",
    y = "Retraso en la salida (dep_delay) [minutos]"
  ) +
  theme_minimal()
