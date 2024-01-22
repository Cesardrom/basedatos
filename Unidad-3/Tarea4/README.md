<div align="justify">
    
# Tarea 4

### Modelo E-R sin normalizar

<img src="https://github.com/Cesardrom/basedatos/blob/main/Unidad-3/Tarea4/img/Diagrama%20E-R.png">

### Modelo Relacional sin normalizar

<img src="https://github.com/Cesardrom/basedatos/blob/main/Unidad-3/Tarea4/img/Diagrama%20Relacional.png">

### Normalizacion

En cuanto a la **1ºFN** esta la cumple porque no hay propiedades multivaluadas ni compuestas siendo estas propiedades simples y realizada en las tablas la multiplicacion aritmetica
En cuanto a la **2ºFN** tambien se cumple ya que cumple la **1ºFN** y tambien no hay dependencias funcionales .
En cuanto a la **3ºFN** no se cumple porque aunque cumpla la **2ºFN** pero si existen dependencias transitivas ya que tanto categoria como precio deberian de generar una tabla para evitar las repeticiones de contenido y la imposibilidad de actualizacion agil.
Tras la **3ºFN** nos quedarian el modelo E-R y el modelo Relacional de la siguiente forma.

### Modelo E-R

<img src="https://github.com/Cesardrom/basedatos/blob/main/Unidad-3/Tarea4/img/Diagrama%20E-R.png">

### Modelo Relacional

<img src="https://github.com/Cesardrom/basedatos/blob/main/Unidad-3/Tarea4/img/Diagrama%20Relacional(1).png">

### Base de datos

1. Creacion de las tablas e inserts.

```sql
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);

CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);

INSERT INTO productos (id, nombre, categoria, precio) VALUES 
    (1, 'Arroz', 'Alimentos', 2.5),
    (2, 'Leche', 'Lácteos', 1.8),
    (3, 'Pan', 'Panadería', 1.2),
    (4, 'Manzanas', 'Frutas', 3.0),
    (5, 'Pollo', 'Carnes', 5.5),
    (6, 'Huevos', 'Lácteos', 1.0),
    (7, 'Yogurt', 'Lácteos', 2.0),
    (8, 'Tomates', 'Verduras', 2.2),
    (9, 'Queso', 'Lácteos', 4.0),
    (10, 'Cereal', 'Desayuno', 3.5),
    (11, 'Papel Higiénico', 'Hogar', 1.5),
    (12, 'Cepillo de Dientes', 'Higiene', 2.0),
    (13, 'Detergente', 'Limpieza', 2.8),
    (14, 'Galletas', 'Snacks', 1.7),
    (15, 'Aceite de Oliva', 'Cocina', 4.5),
    (16, 'Café', 'Bebidas', 5.0),
    (17, 'Sopa enlatada', 'Conservas', 2.3),
    (18, 'Jabón de Baño', 'Higiene', 1.2),
    (19, 'Botellas de Agua', 'Bebidas', 1.0),
    (20, 'Cerveza', 'Bebidas', 3.8);

INSERT INTO ventas (id_producto, cantidad, fecha) VALUES 
    (1, 5, '2024-01-17'),
    (2, 3, '2024-01-17'),
    (4, 2, '2024-01-17'),
    (5, 1, '2024-01-17'),
    (6, 10, '2024-01-18'),
    (8, 4, '2024-01-18'),
    (10, 2, '2024-01-18'),
    (14, 7, '2024-01-19'),
    (16, 3, '2024-01-19'),
    (18, 6, '2024-01-20');
```

2. Mostrar todos los productos de la categoría "Bebidas"

```sql
SELECT * from productos 
   ...> where categoria="Bebidas";
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```

3. Listar los productos ordenados por precio de forma descendente.

```sql
SELECT * from productos order by precio desc;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 16 │ Café               │ Bebidas   │ 5.0    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
└────┴────────────────────┴───────────┴────────┘
```

