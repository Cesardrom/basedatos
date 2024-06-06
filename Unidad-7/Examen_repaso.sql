-- Creación de la base de datos y uso de la misma
DROP DATABASE IF EXISTS Hotel;
CREATE DATABASE Hotel;
USE Hotel;

-- Creación y llenado de la tabla TipoServicio
DROP TABLE IF EXISTS TipoServicio;
CREATE TABLE TipoServicio (
  nombreServicio CHAR(10) NOT NULL,
  PRIMARY KEY (nombreServicio)
);

INSERT INTO TipoServicio VALUES ('Comedor');
INSERT INTO TipoServicio VALUES ('Lavandería');
INSERT INTO TipoServicio VALUES ('Parking');
INSERT INTO TipoServicio VALUES ('Recepción');

-- Creación y llenado de la tabla Pais
DROP TABLE IF EXISTS Pais;
CREATE TABLE Pais (
  pais CHAR(20) NOT NULL,
  PRIMARY KEY (pais)
);

INSERT INTO Pais VALUES ('Alemania');
INSERT INTO Pais VALUES ('España');
INSERT INTO Pais VALUES ('Francia');
INSERT INTO Pais VALUES ('Portugal');
INSERT INTO Pais VALUES ('Italia');

-- Creación y llenado de la tabla Cliente
DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente (
  idCliente CHAR(12) NOT NULL,
  pais CHAR(20) NOT NULL,
  nombre CHAR(12) NOT NULL,
  primerApellido CHAR(12) NOT NULL,
  segundoApellido CHAR(12),
  direccion CHAR(30) NOT NULL,
  telefono CHAR(12) NOT NULL,
  observaciones CHAR(50),
  PRIMARY KEY (idCliente),
  FOREIGN KEY (pais) REFERENCES Pais(pais)
);

INSERT INTO Cliente VALUES ('12345', 'España', 'Felipe', 'Iglesias', 'López', 'Avda Los Castros, 44', '942344444', 'Buen cliente');
INSERT INTO Cliente VALUES ('44444', 'España', 'Cristina', 'García', 'García', 'Calle Mayor, 67', '942456444', NULL);
INSERT INTO Cliente VALUES ('45678', 'Francia', 'Ludovic', 'Giuly', 'Bourquin', '18 avenue Alsacen Cour', '37890194', NULL);
INSERT INTO Cliente VALUES ('43215', 'Alemania', 'Hans', 'Schmidt', 'Müller', 'Hauptstrasse 123', '65890234', 'Cliente exigente');
INSERT INTO Cliente VALUES ('45680', 'Italia', 'Giulia', 'Bianchi', NULL, 'Via Verdi 5', '3209876543', NULL);

-- Creación y llenado de la tabla TipoHabitacion
DROP TABLE IF EXISTS TipoHabitacion;
CREATE TABLE TipoHabitacion (
  categoria INT NOT NULL,
  camas INT NOT NULL,
  exterior CHAR(2) NOT NULL CHECK (exterior IN ('Si', 'No')),
  salon CHAR(2) NOT NULL CHECK (salon IN ('Si', 'No')),
  terraza CHAR(2) NOT NULL CHECK (terraza IN ('Si', 'No')),
  PRIMARY KEY (categoria)
);

INSERT INTO TipoHabitacion VALUES (1, 1, 'Si', 'No', 'No');
INSERT INTO TipoHabitacion VALUES (2, 2, 'Si', 'No', 'No');
INSERT INTO TipoHabitacion VALUES (3, 3, 'Si', 'No', 'No');
INSERT INTO TipoHabitacion VALUES (4, 1, 'Si', 'Si', 'No');

-- Creación y llenado de la tabla Habitacion
DROP TABLE IF EXISTS Habitacion;
CREATE TABLE Habitacion (
  numHabitacion INT NOT NULL,
  tipoHabitacion INT NOT NULL,
  PRIMARY KEY (numHabitacion),
  FOREIGN KEY (tipoHabitacion) REFERENCES TipoHabitacion(categoria)
);

INSERT INTO Habitacion VALUES (101, 1);
INSERT INTO Habitacion VALUES (102, 1);
INSERT INTO Habitacion VALUES (103, 1);
INSERT INTO Habitacion VALUES (104, 2);
INSERT INTO Habitacion VALUES (105, 2);
INSERT INTO Habitacion VALUES (106, 3);
INSERT INTO Habitacion VALUES (107, 4);

