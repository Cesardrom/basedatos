# Tarea 4

### Modelo E-R

### Modelo Relacional 

### Normalizacion

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

```
7. Encontrar el producto más caro en cada categoría.

```sql

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

```
16. Mostrar los productos que fueron vendidos en la fecha '2024-01-18'.

```sql

```
17. Calcular el total de ventas para cada producto.

```sql

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

```
23. Listar los productos que tienen un precio igual a la media de precios.

```sql

```
24. Calcular el precio total de los productos vendidos en cada fecha.

```sql

```
25. Mostrar los productos con un nombre que termina con la letra 'o'.

```sql

```
26. Encontrar los productos que han sido vendidos en más de una fecha.

```sql

```
27. Listar los productos cuya categoría comienza con la letra 'L'.

```sql

```
28. Calcular el total de ventas para cada producto en la fecha '2024-01-17'.

```sql

```
29. Mostrar los productos cuyo nombre tiene al menos 5 caracteres.

```sql

```
30. Encontrar los productos que tienen un precio superior al precio máximo en la tabla "productos".

```sql

```