#  Tarea 1 

#### *César Domínguez Romero*

-----

## Creacion de la base de datos

Creamos el archivo de la base de datos que se llamara Tarea1 a traves de este comando.


sqlite3 Tarea1.db

---

## Creacion de la tabla

Creamos la tabla que vamos a utilizar durante toda la tarea y en la que sus columnas seran (id, texto, entero, decimal, fecha y booleano) y la creamos a partir de estas lineas de codigo dentro de sqlite3.

```SQL
CREATE TABLE Ejemplo (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    texto TEXT NOT NULL,
    entero INTEGER NOT NULL,
    decimal REAL NOT NULL,
    fecha DATE NOT NULL,
    booleano BOOLEAN NOT NULL
);
```
---

## Insercion de valores

En este paso debemos de insertar los valores de cada columna en un total de 50 filas que tendra la tabla, y todo ello a partir de repetir el comando insert table mostrado seguidamente.


```SQL
INSERT INTO Ejemplo (texto, entero, decimal, fecha, booleano) VALUES ('Ejemplo1', 25, 10.5, '2022-05-15', 0 );
INSERT INTO Ejemplo (texto, entero, decimal, fecha, booleano) VALUES ('Ejemplo2', 63, 45.7, '2022-06-22', 1 );
INSERT INTO Ejemplo (texto, entero, decimal, fecha, booleano) VALUES ('Ejemplo3', 12, 30.0, '2022-07-10', 0 );
```

```SQL
INSERT INTO Ejemplo (texto, entero, decimal, fecha, booleano) VALUES ('Ejemplo48', 96, 25.6, '2026-04-08', 1 );
INSERT INTO Ejemplo (texto, entero, decimal, fecha, booleano) VALUES ('Ejemplo49', 28, 50.0, '2026-05-25', 0 );
INSERT INTO Ejemplo (texto, entero, decimal, fecha, booleano) VALUES ('Ejemplo50', 75, 85.3, '2026-06-11', 1 );
```
---

## Consultas de datos

Y tras esto realizaremos una consulta de todos los valores de la tabla despues de realizar un:

```SQL
.mode table;
```

Para ver la tabla de manera mas estetica despues de realizar la consulta que la realizaremos con el comando 

```SQL
SELECT * FROM Ejemplo;
```

Y nos mostrara lo siguiente:

