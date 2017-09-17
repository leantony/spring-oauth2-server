-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.19-0ubuntu0.17.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table oauth.oauth_approvals
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE IF NOT EXISTS `oauth_approvals` (
  `userId` varchar(255) NOT NULL,
  `clientId` varchar(255) NOT NULL,
  `scope` varchar(255) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `expiresAt` timestamp NULL DEFAULT NULL,
  `lastModifiedAt` timestamp NULL DEFAULT NULL,
  KEY `user_id` (`userId`),
  KEY `client_id` (`clientId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table oauth.oauth_approvals: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_approvals` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_approvals` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
