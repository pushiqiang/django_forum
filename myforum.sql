-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: myforum
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.12.04.2-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_d41c2251` (`receiver_id`),
  KEY `application_924b1846` (`sender_id`),
  CONSTRAINT `application_receiver_id_51fade70_fk_loginuser_id` FOREIGN KEY (`receiver_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `application_sender_id_35708356_fk_loginuser_id` FOREIGN KEY (`sender_id`) REFERENCES `loginuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--



--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--



--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--



--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--


/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add login user',6,'add_loginuser'),(17,'Can change login user',6,'change_loginuser'),(18,'Can delete login user',6,'delete_loginuser'),(19,'Can add 导航条',7,'add_nav'),(20,'Can change 导航条',7,'change_nav'),(21,'Can delete 导航条',7,'delete_nav'),(22,'Can add column',8,'add_column'),(23,'Can change column',8,'change_column'),(24,'Can delete column',8,'delete_column'),(25,'Can add post type',9,'add_posttype'),(26,'Can change post type',9,'change_posttype'),(27,'Can delete post type',9,'delete_posttype'),(28,'Can add post',10,'add_post'),(29,'Can change post',10,'change_post'),(30,'Can delete post',10,'delete_post'),(31,'Can add comment',11,'add_comment'),(32,'Can change comment',11,'change_comment'),(33,'Can delete comment',11,'delete_comment'),(34,'Can add message',12,'add_message'),(35,'Can change message',12,'change_message'),(36,'Can delete message',12,'delete_message'),(37,'Can add application',13,'add_application'),(38,'Can change application',13,'change_application'),(39,'Can delete application',13,'delete_application'),(40,'Can add notice',14,'add_notice'),(41,'Can change notice',14,'change_notice'),(42,'Can delete notice',14,'delete_notice');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;


--
-- Table structure for table `column`
--

DROP TABLE IF EXISTS `column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `column` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `img` varchar(200) NOT NULL,
  `post_number` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `manager_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `column_8784215c` (`manager_id`),
  KEY `column_6be37982` (`parent_id`),
  CONSTRAINT `column_manager_id_5a8de08c_fk_loginuser_id` FOREIGN KEY (`manager_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `column_parent_id_26c0718_fk_column_id` FOREIGN KEY (`parent_id`) REFERENCES `column` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `column`
--