```SQL
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15 | 0        |
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22 | 1        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10 | 0        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 7  | Ejemplo7  | 10     | 40.1    | 2022-11-17 | 0        |
| 8  | Ejemplo8  | 87     | 22.6    | 2022-12-03 | 1        |
| 9  | Ejemplo9  | 31     | 55.0    | 2023-01-20 | 0        |
| 10 | Ejemplo10 | 38     | 90.4    | 2023-02-14 | 1        |
| 11 | Ejemplo11 | 15     | 12.8    | 2023-03-22 | 0        |
| 12 | Ejemplo12 | 72     | 48.6    | 2023-04-09 | 1        |
| 13 | Ejemplo13 | 22     | 33.7    | 2023-05-01 | 0        |
| 14 | Ejemplo14 | 93     | 70.2    | 2023-06-18 | 1        |
| 15 | Ejemplo15 | 37     | 15.4    | 2023-07-05 | 0        |
| 16 | Ejemplo16 | 81     | 82.9    | 2023-08-11 | 1        |
| 17 | Ejemplo17 | 45     | 28.3    | 2023-09-27 | 0        |
| 18 | Ejemplo18 | 60     | 50.6    | 2023-10-15 | 1        |
| 19 | Ejemplo19 | 5      | 8.7     | 2023-11-22 | 0        |
| 20 | Ejemplo20 | 76     | 65.1    | 2023-12-08 | 1        |
| 21 | Ejemplo21 | 33     | 20.3    | 2024-01-14 | 0        |
| 22 | Ejemplo22 | 70     | 55.8    | 2024-02-29 | 1        |
| 23 | Ejemplo23 | 13     | 42.7    | 2024-03-18 | 0        |
| 24 | Ejemplo24 | 89     | 78.4    | 2024-04-25 | 1        |
| 25 | Ejemplo25 | 49     | 15.9    | 2024-05-12 | 0        |
| 26 | Ejemplo26 | 62     | 60.7    | 2024-06-20 | 1        |
| 27 | Ejemplo27 | 8      | 35.2    | 2024-07-07 | 0        |
| 28 | Ejemplo28 | 95     | 25.6    | 2024-08-23 | 1        |
| 29 | Ejemplo29 | 27     | 50.0    | 2024-09-10 | 0        |
| 30 | Ejemplo30 | 74     | 85.3    | 2024-10-05 | 1        |
| 31 | Ejemplo31 | 18     | 11.8    | 2024-11-12 | 0        |
| 32 | Ejemplo32 | 83     | 47.6    | 2024-12-28 | 1        |
| 33 | Ejemplo33 | 38     | 32.7    | 2025-01-15 | 0        |
| 34 | Ejemplo34 | 101    | 70.2    | 2025-02-01 | 1        |
| 35 | Ejemplo35 | 52     | 18.4    | 2025-03-20 | 0        |
| 36 | Ejemplo36 | 67     | 83.9    | 2025-04-06 | 1        |
| 37 | Ejemplo37 | 43     | 28.3    | 2025-05-13 | 0        |
| 38 | Ejemplo38 | 58     | 50.6    | 2025-06-30 | 1        |
| 39 | Ejemplo39 | 9      | 8.7     | 2025-07-17 | 0        |
| 40 | Ejemplo40 | 82     | 65.1    | 2025-08-23 | 1        |
| 41 | Ejemplo41 | 26     | 20.3    | 2025-09-09 | 0        |
| 42 | Ejemplo42 | 73     | 55.8    | 2025-10-26 | 1        |
| 43 | Ejemplo43 | 14     | 42.7    | 2025-11-13 | 0        |
| 44 | Ejemplo44 | 90     | 78.4    | 2025-12-30 | 1        |
| 45 | Ejemplo45 | 50     | 15.9    | 2026-01-16 | 0        |
| 46 | Ejemplo46 | 63     | 60.7    | 2026-02-03 | 1        |
| 47 | Ejemplo47 | 7      | 35.2    | 2026-03-22 | 0        |
| 48 | Ejemplo48 | 96     | 25.6    | 2026-04-08 | 1        |
| 49 | Ejemplo49 | 28     | 50.0    | 2026-05-25 | 0        |
| 50 | Ejemplo50 | 75     | 85.3    | 2026-06-11 | 1        |
+----+-----------+--------+---------+------------+----------+
```
---

Tambien podremos realizar diferentes consultas con el comando select utilizando otros comandos como WHERE, FROM, AND, OR y muchos comandos mas que podremos realizar con el comando SELECT y aqui tenemos 2 ejemplos de ello :


```SQL
SELECT entero
FROM Ejemplo 
WHERE ENTERO > 50;
```
### Resultado:

```SQL
+--------+
| entero |
+--------+
| 63     |
| 78     |
| 55     |
| 87     |
| 72     |
| 93     |
| 81     |
| 60     |
| 76     |
| 70     |
| 89     |
| 62     |
| 95     |
| 74     |
| 83     |
| 101    |
| 52     |
| 67     |
| 58     |
| 82     |
| 73     |
| 90     |
| 63     |
| 96     |
| 75     |
+--------+
```

En este ejemplo realizamos una consulta de la tabla Ejemplo donde nos muestran todos los numeros enteros que sean mayor que 50 en la tabla.

---

```SQL
SELECT id, entero, fecha
FROM Ejemplo
WHERE decimal > 40
;
```

### Resultado 

