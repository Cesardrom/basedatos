 ***Tarea con procedimientops y funciones***

<br>

## **Creacion e Insercion de la base de datos**

```sql
CREATE DATABASE IF NOT EXISTS ejercicios_db;
USE ejercicios_db;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    email VARCHAR(50)
);

INSERT INTO usuarios (nombre, edad, email) VALUES
('Juan', 25, 'juan@example.com'),
('María', 30, 'maria@example.com'),
('Pedro', 35, 'pedro@example.com'),
('Ana', 28, 'ana@example.com'),
('Luis', 40, 'luis@example.com'),
('Laura', 22, 'laura@example.com'),
('Carlos', 33, 'carlos@example.com'),
('Sofía', 27, 'sofia@example.com'),
('Diego', 29, 'diego@example.com'),
('Elena', 31, 'elena@example.com');
```
<br>

---

<br>

## **Procedimientos almacenados para insertar y modificacion**

---

#### *Procedimiento para insertar un nuevo usuario.*

<br>

```sql
delimiter //
create procedure insercionuser(in nombre varchar(100), in mail varchar(100))
begin
insert into Users (UserName, Email) values (nombre, mail);
end //

delimiter ;

call insercionuser('Jose', 'jose@example.com');

select * from Users;
```

<br>

---

#### *Procedimiento para actualizar el nombre de un usuario.*

<br>

```sql
delimiter //
create procedure actualizacion_nombre(in nombre varchar(100), in nombre_objetivo varchar(100))
begin
update Users set UserName=nombre where UserName=nombre_objetivo;
end //

delimiter ;

call actualizacion_nombre('Jose Domingo', 'Jose');

select * from Users;
```

<br>

---

## **Implementacion de funciones**

---

#### *Función para calcular el precio total de un conjunto de productos.*

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