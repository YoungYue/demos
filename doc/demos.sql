/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.0.27-community-nt : Database - demos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`demos` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `demos`;

/*Table structure for table `tbl_effect` */

DROP TABLE IF EXISTS `tbl_effect`;

CREATE TABLE `tbl_effect` (
  `eid` int(11) NOT NULL auto_increment,
  `menuType` int(11) default NULL,
  `eName` varchar(255) default NULL,
  `eDescription` varchar(255) default NULL,
  PRIMARY KEY  (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_effect` */

insert  into `tbl_effect`(`eid`,`menuType`,`eName`,`eDescription`) values (4,1,'九宫格','九宫格'),(5,1,'热点菜单','热点菜单'),(6,1,'预览菜单','预览菜单'),(7,0,'苹果唱片效果','苹果唱片效果'),(8,0,'环形图片墙',''),(9,0,'翻转图片',''),(10,0,'视频播放',''),(11,0,'照片墙',''),(12,0,'3D预览图',''),(13,0,'平面预览图',''),(14,0,'自动展示','');

/*Table structure for table `tbl_effectproperty` */

DROP TABLE IF EXISTS `tbl_effectproperty`;

CREATE TABLE `tbl_effectproperty` (
  `epId` int(11) NOT NULL auto_increment,
  `menuId` int(11) default NULL,
  `eId` int(11) default NULL,
  `epKey` varchar(255) default NULL,
  `epValue` varchar(255) default NULL,
  `epNote` varchar(255) default NULL,
  PRIMARY KEY  (`epId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_effectproperty` */

insert  into `tbl_effectproperty`(`epId`,`menuId`,`eId`,`epKey`,`epValue`,`epNote`) values (1,NULL,10,'窗口位置','左',''),(2,NULL,10,'窗口位置','右',''),(3,NULL,10,'窗口位置','上',''),(4,NULL,10,'窗口位置','下',''),(5,NULL,10,'窗口颜色','红',''),(6,NULL,10,'窗口颜色','橙',''),(7,NULL,10,'窗口颜色','黄',''),(8,NULL,10,'窗口大小','小',''),(9,NULL,10,'窗口大小','中',''),(10,NULL,10,'窗口大小','大','');

/*Table structure for table `tbl_files` */

DROP TABLE IF EXISTS `tbl_files`;

CREATE TABLE `tbl_files` (
  `fid` int(11) NOT NULL auto_increment,
  `menuId` int(10) default NULL,
  `fileName` varchar(255) default NULL,
  `fileSize` varchar(255) default NULL,
  `fileSort` varchar(255) default '0',
  `fileRealName` varchar(255) default NULL,
  `fileType` varchar(255) default NULL,
  PRIMARY KEY  (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_files` */

insert  into `tbl_files`(`fid`,`menuId`,`fileName`,`fileSize`,`fileSort`,`fileRealName`,`fileType`) values (6,9,'3bc72170cfb5fe9e50cf52f3315568dc.jpg','230','0','05052013(006).jpg','jpg'),(7,9,'a5e81f89509cb90d5c6fd3baf13688a1.jpg','247','0','05052013(007).jpg','jpg'),(8,9,'4cd55929fa25a5e8bd5c9d0371ea50cf.jpg','120','0','4cd55929fa25a5e8bd5c9d0371ea50cf.jpg','jpg');

/*Table structure for table `tbl_menu` */

DROP TABLE IF EXISTS `tbl_menu`;

CREATE TABLE `tbl_menu` (
  `menuId` int(11) NOT NULL auto_increment,
  `eid` int(11) default NULL,
  `epId` varchar(255) default NULL,
  `belongTo` int(11) default NULL,
  `parMenuId` int(11) default NULL,
  `menuName` varchar(255) default NULL,
  `menuType` varchar(255) default NULL,
  PRIMARY KEY  (`menuId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_menu` */

insert  into `tbl_menu`(`menuId`,`eid`,`epId`,`belongTo`,`parMenuId`,`menuName`,`menuType`) values (3,4,'',4,0,'菜单A','1'),(6,6,'',4,0,'菜单B','1'),(7,10,'4,6',4,0,'菜单C','0'),(8,4,'',4,7,'菜单D','1'),(9,10,'3,7',4,6,'菜单E','0'),(10,5,'',4,0,'菜单F','1'),(11,11,'',6,27,'长寿概况','0'),(12,9,'',6,27,'映象长寿','0'),(13,7,'',6,12,'苹果','0'),(14,8,'',6,12,'环形图片墙','0'),(15,4,'',6,27,'优惠政策','1'),(16,4,'',6,15,'企业政策','1'),(17,4,'',6,15,'老年政策','1'),(18,4,'',6,15,'计划生育政策','1'),(19,4,'',6,27,'新闻图片','1'),(20,4,'',6,19,'政府新闻','1'),(21,4,'',6,19,'企业要闻','1'),(22,4,'',6,19,'生活资讯','1'),(23,4,'',6,27,'投资平台','1'),(24,4,'',6,23,'平台介绍','1'),(27,8,'',6,0,'政府招商展示系统','0'),(28,4,'',4,6,'菜单BA','1'),(29,4,'',4,10,'菜单FA','1'),(30,5,'',4,10,'菜单FB','1'),(31,9,'',4,29,'菜单FAA','0'),(32,4,'',4,29,'菜单FAB','1'),(33,11,'',4,8,'菜单DDA','0'),(34,5,'',4,6,'菜单BB','1'),(35,6,'',4,6,'菜单BC','1');

/*Table structure for table `tbl_menuporperty` */

DROP TABLE IF EXISTS `tbl_menuporperty`;

CREATE TABLE `tbl_menuporperty` (
  `mpId` int(11) NOT NULL auto_increment,
  `menuId` int(11) default NULL,
  `proKey` varchar(100) default NULL,
  `proValue` varchar(255) default NULL,
  PRIMARY KEY  (`mpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_menuporperty` */

insert  into `tbl_menuporperty`(`mpId`,`menuId`,`proKey`,`proValue`) values (106,8,'nodeImageFile','c6daf6d2a0494d2ca2b59268fbbb255c.jpg'),(107,8,'nodeDescriptionLabelImageFile','2ea6e5ebbf30408b8de249aa8f05b541.jpg'),(108,8,'nodePickedSound',NULL),(109,8,'nodeMusicFile',NULL),(110,8,'isZw','1'),(168,7,'nodeImageFileNormal','765b10205ad04087987d246f3bff214a.jpg'),(169,7,'nodeImageFileDown',NULL),(170,7,'nodeImageFileCheck',NULL),(171,7,'nodeImageFileBg',NULL),(172,7,'nodeMusicFileCheck',NULL),(173,7,'nodeMusicFilebj',NULL),(197,3,'nodeImageFile','f89bfc46f73e4db0bca2eab75ad27372.jpg'),(198,3,'nodeDescriptionLabelImageFile','649380a5dd57445d83789abc185e15c6.jpg'),(199,3,'nodePickedSound','7ff5f4fd7a7b4111a0552a60689f81db.jpg'),(200,3,'nodeMusicFile','3d3bb215a15c48f2ab06c3defc70529f.jpg'),(201,3,'isZw','1'),(305,6,'nodeMenuPicture','fb6e85eaa4dc4dd19bc3067350c6c8f8.jpg'),(306,6,'nodeBackgroundPicture','3bc72170cfb5fe9e50cf52f3315568dc.jpg'),(307,6,'nodeMusicFile','b9d9f73a678c498ba60b16128d1afa82.jpg'),(310,10,'nodeBackgroundPicture','4cd55929fa25a5e8bd5c9d0371ea50cf.jpg'),(311,10,'nodeMusicFile','3bc19a7de40a4be695d24c7b04fd6f42.jpg'),(570,31,'isZw','1'),(571,31,'nodeImageFileNormal',NULL),(572,31,'nodeImageFileDown',NULL),(573,31,'nodeImageFileCheck',NULL),(574,31,'nodeImageFileBg',NULL),(575,31,'nodeMusicFileCheck',NULL),(576,31,'nodeMusicFilebj',NULL),(829,28,'previewMenuPicture','systemIconHotPoint1.png'),(830,28,'previewPlace','{176,209}'),(831,28,'menuPlace','{241,10}'),(832,28,'nodeMenuPicture','bf3688783ce145b3e406d83d7b460980-hotIcon.png'),(833,28,'nodeDescriptionLabelImageFile','b7d2f5bcf22a6dc03902b563b6ab1db7.jpg'),(834,28,'nodePickedSound','5aead869977908d7d7ee7e8f3ecd5ac8.jpg'),(835,28,'nodeMusicFile','fb62b3959219053831fdfbfe6b3aa916.jpg'),(836,28,'isZw','0'),(837,34,'previewMenuPicture','systemIconHotPoint1.png'),(838,34,'previewPlace','{296,219}'),(839,34,'menuPlace','{360,28}'),(840,34,'nodeMenuPicture','e94866dc2a9a682056fd6c48b90d74d5-hotIcon.png'),(841,34,'nodeBackgroundPicture',NULL),(842,34,'nodeMusicFile',NULL),(873,35,'previewMenuPicture','5d0d17ce8155adba68f039a10f7e55e6-menuFiles.png'),(874,35,'previewPlace','{439,204}'),(875,35,'menuPlace','{428,26}'),(876,35,'nodeMenuPicture','6116828121a2044c9a69bd1f9c72d649-hotIcon.png'),(877,35,'nodeBackgroundPicture',NULL),(878,35,'nodeMusicFile',NULL),(879,29,'hotpointPlace','{258,71}'),(880,29,'nodeMenuPicture','44e15da4a5e56a833c12efd51ff62f98-hotIcon.png'),(881,29,'nodeDescriptionLabelImageFile',NULL),(882,29,'nodePickedSound',NULL),(883,29,'nodeMusicFile',NULL),(884,29,'isZw','0'),(885,30,'hotpointPlace','{355,154}'),(886,30,'nodeMenuPicture','933652c47cce24e3e6c30ee2733009fc-menuFiles.jpg'),(887,30,'nodeBackgroundPicture',NULL),(888,30,'nodeMusicFile',NULL),(889,9,'previewMenuPicture','07e2b2e5073d639b5f34e2bfe282a82e-menuFiles.png'),(890,9,'previewPlace','{100,205}'),(891,9,'menuPlace','{22,41}'),(892,9,'nodeMenuPicture','systemIconHotPoint1.png'),(893,9,'nodeImageFileDown',NULL),(894,9,'nodeImageFileCheck',NULL),(895,9,'nodeImageFileBg',NULL),(896,9,'nodeMusicFileCheck',NULL),(897,9,'nodeMusicFilebj',NULL);

/*Table structure for table `tbl_model` */

DROP TABLE IF EXISTS `tbl_model`;

CREATE TABLE `tbl_model` (
  `modId` int(10) NOT NULL auto_increment,
  `modName` varchar(255) default NULL,
  `modDes` varchar(255) default NULL,
  `parMod` int(10) default NULL COMMENT '顶级为-1',
  `modCode` int(10) default NULL,
  `modUrl` varchar(255) default NULL,
  PRIMARY KEY  (`modId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能模块表';

/*Data for the table `tbl_model` */

insert  into `tbl_model`(`modId`,`modName`,`modDes`,`parMod`,`modCode`,`modUrl`) values (24,'用户管理','人员管理',-1,101,'/userController.do'),(25,'模块管理','模块信息管理',-1,102,'/modelController.do'),(26,'资源管理','资源管理',-1,103,'/resourcesController.do'),(27,'角色管理','角色信息管理',-1,104,'/roleController.do'),(28,'ipad菜单管理','',-1,9,'/menuController.do'),(29,'显示效果管理','',NULL,7,'/effectController.do'),(30,'系统参数设置','系统参数设置',NULL,33,'/sysParamController.do'),(31,'显示效果属性','sdf',NULL,9,'/effectProController.do');

/*Table structure for table `tbl_resources` */

DROP TABLE IF EXISTS `tbl_resources`;

CREATE TABLE `tbl_resources` (
  `resId` int(11) NOT NULL auto_increment,
  `resName` varchar(50) default NULL,
  `resUrl` varchar(200) default NULL,
  `resDes` varchar(100) default NULL,
  `resState` varchar(10) default NULL,
  PRIMARY KEY  (`resId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_resources` */

insert  into `tbl_resources`(`resId`,`resName`,`resUrl`,`resDes`,`resState`) values (1,'3432','4324','234234','234234'),(6,'sdf','sdf','sdfsdfaaa','sdfsdf');

/*Table structure for table `tbl_role` */

DROP TABLE IF EXISTS `tbl_role`;

CREATE TABLE `tbl_role` (
  `roleId` int(11) NOT NULL auto_increment,
  `roleName` varchar(50) default NULL,
  `roleCode` varchar(50) default NULL,
  PRIMARY KEY  (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_role` */

insert  into `tbl_role`(`roleId`,`roleName`,`roleCode`) values (1,'管理员','0000');

/*Table structure for table `tbl_role_resources` */

DROP TABLE IF EXISTS `tbl_role_resources`;

CREATE TABLE `tbl_role_resources` (
  `id` int(11) NOT NULL auto_increment,
  `roleId` int(11) default NULL,
  `resId` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_role_resources` */

insert  into `tbl_role_resources`(`id`,`roleId`,`resId`) values (12,2,1),(17,2,8),(21,1,2),(22,1,2),(23,1,2),(24,1,2),(25,1,2),(26,1,2),(27,1,2),(28,1,2),(29,1,2),(30,1,2),(31,1,2),(32,1,2),(33,1,2),(34,1,2),(35,1,2),(36,1,2),(37,1,2),(38,1,2),(39,1,3),(40,1,4),(41,1,5),(43,1,7),(44,1,8);

/*Table structure for table `tbl_sysparam` */

DROP TABLE IF EXISTS `tbl_sysparam`;

CREATE TABLE `tbl_sysparam` (
  `sid` int(11) NOT NULL auto_increment,
  `userId` int(10) default NULL,
  `paraName` varchar(255) default NULL,
  `paraFile` varchar(255) default NULL,
  `thumbnail` varchar(255) default NULL,
  PRIMARY KEY  (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_sysparam` */

insert  into `tbl_sysparam`(`sid`,`userId`,`paraName`,`paraFile`,`thumbnail`) values (1,NULL,'系统进入动画',NULL,NULL),(2,NULL,'系统背景文件','5aead869977908d7d7ee7e8f3ecd5ac8.png',NULL),(3,NULL,'系统背景音乐','b7d2f5bcf22a6dc03902b563b6ab1db7.jpg',NULL),(4,NULL,'封面菜单分割线','5aead869977908d7d7ee7e8f3ecd5ac8.jpg',NULL),(5,NULL,'对话框软件信息',NULL,NULL),(6,NULL,'返回按钮默认状态','a00ca887e64446c062f16dcbc7b7bf40.png',NULL),(7,NULL,'返回按钮点击状态','c145fae05808b9f7d8aa0145c0db58f0.png',NULL);

/*Table structure for table `tbl_user` */

DROP TABLE IF EXISTS `tbl_user`;

CREATE TABLE `tbl_user` (
  `userId` int(11) NOT NULL auto_increment,
  `roleId` int(11) default NULL,
  `username` varchar(50) default NULL,
  `realName` varchar(20) default NULL,
  `password` varchar(50) default NULL,
  `state` int(1) default NULL,
  `valiCode` varchar(50) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tbl_user` */

insert  into `tbl_user`(`userId`,`roleId`,`username`,`realName`,`password`,`state`,`valiCode`) values (4,1,'admin','admin','21232f297a57a5a743894a0e4a801fc3',1,'1'),(5,1,'scott','scott','43b90920409618f188bfc6923f16b9fa',1,'1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
