# Notas

## Comandos generales

```r
data <- read_csv('properati_SM_SPA.csv')
```

> [!NOTE]
> `= vs <-`
> En R es común usar `<-`como el operador de asignación, que es tal vez más claro que el `=` de otros lenguajes. Para escribir más rápido ese símbolo formado por dos caracteres, pueden usar el atajo `Alt+-` (es decir, la tecla Alt y el menos apretados simultaneamente). De todas formas el `=` también está permitido en `R`.

```r
class()
```

Para ver la tabla:

```r
view()
```

y

```r
glimpse() # Tira una tabla reducida en consola
```

Generalmente la tablas tienen un archivo estilo README, que lo odes consultar usando

```r
help()
```

Para ver las filas

```r
nrow()
```

Columnas

```r
ncol()
```

## Clase 2

> Siempre va a ser interpretar gráficos

La población se para siempre sobre la barra

Por ejemplo: De los hombres hay tal proporción que ...

![[Pasted image 20260812173457.png]]

^ Acá no se habla de cantidades, se habla de proporción

> [!DANGER] Importantisimo
> No podes comparar cantidades entre poblaciones.
> Si están preguntando sobre proporciones en un gráfico de cantidades OJO. Lo mismo al revés
> Clasico pregunta parcial, puedo decir que hay mayor cantidad de mujeres que sobrevivieron de las que murieron? Respuesta >>> ?

### Cuestionario

No podes ir atrás en el cuestionario, si avanzas esa página se cierra

## Scatter plot

```r
Rlibrary(ggplot2)

ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  # 1. Modify point appearance (Static or mapped to variables)
  geom_point(aes(color = factor(cyl)), size = 3, alpha = 0.8, shape = 16) +
  
  # 2. Add a trend/regression line
  geom_smooth(method = "lm", se = TRUE, color = "blue") +
  
  # 3. Modify titles and axis labels
  labs(
    title = "Vehicle Weight vs. Fuel Efficiency",
    subtitle = "Analysis based on mtcars dataset",
    x = "Weight (1000 lbs)",
    y = "Miles Per Gallon (MPG)",
    color = "Cylinders"
  ) +
  
  # 4. Modify colors manually
  scale_color_manual(values = c("#ef476f", "#ffd166", "#06d6a0")) +
  
  # 5. Swap the overall theme and adjust details
  theme_minimal() + 
  theme(legend.position = "bottom")
```

Key Modification Techniques

- Change Point Aesthetics (Color, Size, Shape, Alpha)
  - You can change aesthetics statically (apply to all points) or dynamically (map to a data variable):
    - Static Change (Outside aes()): `geom_point(color = "red", size = 4, shape = 18, alpha = 0.5)`.
    - Dynamic Change (Inside aes()): `geom_point(aes(color = species, shape = species))`.
  - Add a Trend Line
    - Use `geom_smooth()` to display patterns or look for correlations.
    - Linear Regression Line: `geom_smooth(method = "lm", se = FALSE)`.
    - Smoothed Loess Curve: `geom_smooth(method = "loess")`.
  - Edit Text, Labels, and Titles
    - Use `labs()` to change all user-facing text in a single layer.
    - Change the legend title by matching the aesthetic name used (e.g., `labs(color = "Legend Title")` if you used `aes(color = ...)`).
    - Change or Remove the Legend
      - Use the `theme()` function to modify the placement of your legend.
        - Move it: `theme(legend.position = "bottom")` (or `"top"`, `"left"`, `"right"`).
        - Hide it: `theme(legend.position = "none")`.
    - Adjust Axis Limits
      - Prevent data clipping while zooming or forcing specific axis constraints.
      `xlim(0, 100) + ylim(0, 50)`
      - Apply a Built-in Theme. Change the background, gridlines, and overall style.
        - `theme_bw()` (White background with a black border)
        - `theme_minimal()` (Clean layout, no border, light gray grids)
        - `theme_classic()` (Clean layout, x and y axis lines only, no gridlines)

## Respecto a proporciones

![[smoker-region.png]]

¿No podría pasar que esta región tenga más fumadores sólo porque es la más numerosa en el dataset? ¿Qué gráfico permitiría explorar esta pregunta?

a. Gráfico de barras que muestre la composición regional para el grupo fumador y el no fumador. Es decir, el gráfico que se obtiene con este código:

```r
ggplot(data = df) +
  geom_bar(aes(x=smoker, fill=region), position='fill')
```

![[psmoker-region1.png]]

b. Gráfico de barras que muestre las proporciones de fumador y no fumador para cada región. Es decir, el gráfico que se obtiene con este código:

```r
ggplot(data = df) +
  geom_bar(aes(x=region, fill=smoker), position='fill') 
```

![[psmoker-region2.png]]

La respuesta correcta es la b.

¿Por qué es la opción correcta?

- Opción b (`aes(x=region, fill=smoker), position='fill'`): Coloca las regiones en el eje $x$ y divide cada barra según la condición de fumador. Al usar `position='fill'`, cada barra regional se normaliza al 100% (proporción). Esto permite comparar directamente el porcentaje de fumadores dentro de cada región, neutralizando por completo el sesgo de que una región tenga más observaciones (sea más numerosa) que otra en el dataset.
- Opción a (`aes(x=smoker, fill=region`), `position='fill'`): Hace lo inverso; coloca al grupo de fumadores y no fumadores en el eje $x$ y los divide por región. Esto responde a la pregunta "de todos los fumadores, ¿qué proporción pertenece a cada región?", lo cual no resuelve la duda sobre si una región fuma más en proporción a su propia población.

Para saber si una región tiene una tasa de fumadores más alta independientemente de su tamaño poblacional en la muestra, el gráfico debe agrupar por región y mostrar las proporciones internas de fumadores/no fumadores, tal como lo hace el código de la opción b.

## Clase 6

Modelado: sacar patrones utiles de los datos
Redes neuronales

Determinar que herramienta sirve mejor para procesar los datos