4. Calcular el precio total de todos los productos en la tabla "productos".

```sql
SELECT avg(precio) as precio_total from productos ;
┌──────────────┐
│ precio_total │
├──────────────┤
│ 2.625        │
└──────────────┘
```

5. Encontrar los productos con un nombre que contenga la letra 'a'

```sql
SELECT * FROM  productos where nombre like '%a%';
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño    │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘
```

6. Obtener la cantidad total de productos vendidos en todas las fechas.

```sql
SELECT fecha, count(id_producto) as total_ventas from ventas group by fecha;
┌────────────┬──────────────┐
│   fecha    │ total_ventas │
├────────────┼──────────────┤
│ 2024-01-17 │ 4            │
│ 2024-01-18 │ 3            │
│ 2024-01-19 │ 2            │
│ 2024-01-20 │ 1            │
└────────────┴──────────────┘
```
7. Encontrar el producto más caro en cada categoría.

```sql
SELECT nombre, max(precio) as mas_caro from productos group by categoria
   ...> ;
┌────────────────────┬──────────┐
│       nombre       │ mas_caro │
├────────────────────┼──────────┤
│ Arroz              │ 2.5      │
│ Café               │ 5.0      │
│ Pollo              │ 5.5      │
│ Aceite de Oliva    │ 4.5      │
│ Sopa enlatada      │ 2.3      │
│ Cereal             │ 3.5      │
│ Manzanas           │ 3.0      │
│ Cepillo de Dientes │ 2.0      │
│ Papel Higiénico    │ 1.5      │
│ Detergente         │ 2.8      │
│ Queso              │ 4.0      │
│ Pan                │ 1.2      │
│ Galletas           │ 1.7      │
│ Tomates            │ 2.2      │
└────────────────────┴──────────┘

```
8. Listar los productos que no han sido vendidos.

```sql
elect *from productos where id not in(select p.id from productos as p, ventas as v where p.id = v.id_producto)
   ...> ;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘

```
9. Calcular el precio promedio de los productos en la categoría "Snacks".

```sql
select avg(precio) as precio_promedio from productos where categoria='Snacks';
┌─────────────────┐
│ precio_promedio │
├─────────────────┤
│ 1.7             │
└─────────────────┘

```
10. Encontrar los productos que han sido vendidos más de 5 veces.

```sql
Select * from productos where id in(select p.id from productos as p, ventas as v where p.id = v.id_producto and cantidad > 5);
┌────┬───────────────┬───────────┬────────┐
│ id │    nombre     │ categoria │ precio │
├────┼───────────────┼───────────┼────────┤
│ 6  │ Huevos        │ Lácteos   │ 1.0    │
│ 14 │ Galletas      │ Snacks    │ 1.7    │
│ 18 │ Jabón de Baño │ Higiene   │ 1.2    │
└────┴───────────────┴───────────┴────────┘

```
11. Mostrar la fecha y la cantidad de ventas para cada producto.

```sql
Select fecha, cantidad from ventas order by id_producto;
┌────────────┬──────────┐
│   fecha    │ cantidad │
├────────────┼──────────┤
│ 2024-01-17 │ 5        │
│ 2024-01-17 │ 3        │
│ 2024-01-17 │ 2        │
│ 2024-01-17 │ 1        │
│ 2024-01-18 │ 10       │
│ 2024-01-18 │ 4        │
│ 2024-01-18 │ 2        │
│ 2024-01-19 │ 7        │
│ 2024-01-19 │ 3        │
│ 2024-01-20 │ 6        │
└────────────┴──────────┘

```
12. Encontrar los productos que tienen un precio menor o igual a 2.

```sql
Select * from productos where precio <= 2;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 3  │ Pan                │ Panadería │ 1.2    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
└────┴────────────────────┴───────────┴────────┘

```
13. Calcular la cantidad total de ventas para cada fecha.

