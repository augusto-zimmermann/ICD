library(tidyverse) # para cargar el paquete en la sesión actual de R

data <- read_csv("Entrega 1/insurance.csv")

view(data)
glimpse(data) # Tira una tabla reducida en consola

nrow(data)

ggplot(data, aes(x=age, y=charges)) +
  geom_point(aes(color = smoker)) +
  xlab("Edad") +
  ylab("Cargo [USD]") +
  #theme_classic() + 
  #theme(legend.position = "bottom") +
  labs(color = "Fumador") +
  scale_color_discrete(labels = c("No", "Si"))
 
