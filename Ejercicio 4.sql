drop database if exists db_rapid_mart;

create database db_rapid_mart;

use db_rapid_mart;

create table tb_categorias(
	id_categoria int primary key not null,
    nombre_categoria varchar(50) not null
);

create table tb_proveedores(
	id_proveedor int primary key not null,
    nombre_proveedor varchar(50) not null,
    direccion_proveedor varchar(50) not null,
    telefono_proveedor varchar(10) not null
);

create table tb_movimientos_inventarios(
	id_movimiento_inventario int primary key not null,
    id_inventario int,
    tipo_movimiento enum('Entrada', 'Salida') not null,
    cantidad int not null,
    fercha_movimiento date not null
);

create table tb_inventarios(
	id_inventarios int primary key not null,
    id_producto int,
    cantidad_disponible int not null,
    fecha_ingreso date not null
);

create table tb_productos(
	id_producto int primary key not null,
    nombre_producto varchar(50) not null,
    descripcion_producto varchar(255) not null,
    precio_unitario decimal(10,2) not null,
    id_categoria int,
    id_proveedor int
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
alter table tb_productos add constraint foreign key (id_categoria) references tb_categorias(id_categoria);
alter table tb_productos add constraint foreign key (id_proveedor) references tb_proveedores(id_proveedor);

alter table tb_inventarios add constraint foreign key (id_producto) references tb_productos(id_producto);

alter table tb_movimientos_inventarios add constraint foreign key (id_inventario) references tb_inventarios(id_inventarios);

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
(UUID(), 'Laptop Gamer', 'Laptop de alto rendimiento para juegos', 1200.00, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Smartphone X', 'Última generación de nuestro smartphone con cámara 4k', 800.00, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Smartwatch Health', 'Reloj inteligente con enfoque en la salud y el deporte', 199.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Camiseta algodón', 'Camiseta de algodón orgánico, talla M', 29.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Zapatillas deportivas', 'Zapatillas para correr, ligereza y confort', 89.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Libro de cocina', 'Las mejores recetas de la cocina mediterránea', 24.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Mochila viaje', 'Mochila resistente ideal para viajeros, capacidad 40L', 59.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Cafetera automática', 'Prepara tu café con la mejor cafetera automática del mercado', 299.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Set de utensilios cocina', 'Todo lo que necesitas para equipar tu cocina en un solo set', 79.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045'),
(UUID(), 'Auriculares Bluetooth', 'Auriculares inalámbricos con cancelación de ruido', 59.99, 'ddc4de8e-d659-11ee-a503-00e04c360045', 'e4a9cf13-d659-11ee-a503-00e04c360045');

SELECT id_producto FROM tb_productos WHERE nombre_producto = 'Laptop Gamer';

INSERT INTO tb_inventarios (id_inventarios, id_producto, cantidad_disponible, fecha_ingreso) VALUES
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 100, '2024-02-28'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 50, '2024-02-27'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 200, '2024-02-26'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 150, '2024-02-25'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 75, '2024-02-24'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 120, '2024-02-23'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 80, '2024-02-22'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 60, '2024-02-21'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 90, '2024-02-20'),
(UUID(), '4f7f46fa-d65d-11ee-a503-00e04c360045', 30, '2024-02-19');

SELECT id_inventarios FROM tb_inventarios WHERE id_producto = '4f7f46fa-d65d-11ee-a503-00e04c360045';

INSERT INTO tb_movimientos_inventarios (id_movimiento_inventario, id_inventario, tipo_movimiento, cantidad, fercha_movimiento) VALUES
(UUID(), 'c11ca395-d65d-11ee-a503-00e04c360045', 'Entrada', 20, '2024-02-28'),
(UUID(), 'c11d0c3f-d65d-11ee-a503-00e04c360045', 'Salida', 5, '2024-02-27'),
(UUID(), 'c11d0c3f-d65d-11ee-a503-00e04c360045', 'Entrada', 15, '2024-02-26'),
(UUID(), 'c11d0d79-d65d-11ee-a503-00e04c360045', 'Salida', 10, '2024-02-25'),
(UUID(), 'c11d0d79-d65d-11ee-a503-00e04c360045', 'Entrada', 25, '2024-02-24'),
(UUID(), 'c11d0df3-d65d-11ee-a503-00e04c360045', 'Salida', 8, '2024-02-23'),
(UUID(), 'c11d0db8-d65d-11ee-a503-00e04c360045', 'Entrada', 30, '2024-02-22'),
(UUID(), 'c11d0db8-d65d-11ee-a503-00e04c360045', 'Salida', 12, '2024-02-21'),
(UUID(), 'c11d0df3-d65d-11ee-a503-00e04c360045', 'Entrada', 40, '2024-02-20'),
(UUID(), 'c11d0c3f-d65d-11ee-a503-00e04c360045', 'Salida', 7, '2024-02-19');