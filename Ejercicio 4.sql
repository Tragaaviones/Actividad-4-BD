DROP DATABASE IF EXISTS db_rapid_mart;

CREATE DATABASE db_rapid_mart;

USE db_rapid_mart;

CREATE TABLE tb_categorias(
    id_categoria INT PRIMARY KEY NOT NULL,
    nombre_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE tb_proveedores(
    id_proveedor INT PRIMARY KEY NOT NULL,
    nombre_proveedor VARCHAR(50) NOT NULL,
    direccion_proveedor VARCHAR(50) NOT NULL,
    telefono_proveedor VARCHAR(10) NOT NULL
);

CREATE TABLE tb_movimientos_inventarios(
    id_movimiento_inventario INT PRIMARY KEY NOT NULL,
    id_inventario INT,
    tipo_movimiento ENUM('Entrada', 'Salida') NOT NULL,
    cantidad INT NOT NULL,
    fercha_movimiento DATE NOT NULL
);

CREATE TABLE tb_inventarios(
    id_inventarios INT PRIMARY KEY NOT NULL,
    id_producto INT,
    cantidad_disponible INT NOT NULL,
    fecha_ingreso DATE NOT NULL
);

CREATE TABLE tb_productos(
    id_producto INT PRIMARY KEY NOT NULL,
    nombre_producto VARCHAR(50) NOT NULL,
    descripcion_producto VARCHAR(255) NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    id_proveedor INT
);

/**/
ALTER TABLE tb_categorias 
CHANGE COLUMN id_categoria id_categoria CHAR(36) NOT NULL;

ALTER TABLE tb_proveedores 
CHANGE COLUMN id_proveedor id_proveedor CHAR(36) NOT NULL;

ALTER TABLE tb_movimientos_inventarios 
CHANGE COLUMN id_movimiento_inventario id_movimiento_inventario CHAR(36) NOT NULL,
CHANGE COLUMN id_inventario id_inventario CHAR(36);

ALTER TABLE tb_inventarios 
CHANGE COLUMN id_inventarios id_inventarios CHAR(36) NOT NULL,
CHANGE COLUMN id_producto id_producto CHAR(36);

ALTER TABLE tb_productos 
CHANGE COLUMN id_producto id_producto CHAR(36) NOT NULL,
CHANGE COLUMN id_categoria id_categoria CHAR(36),
CHANGE COLUMN id_proveedor id_proveedor CHAR(36);

/**/
ALTER TABLE tb_productos ADD CONSTRAINT FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria);
ALTER TABLE tb_productos ADD CONSTRAINT FOREIGN KEY (id_proveedor) REFERENCES tb_proveedores(id_proveedor);

ALTER TABLE tb_inventarios ADD CONSTRAINT FOREIGN KEY (id_producto) REFERENCES tb_productos(id_producto);

ALTER TABLE tb_movimientos_inventarios ADD CONSTRAINT FOREIGN KEY (id_inventario) REFERENCES tb_inventarios(id_inventarios);

/**/
SHOW CREATE TABLE tb_productos;
SHOW CREATE TABLE tb_inventarios;
SHOW CREATE TABLE tb_movimientos_inventarios;

/**/
DELIMITER //

CREATE TRIGGER after_movimiento_insert
AFTER INSERT ON tb_movimientos_inventarios
FOR EACH ROW
BEGIN
    DECLARE v_id_inventario CHAR(36);
    DECLARE v_cantidad_actual INT;
    
    
    SELECT id_inventarios, cantidad_disponible INTO v_id_inventario, v_cantidad_actual
    FROM tb_inventarios
    WHERE id_inventarios = NEW.id_inventario;
    
    IF NEW.tipo_movimiento = 'Entrada' THEN
        UPDATE tb_inventarios
        SET cantidad_disponible = v_cantidad_actual + NEW.cantidad
        WHERE id_inventarios = v_id_inventario;
    ELSEIF NEW.tipo_movimiento = 'Salida' THEN
        UPDATE tb_inventarios
        SET cantidad_disponible = v_cantidad_actual - NEW.cantidad
        WHERE id_inventarios = v_id_inventario;
    END IF;
END; //

DELIMITER ;

/**/
INSERT INTO tb_categorias (id_categoria, nombre_categoria) VALUES 
(UUID(), 'Electrónica'),
(UUID(), 'Ropa'),
(UUID(), 'Alimentos'),
(UUID(), 'Bebidas'),
(UUID(), 'Libros'),
(UUID(), 'Juguetes'),
(UUID(), 'Deportes'),
(UUID(), 'Salud y Belleza'),
(UUID(), 'Hogar y Cocina'),
(UUID(), 'Automotriz');

