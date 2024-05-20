# ***Tarea sobre salario***

<br>

## **Creacion de base de datos y tabla**

```sql
Create database if not exists Salario;

use Salario

drop table if exists persona;

Create Table if not exists persona (
Id INT primary key auto_increment,
Nombre varchar(100),
Salario_base Decimal(10, 2),
Subsidio Decimal(10, 2),
Salud Decimal(10, 2),
Pension Decimal(10, 2),
Bono Decimal(10, 2),
Integral Decimal(10, 2));
```

<br>

---

<br>

#### *Creacion del procedimiento del generador*

<br>

---

<br>

```sql
drop procedure if exists my_loop;
DELIMITER //
CREATE PROCEDURE my_loop(IN iterations INT, In nombre varchar(100), In min_salario Decimal(10, 2), In max_salario Decimal(10, 2))
BEGIN
    DECLARE counter INT DEFAULT 0;

    WHILE counter < iterations DO
        Insert into persona(nombre, Salario_base) values (concat(nombre, floor(Rand() + counter)), (FLOOR(min_salario + RAND() *(max_salario-min_salario))));
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
call my_loop(10, 'César', 1300, 2300);
select * from persona;
+----+---------+--------------+----------+-------+---------+------+----------+
| Id | Nombre  | Salario_base | Subsidio | Salud | Pension | Bono | Integral |
+----+---------+--------------+----------+-------+---------+------+----------+
|  1 | César0  |      2158.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  2 | César1  |      1825.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  3 | César2  |      1563.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  4 | César3  |      1572.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  5 | César4  |      2112.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  6 | César5  |      2289.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  7 | César6  |      1782.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  8 | César7  |      1565.00 |     NULL |  NULL |    NULL | NULL |     NULL |
|  9 | César8  |      1997.00 |     NULL |  NULL |    NULL | NULL |     NULL |
| 10 | César9  |      2162.00 |     NULL |  NULL |    NULL | NULL |     NULL |
+----+---------+--------------+----------+-------+---------+------+----------+
```

<br>

---

<br>

#### ***Creacion de funcion general para los porcentajes con salario base***

<br>

---

<br>

```sql
delimiter //

create function porcentaje_salario(Salario_base decimal(10, 2), porcentaje decimal(10, 2))returns real deterministic 
begin
    declare result real;
    set result = Salario_base * (porcentaje / 100)
return result;
end //

delimiter ;
```

<br>

---

<br>



