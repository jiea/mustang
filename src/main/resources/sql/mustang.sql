/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.5.32 : Database - mustang
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mustang` /*!40100 DEFAULT CHARACTER SET utf8 */;

/*Table structure for table `t_emp` */

DROP TABLE IF EXISTS `t_emp`;

CREATE TABLE `t_emp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `emp_name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `gender` char(1) DEFAULT '1' COMMENT '性别(1:男, 2:女)',
  `emp_no` varchar(20) DEFAULT NULL COMMENT '员工编号',
  `email` varchar(30) DEFAULT NULL COMMENT '登录名(邮箱)',
  `password` varchar(40) DEFAULT NULL COMMENT '登录密码',
  `mobile` varchar(11) DEFAULT NULL COMMENT '移动电话',
  `tel` varchar(13) DEFAULT NULL COMMENT '固定电话',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门',
  `is_available` char(1) DEFAULT NULL COMMENT '账号使用状态(0:禁用, 1:启用)',
  `salt` varchar(32) DEFAULT NULL COMMENT '盐值',
  `memo` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(11) unsigned NOT NULL COMMENT '创建人',
  `operate_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operator` int(11) unsigned DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `un_employee_no` (`emp_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='后台用户管理';

/*Data for the table `t_emp` */

insert  into `t_emp`(`id`,`emp_name`,`gender`,`emp_no`,`email`,`password`,`mobile`,`tel`,`dept_id`,`is_available`,`salt`,`memo`,`create_time`,`creator`,`operate_time`,`operator`) values (1,'admin','1','0001','admin@163.com','7c4a8d09ca3762af61e59520943dc26494f8941b','15001062615',NULL,NULL,'1',NULL,NULL,'2016-10-10 22:45:52',1,'2016-10-09 17:54:26',1),(2,'你好','1','10000','ladmin616@163.com','7c4a8d09ca3762af61e59520943dc26494f8941b','15001062615','',NULL,'1',NULL,'ss','2016-10-27 17:02:37',1,NULL,NULL),(12,'电话','1','100965','sdf@12.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'sf','2016-10-27 18:30:31',1,NULL,NULL),(13,'张总','1','122222','ladmin6162ee@s.com','7c4a8d09ca3762af61e59520943dc26494f8941b','15001062654','',NULL,'0',NULL,'sdfsdf','2016-10-28 14:36:14',1,NULL,NULL),(14,'张总','1','1500100','sdfsd@12.com','7c4a8d09ca3762af61e59520943dc26494f8941b','15101026547','',NULL,'1',NULL,'sfsfsf','2016-10-28 14:38:33',1,NULL,NULL),(15,'sf','1','165151','sf@12.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 14:39:32',1,NULL,NULL),(17,'asdfa','1','11566','ss@qe.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 14:41:07',1,NULL,NULL),(18,'sdfs','1','215884','323@fsf.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 14:43:20',1,NULL,NULL),(19,'nsdf','1','5151','sfsdf@12.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 14:47:31',1,NULL,NULL),(20,'fsdf','1','1','23@121.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 14:49:03',1,NULL,NULL),(21,'你还敢说','1','4551616','121@12.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 15:34:05',1,NULL,NULL),(29,'dd','1','45452','qwq@dfe.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 15:36:59',1,NULL,NULL),(41,'fafadsf','1','51652','232@sdf.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 15:48:39',1,NULL,NULL),(45,'sdfsd','1','10055','sdfs@121.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 15:59:33',1,NULL,NULL),(47,'fsd','1','415151','sd@ew.com','7c4a8d09ca3762af61e59520943dc26494f8941b','','',NULL,'1',NULL,'','2016-10-28 16:01:10',1,NULL,NULL),(48,'张总是','2','12312','ladmin212@163.com','7c4a8d09ca3762af61e59520943dc26494f8941b','15001065874','896541223a',NULL,'1',NULL,'sdfsdfdfsdfs','2016-11-03 17:20:09',1,'2016-11-03 17:20:09',1),(49,'子裕','1','150010561','fdsfsddd@163.com','7c4a8d09ca3762af61e59520943dc26494f8941b','15001062541','545411',NULL,'1',NULL,'sdfsdf','2016-11-03 17:20:25',1,'2016-11-03 17:20:25',1),(50,'李子玉','2','150122','15001@16.com','7c4a8d09ca3762af61e59520943dc26494f8941b','1501415615','1515888',NULL,'0',NULL,'sdfsdfsdf','2016-11-04 14:24:26',1,'2016-11-04 14:24:26',1);

/*Table structure for table `t_emp_role` */

DROP TABLE IF EXISTS `t_emp_role`;

CREATE TABLE `t_emp_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `emp_id` int(11) NOT NULL COMMENT '员工ID',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(11) unsigned NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_emp_role` */

insert  into `t_emp_role`(`id`,`role_id`,`emp_id`,`create_time`,`creator`) values (1,1,1,'2016-10-11 17:50:03',1);

/*Table structure for table `t_login_log` */

DROP TABLE IF EXISTS `t_login_log`;

CREATE TABLE `t_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `emp_id` int(11) NOT NULL COMMENT '员工主键',
  `login_ip` varchar(20) DEFAULT NULL COMMENT 'ip',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_login_log` */

insert  into `t_login_log`(`id`,`emp_id`,`login_ip`,`create_time`) values (1,1,'192.168.148.195','2016-10-10 22:57:27'),(2,1,'192.168.148.195','2016-10-10 23:01:12'),(3,1,'192.168.148.195','2016-10-10 23:01:55'),(4,1,'192.168.148.218','2016-10-11 17:48:59'),(5,1,'192.168.148.218','2016-10-11 17:55:21');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name_en` varchar(30) DEFAULT NULL COMMENT '菜单英文名称',
  `name_zh` varchar(30) NOT NULL COMMENT '菜单中文名称',
  `menu_url` varchar(100) DEFAULT NULL COMMENT '菜单url',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上一级ID',
  `menu_icon` varchar(10) DEFAULT NULL COMMENT '菜单图片',
  `menu_sort` int(3) DEFAULT NULL COMMENT '排序方式',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(10) unsigned NOT NULL COMMENT '创建人',
  `operate_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operator` int(10) unsigned DEFAULT NULL COMMENT '操作人',
  `memo` varchar(50) DEFAULT NULL COMMENT '菜单描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`name_en`,`name_zh`,`menu_url`,`parent_id`,`menu_icon`,`menu_sort`,`create_time`,`creator`,`operate_time`,`operator`,`memo`) values (1,'caidan','菜单管理','/menu',2,'icon-002',1,'2016-11-04 15:16:13',1,NULL,1,NULL),(2,'quanxian','权限管理',NULL,0,'icon-002',1,'2016-10-12 20:16:41',1,NULL,1,NULL),(3,'yuangong','员工管理','/emp',2,'icon-002',2,'2016-10-13 01:06:00',1,NULL,1,NULL);

/*Table structure for table `t_menu_role` */

DROP TABLE IF EXISTS `t_menu_role`;

CREATE TABLE `t_menu_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '注释',
  `role_id` int(10) unsigned NOT NULL COMMENT '角色主键',
  `menu_id` int(10) unsigned NOT NULL COMMENT '菜单主键',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(10) unsigned NOT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu_role` */

insert  into `t_menu_role`(`id`,`role_id`,`menu_id`,`create_time`,`creator`) values (1,1,1,'2016-10-11 17:51:23',1),(2,1,3,'2016-10-12 14:33:39',1);

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `memo` varchar(50) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `creator` int(10) unsigned NOT NULL COMMENT '创建人',
  `operate_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `operator` int(10) unsigned DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`id`,`role_name`,`memo`,`create_time`,`creator`,`operate_time`,`operator`) values (1,'管理员','管理员','2016-10-11 17:49:51',1,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
