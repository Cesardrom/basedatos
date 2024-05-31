--¿Sabías que la gestión adecuada del inventario es crucial para el éxito de cualquier tienda? Aunque existen ciertas condiciones que debes cumplir para mantener un inventario eficiente. Descubre los requisitos básicos para la gestión de inventarios.

-- Para gestionar el inventario se deben cumplir varias condiciones:

-- El producto debe tener un precio superior a $0.
-- No haber recibido un nuevo lote del mismo producto en un periodo anterior a 30 días.
-- Teniendo en cuenta esta información se pide:

-- Crea una base de datos llamada inventario.


-- Crea una tabla llamada producto con los siguientes campos:

-- Identificador Auto Incremental (Integer) PK
-- Nombre del producto (Texto) 
-- Precio (Decimal)
-- Stock (Entero)
-- Categoría (Texto)
-- Fecha Última Entrada (Datetime)




-- Se pide:

-- Realiza los siguientes procedimientos:

-- (1) Realizar un procedimiento que realice la inserción de datos aleatorios en la tabla. El procedimiento debe recibir como parámetro de entrada, al menos, el número de registros que se desea insertar y se debe lanzar, al menos, en dos ocasiones, para verificar su correcto funcionamiento. Los datos deben ser aleatorios, es decir, en cada inserción se debe auto generar o seleccionar uno al azar, de los campos requeridos.




-- (2) Realiza un procedimiento que permita actualizar la fecha de última entrada, teniendo como parámetro de entrada el identificador del producto y una fecha.


-- (3) Crea un procedimiento llamado CalcularTotalStock que calcule la cantidad total de productos en stock por cada categoría y la almacene en una tabla llamada total_stock. La tabla total_stock debe tener dos columnas: categoria (texto) y cantidad_total (integer).



-- (4) Crea un procedimiento que permita eliminar una categoría de la tabla total_stock.



-- Realizar cada una de las siguientes funciones:

-- (1) Realiza una función que determine si un producto almacenado en la tabla producto puede recibir una nueva entrada. Para ello, la función recibe como parámetro de entrada el identificador del producto y una fecha de entrada. Revisa las condiciones para que un producto pueda o no recibir una nueva entrada. Posteriormente, actualice el valor de la última entrada del producto indicado con el parámetro de entrada.



-- (2) Realiza una función que determine cuál es la categoría con más productos en stock.



-- Triggers

-- (1) Realiza un trigger que actualice total_stock con cada una de las inserciones que se realicen en la tabla producto.



-- (2) Realiza un trigger que elimine todos los registros en la tabla producto cuando se elimine un registro de la tabla total_stock.


-- Crea una base de datos llamada inventario.
DROP DATABASE IF EXISTS inventario;
CREATE DATABASE inventario;
USE inventario;

-- Crea una tabla llamada producto con los campos especificados.
DROP TABLE IF EXISTS producto;
CREATE TABLE producto (
    Id INT AUTO_INCREMENT,
    Nombre VARCHAR(100),
    Precio DECIMAL(10, 2),
    Stock INT,
    Categoria VARCHAR(100),
    Fecha DATETIME,
    PRIMARY KEY(Id)
);

-- Crear funciones para generar datos aleatorios.
DROP FUNCTION IF EXISTS Random_varchar;
DELIMITER //
CREATE FUNCTION Random_varchar(columna VARCHAR(100), number INT) RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    RETURN CONCAT(columna, RAND() + number);
END //
DELIMITER ;

DROP FUNCTION IF EXISTS Random_number;
DELIMITER //
CREATE FUNCTION Random_number() RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
    RETURN RAND() * (1000 - 0 + 1 + 0);
END //
DELIMITER ;

-- Procedimiento para insertar datos aleatorios.
DROP PROCEDURE IF EXISTS insert_al;
DELIMITER //
CREATE PROCEDURE insert_al(IN iterations INT, IN nombre_base VARCHAR(100), IN categoria_ins VARCHAR(100))
BEGIN
    DECLARE contador INT DEFAULT 0;
    DECLARE nombre_ins VARCHAR(100);
    DECLARE precio_ins DECIMAL(10, 2);
    DECLARE stock_ins INT;
    
    WHILE contador < iterations DO
        SET nombre_ins = Random_varchar(nombre_base, contador);
        SET precio_ins = Random_number();
        SET stock_ins = FLOOR(RAND() * 100); -- Random stock quantity
        INSERT INTO producto (Nombre, Precio, Stock, Categoria, Fecha) 
        VALUES (nombre_ins, precio_ins, stock_ins, categoria_ins, NOW());
        SET contador = contador + 1;
    END WHILE;
END //
DELIMITER ;