--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `comment_parent_id` int(11) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_4f331e2f` (`author_id`),
  KEY `comment_3e692f38` (`comment_parent_id`),
  KEY `comment_f3aa1999` (`post_id`),
  CONSTRAINT `comment_author_id_c088d7b_fk_loginuser_id` FOREIGN KEY (`author_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `comment_comment_parent_id_2c50ffc2_fk_comment_id` FOREIGN KEY (`comment_parent_id`) REFERENCES `comment` (`id`),
  CONSTRAINT `comment_post_id_14121c70_fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--



--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_loginuser_id` FOREIGN KEY (`user_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--



--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--


/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'log entry','admin','logentry'),(2,'permission','auth','permission'),(3,'group','auth','group'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'login user','forum','loginuser'),(7,'导航条','forum','nav'),(8,'column','forum','column'),(9,'post type','forum','posttype'),(10,'post','forum','post'),(11,'comment','forum','comment'),(12,'message','forum','message'),(13,'application','forum','application'),(14,'notice','forum','notice');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;


--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--


/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-02-05 01:31:33'),(2,'auth','0001_initial','2016-02-05 01:31:36'),(3,'forum','0001_initial','2016-02-05 01:31:55'),(4,'admin','0001_initial','2016-02-05 01:31:57'),(5,'sessions','0001_initial','2016-02-05 01:31:58');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;


--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--



--
-- Table structure for table `loginuser`
--

DROP TABLE IF EXISTS `loginuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `levels` int(10) unsigned NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `privilege` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginuser`
--


/*!40000 ALTER TABLE `loginuser` DISABLE KEYS */;
INSERT INTO `loginuser` VALUES (1,'pbkdf2_sha256$15000$7UWSiMMrxUao$DnQV/zKRY0LRB3sRvWJxiHcZe8c1Ha3Wn1C+3Odw7hY=','2016-02-05 02:01:45',1,'pushiqiang','','','pushiqiang@126.com',1,1,'2016-02-05 02:01:45',0,'/static/tx/default.jpg','0');
/*!40000 ALTER TABLE `loginuser` ENABLE KEYS */;


--
-- Table structure for table `loginuser_friends`
--

DROP TABLE IF EXISTS `loginuser_friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginuser_friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_loginuser_id` int(11) NOT NULL,
  `to_loginuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_loginuser_id` (`from_loginuser_id`,`to_loginuser_id`),
  KEY `loginuser_friends_f1b71748` (`from_loginuser_id`),
  KEY `loginuser_friends_0e5e320f` (`to_loginuser_id`),
  CONSTRAINT `loginuser_friends_from_loginuser_id_3519fd2_fk_loginuser_id` FOREIGN KEY (`from_loginuser_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `loginuser_friends_to_loginuser_id_7e712efd_fk_loginuser_id` FOREIGN KEY (`to_loginuser_id`) REFERENCES `loginuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginuser_friends`
--



--
-- Table structure for table `loginuser_groups`
--

DROP TABLE IF EXISTS `loginuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginuser_id` (`loginuser_id`,`group_id`),
  KEY `loginuser_groups_0729fcdf` (`loginuser_id`),
  KEY `loginuser_groups_0e939a4f` (`group_id`),
  CONSTRAINT `loginuser_groups_group_id_1484a7f7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `loginuser_groups_loginuser_id_d7cb3cc_fk_loginuser_id` FOREIGN KEY (`loginuser_id`) REFERENCES `loginuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginuser_groups`
--


--
-- Table structure for table `loginuser_user_permissions`
--

DROP TABLE IF EXISTS `loginuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `loginuser_id` (`loginuser_id`,`permission_id`),
  KEY `loginuser_user_permissions_0729fcdf` (`loginuser_id`),
  KEY `loginuser_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `loginuser_user_permissions_loginuser_id_58b53052_fk_loginuser_id` FOREIGN KEY (`loginuser_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `loginuser_user_perm_permission_id_5a6649e2_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginuser_user_permissions`
--



--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_d41c2251` (`receiver_id`),
  KEY `message_924b1846` (`sender_id`),
  CONSTRAINT `message_receiver_id_775122b1_fk_loginuser_id` FOREIGN KEY (`receiver_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `message_sender_id_3969e603_fk_loginuser_id` FOREIGN KEY (`sender_id`) REFERENCES `loginuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--


--
-- Table structure for table `nav`
--

DROP TABLE IF EXISTS `nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nav`
--



--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_417f1b1c` (`content_type_id`),
  KEY `notice_d41c2251` (`receiver_id`),
  KEY `notice_924b1846` (`sender_id`),
  CONSTRAINT `notice_content_type_id_2ca36386_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `notice_receiver_id_443a2bc9_fk_loginuser_id` FOREIGN KEY (`receiver_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `notice_sender_id_48423b15_fk_loginuser_id` FOREIGN KEY (`sender_id`) REFERENCES `loginuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--



--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  `view_times` int(11) NOT NULL,
  `responce_times` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `author_id` int(11) NOT NULL,
  `column_id` int(11) NOT NULL,
  `last_response_id` int(11) NOT NULL,
  `type_name_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_4f331e2f` (`author_id`),
  KEY `post_cd4a4bf9` (`column_id`),
  KEY `post_8ad5f8c1` (`last_response_id`),
  KEY `post_a6db1428` (`type_name_id`),
  CONSTRAINT `post_author_id_417c0ea7_fk_loginuser_id` FOREIGN KEY (`author_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `post_column_id_11d8c7c0_fk_column_id` FOREIGN KEY (`column_id`) REFERENCES `column` (`id`),
  CONSTRAINT `post_last_response_id_7c683cb1_fk_loginuser_id` FOREIGN KEY (`last_response_id`) REFERENCES `loginuser` (`id`),
  CONSTRAINT `post_type_name_id_33aa763_fk_posttype_id` FOREIGN KEY (`type_name_id`) REFERENCES `posttype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--



--
-- Table structure for table `posttype`
--

DROP TABLE IF EXISTS `posttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posttype`
--


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-02-05  2:11:35
