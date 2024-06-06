--Creacion de la base de datos 

CREATE DATABASE IF NOT EXISTS tienda;
USE tienda;

-- Tabla de Productos
DROP TABLE IF EXISTS productos;
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2),
    stock INT
);

-- Tabla de Clientes
DROP TABLE IF EXISTS clientes;
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

-- Tabla de Ventas
DROP TABLE IF EXISTS ventas;
CREATE TABLE IF NOT EXISTS ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Datos de ejemplo
INSERT INTO productos (nombre, precio, stock) VALUES
('Camiseta', 19.99, 50),
('Pantalón', 29.99, 30),
('Zapatos', 49.99, 20);

INSERT INTO clientes (nombre, email) VALUES
('Juan Pérez', 'juan@example.com'),
('María Gómez', 'maria@example.com'),
('Carlos López', 'carlos@example.com');

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
(1, 1, 2, '2024-05-01'),
(2, 2, 1, '2024-05-02'),
(3, 3, 1, '2024-05-03');


-- Crea un procedimiento que permita añadir datos aleatorios, en la tabla productos o clientes.

DROP FUNCTION IF EXISTS numero_aleatorio;
DELIMITER //
Create FUNCTION numero_aleatorio(max_number Integer) returns DECIMAL(10, 2) DETERMINISTIC
BEGIN
    RETURN RAND() * (max_number - 0 + 1 + 0);
END //
DELIMITER ;

DROP FUNCTION IF EXISTS texto_aleatorio;
DELIMITER //
Create FUNCTION texto_aleatorio(texto VARCHAR(100)) returns VARCHAR(100) DETERMINISTIC
BEGIN
    RETURN CONCAT(texto, SUBSTRING_INDEX(UUID(), '-', 1));
END //
DELIMITER ;

DROP FUNCTION IF EXISTS crear_email;
DELIMITER //

