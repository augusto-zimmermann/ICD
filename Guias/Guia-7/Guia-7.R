library(tidyverse)
library(modelr)

summary(iris)
view(iris)

df <- iris %>%
  filter(Species == "versicolor")

mod <- lm(Petal.Width ~ Petal.Length, data=df) # ~ separa a la variable objetivo y la variable explicativa

summary(mod)
coef(mod)

df <- df %>% add_predictions(model=mod)
view(df)

# geom_abline solo sirve si el modelo es una recta

# quedan puntos 3,4,5 de predicciones

df <- df %>% 
  add_residuals(model=mod) %>%
  summarise(df)

cat(round(fivenum(mod$residuals), 6))
