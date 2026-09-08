library(tidyverse)
library(forcats)

players <- read_csv('playermatches.csv')
shots <- read_csv('shots.csv')

#############
### ¿Qué posición (position_general) suele acumular más tarjetas amarillas? 
### ¿Qué tanto peor es que la que posición que le sigue en cantidad de tarjetas amarillas?
### Cantidad de información
#############

# Aproximación 1
players %>% group_by(position_general) %>% 
  summarise(máximo_amarillas = max(yellowCard)) %>%
  arrange(desc(máximo_amarillas))

players %>% group_by(position_general) %>% 
  summarise(máximo_amarillas = max(yellowCard)) %>%
  ggplot() + geom_bar(aes(x = fct_reorder(position_general, máximo_amarillas, .desc = TRUE),
                          y = máximo_amarillas), stat = "identity")


# Aproximación 2
players %>% group_by(position_general) %>% 
  summarise(total_amarillas = sum(yellowCard)) %>%
  arrange(desc(total_amarillas))

players %>% group_by(position_general) %>% 
  summarise(total_amarillas = sum(yellowCard)) %>%
  ggplot() + geom_bar(aes(x = fct_reorder(position_general, total_amarillas, .desc = TRUE),
                          y = total_amarillas), stat = "identity")

# Aproximación 3
players %>% group_by(position_general) %>% 
  summarise(min=min(yellowCard, na.rm=T),
            Q1=quantile(yellowCard, 0.25, na.rm=T),
            median=median(yellowCard, na.rm=T),
            Q3=quantile(yellowCard, 0.75, na.rm=T),
            max=max(yellowCard, na.rm=T),
            IQR = Q3-Q1) %>% arrange(median)

players %>% ggplot() + geom_boxplot(aes(x = position_general, y = yellowCard))


#############
### ¿Y la cantidad de partidos?
#############

# Aprox 1
players %>% group_by(position_general) %>% 
  summarise(total_games = sum(games), total_amarillas = sum(yellowCard), prop_amarillas = total_amarillas/total_games) %>%
  arrange(desc(prop_amarillas))





# Aprox 2
players <- players %>% mutate(proporcion_amarillas = yellowCard/games)

players %>% group_by(position_general) %>% 
  summarise(min=min(proporcion_amarillas, na.rm=T),
            Q1=quantile(proporcion_amarillas, 0.25, na.rm=T),
            median=median(proporcion_amarillas, na.rm=T),
            Q3=quantile(proporcion_amarillas, 0.75, na.rm=T),
            max=max(proporcion_amarillas, na.rm=T),
            IQR = Q3-Q1) %>% arrange(median)

players %>% ggplot() + 
  geom_boxplot(aes(x = position_general, y = proporcion_amarillas))


#############
### ¿Cuáles son los 10 jugadores con más tarjetas amarillas? 
### ¿Qué posición tienen en la cancha?
#############

players %>% slice_max(yellowCard, n=10) %>% 
  select(player, yellowCard, position_general)

#############
### Entre todas las ligas, ¿cuál presenta la mayor proporción de tarjetas amarillas?
### ¿Y la de tarjetas rojas?
#############
total_amarillas <- sum(players$yellowCard)

proporcion_amarillas_ligas <- players %>% group_by(ligue) %>% summarise(amarillas = sum(yellowCard)/total_amarillas)

proporcion_amarillas_ligas %>% ggplot() + 
  geom_bar(aes(x = ligue, y = amarillas), stat = "identity", position="stack")

proporcion_amarillas_ligas %>%
  ggplot() +
  geom_bar(aes(x = 1, y = amarillas, fill = ligue), 
           stat = "identity", position = "stack") +
  labs(x = NULL, fill = "Liga") +
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank())

#############
## Como es de esperar, los delanteros son los jugadores que más goles convirtieron (verifiquen este dato). 
## Sin embargo, ¿son ellos quienes tienen la mayor tasa de conversión de goles en relación con la 
## cantidad de tiros al arco que realizan? Comparen la efectividad de los delanteros con la de la 
## segunda posición más destacada en términos de goles anotados.
#############

players %>% group_by(position_general) %>% summarise(goles_totales = sum(goals))

players %>% group_by(position_general) %>% summarise(goles_totales = sum(goals)) %>%
  ggplot() + geom_bar(aes(x = fct_reorder(position_general, goles_totales, .desc = TRUE),
                          y = goles_totales), stat = "identity") +
  labs(x = "Posición", y = "Goles totales")



players %>% group_by(position_general) %>% summarise(relacion_goles_tiros = sum(goals)/sum(shots)) 

players %>% group_by(position_general) %>% summarise(relacion_goles_tiros = sum(goals)/sum(shots)) %>%
  ggplot() + geom_bar(aes(x = fct_reorder(position_general, relacion_goles_tiros, .desc = TRUE),
                          y = relacion_goles_tiros), stat = "identity") +
  labs(x = "Posición", y = "goles totales / disparos totales")



players %>% filter(position_general == 'Delantero' | position_general == 'Centrocampista') %>% 
  ggplot(aes(x = shots, y = goals, color = position_general)) + geom_point() + geom_smooth()

# ¿Hay jugadores destacados?

players %>% filter(position_general == 'Delantero') %>% 
  ggplot(aes(x = shots, y = goals)) + geom_point() + geom_smooth()


#############
## ¿Existe algún delantero que haya anotado menos goles que asistencias?
## Respondan a esta pregunta utilizando un gráfico de dispersión (scatter plot) y sumando
## la recta y = x.
#############

players %>% filter(position_general == 'Delantero') %>% 
  ggplot(aes(x = assists, y = goals)) + geom_point() + 
  geom_abline(slope = 1, intercept = 0, color = "black", size = 1)


#############
## ¿En qué momento del partido solía convertir Messi los goles?
## Dar una respuesta gráfica y otra escrita.
#############

shots %>% filter(player == 'Lionel Messi' & shotResult == 'Goal') %>% 
  summarise(min=min(minute, na.rm=T),
            Q1=quantile(minute, 0.25, na.rm=T),
            median=median(minute, na.rm=T),
            Q3=quantile(minute, 0.75, na.rm=T),
            max=max(minute, na.rm=T),
            n = n())

shots %>% filter(player == 'Lionel Messi' & shotResult == 'Goal') %>% 
  ggplot() + geom_histogram(aes(x = minute), binwidth = 5, alpha = 0.8) +
  scale_x_continuous(breaks = seq(0, 120, by = 5))

shots %>% filter(player == 'Lionel Messi' & shotResult == 'Goal') %>% 
  ggplot() + geom_density(aes(x = minute), bw = 5)