library(tidyverse) # para cargar el paquete en la sesión actual de R

data <- read_csv("Entrega 1/insurance.csv")

view(data)
glimpse(data) # Tira una tabla reducida en consola

nrow(data)

ggplot(data, aes(x = age, y = charges)) +
  geom_point(aes(color = smoker)) +
  xlab("Edad") +
  ylab("Cargo [USD]") +
  #theme_classic() +
  #theme(legend.position = "bottom") +
  labs(color = "Fumador") +
  scale_color_discrete(labels = c("No", "Si"))

# Filtro (jaj) smokers
smokers <- filter(data, smoker == "yes")

# Grafico smokers
ggplot(smokers) +
  geom_bar(aes(x = region, fill = region)) +
  xlab("Region") +
  ylab("Cantidad de fumadores") +
  scale_x_discrete(labels = c("Noreste", "Noroeste", "Sureste", "Suroeste")) +
  scale_fill_manual(values = c("#515A47", "#ABC4AB", "#69385C", "#E07BE0")) +
  theme(legend.position = "none")

# Opcion a
ggplot(data) +
  geom_bar(aes(x = smoker, fill = region), position = "fill")

# Opcion b
ggplot(data) +
  geom_bar(aes(x = region, fill = smoker), position = "fill")

# Pregunta 16
ggplot(data) +
  geom_bar(aes(x = region, fill = smoker), position = "fill") +
  xlab("Region") +
  ylab("Cantidad de fumadores") +
  scale_x_discrete(labels = c("Noreste", "Noroeste", "Sureste", "Suroeste")) +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_manual(values = c("#4FB286", "#73628A"))