-- Creación y llenado de la tabla Servicio
DROP TABLE IF EXISTS Servicio;
CREATE TABLE Servicio (
  idServicio INT NOT NULL,
  nombreServicio CHAR(10) NOT NULL,
  descripcion CHAR(30) NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  iva NUMERIC(5, 2) NOT NULL,
  fecha DATE NOT NULL,
  PRIMARY KEY (idServicio),
  FOREIGN KEY (nombreServicio) REFERENCES TipoServicio(nombreServicio)
);

INSERT INTO Servicio VALUES (1, 'Comedor', '1 menu del día', 10, 7, '2023-01-01');
INSERT INTO Servicio VALUES (2, 'Lavandería', 'Lavado de camisa', 2, 7, '2023-01-01');
INSERT INTO Servicio VALUES (3, 'Lavandería', 'Lavado de pantalon', 1, 7, '2023-01-01');

-- Creación y llenado de la tabla Temporada
DROP TABLE IF EXISTS Temporada;
CREATE TABLE Temporada (
  temporada INT NOT NULL,
  fechaInicio DATE NOT NULL,
  fechaFinal DATE NOT NULL,
  tipo CHAR(1) NOT NULL CHECK (tipo IN ('B', 'M', 'A')),
  PRIMARY KEY (temporada)
);

INSERT INTO Temporada VALUES (1, '2023-01-01', '2023-03-31', 'B');
INSERT INTO Temporada VALUES (2, '2023-04-01', '2023-05-31', 'M');
INSERT INTO Temporada VALUES (3, '2023-06-01', '2023-08-31', 'A');
INSERT INTO Temporada VALUES (4, '2023-09-01', '2023-10-31', 'M');
INSERT INTO Temporada VALUES (5, '2023-11-01', '2023-12-31', 'B');

-- Creación y llenado de la tabla PrecioHabitacion
DROP TABLE IF EXISTS PrecioHabitacion;
CREATE TABLE PrecioHabitacion (
  idPrecio INT NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  temporada INT NOT NULL,
  tipoHabitacion INT NOT NULL,
  PRIMARY KEY (idPrecio),
  FOREIGN KEY (temporada) REFERENCES Temporada(temporada),
  FOREIGN KEY (tipoHabitacion) REFERENCES TipoHabitacion(categoria)
);

INSERT INTO PrecioHabitacion VALUES (1, 30, 1, 1);
INSERT INTO PrecioHabitacion VALUES (2, 35, 2, 1);
INSERT INTO PrecioHabitacion VALUES (3, 40, 3, 1);
INSERT INTO PrecioHabitacion VALUES (4, 35, 4, 1);
INSERT INTO PrecioHabitacion VALUES (5, 30, 5, 1);
INSERT INTO PrecioHabitacion VALUES (6, 35, 1, 2);
INSERT INTO PrecioHabitacion VALUES (7, 40, 2, 2);
INSERT INTO PrecioHabitacion VALUES (8, 45, 3, 2);
INSERT INTO PrecioHabitacion VALUES (9, 40, 4, 2);
INSERT INTO PrecioHabitacion VALUES (10, 35, 5, 2);
INSERT INTO PrecioHabitacion VALUES (11, 40, 1, 3);
INSERT INTO PrecioHabitacion VALUES (12, 45, 2, 3);
INSERT INTO PrecioHabitacion VALUES (13, 50, 3, 3);
INSERT INTO PrecioHabitacion VALUES (14, 45, 4, 3);
INSERT INTO PrecioHabitacion VALUES (15, 40, 5, 3);
INSERT INTO PrecioHabitacion VALUES (16, 50, 1, 4);
INSERT INTO PrecioHabitacion VALUES (17, 55, 2, 4);
INSERT INTO PrecioHabitacion VALUES (18, 60, 3, 4);
INSERT INTO PrecioHabitacion VALUES (19, 55, 4, 4);
INSERT INTO PrecioHabitacion VALUES (20, 50, 5, 4);

-- Creación y llenado de la tabla ReservaHabitac
DROP TABLE IF EXISTS ReservaHabitac;
CREATE TABLE ReservaHabitac (
  idReserva INT AUTO_INCREMENT NOT NULL,
  fechaEntrada DATE NOT NULL,
  fechaSalida DATE NOT NULL,
  iva NUMERIC(5, 2) NOT NULL,
  numHabitacion INT NOT NULL,
  cliente CHAR(12) NOT NULL,
  PRIMARY KEY (idReserva),
  FOREIGN KEY (cliente) REFERENCES Cliente(idCliente),
  FOREIGN KEY (numHabitacion) REFERENCES Habitacion(numHabitacion)
);

INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-03-15', '2023-03-25', 0.07, 101, '12345');
INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-03-15', '2023-03-25', 0.07, 102, '12345');
INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-02-16', '2023-02-21', 0.07, 103, '12345');
INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-03-16', '2023-03-21', 0.07, 104, '44444');
INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-03-16', '2023-03-21', 0.07, 105, '44444');
INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-03-16', '2023-03-21', 0.07, 106, '44444');
INSERT INTO ReservaHabitac (fechaEntrada, fechaSalida, iva, numHabitacion, cliente)
VALUES ('2023-03-16', '2023-03-21', 0.07, 107, '44444');

-- Creación y llenado de la tabla Gasto
DROP TABLE IF EXISTS Gasto;
CREATE TABLE Gasto (
  idGasto INT AUTO_INCREMENT NOT NULL,
  idReserva INT NOT NULL,
  idServicio INT NOT NULL,
  fecha DATETIME NOT NULL,
  cantidad INT NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  PRIMARY KEY (idGasto),
  FOREIGN KEY (idReserva) REFERENCES ReservaHabitac(idReserva),
  FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
);

INSERT INTO Gasto (idReserva, idServicio, fecha, cantidad, precio)
VALUES (1, 1, '2023-03-15 12:00', 1, 10);
INSERT INTO Gasto (idReserva, idServicio, fecha, cantidad, precio)
VALUES (1, 1, '2023-03-15 11:00', 1, 10);
INSERT INTO Gasto (idReserva, idServicio, fecha, cantidad, precio)
VALUES (4, 2, '2023-03-15 09:30', 1, 2);

-- Consultas

-- 1. Habitación reservadas para el día 15 de marzo de 2023.
 select * from reservahabitac where fechaEntrada = '2023-03-15';
+-----------+--------------+-------------+------+---------------+---------+
| idReserva | fechaEntrada | fechaSalida | iva  | numHabitacion | cliente |
+-----------+--------------+-------------+------+---------------+---------+
|         1 | 2023-03-15   | 2023-03-25  | 0.07 |           101 | 12345   |
|         2 | 2023-03-15   | 2023-03-25  | 0.07 |           102 | 12345   |
+-----------+--------------+-------------+------+---------------+---------+

-- 2. Clientes procedentes de España y Francia.
 select * from cliente where pais in('España', 'Francia');
+-----------+---------+----------+----------------+-----------------+------------------------+-----------+---------------+
| idCliente | pais    | nombre   | primerApellido | segundoApellido | direccion              | telefono  | observaciones |
+-----------+---------+----------+----------------+-----------------+------------------------+-----------+---------------+
| 12345     | España  | Felipe   | Iglesias       | López           | Avda Los Castros, 44   | 942344444 | Buen cliente  |
| 44444     | España  | Cristina | García         | García          | Calle Mayor, 67        | 942456444 | NULL          |
| 45678     | Francia | Ludovic  | Giuly          | Bourquin        | 18 avenue Alsacen Cour | 37890194  | NULL          |
+-----------+---------+----------+----------------+-----------------+------------------------+-----------+---------------+
-- 3. Precios de los distintos tipos de habitación por temporada.

select ph.precio from PrecioHabitacion as ph join temporada as t on t.temporada=ph.temporada order by ph.temporada;
+--------+
| precio |
+--------+
|  30.00 |
|  35.00 |
|  40.00 |
|  50.00 |
|  35.00 |
|  40.00 |
|  45.00 |
|  55.00 |
|  40.00 |
|  45.00 |
|  50.00 |
|  60.00 |
|  35.00 |
|  40.00 |
|  45.00 |
|  55.00 |
|  30.00 |
|  35.00 |
|  40.00 |
|  50.00 |
+--------+
-- 4. Todos los clientes y aquellos que han realizado alguna reserva en marzo, indicando el nº de reserva.
 select c.*, rh.idReserva from cliente as c join reservaHabitac as rh on rh.cliente=c.idCliente ;
