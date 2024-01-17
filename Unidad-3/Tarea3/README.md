<div align="justify">

# Tarea3

### Empleados
```sql
CREATE TABLE empleados (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   nombre TEXT,
   salario REAL,
   departamento TEXT
);
```




```sql


INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');


```


```sql


┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 2  │ María     │ 60000.0 │ TI               │
│ 3  │ Carlos    │ 55000.0 │ Ventas           │
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 5  │ Pedro     │ 70000.0 │ TI               │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 8  │ Carmen    │ 65000.0 │ TI               │
│ 9  │ Miguel    │ 51000.0 │ Ventas           │
│ 10 │ Elena     │ 55000.0 │ Recursos Humanos │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 13 │ Andrés    │ 60000.0 │ Recursos Humanos │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 15 │ Raúl      │ 68000.0 │ Ventas           │
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
│ 20 │ Beatriz   │ 63000.0 │ TI               │
└────┴───────────┴─────────┴──────────────────┘


```


### Consultas


1. Todos los nombre de los empleados en mayusculas


```sql
SELECT upper(nombre) as nombre_mayus from empleados ;
┌──────────────┐
│ nombre_mayus │
├──────────────┤
│ JUAN         │
│ MARíA        │
│ CARLOS       │
│ ANA          │
│ PEDRO        │
│ LAURA        │
│ JAVIER       │
│ CARMEN       │
│ MIGUEL       │
│ ELENA        │
│ DIEGO        │
│ SOFíA        │
│ ANDRéS       │
│ ISABEL       │
│ RAúL         │
│ PATRICIA     │
│ ALEJANDRO    │
│ NATALIA      │
│ ROBERTO      │
│ BEATRIZ      │
└──────────────┘


```


2. Valor absoluto de todos los salarios de los empleados


```sql
SELECT abs(salario) as salario from empleados ;
┌─────────┐
│ salario │
├─────────┤
│ 50000.0 │
│ 60000.0 │
│ 55000.0 │
│ 48000.0 │
│ 70000.0 │
│ 52000.0 │
│ 48000.0 │
│ 65000.0 │
│ 51000.0 │
│ 55000.0 │
│ 72000.0 │
│ 49000.0 │
│ 60000.0 │
│ 53000.0 │
│ 68000.0 │
│ 47000.0 │
│ 71000.0 │
│ 54000.0 │
│ 49000.0 │
│ 63000.0 │
└─────────┘


```


3. Muestra la fecha actual.


```sql
SELECT CURRENT_DATE;
┌──────────────┐
│ CURRENT_DATE │
├──────────────┤
│ 2024-01-17   │
└──────────────┘


```
4. Promedio de salarios


```sql


SELECT avg(salario) as salario_promedio from empleados ;
┌──────────────────┐
│ salario_promedio │
├──────────────────┤
│ 57000.0          │
└──────────────────┘


```
5. Convertir '123' a entero


```sql


select cast('123' as integer) as cast;
┌──────┐
│ cast │
├──────┤
│ 123  │
└──────┘


```
6. Concatena el nombre y el departamento de cada empleado.


```sql
SELECT nombre || ' ' || departamento  as designacion from empleados;
┌───────────────────────────┐
│        designacion        │
├───────────────────────────┤
│ Juan Ventas               │
│ María TI                  │
│ Carlos Ventas             │
│ Ana Recursos Humanos      │
│ Pedro TI                  │
│ Laura Ventas              │
│ Javier Recursos Humanos   │
│ Carmen TI                 │
│ Miguel Ventas             │
│ Elena Recursos Humanos    │
│ Diego TI                  │
│ Sofía Ventas              │
│ Andrés Recursos Humanos   │
│ Isabel TI                 │
│ Raúl Ventas               │
│ Patricia Recursos Humanos │
│ Alejandro TI              │
│ Natalia Ventas            │
│ Roberto Recursos Humanos  │
│ Beatriz TI                │
└───────────────────────────┘
```
7. Concatena el nombre y el departamento de cada empleado con un guion como separador.


