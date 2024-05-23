# ***Practia examen 1***

# *Tablas*

```sql
CREATE TABLE price_changes (
    change_id CHAR(36) PRIMARY KEY,
    product_id INT NOT NULL,
    old_price DECIMAL(10,2),
    new_price DECIMAL(10,2),
    change_date DATETIME NOT NULL
);
-- Suponiendo que ya hubo cambios en los precios, aquí tienes algunos registros
INSERT INTO price_changes (change_id, product_id, old_price, new_price, change_date) VALUES
(UUID(), 101, 10.00, 9.50, '2024-05-21 10:00:00'),
(UUID(), 102, 20.00, 18.00, '2024-05-21 11:00:00');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    discount_percentage DECIMAL(5,2) DEFAULT 0
);
INSERT INTO products (product_id, name, price, discount_percentage) VALUES
(101, 'Product A', 10.00, 5.00),
(102, 'Product B', 20.00, 10.00),
(103, 'Product C', 30.00, 15.00),
(104, 'Product D', 40.00, 20.00);


CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock INT NOT NULL
);

INSERT INTO inventory (product_id, stock) VALUES
(101, 50),
(102, 30),
(103, 20),
(104, 10);

CREATE TABLE orders (
    order_id CHAR(36) PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending'
);
INSERT INTO orders (order_id, customer_id, product_id, quantity, status) VALUES
(UUID(), 1, 101, 2, 'pending'),
(UUID(), 2, 102, 1, 'pending'),
(UUID(), 3, 103, 5, 'pending');


CREATE TABLE user_changes (
    change_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id CHAR(36) NOT NULL,
    old_username VARCHAR(50),
    new_username VARCHAR(50),
    old_email VARCHAR(100),
    new_email VARCHAR(100),
    change_date DATETIME NOT NULL
);

CREATE TABLE users (
    user_id CHAR(36) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);



```

### ***Ejercicio 1: Generación de Usuarios y Registro de Cambios***
##### Crea un procedimiento almacenado que genere un número especificado de usuarios aleatorios en la tabla users, y crea un trigger que registre cualquier cambio en los detalles de los usuarios en una tabla user_changes. 

```sql
DROP FUNCTION IF EXISTS Random_varchar;
DELIMITER //
CREATE FUNCTION Random_varchar(columna Varchar(100), number INT) returns VARCHAR(100) DETERMINISTIC
BEGIN
  return concat(columna, floor(RAND() + number));
END //

DELIMITER ;

DROP FUNCTION IF EXISTS Random_id;
DELIMITER //
CREATE FUNCTION Random_id(principio Varchar(100)) returns VARCHAR(100) DETERMINISTIC
BEGIN
return concat(principio, SUBSTRING_INDEX(UUID(), '-', 1));
END //

DELIMITER ;

Drop procedure if exists insert_users;
DELIMITER //
CREATE PROCEDURE insert_users(IN iteraciones INT, IN username_base VARCHAR(100), IN email_base VARCHAR(100))
BEGIN
  DECLARE contador INT DEFAULT 1;
  DECLARE username_ins VARCHAR(100);
  DECLARE email_ins VARCHAR(100);
  DECLARE user_id_ins VARCHAR(100);
  WHILE contador <= iteraciones DO
    SET username_ins = Random_varchar(username_base, contador);
    SET email_ins = Random_varchar(email_base, contador);
    SET user_id_ins = Random_id(username_ins);
    INSERT INTO users(user_id, username, email) VALUES (user_id_ins, username_ins, email_ins);
    SET contador = contador + 1;
  END WHILE;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS Guardar_cambios_usuarios;
DELIMITER //
CREATE TRIGGER Guardar_cambios_usuarios
after UPDATE on users
FOR EACH ROW
BEGIN
  INSERT INTO user_changes(user_id, old_username, new_username, old_email, new_email, change_date) values (OLD.user_id, OLD.username, NEW.username, OLD.email, NEW.email, NOW());
END //

DELIMITER ;

CALL insert_users(10, 'David', 'David_pro@gmail.com');
select * from users;
update users set username = 'Cesar1' where user_id='David108d8aa757';
SELECT * from user_changes;
```

### ***Ejercicio 2: Procesamiento de Pedidos y Actualización de Inventario***

##### Crea un procedimiento almacenado que procese todos los pedidos pendientes, actualizando el estado del pedido a 'processed' y decrementando el inventario en la tabla inventory. Usa un cursor para recorrer los pedidos.

```sql
DELIMITER //

-- Procedimiento para procesar pedidos
CREATE PROCEDURE process_pending_orders()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE orderId CHAR(36);
    DECLARE productId INT;
    DECLARE quantity INT;
    DECLARE cur CURSOR FOR SELECT order_id, product_id, quantity FROM orders WHERE status = 'pending';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO orderId, productId, quantity;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE orders SET status = 'processed' WHERE order_id = orderId;
        UPDATE inventory SET stock = stock - quantity WHERE product_id = productId;
    END LOOP;
    CLOSE cur;
END //

DELIMITER ;

```

### ***Ejercicio 3: Función de Descuento y Trigger de Precios***

##### Crea una función que calcule el precio final después de aplicar un descuento, y un trigger que use esta función para actualizar el precio de un producto antes de insertarlo en la tabla products.

```sql
DROP FUNCTION IF EXISTS calcular_descuento;
DELIMITER //
CREATE FUNCTION calcular_descuento(price_in DECIMAL(10, 2), discount_in DECIMAL(10, 2)) RETURNS DECIMAL(10, 2) DETERMINISTIC
BEGIN
return price_in * (discount_in / 100);
END //

DELIMITER ;

DROP TRIGGER IF EXISTS aplicar_descuento;
DELIMITER //
CREATE TRIGGER aplicar_descuento
before INSERT on products
FOR EACH ROW
BEGIN
    SET NEW.price = NEW.price - calcular_descuento(NEW.price, NEW.discount_percentage);
END //

DELIMITER ;

```

### ***Ejercicio 4: Generación y Procesamiento de Pedidos***

##### Crea un procedimiento almacenado que genere pedidos aleatorios y otro procedimiento que procese esos pedidos, actualizando el inventario y el estado del pedido. Usa triggers para asegurar integridad en la cantidad de los pedidos.

```sql

```

### ***Ejercicio 5: Función de UUID y Trigger de Registro de Cambios***

##### Crea una función que genere un UUID y un trigger que use esta función para registrar cualquier cambio en los precios de los productos en una tabla price_changes.

```sql
DROP TRIGGER IF EXISTS registrar_cambio_precio;
DELIMITER //
CREATE TRIGGER registrar_cambio_precio
AFTER UPDATE on products
FOR EACH ROW
BEGIN
    IF OLD.price <> NEW.price THEN
        INSERT INTO price_changes(change_id, product_id, old_price, new_price, change_date) values (Random_id('PEDIDO'), OLD.product_id, OLD.price, NEW.price, NOW());
    END IF;
END //
DELIMITER ;
```