-- Ejecutar el procedimiento de inserción de datos aleatorios.
CALL insert_al(10, 'Producto', 'Categoria1');
CALL insert_al(10, 'Producto', 'Categoria2');

-- Procedimiento para actualizar la fecha de última entrada.
DROP PROCEDURE IF EXISTS actualizar_fecha;
DELIMITER //
CREATE PROCEDURE actualizar_fecha(IN id_producto INT, IN fecha_nueva DATETIME)
BEGIN
    CALL upd_valid(id_producto, fecha_nueva);
END //
DELIMITER ;

-- Llamada al procedimiento de actualización de fecha.
CALL actualizar_fecha(1, '2024-07-29 17:17:23');

-- Tabla y procedimiento para calcular el total de stock por categoría.
DROP TABLE IF EXISTS total_stocks;
CREATE TABLE total_stocks (
    Id INT AUTO_INCREMENT,
    Categoria VARCHAR(100),
    Total_stock INT,
    PRIMARY KEY(Id)
);

DROP PROCEDURE IF EXISTS CalcularTotalStock;
DELIMITER //
CREATE PROCEDURE CalcularTotalStock()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE categoria_ins VARCHAR(100);
    DECLARE total_stock_ins INT;
    DECLARE cur CURSOR FOR SELECT Categoria, SUM(Stock) FROM producto GROUP BY Categoria;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO categoria_ins, total_stock_ins;
        IF done THEN
            LEAVE read_loop;
        END IF;
        INSERT INTO total_stocks (Categoria, Total_stock) VALUES (categoria_ins, total_stock_ins);
    END LOOP;
    CLOSE cur;
END //
DELIMITER ;

-- Ejecutar el procedimiento de cálculo de stock.
CALL CalcularTotalStock();
SELECT * FROM total_stocks;

-- Procedimiento para eliminar una categoría de la tabla total_stocks.
DROP PROCEDURE IF EXISTS del_total;
DELIMITER //
CREATE PROCEDURE del_total(IN categoria_del VARCHAR(100))
BEGIN
    DELETE FROM total_stocks WHERE Categoria = categoria_del;
END //
DELIMITER ;

-- Llamada al procedimiento de eliminación de categoría.
CALL del_total('Categoria1');
SELECT * FROM total_stocks;

-- Función para determinar si un producto puede recibir una nueva entrada.
DROP FUNCTION IF EXISTS upd_valid;
DELIMITER //
CREATE FUNCTION upd_valid(IN id_producto INT, IN fecha_nueva DATETIME) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE dias_transcurridos INT;
    DECLARE fecha_antigua DATETIME;
    SELECT Fecha INTO fecha_antigua FROM producto WHERE Id = id_producto;
    SET dias_transcurridos = DATEDIFF(fecha_nueva, fecha_antigua);
    IF dias_transcurridos >= 30 THEN
        UPDATE producto SET Fecha = fecha_nueva WHERE Id = id_producto;
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

-- Función para determinar la categoría con más productos en stock.
DROP FUNCTION IF EXISTS categoria_mayor_stock;
DELIMITER //
CREATE FUNCTION categoria_mayor_stock() RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
    DECLARE max_categoria VARCHAR(100);
    DECLARE max_stock INT;
    
    SELECT Categoria, SUM(Stock) AS total_stock 
    INTO max_categoria, max_stock 
    FROM producto 
    GROUP BY Categoria 
    ORDER BY total_stock DESC 
    LIMIT 1;
    
    RETURN max_categoria;
END //
DELIMITER ;

-- Trigger para actualizar total_stock con cada inserción en la tabla producto.
DROP TRIGGER IF EXISTS after_insert_producto;
DELIMITER //
CREATE TRIGGER after_insert_producto
AFTER INSERT ON producto
FOR EACH ROW
BEGIN
    DECLARE total INT;
    SELECT SUM(Stock) INTO total FROM producto WHERE Categoria = NEW.Categoria;
    DELETE FROM total_stocks WHERE Categoria = NEW.Categoria;
    INSERT INTO total_stocks (Categoria, Total_stock) VALUES (NEW.Categoria, total);
END //
DELIMITER ;

-- Trigger para eliminar todos los registros en la tabla producto cuando se elimina un registro de la tabla total_stock.
DROP TRIGGER IF EXISTS after_delete_total_stocks;
DELIMITER //
CREATE TRIGGER after_delete_total_stocks
AFTER DELETE ON total_stocks
FOR EACH ROW
BEGIN
    DELETE FROM producto WHERE Categoria = OLD.Categoria;
END //
DELIMITER ;

-- Para verificar los triggers, procedimientos y funciones
SELECT * FROM producto;
SELECT * FROM total_stocks;
SELECT categoria_mayor_stock() AS CategoriaConMayorStock;
