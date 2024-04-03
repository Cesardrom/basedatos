--Elimine la tabla "alumno" si existe.

  --Consulta:
  drop table if exists alumnos;

  /**
  Query OK, 0 rows affected, 1 warning (0,01 sec)  
  **/

--Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).

--Consulta:
create table alumno (numero_inscripcion INT AUTO_INCREMENT, año_inscripcion INT, nombre VARCHAR(50), documento
VARCHAR(10), domicilio VARCHAR(100), ciudad VARCHAR(50), provincia VARCHAR(50), PRIMARY KEY(numero_inscripcion, año_inscripcion));

  /**
+--------------------+--------------+------+-----+---------+----------------+
| Field              | Type         | Null | Key | Default | Extra          |
+--------------------+--------------+------+-----+---------+----------------+
| numero_inscripcion | int          | NO   | PRI | NULL    | auto_increment |
| año_inscripcion    | int          | NO   | PRI | NULL    |                |
| nombre             | varchar(50)  | YES  |     | NULL    |                |
| documento          | varchar(10)  | YES  |     | NULL    |                |
| domicilio          | varchar(100) | YES  |     | NULL    |                |
| ciudad             | varchar(50)  | YES  |     | NULL    |                |
| provincia          | varchar(50)  | YES  |     | NULL    |                |
+--------------------+--------------+------+-----+---------+----------------+
  **/

--Define los siguientes indices:

--Un índice único por el campo "documento" y un índice común por ciudad y provincia.

--Consulta:
create UNIQUE index idx_doc ON alumno (documento);

create index idx_location ON alumno (ciudad, provincia);

/**
-- Query OK, 0 rows affected (0,01 sec)
-- Records: 0  Duplicates: 0  Warnings: 0
**/

--Vea los índices de la tabla.

--Consulta:
show index from alumno;

/**
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

--Intente ingresar un alumno con clave primaria repetida.

--Consulta:
insert into alumno (numero_inscripcion, año_inscripcion, nombre, documento, domicilio, ciudad, provincia) VALUES
(1, 2014, 'Jose', '7690774B', 'Hopitalet 20', 'Barcelona', 'Catalunya'),
(1, 2014, 'David', '8569342B', 'Toledo 5', 'Toledo', 'Madrid');

/**
ERROR 1062 (23000): Duplicate entry '1-2014' for key 'alumno.PRIMARY'
**/

    
--Intente ingresar un alumno con documento repetido.

--Consulta:
insert into alumno (numero_inscripcion, año_inscripcion, nombre, documento, domicilio, ciudad, provincia) VALUES
(2, 2020, 'Pablo', '7690774B', 'Rubí 55', 'Rubí', 'Catalunya');

/**
ERROR 1062 (23000): Duplicate entry '7690774B' for key 'alumno.idx_doc'
**/

    
--Ingrese varios alumnos de la misma ciudad y provincia.

--Consulta:
insert into alumno (numero_inscripcion, año_inscripcion, nombre, documento, domicilio, ciudad, provincia) VALUES
(3, 2014, 'German', '7690775C', 'Rubí 55', 'Rubí', 'Catalunya'), 
(4, 2021, 'Antonio', '7690776J', 'Rubí 55', 'Rubí', 'Catalunya');

/**
Query OK, 4 rows affected (0,00 sec)
Records: 2  Duplicates: 0  Warnings: 0
**/

--Elimina los indices creados, y muestra que ya no se encuentran. 

--Consulta:
DROP INDEX idx_doc ON alumno;
DROP INDEX idx_doc ON alumno;

/**
Query OK, 0 rows affected (0,02 sec)
Records: 0  Duplicates: 0  Warnings: 0
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table  | Non_unique | Key_name | Seq_in_index | Column_name        | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| alumno |          0 | PRIMARY  |            1 | numero_inscripcion | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| alumno |          0 | PRIMARY  |            2 | año_inscripcion    | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+--------+------------+----------+--------------+--------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

