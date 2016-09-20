DROP TABLE IF EXISTS `ad_topic`;

CREATE TABLE `ad_topic` (
  `ad_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL DEFAULT '',
  `cover_img_name` varchar(225) NOT NULL DEFAULT '',
  `cover_img_path` varchar(225) NOT NULL DEFAULT '',
  `ad_context`	   varchar(225) NOT NULL DEFAULT '',
  `ad_uuid`		   varchar(225) NOT NULL DEFAULT '',
  `create_time`    timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ad_id`),
  UNIQUE KEY `unique_ad_uuid` (`ad_uuid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



DROP TABLE IF EXISTS `detail_topic`;

CREATE TABLE `detail_topic` (
	`detail_topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
	`cover_img_name_1` varchar(225) NOT NULL DEFAULT '',
	`cover_img_name_2` varchar(225) NOT NULL DEFAULT '',
	`cover_img_name_3` varchar(225) NOT NULL DEFAULT '',
	`cover_img_name_4` varchar(225) NOT NULL DEFAULT '',
	`main_img_name`    varchar(225) NOT NULL DEFAULT '',

	PRIMARY KEY (`detail_topic_id`)
	

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


) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;