```sql
SELECT nombre || '-' || departamento  as designacion from empleados;


┌───────────────────────────┐
│        designacion        │
├───────────────────────────┤
│ Juan-Ventas               │
│ María-TI                  │
│ Carlos-Ventas             │
│ Ana-Recursos Humanos      │
│ Pedro-TI                  │
│ Laura-Ventas              │
│ Javier-Recursos Humanos   │
│ Carmen-TI                 │
│ Miguel-Ventas             │
│ Elena-Recursos Humanos    │
│ Diego-TI                  │
│ Sofía-Ventas              │
│ Andrés-Recursos Humanos   │
│ Isabel-TI                 │
│ Raúl-Ventas               │
│ Patricia-Recursos Humanos │
│ Alejandro-TI              │
│ Natalia-Ventas            │
│ Roberto-Recursos Humanos  │
│ Beatriz-TI                │
└───────────────────────────┘


```
8. Categoriza a los empleados según sus salarios.


```sql


```
9. Calcula la suma total de salarios de todos los empleados


```sql
SELECT SUM(salario) as suma_salarios from empleados ;
┌───────────────┐
│ suma_salarios │
├───────────────┤
│ 1140000.0     │
└───────────────┘


```
10. Redondea el salario de todos los empleados a dos decimales


```sql
SELECT round(salario, 2) as salario from empleados ;
┌─────────┐
│ salario │
├─────────┤
│ 50000.0 │
│ 60000.0 │
│ 55000.0 │
│ 48000.0 │
│ 70000.0 │
│ 52000.0 │
│ 48000.0 │
│ 65000.0 │
│ 51000.0 │
│ 55000.0 │
│ 72000.0 │
│ 49000.0 │
│ 60000.0 │
│ 53000.0 │
│ 68000.0 │
│ 47000.0 │
│ 71000.0 │
│ 54000.0 │
│ 49000.0 │
│ 63000.0 │
└─────────┘


```
11. Muestra la longitud de cada nombre de empleado


```sql
SELECT length(nombre) as letras_nombre from empleados;
┌───────────────┐
│ letras_nombre │
├───────────────┤
│ 4             │
│ 5             │
│ 6             │
│ 3             │
│ 5             │
│ 5             │
│ 6             │
│ 6             │
│ 6             │
│ 5             │
│ 5             │
│ 5             │
│ 6             │
│ 6             │
│ 4             │
│ 8             │
│ 9             │
│ 7             │
│ 7             │
│ 7             │
└───────────────┘


```
12. Cuenta el número total de empleados en cada departamento.


```sql


```
13. Muestra la hora actual.


```sql
select current_time;
┌──────────────┐
│ current_time │
├──────────────┤
│ 19:39:39     │
└──────────────┘
```


14. Convierte el salario a un valor de punto flotante.


```sql
select CAST(salario as real) as salario_real from empleados ;
┌──────────────┐
│ salario_real │
├──────────────┤
│ 50000.0      │
│ 60000.0      │
│ 55000.0      │
│ 48000.0      │
│ 70000.0      │
│ 52000.0      │
│ 48000.0      │
│ 65000.0      │
│ 51000.0      │
│ 55000.0      │
│ 72000.0      │
│ 49000.0      │
│ 60000.0      │
│ 53000.0      │
│ 68000.0      │
│ 47000.0      │
│ 71000.0      │
│ 54000.0      │
│ 49000.0      │
│ 63000.0      │
└──────────────┘


```
15. Muestra los primeros tres caracteres de cada nombre de empleado.


```sql
┌───────────┐
│ iniciales │
├───────────┤
│ Jua       │
│ Mar       │
│ Car       │
│ Ana       │
│ Ped       │
│ Lau       │
│ Jav       │
│ Car       │
│ Mig       │
│ Ele       │
│ Die       │
│ Sof       │
│ And       │
│ Isa       │
│ Raú       │
│ Pat       │
│ Ale       │
│ Nat       │
│ Rob       │
│ Bea       │
└───────────┘

```
16. Empleados en el departamento de 'Ventas' con salarios superiores a 52000
```sql
select * from empleados where salario > 52000 order BY salario ;
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 3  │ Carlos    │ 55000.0 │ Ventas           │
│ 10 │ Elena     │ 55000.0 │ Recursos Humanos │
│ 2  │ María     │ 60000.0 │ TI               │
│ 13 │ Andrés    │ 60000.0 │ Recursos Humanos │
│ 20 │ Beatriz   │ 63000.0 │ TI               │
│ 8  │ Carmen    │ 65000.0 │ TI               │
│ 15 │ Raúl      │ 68000.0 │ Ventas           │
│ 5  │ Pedro     │ 70000.0 │ TI               │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 11 │ Diego     │ 72000.0 │ TI               │
└────┴───────────┴─────────┴──────────────────┘
```
17. Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.