```sql
SELECT DISTINCT fecha, SUM(cantidad) as total_ventas FROM ventas GROUP BY fecha; 
┌────────────┬──────────────┐
│   fecha    │ total_ventas │
├────────────┼──────────────┤
│ 2024-01-17 │ 11           │
│ 2024-01-18 │ 16           │
│ 2024-01-19 │ 10           │
│ 2024-01-20 │ 6            │
└────────────┴──────────────┘
```
14. Listar los productos cuyo nombre comienza con la letra 'P'.

```sql
Select * from productos where nombre like('p%');
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 3  │ Pan             │ Panadería │ 1.2    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
└────┴─────────────────┴───────────┴────────┘

```
15. Obtener el producto más vendido en términos de cantidad.

```sql
SELECT p.nombre, MAX(v.cantidad) as producto_mas_vendido FROM productos as p, ventas as v WHERE p.id = v.id_producto;
┌────────┬──────────────────────┐
│ nombre │ producto_mas_vendido │
├────────┼──────────────────────┤
│ Huevos │ 10                   │
└────────┴──────────────────────┘

```
16. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

```sql
SELECT p.nombre, p.id, v.fecha from productos as p, ventas as v where v.fecha='2024-01-18' and p.id = v.id_producto;
┌─────────┬────┬────────────┐
│ nombre  │ id │   fecha    │
├─────────┼────┼────────────┤
│ Huevos  │ 6  │ 2024-01-18 │
│ Tomates │ 8  │ 2024-01-18 │
│ Cereal  │ 10 │ 2024-01-18 │
└─────────┴────┴────────────┘

```
17. Calcular el total de ventas para cada producto.

```sql
SELECT p.id, nombre, v.cantidad from productos as p, ventas as v WHERE p.id = v.id_producto;
┌────┬───────────────┬──────────┐
│ id │    nombre     │ cantidad │
├────┼───────────────┼──────────┤
│ 1  │ Arroz         │ 5        │
│ 2  │ Leche         │ 3        │
│ 4  │ Manzanas      │ 2        │
│ 5  │ Pollo         │ 1        │
│ 6  │ Huevos        │ 10       │
│ 8  │ Tomates       │ 4        │
│ 10 │ Cereal        │ 2        │
│ 14 │ Galletas      │ 7        │
│ 16 │ Café          │ 3        │
│ 18 │ Jabón de Baño │ 6        │
└────┴───────────────┴──────────┘
```
18. Encontrar los productos con un precio entre 3 y 4.

```sql
Select * from productos where precio BETWEEN 3 and 4;
┌────┬──────────┬───────────┬────────┐
│ id │  nombre  │ categoria │ precio │
├────┼──────────┼───────────┼────────┤
│ 4  │ Manzanas │ Frutas    │ 3.0    │
│ 9  │ Queso    │ Lácteos   │ 4.0    │
│ 10 │ Cereal   │ Desayuno  │ 3.5    │
│ 20 │ Cerveza  │ Bebidas   │ 3.8    │
└────┴──────────┴───────────┴────────┘

```
19. Listar los productos y sus categorías ordenados alfabéticamente por categoría.

```sql
Select nombre, categoria from productos order by categoria;
┌────────────────────┬───────────┐
│       nombre       │ categoria │
├────────────────────┼───────────┤
│ Arroz              │ Alimentos │
│ Café               │ Bebidas   │
│ Botellas de Agua   │ Bebidas   │
│ Cerveza            │ Bebidas   │
│ Pollo              │ Carnes    │
│ Aceite de Oliva    │ Cocina    │
│ Sopa enlatada      │ Conservas │
│ Cereal             │ Desayuno  │
│ Manzanas           │ Frutas    │
│ Cepillo de Dientes │ Higiene   │
│ Jabón de Baño      │ Higiene   │
│ Papel Higiénico    │ Hogar     │
│ Detergente         │ Limpieza  │
│ Leche              │ Lácteos   │
│ Huevos             │ Lácteos   │
│ Yogurt             │ Lácteos   │
│ Queso              │ Lácteos   │
│ Pan                │ Panadería │
│ Galletas           │ Snacks    │
│ Tomates            │ Verduras  │
└────────────────────┴───────────┘

```
20. Calcular el precio total de los productos vendidos en la fecha '2024-01-19'.

