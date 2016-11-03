DROP TABLE IF EXISTS `ad_topic`;


CREATE TABLE `ad_topic` (
  `ad_id`      int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title`      varchar(225) NOT NULL DEFAULT '',
  `coverimage` varchar(255) NOT NULL DEFAULT '',
  `content`	   varchar(4000) NOT NULL DEFAULT '',
  `ad_uuid`    varchar(225) NOT NULL DEFAULT '',
  `create_time`   timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ad_id`),
  UNIQUE KEY `unique_ad_uuid` (`ad_uuid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `gymnasium_pics`;

CREATE TABLE `gymnasium_pics` 
(
	`gymnasium_pic_id`  int(11) unsigned NOT NULL AUTO_INCREMENT,
	`gymnasium_pic`     varchar(225) NOT NULL DEFAULT '',
	`pagename`			varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`gymnasium_pic_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `gymnasium_introduce`;

CREATE TABLE `gymnasium_introduce` 
(
	`gymnasium_id`      int(11) unsigned NOT NULL AUTO_INCREMENT,
	`gymnasium_descri`  varchar(1000) NOT NULL DEFAULT '',
	`pagename`			varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`gymnasium_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `cover_pics`;

CREATE TABLE `cover_pics` 
(
	`cover_id`   int(11) unsigned NOT NULL AUTO_INCREMENT,
	`cover_img`  varchar(225) NOT NULL DEFAULT '',
	`pagename`  varchar(225) NOT NULL DEFAULT '',
	`uuid`		 varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`cover_id`)	

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





DROP TABLE IF EXISTS `trainer_pics`;

CREATE TABLE `trainer_pics` (
	`trainer_pic_id`           int(11) unsigned NOT NULL AUTO_INCREMENT,
	`trainer_img`     	   varchar(225) NOT NULL DEFAULT '',
	`pagename`   		   varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`trainer_pic_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;





DROP TABLE IF EXISTS `trainer_theme`;

CREATE TABLE `trainer_theme` (
	`trainer_id`           int(11) unsigned NOT NULL AUTO_INCREMENT,
	`trainer_descri`	   varchar(1000) NOT NULL DEFAULT '',
	`pagename`   		   varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`trainer_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
	`course_id`       int(11) unsigned NOT NULL AUTO_INCREMENT,
	`mor_time`        varchar(225) NOT NULL DEFAULT '',
	`after_time`      varchar(225) NOT NULL DEFAULT '',
	`monday_mor`      varchar(225) NOT NULL DEFAULT '',
	`monday_after`    varchar(225) NOT NULL DEFAULT '',
	`tuesday_mor`     varchar(225) NOT NULL DEFAULT '',
	`tuesday_after`   varchar(225) NOT NULL DEFAULT '',
	`wednesday_mor`   varchar(225) NOT NULL DEFAULT '',
	`wednesday_after` varchar(225) NOT NULL DEFAULT '',
	`thursday_mor`    varchar(225) NOT NULL DEFAULT '',
	`thursday_after`  varchar(225) NOT NULL DEFAULT '',
	`friday_mor`      varchar(225) NOT NULL DEFAULT '',
	`friday_after`    varchar(225) NOT NULL DEFAULT '',
	`saturday_mor`    varchar(225) NOT NULL DEFAULT '',
	`saturday_after`  varchar(225) NOT NULL DEFAULT '',
	`sunday_mor`    varchar(225) NOT NULL DEFAULT '',
	`sunday_after`  varchar(225) NOT NULL DEFAULT '',
	`pagename`  	  varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`course_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `is_admin` int(11) DEFAULT '0' COMMENT '1管理员，0普通用户',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_username` (`username`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
LOCK TABLES `user` WRITE;

INSERT INTO `user` (`id`, `username`, `password`, `create_time`,`is_admin`)
VALUES
(1,'admin','2d39682dbb53e8b7df86581b0e48a5f8a4f2815617360c4d9607945b5cdde4c5','2016-02-19 19:08:00',1);

UNLOCK TABLES;







