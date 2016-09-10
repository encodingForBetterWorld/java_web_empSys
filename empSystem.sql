/*
SQLyog v10.2 
MySQL - 5.5.46 : Database - emp
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`emp` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `emp`;

/*Table structure for table `educate` */

DROP TABLE IF EXISTS `educate`;

CREATE TABLE `educate` (
  `edu_id` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `delFlag` bit(1) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `begintime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `datum` varchar(255) DEFAULT NULL,
  `teacher` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `effect` varchar(255) DEFAULT NULL,
  `summarize` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`edu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `educate` */

insert  into `educate`(`edu_id`,`version`,`delFlag`,`name`,`purpose`,`begintime`,`endtime`,`datum`,`teacher`,`createtime`,`effect`,`summarize`) values ('4028818356f05ef10156f05f7c1e0000',0,'\0','1223','','2016-09-09 00:00:00','2016-09-24 00:00:00','','','2016-09-03 22:06:44','',''),('4028818356f05ef10156f05fbbbf0001',0,'\0','222','','2016-09-01 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:01','',''),('4028818356f05ef10156f05fedab0002',0,'\0','11','','2016-09-01 00:00:00','2016-09-02 00:00:00','','','2016-09-03 22:07:13','',''),('4028818356f05ef10156f06010fe0003',0,'\0','0','','2016-09-01 00:00:00','2016-09-03 00:00:00','','','2016-09-03 22:07:22','',''),('4028818356f05ef10156f06054c70004',0,'\0','33','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:40','',''),('4028818356f05ef10156f060669c0005',0,'\0','335','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:44','',''),('4028818356f05ef10156f06075980006',0,'\0','3358','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:48','',''),('4028818356f05ef10156f06081b90007',0,'\0','33588','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:51','',''),('4028818356f05ef10156f0608dfc0008',0,'\0','335881','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:54','',''),('4028818356f05ef10156f0609b610009',0,'\0','3358813','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:07:58','',''),('4028818356f05ef10156f060e386000a',0,'\0','22222','','2016-09-04 00:00:00','2016-09-17 00:00:00','','','2016-09-03 22:08:16','',''),('4028818356f05ef10156f063aba5000b',0,'\0','we','','2016-09-05 00:00:00','2016-09-05 00:00:00','','','2016-09-03 22:11:19','','');

/*Table structure for table `enrollment` */

DROP TABLE IF EXISTS `enrollment`;

CREATE TABLE `enrollment` (
  `edu_id` varchar(255) NOT NULL,
  `job_id` varchar(255) NOT NULL,
  PRIMARY KEY (`job_id`,`edu_id`),
  KEY `FK_8y4nin6ruw1f2lyjio85wnsk5` (`edu_id`),
  CONSTRAINT `FK_7anfxp06ef4d92qvnvk45se22` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`),
  CONSTRAINT `FK_8y4nin6ruw1f2lyjio85wnsk5` FOREIGN KEY (`edu_id`) REFERENCES `educate` (`edu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `enrollment` */

/*Table structure for table `institution` */

DROP TABLE IF EXISTS `institution`;

CREATE TABLE `institution` (
  `ins_id` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `delFlag` bit(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `explains` varchar(255) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `typeFlag` tinyint(4) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ins_id`),
  KEY `FK_trldyjxcxilc94ccuydrhgc36` (`user_id`),
  CONSTRAINT `FK_trldyjxcxilc94ccuydrhgc36` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `institution` */

/*Table structure for table `job` */

DROP TABLE IF EXISTS `job`;

CREATE TABLE `job` (
  `job_id` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `delFlag` bit(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `jobtype` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `job` */

insert  into `job`(`job_id`,`version`,`delFlag`,`name`,`createtime`,`content`,`jobtype`) values ('4028800c543cb59f01543cb76ff40000',0,'\0','董事长','2016-04-22 14:45:35','123',3);

/*Table structure for table `stipend` */

DROP TABLE IF EXISTS `stipend`;

CREATE TABLE `stipend` (
  `st_id` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `delFlag` bit(1) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `basic` float DEFAULT NULL,
  `eat` float DEFAULT NULL,
  `house` float DEFAULT NULL,
  `duty` float DEFAULT NULL,
  `scot` float DEFAULT NULL,
  `other` float DEFAULT NULL,
  `granttime` datetime DEFAULT NULL,
  `totalize` float DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`st_id`),
  KEY `FK_5h0p19lsdpe5ijetk26k9yxie` (`user_id`),
  CONSTRAINT `FK_5h0p19lsdpe5ijetk26k9yxie` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `stipend` */

insert  into `stipend`(`st_id`,`version`,`delFlag`,`name`,`basic`,`eat`,`house`,`duty`,`scot`,`other`,`granttime`,`totalize`,`user_id`) values ('4028818356bc15bf0156bc179fae0000',0,'\0','123',1000,0,0,0,0,0,'2016-08-11 00:00:00',1000,'402881025475d81f015475db1e020000'),('4028818356bc15bf0156bc2e24900001',0,'\0','123',1000,0,0,0,0,0,'2016-08-11 00:00:00',1000,'402881025475d81f015475db1e020000'),('4028818356bc15bf0156bc2f4a3c0002',0,'\0','123',1000,0,0,0,0,0,'2016-08-11 00:00:00',1000,'402881025475d81f015475db1e020000'),('4028818356bc15bf0156bc2fab6a0003',0,'','123',4000,50,0,0,0,0,'2016-08-11 00:00:00',1000,'402881025475d81f015475db1e020000'),('4028818356bc15bf0156bc30a2b20004',0,'\0','123',4000,50,0,0,0,0,'2016-08-11 00:00:00',1000,'402881025475d81f015475db1e020000');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `delFlag` bit(1) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `worktype` tinyint(4) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `logintime` datetime DEFAULT NULL,
  `logouttime` datetime DEFAULT NULL,
  `isadmin` tinyint(4) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `jobname` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `job_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_j06lsgy6sadanagxyyqvor11` (`job_id`),
  CONSTRAINT `FK_j06lsgy6sadanagxyyqvor11` FOREIGN KEY (`job_id`) REFERENCES `job` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`version`,`delFlag`,`username`,`password`,`sex`,`realname`,`worktype`,`birthday`,`createtime`,`logintime`,`logouttime`,`isadmin`,`content`,`jobname`,`photo`,`job_id`) values ('402881025475d81f015475db1e020000',0,'\0','123','123',0,NULL,1,'2016-05-01 00:00:00','2016-05-03 17:02:54','2016-05-04 16:58:01','2016-05-04 16:58:02',0,'大boss','董事长','b69d3e53-9316-41c5-9516-024727f4641a.jpg','4028800c543cb59f01543cb76ff40000'),('4028818356dbec7a0156dbed66e40000',0,'\0','123123','123',0,NULL,1,'2016-08-18 00:00:00','2016-08-30 22:49:43',NULL,NULL,0,'123','董事长','d6727892-9872-44f0-9e0e-d8a84fd62f96.png','4028800c543cb59f01543cb76ff40000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
