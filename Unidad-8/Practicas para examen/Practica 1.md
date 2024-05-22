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

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    discount_percentage DECIMAL(5,2) DEFAULT 0
);

CREATE TABLE inventory (
    product_id INT PRIMARY KEY,
    stock INT NOT NULL
);

CREATE TABLE orders (
    order_id CHAR(36) PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    status VARCHAR(20) DEFAULT 'pending'
);

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
return SUBSTRING_INDEX(UUID(), '-', 1);
END //

DELIMITER ;

Drop procedure if exists insert_users;
DELIMITER //
CREATE PROCEDURE insert_users(IN iteraciones INT, IN username_base VARCHAR(100), IN email_base VARCHAR(100))
BEGIN
  DECLARE contador INT DEFAULT 1;
  DECLARE username_ins VARCHAR(100);
  DECLARE email_ins VARCHAR(100);
  WHILE contador < iteraciones DO
    SET username_ins = Random_varchar(username_base, contador);
    SET email_ins = Random_varchar(email_base, contador);
    INSERT INTO users(username, email) VALUES (username_ins, email_ins);
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
  INSERT INTO user_changes(user_id, old_username, new_username, old_email, new_email, change_date) values (OLD.user_id, OLD.username, NEW.username, OLD.email, NEW.email, DATE(NOW));
END //

DELIMITER ;


```

### ***Ejercicio 2: Procesamiento de Pedidos y Actualización de Inventario***

##### Crea un procedimiento almacenado que procese todos los pedidos pendientes, actualizando el estado del pedido a 'processed' y decrementando el inventario en la tabla inventory. Usa un cursor para recorrer los pedidos.

```sql

```

### ***Ejercicio 3: Función de Descuento y Trigger de Precios***

##### Crea una función que calcule el precio final después de aplicar un descuento, y un trigger que use esta función para actualizar el precio de un producto antes de insertarlo en la tabla products.

```sql

```

### ***Ejercicio 4: Generación y Procesamiento de Pedidos***

##### Crea un procedimiento almacenado que genere pedidos aleatorios y otro procedimiento que procese esos pedidos, actualizando el inventario y el estado del pedido. Usa triggers para asegurar integridad en la cantidad de los pedidos.

```sql

```

### ***Ejercicio 5: Función de UUID y Trigger de Registro de Cambios***

##### Crea una función que genere un UUID y un trigger que use esta función para registrar cualquier cambio en los precios de los productos en una tabla price_changes.

```sql

```
