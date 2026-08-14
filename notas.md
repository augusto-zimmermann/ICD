# Notas

## Comandos generales

```r
data <- read_csv('properati_SM_SPA.csv')
``` 

> [!NOTE]
> `= vs <-  `
> En R es común usar `<- `como el operador de asignación, que es tal vez más claro que el `=` de otros lenguajes. Para escribir más rápido ese símbolo formado por dos caracteres, pueden usar el atajo `Alt+-` (es decir, la tecla Alt y el menos apretados simultaneamente). De todas formas el `=` también está permitido en `R`.

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

## Cuestionario

No podes ir atrás en el cuestionario, si avanzas esa página se cierra