+-----------+--------+----------+----------------+-----------------+----------------------+-----------+---------------+-----------+
| idCliente | pais   | nombre   | primerApellido | segundoApellido | direccion            | telefono  | observaciones | idReserva |
+-----------+--------+----------+----------------+-----------------+----------------------+-----------+---------------+-----------+
| 12345     | España | Felipe   | Iglesias       | López           | Avda Los Castros, 44 | 942344444 | Buen cliente  |         1 |
| 12345     | España | Felipe   | Iglesias       | López           | Avda Los Castros, 44 | 942344444 | Buen cliente  |         2 |
| 12345     | España | Felipe   | Iglesias       | López           | Avda Los Castros, 44 | 942344444 | Buen cliente  |         3 |
| 44444     | España | Cristina | García         | García          | Calle Mayor, 67      | 942456444 | NULL          |         4 |
| 44444     | España | Cristina | García         | García          | Calle Mayor, 67      | 942456444 | NULL          |         5 |
| 44444     | España | Cristina | García         | García          | Calle Mayor, 67      | 942456444 | NULL          |         6 |
| 44444     | España | Cristina | García         | García          | Calle Mayor, 67      | 942456444 | NULL          |         7 |
+-----------+--------+----------+----------------+-----------------+----------------------+-----------+---------------+-----------+

-- 5. Clientes con el mismo primer apellido.
 SELECT *  FROM Cliente  WHERE primerApellido IN (   SELECT primerApellido    FROM Cliente    GROUP BY primerApellido    HAVING COUNT(*) > 1 );

-- 6. Gasto en servicios realizado por cada reserva.
 SELECT r.idReserva, SUM(g.cantidad * g.precio) AS totalGasto  FROM ReservaHabitac r JOIN Gasto g ON r.idReserva = g.idReserva GROUP BY r.idReserva;
+-----------+------------+
| idReserva | totalGasto |
+-----------+------------+
|         1 |      20.00 |
|         4 |       2.00 |
+-----------+------------+

-- 7. Precio del servicio más caro y del más barato.
 select max(precio), min(precio) from servicio;
+-------------+-------------+
| max(precio) | min(precio) |
+-------------+-------------+
|       10.00 |        1.00 |
+-------------+-------------+

-- 8. Precio de las habitaciones y sus respectivos tipos durante la temporada de verano (tipo 'A').
SELECT th.categoria, ph.precio FROM TipoHabitacion th JOIN PrecioHabitacion ph ON th.categoria = ph.tipoHabitacion JOIN Temporada t ON ph.temporada = t.temporada WHERE t.tipo = 'A';
+-----------+--------+
| categoria | precio |
+-----------+--------+
|         1 |  40.00 |
|         2 |  45.00 |
|         3 |  50.00 |
|         4 |  60.00 |
+-----------+--------+

-- Vistas

-- 1. Vista que devuelva los clientes cuyo apellido incluya la sílaba “le” ordenados por su identificador.

CREATE VIEW ClientesConLE AS
SELECT * 
FROM Cliente 
WHERE primerApellido REGEXP 'le' OR segundoApellido REGEXP 'le'
ORDER BY idCliente;


SELECT * FROM ClientesConLE;


DROP VIEW ClientesConLE;



-- 2. Vista que devuelva los clientes, ordenados por su primer apellido, que tengan alguna observación anotada.

CREATE VIEW ClientesConObservaciones as select * from cliente where observación is not null order by primerApellido;

SELECT * FROM ClientesConObservaciones;
DROP VIEW ClientesConObservaciones;
-- 3. Vista que devuelva los servicios cuyo precio supere los 5€ ordenados por su código de servicio.
CREATE VIEW ServiciosCaros AS  select * from servicio where precio > 5 order by idServicio;

SELECT * FROM ServiciosCaros;
DROP VIEW ServiciosCaros;
-- 4. Vista que devuelva los clientes que han utilizado el servicio de comedor.

CREATE VIEW ClientesConComedor AS SELECT c.* from cliente as c join ReservaHabitac as rh on rh.cliente = c.idCliente join gasto as g on g.idReserva = rh.idReserva join servicio as s on s.idServicio = g.idServicio where s.nombreServicio = 'Comedor';

SELECT * FROM ClientesConComedor;
DROP VIEW ClientesConComedor;
-- 5. Vista que devuelva las características de cada habitación reservada.
CREATE VIEW CaracteristicasHabitacionesReservadas AS select th.* from tipoHabitacion as th join Habitacion as h on h.tipoHabitacion = th.categoria join reservaHabitac as rh on h.numHabitacion = rh.numHabitacion;

SELECT * FROM CaracteristicasHabitacionesReservadas;
DROP VIEW CaracteristicasHabitacionesReservadas;
-- 6. Vista con los servicios que nunca han sido contratados.
CREATE VIEW ServiciosNoContratados AS
SELECT s.* 
FROM Servicio s
LEFT JOIN Gasto g ON s.idServicio = g.idServicio
WHERE g.idServicio IS NULL;

