# Análisis detallado de cada opción

## LAX delays

- a. Falsa: Varias aerolíneas presentan valores atípicos (outliers) por debajo del límite inferior cuando salen mucho antes de lo programado.
- b. Verdadera *Falsa: El rango intercuartil ($IQR = Q_3 - Q_1$) de los retrasos de AA es mayor que el de UA (en AA, la dispersión del $50\%$ central de los datos va de un retraso más negativo a uno más alto que en UA).
- c. Verdadera: Debido a la asimetría de la distribución de retrasos de vuelos (que tiene una cola larga a la derecha), todas las aerolíneas presentan vuelos con retrasos considerables que caen por fuera del límite del bigote superior ($Q_3 + 1.5 \times IQR$).
- d. Verdadera: Un retraso negativo en la salida (dep_delay < 0) significa que la hora real de salida fue anterior a la hora programada (el vuelo salió adelantado).
- e. Falsa: Los valores fuera del boxplot representan retrasos atípicos reales (por ejemplo, demoras extraordinarias por clima o problemas técnicos), no necesariamente errores de ingreso de datos.f. Falsa: Un valor negativo es un dato totalmente válido que indica adelanto en la salida.
- g. Falsa: El retraso máximo absoluto del dataset no pertenece a Virgin America (VX); aerolíneas como HA o B6 registran los picos máximos del dataset global, y en la ruta a LAX no es VX la que posee la demora máxima.
- h. Verdadera: La variabilidad en el $50\%$ central de los datos de B6 es más amplia que en DL, resultando en un rango intercuartil ($IQR$) significativamente mayor.
- i. Falsa: La cantidad total de vuelos de cada aerolínea varía considerablemente (por ejemplo, UA tiene 5.823 vuelos frente a los 1.688 de B6). Además, la caja siempre contiene el $50\%$ de los datos de esa aerolínea en particular.
- j. Falsa: En la mayoría de las aerolíneas de este dataset, la mediana del retraso de salida es cero o un valor negativo (e.g., -1 o -2 minutos), ya que más de la mitad de los vuelos salen a término o con un leve adelanto.
- k. Falsa: El gráfico muestra la mediana (línea central de la caja) y la distribución general por cuartiles, no la media (promedio). Además, la presencia de valores atípicos extremos distorsiona la media en distribuciones asimétricas.

## Densidad

- a. Verdadera: Un retraso positivo (arr_delay > 0) representa vuelos que llegaron tarde. Si comparamos las curvas de densidad, la distribución de B6 tiene una mayor proporción de su área acumulada por encima de $0$ minutos en comparación con las aerolíneas con mejor desempeño puntual.
- b. Falsa: Un gráfico de densidad mide proporciones / probabilidad relativa, no la cantidad absoluta de vuelos. No permite saber la cantidad de vuelos retrasados en números absolutos.
- c. Falsa: La altura de la curva de densidad indica dónde se concentran más fuertemente las observaciones de esa aerolínea en particular.
- d. Falsa: Que una curva sea más alta significa que sus datos están más concentrados o condensados alrededor de cierto valor (p. ej., alrededor de $0$ o valores negativos), no que la aerolínea tenga un volumen total mayor de vuelos.
- e. Falsa: La presencia de un pico desplazarlo a la izquierda no garantiza por sí solo un mejor desempeño si la distribución presenta una cola pesada o de gran dispersión hacia la derecha.
- f. Falsa: Es solo una frase de encabezado/consigna.
- g. Falsa: La proporción exacta de vuelos retrasados en este tipo de distribuciones suele ser inferior al 60% (la mayor parte de la masa se concentra alrededor o por debajo de $0$).h. Verdadera: El pico o moda principal de la curva de densidad para AA (al igual que en DL) se encuentra en valores negativos (a la izquierda del cero), lo que muestra que la mayor concentración/frecuencia de sus vuelos llega con adelanto a destino.

## Preguntas de concepto

### Pregunta 16

En un boxplot, los bigotes o “whiskers”:

- [ ] Siempre van desde el extremo de la caja hasta el máximo valor observado
- [ ] Tienen un largo máximo dado por la cantidad de datos observados
- [ ] Tienen un largo máximo en función del IQR o rango intercuartil

> [!spoiler]- Respuesta
> Tienen un largo máximo en función del IQR o rango intercuartil
> - _Explicación:_ En un boxplot estándar, los bigotes se extienden hasta el valor más lejano que no supere el límite de $1.5 \times \text{IQR}$ desde los extremos de la caja ($Q_1$ y $Q_3$). Los valores más allá de esa distancia se consideran outliers.

### Pregunta 17

Seleccionar las afirmaciones que son verdaderas

Seleccione una o más de una:

- [ ] En el filtrado de un dataset, se suele  reducir la cantidad de observaciones
- [ ] Un agrupamiento no reduce la cantidad de observaciones.
- [ ] En un ordenamiento, se reduce la cantidad de observaciones

> [!spoiler]- Respuesta
> **Respuestas correctas:** **a** y **b**
> - a. En el filtrado de un dataset, se suele reducir la cantidad de observaciones (Verdadera)
> - **b. Un agrupamiento no reduce la cantidad de observaciones.** (Verdadera; agrupar con `group_by` cambia la estructura interna pero mantiene el número total de filas intacto hasta que se aplica una síntesis como `summarise`).
> - _c. Es falsa, el ordenamiento solo reorganiza filas sin eliminar ninguna._

### Pregunta 18

La mediana de una muestra es:

- [ ] El valor que separa la muestra en dos conjuntos de tamaños iguales.
- [ ] El número que más se repite en la muestra.
- [ ] La cifra que se obtiene al sumar todos los datos y dividir el resultado entre la cantidad de los mismos.

