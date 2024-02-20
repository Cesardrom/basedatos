--Consultas sobre una tabla

    --Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

        --Consulta
        select * from pedido order by fecha desc;

        /**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
└────┴─────────┴────────────┴────────────┴──────────────┘
        **/

    --Devuelve todos los datos de los dos pedidos de mayor valor.

        --Consulta
        select * from pedido order by total desc limit 2 ;

        /**
┌────┬────────┬────────────┬────────────┬──────────────┐
│ id │ total  │   fecha    │ id_cliente │ id_comercial │
├────┼────────┼────────────┼────────────┼──────────────┤
│ 7  │ 5760.0 │ 2015-09-10 │ 2          │ 1            │
│ 12 │ 3045.6 │ 2017-04-25 │ 2          │ 1            │
└────┴────────┴────────────┴────────────┴──────────────┘
        **/

    --Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.

        --Consulta
        select distinct(id_cliente) from pedido;

        /**
┌────────────┐
│ id_cliente │
├────────────┤
│ 5          │
│ 1          │
│ 2          │
│ 8          │
│ 7          │
│ 4          │
│ 3          │
│ 6          │
└────────────┘
        **/

    --Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

        --Consulta
        select * from pedido where fecha REGEXP '^2017' and total > 500 ;


        /**
┌────┬─────────┬────────────┬────────────┬──────────────┐
│ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
│ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
└────┴─────────┴────────────┴────────────┴──────────────┘
        **/

    --Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

        --Consulta
        select nombre, apellido1, apellido2, categoria from comercial where categoria BETWEEN 0.05 and 0.11;

        /**
┌─────────┬───────────┬───────────┬───────────┐
│ nombre  │ apellido1 │ apellido2 │ categoria │
├─────────┼───────────┼───────────┼───────────┤
│ Diego   │ Flores    │ Salas     │ 0.11      │
│ Antonio │ Vega      │ Hernández │ 0.11      │
│ Alfredo │ Ruiz      │ Flores    │ 0.05      │
└─────────┴───────────┴───────────┴───────────┘
        **/

    --Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.

        --Consulta
        select max(categoria) as mayor_comision from comercial;

        /**
┌────────────────┐
│ mayor_comision │
├────────────────┤
│ 0.15           │
└────────────────┘
        **/

    --Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.

        --Consulta
        select id, nombre, apellido1, apellido2 from cliente where apellido2 is not null order by nombre, apellido1;

        /**
┌────┬───────────┬───────────┬───────────┐
│ id │  nombre   │ apellido1 │ apellido2 │
├────┼───────────┼───────────┼───────────┤
│ 1  │ Aarón     │ Rivero    │ Gómez     │
│ 2  │ Adela     │ Salas     │ Díaz      │
│ 3  │ Adolfo    │ Rubio     │ Flores    │
│ 10 │ Daniel    │ Santana   │ Loyola    │
│ 9  │ Guillermo │ López     │ Gómez     │
│ 5  │ Marcos    │ Loyola    │ Méndez    │
│ 6  │ María     │ Santana   │ Moreno    │
│ 8  │ Pepe      │ Ruiz      │ Santana   │
└────┴───────────┴───────────┴───────────┘
        **/

    --Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.

        --Consulta
        select nombre from cliente where nombre REGEXP '^[Aa]' And nombre REGEXP 'n$' or nombre REGEXP '^[Pp]' order by nombre;

        /**
┌────────┐
│ nombre │
├────────┤
│ Aarón  │
│ Adrián │
│ Pepe   │
│ Pilar  │
└────────┘
        **/

    --Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.

        --Consulta
        select nombre from cliente where nombre not REGEXP '^[Aa]' order by nombre;

        /**
┌───────────┐
│  nombre   │
├───────────┤
│ Daniel    │
│ Guillermo │
│ Marcos    │
│ María     │
│ Pepe      │
│ Pilar     │
└───────────┘
        **/

    --Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en cuenta que se deberán eliminar los nombres repetidos.

        --Consulta
        select distinct(nombre) from comercial where nombre REGEXP '[oO]$' order by nombre;

        /**
┌─────────┐
│ nombre  │
├─────────┤
│ Alfredo │
│ Antonio │
│ Diego   │
└─────────┘
        **/

