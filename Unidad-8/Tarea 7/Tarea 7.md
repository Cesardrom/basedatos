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
```

<br>

---

<br>

#### *Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico. Actualiza el valor en la tabla.*

<br>

---

<br>

```sql
delimiter //

create function subsidio_transporte(In id_dado int)returns real deterministic
begin
declare result real;
    select Salario_base * 0.07 from persona into result;
    update persona set Subsidio = result where id = id_dado;
return result
end //

delimiter ;
```
<br>

---

<br>

#### *Función salud: La salud que corresponde al 4% al salario básico. Actualiza el valor en la tabla.*

<br>

---

<br>

```sql
delimiter //

create function subsidio_transporte(in salario_base decimal(10, 2)) returns real deterministic
begin
declare result real;
set result = 0.07 * salario_base
return result
end //

delimiter ;
```

