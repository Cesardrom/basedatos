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
delimiter //
create function suma_precio() returns real deterministic
begin
declare result real;
select sum(price) from Products into result;
return result
end //

delimiter ;

select suma_precio();
```

<br>

---

#### *Función para contar el número de usuarios.*

<br>

```sql
delimiter //
create function num_users() returns integer deterministic
begin
declare result integer;
select count(*) from Users into result;
return result;
end //

delimiter ;

select num_users();
```

---