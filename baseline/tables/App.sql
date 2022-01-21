CREATE TABLE `App` (
  `AppID` int NOT NULL AUTO_INCREMENT,
  `AppUID` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UUID()',
  `AppText4` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AppText1` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AppText` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ApplyPath` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Received` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`AppID`),
  KEY `IX_App_UID` (`AppUID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
