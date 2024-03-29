-- Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido? Modelo y precio de la tabla coches y el nombre de los clientes que los compraron

--Consulta: 
select co.modelo, co.precio, cli.nombre from ventas as v, clientes as cli, coches as co where v.id_coche=co.id_coche and v.id_cliente=cli.id_cliente;

    /**
┌────────────────┬─────────┬─────────────────┐
│     modelo     │ precio  │     nombre      │
├────────────────┼─────────┼─────────────────┤
│ Sedán 2022     │ 25000.0 │ Juan Pérez      │
│ Hatchback 2021 │ 22000.0 │ María Gómez     │
│ SUV 2023       │ 30000.0 │ Carlos López    │
│ Coupé 2022     │ 28000.0 │ Ana Martínez    │
│ Camioneta 2023 │ 32000.0 │ Pedro Rodríguez │
│ Compacto 2021  │ 20000.0 │ Laura Sánchez   │
│ Híbrido 2022   │ 27000.0 │ Miguel González │
│ Deportivo 2023 │ 35000.0 │ Isabel Díaz     │
│ Eléctrico 2021 │ 40000.0 │ Elena Torres    │
└────────────────┴─────────┴─────────────────┘
    **/


-- Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
  -- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)

--Consulta:
select co.precio, cli.* from clientes as cli, coches as co, ventas as v where co.precio > (select avg(co.precio) from coches as co) and v.id_cliente=cli.id_cliente and v.id_coche=co.id_coche; 

     /**
┌─────────┬────────────┬─────────────────┬──────┬────────────────┐
│ precio  │ id_cliente │     nombre      │ edad │   direccion    │
├─────────┼────────────┼─────────────────┼──────┼────────────────┤
│ 30000.0 │ 3          │ Carlos López    │ 35   │ Calle C #789   │
│ 32000.0 │ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │
│ 35000.0 │ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │
│ 40000.0 │ 10         │ Elena Torres    │ 29   │ Avenida J #333 │
└─────────┴────────────┴─────────────────┴──────┴────────────────┘

precio medio
select avg(precio) from coches;

┌─────────────┐
│ avg(precio) │
├─────────────┤
│ 29000.0     │
└─────────────┘
     **/

-- Mostrar los modelos de coches y sus precios que no han sido vendidos aún:

  -- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas


--Consulta:
select * from coches where id_coche not in( select id_coche from ventas);
    /**
┌──────────┬─────────────┬───────┬──────┬─────────┐
│ id_coche │   modelo    │ marca │ año  │ precio  │
├──────────┼─────────────┼───────┼──────┼─────────┤
│ 9        │ Pickup 2022 │ Ram   │ 2022 │ 31000.0 │
└──────────┴─────────────┴───────┴──────┴─────────┘
    **/

-- Calcular el total gastado por todos los clientes en coches:
  -- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.

--Consulta:
select sum(co.precio) as total_gastado from coches as co, ventas as v where co.id_coche in( select v.id_coche from ventas as v) and co.id_coche=v.id_coche ;

   /**
┌───────────────┐
│ total_gastado │
├───────────────┤
│ 259000.0      │
└───────────────┘
    **/

-- Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos? Es un solo campo y pide la fecha de venta y nombre del cliente

--Consulta:
select co.*, v.fecha_venta, cli.nombre from coches as co, ventas as v, clientes as cli where co.id_coche in (select id_coche from ventas) AND v.id_coche=co.id_coche and v.id_cliente=cli.id_cliente order by v.fecha_venta DESC;
   /**
┌──────────┬────────────────┬────────────┬──────┬─────────┬─────────────┬─────────────────┐
│ id_coche │     modelo     │   marca    │ año  │ precio  │ fecha_venta │     nombre      │
├──────────┼────────────────┼────────────┼──────┼─────────┼─────────────┼─────────────────┤
│ 10       │ Eléctrico 2021 │ Tesla      │ 2021 │ 40000.0 │ 2023-10-05  │ Elena Torres    │
│ 8        │ Deportivo 2023 │ Mazda      │ 2023 │ 35000.0 │ 2023-08-25  │ Isabel Díaz     │
│ 7        │ Híbrido 2022   │ Hyundai    │ 2022 │ 27000.0 │ 2023-07-20  │ Miguel González │
│ 6        │ Compacto 2021  │ Volkswagen │ 2021 │ 20000.0 │ 2023-06-15  │ Laura Sánchez   │
│ 5        │ Camioneta 2023 │ Nissan     │ 2023 │ 32000.0 │ 2023-05-05  │ Pedro Rodríguez │
│ 4        │ Coupé 2022     │ Chevrolet  │ 2022 │ 28000.0 │ 2023-04-10  │ Ana Martínez    │
│ 3        │ SUV 2023       │ Ford       │ 2023 │ 30000.0 │ 2023-03-25  │ Carlos López    │
│ 2        │ Hatchback 2021 │ Honda      │ 2021 │ 22000.0 │ 2023-02-20  │ María Gómez     │
│ 1        │ Sedán 2022     │ Toyota     │ 2022 │ 25000.0 │ 2023-01-15  │ Juan Pérez      │
└──────────┴────────────────┴────────────┴──────┴─────────┴─────────────┴─────────────────┘
    **/

-- Encontrar el modelo de coche más caro .
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX

--Consulta:
select modelo, marca,  max(precio) as precio_maximo from coches;

   /**
┌────────────────┬───────┬───────────────┐
│     modelo     │ marca │ precio_maximo │
├────────────────┼───────┼───────────────┤
│ Eléctrico 2021 │ Tesla │ 40000.0       │
└────────────────┴───────┴───────────────┘

    **/

-- Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT

--Consulta:
select cli.*  ,count(v.id_coche) as cantidad_coches from ventas as v, clientes as cli where v.id_cliente=cli.id_cliente and v.id_cliente=v.id_coche group by cli.id_cliente;

   /**
┌────────────┬─────────────────┬──────┬────────────────┬─────────────────┐
│ id_cliente │     nombre      │ edad │   direccion    │ cantidad_coches │
├────────────┼─────────────────┼──────┼────────────────┼─────────────────┤
│ 1          │ Juan Pérez      │ 30   │ Calle A #123   │ 1               │
│ 2          │ María Gómez     │ 25   │ Avenida B #456 │ 1               │
│ 3          │ Carlos López    │ 35   │ Calle C #789   │ 1               │
│ 4          │ Ana Martínez    │ 28   │ Avenida D #101 │ 1               │
│ 5          │ Pedro Rodríguez │ 40   │ Calle E #234   │ 1               │
│ 6          │ Laura Sánchez   │ 32   │ Avenida F #567 │ 1               │
│ 7          │ Miguel González │ 27   │ Calle G #890   │ 1               │
│ 8          │ Isabel Díaz     │ 38   │ Avenida H #111 │ 1               │
│ 10         │ Elena Torres    │ 29   │ Avenida J #333 │ 1               │
└────────────┴─────────────────┴──────┴────────────────┴─────────────────┘

    **/

-- Encontrar los clientes que han comprado coches de la marca 'Toyota':
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.

--Consulta:
select cli.*, co.marca from clientes as cli, coches as co, ventas as v where co.marca='Toyota' and v.id_coche=co.id_coche and v.id_cliente=cli.id_cliente;

   /**
┌────────────┬────────────┬──────┬──────────────┬────────┐
│ id_cliente │   nombre   │ edad │  direccion   │ marca  │
├────────────┼────────────┼──────┼──────────────┼────────┤
│ 1          │ Juan Pérez │ 30   │ Calle A #123 │ Toyota │
└────────────┴────────────┴──────┴──────────────┴────────┘

    **/

-- Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.  el AVG de la edad de los clientes que compraron coches con precio > 25000

--Consulta:
select avg(cli.edad) as edad_media from clientes as cli, coches as co, ventas as v where co.precio > 25000 and v.id_coche=co.id_coche and v.id_cliente=cli.id_cliente ;
   /**
┌──────────────────┐
│    edad_media    │
├──────────────────┤
│ 32.8333333333333 │
└──────────────────┘

    **/

-- Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.nombre y precio de coches comprados por clientes > 30

--Consulta:
select co.modelo, co.marca, co.precio, cli.edad from coches as co, clientes as cli, ventas as v where cli.edad > 30 and v.id_coche=co.id_coche and v.id_cliente=cli.id_cliente ;
   /**
┌────────────────┬────────────┬─────────┬──────┐
│     modelo     │   marca    │ precio  │ edad │
├────────────────┼────────────┼─────────┼──────┤
│ SUV 2023       │ Ford       │ 30000.0 │ 35   │
│ Camioneta 2023 │ Nissan     │ 32000.0 │ 40   │
│ Compacto 2021  │ Volkswagen │ 20000.0 │ 32   │
│ Deportivo 2023 │ Mazda      │ 35000.0 │ 38   │
└────────────────┴────────────┴─────────┴──────┘

    **/

-- Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. un count de los coches vendidos en 2022 haciendo un regexp

--Consulta:
select co.*, count(v.id_venta) as ventas_totales from coches as co, ventas as v where co.id_coche=v.id_coche and v.fecha_venta like '%2022';

   /**
No sale nada porque no hay reguistradas ventas en el 2022
    **/

-- Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG

--Consulta:
select co.*, cli.edad from coches as co, clientes as cli, ventas as v where v.id_coche=co.id_coche and v.id_cliente=cli.id_cliente and cli.edad < 30 and co.precio >(select avg(precio) as precio_medio from coches);
   /**
┌──────────┬────────────────┬───────┬──────┬─────────┬──────┐
│ id_coche │     modelo     │ marca │ año  │ precio  │ edad │
├──────────┼────────────────┼───────┼──────┼─────────┼──────┤
│ 10       │ Eléctrico 2021 │ Tesla │ 2021 │ 40000.0 │ 29   │
└──────────┴────────────────┴───────┴──────┴─────────┴──────┘
    **/

-- Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
  -- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio

--Consulta:
select count(v.id_coche) as total_ventas, co.marca from ventas as v, coches as co where co.id_coche=v.id_coche group by co.marca order by total_ventas desc;

   /**
┌──────────────┬────────────┐
│ total_ventas │   marca    │
├──────────────┼────────────┤
│ 1            │ Volkswagen │
│ 1            │ Toyota     │
│ 1            │ Tesla      │
│ 1            │ Nissan     │
│ 1            │ Mazda      │
│ 1            │ Hyundai    │
│ 1            │ Honda      │
│ 1            │ Ford       │
│ 1            │ Chevrolet  │
└──────────────┴────────────┘

    **/
