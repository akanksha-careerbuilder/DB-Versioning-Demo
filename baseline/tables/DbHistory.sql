CREATE TABLE `DbHistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(45) NOT NULL,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
