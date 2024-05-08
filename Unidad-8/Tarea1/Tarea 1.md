# ***Tarea administrar informacion de usuarios y productos***

<br>

## **Creacion de la base de datos**

```sql
CREATE DATABASE IF NOT EXISTS SimpleDB;

USE SimpleDB;

CREATE TABLE IF NOT EXISTS Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL
);
```
<br>

---

<br>

## **Insercion de la base de datos**

```sql
INSERT INTO Users (UserName, Email) VALUES ('Juan', 'juan@example.com');
INSERT INTO Users (UserName, Email) VALUES ('María', 'maria@example.com');
INSERT INTO Users (UserName, Email) VALUES ('Pedro', 'pedro@example.com');

INSERT INTO Products (ProductName, Price) VALUES ('Producto 1', 10.99);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 2', 20.50);
INSERT INTO Products (ProductName, Price) VALUES ('Producto 3', 15.75);
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