--Consultas multitabla
--Nota: Resuelva todas las consultas utilizando las cláusulas INNER JOIN.

    --Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.

        --Consulta
        select distinct(cli.id), cli.nombre, cli.apellido1, cli.apellido2 from cliente as cli INNER JOIN pedido as p on cli.id=p.id_cliente order by cli.nombre;

        /**
┌────┬────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │
├────┼────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │
│ 2  │ Adela  │ Salas     │ Díaz      │
│ 3  │ Adolfo │ Rubio     │ Flores    │
│ 4  │ Adrián │ Suárez    │           │
│ 5  │ Marcos │ Loyola    │ Méndez    │
│ 6  │ María  │ Santana   │ Moreno    │
│ 8  │ Pepe   │ Ruiz      │ Santana   │
│ 7  │ Pilar  │ Ruiz      │           │
└────┴────────┴───────────┴───────────┘
        **/

    --Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

        --Consulta
        select cli.*, co.* from cliente as cli INNER JOIN pedido as p on cli.id=p.id_cliente INNER JOIN comercial as co on co.id=p.id_comercial order by cli.nombre;

        /**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴───────────┴───────────┴───────────┘
        **/

    --Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.

        --Consulta
        SELECT co.*, p.* from comercial as co INNER JOIN pedido as p on co.id=p.id_comercial order by co.nombre;

        /**
┌────┬─────────┬───────────┬───────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┐
│ id │ nombre  │ apellido1 │ apellido2 │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │
├────┼─────────┼───────────┼───────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┤
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │
│ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │
│ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │
│ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │
│ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │
│ 2  │ Juan    │ Gómez     │ López     │ 0.13      │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │
│ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │
└────┴─────────┴───────────┴───────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┘
        **/

    --Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.

        --Consulta
        select cli.*, p.*, co.* from cliente as cli INNER JOIN pedido as p on cli.id=p.id_cliente INNER JOIN comercial as co on co.id=p.id_comercial order by cli.nombre;

        /**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┬────┬─────────┬────────────┬────────────┬──────────────┬────┬─────────┬───────────┬───────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │ id │  total  │   fecha    │ id_cliente │ id_comercial │ id │ nombre  │ apellido1 │ apellido2 │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┼────┼─────────┼────────────┼────────────┼──────────────┼────┼─────────┼───────────┼───────────┼───────────┤
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 2  │ 270.65  │ 2016-09-10 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 15 │ 370.85  │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 1  │ Aarón  │ Rivero    │ Gómez     │ Almería │ 100       │ 16 │ 2389.23 │ 2019-03-11 │ 1          │ 5            │ 5  │ Antonio │ Carretero │ Ortega    │ 0.12      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 3  │ 65.26   │ 2017-10-05 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 7  │ 5760.0  │ 2015-09-10 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 2  │ Adela  │ Salas     │ Díaz      │ Granada │ 200       │ 12 │ 3045.6  │ 2017-04-25 │ 2          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 3  │ Adolfo │ Rubio     │ Flores    │ Sevilla │           │ 11 │ 75.29   │ 2016-08-17 │ 3          │ 7            │ 7  │ Antonio │ Vega      │ Hernández │ 0.11      │
│ 4  │ Adrián │ Suárez    │           │ Jaén    │ 300       │ 8  │ 1983.43 │ 2017-10-10 │ 4          │ 6            │ 6  │ Manuel  │ Domínguez │ Hernández │ 0.13      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 1  │ 150.5   │ 2017-10-05 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │ 5  │ 948.5   │ 2017-09-10 │ 5          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 13 │ 545.75  │ 2019-01-25 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 6  │ María  │ Santana   │ Moreno    │ Cádiz   │ 100       │ 14 │ 145.82  │ 2017-02-02 │ 6          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 4  │ 110.5   │ 2016-08-17 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 9  │ 2480.4  │ 2016-10-10 │ 8          │ 3            │ 3  │ Diego   │ Flores    │ Salas     │ 0.11      │
│ 8  │ Pepe   │ Ruiz      │ Santana   │ Huelva  │ 200       │ 10 │ 250.45  │ 2015-06-27 │ 8          │ 2            │ 2  │ Juan    │ Gómez     │ López     │ 0.13      │
│ 7  │ Pilar  │ Ruiz      │           │ Sevilla │ 300       │ 6  │ 2400.6  │ 2016-07-27 │ 7          │ 1            │ 1  │ Daniel  │ Sáez      │ Vega      │ 0.15      │
└────┴────────┴───────────┴───────────┴─────────┴───────────┴────┴─────────┴────────────┴────────────┴──────────────┴────┴─────────┴───────────┴───────────┴───────────┘
        **/

    --Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.

        --Consulta
        select cli.* from cliente as cli INNER JOIN pedido as p on cli.id=p.id_cliente and p.fecha REGEXP '^2017' and total BETWEEN 300 and 1000;

        /**
┌────┬────────┬───────────┬───────────┬─────────┬───────────┐
│ id │ nombre │ apellido1 │ apellido2 │ ciudad  │ categoria │
├────┼────────┼───────────┼───────────┼─────────┼───────────┤
│ 5  │ Marcos │ Loyola    │ Méndez    │ Almería │ 200       │
└────┴────────┴───────────┴───────────┴─────────┴───────────┘
        **/

    --Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.

        --Consulta
        select co.nombre, co.apellido1, co.apellido2 from comercial as co INNER JOIN pedido as p on co.id=p.id_comercial INNER JOIN cliente as cli on cli.id=p.id_cliente and cli.nombre = "María" and cli.apellido1="Santana" and cli.apellido2="Moreno";

        /**
┌────────┬───────────┬───────────┐
│ nombre │ apellido1 │ apellido2 │
├────────┼───────────┼───────────┤
│ Daniel │ Sáez      │ Vega      │
│ Daniel │ Sáez      │ Vega      │
└────────┴───────────┴───────────┘
        **/

    --Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.

        --Consulta
        select cli.nombre from cliente as cli INNER JOIN pedido as p on cli.id=p.id_cliente INNER JOIN comercial as co on co.id=p.id_comercial and co.nombre="Daniel" and co.apellido1="Sáez" and  co.apellido2="Vega";

        /**
┌────────┐
│ nombre │
├────────┤
│ Adela  │
│ Pilar  │
│ Adela  │
│ Adela  │
│ María  │
│ María  │
└────────┘
        **/