```SQL
+----+--------+------------+
| id | entero |   fecha    |
+----+--------+------------+
| 2  | 63     | 2022-06-22 |
| 4  | 78     | 2022-08-05 |
| 6  | 55     | 2022-10-08 |
| 7  | 10     | 2022-11-17 |
| 9  | 31     | 2023-01-20 |
| 10 | 38     | 2023-02-14 |
| 12 | 72     | 2023-04-09 |
| 14 | 93     | 2023-06-18 |
| 16 | 81     | 2023-08-11 |
| 18 | 60     | 2023-10-15 |
| 20 | 76     | 2023-12-08 |
| 22 | 70     | 2024-02-29 |
| 23 | 13     | 2024-03-18 |
| 24 | 89     | 2024-04-25 |
| 26 | 62     | 2024-06-20 |
| 29 | 27     | 2024-09-10 |
| 30 | 74     | 2024-10-05 |
| 32 | 83     | 2024-12-28 |
| 34 | 101    | 2025-02-01 |
| 36 | 67     | 2025-04-06 |
| 38 | 58     | 2025-06-30 |
| 40 | 82     | 2025-08-23 |
| 42 | 73     | 2025-10-26 |
| 43 | 14     | 2025-11-13 |
| 44 | 90     | 2025-12-30 |
| 46 | 63     | 2026-02-03 |
| 49 | 28     | 2026-05-25 |
| 50 | 75     | 2026-06-11 |
+----+--------+------------+
```
En este ejemplo realizamos una consulta de nuevo en la tabla ejemplo y le pedimos el id la fecha y el entero de las filas donde el decimal sea mayor que 40


## Eliminaciones de datos

Como primera elimininacion vamos a eliminar todas las filas donde los booleanos valen 1

```SQL

DELETE FROM Ejemplo WHERE booleano=1;

```
 Y como resultado nos queda esto asi.

 ```SQL
 +----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15 | 0        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7  | 10     | 40.1    | 2022-11-17 | 0        |
| 9  | Ejemplo9  | 31     | 55.0    | 2023-01-20 | 0        |
| 11 | Ejemplo11 | 15     | 12.8    | 2023-03-22 | 0        |
| 13 | Ejemplo13 | 22     | 33.7    | 2023-05-01 | 0        |
| 15 | Ejemplo15 | 37     | 15.4    | 2023-07-05 | 0        |
| 17 | Ejemplo17 | 45     | 28.3    | 2023-09-27 | 0        |
| 19 | Ejemplo19 | 5      | 8.7     | 2023-11-22 | 0        |
| 21 | Ejemplo21 | 33     | 20.3    | 2024-01-14 | 0        |
| 23 | Ejemplo23 | 13     | 42.7    | 2024-03-18 | 0        |
| 25 | Ejemplo25 | 49     | 15.9    | 2024-05-12 | 0        |
| 27 | Ejemplo27 | 8      | 35.2    | 2024-07-07 | 0        |
| 29 | Ejemplo29 | 27     | 50.0    | 2024-09-10 | 0        |
| 31 | Ejemplo31 | 18     | 11.8    | 2024-11-12 | 0        |
| 33 | Ejemplo33 | 38     | 32.7    | 2025-01-15 | 0        |
| 35 | Ejemplo35 | 52     | 18.4    | 2025-03-20 | 0        |
| 37 | Ejemplo37 | 43     | 28.3    | 2025-05-13 | 0        |
| 39 | Ejemplo39 | 9      | 8.7     | 2025-07-17 | 0        |
| 41 | Ejemplo41 | 26     | 20.3    | 2025-09-09 | 0        |
| 43 | Ejemplo43 | 14     | 42.7    | 2025-11-13 | 0        |
| 45 | Ejemplo45 | 50     | 15.9    | 2026-01-16 | 0        |
| 47 | Ejemplo47 | 7      | 35.2    | 2026-03-22 | 0        |
| 49 | Ejemplo49 | 28     | 50.0    | 2026-05-25 | 0        |
+----+-----------+--------+---------+------------+----------+
```
---

Realizamos una actualizacion en el campo texto cuando los enteros sean mayor que 30

```SQL
UPDATE Ejemplo set texto="Modificado"
   ...> WHERE entero > 30;
```