SELECT * FROM ServiciosNoContratados;
DROP VIEW ServiciosNoContratados;
-- 7. Vista que devuelva el nº de clientes por nacionalidad.
CREATE VIEW ClientesPorNacionalidad AS SELECT pais, COUNT(*) from cliente GROUP by pais;

SELECT * FROM ClientesPorNacionalidad;
DROP VIEW ClientesPorNacionalidad;

-- 8. Vista que devuelva el nº de habitaciones por categoría de habitación.
CREATE VIEW HabitacionesPorCategoria AS
SELECT tipoHabitacion, COUNT(*) AS numHabitaciones 
FROM Habitacion 
GROUP BY tipoHabitacion;

SELECT * FROM HabitacionesPorCategoria;
DROP VIEW HabitacionesPorCategoria;

-- 9. Vista que devuelva el nº de servicios que se ofrecen por tipo de servicio.
CREATE VIEW ServiciosPorTipo AS
SELECT nombreServicio, COUNT(*) AS numServicios 
FROM Servicio 
GROUP BY nombreServicio;

SELECT * FROM ServiciosPorTipo;
DROP VIEW ServiciosPorTipo;

-- 10. Vista que muestre todos los datos del cliente excepto las observaciones.
CREATE VIEW ClientesSinObservaciones AS
SELECT idCliente, pais, nombre, primerApellido, segundoApellido, direccion, telefono
FROM Cliente;

SELECT * FROM ClientesSinObservaciones;
DROP VIEW ClientesSinObservaciones;


-- 11. Vista que muestre el id, nombre y primer apellido de todos los clientes y el gasto total que han realizado en el hotel en sus diferentes estancias.
CREATE VIEW GastoTotalClientes AS select c.idCliente, c.nombre, c.primerApellido, sum(g.cantidad * g.precio)
from cliente as c join reservaHabitac as rh on rh.cliente = c.idCliente join gasto as g on g.idReserva = rh.idReserva 
GROUP BY c.idCliente, c.nombre, c.primerApellido;

SELECT * FROM GastoTotalClientes;
DROP VIEW GastoTotalClientes;


-- Índices

-- 1. Índice sobre el atributo pais de la tabla Cliente.
CREATE INDEX idx_pais ON Cliente(pais);

-- Consulta de análisis:
SELECT * FROM Cliente WHERE pais = 'España';


-- 2. Índice sobre el atributo numHabitacion de la tabla ReservaHabitac.
CREATE INDEX idx_numH on ReservaHabitac(numHabitacion);
-- Consulta de análisis:
SELECT * FROM reservahabitac where numHabitacion=101;

-- 3. Índice sobre el atributo nombreServicio de la tabla Servicio.
CREATE INDEX idx_nombreS on Servicio(nombreServicio);

-- Consulta de análisis:
SELECT * FROM Servicio where nombreServicio='Comedor';

/**
erDiagram
    Cliente {
        CHAR(12) idCliente PK
        CHAR(20) pais FK
    }
    
    Pais {
        CHAR(20) pais PK
    }
    
    TipoServicio {
        CHAR(10) nombreServicio PK
    }
    
    TipoHabitacion {
        INT categoria PK
    }
    
    Habitacion {
        INT numHabitacion PK
        INT tipoHabitacion FK
    }
    
    Servicio {
        INT idServicio PK
        CHAR(10) nombreServicio FK
    }
    
    Temporada {
        INT temporada PK
    }
    
    PrecioHabitacion {
        INT idPrecio PK
        INT temporada FK
        INT tipoHabitacion FK
    }
    
    ReservaHabitac {
        INT idReserva PK
        INT numHabitacion FK
        CHAR(12) cliente FK
    }
    
    Gasto {
        INT idGasto PK
        INT idReserva FK
        INT idServicio FK
    }
    
    Cliente ||--o{ Pais: "belongs to"
    Habitacion ||--o{ TipoHabitacion: "has"
    Servicio ||--o{ TipoServicio: "uses"
    PrecioHabitacion ||--o{ Temporada: "applies to"
    PrecioHabitacion ||--o{ TipoHabitacion: "applies to"
    ReservaHabitac ||--o{ Habitacion: "books"
    ReservaHabitac ||--o{ Cliente: "made by"
    Gasto ||--o{ ReservaHabitac: "part of"
    Gasto ||--o{ Servicio: "includes"
**/