INSERT INTO tb_proveedores (id_proveedor, nombre_proveedor, direccion_proveedor, telefono_proveedor) VALUES 
(UUID(), 'Proveedor A', 'Dirección A', '1234567890'),
(UUID(), 'Proveedor B', 'Dirección B', '2345678901'),
(UUID(), 'Proveedor C', 'Dirección C', '3456789012'),
(UUID(), 'Proveedor D', 'Dirección D', '4567890123'),
(UUID(), 'Proveedor E', 'Dirección E', '5678901234'),
(UUID(), 'Proveedor F', 'Dirección F', '6789012345'),
(UUID(), 'Proveedor G', 'Dirección G', '7890123456'),
(UUID(), 'Proveedor H', 'Dirección H', '8901234567'),
(UUID(), 'Proveedor I', 'Dirección I', '9012345678'),
(UUID(), 'Proveedor J', 'Dirección J', '0123456789');

SELECT id_categoria FROM tb_categorias WHERE nombre_categoria = 'Electrónica';

SELECT id_proveedor FROM tb_proveedores WHERE nombre_proveedor = 'Proveedor A';

INSERT INTO tb_productos (id_producto, nombre_producto, descripcion_producto, precio_unitario, id_categoria, id_proveedor) VALUES 
(UUID(), 'Laptop Gamer', 'Laptop de alto rendimiento para juegos', 1200.00, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Smartphone X', 'Última generación de nuestro smartphone con cámara 4k', 800.00, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Smartwatch Health', 'Reloj inteligente con enfoque en la salud y el deporte', 199.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Camiseta algodón', 'Camiseta de algodón orgánico, talla M', 29.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Zapatillas deportivas', 'Zapatillas para correr, ligereza y confort', 89.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Libro de cocina', 'Las mejores recetas de la cocina mediterránea', 24.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Mochila viaje', 'Mochila resistente ideal para viajeros, capacidad 40L', 59.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Cafetera automática', 'Prepara tu café con la mejor cafetera automática del mercado', 299.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Set de utensilios cocina', 'Todo lo que necesitas para equipar tu cocina en un solo set', 79.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd'),
(UUID(), 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 59.99, '8184adc4-d6a5-11ee-834f-00ffffd995fd', '84008db8-d6a5-11ee-834f-00ffffd995fd');

SELECT id_producto FROM tb_productos WHERE nombre_producto = 'Laptop Gamer';

INSERT INTO tb_inventarios (id_inventarios, id_producto, cantidad_disponible, fecha_ingreso) VALUES
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 100, '2024-02-28'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 50, '2024-02-27'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 200, '2024-02-26'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 150, '2024-02-25'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 75, '2024-02-24'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 120, '2024-02-23'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 80, '2024-02-22'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 60, '2024-02-21'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 90, '2024-02-20'),
(UUID(), 'dfee6405-d6a5-11ee-834f-00ffffd995fd', 30, '2024-02-19');

SELECT id_inventarios FROM tb_inventarios WHERE id_producto = 'dfee6405-d6a5-11ee-834f-00ffffd995fd';

INSERT INTO tb_movimientos_inventarios (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, fercha_movimiento) VALUES
(UUID(), '493ad8e8-d6a6-11ee-834f-00ffffd995fd', 'Entrada', 20, '2024-02-28'),
(UUID(), '493bdcb0-d6a6-11ee-834f-00ffffd995fd', 'Salida', 5, '2024-02-27'),
(UUID(), '493bdf6f-d6a6-11ee-834f-00ffffd995fd', 'Entrada', 15, '2024-02-26'),
(UUID(), '493bdf6f-d6a6-11ee-834f-00ffffd995fd', 'Salida', 10, '2024-02-25'),
(UUID(), '493bdf6f-d6a6-11ee-834f-00ffffd995fd', 'Entrada', 25, '2024-02-24'),
(UUID(), '493bde72-d6a6-11ee-834f-00ffffd995fd', 'Salida', 8, '2024-02-23'),
(UUID(), '493bde72-d6a6-11ee-834f-00ffffd995fd', 'Entrada', 30, '2024-02-22'),
(UUID(), '493bdeec-d6a6-11ee-834f-00ffffd995fd', 'Salida', 12, '2024-02-21'),
(UUID(), '493bde72-d6a6-11ee-834f-00ffffd995fd', 'Entrada', 40, '2024-02-20'),
(UUID(), '493bdcb0-d6a6-11ee-834f-00ffffd995fd', 'Salida', 7, '2024-02-19');