> [!spoiler]- Respuesta
> **a. El valor que separa la muestra en dos conjuntos de tamaños iguales.**
> - _Explicación:_ La mediana divide la muestra ordenada en $50\%$ por debajo y $50\%$ por encima. La opción b describe la moda y la c la media.

### Pregunta 19

En clase vimos que en el caso de tener una variable, podemos visualizar la distribución de los valores de varias maneras. Además del boxplot, tenemos el histograma, el dot plot y el gráfico de densidades.

Unir cada uno con su descripción

- Densidades
- Histograma
- Dot plot

> [!spoiler]- Respuesta
> - **Densidades:** Curva suavizada que representa la función de densidad de probabilidad continua de los datos (área total bajo la curva igual a 1).
> - **Histograma:** Gráfico de barras continuas donde el rango numérico se divide en intervalos (_bins_) y la altura de la barra representa la cantidad/frecuencia de datos en cada intervalo.
> - **Dot plot:** Gráfico de puntos donde cada observación individual o pequeño grupo se representa directamente como un punto a lo largo de un eje.

### Pregunta 20

¿Con qué tipo de gráfico pueden visualizarse las observaciones individuales?

- [ ] Histograma
- [ ] Gráfico de densidad
- [ ] Dot plot

> [!spoiler]- Respuesta
> **c. dot plot**
> - _Explicación:_ El _dot plot_ (junto con variantes como `geom_jitter`) representa cada punto de dato de manera individual, a diferencia del histograma y la densidad que agregan los valores.

### Pregunta 21

Marcar todos los gráficos que permiten detectar características de la distribución de datos que el boxplot puede estar omitiendo

Seleccione una o más de una:

- [ ] Gráfico de densidad
- [ ] Dot plot
- [ ] Histograma

> [!spoiler]- Respuesta
> **Respuestas correctas:** **a**, **b** y **c**
> - _Explicación:_ Todos estos gráficos (**densidad**, **dot plot** e **histograma**) revelan características como la bimodalidad, huecos o la forma exacta de la distribución que el boxplot oculta al resumir los datos únicamente en 5 métricas básicas.

### Pregunta 22

Indicar todos los gráficos que permitan comparar las distribuciones de dos grupos con distinta cantidad de datos

- [ ] Dot plot
- [ ] Histograma
- [ ] Gráfico de densidad

> [!spoiler]- Respuesta
> **c. gráfico de densidad**
> - _Explicación:_ Al normalizar la escala vertical para que el área total bajo cada curva sea igual a 1 (densidad de probabilidad), permite comparar grupos con cantidades totales de datos muy dispares sin que el tamaño del grupo distorsione la altura del gráfico.

### Pregunta 23

A la hora de dar información sobre alguna variable de interés, podemos sintetizarla de distintas maneras. Marcar las afirmaciones correctas sobre las métricas de resumen:

Seleccione una o más de una:

- [ ] Para cualquier dataset es suficiente informar la media aritmética ya que se calcula con el valor de todas las observaciones y reporta el promedio de la variable de interés.
- [ ] Todos los percentiles tienen equivalentes cuantiles asociados. No todos los percentiles tienen cuartiles equivalentes.
- [ ] El rango intercuartil (IQR) es robusto ante la presencia de valores atípicos (outliers)
- [ ] El rango de valores mínimo y máximo es robusto ante la presencia de valores atípicos (outliers)

> [!spoiler]- Respuesta
> **Respuestas correctas:** **b** y **c**
> - **b. Todos los percentiles tienen equivalentes cuantiles asociados. No todos los percentiles tienen cuartiles equivalentes.** (Verdadera; los cuartiles solo corresponden a los percentiles 25, 50 y 75).
> - **c. El rango intercuartil (IQR) es robusto ante la presencia de valores atípicos (outliers)** (Verdadera; al considerar solo el $50\%$ central no se ve afectado por extremos).
> - _a es falsa porque la media es sensible a outliers y no siempre alcanza por sí sola. d es falsa porque el mínimo y el máximo son extremadamente sensibles a atípicos._

### Pregunta 24

Al realizar un boxplot de dos variables distintas de un mismo dataset, se puede afirmar que:

Seleccione una o más de una:

- [ ] Cada una de las cajas tiene el mismo número de puntos a cada lado de la mediana.
- [ ] Las cajas darán la misma información que dos violinplots, ya que muestran las mismas métricas de resumen
- [ ] Ambas tendrán la misma cantidad de outliers (puntos fuera de los bigotes)
- [ ] Las cajas contendrán el mismo número de puntos
- [ ] Si una de las cajas es simétrica, la otra no tiene por qué serlo
- [ ] Ambas cajas tendrán el 25% de sus observaciones entre la mediana y el Q3

> [!spoiler]- Respuesta
> **Respuestas correctas:** **a**, **d**, **e** y **f**
> - **a. Cada una de las cajas tiene el mismo número de puntos a cada lado de la mediana.** (Verdadera; por definición la mediana divide el interior de la caja en dos $25\%$).
> - **d. Las cajas contendrán el mismo número de puntos** (Verdadera; al ser del mismo dataset con $N$ observaciones, la caja de cada variable contendrá exactamente el $50\%$ central del total de puntos, es decir, $0.50 \times N$).
> - **e. Si una de las cajas es simétrica, la otra no tiene por qué serlo** (Verdadera; la forma/sesgo de cada variable es independiente).
> - **f. Ambas cajas tendrán el 25% de sus observaciones entre la mediana y el Q3** (Verdadera; por definición de cuartiles).
