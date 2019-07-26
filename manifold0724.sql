/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.17 : Database - manifold_community
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`manifold_community` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `manifold_community`;

/*Table structure for table `answer_table` */

DROP TABLE IF EXISTS `answer_table`;

CREATE TABLE `answer_table` (
  `answer_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `question_id` bigint(64) NOT NULL,
  `content` text NOT NULL,
  `uid` bigint(64) NOT NULL,
  `agree` bigint(64) NOT NULL DEFAULT '0',
  `disagree` bigint(64) NOT NULL DEFAULT '0',
  `read_times` bigint(64) DEFAULT '0',
  `reserve1` int(11) DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `uid` (`uid`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `answer_table_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_table` (`uid`),
  CONSTRAINT `answer_table_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question_table` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `answer_table` */

/*Table structure for table `collection_question_rela_table` */

DROP TABLE IF EXISTS `collection_question_rela_table`;

CREATE TABLE `collection_question_rela_table` (
  `collection_id` bigint(64) NOT NULL,
  `question_id` bigint(64) NOT NULL,
  KEY `collection_id` (`collection_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `collection_question_rela_table_ibfk_1` FOREIGN KEY (`collection_id`) REFERENCES `collection_table` (`collection_id`),
  CONSTRAINT `collection_question_rela_table_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question_table` (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collection_question_rela_table` */

/*Table structure for table `collection_table` */

DROP TABLE IF EXISTS `collection_table`;

CREATE TABLE `collection_table` (
  `collection_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `collection_name` varchar(64) NOT NULL,
  `create_time` date NOT NULL,
  `update_time` date NOT NULL,
  `uid` bigint(64) NOT NULL,
  `reserve1` int(11) DEFAULT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `collection_table_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_table` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `collection_table` */

/*Table structure for table `comment_table` */

DROP TABLE IF EXISTS `comment_table`;

CREATE TABLE `comment_table` (
  `comm_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `answer_id` bigint(64) NOT NULL,
  `uid` bigint(64) NOT NULL,
  `reply_to_uid` bigint(64) NOT NULL,
  `content` text NOT NULL,
  `agree` bigint(64) NOT NULL DEFAULT '0',
  `reserve1` int(11) DEFAULT NULL,
  PRIMARY KEY (`comm_id`),
  KEY `answer_id` (`answer_id`),
  CONSTRAINT `comment_table_ibfk_1` FOREIGN KEY (`answer_id`) REFERENCES `answer_table` (`answer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment_table` */

/*Table structure for table `follow_rela_table` */

DROP TABLE IF EXISTS `follow_rela_table`;

CREATE TABLE `follow_rela_table` (
  `followed` bigint(64) NOT NULL,
  `follower` bigint(64) NOT NULL,
  KEY `followed` (`followed`),
  KEY `follower` (`follower`),
  CONSTRAINT `follow_rela_table_ibfk_1` FOREIGN KEY (`followed`) REFERENCES `user_table` (`uid`),
  CONSTRAINT `follow_rela_table_ibfk_2` FOREIGN KEY (`follower`) REFERENCES `user_table` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `follow_rela_table` */

/*Table structure for table `message_table` */

DROP TABLE IF EXISTS `message_table`;

CREATE TABLE `message_table` (
  `message_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL,
  `uid` bigint(64) NOT NULL,
  `from_uid` bigint(64) DEFAULT NULL,
  `question_id` bigint(64) DEFAULT NULL,
  `answer_id` bigint(64) DEFAULT NULL,
  `comment_id` bigint(64) DEFAULT NULL,
  `reserve1` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message_table` */

/*Table structure for table `question_table` */

DROP TABLE IF EXISTS `question_table`;

CREATE TABLE `question_table` (
  `question_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `question_desc` text NOT NULL,
  `uid` bigint(64) NOT NULL,
  `popularity` bigint(64) NOT NULL DEFAULT '0',
  `create_time` date NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `reserve1` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `question_table_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user_table` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `question_table` */

/*Table structure for table `topic_question_rela_table` */

DROP TABLE IF EXISTS `topic_question_rela_table`;

CREATE TABLE `topic_question_rela_table` (
  `topic_id` bigint(64) NOT NULL,
  `question_id` bigint(64) NOT NULL,
  KEY `topic_id` (`topic_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `topic_question_rela_table_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic_table` (`topic_id`),
  CONSTRAINT `topic_question_rela_table_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `user_table` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `topic_question_rela_table` */

/*Table structure for table `topic_table` */

DROP TABLE IF EXISTS `topic_table`;

CREATE TABLE `topic_table` (
  `topic_id` bigint(64) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `topic_desc` text NOT NULL,
  `father_topic` bigint(64) NOT NULL,
  `popularity` bigint(64) NOT NULL DEFAULT '0',
  `create_time` date NOT NULL,
  `reserve1` int(11) DEFAULT NULL,
  `reserve2` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `topic_table` */

/*Table structure for table `topic_user_rela_table` */

DROP TABLE IF EXISTS `topic_user_rela_table`;

CREATE TABLE `topic_user_rela_table` (
  `topic_id` bigint(64) NOT NULL,
  `uid` bigint(64) NOT NULL,
  KEY `topic_id` (`topic_id`),
  KEY `uid` (`uid`),
  CONSTRAINT `topic_user_rela_table_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topic_table` (`topic_id`),
  CONSTRAINT `topic_user_rela_table_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `user_table` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `topic_user_rela_table` */

/*Table structure for table `user_table` */

DROP TABLE IF EXISTS `user_table`;

CREATE TABLE `user_table` (
  `uid` bigint(64) NOT NULL AUTO_INCREMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '1',
  `join_time` date NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone` char(11) DEFAULT NULL,
  `avatar` varchar(64) DEFAULT NULL,
  `intro` varchar(256) DEFAULT NULL,
  `industry` varchar(32) DEFAULT NULL,
  `education` text,
  `liked_count` bigint(64) DEFAULT '0',
  `follow_count` bigint(64) DEFAULT '0',
  `follower_count` bigint(64) DEFAULT '0',
  `scan_count` bigint(64) DEFAULT '0',
  `score` int(32) DEFAULT '0',
  `reserve1` int(11) DEFAULT NULL,
  `reserve2` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user_table` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
