library(tidyverse)
library(scales)
library(modelr)

data <- read_csv('properati_SM_SPA.csv')

## Vemos el gráfico de dispersión entre el precio y la superficie
ggplot(data) +
  geom_point(aes(x=sup_total, y=precio)) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k"))+
  xlab("Superficie [m2]") +
  ylab("Precio [USD]")

## Sumamos la recta que ajusta a los datos
mod <- lm(precio ~ sup_total, data = data)

ggplot(data) +
  geom_point(aes(x=sup_total, y=precio)) +
  geom_abline(intercept = coef(mod)[1], slope = coef(mod)[2], 
              color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k")) +
  xlab("Superficie [m2]") +
  ylab("Precio [USD]")

## Familia de modelo lineal simple: infinitas rectas

models <- tibble(
  a1 = runif(250, -50000, 300000),
  a2 = runif(250, -500, 3000)
)

ggplot(data, aes(x = sup_total, y = precio)) + 
  geom_abline(aes(intercept = a1, slope = a2), data = models, alpha = 1/4) +
  geom_point() +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  geom_abline(intercept = coef(mod)[1], slope = coef(mod)[2], 
              color = "red", linewidth = 1) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k")) +
  xlab("Superficie [m2]") +
  ylab("Precio [USD]")

### Los residuos
data <- data %>% 
  mutate(precio_pred = predict(mod),
         residuo = precio - precio_pred)

ggplot(data) +
  geom_segment(aes(x = sup_total, xend = sup_total, 
                   y = precio, yend = precio_pred),
               color = "steelblue", alpha = 0.5) +
  geom_point(aes(x=sup_total, y=precio)) +
  geom_abline(intercept = coef(mod)[1], slope = coef(mod)[2], 
              color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k")) +
  xlab("Superficie [m2]") +
  ylab("Precio [USD]")

######################################################################
#################   Modelo Lineal Simple    ##########################
######################################################################

mod <- lm(precio ~ sup_total, data)

summary(mod)

data <- data %>% add_predictions(model=mod)
data <- data %>% add_residuals(model=mod)

ggplot(data) +
  geom_point(aes(x=pred, y=resid), alpha = 0.5) +
  geom_abline(intercept = 0, slope = 0, 
              color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_x_continuous(
    labels = label_number(scale = 1e-3, suffix = " k")) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k")) +
  xlab("Predicción [USD]") +
  ylab("Residuos [USD]")

### Transformación log - precio=e b⋅superficie a

ggplot(data) +
  geom_point(aes(x=log(sup_total), y=log(precio)), alpha = 0.5) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_y_continuous() +
  xlab("log(Superficie [m2])") +
  ylab("log(Precio [USD])")

modlog <- lm(log(precio) ~ log(sup_total), data)

data <- data %>% add_predictions(model=modlog)
data <- data %>% add_residuals(model=modlog)

ggplot(data) +
  geom_point(aes(x=pred, y=resid), alpha = 0.5) +
  geom_abline(intercept = 0, slope = 0, 
              color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  xlab("log(Predicción [USD])") +
  ylab("log(Residuos [USD])")

summary(modlog)

######################################################################
#################   Modelo Lineal Múltiple    ########################
######################################################################

ggplot(data) +
  geom_boxplot(aes(x=factor(habitaciones), y=precio)) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k"))+
  xlab("Habitaciones") +
  ylab("Precio [USD]")

modmult <- lm(precio ~ sup_total + habitaciones, data)
summary(modmult)

grilla_multiple <- data_grid(data, sup_total,
                    habitaciones = seq_range(habitaciones, n=7)) %>%
  add_predictions(modmult)

ggplot(data, aes(x=sup_total, y=precio,
                  color=habitaciones)) +
  geom_point() +
  geom_line(data=grilla_multiple, aes(y=pred, group=habitaciones)) +
  theme_bw() +
  theme(axis.text = element_text(size=14),
        axis.title = element_text(size=14),
        panel.grid.major = element_line(linewidth = 0.3),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  scale_y_continuous(
    labels = label_number(scale = 1e-3, suffix = " k")) +
  xlab("Superficie [m2]") +
  ylab("Precio [USD]")

#########################################################
#################   Tiburones    ########################
#########################################################
shark <- read.csv("https://raw.githubusercontent.com/UCLSPP/datasets/master/data/shark_attacks.csv")

# ataques vs. consumo de helados
ggplot(shark, aes(x = IceCreamSales, y = SharkAttacks)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  xlab("Ventas de helado") +
  ylab("Ataques de tiburón")




# temperatura vs. helado
ggplot(shark, aes(x = Temperature, y = IceCreamSales)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  xlab("Temperatura [°C]") +
  ylab("Ventas de helado")




# temperatura vs. ataques
ggplot(shark, aes(x = Temperature, y = SharkAttacks)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "red", linewidth = 1) +
  theme_bw() +
  theme(axis.text = element_text(size = 14),
        axis.title = element_text(size = 14),
        panel.grid.minor = element_blank(),
        panel.border = element_blank()) +
  xlab("Temperatura [°C]") +
  ylab("Ataques de tiburón")


mod1 <- lm(SharkAttacks ~ Temperature, shark)
summary(mod1)

mod2 <- lm(SharkAttacks ~ IceCreamSales + Temperature, shark)
summary(mod2)