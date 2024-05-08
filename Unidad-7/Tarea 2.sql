--Elimine la tabla "cliente" si existe.

--Consulta:
drop table if exists cliente;

/**
Query OK, 0 rows affected, 1 warning (0,01 sec)
**/

--Cree la tabla si clave primaria y incluye a posteriori esta.

--Consulta:
alter table cliente add column id int;
alter table cliente add primary key (id);

/**
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| documento | char(8)     | NO   |     | NULL    |       |
| nombre    | varchar(30) | NO   |     | NULL    |       |
| domicilio | varchar(30) | YES  |     | NULL    |       |
| ciudad    | varchar(20) | YES  |     | NULL    |       |
| provincia | varchar(20) | YES  |     | NULL    |       |
| telefono  | varchar(11) | YES  |     | NULL    |       |
| id        | int         | NO   | PRI | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
**/


--Define los siguientes indices:

--Un índice único por el campo "documento" y un índice común por ciudad y provincia.

--Consulta:
create unique index idx_doc on cliente (documento);
create index idx_loc on cliente (ciudad, provincia);

/**
Query OK, 0 rows affected (0,12 sec)
Records: 0  Duplicates: 0  Warnings: 0
**/

--Vea los índices de la tabla.

--Consulta:
show index from cliente;

/**
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          0 | idx_doc  |            1 | documento   | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_loc  |            1 | ciudad      | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
| cliente |          1 | idx_loc  |            2 | provincia   | A         |           0 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/


--Agregue un índice único por el campo "telefono".

--Consulta:
create unique index idx_tel on cliente (telefono);

/**
Query OK, 0 rows affected (0,04 sec)
Records: 0  Duplicates: 0  Warnings: 0
**/

--Elimina los índices. 

--Consulta:
drop index idx_tel on cliente;
drop index idx_doc on cliente;
drop index idx_loc on cliente;

/**
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table   | Non_unique | Key_name | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| cliente |          0 | PRIMARY  |            1 | id          | A         |           0 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+---------+------------+----------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/