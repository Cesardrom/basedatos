<div align="justify">

# Tarea 2

### Propietarios

1. Creacion de la tabla de propietarios

```sql
CREATE TABLE Propietarios (
  ...> id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  ...> nombre TEXT NOT NULL,
  ...> apellido TEXT NOT NULL,
  ...> dni TEXT unicode );
```


2. Realizamos todos los inserts de la tabla Propietarios 

```sql


INSERT INTO Propietarios (nombre,apellido,dni) VALUES('Roberto','Blanco','13131313O');
INSERT INTO Propietarios (nombre,apellido,dni) VALUES('Natalia','Paredes','14141414P');
INSERT INTO Propietarios (nombre,apellido,dni) VALUES('Fernando','Herrera','15151515Q');
INSERT INTO Propietarios (nombre,apellido,dni) VALUES('Clara','Soto','16161616R');
INSERT INTO Propietarios (nombre,apellido,dni) VALUES('Sergio','Mendoza','17171717S');
INSERT INTO Propietarios (nombre,apellido,dni) VALUES('Patricia','Navarro','18181818T');


```

3. Realizamos un comando SELECT * FROM Propietarios despues de utilizar un .mode table quedandonos esta ilustracion grafica de la tabla Propietarios

```sql


+----+----------+-----------+-----------+
| id |  nombre  | apellido  |    dni    |
+----+----------+-----------+-----------+
| 1  | Juan     | Perez     | 12345678A |
| 2  | Maria    | Lopez     | 87654321B |
| 3  | Carlos   | Ruiz      | 11111111C |
| 4  | Laura    | Gomez     | 22222222D |
| 5  | Pedro    | Martinez  | 33333333E |
| 6  | Ana      | Fernandez | 44444444F |
| 7  | Diego    | Sanchez   | 55555555G |
| 8  | Sofia    | Torres    | 66666666H |
| 9  | Javier   | Leon      | 77777777I |
| 10 | Lucia    | Castillo  | 88888888J |
| 11 | Luis     | Gonzalez  | 99999999K |
| 12 | Marta    | Diaz      | 10101010L |
| 13 | Victor   | Vargas    | 11111112M |
| 14 | Elena    | Castro    | 12121212N |
| 15 | Roberto  | Blanco    | 13131313O |
| 16 | Natalia  | Paredes   | 14141414P |
| 17 | Fernando | Herrera   | 15151515Q |
| 18 | Clara    | Soto      | 16161616R |
| 19 | Sergio   | Mendoza   | 17171717S |
| 20 | Patricia | Navarro   | 18181818T |
+----+----------+-----------+-----------+
```
--- 

### Vehiculos

4. Creamos la tabla llamada Vehiculos

```sql


CREATE TABLE Vehiculos (
  ...> id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  ...> marca TEXT NOT NULL,
  ...> modelo TEXT NOT NULL,
  ...> anio INTEGER NOT NULL,
  ...> id_porpietario INTEGER NOT NULL references Propietarios(id) );


```
5. Realizamos todos los inserts de dicha tabla poniendole los valores de el id_propietario que es su foreign key

```sql


INSERT INTO Vehiculos (marca,modelo,anio,id_propietario) VALUES('Toyota', 'Corolla', 2018, 2);
sqlite> INSERT INTO Vehiculos (marca,modelo,anio,id_propietario) VALUES('Nissan', 'Sentra', 2020, 3);
sqlite> INSERT INTO Vehiculos (marca,modelo,anio,id_propietario) VALUES('chevrolet', 'Spark', 2017, 4);
sqlite> INSERT INTO Vehiculos (marca,modelo,anio,id_propietario) VALUES('Honda', 'Civic', 2016, 5);


```
6. Realizamos un SELECT * FROM Vehiculos dandonos esta tabla.

```sql
+----+------------+------------+------+----------------+
| id |   marca    |   modelo   | anio | id_propietario |
+----+------------+------------+------+----------------+
| 1  | Ford       | Fiesta     | 2019 | 1              |
| 2  | Toyota     | Corolla    | 2018 | 2              |
| 3  | Nissan     | Sentra     | 2020 | 3              |
| 4  | chevrolet  | Spark      | 2017 | 4              |
| 5  | Honda      | Civic      | 2016 | 5              |
| 6  | Ford       | Mustang    | 2021 | 6              |
| 7  | Toyota     | RAV4       | 2019 | 7              |
| 8  | Volkswagen | Golf       | 2017 | 8              |
| 9  | Honda      | CR-V       | 2018 | 9              |
| 10 | Nissan     | Altima     | 2017 | 10             |
| 11 | Chevrolet  | Malibu     | 2019 | 11             |
| 12 | Toyota     | Camry      | 2020 | 12             |
| 13 | Honda      | Accord     | 2018 | 13             |
| 14 | Ford       | Explorer   | 2021 | 14             |
| 15 | Nissan     | Rogue      | 2017 | 15             |
| 16 | Volkswagen | Jetta      | 2019 | 16             |
| 17 | Chevrolet  | Equinox    | 2018 | 17             |
| 18 | Toyota     | Highlander | 2020 | 18             |
| 19 | Honda      | Odyssey    | 2016 | 19             |
| 20 | Nissan     | Murano     | 2019 | 20             |
+----+------------+------------+------+----------------+


```

---


### Consultas

7. Realizamos la primera consulta pidiendo el nombre y apellido de todos los propietarios.

