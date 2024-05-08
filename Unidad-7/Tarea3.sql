--Creamos la database.

    Create database if not exists Base_indices;

-- Usamos esa database

    use Base_indices;

-- Creamos la tabla movimiento

    Create table if not exists movimiento ( id int auto_increment,  articulo varchar(50) not null, fecha date not null, cantidad int not null, primary key(id));

    describe movimiento;

    /**
+----------+-------------+------+-----+---------+----------------+
| Field    | Type        | Null | Key | Default | Extra          |
+----------+-------------+------+-----+---------+----------------+
| id       | int         | NO   | PRI | NULL    | auto_increment |
| articulo | varchar(50) | NO   |     | NULL    |                |
| fecha    | date        | NO   |     | NULL    |                |
| cantidad | int         | NO   |     | NULL    |                |
+----------+-------------+------+-----+---------+----------------+
    **/

-- Hacemos la copia y todas las inserciones aleatorias.

    CREATE TABLE NumerosUnicos ( Numero INT AUTO_INCREMENT PRIMARY KEY);

    INSERT INTO NumerosUnicos (Numero) SELECT NULL FROM INFORMATION_SCHEMA.COLUMNS LIMIT 5000;

    INSERT INTO movimiento (id, articulo, fecha, cantidad) SELECT      n.Numero,     CONCAT('Producto', n.Numero), DATE_ADD('2012-01-01', INTERVAL FLOOR(RAND() * 120) DAY),     FLOOR(RAND() * 1000000) + 1 FROM      NumerosUnicosn;

    DROP TABLE NumerosUnicos;

    create table MOVIMIENTO_BIS select * from movimiento;

    describe MOVIMIENTO_BIS;

    /**
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| id       | int         | NO   |     | 0       |       |
| articulo | varchar(50) | NO   |     | NULL    |       |
| fecha    | date        | NO   |     | NULL    |       |
| cantidad | int         | NO   |     | NULL    |       |
+----------+-------------+------+-----+---------+-------+
    **/

--Utilizando EXPLAIN observa el plan de ejecución de la consulta que devuelve toda la información de los movimientos con identificador=3. Tanto en la tabla MOVIMIENTOS como en la tabla MOVIMIENTOS_bis. Escribe tus conclusiones al respecto.

    Explain select id from movimiento where id=3;

    /**
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | movimiento | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
    **/

    Explain select id from MOVIMIENTO_BIS where id=3;

    /**
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table          | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3592 |    10.00 | Using where |
+----+-------------+----------------+------------+------+---------------+------+---------+------+------+----------+-------------+
    **/


-- Conclusion: Se diferencia en que cambian diferentes campos como el ser primary key entre una tabla a la otra ademas de buscar en toda la tabla en la 2 tabla

--Supongamos que las consultas de rango que se van a hacer en nuestra tabla son frecuentes y además no por el identificador, sino por la fecha. Este es motivo suficiente para que sea la fecha un índice de tabla y así mejorar el tiempo de respuesta de nuestras consultas. En la tabla MOVIMIENTO_BIS creamos un índice para la fecha (IX_FECHA_BIS) y otro índice para el identificador (IX_IDENTIFICADOR).

    create index IX_FECHA_BIS on MOVIMIENTO_BIS (fecha);

    create index IX_ID on MOVIMIENTO_BIS (id);

--Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

    explain select * from MOVIMIENTO_BIS where id=3;

    /**
+----+-------------+----------------+------------+------+---------------+-------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key   | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+-------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_ID         | IX_ID | 4       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+-------+---------+-------+------+----------+-------+

    **/

    explain select id from movimiento where id=3;

    /**
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
| id | select_type | table      | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra       |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
|  1 | SIMPLE      | movimiento | NULL       | const | PRIMARY       | PRIMARY | 4       | const |    1 |   100.00 | Using index |
+----+-------------+------------+------------+-------+---------------+---------+---------+-------+------+----------+-------------+
    **/

    --Fíjata en que en la consulta 1 pedimos todos los campos. ¿A través de que indice se busca? ¿Por qué crees que lo hace así? En la consulta 2 solo pedimos el identificador. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

-- Conclusion: En movimiento se busca por la primary key y  sobre la otra se busca sobre IX_ID, para evitar ir buscando en toda la tabla

--Analiza el plan de ejecución de las siguientes consultas y observa la diferencia:

    describe SELECT fecha FROM movimiento WHERE fecha BETWEEN 01/01/2012 and 01/03/2012;

    /**
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | movimiento | NULL       | ALL  | NULL          | NULL | NULL    | NULL | 3592 |    10.00 | Using where |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------------+
    **/

    describe SELECT * FROM MOVIMIENTO_BIS WHERE fecha BETWEEN 01/01/2012 and 01/03/2012;

    /**
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
| id | select_type | table          | partitions | type | possible_keys | key          | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | MOVIMIENTO_BIS | NULL       | ref  | IX_FECHA_BIS  | IX_FECHA_BIS | 3       | const |    1 |   100.00 | NULL  |
+----+-------------+----------------+------------+------+---------------+--------------+---------+-------+------+----------+-------+
    **/

    --Fijate que en la consulta 2 pedimos todos los campos. ¿A través de que índice busca? ¿Por qué crees que lo hace así? En la consulta 1 solo pedimos la fecha. ¿A través de que índice busca? ¿Por qué crees que lo hace así? Analiza la ejecución.

-- Conclusion: Mientras que en movimiento se busca por todas las filas y en la otra busca solo en una porque en una tiene el indice creado mientras que en movimineto no hay index

--