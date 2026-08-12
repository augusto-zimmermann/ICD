# Levantando los datos
library(tidyverse)

data <- read_csv('properati_SM_SPA.csv')

# Vistazo general

view(data)
glimpse(data) # Tira una tabla reducida en consola

# Consultar README para mas info de una tabla
help("iris")

# Cuantas filas hay?
nrow(data)
# Cuántas columnas hay?
ncol(data)
# Qué variables son numéricas?

# Qué otros tipos de variables hay?

# Cuáles podrían ser categóricas?


# Qué representa la variable l4?
unique(data$l4)
distinct(select(data, l4)) # Especifico de la libreria tidy

# Qué objeto devuelve cada una de las funciones?




# Cuantos anuncios de departamentos y cuantos de casas hay en el listado?
count(data, tipo_propiedad)

# Grafico de dispersion
ggplot(data, aes(x=sup_cubierta, y=precio)) +
  geom_point() +
  xlab("Superficie cubierta [m2]") +
  ylab("Precio [USD]")

ggplot(data, aes(x=sup_cubierta, y=precio, color=...)) +
  geom_point() +
  xlab("Superficie cubierta [m2]") +
  ylab("Precio [USD]")
