/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.6.23-log : Database - kannadagotilla
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`kannadagotilla` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kannadagotilla`;

/*Table structure for table `chatgroup` */

DROP TABLE IF EXISTS `chatgroup`;

CREATE TABLE `chatgroup` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(30) DEFAULT NULL,
  `g_mentor1` int(11) NOT NULL DEFAULT '0',
  `g_mentor2` int(11) NOT NULL DEFAULT '0',
  `g_mcount` int(11) NOT NULL DEFAULT '0',
  `g_created` datetime NOT NULL,
  `g_created_by` int(11) NOT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `chatgroup` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_body` varchar(1000) DEFAULT NULL,
  `m_from_id` int(11) DEFAULT '0',
  `m_to_id` int(11) DEFAULT '0',
  `m_group_id` int(11) DEFAULT '0',
  `m_created` datetime NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `message` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_mail` varchar(30) NOT NULL,
  `u_pass` varchar(30) NOT NULL,
  `u_name` varchar(30) DEFAULT NULL,
  `u_contact` varchar(15) DEFAULT NULL,
  `u_prof` varchar(30) DEFAULT NULL,
  `u_gid` int(11) DEFAULT '0',
  `u_role` tinyint(4) DEFAULT '0' COMMENT '1=admin 2=mentor 3=user',
  `u_stat` tinyint(5) DEFAULT '0' COMMENT '1=Requested 2=Not Allocated 3=Allocated 4=Account Deleted',
  `u_created` datetime DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (1,'admin1@abc','admin','Admin One','123','abc',0,1,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (2,'admin2@abc.com','admin','Admin Two','234','abc',0,1,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (3,'admin3@abc.com','admin','Admin Three','345','abc',0,1,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (4,'admin4@abc.com','admin','Admin Four','456','abc',0,1,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (5,'mentor1@abc.com','mentor','Mentor One','1234','qwe',0,2,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (6,'mentor2@abc.com','mentor','Mentor Two','2345','qwe',0,2,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (7,'mentor3@abc.com','mentor','Mentor Three','3456','qwe',0,2,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (8,'mentor4@abc.com','mentor','Mentor Four','4567','qwe',0,2,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (9,'mentor5@abc.com','mentor','Mentor Five','5678','qwe',0,2,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (10,'mentor6@abc.com','mentor','Mentor Six','6789','qwe',0,2,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (11,'user1@abc.com','user','User One','111','zxc',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (12,'user2@abc.com','user','User Two','222','wer',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (13,'user3@abc.com','user','User Three','333','rty',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (14,'user4@abc.vom','user','User Four','444','qet',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (15,'user5@abc.com','user','User Five','555','uio',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (16,'user6@abc.com','user','User Six','666','poi',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (17,'user7@abc.com','user','User Seven','777','ijn',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (18,'user8@abc.com','user','User Eight','888','yui',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (19,'user9@abc.com','user','User Nine','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (20,'user10@abc.com','user','User Ten','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (21,'user11@abc.com','user','User Eleven','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (22,'user12@abc.com','user','User 12','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (23,'user13@abc.com','user','User 13','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (24,'user14@abc.com','user','User 14','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (25,'user15@abc.com','user','User 15','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (26,'user16@abc.com','user','User 16','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (27,'user17@abc.com','user','User 17','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (28,'user18@abc.com','user','User 18','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (29,'user19@abc.com','user','User 19','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (30,'user20@abc.com','user','User 20','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (31,'user21@abc.com','user','User 21','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (32,'user22@abc.com','user','User 22','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (33,'user23@abc.com','user','User 23','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (34,'user24@abc.com','user','User 24','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (35,'user25@abc.com','user','User 25','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (36,'user26@abc.com','user','User 26','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (37,'user27@abc.com','user','User 27','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (38,'user28@abc.com','user','User 28','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (39,'user29@abc.com','user','User 29','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (40,'user30@abc.com','user','User 30','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (41,'user31@abc.com','user','User 31','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (42,'user32@abc.com','user','User 32','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (43,'user33@abc.com','user','User 33','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (44,'user34@abc.com','user','User 34','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (45,'user35@abc.com','user','User 35','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (46,'user36@abc.com','user','User 36','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (47,'user37@abc.com','user','User 37','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (48,'user38@abc.com','user','User 38','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (49,'user39@abc.com','user','User 39','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (50,'user40@abc.com','user','User 40','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (51,'user31@abc.com','user','User 31','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (52,'user32@abc.com','user','User 32','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (53,'user33@abc.com','user','User 33','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (54,'user34@abc.com','user','User 34','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (55,'user35@abc.com','user','User 35','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (56,'user36@abc.com','user','User 36','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (57,'user37@abc.com','user','User 37','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (58,'user38@abc.com','user','User 38','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (59,'user39@abc.com','user','User 39','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (60,'user40@abc.com','user','User 40','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (61,'user40@abc.com','user','User 40','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (62,'user41@abc.com','user','User 41','9876543210','aaa',0,3,0,'2016-03-07 14:08:41');
insert  into `user`(`u_id`,`u_mail`,`u_pass`,`u_name`,`u_contact`,`u_prof`,`u_gid`,`u_role`,`u_stat`,`u_created`) values (63,'user41@abc.com','user','User 41','9876543210','aaa',0,3,0,'2016-03-07 14:13:59');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
