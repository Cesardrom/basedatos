# ***Tarea con Cursores***

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

## **Cursor salario incrementado**

---

#### *Tabla sin aplicar el procedimiento*

<br>

```sql
select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
```

<br>

---

## **Ejercicios**

---

#### *Escribe un procedimiento almacenado que copie los nombres de todos los empleados cuyo salario sea superior a 3000 en una nueva tabla llamada 'empleados_destino'. Es necesario crear la tabla empleados_destino.*

<br>

```sql
drop table if exists empleados_destino;

Create Table empleados_destino(nombre Varchar(100), salario Decimal(10, 2));

drop procedure if exists name_3000;

 DELIMITER //
  CREATE PROCEDURE name_3000(In salario_min decimal(10, 2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE emp_salario DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT nombre, salario FROM empleados where salario > salario_min;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_nombre, emp_salario;
          IF done THEN
              LEAVE read_loop;
          END IF;
          Insert into empleados_destino values (emp_nombre, emp_salario);
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
CALL name_300(3000);
select * from empleados_destino;

+--------+---------+
| nombre | salario |
+--------+---------+
| Juan   | 3465.00 |
| María  | 4042.50 |
| Pedro  | 3696.00 |
+--------+---------+
```

<br>

---

#### *Escribe un procedimiento almacenado que seleccione los empleados cuyos nombres contienen la letra 'a' y aumente sus salarios en un 10%.*

<br>

```sql
drop procedure if exists aumento_con_nombre;

 DELIMITER //
  CREATE PROCEDURE aumento_con_nombre(In porcentaje decimal(5, 2), In caracteres Varchar(100))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_nombre VARCHAR(100);
      DECLARE sal_emp DECIMAL(10, 2);
      DECLARE cur CURSOR FOR SELECT nombre, salario + (salario * (porcentaje / 100)) as aumento_salario FROM empleados where nombre=caracteres;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_nombre, sal_emp;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = sal_emp where nombre=emp_nombre;
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
select * from empleados;

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

call aumento_con_nombre(10, 'a');

select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3300.00 |
|  2 | María  | 3850.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+
```

<br>

---

#### *Escribe un procedimiento almacenado que seleccione empleados cuyos IDs estén en un rango específico, por ejemplo, entre 2 y 3.*

<br>

```sql
drop procedure if exists ids_rango;

 DELIMITER //
  CREATE PROCEDURE ids_rango(In min_ip int, in max_ip int)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_id int;
      DECLARE cur CURSOR FOR SELECT id from empleados where id between max_ip and min_ip;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_id;
          IF done THEN
              LEAVE read_loop;
          END IF;
          select emp_id;
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
call ids_rango(2, 3);
+--------+
| emp_id |
+--------+
| 2      |
+--------+
1 row in set (0,00 sec)

+--------+
| emp_id |
+--------+
| 3      |
+--------+
1 row in set (0,00 sec)

```

<br>

---

#### *Escribe un procedimiento almacenado que elimine todos los empleados cuyo salario esté entre 2000 y 2500.*

<br>

```sql
drop procedure if exists delete_menor;

 DELIMITER //
  CREATE PROCEDURE delete_menor(In min_sal int, in max_sal int)
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      DECLARE emp_sal decimal(10, 2);
      DECLARE cur CURSOR FOR SELECT salario from empleados where salario between min_sal and  max_sal;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_sal;
          IF done THEN
              LEAVE read_loop;
          END IF;
          delete from empleados where salario = emp_sal;
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
select * from empleados;

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

call delete_menor(3000, 3500);

select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  2 | María  | 3500.00 |
+----+--------+---------+


```

<br>

---

#### *Escribe un procedimiento almacenado que aumente el salario de un empleado específico cuyo nombre se pasa como parámetro en un 20%.*

<br>

```sql
drop procedure if exists aumentar_por_nombre;

 DELIMITER //
  CREATE PROCEDURE aumentar_por_nombre(in nombre_dado varchar(100), In porcentaje decimal(10, 2))
  BEGIN
      DECLARE done INT DEFAULT FALSE;
      declare emp_nombre Varchar(100);
      DECLARE sal_emp decimal(10, 2);
      DECLARE cur CURSOR FOR SELECT nombre, salario + (salario * (porcentaje / 100)) from empleados where nombre=nombre_dado;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

      OPEN cur;
      read_loop: LOOP
          FETCH cur INTO emp_nombre, sal_emp;
          IF done THEN
              LEAVE read_loop;
          END IF;
          UPDATE empleados SET salario = sal_emp where nombre=emp_nombre;
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
select * from empleados;

+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3000.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+

call aumentar_por_nombre('Juan', 20)

select * from empleados;
+----+--------+---------+
| id | nombre | salario |
+----+--------+---------+
|  1 | Juan   | 3600.00 |
|  2 | María  | 3500.00 |
|  3 | Pedro  | 3200.00 |
+----+--------+---------+


```

<br>

---