```sql
SELECT nombre, apellido From Propietarios;
+----------+-----------+
|  nombre  | apellido  |
+----------+-----------+
| Juan     | Perez     |
| Maria    | Lopez     |
| Carlos   | Ruiz      |
| Laura    | Gomez     |
| Pedro    | Martinez  |
| Ana      | Fernandez |
| Diego    | Sanchez   |
| Sofia    | Torres    |
| Javier   | Leon      |
| Lucia    | Castillo  |
| Luis     | Gonzalez  |
| Marta    | Diaz      |
| Victor   | Vargas    |
| Elena    | Castro    |
| Roberto  | Blanco    |
| Natalia  | Paredes   |
| Fernando | Herrera   |
| Clara    | Soto      |
| Sergio   | Mendoza   |
| Patricia | Navarro   |
+----------+-----------+
```
8. Realizamos una consulta sobre la marca y el modelo de cada Vehiculo

```sql
SELECT marca, modelo From Vehiculos;
+------------+------------+
|   marca    |   modelo   |
+------------+------------+
| Ford       | Fiesta     |
| Toyota     | Corolla    |
| Nissan     | Sentra     |
| chevrolet  | Spark      |
| Honda      | Civic      |
| Ford       | Mustang    |
| Toyota     | RAV4       |
| Volkswagen | Golf       |
| Honda      | CR-V       |
| Nissan     | Altima     |
| Chevrolet  | Malibu     |
| Toyota     | Camry      |
| Honda      | Accord     |
| Ford       | Explorer   |
| Nissan     | Rogue      |
| Volkswagen | Jetta      |
| Chevrolet  | Equinox    |
| Toyota     | Highlander |
| Honda      | Odyssey    |
| Nissan     | Murano     |
+------------+------------+
```
9. Hacemos una consulta sobre todos los propietarios que su apellido sea Perez
```sql
SELECT * FROM Propietarios
  ...> WHERE apellido='Perez';
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+


```

10. Hacemos la consulta de todos los Vehiculos que sean del año 2019

```sql
SELECT * FROM Vehiculos
  ...> WHERE anio=2019;
+----+------------+--------+------+----------------+
| id |   marca    | modelo | anio | id_propietario |
+----+------------+--------+------+----------------+
| 1  | Ford       | Fiesta | 2019 | 1              |
| 7  | Toyota     | RAV4   | 2019 | 7              |
| 11 | Chevrolet  | Malibu | 2019 | 11             |
| 16 | Volkswagen | Jetta  | 2019 | 16             |
| 20 | Nissan     | Murano | 2019 | 20             |
+----+------------+--------+------+----------------+
```

11. Realizamos una consulta de todos los Vehiculos de la marca Toyota y despues miramos quienes son sus propiertarios

```sql
SELECT * FROM Vehiculos
WHERE marca='Toyota';
+----+--------+------------+------+----------------+
| id | marca  |   modelo   | anio | id_propietario |
+----+--------+------------+------+----------------+
| 2  | Toyota | Corolla    | 2018 | 2              |
| 7  | Toyota | RAV4       | 2019 | 7              |
| 12 | Toyota | Camry      | 2020 | 12             |
| 18 | Toyota | Highlander | 2020 | 18             |
+----+--------+------------+------+----------------+


SELECT * FROM Propietarios
WHERE id= 2 or id= 7 or id=12 or id=18;
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 2  | Maria  | Lopez    | 87654321B |
| 7  | Diego  | Sanchez  | 55555555G |
| 12 | Marta  | Diaz     | 10101010L |
| 18 | Clara  | Soto     | 16161616R |
+----+--------+----------+-----------+
```

12. Buscamos todos los Vehiculos que sean de la marca Ford y su modelo sea Fiesta


```sql
SELECT * FROM Vehiculos
WHERE marca='Ford' and modelo='Fiesta';
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 1  | Ford  | Fiesta | 2019 | 1              |
+----+-------+--------+------+----------------+
```

13. Consultamos todos los propietarios que su dni sea 12345678A 

```sql
SELECT * FROM Propietarios
WHERE dni='12345678A';
+----+--------+----------+-----------+
| id | nombre | apellido |    dni    |
+----+--------+----------+-----------+
| 1  | Juan   | Perez    | 12345678A |
+----+--------+----------+-----------+
```

14. Buscamos todos los Vehiculos que pertenezcan al propietario con el id igual a 5

```sql
SELECT * FROM Vehiculos
WHERE id_propietario=5;
+----+-------+--------+------+----------------+
| id | marca | modelo | anio | id_propietario |
+----+-------+--------+------+----------------+
| 5  | Honda | Civic  | 2016 | 5              |
+----+-------+--------+------+----------------+
```


### Updates


15. Cambiamos todos los propietarios que tengan el dni 12345678A y les cambiamos el nombre a David

```sql
update Propietarios set nombre='David'
 where dni='12345678A';
```

16. Cambiamos todos los vehiculos que tengan el id 3 y sean del año 2022

```sql
update Vehiculos set anio=2060
 where id='3' and anio=2022 ;


```

17. Buscamos los modelos que sean Micra y les ponemos la marca Nissan

```sql
update Vehiculos set marca='Nissan'
 where modelo='Micra' ;
```

18. Buscamos y cambiamos el apellido del propietario con el id igual a 7

```sql
update Propietarios set apellido='Gomez'
 where id=7 ;
```

19. Cambiamos todos los vehiculos que el modelo sea Fiesta a la marca Renault

```sql
UPDATE Vehiculos set marca='Renault'
  ...> Where modelo='Fiesta';
```
</div>