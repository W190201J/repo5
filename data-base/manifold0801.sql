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
  `avatar` varchar(64) DEFAULT 'image/dft1.jpg',
  `topic_desc` varchar(512) NOT NULL,
  `father_topic` bigint(64) NOT NULL,
  `popularity` bigint(64) DEFAULT '0',
  `create_time` date NOT NULL,
  `reserve1` int(11) DEFAULT NULL,
  `reserve2` int(11) DEFAULT NULL,
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `topic_table` */

insert  into `topic_table`(`topic_id`,`name`,`avatar`,`topic_desc`,`father_topic`,`popularity`,`create_time`,`reserve1`,`reserve2`) values (1,'根话题','image/dft1.jpg','是话题树的根节点，所有话题继承根话题',0,0,'2019-07-30',NULL,NULL),(2,'自然科学','image/topic-natureS.jpg','它是以定量作为手段，研究无机自然界和包括人的生物属性在内的有机自然界的各门科学的总称。',1,0,'2019-07-30',NULL,NULL),(3,'形式科学','image/topic-formalS.jpg','形式科学 是与形式系统，如逻辑学、数学、理论计算机科学、信息理论、系统理论、判定理论、统计学和一些语义学等有关的知识的分支。和其它科学不同，形式科学不是和基于真实世界观察理论有效性联系的。',1,0,'2019-07-30',NULL,NULL),(4,'人文社会科学','image/topic-hum&socScience.jpg','人文科学，是以人类的精神世界及其沉淀的精神文化为对象的科学。社会科学则是一种以人类社会为研究对象的科学。如果说人文科学主要研究人的观念、精神、情感和价值，即人的主观精神世界及其所积淀下来的精神文化的话，那么社会科学更多地则是研究客观的人类社会而外在于具体的个人及其主观世界。前者常用意义分析和解释学的方法研究微观领域的精神文化现象，其涵覆的科学包括文、史、哲及其衍生出来的美学、宗教学、伦理学、文化学、艺术学等。',1,0,'2019-07-30',NULL,NULL),(5,'生活','image/topic-life.jpg','广义上指人的各种活动，包括日常生活行为、学习、工作、休闲、社交、娱乐等。',1,0,'2019-07-30',NULL,NULL),(6,'逻辑学','image/topic-logic.jpg','逻辑学是研究思维的学科。所有思维都有内容和形式两个方面。思维内容是指思维所反映的对象及其属性；思维形式是指用以反映对象及其属性的不同方式，即表达思维内容的不同方式。从逻辑学角度看，抽象思维的三种基本形式是概念，命题和推理。',3,0,'2019-07-30',NULL,NULL),(7,'数学','image/topic-math.jpg','是研究数量、结构、变化、空间以及信息等概念的一门学科，从某种角度看属于形式科学的一种。',3,0,'2019-07-30',NULL,NULL),(8,'计算机科学','image/computerScience.jpg','计算机科学（英语：computer science，有时缩写为CS）是系统性研究信息与计算的理论基础以及它们在计算机系统中如何实现与应用的实用技术的学科。',3,0,'2019-07-30',NULL,NULL),(9,'计算理论','image/dft1.jpg','计算理论 【theory of computation】 用来研究计算的过程与功效的数学理论。',8,0,'2019-07-30',NULL,NULL),(10,'信息论','image/dft1.jpg','信息论是运用概率论与数理统计的方法研究信息、信息熵、通信系统、数据传输、密码学、数据压缩等问题的应用数学学科。',8,0,'2019-07-30',NULL,NULL),(11,'数据库和信息检索','image/topic-database.jpg','数据库是为了更容易地组织、存储和检索大量数据。数据库由数据库管理系统管理，通过数据库模型和查询语言来存储、创建、维护和搜索数据。',8,0,'2019-07-30',NULL,NULL),(12,'人工智能','image/topic-AI.jpg','这个计算机科学分支旨在创造可以解决计算问题，以及像动物和人类一样思考与交流的人造系统。',8,0,'2019-07-30',NULL,NULL),(13,'软件工程','image/dft1.jpg','软件工程是一门研究用工程化方法构建和维护有效的、实用的和高质量的计算机软件的学科。',8,0,'2019-07-30',NULL,NULL),(14,'计算机语言','image/topic-prog.jpg','计算机语言（Computer Language）指用于人与计算机之间通讯的语言。计算机语言是人与计算机之间传递信息的媒介。计算机系统最大特征是指令通过一种语言传达给机器。为了使电子计算机进行各种工作，就需要有一套用以编写计算机程序的数字、字符和语法规划，由这些字符和语法规则组成计算机各种指令（或各种语句）。这些就是计算机能接受的语言。',8,0,'2019-07-30',NULL,NULL),(15,'面向过程编程','image/dft1.jpg','面向过程(Procedure Oriented)是一种以过程为中心的编程思想。这些都是以什么正在发生为主要目标进行编程，',14,0,'2019-07-30',NULL,NULL),(16,'面向对象编程','image/dft1.jpg','面向对象(Object Oriented,OO)是软件开发方法。面向对象的概念和应用已超越了程序设计和软件开发，扩展到如数据库系统、交互式界面、应用结构、应用平台、分布式系统、网络管理结构、CAD技术、人工智能等领域。面向对象是一种对现实世界理解和抽象的方法，是计算机编程技术 [1]  发展到一定阶段后的产物。',14,0,'2019-07-30',NULL,NULL),(17,'Java','image/topic-java.jpg','Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编程',14,0,'2019-07-30',NULL,NULL),(18,'C++','image/topic-c++.jpg','C++是C语言的继承，它既可以进行C语言的过程化程序设计，又可以进行以抽象数据类型为特点的基于对象的程序设计，还可以进行以继承和多态为特点的面向对象的程序设计。',14,0,'2019-07-30',NULL,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `user_table` */

insert  into `user_table`(`uid`,`email`,`password`,`username`,`status`,`join_time`,`gender`,`phone`,`avatar`,`intro`,`industry`,`education`,`liked_count`,`follow_count`,`follower_count`,`scan_count`,`score`,`reserve1`,`reserve2`) values (1,'test@163.com','123456','测试账号',1,'2019-05-15',1,'15111111111','d:/temp/mayu.jpg','无','化工燃料','浙江大学',0,0,0,0,0,NULL,NULL),(16,'Grady330@163.com','123456','terry',1,'2019-07-30',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL),(17,'keming_xu@163.com','123456','胥珂铭',1,'2019-07-31',NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