```sql
select * from empleados where nombre like '%a%' order by salario asc;
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 3  │ Carlos    │ 55000.0 │ Ventas           │
│ 10 │ Elena     │ 55000.0 │ Recursos Humanos │
│ 2  │ María     │ 60000.0 │ TI               │
│ 13 │ Andrés    │ 60000.0 │ Recursos Humanos │
│ 20 │ Beatriz   │ 63000.0 │ TI               │
│ 8  │ Carmen    │ 65000.0 │ TI               │
│ 15 │ Raúl      │ 68000.0 │ Ventas           │
│ 17 │ Alejandro │ 71000.0 │ TI               │
└────┴───────────┴─────────┴──────────────────┘
```
18. Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.


```sql
Select * from empleados
  ...> where salario between 45000 and 55000;
┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 1  │ Juan     │ 50000.0 │ Ventas           │
│ 3  │ Carlos   │ 55000.0 │ Ventas           │
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 6  │ Laura    │ 52000.0 │ Ventas           │
│ 7  │ Javier   │ 48000.0 │ Recursos Humanos │
│ 9  │ Miguel   │ 51000.0 │ Ventas           │
│ 10 │ Elena    │ 55000.0 │ Recursos Humanos │
│ 12 │ Sofía    │ 49000.0 │ Ventas           │
│ 14 │ Isabel   │ 53000.0 │ TI               │
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
│ 18 │ Natalia  │ 54000.0 │ Ventas           │
│ 19 │ Roberto  │ 49000.0 │ Recursos Humanos │
└────┴──────────┴─────────┴──────────────────┘


```


19. Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.


```sql
Select * from empleados
  ...> order by salario desc limit 5;
┌────┬───────────┬─────────┬──────────────┐
│ id │  nombre   │ salario │ departamento │
├────┼───────────┼─────────┼──────────────┤
│ 11 │ Diego     │ 72000.0 │ TI           │
│ 17 │ Alejandro │ 71000.0 │ TI           │
│ 5  │ Pedro     │ 70000.0 │ TI           │
│ 15 │ Raúl      │ 68000.0 │ Ventas       │
│ 8  │ Carmen    │ 65000.0 │ TI           │
└────┴───────────┴─────────┴──────────────┘


```


20. Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000


```sql
Select * from empleados
  ...> where salario > 50000 and nombre like 'n%' or 'm%';
┌────┬─────────┬─────────┬──────────────┐
│ id │ nombre  │ salario │ departamento │
├────┼─────────┼─────────┼──────────────┤
│ 18 │ Natalia │ 54000.0 │ Ventas       │
└────┴─────────┴─────────┴──────────────┘
```


21. Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.


```sql
Select * from empleados
  ...> WHERE departamento in ('TI','Ventas') order by nombre;
┌────┬───────────┬─────────┬──────────────┐
│ id │  nombre   │ salario │ departamento │
├────┼───────────┼─────────┼──────────────┤
│ 17 │ Alejandro │ 71000.0 │ TI           │
│ 20 │ Beatriz   │ 63000.0 │ TI           │
│ 3  │ Carlos    │ 55000.0 │ Ventas       │
│ 8  │ Carmen    │ 65000.0 │ TI           │
│ 11 │ Diego     │ 72000.0 │ TI           │
│ 14 │ Isabel    │ 53000.0 │ TI           │
│ 1  │ Juan      │ 50000.0 │ Ventas       │
│ 6  │ Laura     │ 52000.0 │ Ventas       │
│ 2  │ María     │ 60000.0 │ TI           │
│ 9  │ Miguel    │ 51000.0 │ Ventas       │
│ 18 │ Natalia   │ 54000.0 │ Ventas       │
│ 5  │ Pedro     │ 70000.0 │ TI           │
│ 15 │ Raúl      │ 68000.0 │ Ventas       │
│ 12 │ Sofía     │ 49000.0 │ Ventas       │
└────┴───────────┴─────────┴──────────────┘
```

