-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_rapid_mart
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_categorias`
--

DROP TABLE IF EXISTS `tb_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_categorias` (
  `id_categoria` char(36) NOT NULL,
  `nombre_categoria` varchar(50) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categorias`
--

LOCK TABLES `tb_categorias` WRITE;
/*!40000 ALTER TABLE `tb_categorias` DISABLE KEYS */;
INSERT INTO `tb_categorias` VALUES ('ddc4de8e-d659-11ee-a503-00e04c360045','Electrónica'),('ddc51581-d659-11ee-a503-00e04c360045','Ropa'),('ddc51655-d659-11ee-a503-00e04c360045','Alimentos'),('ddc51673-d659-11ee-a503-00e04c360045','Bebidas'),('ddc5168b-d659-11ee-a503-00e04c360045','Libros'),('ddc516a6-d659-11ee-a503-00e04c360045','Juguetes'),('ddc516bd-d659-11ee-a503-00e04c360045','Deportes'),('ddc516d3-d659-11ee-a503-00e04c360045','Salud y Belleza'),('ddc516ef-d659-11ee-a503-00e04c360045','Hogar y Cocina'),('ddc51704-d659-11ee-a503-00e04c360045','Automotriz');
/*!40000 ALTER TABLE `tb_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inventarios`
--

DROP TABLE IF EXISTS `tb_inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inventarios` (
  `id_inventarios` char(36) NOT NULL,
  `id_producto` char(36) DEFAULT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`id_inventarios`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `tb_inventarios_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `tb_productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inventarios`
--

LOCK TABLES `tb_inventarios` WRITE;
/*!40000 ALTER TABLE `tb_inventarios` DISABLE KEYS */;
INSERT INTO `tb_inventarios` VALUES ('c11ca395-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',120,'2024-02-28'),('c11d0c3f-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',53,'2024-02-27'),('c11d0d79-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',215,'2024-02-26'),('c11d0db8-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',168,'2024-02-25'),('c11d0df3-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',107,'2024-02-24'),('c11d0e2f-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',120,'2024-02-23'),('c11d4cd3-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',80,'2024-02-22'),('c11d4e68-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',60,'2024-02-21'),('c11d4f68-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',90,'2024-02-20'),('c11d4fd5-d65d-11ee-a503-00e04c360045','4f7f46fa-d65d-11ee-a503-00e04c360045',30,'2024-02-19');
/*!40000 ALTER TABLE `tb_inventarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_movimientos_inventarios`
--

DROP TABLE IF EXISTS `tb_movimientos_inventarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_movimientos_inventarios` (
  `id_movimiento_inventario` char(36) NOT NULL,
  `id_inventario` char(36) DEFAULT NULL,
  `tipo_movimiento` enum('Entrada','Salida') NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fercha_movimiento` date NOT NULL,
  PRIMARY KEY (`id_movimiento_inventario`),
  KEY `id_inventario` (`id_inventario`),
  CONSTRAINT `tb_movimientos_inventarios_ibfk_1` FOREIGN KEY (`id_inventario`) REFERENCES `tb_inventarios` (`id_inventarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_movimientos_inventarios`
--

LOCK TABLES `tb_movimientos_inventarios` WRITE;
/*!40000 ALTER TABLE `tb_movimientos_inventarios` DISABLE KEYS */;
INSERT INTO `tb_movimientos_inventarios` VALUES ('7e98054c-d65e-11ee-a503-00e04c360045','c11ca395-d65d-11ee-a503-00e04c360045','Entrada',20,'2024-02-28'),('7e98c702-d65e-11ee-a503-00e04c360045','c11d0c3f-d65d-11ee-a503-00e04c360045','Salida',5,'2024-02-27'),('7e98cddd-d65e-11ee-a503-00e04c360045','c11d0c3f-d65d-11ee-a503-00e04c360045','Entrada',15,'2024-02-26'),('7e992639-d65e-11ee-a503-00e04c360045','c11d0d79-d65d-11ee-a503-00e04c360045','Salida',10,'2024-02-25'),('7e992aa5-d65e-11ee-a503-00e04c360045','c11d0d79-d65d-11ee-a503-00e04c360045','Entrada',25,'2024-02-24'),('7e992d54-d65e-11ee-a503-00e04c360045','c11d0df3-d65d-11ee-a503-00e04c360045','Salida',8,'2024-02-23'),('7e9930a5-d65e-11ee-a503-00e04c360045','c11d0db8-d65d-11ee-a503-00e04c360045','Entrada',30,'2024-02-22'),('7e9933e2-d65e-11ee-a503-00e04c360045','c11d0db8-d65d-11ee-a503-00e04c360045','Salida',12,'2024-02-21'),('7e993781-d65e-11ee-a503-00e04c360045','c11d0df3-d65d-11ee-a503-00e04c360045','Entrada',40,'2024-02-20'),('7e993b1c-d65e-11ee-a503-00e04c360045','c11d0c3f-d65d-11ee-a503-00e04c360045','Salida',7,'2024-02-19');
/*!40000 ALTER TABLE `tb_movimientos_inventarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_movimiento_insert
AFTER INSERT ON tb_movimientos_inventarios
FOR EACH ROW
BEGIN
    DECLARE v_id_inventario CHAR(36);
    DECLARE v_cantidad_actual INT;
    
    -- Encuentra el id_inventario y la cantidad disponible actual basada en el id_producto del movimiento.
    SELECT id_inventarios, cantidad_disponible INTO v_id_inventario, v_cantidad_actual
    FROM tb_inventarios
    WHERE id_inventarios = NEW.id_inventario;
    
    -- Verifica si el movimiento es una Entrada o Salida y actualiza la cantidad disponible acorde.
    IF NEW.tipo_movimiento = 'Entrada' THEN
        UPDATE tb_inventarios
        SET cantidad_disponible = v_cantidad_actual + NEW.cantidad
        WHERE id_inventarios = v_id_inventario;
    ELSEIF NEW.tipo_movimiento = 'Salida' THEN
        UPDATE tb_inventarios
        SET cantidad_disponible = v_cantidad_actual - NEW.cantidad
        WHERE id_inventarios = v_id_inventario;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_productos`
--

DROP TABLE IF EXISTS `tb_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_productos` (
  `id_producto` char(36) NOT NULL,
  `nombre_producto` varchar(50) NOT NULL,
  `descripcion_producto` varchar(255) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `id_categoria` char(36) DEFAULT NULL,
  `id_proveedor` char(36) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  KEY `id_proveedor` (`id_proveedor`),
  CONSTRAINT `tb_productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categorias` (`id_categoria`),
  CONSTRAINT `tb_productos_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `tb_proveedores` (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_productos`
--

LOCK TABLES `tb_productos` WRITE;
/*!40000 ALTER TABLE `tb_productos` DISABLE KEYS */;
INSERT INTO `tb_productos` VALUES ('4f7f46fa-d65d-11ee-a503-00e04c360045','Laptop Gamer','Laptop de alto rendimiento para juegos',1200.00,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f7f93c0-d65d-11ee-a503-00e04c360045','Smartphone X','Última generación de nuestro smartphone con cámara 4k',800.00,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f7f94f9-d65d-11ee-a503-00e04c360045','Smartwatch Health','Reloj inteligente con enfoque en la salud y el deporte',199.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f8000be-d65d-11ee-a503-00e04c360045','Camiseta algodón','Camiseta de algodón orgánico, talla M',29.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f8002c6-d65d-11ee-a503-00e04c360045','Zapatillas deportivas','Zapatillas para correr, ligereza y confort',89.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f800363-d65d-11ee-a503-00e04c360045','Libro de cocina','Las mejores recetas de la cocina mediterránea',24.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f800643-d65d-11ee-a503-00e04c360045','Mochila viaje','Mochila resistente ideal para viajeros, capacidad 40L',59.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f8006c6-d65d-11ee-a503-00e04c360045','Cafetera automática','Prepara tu café con la mejor cafetera automática del mercado',299.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f800748-d65d-11ee-a503-00e04c360045','Set de utensilios cocina','Todo lo que necesitas para equipar tu cocina en un solo set',79.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045'),('4f8007b2-d65d-11ee-a503-00e04c360045','Auriculares Bluetooth','Auriculares inalámbricos con cancelación de ruido',59.99,'ddc4de8e-d659-11ee-a503-00e04c360045','e4a9cf13-d659-11ee-a503-00e04c360045');
/*!40000 ALTER TABLE `tb_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_proveedores`
--

DROP TABLE IF EXISTS `tb_proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_proveedores` (
  `id_proveedor` char(36) NOT NULL,
  `nombre_proveedor` varchar(50) NOT NULL,
  `direccion_proveedor` varchar(50) NOT NULL,
  `telefono_proveedor` varchar(10) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_proveedores`
--

LOCK TABLES `tb_proveedores` WRITE;
/*!40000 ALTER TABLE `tb_proveedores` DISABLE KEYS */;
INSERT INTO `tb_proveedores` VALUES ('e4a9cf13-d659-11ee-a503-00e04c360045','Proveedor A','Dirección A','1234567890'),('e4a9f9ae-d659-11ee-a503-00e04c360045','Proveedor B','Dirección B','2345678901'),('e4a9fadd-d659-11ee-a503-00e04c360045','Proveedor C','Dirección C','3456789012'),('e4a9fb1b-d659-11ee-a503-00e04c360045','Proveedor D','Dirección D','4567890123'),('e4a9fb54-d659-11ee-a503-00e04c360045','Proveedor E','Dirección E','5678901234'),('e4a9fb8c-d659-11ee-a503-00e04c360045','Proveedor F','Dirección F','6789012345'),('e4a9fbc1-d659-11ee-a503-00e04c360045','Proveedor G','Dirección G','7890123456'),('e4a9fbf9-d659-11ee-a503-00e04c360045','Proveedor H','Dirección H','8901234567'),('e4aa0754-d659-11ee-a503-00e04c360045','Proveedor I','Dirección I','9012345678'),('e4aa07cb-d659-11ee-a503-00e04c360045','Proveedor J','Dirección J','0123456789');
/*!40000 ALTER TABLE `tb_proveedores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 12:03:22
