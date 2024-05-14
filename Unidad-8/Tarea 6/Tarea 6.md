# ***Tarea con Generacion Aleatorias***

<br>

## **Creacion e Insercion de la base de datos**

```sql
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;

drop table if exists empleados;

CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);


INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000.00),
('María', 3500.00),
('Pedro', 3200.00);
```
<br>

---

<br>

## **Procedimiento Base**

```sql
DELIMITER //

CREATE PROCEDURE my_loop(IN iterations INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        -- Coloca aquí el código que deseas ejecutar en cada iteración del bucle
        -- Por ejemplo, puedes imprimir el valor del contador
        SELECT counter;

        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;

-- Llama al procedimiento 
CALL my_loop(5);
```
---
<br>

## **Ejercicios**

---

#### *Inserta cinco filas en la tabla empleados con nombres aleatorios generados usando la función CONCAT() junto con RAND().*

<br>

```sql
drop procedure if exists Insert_Concat_Rand;
DELIMITER //

CREATE PROCEDURE Insert_Concat_Rand(IN iterations INT, IN max_salario INT, IN min_salario INT)
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (CONCAT('Empleado', RAND()), (FLOOR(min_salario + RAND() *(max_salario-min_salario))));
        SET counter = counter + 1;
    END WHILE;
END//

DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
CALL Insert_Concat_Rand(5, 10000, 2000);
select * from empleados;

+----+----------------------------+---------+
| id | nombre                     | salario |
+----+----------------------------+---------+
|  1 | Juan                       | 3000.00 |
|  2 | María                      | 3500.00 |
|  3 | Pedro                      | 3200.00 |
|  4 | Empleado0.6555866465490187 | 8477.00 |
|  5 | Empleado0.6555866465490187 | 3566.00 |
|  6 | Empleado0.6555866465490187 | 6401.00 |
|  7 | Empleado0.6555866465490187 | 3307.00 |
|  8 | Empleado0.6555866465490187 | 3331.00 |
+----+----------------------------+---------+
```

<br>

---

#### *Inserta tres filas en la tabla empleados con nombres aleatorios generados usando la función UUID().*

<br>

```sql
drop procedure if exists iNSERT_UUID;

 DELIMITER //
  CREATE PROCEDURE Insert_UUID(IN iterations INT, IN max_salario INT, IN min_salario INT)
    BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        VALUES (UUID(), (FLOOR(min_salario + RAND() *(max_salario-min_salario))));
        SET counter = counter + 1;
    END WHILE;
END//
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
CALL Insert_UUID(2, 10000, 2000);
select * from empleados;

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.34197827181031765          | 3684.00 |
|  5 | Empleado0.026953065792986255         | 6024.00 |
|  6 | Empleado0.4343040803766847           | 7299.00 |
|  7 | Empleado0.00920021162293871          | 2469.00 |
|  8 | Empleado0.26606757404847775          | 3233.00 |
|  9 | 364c40ee-1205-11ef-856a-080027077231 | 9779.00 |
| 10 | 55b56062-1205-11ef-856a-080027077231 | 5200.00 |
| 11 | 55b6a007-1205-11ef-856a-080027077231 | 2660.00 |
+----+--------------------------------------+---------+
```

<br>

---

#### *Inserta dos filas en la tabla empleados con nombres aleatorios generados usando la función RAND() junto con ORDER BY RAND()*

<br>

```sqL

drop procedure if exists INSERT_UUID;

 DELIMITER //
  CREATE PROCEDURE Insert_UUID(IN iterations INT, IN max_salario INT, IN min_salario INT)
    BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        INSERT INTO empleados (nombre, salario)
        SELECT CONCAT('Empleado', RAND()), (FLOOR(min_salario + RAND() *(max_salario-min_salario))) 
        FROM (SELECT 1 UNION SELECT 2) AS sub
        ORDER BY RAND()
        LIMIT 2;
        SET counter = counter + iterations;
    END WHILE;
END//
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
call insert_uuid(2, 10000, 2000);
select * from empleados;

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.34197827181031765          | 3684.00 |
|  5 | Empleado0.026953065792986255         | 6024.00 |
|  6 | Empleado0.4343040803766847           | 7299.00 |
|  7 | Empleado0.00920021162293871          | 2469.00 |
|  8 | Empleado0.26606757404847775          | 3233.00 |
|  9 | 364c40ee-1205-11ef-856a-080027077231 | 9779.00 |
| 10 | 55b56062-1205-11ef-856a-080027077231 | 5200.00 |
| 11 | 55b6a007-1205-11ef-856a-080027077231 | 2660.00 |
| 12 | Empleado0.8162125487031532           | 5541.00 |
| 13 | Empleado0.49699353007319713          | 3518.00 |
+----+--------------------------------------+---------+
```