Y nos queda este resultado 
```SQL

+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Ejemplo1   | 25     | 10.5    | 2022-05-15 | 0        |
| 3  | Ejemplo3   | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Modificado | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7   | 10     | 40.1    | 2022-11-17 | 0        |
| 9  | Modificado | 31     | 55.0    | 2023-01-20 | 0        |
| 11 | Ejemplo11  | 15     | 12.8    | 2023-03-22 | 0        |
| 13 | Ejemplo13  | 22     | 33.7    | 2023-05-01 | 0        |
| 15 | Modificado | 37     | 15.4    | 2023-07-05 | 0        |
| 17 | Modificado | 45     | 28.3    | 2023-09-27 | 0        |
| 19 | Ejemplo19  | 5      | 8.7     | 2023-11-22 | 0        |
| 21 | Modificado | 33     | 20.3    | 2024-01-14 | 0        |
| 23 | Ejemplo23  | 13     | 42.7    | 2024-03-18 | 0        |
| 25 | Modificado | 49     | 15.9    | 2024-05-12 | 0        |
| 27 | Ejemplo27  | 8      | 35.2    | 2024-07-07 | 0        |
| 29 | Ejemplo29  | 27     | 50.0    | 2024-09-10 | 0        |
| 31 | Ejemplo31  | 18     | 11.8    | 2024-11-12 | 0        |
| 33 | Modificado | 38     | 32.7    | 2025-01-15 | 0        |
| 35 | Modificado | 52     | 18.4    | 2025-03-20 | 0        |
| 37 | Modificado | 43     | 28.3    | 2025-05-13 | 0        |
| 39 | Ejemplo39  | 9      | 8.7     | 2025-07-17 | 0        |
| 41 | Ejemplo41  | 26     | 20.3    | 2025-09-09 | 0        |
| 43 | Ejemplo43  | 14     | 42.7    | 2025-11-13 | 0        |
| 45 | Modificado | 50     | 15.9    | 2026-01-16 | 0        |
| 47 | Ejemplo47  | 7      | 35.2    | 2026-03-22 | 0        |
| 49 | Ejemplo49  | 28     | 50.0    | 2026-05-25 | 0        |
+----+------------+--------+---------+------------+----------+
```
---

Realizamos mas eliminaciones cuando los enteros son iguales a 50 

```SQL
DELETE FROM Ejemplo WHERE entero=50;
```

Y la tabla nos quedaria asi:

```SQL
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Ejemplo1   | 25     | 10.5    | 2022-05-15 | 0        |
| 3  | Ejemplo3   | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Modificado | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7   | 10     | 40.1    | 2022-11-17 | 0        |
| 9  | Modificado | 31     | 55.0    | 2023-01-20 | 0        |
| 11 | Ejemplo11  | 15     | 12.8    | 2023-03-22 | 0        |
| 13 | Ejemplo13  | 22     | 33.7    | 2023-05-01 | 0        |
| 15 | Modificado | 37     | 15.4    | 2023-07-05 | 0        |
| 17 | Modificado | 45     | 28.3    | 2023-09-27 | 0        |
| 19 | Ejemplo19  | 5      | 8.7     | 2023-11-22 | 0        |
| 21 | Modificado | 33     | 20.3    | 2024-01-14 | 0        |
| 23 | Ejemplo23  | 13     | 42.7    | 2024-03-18 | 0        |
| 25 | Modificado | 49     | 15.9    | 2024-05-12 | 0        |
| 27 | Ejemplo27  | 8      | 35.2    | 2024-07-07 | 0        |
| 29 | Ejemplo29  | 27     | 50.0    | 2024-09-10 | 0        |
| 31 | Ejemplo31  | 18     | 11.8    | 2024-11-12 | 0        |
| 33 | Modificado | 38     | 32.7    | 2025-01-15 | 0        |
| 35 | Modificado | 52     | 18.4    | 2025-03-20 | 0        |
| 37 | Modificado | 43     | 28.3    | 2025-05-13 | 0        |
| 39 | Ejemplo39  | 9      | 8.7     | 2025-07-17 | 0        |
| 41 | Ejemplo41  | 26     | 20.3    | 2025-09-09 | 0        |
| 43 | Ejemplo43  | 14     | 42.7    | 2025-11-13 | 0        |
| 47 | Ejemplo47  | 7      | 35.2    | 2026-03-22 | 0        |
| 49 | Ejemplo49  | 28     | 50.0    | 2026-05-25 | 0        |
+----+------------+--------+---------+------------+----------+
```
---

