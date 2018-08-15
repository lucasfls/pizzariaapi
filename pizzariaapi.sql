-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.21 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.5.0.5284
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para pizzariaapi
CREATE DATABASE IF NOT EXISTS `pizzariaapi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pizzariaapi`;

-- Copiando estrutura para tabela pizzariaapi.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzariaapi.migrations: 5 rows
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2018_08_14_221125_create_pedidos_table', 1),
	(2, '2018_08_14_222254_create_sabor_table', 1),
	(3, '2018_08_14_222321_create_personalizacao_table', 1),
	(4, '2018_08_14_222438_create_pedidos_personalizacoes_table', 1),
	(5, '2018_08_14_222540_create_tamanho_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzariaapi.pedidos
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idTamanho` int(11) NOT NULL,
  `idSabor` int(11) NOT NULL,
  `valorTotal` double(5,2) NOT NULL DEFAULT '0.00',
  `tempoTotal` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedidos_idtamanho_foreign` (`idTamanho`),
  KEY `pedidos_idsabor_foreign` (`idSabor`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzariaapi.pedidos: 1 rows
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` (`id`, `idTamanho`, `idSabor`, `valorTotal`, `tempoTotal`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 0.00, 0, NULL, '2018-08-15 02:10:33', '2018-08-15 02:10:33');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzariaapi.pedidos_personalizacoes
CREATE TABLE IF NOT EXISTS `pedidos_personalizacoes` (
  `idPedido` int(11) NOT NULL,
  `idPersonalizacao` int(11) NOT NULL,
  KEY `pedidos_personalizacoes_idpedido_foreign` (`idPedido`),
  KEY `pedidos_personalizacoes_idpersonalizacao_foreign` (`idPersonalizacao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzariaapi.pedidos_personalizacoes: 0 rows
/*!40000 ALTER TABLE `pedidos_personalizacoes` DISABLE KEYS */;
INSERT INTO `pedidos_personalizacoes` (`idPedido`, `idPersonalizacao`) VALUES
	(1, 1),
	(1, 2),
	(1, 3);
/*!40000 ALTER TABLE `pedidos_personalizacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzariaapi.personalizacao
CREATE TABLE IF NOT EXISTS `personalizacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double(5,2) NOT NULL,
  `acrescimo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzariaapi.personalizacao: 3 rows
/*!40000 ALTER TABLE `personalizacao` DISABLE KEYS */;
INSERT INTO `personalizacao` (`id`, `descricao`, `valor`, `acrescimo`, `created_at`, `updated_at`) VALUES
	(1, 'Extra bacon', 3.00, 0, '2018-08-15 01:55:15', NULL),
	(2, 'Sem cebola', 0.00, 0, '2018-08-15 01:55:23', NULL),
	(3, 'Borda Recheada', 5.00, 5, '2018-08-15 01:55:35', NULL);
/*!40000 ALTER TABLE `personalizacao` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzariaapi.sabor
CREATE TABLE IF NOT EXISTS `sabor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `acrescimo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzariaapi.sabor: 3 rows
/*!40000 ALTER TABLE `sabor` DISABLE KEYS */;
INSERT INTO `sabor` (`id`, `descricao`, `acrescimo`, `created_at`, `updated_at`) VALUES
	(1, 'Calabresa', 0, '2018-08-15 01:55:44', NULL),
	(2, 'Marguerita', 0, '2018-08-15 01:55:59', NULL),
	(3, 'Portuguesa', 5, '2018-08-15 01:56:19', NULL);
/*!40000 ALTER TABLE `sabor` ENABLE KEYS */;

-- Copiando estrutura para tabela pizzariaapi.tamanho
CREATE TABLE IF NOT EXISTS `tamanho` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double(5,2) NOT NULL,
  `acrescimo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela pizzariaapi.tamanho: 3 rows
/*!40000 ALTER TABLE `tamanho` DISABLE KEYS */;
INSERT INTO `tamanho` (`id`, `descricao`, `valor`, `acrescimo`, `created_at`, `updated_at`) VALUES
	(1, 'Pequena', 20.00, 15, '2018-08-15 01:56:38', NULL),
	(2, 'Médio', 30.00, 20, '2018-08-15 01:56:48', NULL),
	(3, 'Grande', 40.00, 25, '2018-08-15 01:56:57', NULL);
/*!40000 ALTER TABLE `tamanho` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