<br>

---

#### *Inserta cuatro filas en la tabla empleados con nombres aleatorios generados usando la función SUBSTRING_INDEX(UUID(), '-', -1)*

<br>

```sql
drop procedure if exists INSERT_UUID;

 DELIMITER //
  CREATE PROCEDURE Insert_UUID(IN iterations INT, IN max_salario INT, IN min_salario INT)
    BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
         INSERT INTO empleados (nombre, salario)
VALUES (SUBSTRING_INDEX(UUID(), '-', -1), (FLOOR(min_salario + RAND() *(max_salario-min_salario))));
        SET counter = counter + 1;
    END WHILE;
END//
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
call insert_uuid(2, 10000, 2000);
select * from empleados;

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.34197827181031765          | 3684.00 |
|  5 | Empleado0.026953065792986255         | 6024.00 |
|  6 | Empleado0.4343040803766847           | 7299.00 |
|  7 | Empleado0.00920021162293871          | 2469.00 |
|  8 | Empleado0.26606757404847775          | 3233.00 |
|  9 | 364c40ee-1205-11ef-856a-080027077231 | 9779.00 |
| 10 | 55b56062-1205-11ef-856a-080027077231 | 5200.00 |
| 11 | 55b6a007-1205-11ef-856a-080027077231 | 2660.00 |
| 12 | Empleado0.8162125487031532           | 5541.00 |
| 13 | Empleado0.49699353007319713          | 3518.00 |
| 14 | 080027077231                         | 9915.00 |
| 15 | 080027077231                         | 3409.00 |
| 16 | 080027077231                         | 9300.00 |
| 17 | 080027077231                         | 2275.00 |
+----+--------------------------------------+---------+
```

<br>

---

#### *Inserta seis filas en la tabla empleados con nombres aleatorios generados usando la función RAND() y una semilla diferente.*

<br>

```sql
drop procedure if exists INSERT_UUID;

 DELIMITER //
  CREATE PROCEDURE Insert_UUID(IN iterations INT, IN max_salario INT, IN min_salario INT)
    BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
         INSERT INTO empleados (nombre, salario)
VALUES (CONCAT('Empleado', RAND(counter)), (FLOOR(min_salario + RAND() *(max_salario-min_salario))));
        SET counter = counter + 1;
    END WHILE;
END//
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
call insert_uuid(6, 10000, 2000);
select * from empleados;

+----+--------------------------------------+---------+
| id | nombre                               | salario |
+----+--------------------------------------+---------+
|  1 | Juan                                 | 3000.00 |
|  2 | María                                | 3500.00 |
|  3 | Pedro                                | 3200.00 |
|  4 | Empleado0.34197827181031765          | 3684.00 |
|  5 | Empleado0.026953065792986255         | 6024.00 |
|  6 | Empleado0.4343040803766847           | 7299.00 |
|  7 | Empleado0.00920021162293871          | 2469.00 |
|  8 | Empleado0.26606757404847775          | 3233.00 |
|  9 | 364c40ee-1205-11ef-856a-080027077231 | 9779.00 |
| 10 | 55b56062-1205-11ef-856a-080027077231 | 5200.00 |
| 11 | 55b6a007-1205-11ef-856a-080027077231 | 2660.00 |
| 12 | Empleado0.8162125487031532           | 5541.00 |
| 13 | Empleado0.49699353007319713          | 3518.00 |
| 14 | 080027077231                         | 9915.00 |
| 15 | 080027077231                         | 3409.00 |
| 16 | 080027077231                         | 9300.00 |
| 17 | 080027077231                         | 2275.00 |
| 18 | Empleado0.15522042769493574          | 5473.00 |
| 19 | Empleado0.40540353712197724          | 2541.00 |
| 20 | Empleado0.6555866465490187           | 2285.00 |
| 21 | Empleado0.9057697559760601           | 9806.00 |
| 22 | Empleado0.15595286540310166          | 8174.00 |
| 23 | Empleado0.40613597483014313          | 9450.00 |
+----+--------------------------------------+---------+

```

<br>

---