***Tarea con Cursores***

<br>

## **Creacion e Insercion de la base de datos**

```sql
CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;


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

## **Cursor salario incrementado**

---

#### *Tabla sin aplicar el procedimiento*

<br>

```sql
select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3520.00 |
+----+--------+---------+
```

<br>

---

#### *Procedimiento entero*

<br>

```sql
  DELIMITER //
  CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
CALL aumentar_salarios(10);

  +----+--------+---------+
  | id | nombre | salario |
  +----+--------+---------+
  |  1 | Juan   | 3300.00 |
  |  2 | María  | 3850.00 |
  |  3 | Pedro  | 3520.00 |
  +----+--------+---------+

```
## **Ejercicios**

---

#### *Escribe un procedimiento almacenado que aumente los salarios de todos los empleados en un 5%, pero excluya a aquellos cuyo salario sea superior a 3200. El procedimiento debe tener parámetros de entrada.*

<br>

```sql
 DELIMITER //
  CREATE PROCEDURE aumentar_salarios(IN porcentaje DECIMAL(5,2), IN salario_min DECIMAL(10, 2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * (1 + porcentaje / 100) WHERE id = emp_id and salario > salario_min;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
CALL aumentar_salarios(5, 3200);


```

<br>

---

#### *Escribe un procedimiento almacenado que calcule el salario anual de cada empleado (asumiendo que trabajan todo el año) y lo imprima.*

<br>

```sql
 DELIMITER //
  CREATE PROCEDURE salario_anual(IN meses INT)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = salario * 12  WHERE id = emp_id;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
CALL aumentar_salarios(12);


```

<br>

---

#### *Escribe un procedimiento almacenado que cuente y muestre el número de empleados en cada rango de salario (por ejemplo, menos de 3000, entre 3000 y 5000, más de 5000). El procedimiento debe tener parámetros de entrada.*

<br>

```sql
 DELIMITER //
  CREATE PROCEDURE rango_salarios(IN salario_min DECIMAL(10, 2), IN salario_max DECIMAL(10, 2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id INT;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT id, nombre, salario FROM empleados;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id, emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          select id, nombre, salario from empleados where salario between salario_min and salario_max;
      END LOOP;
      CLOSE cur;
  END //
  DELIMITER ;
```

<br>

---

<br>

#### *Llamada y resultado*

<br>

```sql
CALL rango_salarios(0, 3000);
Call rango_salarios(3000, 5000)
Call rango_salarios(5000, 10000000)


```

<br>

---