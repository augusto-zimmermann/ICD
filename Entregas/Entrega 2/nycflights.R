library(nycflights13)
library(tidyverse)
?flights
data <- flights

nrow(flights)
length(flights)
colnames(flights)

unique()

flights$carrier # Extrae la columna individualmente y la devuelve como un vector, no como tabla
flights['carrier']
select(flights, 'carrier')

vuelos_filtrados <- flights %>%
  group_by(carrier) %>%
  summarise(total_vuelos = n()) %>%
  filter(total_vuelos > 1000) %>%
  filter(dest == "LAX") %>%
  ungroup()

view(vuelos_filtrados)
view(data)

vuelos_lax <- flights %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>% 
  filter(dest == "LAX")

view(vuelos_lax)

flights %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>% 
  filter(dest == "LAX") %>% 
  count(carrier, name = "total_vuelos")


# Codigo resuleto
LAX_flights <- flights %>%
  group_by(carrier) %>% 
  filter(n() >= 1000) %>% 
  ungroup() %>%
  filter(dest == 'LAX')

# Grafico

ggplot(LAX_flights, aes(x = carrier, y = dep_delay, color = carrier)) +
  geom_jitter(alpha = 0.3, width = 0.2) +
  geom_boxplot(alpha = 0.6, outlier.shape = NA) +
#  coord_cartesian(ylim = c(-20, 200)) +
  labs(
    title = "Retraso en las salidas hacia LAX por aerolínea",
    subtitle = "Vuelos con destino a Los Ángeles (LAX)",
    x = "Aerolínea [Código Carrier]",
    y = "Retraso en la salida [minutos]",
    color = "Aerolínea"
  ) +
  theme_minimal()

# geom_jitter(alpha = 0.3, width = 0.2): Agrega los puntos de cada vuelo individual con dispersión horizontal para evitar que se solapen. alpha ajusta la transparencia.
# 
# geom_boxplot(outlier.shape = NA): Superpone el gráfico de cajas. Se usa outlier.shape = NA para evitar duplicar la visualización de los valores atípicos que ya dibuja geom_jitter.
# 
# coord_cartesian(ylim = c(-20, 200)): Recorta la vista del eje Y entre -20 y 200 minutos para observar mejor el grueso de los datos (la caja y los percentiles) sin eliminar puntos de los cálculos estadísticos del boxplot.
# 
# labs(...): Define el título, subtítulo e indica claramente la unidad de medida (minutos) en el eje vertical.# 

# 1. Filtrar las aerolíneas con más de 1000 vuelos en total en el año
aerolineas_principales <- flights %>% 
  count(carrier) %>% 
  filter(n > 1000) %>% 
  pull(carrier)

# 2. Filtrar vuelos a LAX, seleccionar las 2 aerolíneas con menor max(dep_delay)
# y realizar el histograma de arr_delay coloreado por aerolínea
vuelos_seleccionados <- flights %>% 
  filter(carrier %in% aerolineas_principales, dest == "LAX") %>% 
  group_by(carrier) %>% 
  filter(max(dep_delay, na.rm = TRUE) %in% sort(top_n(group_by(., carrier), 1, dep_delay) %>% pull(dep_delay))[1:2]) %>% 
  # O de forma explícita filtrando por las dos aerolíneas elegidas (DL y VX):
  # filter(carrier %in% c("DL", "VX"))
  ungroup()

view(vuelos_seleccionados)

# 3. Graficar el histograma de arr_delay coloreado/rellenado por aerolínea
ggplot(vuelos_seleccionados, aes(x = arr_delay, fill = carrier)) +
  geom_histogram(binwidth = 10, position = "identity", alpha = 0.5) +
#  coord_cartesian(xlim = c(-60, 200)) +
  labs(
    title = "Distribución del retraso en las llegadas a LAX",
    subtitle = "Aerolíneas con menor retraso máximo de salida",
    x = "Retraso en la llegada [minutos]",
    y = "Frecuencia [cantidad de vuelos]",
    fill = "Aerolínea"
  ) +
  theme_minimal()


# 1. Filtrado de datos para las aerolíneas DL y VX con destino a LAX
vuelos_densidad <- flights %>% 
  group_by(carrier) %>% 
  filter(n() > 1000) %>% 
  ungroup() %>% 
  filter(dest == "LAX", carrier %in% c("AA", "B6"))

# 2. Gráfico de densidad de arr_delay
ggplot(vuelos_densidad, aes(x = arr_delay, fill = carrier, color = carrier)) +
  geom_density(alpha = 0.4) +
#  coord_cartesian(xlim = c(-60, 150)) +
  labs(
    title = "Densidad del retraso en las llegadas a LAX",
    # subtitle = "Comparación entre Delta Air Lines (DL) y Virgin America (VX)",
    x = "Retraso en la llegada (minutos)",
    y = "Densidad de probabilidad",
    fill = "Aerolínea",
    color = "Aerolínea"
  ) +
  theme_minimal()
