
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

