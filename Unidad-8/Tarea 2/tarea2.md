
# ***Tarea sobre procedimientos y funciones***

## **Función para calcular el precio total**

```sql

DROP FUNCTION IF EXISTS precio_total_pedidos;

DELIMITER //
CREATE FUNCTION precio_total_pedidos(
    codigo_pedido INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_price FLOAT;
    SELECT SUM(d.cantidad * d.precio_unidad) INTO total_price FROM
    detalle_pedido as d WHERE d.codigo_pedido = codigo_pedido;
    RETURN total_price;
END//
DELIMITER ;

select precio_total_pedidos(8);
+-------------------------+
| precio_total_pedidos(8) |
+-------------------------+
|                    1065 |
+-------------------------+
```

```sql

SELECT * from detalle_pedido where codigo_pedido = 8;
+---------------+-----------------+----------+---------------+--------------+
| codigo_pedido | codigo_producto | cantidad | precio_unidad | numero_linea |
+---------------+-----------------+----------+---------------+--------------+
|             8 | FR-106          |        3 |         11.00 |            1 |
|             8 | FR-108          |        1 |         32.00 |            2 |
|             8 | FR-11           |       10 |        100.00 |            3 |
+---------------+-----------------+----------+---------------+--------------+

```


## **Función para calcular la suma de pagos por todos los pedidos**


```sql

```
 

## **Función para calcular la suma de pagos totales**

```sql
DROP FUNCTION IF EXISTS suma_pagos_totales_cliente;
DELIMITER //
CREATE FUNCTION suma_pagos_totales_cliente(codigo_cliente INT) 
RETURNS FLOAT
DETERMINISTIC
BEGIN
    DECLARE total_pagos_cliente FLOAT;
    
    SELECT SUM(total)
    INTO total_pagos_cliente
    FROM pago as p
    WHERE p.codigo_cliente = codigo_cliente
    GROUP BY codigo_cliente;
    
    RETURN total_pagos_cliente;
END//
DELIMITER ;

+----------------+---------------+----------------+------------+----------+
| codigo_cliente | forma_pago    | id_transaccion | fecha_pago | total    |
+----------------+---------------+----------------+------------+----------+
|              1 | PayPal        | ak-std-000001  | 2008-11-10 |  2000.00 |
|              1 | PayPal        | ak-std-000002  | 2008-12-10 |  2000.00 |
+----------------+---------------+----------------+------------+----------+

select suma_pagos_totales_cliente(4);
+-------------------------------+
| suma_pagos_totales_cliente(4) |
+-------------------------------+
|                         81849 |
+-------------------------------+


```

## **Procedimiento para calcular los pagos pendientes**





