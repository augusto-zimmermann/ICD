# Repaso modelado

## a)

Una parabola

```
intercept: ordenada al origen - cantidad inicial
```

`y` es pasajeros y `x`
El modelo busca relacionar pasajeros y kilometros recorridos

## b)

Tiene dos parametros porque es una recta

Hay una diferencia entre parametro y variable

Existen variables
- explicativas
- de respuesta

> [!CAUTION]
> Si en el summary aparencen dos parametros es una recta -> RESTA SI ESTA MAL EN EL PARCIAL

## c)

Representa la cantidad de pasajeros que suben por cada km

## d)

- Sin interaccion -> cambian las ordenadas al origen
```r
pasajeros ~ km.recorridos + dia.semana
```

- Con interaccion -> cada curva es independiente
```r
pasajeros ~ km.recorridos x dia.semana
```

> [!NOTE]
> Pregunta de parcial - Corresponde el grafico a la formula?
>
> Vale asumir, el razonamiento vale en el examen

Los graficos con + son paralelos

En el summary aparece en el tercer resultado `-103.5`, si lo restas al intercept `101.9` te queda la ecuacion representativa del servicio urbano -> `2.72 x km (101.9 - 130.5)`

No hace falta realmente el numero final, vale mas el desarrollo

```r
Pasajeros = (3.9 - 1.9 km) + (37.5 - 29.03)
```

Siempre va el intercept primero en la cuenta, fijate que es un error comun

```r
tiempo_espera:
16.47 km_r^2 + 83.5 km_r + 15.56
```

```r
tiempo_espera:
(16.47-12.8) km_r^2 + (83.5 - 17.5) km_r + (15.56 - 2.41)
```

Termino cuadratico negativo -> curva concava hacia abajo

## Que mide `R-squared`?

La varianza de los datos
- varianza mayor
- varianza menor

Si el modelo explica perfecto todo (1) es rarisimo

No tiene sentido comparar la cantidad de estrellas al costado pero si alguno no tuviera, no es significativo para el modelo, no mueve el amperimetro

> [!WARNING]
> **No hay** una mas significativo que otro

> [!NOTE]
> Cuanto mas complejo es el modelo mas parametros va a tener

> Pregunta del parcial

## Residuos

Los residuos ayudan a entender

- Si el residuo es _negativo_ esta sobreestimado
- Si el residuo es _positivo_ esta subestimado (si hay puntitos arriba de mi linea)

> [!NOTE]
> extremos == las dos puntas del grafico

La media de los residuos es **siempre igual a 0, por definicion**

Si hay una forma reconocible en los residuos, representala urgente en tu modelo, porque se ve que hay algo mas para averiguar

## ANOVA

Para determinar si vale la pena (estrellas) complejizar el modelo

## Como se ve la cantidad de parametros a partir de un grafico?

Comparte la pendiente -> Tiene 3 parametros

## Grados de libertad

```
cantidad de puntos - cantidad de parametros
```

```
(N-P) = DF
```

### Cuantos puntos tiene este dataset?

```
(200-2) = 198
```

---

```latex
\(D = \frac{\mu k_B T}{e}\)
```

```latex
\(D = \frac{\mu k_B T}{e}\) }{c^4} T_{\mu\nu}\)) \(E=mc^2\).
```
