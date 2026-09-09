# Dataset vuelos

## Preguntas

Filtramos
Aerolinea empleadora: MQ (Envoy Air (previamente America Eagle Airlines))

| Pregunta                                        | Respuesta                                                    |
| ----------------------------------------------- | ------------------------------------------------------------ |
| Qué tenemos que hacer?                          | Disminuir el tiempo de retraso                               |
| Para qué tenemos que hacerlo?                   | Para mejorar la experiencia de los viajeros                  |
| Cómo lo haríamos?                               | Usariamos las columnas de delays (`dep_delay` y `arr_delay`) |
| Qué esperamos encontrar?                        | Una mejora de al menos un 15% respecto a los datos de 2013   |
| Qué dificultades potenciales podrían encontrar? |                                                              |

- Identificar las variables relevantes
- Descartar las que no aportan
- Documentar
- - decisiones
- - supuestos
- - fuentes de datos

## Datos

De los origenes, el que tiene la mediana mas alta es EWR, y de los destinos CRV es el que tiene la mediana mas alta, por lejos.

## Decisiones

Analizando las medianas

Utilizando un box-plot se identifico el problema como el destino, mas que el origen

No estamos analizando la dispersion de los datos, hay data con muchos outliers. Hay que tener mucha cantidad de factores en cuenta

Con dispersiones mas grandes se denotan menos outliers

## Supuestos

Se supone que simplemente utilizando los recursos en los aeropuertos donde hay mas retraso de salidas se mejoraria el mismo

## Fuentes de datos

Se utilizo el dataset proporcionado anteriormente. Se analizo tambien la posibilidad de agregar condiciones climaticas a la problematica, pero todas las resoluciones implican capacitar personal en tierra y optimizar sus procesos, no es factible agregar aviones a la flota para mitigar el problema.

(Sin mencionar que condiciones climaticas serias propondrian un serio riesgo para los pasajeros si se decidiera ignorarlas)

### Tiempo

Un descubrimiento despues de filtrar por hora es que en condiciones de poca visibilidad (menor a 3 millas) hay retrasos aun mayores hacia este destino. En adicion a aumentar la flota, se sugiere seguir investigando el horario de los vuelos

## Final de clase

- Esquemas
- Dibujos
- Argumentacion
- Graficos
