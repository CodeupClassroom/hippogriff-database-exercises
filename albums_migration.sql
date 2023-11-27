use docrob;

DROP TABLE IF EXISTS albums;

CREATE TABLE `albums` (
 `id` int unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
 `artist` varchar(256) NOT NULL,
 `name` varchar(256) NOT NULL,
 `release_date` smallint NOT NULL,
 `sales` decimal(4,1) NOT NULL,
 `genre` varchar(1000) NOT NULL
);