--Consultas resumen (Funciones)

    --Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.

        --Consulta
        SELECT SUM(total) AS Total_Pedidos FROM pedido;

        /**

        **/

    --Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.

        --Consulta
        SELECT AVG(total) AS Media_Pedidos FROM pedido;

        /**

        **/

    --Calcula el número total de comerciales distintos que aparecen en la tabla pedido.

        --Consulta
        SELECT COUNT(DISTINCT id_comercial) AS Total_Comerciales FROM pedido;

        /**

        **/

    --Calcula el número total de clientes que aparecen en la tabla cliente.

        --Consulta
        SELECT COUNT(*) AS Total_Clientes FROM cliente;

        /**

        **/

    --Calcula cuál es la mayor cantidad que aparece en la tabla pedido.

        --Consulta
        SELECT MAX(total) AS Mayor_Cantidad FROM pedido;

        /**

        **/

    --Calcula cuál es la menor cantidad que aparece en la tabla pedido.

        --Consulta
        SELECT MIN(total) AS Menor_Cantidad FROM pedido;

        /**

        **/

    --Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.

        --Consulta
        SELECT ciudad, MAX(categoria) AS Max_Categoria FROM cliente GROUP BY ciudad;

        /**

        **/

    --Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.

        --Consulta
        SELECT id_cliente, fecha, MAX(total) AS Max_Valor FROM pedido GROUP BY id_cliente, fecha;

        /**

        **/

    --Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.

        --Consulta
        SELECT id_cliente, fecha, MAX(total) AS Max_Valor FROM pedido GROUP BY id_cliente, fecha HAVING MAX(total) > 2000;

        /**

        **/

    --Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.

        --Consulta
        SELECT p.id_comercial, p.nombre, p.apellido1, p.total FROM pedido as p JOIN comercial as co ON p.id_comercial = co.id WHERE p.fecha = '2016-08-17' ORDER BY p.total DESC LIMIT 1;

        /**

        **/

    --Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.

        --Consulta
        SELECT cli.id, cli.nombre, cli.apellido1, COUNT(p.id) AS Num_Pedidos FROM cliente as cli LEFT JOIN pedido as p ON cli.id = p.id_cliente GROUP BY cli.id;

        /**

        **/

    --Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.

        --Consulta
        SELECT cli.id, cli.nombre, cli.apellido1, COUNT(p.id) AS Num_Pedidos FROM cliente as cli LEFT JOIN pedido as p ON cli.id=p.id_cliente WHERE p.fecha LIKE '2017%' GROUP BY cli.id

        /**

        **/

    --Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0.

        --Consulta
        SELECT cli.id, cli.nombre, cli.apellido1, MAX(pedido.total) AS Max_Cantidad FROM cliente as cli LEFT JOIN pedido as p ON cli.id=p.id_cliente GROUP BY cli.id;

        /**

        **/

    --Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.

        --Consulta
        SELECT strftime('%Y', fecha) AS Año, MAX(total) AS Max_Valor FROM pedido GROUP BY Año;

        /**

        **/

    --Devuelve el número total de pedidos que se han realizado cada año.

        --Consulta
        SELECT strftime('%Y', fecha) AS Año, COUNT(*) AS Num_pedidos FROM pedido GROUP BY Año;

        /**

        **/

