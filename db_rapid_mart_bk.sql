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
INSERT INTO `tb_categorias` VALUES ('8184adc4-d6a5-11ee-834f-00ffffd995fd','Electrónica'),('8185c3d9-d6a5-11ee-834f-00ffffd995fd','Ropa'),('8185c53d-d6a5-11ee-834f-00ffffd995fd','Alimentos'),('8185c580-d6a5-11ee-834f-00ffffd995fd','Bebidas'),('8185c5b6-d6a5-11ee-834f-00ffffd995fd','Libros'),('8185c5ea-d6a5-11ee-834f-00ffffd995fd','Juguetes'),('8185c61f-d6a5-11ee-834f-00ffffd995fd','Deportes'),('8185c658-d6a5-11ee-834f-00ffffd995fd','Salud y Belleza'),('8185c699-d6a5-11ee-834f-00ffffd995fd','Hogar y Cocina'),('8185c6c8-d6a5-11ee-834f-00ffffd995fd','Automotriz');
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
INSERT INTO `tb_inventarios` VALUES ('493ad8e8-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',120,'2024-02-28'),('493bdcb0-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',38,'2024-02-27'),('493bde72-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',262,'2024-02-26'),('493bdeec-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',138,'2024-02-25'),('493bdf6f-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',105,'2024-02-24'),('493bdff4-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',120,'2024-02-23'),('493be071-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',80,'2024-02-22'),('493be0d3-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',60,'2024-02-21'),('493be28e-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',90,'2024-02-20'),('493be2e6-d6a6-11ee-834f-00ffffd995fd','dfee6405-d6a5-11ee-834f-00ffffd995fd',30,'2024-02-19');
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
INSERT INTO `tb_movimientos_inventarios` VALUES ('7baafbc5-d6a6-11ee-834f-00ffffd995fd','493ad8e8-d6a6-11ee-834f-00ffffd995fd','Entrada',20,'2024-02-28'),('7bac2d0f-d6a6-11ee-834f-00ffffd995fd','493bdcb0-d6a6-11ee-834f-00ffffd995fd','Salida',5,'2024-02-27'),('7bacf26d-d6a6-11ee-834f-00ffffd995fd','493bdf6f-d6a6-11ee-834f-00ffffd995fd','Entrada',15,'2024-02-26'),('7bacff4c-d6a6-11ee-834f-00ffffd995fd','493bdf6f-d6a6-11ee-834f-00ffffd995fd','Salida',10,'2024-02-25'),('7bad0901-d6a6-11ee-834f-00ffffd995fd','493bdf6f-d6a6-11ee-834f-00ffffd995fd','Entrada',25,'2024-02-24'),('7bad0f9f-d6a6-11ee-834f-00ffffd995fd','493bde72-d6a6-11ee-834f-00ffffd995fd','Salida',8,'2024-02-23'),('7bad158c-d6a6-11ee-834f-00ffffd995fd','493bde72-d6a6-11ee-834f-00ffffd995fd','Entrada',30,'2024-02-22'),('7bad1a3f-d6a6-11ee-834f-00ffffd995fd','493bdeec-d6a6-11ee-834f-00ffffd995fd','Salida',12,'2024-02-21'),('7bad1f1f-d6a6-11ee-834f-00ffffd995fd','493bde72-d6a6-11ee-834f-00ffffd995fd','Entrada',40,'2024-02-20'),('7bad23bc-d6a6-11ee-834f-00ffffd995fd','493bdcb0-d6a6-11ee-834f-00ffffd995fd','Salida',7,'2024-02-19');
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
INSERT INTO `tb_productos` VALUES ('dfee6405-d6a5-11ee-834f-00ffffd995fd','Laptop Gamer','Laptop de alto rendimiento para juegos',1200.00,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef61f3-d6a5-11ee-834f-00ffffd995fd','Smartphone X','Última generación de nuestro smartphone con cámara 4k',800.00,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef63b8-d6a5-11ee-834f-00ffffd995fd','Smartwatch Health','Reloj inteligente con enfoque en la salud y el deporte',199.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef6444-d6a5-11ee-834f-00ffffd995fd','Camiseta algodón','Camiseta de algodón orgánico, talla M',29.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef64cb-d6a5-11ee-834f-00ffffd995fd','Zapatillas deportivas','Zapatillas para correr, ligereza y confort',89.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef6552-d6a5-11ee-834f-00ffffd995fd','Libro de cocina','Las mejores recetas de la cocina mediterránea',24.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef6606-d6a5-11ee-834f-00ffffd995fd','Mochila viaje','Mochila resistente ideal para viajeros, capacidad 40L',59.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef66a0-d6a5-11ee-834f-00ffffd995fd','Cafetera automática','Prepara tu café con la mejor cafetera automática del mercado',299.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfef6725-d6a5-11ee-834f-00ffffd995fd','Set de utensilios cocina','Todo lo que necesitas para equipar tu cocina en un solo set',79.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd'),('dfeffb47-d6a5-11ee-834f-00ffffd995fd','Auriculares Bluetooth','Auriculares inalámbricos con cancelación de ruido',59.99,'8184adc4-d6a5-11ee-834f-00ffffd995fd','84008db8-d6a5-11ee-834f-00ffffd995fd');
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
INSERT INTO `tb_proveedores` VALUES ('84008db8-d6a5-11ee-834f-00ffffd995fd','Proveedor A','Dirección A','1234567890'),('84019ba6-d6a5-11ee-834f-00ffffd995fd','Proveedor B','Dirección B','2345678901'),('84019d3a-d6a5-11ee-834f-00ffffd995fd','Proveedor C','Dirección C','3456789012'),('84019d89-d6a5-11ee-834f-00ffffd995fd','Proveedor D','Dirección D','4567890123'),('84019dcd-d6a5-11ee-834f-00ffffd995fd','Proveedor E','Dirección E','5678901234'),('84019e0b-d6a5-11ee-834f-00ffffd995fd','Proveedor F','Dirección F','6789012345'),('84019e40-d6a5-11ee-834f-00ffffd995fd','Proveedor G','Dirección G','7890123456'),('84019ed2-d6a5-11ee-834f-00ffffd995fd','Proveedor H','Dirección H','8901234567'),('84019f16-d6a5-11ee-834f-00ffffd995fd','Proveedor I','Dirección I','9012345678'),('84019f43-d6a5-11ee-834f-00ffffd995fd','Proveedor J','Dirección J','0123456789');
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

-- Dump completed on 2024-02-28 20:04:53
