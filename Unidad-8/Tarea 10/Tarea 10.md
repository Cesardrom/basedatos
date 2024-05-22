# ***Trabajo con la BBDD Alumnos***

<br>

## *Crear base de datos y tabla nueva*
```sql
CREATE DATABASE IF NOT EXISTS test;
USE test;

drop table if exists log_cambios_email;
CREATE TABLE IF NOT EXISTS log_cambios_email(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora Date,
    old_email varchar(100),
    new_email varchar(100)
);

drop table if exists log_alumnos_eliminados;
CREATE TABLE IF NOT EXISTS log_alumnos_eliminados(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    fecha_hora Date,
    nombre Varchar(100),
    apellido1 Varchar(100),
    apellido2 Varchar(100),
    email varchar(100)
);
```
<br>

---

<br>


### ***Crear trigger trigger_guardar_email_after_update***

<br>

---

<br>

```sql
drop trigger if exists trigger_guardar_email_after_update;
DELIMITER //
CREATE TRIGGER trigger_guardar_email_after_update
after Update ON alumnos
FOR EACH ROW
BEGIN
    IF OLD.email <> NEW.email THEN
        Insert into log_cambios_email(id_alumno, fecha_hora, old_email, new_email) values (OLD.id, NOW() , OLD.email, NEW.email);
    END IF;
END //
DELIMITER ;
```

<br>

---

<br>

### ***Consultas para comprobar***

<br>

---

<br>

```sql
update alumnos set email="Cesar444@gmail.com" where id=1;

select * from alumnos;
+----+--------+------------+-----------+-------------------------------------+
| id | nombre | apellido1  | apellido2 | email                               |
+----+--------+------------+-----------+-------------------------------------+
|  1 | Cesar0 | Dominguez0 | Romero0   | Cesar444@gmail.com                  |
|  2 | Cesar1 | Dominguez1 | Romero1   | cesar1dominguez1romero1@example.com |
|  3 | Cesar2 | Dominguez2 | Romero2   | cesar2dominguez2romero2@example.com |
|  4 | Cesar3 | Dominguez3 | Romero3   | cesar3dominguez3romero3@example.com |
|  5 | Cesar4 | Dominguez4 | Romero4   | cesar4dominguez4romero4@example.com |
|  6 | Cesar5 | Dominguez5 | Romero5   | cesar5dominguez5romero5@example.com |
|  7 | Cesar6 | Dominguez6 | Romero6   | cesar6dominguez6romero6@example.com |
|  8 | Cesar7 | Dominguez7 | Romero7   | cesar7dominguez7romero7@example.com |
|  9 | Cesar8 | Dominguez8 | Romero8   | cesar8dominguez8romero8@example.com |
| 10 | Cesar9 | Dominguez9 | Romero9   | cesar9dominguez9romero9@example.com |
+----+--------+------------+-----------+-------------------------------------+

select * from log_cambios_email;
+----+-----------+------------+-------------------+--------------------+
| id | id_alumno | fecha_hora | old_email         | new_email          |
+----+-----------+------------+-------------------+--------------------+
|  1 |         1 | 2024-05-22 | Cesar44@gmail.com | Cesar444@gmail.com |
+----+-----------+------------+-------------------+--------------------+
```

### ***Crear trigger trigger_guardar_alumnos_eliminados***

<br>

---

<br>

```sql
drop trigger if exists trigger_guardar_alumnos_eliminados;
DELIMITER //
CREATE TRIGGER trigger_guardar_alumnos_eliminados
after delete ON alumnos
FOR EACH ROW
BEGIN
    Insert into log_alumnos_eliminados(id_alumno, fecha_hora, nombre, apellido1, apellido2, email) values (OLD.id, NOW(), OLD.nombre, OLD.apellido1, OLD.apellido2, OLD.email);
END //
DELIMITER ;
```

<br>

---

<br>

### ***Consultas para comprobar***

<br>

---

<br>

```sql
select * from alumnos;
+----+--------+------------+-----------+-------------------------------------+
| id | nombre | apellido1  | apellido2 | email                               |
+----+--------+------------+-----------+-------------------------------------+
|  1 | Cesar0 | Dominguez0 | Romero0   | Cesar444@gmail.com                  |
|  2 | Cesar1 | Dominguez1 | Romero1   | cesar1dominguez1romero1@example.com |
|  3 | Cesar2 | Dominguez2 | Romero2   | cesar2dominguez2romero2@example.com |
|  4 | Cesar3 | Dominguez3 | Romero3   | cesar3dominguez3romero3@example.com |
|  5 | Cesar4 | Dominguez4 | Romero4   | cesar4dominguez4romero4@example.com |
|  6 | Cesar5 | Dominguez5 | Romero5   | cesar5dominguez5romero5@example.com |
|  7 | Cesar6 | Dominguez6 | Romero6   | cesar6dominguez6romero6@example.com |
|  8 | Cesar7 | Dominguez7 | Romero7   | cesar7dominguez7romero7@example.com |
|  9 | Cesar8 | Dominguez8 | Romero8   | cesar8dominguez8romero8@example.com |
| 10 | Cesar9 | Dominguez9 | Romero9   | cesar9dominguez9romero9@example.com |
+----+--------+------------+-----------+-------------------------------------+

delete from alumnos where id=2;

select * from alumnos;
+----+--------+------------+-----------+-------------------------------------+
| id | nombre | apellido1  | apellido2 | email                               |
+----+--------+------------+-----------+-------------------------------------+
|  1 | Cesar0 | Dominguez0 | Romero0   | Cesar444@gmail.com                  |
|  3 | Cesar2 | Dominguez2 | Romero2   | cesar2dominguez2romero2@example.com |
|  4 | Cesar3 | Dominguez3 | Romero3   | cesar3dominguez3romero3@example.com |
|  5 | Cesar4 | Dominguez4 | Romero4   | cesar4dominguez4romero4@example.com |
|  6 | Cesar5 | Dominguez5 | Romero5   | cesar5dominguez5romero5@example.com |
|  7 | Cesar6 | Dominguez6 | Romero6   | cesar6dominguez6romero6@example.com |
|  8 | Cesar7 | Dominguez7 | Romero7   | cesar7dominguez7romero7@example.com |
|  9 | Cesar8 | Dominguez8 | Romero8   | cesar8dominguez8romero8@example.com |
| 10 | Cesar9 | Dominguez9 | Romero9   | cesar9dominguez9romero9@example.com |
+----+--------+------------+-----------+-------------------------------------+  

select * from log_alumnos_eliminados;
+----+-----------+------------+--------+------------+-----------+-------------------------------------+
| id | id_alumno | fecha_hora | nombre | apellido1  | apellido2 | email                               |
+----+-----------+------------+--------+------------+-----------+-------------------------------------+
|  1 |         2 | 2024-05-22 | Cesar1 | Dominguez1 | Romero1   | cesar1dominguez1romero1@example.com |
+----+-----------+------------+--------+------------+-----------+-------------------------------------+
```

