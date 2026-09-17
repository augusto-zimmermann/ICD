# Pose pose pose

Modelado de datos == Encontrar la relacion matematica en el dataset

RMSE

## Funcion `lm`

en la funcion `lm`, `~` separa a la variable _objetivo_ de la variable _explicativa_

Notese que además de la fórmula, hay que pasar el dataset que usamos para el ajuste en el argumento data. Con esta sintaxis, lo que estamos haciendo es ajustar un modelo de la forma:

```latex
Petal.Width = 𝑎 + 𝑏 ⋅ Petal.Length
```

La tarea de la función `lm` es encontrar el valor de los parámetros `a` y `b` que “mejor
ajustan” los datos.

|              | Estimate Std. | Error  | t value | Pr(>\|t\|) |
|--------------|---------------|--------|---------|------------|
| (Intercept)  | -0.08429      | 0.1607 | -0.5245 | 0.60234    |
| Petal.Length | 0.33105       | 0.0375 | 8.8280  | 0.00000    |

En esta sección, tenemos una fila por parámetro, y para cada parámetro tenemos cuatro
valores y, eventualmente, un simbolito:

- Estimate: el valor del parámetro que mejor ajusta los datos.
- Std. Error: el desvío del estimador. Es decir, el rango dentro del cual se puede
mover el valor de los parámetros sin que el ajuste cambie mucho (estamos siendo,
a propósito, muy poco formales con estas definiciones, que ya van a ver con lujo
de detalles en otras materias).
- t value: el valor t, que no es más que el cociente entre el valor del estimador y
su desvío (pruébenlo).
- Pr(>|t|): un p valor asociado con este valor t, que nos da una probabilidad.
¿Probabilidad de qué? Ah, es un trabalenguas, pero la respuesta es “la probabilidad
de que, si no existe una relación entre ambas variables, hayamos obtenido este
valor t (o uno más extremo) por azar”.
- Por último, tenemos los códigos de significancia, que aparecen como estrellitas en
cada fila, para indicar cuán significativo es cada parámetro. El código depende del
p valor, según lo que está definido abajo.

## en las diapo

y negado es media de y