```sql
SELECT sum(p.precio), p.id, v.fecha from productos as p, ventas as v where v.fecha='2024-01-18' and p.id = v.id_producto;
┌───────────────┬────┬────────────┐
│ sum(p.precio) │ id │   fecha    │
├───────────────┼────┼────────────┤
│ 6.7           │ 6  │ 2024-01-18 │
└───────────────┴────┴────────────┘

```
21. Mostrar los productos que no pertenecen a la categoría "Higiene".

```sql
Select * from productos where categoria not in('Higiene');
┌────┬──────────────────┬───────────┬────────┐
│ id │      nombre      │ categoria │ precio │
├────┼──────────────────┼───────────┼────────┤
│ 1  │ Arroz            │ Alimentos │ 2.5    │
│ 2  │ Leche            │ Lácteos   │ 1.8    │
│ 3  │ Pan              │ Panadería │ 1.2    │
│ 4  │ Manzanas         │ Frutas    │ 3.0    │
│ 5  │ Pollo            │ Carnes    │ 5.5    │
│ 6  │ Huevos           │ Lácteos   │ 1.0    │
│ 7  │ Yogurt           │ Lácteos   │ 2.0    │
│ 8  │ Tomates          │ Verduras  │ 2.2    │
│ 9  │ Queso            │ Lácteos   │ 4.0    │
│ 10 │ Cereal           │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico  │ Hogar     │ 1.5    │
│ 13 │ Detergente       │ Limpieza  │ 2.8    │
│ 14 │ Galletas         │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva  │ Cocina    │ 4.5    │
│ 16 │ Café             │ Bebidas   │ 5.0    │
│ 17 │ Sopa enlatada    │ Conservas │ 2.3    │
│ 19 │ Botellas de Agua │ Bebidas   │ 1.0    │
│ 20 │ Cerveza          │ Bebidas   │ 3.8    │
└────┴──────────────────┴───────────┴────────┘

```
22. Encontrar la cantidad total de productos en cada categoría.

```sql
SELECT categoria, count(*) as cantidad_total from productos group by categoria;
┌───────────┬────────────────┐
│ categoria │ cantidad_total │
├───────────┼────────────────┤
│ Alimentos │ 1              │
│ Bebidas   │ 3              │
│ Carnes    │ 1              │
│ Cocina    │ 1              │
│ Conservas │ 1              │
│ Desayuno  │ 1              │
│ Frutas    │ 1              │
│ Higiene   │ 2              │
│ Hogar     │ 1              │
│ Limpieza  │ 1              │
│ Lácteos   │ 4              │
│ Panadería │ 1              │
│ Snacks    │ 1              │
│ Verduras  │ 1              │
└───────────┴────────────────┘

```
23. Listar los productos que tienen un precio igual a la media de precios.

```sql
SELECT id,nombre, precio from productos where precio = (SELECT AVG(precio) from productos);
```

No hay ningun producto con el mismo valor que la media
24. Calcular el precio total de los productos vendidos en cada fecha.

```sql
SELECT v.fecha, SUM(p.precio) as precio_total from productos as p , ventas as v  GROUP BY fecha;
┌────────────┬──────────────┐
│   fecha    │ precio_total │
├────────────┼──────────────┤
│ 2024-01-17 │ 210.0        │
│ 2024-01-18 │ 157.5        │
│ 2024-01-19 │ 105.0        │
│ 2024-01-20 │ 52.5         │
└────────────┴──────────────┘
```
25. Mostrar los productos con un nombre que termina con la letra 'o'.

