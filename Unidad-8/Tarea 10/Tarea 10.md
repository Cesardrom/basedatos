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
BEFORE Update ON alumnos
FOR EACH ROW
BEGIN
    Insert into log_cambios_email(id_alumno, fecha_hora, old_email, new_email) values (OLD.id, date(Now), OLD.email, NEW.email);
END //
DELIMITER ;
```

<br>

---

<br>

### ***Crear Funcion auxiliar Generar_aleatorio***

<br>

---

<br>

```sql
drop function if exists Generar_aleatorio;
DELIMITER //
CREATE Function Generar_aleatorio(columna varchar(100), number_al int)returns varchar(100) deterministic 
begin
    return concat(columna, floor(Rand() + number_al));
end //

DELIMITER ;
```

<br>

---

<br>

### ***Crear procedimiento para insertar datos aleatorios***

<br>

---

<br>

```sql
drop procedure if exists insertar_alumnos_aleatorios;
DELIMITER //
CREATE PROCEDURE insertar_alumnos_aleatorios(IN cantidad INT, IN nombre_base Varchar(100), IN apellido1_base Varchar(100), IN apellido2_base Varchar(100))
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE nombre VARCHAR(50);
    DECLARE apellido1 VARCHAR(50);
    DECLARE apellido2 VARCHAR(50);
    DECLARE email VARCHAR(100);

    WHILE contador < cantidad DO
        SET nombre = Generar_aleatorio(nombre_base, contador);
        SET apellido1 = Generar_aleatorio(apellido1_base, contador);
        SET apellido2 = Generar_aleatorio(apellido2_base, contador);
        
        INSERT INTO alumnos (nombre, apellido1, apellido2, email) VALUES (nombre, apellido1, apellido2, NULL);
        SET contador = contador + 1;
    END WHILE;
END //
DELIMITER ;
```

<br>

---

<br>


### ***Verificación de funcionamiento***

<br>

---

<br>

```sql
CALL insertar_alumnos_aleatorios(10, 'Cesar', 'Dominguez', 'Romero');
SELECT * FROM alumnos;

+----+--------+------------+-----------+-------------------------------------+
| id | nombre | apellido1  | apellido2 | email                               |
+----+--------+------------+-----------+-------------------------------------+
|  1 | Cesar0 | Dominguez0 | Romero0   | cesar0dominguez0romero0@example.com |
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
```