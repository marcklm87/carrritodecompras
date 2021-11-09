-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: littlecommerce
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_login_attempts_user1_idx` (`user_id`),
  CONSTRAINT `fk_login_attempts_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_attempts`
--

LOCK TABLES `login_attempts` WRITE;
/*!40000 ALTER TABLE `login_attempts` DISABLE KEYS */;
INSERT INTO `login_attempts` VALUES (1,'2021-11-08 07:49:47',1),(2,'2021-11-08 07:49:52',1),(3,'2021-11-08 07:49:52',1),(4,'2021-11-08 07:49:53',1);
/*!40000 ALTER TABLE `login_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finish` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `shipping_address` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user1_idx` (`user_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,'2021-11-08 09:52:58',1,'Conocido'),(2,1,'2021-11-08 10:04:20',1,'Conocido'),(3,1,'2021-11-08 10:06:36',1,'Conocido');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_item_order1_idx` (`order_id`),
  KEY `fk_order_item_product1_idx` (`product_id`),
  CONSTRAINT `fk_order_item_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `fk_order_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,'2021-11-08 10:04:20',25,19.98,2,1327),(2,'2021-11-08 10:04:20',30,19.98,2,1328),(3,'2021-11-08 10:06:36',25,19.98,3,1327),(4,'2021-11-08 10:06:36',30,19.98,3,1328);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sku_UNIQUE` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=1673 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1326,'Blanqueador Golondrina 1 Litro','1',17.64,'2021-11-08 06:58:52'),(1327,'Blanqueador 1L Los Patitos','2',17.64,'2021-11-08 06:58:52'),(1328,'Blanqueador Cloralex Botella Mediana 950 ml','3',14.50,'2021-11-08 06:58:52'),(1329,'Blanqueador Clorox triple accion 930 ml','4',17.64,'2021-11-08 06:58:52'),(1330,'Blanqueador Desinfectante Cloralex El Rendidor 2 Litros','5',17.64,'2021-11-08 06:58:52'),(1331,'Jabón Líquido para Ropa','6',14.50,'2021-11-08 06:58:52'),(1332,'Suavizante de telas Downy aroma floral 800 ml','7',17.64,'2021-11-08 06:58:52'),(1333,'Suavizante De Telas Downy Romance 750 Mililitros','8',14.50,'2021-11-08 06:58:52'),(1334,'Suavizante De Telas Downy Perfume Collections Elegance Concentrado 750 Mililitros','9',17.64,'2021-11-08 06:58:52'),(1335,'Suavizante De Telas Downy Floral 2.800 Mililitros','10',17.64,'2021-11-08 06:58:52'),(1336,'Suavizante De Telas Suavitel Cuidado Superior Fresca Primavera 3 L','11',14.50,'2021-11-08 06:58:52'),(1337,'Suavizante De Telas Suavitel Cuidado Superior Fresco Aroma Sol 850ml','12',17.64,'2021-11-08 06:58:52'),(1338,'Detergente Ariel Regular 850 g','13',14.50,'2021-11-08 06:58:52'),(1339,'Detergente en polvo Ace maxi limpieza 900 g','14',17.64,'2021-11-08 06:58:52'),(1340,'Detergente Roma Bolsa Grande 1 Kg','15',17.64,'2021-11-08 06:58:52'),(1341,'Limpiador liquido Fabuloso frescura activa mar fresco 1 Litro','16',14.50,'2021-11-08 06:58:52'),(1342,'Limpiador liquido Fabuloso desinfectante frescura natural 828 ml','17',17.64,'2021-11-08 06:58:52'),(1343,'Limpiador liquido Mr Musculo desengrasante para cocina naranja 650 ml','18',14.50,'2021-11-08 06:58:52'),(1344,'Liquido Limpiador 1L','19',17.64,'2021-11-08 06:58:52'),(1345,'Acondicionador de telas Suavitel suavidad y fragancia acqua 740 ml','20',17.64,'2021-11-08 06:58:52'),(1346,'Acondicionador de telas Suavitel cuidado superior fresca primavera 850 ml','21',14.50,'2021-11-08 06:58:52'),(1347,'Lavatrastes liquido Salvo limon 750 ml','22',17.64,'2021-11-08 06:58:52'),(1348,'Limpiador Multiusos Fabuloso Lavanda 2 Litros','23',14.50,'2021-11-08 06:58:52'),(1349,'Multilimpiador Desinfectante Pinol El Original 2 Litros','24',17.64,'2021-11-08 06:58:52'),(1350,'Jabon Zote en Barra Blanco 400 gr F2','25F2',17.64,'2021-11-08 06:58:52'),(1351,'Jabon Dove De Tocador Blanco 135 Gramos','26',14.50,'2021-11-08 06:58:52'),(1352,'Jabon de tocador Palmolive Neutro Balance dermolimpiador 150 g','27',17.64,'2021-11-08 06:58:52'),(1353,'Servitoalla Petalo Multicortes 180 Hojas','28',14.50,'2021-11-08 06:58:52'),(1354,'Blanqueador Concentrado marca los patitos 2L','29',17.64,'2021-11-08 06:58:52'),(1355,'Blanqueador Concentrado marca los patitos 500ml','30',17.64,'2021-11-08 06:58:52'),(1356,'Suavizante para ropa Los Patitos 940ml fresco azul cielo','31',14.50,'2021-11-08 06:58:52'),(1357,'Suavizante para ropa Los Patitos 940ml soleado amanecer','32',17.64,'2021-11-08 06:58:52'),(1358,'Suavizante para ropa Los Patitos 940ml surtido','33',14.50,'2021-11-08 06:58:52'),(1359,'Suavizante para ropa Los Patitos 940ml florecer de violetas','34',17.64,'2021-11-08 06:58:52'),(1360,'Suavizante para ropa Los Patitos 940ml caricia fresca','35',17.64,'2021-11-08 06:58:52'),(1361,'Blanqueador 2L La Golondrina','36',14.50,'2021-11-08 06:58:52'),(1362,'Blanqueador 500ml La Golondrina','37',17.64,'2021-11-08 06:58:52'),(1363,'Blanqueador liquido concentrado marca Clorinol 1L','38',14.50,'2021-11-08 06:58:52'),(1364,'Limpiador Multiusos Los Patitos lavanda 1L','39',17.64,'2021-11-08 06:58:52'),(1365,'Limpiador Multiusos Los Patitos Fresco amanecer 1L','40',17.64,'2021-11-08 06:58:52'),(1366,'Limpiador Multiusos Los Patitos Floral 1L','41',14.50,'2021-11-08 06:58:52'),(1367,'Limpiador Multiusos Los Patitos Lima-limon 1L','42',17.64,'2021-11-08 06:58:52'),(1368,'Limpiador Multiusos Los Patitos Naranja 1L','43',14.50,'2021-11-08 06:58:52'),(1369,'Limpiador Multiusos Los Patitos Frutal 1L','44',17.64,'2021-11-08 06:58:52'),(1370,'Limpiador Multiusos Los Patitos Manzana-canela 1L','45',17.64,'2021-11-08 06:58:52'),(1371,'Limpiador Multiusos Los Patitos Bebe 1L','46',14.50,'2021-11-08 06:58:52'),(1372,'Blancamax 920ml','47',17.64,'2021-11-08 06:58:52'),(1373,'La valenciana 500ml','48',14.50,'2021-11-08 06:58:52'),(1374,'La valenciana 1L','49',17.64,'2021-11-08 06:58:52'),(1375,'La valenciana 2L','50',17.64,'2021-11-08 06:58:52'),(1376,'Pino los patitos 1L','51',2.00,'2021-11-08 06:58:52'),(1377,'Detergente briloza liquido 730ml','52',17.64,'2021-11-08 06:58:52'),(1378,'Detergente briloza polvo 1kg ','53',14.50,'2021-11-08 06:58:52'),(1379,'Detergente liquido foca 1L ','54',17.64,'2021-11-08 06:58:52'),(1380,'Detergente liquido roma 1L ','55',17.64,'2021-11-08 06:58:52'),(1381,'Detergente liquido blanca nieves 1L ','56',14.50,'2021-11-08 06:58:52'),(1382,'Detergente liquido carisma 1L ','57',17.64,'2021-11-08 06:58:52'),(1383,'Limpiadores colibri surtido  1 litro','58',14.50,'2021-11-08 06:58:52'),(1384,'Mascarilla facial Garnier SkinActive','10000',17.64,'2021-11-08 06:58:52'),(1385,'Nivea Crema Lata 20 Ml','10001',17.64,'2021-11-08 06:58:52'),(1386,'Crema Corporal Nuvel Piel Seca Con Antioxidantes 775 Mililitros','10002',14.50,'2021-11-08 06:58:52'),(1387,'Papel higienico Pétalo 12 rollos con 234 hojas dobles c/u','10003',17.64,'2021-11-08 06:58:52'),(1388,'Papel Higienico Petalo Ultra Resistente Hig 500 Hd 6 Piezas','10004',14.50,'2021-11-08 06:58:52'),(1389,'Papel higienico Petalo Rendimax 12 rollos con 320 hojas dobles c/u','10005',17.64,'2021-11-08 06:58:52'),(1390,'Desodorante Rexona','10006',17.64,'2021-11-08 06:58:52'),(1391,'Desodorante Old Spice fresh en barra para caballero 50 g','10007',14.50,'2021-11-08 06:58:52'),(1392,'Antitranspirante Lady Speed Stick wild freesia en barra para dama 45 g','10008',17.64,'2021-11-08 06:58:52'),(1393,'Antitranspirante Rexona Motion Sense invisible en aerosol para caballero 90 gr','10009',14.50,'2021-11-08 06:58:52'),(1394,'Antitranspirante Lady Speed Stick 247 Powder Fresh Aerosol 91 g','10010',17.64,'2021-11-08 06:58:52'),(1395,'Desodorante Axe En Aerosol Gold Temptation 150 ml','10011',17.64,'2021-11-08 06:58:52'),(1396,'Jabón de tocador Zest 150 g','10012',14.50,'2021-11-08 06:58:52'),(1397,'Jabón de tocador Rosa Venus 100 gr','10013',17.64,'2021-11-08 06:58:52'),(1398,'Jabon líquido corporal Dove Men+Care clean comfort 400 ml','10014',14.50,'2021-11-08 06:58:52'),(1399,'Maxima Premium Jabon Liquido Frutos Rojos 1 Lt','10015',17.64,'2021-11-08 06:58:52'),(1400,'Lapiz Labial Ole! Rojo 4 g','10016',17.64,'2021-11-08 06:58:52'),(1401,'Gel fijador Ego Black para caballero 500 ml','10017',14.50,'2021-11-08 06:58:52'),(1402,'Toallas femeninas Saba Invisible buenos días flujo moderado delgada con alas 14 pzas','10018',17.64,'2021-11-08 06:58:52'),(1403,'Crema Dental Crest 3D White Brilliant Fresh 53 Mililitros','10019',14.50,'2021-11-08 06:58:52'),(1404,'Pasta Dental Colgate Triple Accion Original 50 M','10020',17.64,'2021-11-08 06:58:52'),(1405,'Crema Dental Crest Complete 100 Mililitros','10021',17.64,'2021-11-08 06:58:52'),(1406,'Pasta Dental Colgate Luminous White Brilliant 50 Ml','10022',14.50,'2021-11-08 06:58:52'),(1407,'Maquina para afeitar Gillette Mach3 sensitive para caballero 1 pza','10023',17.64,'2021-11-08 06:58:52'),(1408,'Maquina para afeitar Gillette Prestobarba 3 paquete con 2 pzas','10024',14.50,'2021-11-08 06:58:52'),(1409,'Cartuchos para afeitar Gillette Mach3 sensitive 1 paquete con 4 pzas','10025',17.64,'2021-11-08 06:58:52'),(1410,'Espuma de afeitar Nivea Men sensitive 200 ml','10026',17.64,'2021-11-08 06:58:52'),(1411,'Pantene Shampoo Cuidado Clasico 2 En 1 400 Mililitros','10027',14.50,'2021-11-08 06:58:52'),(1412,'Shampoo Head & Shoulders Limpieza Renovadora 375 Mililitros','10028',17.64,'2021-11-08 06:58:52'),(1413,'Shampoo Caprice Naturals Aceite Herbal De 760 Ml','10029',14.50,'2021-11-08 06:58:52'),(1414,'Enjuague Bucal Colgate Plax Ice Infinity De 60 Ml','10030',17.64,'2021-11-08 06:58:52'),(1415,'Enjuague Bucal Colgate Plax Ice Infinity 250 Ml','10031',17.64,'2021-11-08 06:58:52'),(1416,'Jabon coral 100g ','10032',14.50,'2021-11-08 06:58:52'),(1417,'Ziploc 100 Bolsas Sandwich','20000',17.64,'2021-11-08 06:58:52'),(1418,'Servilletas Paquete 100 unidades','20001',14.50,'2021-11-08 06:58:52'),(1419,'Servilletas Petalo Blancas','20002',17.64,'2021-11-08 06:58:52'),(1420,'1-2-3 Aceite Vegetal 1 Litro','20003',17.64,'2021-11-08 06:58:52'),(1421,'Cafe soluble Nescafe clasico 225 gr','20004',14.50,'2021-11-08 06:58:52'),(1422,'Sopa instantanea Maruchan Instant Lunch sabor pollo 64 gr','20005',17.64,'2021-11-08 06:58:52'),(1423,'Sopa instantanea Maruchan Instant Lunch con camaron limon y habanero 64 gr','20006',14.50,'2021-11-08 06:58:52'),(1424,'Caldo de pollo Riko Pollo en polvo 330 gr','20007',17.64,'2021-11-08 06:58:52'),(1425,'Lomo de atun Dolores aleta amarilla en aceite 140 gr','20008',17.64,'2021-11-08 06:58:52'),(1426,'Lomo de atun Dolores aleta amarilla en agua 140 gr','20009',14.50,'2021-11-08 06:58:52'),(1427,'Azucar mascabado Zulka 500 gr','20010',17.64,'2021-11-08 06:58:52'),(1428,'Azucar Zulka Empacada 1 Kg','20011',14.50,'2021-11-08 06:58:52'),(1429,'Frijoles bayos Isadora refritos 430 gr','20012',17.64,'2021-11-08 06:58:52'),(1430,'McCormick Mostaza 260 gr','20013',17.64,'2021-11-08 06:58:52'),(1431,'Mayonesa McCormick con jugo de limon 390 gr','20014',14.50,'2021-11-08 06:58:52'),(1432,'Salsa picante Valentina etiqueta amarilla 350 ml','20015',17.64,'2021-11-08 06:58:52'),(1433,'Salsa de tomate catsup Del Monte 900 gr','20016',14.50,'2021-11-08 06:58:52'),(1434,'Polvo para preparar bebida Tang sabor a horchata 14 gr','20017',17.64,'2021-11-08 06:58:52'),(1435,'Polvo para preparar bebida Tang sabor a jamaica 14 gr','20018',17.64,'2021-11-08 06:58:52'),(1436,'Polvo para preparar bebida Tang sabor a limon 14 gr','20019',14.50,'2021-11-08 06:58:52'),(1437,'Polvo para preparar bebida Tang sabor a naranja 14 gr','20020',17.64,'2021-11-08 06:58:52'),(1438,'Sal de grano elefante 1kg','20021',14.50,'2021-11-08 06:58:52'),(1439,'La Fina Sal Natural Yodada Fluorurada 1 Kg','20022',17.64,'2021-11-08 06:58:52'),(1440,'Lenteja Verde Valle 500 gr','20023',17.64,'2021-11-08 06:58:52'),(1441,'Arroz morelos bolsa 1kg','20024',14.50,'2021-11-08 06:58:52'),(1442,'Frijoles Negros Enteros La Costena 560g','20025',17.64,'2021-11-08 06:58:52'),(1443,'Vinagre Barrilito Blanco 750ml','20026',14.50,'2021-11-08 06:58:52'),(1444,'Vinagre Barrilito Manzana 750ml','20027',17.64,'2021-11-08 06:58:52'),(1445,'Aceite Vegetal 1-2-3 Galon 3.7L','20028',17.64,'2021-11-08 06:58:52'),(1446,'Fideo Seco 200gr (a granel)','30000',14.50,'2021-11-08 06:58:52'),(1447,'Sal de Mesa 1kg','30001',17.64,'2021-11-08 06:58:52'),(1448,'Aceite Comestible 900 ml','30002',14.50,'2021-11-08 06:58:52'),(1449,'azucar kg','30003',17.64,'2021-11-08 06:58:52'),(1450,'Aluvia chica kg','30004',17.64,'2021-11-08 06:58:52'),(1451,'Arroz kg','30005',14.50,'2021-11-08 06:58:52'),(1452,'Pimienta gorda 500gr','30006',17.64,'2021-11-08 06:58:52'),(1453,'Pimienta negra molida 500gr','30007',14.50,'2021-11-08 06:58:52'),(1454,'Comino entero 500gr','30008',17.64,'2021-11-08 06:58:52'),(1455,'Clavo entero 250gr','30009',17.64,'2021-11-08 06:58:52'),(1456,'Canela molida kg','30010',14.50,'2021-11-08 06:58:52'),(1457,'canela entera 250gr','30011',17.64,'2021-11-08 06:58:52'),(1458,'Ajonjoli kg','30012',14.50,'2021-11-08 06:58:52'),(1459,'Chile seco cascabel 500 gr','30013',17.64,'2021-11-08 06:58:52'),(1460,'Chile seco pasilla 500gr','30014',17.64,'2021-11-08 06:58:52'),(1461,'Chile seco ancho 500 gr','30015',14.50,'2021-11-08 06:58:52'),(1462,'Chile seco puya 500gr','30016',17.64,'2021-11-08 06:58:52'),(1463,'Chile seco morita 500gr','30017',14.50,'2021-11-08 06:58:52'),(1464,'Chile seco meco 500gr','30018',17.64,'2021-11-08 06:58:52'),(1465,'Chile de arbol con pata seco 500gr','30019',17.64,'2021-11-08 06:58:52'),(1466,'Chile Seco Guajillo 500 gr','30020',14.50,'2021-11-08 06:58:52'),(1467,'Almendra 500gr','30021',17.64,'2021-11-08 06:58:52'),(1468,'Oregano Seco 500gr','30022',14.50,'2021-11-08 06:58:52'),(1469,'Ajo en polvo kg','30023',17.64,'2021-11-08 06:58:52'),(1470,'Amaranto kg','30024',17.64,'2021-11-08 06:58:52'),(1471,'Cacahuate tostado kg','30025',14.50,'2021-11-08 06:58:52'),(1472,'Avena kg','30026',17.64,'2021-11-08 06:58:52'),(1473,'Frijol bayo kg','30027',14.50,'2021-11-08 06:58:52'),(1474,'Pepita pelada 500gr','30028',17.64,'2021-11-08 06:58:52'),(1475,'Arandano seco 500gr','30029',17.64,'2021-11-08 06:58:52'),(1476,'piloncillo kg','30030',14.50,'2021-11-08 06:58:52'),(1477,'Lenteja kg','30031',17.64,'2021-11-08 06:58:52'),(1478,'Uva pasa kg','30032',14.50,'2021-11-08 06:58:52'),(1479,'Nuez quebrada 500gr','30033',17.64,'2021-11-08 06:58:52'),(1480,'Garbanza kg','30034',17.64,'2021-11-08 06:58:52'),(1481,'Tamarindo kg','30035',14.50,'2021-11-08 06:58:52'),(1482,'Flor De Jamaica 500 gr','30036',17.64,'2021-11-08 06:58:52'),(1483,'Arroz Verde Valle Super Extra 1 kg','30037',14.50,'2021-11-08 06:58:52'),(1484,'Berro Kg','30038',17.64,'2021-11-08 06:58:52'),(1485,'Leche Nutri Pinta 1 Litro','40000',17.64,'2021-11-08 06:58:52'),(1486,'Leche Alpura Entera 1 Litro','40001',14.50,'2021-11-08 06:58:52'),(1487,'Huevo Blanco 30 piezas','40002',17.64,'2021-11-08 06:58:52'),(1488,'Tequila Don Julio 70 Añejo Cristalino 700 ml','50000',14.50,'2021-11-08 06:58:52'),(1489,'Tequila Jose Cuervo Especial Reposado 990 ml','50001',17.64,'2021-11-08 06:58:52'),(1490,'Tequila Cabrito Reposado 750 ml','50002',17.64,'2021-11-08 06:58:52'),(1491,'Tequila 100 anos Reposado 700 ml','50003',14.50,'2021-11-08 06:58:52'),(1492,'Tequila 100 anos Blanco 700 ml','50004',17.64,'2021-11-08 06:58:52'),(1493,'Tequila Jose Cuervo Tradicional Reposado 695 ml','50005',14.50,'2021-11-08 06:58:52'),(1494,'Tequila Jose Cuervo Tradicional Plata 695 ml','50006',17.64,'2021-11-08 06:58:52'),(1495,'Tequila Don Julio Reposado 700 ml','50007',17.64,'2021-11-08 06:58:52'),(1496,'Tequila Don Julio Blanco 700 ml','50008',14.50,'2021-11-08 06:58:52'),(1497,'Tequila Jose Cuervo Especial Reposado 695 ml','50009',17.64,'2021-11-08 06:58:52'),(1498,'Ron Bacardi Carta Blanca 750 ml','50010',14.50,'2021-11-08 06:58:52'),(1499,'Whisky Johnnie Walker Blend Red Label 700 ml','50011',17.64,'2021-11-08 06:58:52'),(1500,'Ginebra Bombay Sapphire - 750 ml','50012',17.64,'2021-11-08 06:58:52'),(1501,'Ginebra Tanqueray London Dry - 750 ml','50013',14.50,'2021-11-08 06:58:52'),(1502,'Vodka Smirnoff Tamarindo 750 ml','50014',17.64,'2021-11-08 06:58:52'),(1503,'Vodka Absolut Blue 750 ml','50015',14.50,'2021-11-08 06:58:52'),(1504,'Vodka Absolut Raspberri 750 ml','50016',17.64,'2021-11-08 06:58:52'),(1505,'Vodka Absolut Citron 750 ml','50017',17.64,'2021-11-08 06:58:52'),(1506,'Brandy Torres 10 700 ml','50018',14.50,'2021-11-08 06:58:52'),(1507,'Chile Manzano 500g','60000',17.64,'2021-11-08 06:58:52'),(1508,'Chile Habanero Naranja 500g','60001',14.50,'2021-11-08 06:58:52'),(1509,'Fresas En Caja De 3 Kg','60002',17.64,'2021-11-08 06:58:52'),(1510,'Fresas 450 gr','60003',17.64,'2021-11-08 06:58:52'),(1511,'Arugula Manojo 150 gr','60004',14.50,'2021-11-08 06:58:52'),(1512,'Tomillo 150 gr','60005',17.64,'2021-11-08 06:58:52'),(1513,'Salvia Manojo 150 gr','60006',14.50,'2021-11-08 06:58:52'),(1514,'Romero Manojo 150 gr','60007',17.64,'2021-11-08 06:58:52'),(1515,'Poro Unidad','60008',17.64,'2021-11-08 06:58:52'),(1516,'Oregano fresco 150 gr','60009',14.50,'2021-11-08 06:58:52'),(1517,'Laurel Manojo 150 gr','60010',17.64,'2021-11-08 06:58:52'),(1518,'Huazontle Kg','60011',14.50,'2021-11-08 06:58:52'),(1519,'Hoja De Platano Unidad','60012',17.64,'2021-11-08 06:58:52'),(1520,'Hoja De Maiz Unidad','60013',17.64,'2021-11-08 06:58:52'),(1521,'Hoja Santa Unidad','60014',14.50,'2021-11-08 06:58:52'),(1522,'Hinojo Manojo 150 gr','60015',17.64,'2021-11-08 06:58:52'),(1523,'Hierbas De Olor Manojo 150 gr','60016',14.50,'2021-11-08 06:58:52'),(1524,'Espinaca Baby Kg','60017',17.64,'2021-11-08 06:58:52'),(1525,'Col Morada Unidad','60018',17.64,'2021-11-08 06:58:52'),(1526,'Cilantro Criollo Manojo 250 gr','60019',14.50,'2021-11-08 06:58:52'),(1527,'Cebollin Manojo 150 gr','60020',17.64,'2021-11-08 06:58:52'),(1528,'Albahaca Italiana Manojo 150 gr','60021',14.50,'2021-11-08 06:58:52'),(1529,'Jitomate Bola Kg','60022',17.64,'2021-11-08 06:58:52'),(1530,'Jitomate Cherry 450 gr','60023',17.64,'2021-11-08 06:58:52'),(1531,'Jitomate Saladet Kg','60024',14.50,'2021-11-08 06:58:52'),(1532,'Tomate Verde Pelado Kg','60025',17.64,'2021-11-08 06:58:52'),(1533,'Cebolla Morada Limpia Kg','60026',14.50,'2021-11-08 06:58:52'),(1534,'Cebolla Blanca Limpia Kg','60027',17.64,'2021-11-08 06:58:52'),(1535,'Cebolla Cambray Con Rabo Manojo 250 gr','60028',17.64,'2021-11-08 06:58:52'),(1536,'Aguacate Hass Kg','60029',14.50,'2021-11-08 06:58:52'),(1537,'Platano Tabasco Kg','60030',17.64,'2021-11-08 06:58:52'),(1538,'Platano Dominico Kg','60031',14.50,'2021-11-08 06:58:52'),(1539,'Platano Macho Kg','60032',17.64,'2021-11-08 06:58:52'),(1540,'Papaya Unidad','60033',17.64,'2021-11-08 06:58:52'),(1541,'Pina Cayena Unidad','60035',14.50,'2021-11-08 06:58:52'),(1542,'Pina Miel Unidad','60036',17.64,'2021-11-08 06:58:52'),(1543,'Limon Sin Semilla Kg','60037',14.50,'2021-11-08 06:58:52'),(1544,'Limon Agrio Kg','60038',17.64,'2021-11-08 06:58:52'),(1545,'Naranja Jugo Kg','60039',17.64,'2021-11-08 06:58:52'),(1546,'Naranja valencia Kg','60040',14.50,'2021-11-08 06:58:52'),(1547,'Papa Cambray Blanca Kg','60041',17.64,'2021-11-08 06:58:52'),(1548,'Papa Amarilla Kg','60042',14.50,'2021-11-08 06:58:52'),(1549,'Papa Blanca Alfa Kg','60043',17.64,'2021-11-08 06:58:52'),(1550,'Manzana Roja Kg','60044',17.64,'2021-11-08 06:58:52'),(1551,'Manzana Golden Importada Kg','60045',14.50,'2021-11-08 06:58:52'),(1552,'Manzana Red Delicious Kg','60046',17.64,'2021-11-08 06:58:52'),(1553,'Manzana Golden Nacional Kg','60047',14.50,'2021-11-08 06:58:52'),(1554,'Manzana Smith Kg','60048',17.64,'2021-11-08 06:58:52'),(1555,'Pimiento Amarillo Kg','60049',17.64,'2021-11-08 06:58:52'),(1556,'Zanahoria Kg','60050',14.50,'2021-11-08 06:58:52'),(1557,'Elote Blanco Unidad','60051',17.64,'2021-11-08 06:58:52'),(1558,'Lechuga Escarola Unidad','60052',14.50,'2021-11-08 06:58:52'),(1559,'Lechuga Sangria Unidad','60053',17.64,'2021-11-08 06:58:52'),(1560,'Lechuga Orejona Unidad','60054',17.64,'2021-11-08 06:58:52'),(1561,'Lechuga Italiana Unidad','60055',14.50,'2021-11-08 06:58:52'),(1562,'Lechuga Francesa Unidad','60056',17.64,'2021-11-08 06:58:52'),(1563,'Lechuga Romana Unidad','60057',14.50,'2021-11-08 06:58:52'),(1564,'Albahaca Manojo 150 gr','60058',17.64,'2021-11-08 06:58:52'),(1565,'Apio Unidad','60059',17.64,'2021-11-08 06:58:52'),(1566,'Brocoli Kg','60060',14.50,'2021-11-08 06:58:52'),(1567,'Chile Poblano 250 gr','60061',17.64,'2021-11-08 06:58:52'),(1568,'Chile Serrano 250 gr','60062',14.50,'2021-11-08 06:58:52'),(1569,'Coliflor Unidad','60063',17.64,'2021-11-08 06:58:52'),(1570,'Esparrago Kg','60064',17.64,'2021-11-08 06:58:52'),(1571,'Nopal Baby Kg','60065',14.50,'2021-11-08 06:58:52'),(1572,'Nopal Limpio Kg','60066',17.64,'2021-11-08 06:58:52'),(1573,'Pimiento Verde Kg','60067',14.50,'2021-11-08 06:58:52'),(1574,'Toronja Kg','60068',17.64,'2021-11-08 06:58:52'),(1575,'Chile Cuaresmeno 250 gr','60069',17.64,'2021-11-08 06:58:52'),(1576,'Pepino Kg','60070',14.50,'2021-11-08 06:58:52'),(1577,'Guayaba Kg','60071',17.64,'2021-11-08 06:58:52'),(1578,'Berenjena Kg','60072',14.50,'2021-11-08 06:58:52'),(1579,'Espinaca Manojo 250 gr','60073',17.64,'2021-11-08 06:58:52'),(1580,'Espinaca Baby Kg','60074',17.64,'2021-11-08 06:58:52'),(1581,'Champinon Blanco 500 gr','60075',14.50,'2021-11-08 06:58:52'),(1582,'Champinon Cremini 500 gr','60076',17.64,'2021-11-08 06:58:52'),(1583,'Perejil Manojo 250 gr','60077',14.50,'2021-11-08 06:58:52'),(1584,'Rabano Limpio 500 gr','60078',17.64,'2021-11-08 06:58:52'),(1585,'Rabano Manojo','60079',17.64,'2021-11-08 06:58:52'),(1586,'Chayote Kg','60080',14.50,'2021-11-08 06:58:52'),(1587,'Betabel Kg','60081',17.64,'2021-11-08 06:58:52'),(1588,'Jicama Unidad','60082',14.50,'2021-11-08 06:58:52'),(1589,'Chile de Arbol Fresco 250 gr','60083',17.64,'2021-11-08 06:58:52'),(1590,'Calabaza Bola Kg','60084',17.64,'2021-11-08 06:58:52'),(1591,'Calabaza Italiana Kg','60085',14.50,'2021-11-08 06:58:52'),(1592,'Verdolagas Kg','60086',17.64,'2021-11-08 06:58:52'),(1593,'Durazno Kg','60087',14.50,'2021-11-08 06:58:52'),(1594,'Mercadito Neta','60088',17.64,'2021-11-08 06:58:52'),(1595,'Ciruela Kg','60089',17.64,'2021-11-08 06:58:52'),(1596,'Ciruela pequena Kg','60090',14.50,'2021-11-08 06:58:52'),(1597,'Higo Kg','60091',17.64,'2021-11-08 06:58:52'),(1598,'Kiwi Kg','60092',14.50,'2021-11-08 06:58:52'),(1599,'Hierbabuena Manojo 250 gr','60093',17.64,'2021-11-08 06:58:52'),(1600,'Sandia Pequena Unidad','60094',17.64,'2021-11-08 06:58:52'),(1601,'Sandia Roja Unidad','60095',14.50,'2021-11-08 06:58:52'),(1602,'Zarzamora 170 gr','60096',17.64,'2021-11-08 06:58:52'),(1603,'Frambuesa 170 gr','60097',14.50,'2021-11-08 06:58:52'),(1604,'Blueberry 170 gr','60098',17.64,'2021-11-08 06:58:52'),(1605,'Acelga Manojo','60099',17.64,'2021-11-08 06:58:52'),(1606,'Pera Mantequilla Kg','60100',14.50,'2021-11-08 06:58:52'),(1607,'Chicharo Con Cascara Kg','60101',17.64,'2021-11-08 06:58:52'),(1608,'Mango Manila Kg','60102',14.50,'2021-11-08 06:58:52'),(1609,'Mango Ataulfo Kg','60103',17.64,'2021-11-08 06:58:52'),(1610,'Uva Roja Kg','60104',17.64,'2021-11-08 06:58:52'),(1611,'Uva Verde Kg','60105',14.50,'2021-11-08 06:58:52'),(1612,'Chile Guero 500 gr','60106',17.64,'2021-11-08 06:58:52'),(1613,'Flor de Calabaza Manojo 250 gr','60107',14.50,'2021-11-08 06:58:52'),(1614,'Ajo Criollo Malla 250 gr','60108',17.64,'2021-11-08 06:58:52'),(1615,'Pimiento Mixto Kg','60109',17.64,'2021-11-08 06:58:52'),(1616,'Menta Manojo 150 gr','60110',14.50,'2021-11-08 06:58:52'),(1617,'Pimiento Rojo Kg','60111',17.64,'2021-11-08 06:58:52'),(1618,'Melon Chino Unidad','60112',14.50,'2021-11-08 06:58:52'),(1619,'Arandano seco 500gr','60113',17.64,'2021-11-08 06:58:52'),(1620,'Tuna Verde Kg','60114',17.64,'2021-11-08 06:58:52'),(1621,'Ajo Criollo Malla 250 gr','60115',14.50,'2021-11-08 06:58:52'),(1622,'Panales KleenBebe Suavelastic Etapa 5 Jumbo 40 Unidades','70000',17.64,'2021-11-08 06:58:52'),(1623,'Papilla Gerber Verduras Con Pollo Etapa 2 Unidad','70001',14.50,'2021-11-08 06:58:52'),(1624,'Papilla Gerber Manzana Etapa 2 Unidad','70002',17.64,'2021-11-08 06:58:52'),(1625,'Papilla Gerber Frutas Mixtas Etapa 2 Unidad','70003',17.64,'2021-11-08 06:58:52'),(1626,'Toallitas Humedas para Bebe Chicolastic 120 Toallitas','70004',14.50,'2021-11-08 06:58:52'),(1627,'Nestle Nan 3 Optipro 720g Unidad','70005',17.64,'2021-11-08 06:58:52'),(1628,'Gel Antibacterial 1L','80000',14.50,'2021-11-08 06:58:52'),(1629,'Cubrebocas x 10 Unidades','80001',17.64,'2021-11-08 06:58:52'),(1630,'12 Lápices de Madera','90000',17.64,'2021-11-08 06:58:52'),(1631,'13 Plumas Azules','90002',14.50,'2021-11-08 06:58:52'),(1632,'13 Plumas negras','90003',17.64,'2021-11-08 06:58:52'),(1633,'Condones Prudence Clásicos 20 pzas','80002',14.50,'2021-11-08 06:58:52'),(1634,'Promocion 001','Promo-001',17.64,'2021-11-08 06:58:52'),(1635,'Papel higiénico Pétalo ultra jumbo 4 rollos con 351 hojas dobles c/u','10034',17.64,'2021-11-08 06:58:52'),(1636,'Cafe Soluble 50gr','20031',14.50,'2021-11-08 06:58:52'),(1637,'Ron Bacardí­ sabor frambuesa 750ml','50022',17.64,'2021-11-08 06:58:52'),(1638,'Limpiador Liquido Colibri 1L','59',14.50,'2021-11-08 06:58:52'),(1639,'Cerveza Victoria Six-pack','50020',2.00,'2021-11-08 06:58:52'),(1640,'Desodorante Aerosol Axe Body Spray Collision 96gr','10036',17.64,'2021-11-08 06:58:52'),(1641,'Frijol Negro Kg','30039',17.64,'2021-11-08 06:58:52'),(1642,'Papel higienico Pétalo 12 rollos con 234 hojas dobles c/u F2','10003F2',17.64,'2021-11-08 06:58:52'),(1643,'Jabon Zote en Barra Blanco 400 gr','25',17.64,'2021-11-08 06:58:52'),(1644,'Lavatrastes liquido Salvo limon 750 ml F2','22F2',14.50,'2021-11-08 06:58:52'),(1645,'azucar kg F2','30003F2',17.64,'2021-11-08 06:58:52'),(1646,'Suavizante De Telas Suavitel Cuidado Superior Fresca Primavera 3 L F2','11F2',14.50,'2021-11-08 06:58:52'),(1647,'Jitomate Saladet Kg F2','60024F2',17.64,'2021-11-08 06:58:52'),(1648,'Limon Agrio Kg F2','60038F2',17.64,'2021-11-08 06:58:52'),(1649,'Limpiador Multiusos Fabuloso Lavanda 2 Litros F2','23F2',14.50,'2021-11-08 06:58:52'),(1650,'Huevo Blanco 30 piezas F2','40002F2',17.64,'2021-11-08 06:58:52'),(1651,'Calabaza Italiana Kg F2','60085F2',14.50,'2021-11-08 06:58:52'),(1652,'Arroz kg F2','30005F2',17.64,'2021-11-08 06:58:52'),(1653,'Toallitas Humedas para Bebe Chicolastic 120 Toallitas F2','70004F2',17.64,'2021-11-08 06:58:52'),(1654,'Detergente Roma Bolsa Grande 1 Kg F2','15F2',14.50,'2021-11-08 06:58:52'),(1655,'Jabón de tocador Rosa Venus 100 gr F2','10013F2',17.64,'2021-11-08 06:58:52'),(1656,'Sal de Mesa 1kg F2','30001F2',14.50,'2021-11-08 06:58:52'),(1657,'Aceite Comestible 900 ml F2','30002F2',17.64,'2021-11-08 06:58:52'),(1658,'Papel higienico Pétalo 12 rollos con 234 hojas dobles c/u F1','10003F1',17.64,'2021-11-08 06:58:52'),(1659,'Leche condensada Nestlé La Lechera original 387 g','20032',14.50,'2021-11-08 06:58:52'),(1660,'Gelatina Limon D\'Gari 120g','20033',17.64,'2021-11-08 06:58:52'),(1661,'Gelatina Fresa D\'Gari 120g','20034',14.50,'2021-11-08 06:58:52'),(1662,'Sopa instantanea Maruchan Instant Lunch Sabor Carne De Res 64g','20035',17.64,'2021-11-08 06:58:52'),(1663,'Arroz SOS Grueso Super Extra 1 kg','30042',17.64,'2021-11-08 06:58:52'),(1664,'Electrolit Coco Suero 625 ml','80003',14.50,'2021-11-08 06:58:52'),(1665,'Electrolit Uva Suero 625ml','80004',17.64,'2021-11-08 06:58:52'),(1666,'Analgésico Aspirina 40 tabletas ácido acetilsalicílico 500mg','80005',14.50,'2021-11-08 06:58:52'),(1667,'Alcohol Etílico Zuum con Dosificador 2 pzas con 420 ml','80006',17.64,'2021-11-08 06:58:52'),(1668,'Ibuprofeno Medimart 400 mg 10 cápsulas en gel','80007',17.64,'2021-11-08 06:58:52'),(1669,'Bolitas de Algodón Absorbente Zuum Cotton 150 pzas','80008',14.50,'2021-11-08 06:58:52'),(1670,'Gel Antibacterial 500ml','80010',17.64,'2021-11-08 06:58:52'),(1671,'Gel Antibacterial 250ml','80011',14.50,'2021-11-08 06:58:52'),(1672,'Shampoo Savilé Hidratación Sábila Y Aguacate 750 Ml','10037',17.64,'2021-11-08 06:58:52');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_item`
--

DROP TABLE IF EXISTS `shopping_cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopping_cart_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(11) NOT NULL,
  `login_attempts_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_shopping_cart_item_product1_idx` (`product_id`),
  KEY `fk_shopping_cart_item_login_attempts1_idx` (`login_attempts_id`),
  CONSTRAINT `fk_shopping_cart_item_login_attempts1` FOREIGN KEY (`login_attempts_id`) REFERENCES `login_attempts` (`id`),
  CONSTRAINT `fk_shopping_cart_item_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_item`
--

LOCK TABLES `shopping_cart_item` WRITE;
/*!40000 ALTER TABLE `shopping_cart_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `shopping_cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(4) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test@mail.com','12345Admin',1,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'littlecommerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-08 21:25:05
