# Análisis detallado de cada opción

## LAX delays

- a. Falsa: Varias aerolíneas presentan valores atípicos (outliers) por debajo del límite inferior cuando salen mucho antes de lo programado.
- b. Verdadera: El rango intercuartil ($IQR = Q_3 - Q_1$) de los retrasos de AA es mayor que el de UA (en AA, la dispersión del $50\%$ central de los datos va de un retraso más negativo a uno más alto que en UA).
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




En un boxplot, los bigotes o “whiskers”:


Pregunta 16 Respuesta
a.
Siempre van desde el extremo de la caja hasta el máximo valor observado
b.

Tienen un largo máximo dado por la cantidad de datos observados
c.

Tienen un largo máximo en función del IQR o rango intercuartil


Pregunta 17
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

Seleccionar las afirmaciones que son verdaderas


Pregunta 17 Seleccione una o más de una:
a.

En el filtrado de un dataset, se suele  reducir la cantidad de observaciones
b.

Un agrupamiento no reduce la cantidad de observaciones.


c.

En un ordenamiento, se reduce la cantidad de observaciones


Pregunta 18
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

La mediana de una muestra es:
Pregunta 18 Respuesta
a.

El valor que separa la muestra en dos conjuntos de tamaños iguales.
b.

El número que más se repite en la muestra.


c.

La cifra que se obtiene al sumar todos los datos y dividir el resultado entre la cantidad de los mismos.
Pregunta 19
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

En clase vimos que en el caso de tener una variable, podemos visualizar la distribución de los valores de varias maneras. Además del boxplot, tenemos el histograma, el dot plot y el gráfico de densidades.

Unir cada uno con su descripción


Densidades
	
Respuesta 1 Pregunta 19

Histograma
	
Respuesta 2 Pregunta 19

Dot plot
	
Respuesta 3 Pregunta 19
Pregunta 20
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

¿Con qué tipo de gráfico pueden visualizarse las observaciones individuales?


Pregunta 20 Respuesta
a.

histograma
b.

gráfico de densidad


c.

dot plot
Pregunta 21
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

Marcar todos los gráficos que permiten detectar características de la distribución de datos que el boxplot puede estar omitiendo


Pregunta 21 Seleccione una o más de una:
a.

gráfico de densidad
b.

dot plot
c.

histograma
Pregunta 22
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

Indicar todos los gráficos que permitan comparar las distribuciones de dos grupos con distinta cantidad de datos


Pregunta 22 Respuesta
a.

dot plot
b.

histograma
c.

gráfico de densidad
Pregunta 23
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

A la hora de dar información sobre alguna variable de interés, podemos sintetizarla de distintas maneras. Marcar las afirmaciones correctas sobre las métricas de resumen:


Pregunta 23 Seleccione una o más de una:
a.

Para cualquier dataset es suficiente informar la media aritmética ya que se calcula con el valor de todas las observaciones y reporta el promedio de la variable de interés.
b.

Todos los percentiles tienen equivalentes cuantiles asociados. No todos los percentiles tienen cuartiles equivalentes.


c.

El rango intercuartil (IQR) es robusto ante la presencia de valores atípicos (outliers)
d.

El rango de valores mínimo y máximo es robusto ante la presencia de valores atípicos (outliers)


Pregunta 24
Sin responder aún
Se puntúa como 0 sobre 1,00
Marcar pregunta
Enunciado de la pregunta

Al realizar un boxplot de dos variables distintas de un mismo dataset, se puede afirmar que:
Pregunta 24 Seleccione una o más de una:
a.

Cada una de las cajas tiene el mismo número de puntos a cada lado de la mediana. 
b.

Las cajas darán la misma información que dos violinplots, ya que muestran las mismas métricas de resumen


c.

Ambas tendrán la misma cantidad de outliers (puntos fuera de los bigotes)
d.

Las cajas contendrán el mismo número de puntos
e.

Si una de las cajas es simétrica, la otra no tiene por qué serlo
f.

Ambas cajas tendrán el 25% de sus observaciones entre la mediana y el Q3
