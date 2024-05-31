--Diferencia de fechas 

CREATE DATABASE IF NOT EXISTS inventario;

-- Usar la base de datos
USE inventario;

-- Crear la tabla producto
DROP TABLE IF EXISTS producto;
CREATE TABLE producto (
    id INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    PRIMARY KEY (id)
);

-- Crear la tabla lote_producto
DROP TABLE IF EXISTS lote_producto;
CREATE TABLE lote_producto (
    id INT AUTO_INCREMENT,
    id_producto INT,
    fecha_recepcion DATETIME,
    cantidad INT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_producto) REFERENCES producto(id)
);
Crear la función para validar la fecha:

Crea una función que valide si han pasado al menos 30 días desde el último lote recibido del mismo producto.

sql
Copiar código
DROP FUNCTION IF EXISTS es_valido_recibir_lote;
DELIMITER //
CREATE FUNCTION es_valido_recibir_lote(id_prod INT) RETURNS BOOLEAN DETERMINISTIC
BEGIN
    DECLARE ultima_recepcion DATETIME;
    DECLARE dias_transcurridos INT;

    -- Obtener la fecha de la última recepción del producto
    SELECT MAX(fecha_recepcion) INTO ultima_recepcion
    FROM lote_producto
    WHERE id_producto = id_prod;

    -- Si no se ha recibido ningún lote previamente, es válido recibir el nuevo lote
    IF ultima_recepcion IS NULL THEN
        RETURN TRUE;
    END IF;

    -- Calcular los días transcurridos desde la última recepción
    SET dias_transcurridos = DATEDIFF(NOW(), ultima_recepcion);

    -- Verificar si han pasado al menos 30 días
    IF dias_transcurridos >= 30 THEN
        RETURN TRUE;
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

-- Valores de dominio 
CREATE TABLE persona(
    id INT AUTO_INCREMENT,
    id_texto VARCHAR(100),
    peso INT,
    admitido VARCHAR(2) CHECK (admitido IN ('Si', 'No')),
    sexo VARCHAR(1) CHECK (sexo IN ('H', 'M')),
    fecha DATETIME,
    PRIMARY KEY (id)
);