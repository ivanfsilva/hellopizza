-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.32-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema bdhellopizza
--

CREATE DATABASE IF NOT EXISTS bdhellopizza;
USE bdhellopizza;

--
-- Definition of table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `idcliente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `CPF_CNPJ` varchar(20) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Celular` varchar(20) DEFAULT NULL,
  `DataCadastro` date DEFAULT NULL,
  `Endereco` varchar(100) DEFAULT NULL,
  `Numero` varchar(10) DEFAULT NULL,
  `CEP` varchar(10) DEFAULT NULL,
  `Bairro` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cliente`
--

/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`idcliente`,`Nome`,`CPF_CNPJ`,`Telefone`,`Celular`,`DataCadastro`,`Endereco`,`Numero`,`CEP`,`Bairro`) VALUES 
 (1,'Wesley Yamazack','732.123.653-65','3131-3131',NULL,'2018-01-20','Estrada Japoré','85','21452-025','Vila Valqueire'),
 (2,'Kelvin Pereira Dias','786.123.522-54',NULL,'98001-0101','2018-01-02','Rua C','10','21456-698','Vila Valqueire'),
 (3,'Pablo Dias Matheus','554.123.461-44','2156-9874','98754-6352','2018-01-14','Rua A','57','21456-987','Vila Valqueire'),
 (4,'Estevão Dias Cardoso','145.123.145-54',NULL,NULL,'2018-01-01','Rua J','56','21474-652','Vila Valqueire'),
 (5,'Ana Clara Ferraz','125.635.968-87','98569-9621','3131-3131','2018-01-31','Estrada Japoré','85','21452-025','Vila Valqueire'),
 (6,'Viviane Pereira','159.685.698-79',NULL,'98566-7744','2018-01-05','Estrada Intendente Magalhães','784','21453-985','Vila Valqueire'),
 (7,'Carla Pereira','456.321.987-41',NULL,NULL,'2018-01-20','Rua R','10','21458-520','Praça Seca'),
 (8,'Hugo Carvalho','145.362.582-87','3244-9632',NULL,'2017-12-20','Rua B','47','21478-885','Praça Seca'),
 (9,'Ana Carolina','145.218.987-47',NULL,NULL,'2017-12-28','Rua S','266','21414-302','Praça Seca'),
 (10,'Ana Beatriz','178.302.026-97',NULL,NULL,'2017-12-30','Rua Piraquara','58','21215-741','Sulacap'),
 (11,'Daniella da Costa','147.658.963-54','3258-9852',NULL,'2018-02-27','Rua João X','148','21030-033','Sulacap');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;


--
-- Definition of table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
CREATE TABLE `funcionario` (
  `idfuncionario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Ativo` varchar(1) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idfuncionario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `funcionario`
--

/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`idfuncionario`,`Nome`,`Ativo`,`login`,`senha`) VALUES 
 (1,'Ana','S',NULL,NULL),
 (2,'Carlos','N',NULL,NULL),
 (3,'Beatriz','S',NULL,NULL);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;


--
-- Definition of table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
CREATE TABLE `pedido` (
  `idPedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idcliente` int(10) unsigned NOT NULL,
  `idfuncionario` int(10) unsigned NOT NULL,
  `DataPedido` date DEFAULT NULL,
  `HoraPedido` time DEFAULT NULL,
  `Observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idPedido`),
  KEY `FK_pedido_1` (`idfuncionario`),
  KEY `FK_pedido_2` (`idcliente`),
  CONSTRAINT `FK_pedido_1` FOREIGN KEY (`idfuncionario`) REFERENCES `funcionario` (`idfuncionario`),
  CONSTRAINT `FK_pedido_2` FOREIGN KEY (`idcliente`) REFERENCES `cliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedido`
--

/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`idPedido`,`idcliente`,`idfuncionario`,`DataPedido`,`HoraPedido`,`Observacao`) VALUES 
 (1,1,2,'2018-01-25','19:35:00','sem azeitona'),
 (2,1,1,'2018-01-20','17:00:00','chamar na casa ao lado'),
 (3,2,1,'2018-01-25','20:35:00','sem cebola e azeitooa'),
 (4,3,2,'2018-02-05','20:30:00','sem azeitona'),
 (5,4,1,'2018-02-05','20:34:00','sem cebola e azeitooa'),
 (6,5,2,'2018-02-05','20:36:00','sem cebola e azeitooa'),
 (7,6,1,'2018-02-05','20:45:00','sem azeitona'),
 (8,5,2,'2018-02-05','20:50:00','entregar para o porteiro'),
 (9,4,1,'2018-02-06','17:40:00','sem azeitona'),
 (10,8,2,'2018-02-06','17:50:00',NULL),
 (11,1,1,'2018-02-06','18:30:00',NULL),
 (12,7,1,'2018-02-06','18:40:00','sem azeitona'),
 (13,9,1,'2018-02-07','20:10:00',NULL),
 (14,2,2,'2018-02-07','20:19:00','sem azeitona'),
 (15,1,2,'2018-02-07','20:47:00',NULL);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;


--
-- Definition of table `pedidodetalhe`
--

DROP TABLE IF EXISTS `pedidodetalhe`;
CREATE TABLE `pedidodetalhe` (
  `idpedidodetalhe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idProduto` int(10) unsigned NOT NULL,
  `idPedido` int(10) unsigned NOT NULL,
  `Quantidade` int(11) DEFAULT NULL,
  `ValorUnitario` float DEFAULT NULL,
  PRIMARY KEY (`idpedidodetalhe`) USING BTREE,
  KEY `VendaItem_FKIndex1` (`idPedido`),
  KEY `VendaItem_FKIndex2` (`idProduto`),
  CONSTRAINT `FK_pedidodetalhe_1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidodetalhe`
--

/*!40000 ALTER TABLE `pedidodetalhe` DISABLE KEYS */;
INSERT INTO `pedidodetalhe` (`idpedidodetalhe`,`idProduto`,`idPedido`,`Quantidade`,`ValorUnitario`) VALUES 
 (1,1,3,1,NULL),
 (2,2,1,1,NULL),
 (3,1,2,1,NULL),
 (4,3,2,1,NULL),
 (5,3,2,1,NULL),
 (6,1,3,1,NULL),
 (7,1,1,1,NULL);
/*!40000 ALTER TABLE `pedidodetalhe` ENABLE KEYS */;


--
-- Definition of table `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE `produto` (
  `idProduto` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) DEFAULT NULL,
  `Valor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produto`
--

/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`idProduto`,`Descricao`,`Valor`) VALUES 
 (1,'Pizza Calabresa',28),
 (2,'Pizza Portuguesa',30),
 (3,'Pizza Mussarela',27),
 (4,'Pizza de frango',30),
 (5,'Pizza de Calabresa Acebolada',29),
 (6,'Pizza de Camarão',56);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