```sql
SELECT * FROM productos WHERE (nombre LIKE '%o');
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 11 │ Papel Higiénico │ Hogar     │ 1.5    │
│ 18 │ Jabón de Baño   │ Higiene   │ 1.2    │
└────┴─────────────────┴───────────┴────────┘
```
26. Encontrar los productos que han sido vendidos en más de una fecha.

```sql
SELECT p.id, p.nombre from productos as p, ventas as v WHERE p.id  = v.id_producto GROUP BY p.id, p.nombre HAVING COUNT(DISTINCT v.fecha) > 1;
```

Vuelve a no producirse ninguna tabla debido a que no hay ningun producto que hayan sido vendidos en dos fechas
27. Listar los productos cuya categoría comienza con la letra 'L'.

```sql
Select * from productos where categoria like 'L%';
┌────┬────────────┬───────────┬────────┐
│ id │   nombre   │ categoria │ precio │
├────┼────────────┼───────────┼────────┤
│ 2  │ Leche      │ Lácteos   │ 1.8    │
│ 6  │ Huevos     │ Lácteos   │ 1.0    │
│ 7  │ Yogurt     │ Lácteos   │ 2.0    │
│ 9  │ Queso      │ Lácteos   │ 4.0    │
│ 13 │ Detergente │ Limpieza  │ 2.8    │
└────┴────────────┴───────────┴────────┘

```
28. Calcular el total de ventas para cada producto en la fecha '2024-01-17'.

29. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

```sql
SELECT * FROM productos WHERE LENGTH(nombre) >= 5;
┌────┬────────────────────┬───────────┬────────┐
│ id │       nombre       │ categoria │ precio │
├────┼────────────────────┼───────────┼────────┤
│ 1  │ Arroz              │ Alimentos │ 2.5    │
│ 2  │ Leche              │ Lácteos   │ 1.8    │
│ 4  │ Manzanas           │ Frutas    │ 3.0    │
│ 5  │ Pollo              │ Carnes    │ 5.5    │
│ 6  │ Huevos             │ Lácteos   │ 1.0    │
│ 7  │ Yogurt             │ Lácteos   │ 2.0    │
│ 8  │ Tomates            │ Verduras  │ 2.2    │
│ 9  │ Queso              │ Lácteos   │ 4.0    │
│ 10 │ Cereal             │ Desayuno  │ 3.5    │
│ 11 │ Papel Higiénico    │ Hogar     │ 1.5    │
│ 12 │ Cepillo de Dientes │ Higiene   │ 2.0    │
│ 13 │ Detergente         │ Limpieza  │ 2.8    │
│ 14 │ Galletas           │ Snacks    │ 1.7    │
│ 15 │ Aceite de Oliva    │ Cocina    │ 4.5    │
│ 17 │ Sopa enlatada      │ Conservas │ 2.3    │
│ 18 │ Jabón de Baño      │ Higiene   │ 1.2    │
│ 19 │ Botellas de Agua   │ Bebidas   │ 1.0    │
│ 20 │ Cerveza            │ Bebidas   │ 3.8    │
└────┴────────────────────┴───────────┴────────┘
```
30. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".

```sql
SELECT * from productos as p  WHERE p.precio > (SELECT AVG(precio) as precio_media FROM productos);
┌────┬─────────────────┬───────────┬────────┐
│ id │     nombre      │ categoria │ precio │
├────┼─────────────────┼───────────┼────────┤
│ 4  │ Manzanas        │ Frutas    │ 3.0    │
│ 5  │ Pollo           │ Carnes    │ 5.5    │
│ 9  │ Queso           │ Lácteos   │ 4.0    │
│ 10 │ Cereal          │ Desayuno  │ 3.5    │
│ 13 │ Detergente      │ Limpieza  │ 2.8    │
│ 15 │ Aceite de Oliva │ Cocina    │ 4.5    │
│ 16 │ Café            │ Bebidas   │ 5.0    │
│ 20 │ Cerveza         │ Bebidas   │ 3.8    │
└────┴─────────────────┴───────────┴────────┘
```
</div>