22. Empleados con salarios únicos (eliminando duplicados) en orden ascendente.


```sql
select DISTINCT salario, nombre from empleados
  ...> order by salario asc;
┌─────────┬───────────┐
│ salario │  nombre   │
├─────────┼───────────┤
│ 47000.0 │ Patricia  │
│ 48000.0 │ Ana       │
│ 48000.0 │ Javier    │
│ 49000.0 │ Sofía     │
│ 49000.0 │ Roberto   │
│ 50000.0 │ Juan      │
│ 51000.0 │ Miguel    │
│ 52000.0 │ Laura     │
│ 53000.0 │ Isabel    │
│ 54000.0 │ Natalia   │
│ 55000.0 │ Carlos    │
│ 55000.0 │ Elena     │
│ 60000.0 │ María     │
│ 60000.0 │ Andrés    │
│ 63000.0 │ Beatriz   │
│ 65000.0 │ Carmen    │
│ 68000.0 │ Raúl      │
│ 70000.0 │ Pedro     │
│ 71000.0 │ Alejandro │
│ 72000.0 │ Diego     │
└─────────┴───────────┘
```


23. Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.


```sql
SELECT * from empleados where nombre like '%o' or nombre like '%a' and departamento='Ventas';
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 5  │ Pedro     │ 70000.0 │ TI               │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
└────┴───────────┴─────────┴──────────────────┘


```

24. Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.

```sql
select * from empleados where salario NOT BETWEEN 55000 and 70000 order by departamento ;
┌────┬───────────┬─────────┬──────────────────┐
│ id │  nombre   │ salario │   departamento   │
├────┼───────────┼─────────┼──────────────────┤
│ 4  │ Ana       │ 48000.0 │ Recursos Humanos │
│ 7  │ Javier    │ 48000.0 │ Recursos Humanos │
│ 16 │ Patricia  │ 47000.0 │ Recursos Humanos │
│ 19 │ Roberto   │ 49000.0 │ Recursos Humanos │
│ 11 │ Diego     │ 72000.0 │ TI               │
│ 14 │ Isabel    │ 53000.0 │ TI               │
│ 17 │ Alejandro │ 71000.0 │ TI               │
│ 1  │ Juan      │ 50000.0 │ Ventas           │
│ 6  │ Laura     │ 52000.0 │ Ventas           │
│ 9  │ Miguel    │ 51000.0 │ Ventas           │
│ 12 │ Sofía     │ 49000.0 │ Ventas           │
│ 18 │ Natalia   │ 54000.0 │ Ventas           │
└────┴───────────┴─────────┴──────────────────┘
```

25. Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.


```sql
select * from empleados where nombre not like '%e%';
┌────┬──────────┬─────────┬──────────────────┐
│ id │  nombre  │ salario │   departamento   │
├────┼──────────┼─────────┼──────────────────┤
│ 1  │ Juan     │ 50000.0 │ Ventas           │
│ 2  │ María    │ 60000.0 │ TI               │
│ 3  │ Carlos   │ 55000.0 │ Ventas           │
│ 4  │ Ana      │ 48000.0 │ Recursos Humanos │
│ 6  │ Laura    │ 52000.0 │ Ventas           │
│ 12 │ Sofía    │ 49000.0 │ Ventas           │
│ 13 │ Andrés   │ 60000.0 │ Recursos Humanos │
│ 15 │ Raúl     │ 68000.0 │ Ventas           │
│ 16 │ Patricia │ 47000.0 │ Recursos Humanos │
│ 18 │ Natalia  │ 54000.0 │ Ventas           │
└────┴──────────┴─────────┴──────────────────┘
```
</div>