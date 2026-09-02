# El código en este archivo está pensando como guía para el trabajo de laboratorio.
# El código tal cuál está escrito no funciona, tienen que completar donde aparecen signos de interrogación.

# Cargamos biblioteca y leemos los datos
library(tidyverse)
df <- read_csv('insurance.csv')

#--------------
# Punto 4
#--------------
df %>%
  filter(sex==???, ???) %>%     # Filtrar solo fumadores varones
  ggplot(aes(x=???, y=???)) +   # que variables van en los ejes
  geom_point()

#--------------
# Punto 5
#--------------
# Este gráfico combina dos capas distintas:
# 1) Un diagrama de dispersión con `geom_jitter`, que coloca todos los puntos a la misma altura (y = 2.0)
#    pero introduce un pequeño "ruido" en el eje y para evitar que se superpongan exactamente.
#    En este caso el eje y no tiene interpretación: se usa solo para mostrar la presencia de cada individuo.
# 2) Un diagrama de puntos (`geom_dotplot`) que resume la cantidad de observaciones en cada bin de edad,
#    apilando los puntos verticalmente. Gráficamente, la altura de la pila refleja la frecuencia.
#
# De este modo, el gráfico muestra simultáneamente la dispersión individual de los datos
# y la distribución agregada por grupos de edad.

df %>%
  # Filtrar solo fumadores varones
  filter(sex==???, ???) %>%
  # en el x la variable que están analizando, no confundir con el ejercicio anterior
  ggplot(aes(x=???)) +
  geom_jitter(aes(y=2.0), width=0) +  #esto es para poner este diagrama arriba y le agrega el jitter
  geom_dotplot(binwidth=???,    #ancho del bin, arranquen con algo como 500 y un dotsize de 1.7 y después prueben variarlos un poco hasta entender que hacen
               fill='salmon', color='transparent',
               dotsize=??) +
  # Para sacar las etiquetas del eje y, que no indican nada
  scale_y_continuous(name=NULL, labels=NULL) +
  # Ahora le agregamos las etiquetas que nos sirven a nosotros
  labs(x=???,
       title='Costo del seguro de salud',
       subtitle='Varones fumadores de EEUU') +
  theme(axis.title = element_text(size=14))

# Punto 8
# TIP: Usen el código del punto 5 para cambiar el dot plot por un histograma
# primero hagan visibles las etiquetas de y, con esto van a poder ver mejor donde subir el geom_jitter (que queda tapado por el histograma)


# Parte 4. Densidades
## Ejemplo de geom_text
df %>%
  ggplot(aes(x=charges)) +
  geom_histogram(binwidth=3000,
                 fill='salmon', color='transparent') +
  geom_text(stat = "bin", binwidth = 3000, aes(label = ..count..), vjust = -0.5)+
  # Ponemos nuestras etiquetas
  labs(x='Cargos médicos',
       title='Costo del seguro de salud')+
  theme(axis.title = element_text(size=14))
###

# Punto 12
# definmos la variable ancho_bin para cambiar el binwidth más facil mientras hacen pruebas
# recuerden que cuando la cambien tienen que volver a ejecutar esta línea para que la actualice

ancho_bin <- ???
  # Ahora si viene el plot
  df %>%
  filter(sex=='male') %>%
  ggplot(aes(x=???, fill=???)) +
  # Completen la posición. Vean la diferencia entre 'stack' y 'identity' y dodge
  geom_histogram(binwidth=ancho_bin, color='transparent', position=???,
                 alpha=0.5) +
  # Si queremos agregar la cantidad de cada barra usamos geom_text
  # Noten que para el geom_text estamos usando de nuevo el mismo número de bins que usamos para armar el histograma
  # descomenten la siguiente línea si quieren verlo
  # geom_text(stat = "bin", binwidth = bw, aes(label = ..count..), vjust = -0.5) +
  labs(y='Cuentas', x='Costo del seguro [USD]')


# Punto 14

ancho_bin <- ???
  df %>%
  filter(sex=='male') %>%
  ggplot(aes(x=???, fill=???)) +
  # Completen el mapeo usando la densidad ('..density..').
  geom_histogram(aes(y=???), position='identity', binwidth=ancho_bin,
                 color='transparent', alpha=0.5) +
  #¿tiene sentido la etiqueta del eje y?
  labs(y='Cuentas', x='Costo del seguro [USD]')

# Punto 15
??? + geom_density()

# El bandwidth del geom_density se controla con el parámetro bw
# (si, es medio confuso, pero traten de no mezclarse con *binwidth*)

# Punto 16
??? + geom_density(bw=???)

# Punto 17
# Esto ya lo deberian poder sacar solos

# geom_freqpoly
ancho_bin <- 2000
df %>%
  filter(sex=='male') %>%
  ggplot(aes(x=???, fill=???)) +
  # Después de probar, cambiar esta línea para usar freqpoly
  geom_histogram(aes(y=..density..), position='identity', binwidth=ancho_bin,
                 color='transparent', alpha=0.5) +
  labs(y='Cuentas', x='Costo del seguro [USD]')

# Extras
# ggridges
install.packages('ggridges')
library(ggridges)
df %>%
  filter(sex=='male') %>%
  ggplot(aes(x=charges, fill=smoker, height = stat(density))) +
  # Prueben sacar "stat='density'". Cómo cambia el gráfico?
  geom_density_ridges(aes(y=region), alpha=0.5, stat='density') +
  labs(y='Region', x='Costo del seguro [USD]')

# geom_density2d
df %>%
  filter(sex=='male') %>%
  ggplot(aes(x=charges, y=bmi, color=smoker)) +
  geom_density_2d() +
  scale_color_discrete(name='Fumador', labels=c('No', 'Sí')) +
  labs(y='Índice de masa corporal', x='Costo del seguro [USD]',
       title='Distribución de BMI y costos del seguro médico',
       subtitle='Varones de EEUU') +
  theme(axis.title = element_text(size=12),
        axis.text = element_text(size=12),
        title = element_text(size=14),
        legend.title = element_text(size=12))