Otra modificacion es incrementar el entoro en 10 cuando el booleano sea igual a False

```SQL
UPDATE Ejemplo set entero = entero + 10 WHERE booleano = 0;
```

Y como resultado queda esta tabla.

```SQL
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Ejemplo1   | 35     | 10.5    | 2022-05-15 | 0        |
| 3  | Ejemplo3   | 22     | 30.0    | 2022-07-10 | 0        |
| 5  | Modificado | 52     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7   | 20     | 40.1    | 2022-11-17 | 0        |
| 9  | Modificado | 41     | 55.0    | 2023-01-20 | 0        |
| 11 | Ejemplo11  | 25     | 12.8    | 2023-03-22 | 0        |
| 13 | Ejemplo13  | 32     | 33.7    | 2023-05-01 | 0        |
| 15 | Modificado | 47     | 15.4    | 2023-07-05 | 0        |
| 17 | Modificado | 55     | 28.3    | 2023-09-27 | 0        |
| 19 | Ejemplo19  | 15     | 8.7     | 2023-11-22 | 0        |
| 21 | Modificado | 43     | 20.3    | 2024-01-14 | 0        |
| 23 | Ejemplo23  | 23     | 42.7    | 2024-03-18 | 0        |
| 25 | Modificado | 59     | 15.9    | 2024-05-12 | 0        |
| 27 | Ejemplo27  | 18     | 35.2    | 2024-07-07 | 0        |
| 29 | Ejemplo29  | 37     | 50.0    | 2024-09-10 | 0        |
| 31 | Ejemplo31  | 28     | 11.8    | 2024-11-12 | 0        |
| 33 | Modificado | 48     | 32.7    | 2025-01-15 | 0        |
| 35 | Modificado | 62     | 18.4    | 2025-03-20 | 0        |
| 37 | Modificado | 53     | 28.3    | 2025-05-13 | 0        |
| 39 | Ejemplo39  | 19     | 8.7     | 2025-07-17 | 0        |
| 41 | Ejemplo41  | 36     | 20.3    | 2025-09-09 | 0        |
| 43 | Ejemplo43  | 24     | 42.7    | 2025-11-13 | 0        |
| 47 | Ejemplo47  | 17     | 35.2    | 2026-03-22 | 0        |
| 49 | Ejemplo49  | 38     | 50.0    | 2026-05-25 | 0        |
+----+------------+--------+---------+------------+----------+
```
---

Ahora eliminaremos todos los campos donde el decimal sea menor de 50.

```SQL
DELETE FROM Ejemplo WHERE decimal < 50;
```

Y la tabla resultante es 

```SQL
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 9  | Modificado | 41     | 55.0    | 2023-01-20 | 0        |
| 29 | Ejemplo29  | 37     | 50.0    | 2024-09-10 | 0        |
| 49 | Ejemplo49  | 38     | 50.0    | 2026-05-25 | 0        |
+----+------------+--------+---------+------------+----------+
```

---

Y por ultimo modificamos todas las fechas a la fecha actual.

```SQL
UPDATE Ejemplo set fecha = '2023-12-15' WHERE booleano = 0;
```

Y la tabla nos quedaria asi:

```SQL
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 9  | Modificado | 41     | 55.0    | 2023-12-15 | 0        |
| 29 | Ejemplo29  | 37     | 50.0    | 2023-12-15 | 0        |
| 49 | Ejemplo49  | 38     | 50.0    | 2023-12-15 | 0        |
+----+------------+--------+---------+------------+----------+
```