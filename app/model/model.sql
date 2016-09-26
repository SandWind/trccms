DROP TABLE IF EXISTS `ad_topic`;

CREATE TABLE `ad_topic` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL DEFAULT '',
  `cover_img_name` varchar(225) NOT NULL DEFAULT '',
  `cover_img_path` varchar(225) NOT NULL DEFAULT '',
  `ad_context`	   varchar(225) NOT NULL DEFAULT '',
  `ad_uuid`		   varchar(225) NOT NULL DEFAULT '',
  `create_time`    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time`	   timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ad_id`),
  UNIQUE KEY `unique_ad_uuid` (`ad_uuid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `stadium_theme`;

CREATE TABLE `stadium_theme` 
(
	`stadium_id`   int(11) unsigned NOT NULL AUTO_INCREMENT,
	`tadium_img_name_1`  varchar(225) NOT NULL DEFAULT '',
	`tadium_img_name_2`  varchar(225) NOT NULL DEFAULT '',
	`tadium_img_name_3`  varchar(225) NOT NULL DEFAULT '',
	`tadium_img_name_4`  varchar(225) NOT NULL DEFAULT '',
	`main_img_name`      varchar(225) NOT NULL DEFAULT '',
	`img_path`           varchar(225) NOT NULL DEFAULT '',
	`introduction`	     varchar(1000) NOT NULL DEFAULT '',
	`pag_name`		     varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`stadium_id`)
	UNIQUE KEY `unique_pag_name` (`pag_name`)
	

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `detail_cover`;

CREATE TABLE `detail_cover` 
(
	`detail_cover_id`   int(11) unsigned NOT NULL AUTO_INCREMENT,
	`cover_img_name_1`  varchar(225) NOT NULL DEFAULT '',
	`cover_img_name_2`  varchar(225) NOT NULL DEFAULT '',
	`cover_img_name_3`  varchar(225) NOT NULL DEFAULT '',
	`cover_img_name_4`  varchar(225) NOT NULL DEFAULT '',
	`main_img_name`     varchar(225) NOT NULL DEFAULT '',
	`img_path`          varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`detail_cover_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `stadium_theme`;




DROP TABLE IF EXISTS `trainer_theme`;

CREATE TABLE `trainer_theme` (
	`trainer_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`trainer_img_name_1`     varchar(225) NOT NULL DEFAULT '',
	`trainer_img_name_2`     varchar(225) NOT NULL DEFAULT '',
	`trainer_img_name_3`     varchar(225) NOT NULL DEFAULT '',
	`trainer_img_name_4`     varchar(225) NOT NULL DEFAULT '',
	`trainer_introduction`   varchar(1000) NOT NULL DEFAULT '',
	PRIMARY KEY (`trainer_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
	`course_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`monday`    varchar(225) NOT NULL DEFAULT '',
	`tuesday`   varchar(225) NOT NULL DEFAULT '',
	`wednesday` varchar(225) NOT NULL DEFAULT '',
	`thursday`  varchar(225) NOT NULL DEFAULT '',
	`friday`    varchar(225) NOT NULL DEFAULT '',
	`saturday`  varchar(225) NOT NULL DEFAULT '',
	`begintime` varchar(225) NOT NULL DEFAULT '',
	`endtime`   varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`course_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




DROP TABLE IF EXISTS `detail_topic`;

CREATE TABLE detail_topic (
	`detail_topic_id`  int(11) unsigned NOT NULL AUTO_INCREMENT,
	`detail_cover_id`  int(11) unsigned NOT NULL,
	`stadium_id`	   int(11) unsigned NOT NULL,
	`trainer_id`       int(11) unsigned NOT NULL,
	`course_id`	       int(11) unsigned NOT NULL,
    `pag_name`		   varchar(225) NOT NULL DEFAULT '',
	PRIMARY KEY (`detail_topic_id`),
	UNIQUE KEY `unique_pag_name` (`pag_name`),
	KEY `index_detail_cover_id` (`detail_cover_id`),
	KEY `index_stadium_id` (`stadium_id`),
	KEY `index_trainer_id` (`trainer_id`),
	KEY `index_course_id` (`course_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;








