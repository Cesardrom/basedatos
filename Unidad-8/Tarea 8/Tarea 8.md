# ***Tarea sobre Alumnos***

<br>

## **Creacion de base de datos y tabla**

```sql
Create database if not exists test;

use test

drop table if exists alumnos;

Create Table if not exists alumnos (
Id INT primary key auto_increment,
Nombre varchar(100),
Apellido1 varchar(100),
Apellido2 varchar(100),
Nota Decimal(10, 2));
```

<br>

---

<br>

#### *Creacion de funcion auxiliar para los triggers*

<br>

---

<br>

```sql
drop function if exists reworked_mark;
DELIMITER //
CREATE Function reworked_mark(Nota decimal(10, 2))returns real deterministic 
begin
    if nota > 10 then
        return 10;
    elseif nota < 0 then
        return 0;
    else
        return nota;
    END if;
end //

DELIMITER ;
```
<br>

---

<br>

#### *Creacion de triger para la insercion*

<br>

---

<br>

```sql
drop trigger if exists trigger_check_nota_before_insert;
DELIMITER //
CREATE TRIGGER trigger_check_nota_before_insert 
Before INSERT ON alumnos
FOR EACH ROW
BEGIN 
    set NEW.nota = reworked_mark(NEW.nota);
END; //

DELIMITER ;
```
<br>

---

<br>

#### ***Realizamos las pruebas***

<br>

---

<br>

```sql

insert into alumnos(Nota) values (-15.0);

insert into alumnos(Nota) values (15.0);

select * from alumnos;

+----+--------+-----------+-----------+-------+
| Id | Nombre | Apellido1 | Apellido2 | Nota  |
+----+--------+-----------+-----------+-------+
|  1 | NULL   | NULL      | NULL      |  0.00 |
|  2 | NULL   | NULL      | NULL      | 10.00 |
+----+--------+-----------+-----------+-------+
```

<br>

---

<br>


#### ***Creacion de triger para modificacion***

<br>

---

<br>

```sql
drop Trigger if exists trigger_check_nota_before_update;
DELIMITER //
CREATE TRIGGER trigger_check_nota_before_update 
Before Update ON alumnos
FOR EACH ROW
BEGIN 
    set NEW.nota = reworked_mark(NEW.nota);
END; //

DELIMITER ;
```

<br>

---

<br>

#### ***Realizamos las pruebas***

<br>

---

<br>

```sql
update alumnos set nota = -5 where id = 1;

update alumnos set nota = 20 where id = 2;

select * from alumnos;

+----+--------+-----------+-----------+-------+
| Id | Nombre | Apellido1 | Apellido2 | Nota  |
+----+--------+-----------+-----------+-------+
|  1 | NULL   | NULL      | NULL      |  0.00 |
|  2 | NULL   | NULL      | NULL      | 10.00 |
+----+--------+-----------+-----------+-------+
```

<br>

---

<br>

#### ***Creacion de procedimiento para la insercion de datos***

<br>

---

<br>

```sql
drop procedure if exists insertar_alumnos;
DELIMITER //

CREATE PROCEDURE insertar_alumnos(IN ins_nombre_base Varchar(100),
IN ins_apellido1_base Varchar(100), IN ins_apellido2_base Varchar(100), IN num_alumnos INT, IN nota_min DECIMAL(10, 2), IN nota_max DECIMAL(10, 2))
BEGIN
    DECLARE contador INT DEFAULT 1;
    DECLARE ins_nombre VARCHAR(100);
    DECLARE ins_apellido1 VARCHAR(100);
    DECLARE ins_apellido2 VARCHAR(100);
    DECLARE ins_nota DECIMAL(10, 2);
    WHILE contador <= num_alumnos DO
        SET ins_nombre = concat(ins_nombre_base, floor(Rand() + contador));
        SET ins_apellido1 = concat(ins_apellido1_base, floor(Rand() + contador));
        SET ins_apellido2 = concat(ins_apellido2_base, floor(Rand() + contador));
        SET ins_nota = ROUND(RAND() * (nota_max - nota_min) + nota_min, 2);
        INSERT INTO alumnos (Nombre, Apellido1, Apellido2, Nota) VALUES (ins_nombre, ins_apellido1, ins_apellido2, ins_nota);
        SET contador = contador + 1;
    END WHILE;
END //

DELIMITER ;
```

<br>

---

<br>

#### ***Realizamos las pruebas***

<br>

---

<br>

```sql
call insertar_alumnos('Cesar', 'Dominguez', 'Romero', 5, 3, 10);

select * from alumnos;

+----+--------+------------+-----------+------+
| Id | Nombre | Apellido1  | Apellido2 | Nota |
+----+--------+------------+-----------+------+
|  1 | Cesar1 | Dominguez1 | Romero1   | 6.76 |
|  2 | Cesar2 | Dominguez2 | Romero2   | 5.48 |
|  3 | Cesar3 | Dominguez3 | Romero3   | 8.56 |
|  4 | Cesar4 | Dominguez4 | Romero4   | 9.71 |
|  5 | Cesar5 | Dominguez5 | Romero5   | 5.32 |
+----+--------+------------+-----------+------+

call insertar_alumnos('Serafin', 'Dominguez', 'Lorenzo', 10, -10, 12);

select * from alumnos;
+----+-----------+-------------+------------+------+
| Id | Nombre    | Apellido1   | Apellido2  | Nota |
+----+-----------+-------------+------------+------+
|  1 | Cesar1    | Dominguez1  | Romero1    | 6.76 |
|  2 | Cesar2    | Dominguez2  | Romero2    | 5.48 |
|  3 | Cesar3    | Dominguez3  | Romero3    | 8.56 |
|  4 | Cesar4    | Dominguez4  | Romero4    | 9.71 |
|  5 | Cesar5    | Dominguez5  | Romero5    | 5.32 |
|  6 | Serafin1  | Dominguez1  | Lorenzo1   | 0.00 |
|  7 | Serafin2  | Dominguez2  | Lorenzo2   | 0.00 |
|  8 | Serafin3  | Dominguez3  | Lorenzo3   | 0.00 |
|  9 | Serafin4  | Dominguez4  | Lorenzo4   | 0.00 |
| 10 | Serafin5  | Dominguez5  | Lorenzo5   | 0.00 |
| 11 | Serafin6  | Dominguez6  | Lorenzo6   | 3.24 |
| 12 | Serafin7  | Dominguez7  | Lorenzo7   | 2.26 |
| 13 | Serafin8  | Dominguez8  | Lorenzo8   | 0.00 |
| 14 | Serafin9  | Dominguez9  | Lorenzo9   | 0.00 |
| 15 | Serafin10 | Dominguez10 | Lorenzo10  | 0.00 |
+----+-----------+-------------+------------+------+
```

<br>

---

<br>