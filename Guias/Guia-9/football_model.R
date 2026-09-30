library(tidyverse)
library(nycflights13)

# Punto 9
df_teamstats <- read_csv('datasets/football/teamstats.csv')
df_games <- read_csv('datasets/football/games.csv')
df_leagues <- read_csv('datasets/football/leagues.csv')
df_teams <- read_csv('datasets/football/teams.csv')

df <- left_join(df_teamstats, 
                df_games %>% select(gameID, leagueID), 
                by="gameID") %>% 
  left_join(df_leagues, by='leagueID') %>% 
  rename(liga = name) %>% 
  left_join(df_teams, by='teamID') %>% 
  rename(equipo = name)


df <- df %>% group_by(equipo, liga) %>% 
  summarise(total_shots = sum(shots, na.rm=T),
            total_goals = sum(goals, na.rm=T)) %>% 
  ungroup()

p <- df %>%
    ggplot() +
    geom_point(aes(x=total_shots, y=total_goals,
                 color=liga))


# Filtro una liga
df_laliga <- df %>% filter(liga=='La Liga')

mod.laliga <- lm(data=df_laliga, 
                 formula = total_goals ~ total_shots - 1) 

summary(mod.laliga)

# Filtro otra liga
df_premier <- df %>% filter(liga=='Premier League')

mod.premier <- lm(data=df_premier, 
                 formula = total_goals ~ total_shots - 1) 

summary(mod.premier)

# Todas las ligas juntas
mod <- lm(data = df,
          formula = total_goals ~ poly(total_shots, 2))
summary(mod)

# Gráficos
library(modelr)

df.model <- df %>% add_predictions(mod) %>% 
    add_residuals(mod)

max.resid <- 100  
ggplot(mapping = aes(x=total_shots, y=resid, 
                     color=liga, label=equipo)) +
  geom_point(data = df.model) +
  geom_text(data = df.model %>% filter(resid > max.resid), 
            hjust=-0.1, vjust=0, size=2)