CREATE FUNCTION crear_email(nombre VARCHAR(50), dominio VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE email VARCHAR(100);
    SET email = CONCAT(
        LOWER(nombre),
        '@',
        LOWER(dominio)
    );
    RETURN email;
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS insert_al;
DELIMITER //
CREATE PROCEDURE insert_al(In tabla VARCHAR(100), IN cantidad INT, IN texto_base Varchar(100))
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE texto_ins Varchar(100);

    IF tabla = 'productos' THEN
        WHILE contador < cantidad DO
            set texto_ins = texto_aleatorio(texto_base);
            
            INSERT INTO productos (nombre, precio, stock) values (texto_base, numero_aleatorio(100), FLOOR(numero_aleatorio(50))); 
        SET contador = contador + 1;
        END WHILE;
    ELSEIF tabla = 'clientes' THEN
        WHILE contador < cantidad DO
            set texto_ins = crear_email(texto_base, 'example.com');
            
            INSERT INTO clientes (nombre, email) values (texto_aleatorio(texto_base), texto_ins);
        SET contador = contador + 1;
        END WHILE;     
    END IF;
END //
DELIMITER ;

Call insert_al('clientes', 10, 'César');
select * from clientes;

/**
+----+----------------+--------------------+
| id | nombre         | email              |
+----+----------------+--------------------+
|  1 | Juan Pérez     | juan@example.com   |
|  2 | María Gómez    | maria@example.com  |
|  3 | Carlos López   | carlos@example.com |
|  4 | César18d5755e  | césar@example.com  |
|  5 | César18d719b8  | césar@example.com  |
|  6 | César18d85893  | césar@example.com  |
|  7 | César18e34dba  | césar@example.com  |
|  8 | César18e4f4af  | césar@example.com  |
|  9 | César18e704b9  | césar@example.com  |
| 10 | César18e7c75b  | césar@example.com  |
| 11 | César18e86924  | césar@example.com  |
| 12 | César18e91b41  | césar@example.com  |
| 13 | César18e9c521  | césar@example.com  |
+----+----------------+--------------------+
**/

Call insert_al('productos', 5, 'Sombreros');
select * from productos;

/**
+----+-----------+--------+-------+
| id | nombre    | precio | stock |
+----+-----------+--------+-------+
|  1 | Camiseta  |  19.99 |    50 |
|  2 | Pantalón  |  29.99 |    30 |
|  3 | Zapatos   |  49.99 |    20 |
|  4 | Sombreros |  50.56 |    42 |
|  5 | Sombreros |  64.14 |    35 |
|  6 | Sombreros |  56.61 |    36 |
|  7 | Sombreros |  94.41 |    25 |
|  8 | Sombreros |  72.33 |     3 |
+----+-----------+--------+-------+
**/

-- Crea un procedimiento que permita actualizar el número de elementos  de un producto, teniendo como parámetros de entrada el id del producto,  y la cantidad de elementos a restar del producto.

DROP PROCEDURE IF EXISTS modificar_productos;
DELIMITER //
CREATE PROCEDURE modificar_productos(IN id_producto INT, IN cantidad_restar Int)
BEGIN
    DECLARE total_final Int;
    select stock from productos where id_producto = id into total_final;
    IF total_final > cantidad_restar THEN
        SET total_final = total_final - cantidad_restar;
    Else
        Set total_final = 0;
    End IF;
    UPDATE productos set stock = total_final where id = id_producto;

END //

DELIMITER ;

Call modificar_productos(4, 10);
select * from productos;

/**
+----+-----------+--------+-------+
| id | nombre    | precio | stock |
+----+-----------+--------+-------+
|  1 | Camiseta  |  19.99 |    50 |
|  2 | Pantalón  |  29.99 |    30 |
|  3 | Zapatos   |  49.99 |    20 |
|  4 | Sombreros |  50.56 |    32 |
|  5 | Sombreros |  64.14 |    35 |
|  6 | Sombreros |  56.61 |    36 |
|  7 | Sombreros |  94.41 |    25 |
|  8 | Sombreros |  72.33 |     3 |
+----+-----------+--------+-------+
**/

-- Crea un trigger que actualice la tabla de productos cuando se realice una venta, restando de un producto (id_producto) el número de elementos que se debe de restar (cantidad).

DROP trigger if EXISTS trigger_modificacion_producto;
DELIMITER //
CREATE TRIGGER trigger_modificacion_producto
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    Declare stock_producto Int;
    set stock_producto = cantidad_productos(NEW.producto_id);
    IF stock_producto > NEW.cantidad THEN
        set stock_producto = stock_producto - NEW.cantidad;
    ELSE
        set stock_producto = 0;
    END IF;
    UPDATE productos set stock = stock_producto WHERE NEW.producto_id = id;
END //
DELIMITER ;

INSERT INTO ventas (cliente_id, producto_id, cantidad, fecha) VALUES
(4, 2, 20, '2024-05-04'),
(8, 2, 20, '2024-05-05'),
(6, 8, 40, '2024-05-06');

select * from ventas;

/**
+----+------------+-------------+----------+------------+
| id | cliente_id | producto_id | cantidad | fecha      |
+----+------------+-------------+----------+------------+
|  1 |          1 |           1 |        2 | 2024-05-01 |
|  2 |          2 |           2 |        1 | 2024-05-02 |
|  3 |          3 |           3 |        1 | 2024-05-03 |
|  4 |          4 |           2 |       20 | 2024-05-04 |
|  5 |          8 |           2 |       20 | 2024-05-05 |
|  6 |          6 |           8 |       40 | 2024-05-06 |
+----+------------+-------------+----------+------------+
**/

select * from productos;

/**
+----+-----------+--------+-------+
| id | nombre    | precio | stock |
+----+-----------+--------+-------+
|  1 | Camiseta  |  19.99 |    50 |
|  2 | Pantalón  |  29.99 |     0 |
|  3 | Zapatos   |  49.99 |    20 |
|  4 | Sombreros |  50.56 |    32 |
|  5 | Sombreros |  64.14 |    35 |
|  6 | Sombreros |  56.61 |    36 |
|  7 | Sombreros |  94.41 |    25 |
|  8 | Sombreros |  72.33 |     0 |
+----+-----------+--------+-------+
**/

-- Crea una función que calcule el total de las ventas de un cliente.

DROP FUNCTION IF EXISTS ventas_totales;
DELIMITER //
Create FUNCTION ventas_totales(id_cliente Integer) returns Integer DETERMINISTIC
BEGIN
    Declare ventas_totales Integer;
    select count(cliente_id) from ventas where id_cliente=cliente_id GROUP BY cliente_id into ventas_totales;
    return ventas_totales;
END //
DELIMITER ;

select ventas_totales(1);

/**
+-------------------+
| ventas_totales(1) |
+-------------------+
|                 1 |
+-------------------+
**/

-- Crea una función que calcule la cantidad de productos en stock de un producto (producto_id).

DROP FUNCTION IF EXISTS cantidad_productos;
DELIMITER //
Create FUNCTION cantidad_productos(id_producto Integer) returns Integer DETERMINISTIC
BEGIN
    Declare stock_total Integer;
    select stock from productos where id_producto = id into stock_total;
    return stock_total;
END //
DELIMITER ;

select cantidad_productos(3);

/**
+-----------------------+
| cantidad_productos(2) |
+-----------------------+
|                    20 |
+-----------------------+
**/