--Subconsultas
--Con operadores básicos de comparación

    --Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).

        --Consulta
        SELECT * FROM pedido WHERE id_cliente=(SELECT id FROM cliente WHERE nombre = 'Adela' AND apellido1 = 'Salas' AND apellido2 = 'Díaz');

        /**

        **/

    --Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)

        --Consulta
        SELECT COUNT(*) AS Numero_Pedidos FROM pedido WHERE id_comercial=(SELECT id FROM comercial WHERE nombre = 'Daniel' AND apellido1 = 'Sáez' AND apellido2 = 'Vega');

        /**

        **/

    --Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)

        --Consulta
        SELECT * FROM cliente WHERE id=(SELECT id_cliente FROM pedido WHERE fecha LIKE '2019%' ORDER BY total DESC LIMIT 1);

        /**

        **/

    --Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.

        --Consulta
        SELECT fecha, total FROM pedido WHERE id_cliente=(SELECT id FROM cliente WHERE nombre = 'Pepe' AND apellido1 = 'Ruiz' AND apellido2 = 'Santana') ORDER BY total LIMIT 1;

        /**

        **/

    --Devuelve un listado con los datos de los clientes y los pedidos, de todos los clientes que han realizado un pedido durante el año 2017 con un valor mayor o igual al valor medio de los pedidos realizados durante ese mismo año.

        --Consulta
        SELECT cli.*, p.* FROM cliente as cli, pedido as p WHERE p.id_cliente = cli.id AND p.fecha LIKE '2017%' AND p.total>=(SELECT AVG(total) FROM pedido WHERE fecha LIKE '2017%');

        /**

        **/

--Subconsultas con IN y NOT IN

    --Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).

        --Consulta
        SELECT * FROM cliente WHERE id NOT IN (SELECT DISTINCT id_cliente FROM pedido);

        /**

        **/

    --Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).

        --Consulta
        SELECT * FROM comercial WHERE id NOT IN (SELECT DISTINCT id_comercial FROM pedido);

        /**

        **/

--Subconsultas con EXISTS y NOT EXISTS+

    --Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).

        --Consulta
        SELECT * FROM cliente as c WHERE NOT EXISTS (SELECT p.id_cliente FROM pedido p WHERE p.id_cliente = c.id);

        /**

        **/

    --Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
    
        --Consulta
        SELECT * FROM comercial as c WHERE NOT EXISTS (SELECT p.id_comercial FROM pedido as p WHERE p.id_comercial = c.id);

        /**

        **/
