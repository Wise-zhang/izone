-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: izone
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1-log

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
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (3,'1296726935@qq.com',0,1,4);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58_fk` (`email_address_id`),
  CONSTRAINT `account_emailconfirmation_email_address_id_5b7f8c58_fk` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

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

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

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
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 用户',6,'add_ouser'),(17,'Can change 用户',6,'change_ouser'),(18,'Can delete 用户',6,'delete_ouser'),(19,'Can add site',7,'add_site'),(20,'Can change site',7,'change_site'),(21,'Can delete site',7,'delete_site'),(22,'Can add email confirmation',8,'add_emailconfirmation'),(23,'Can change email confirmation',8,'change_emailconfirmation'),(24,'Can delete email confirmation',8,'delete_emailconfirmation'),(25,'Can add email address',9,'add_emailaddress'),(26,'Can change email address',9,'change_emailaddress'),(27,'Can delete email address',9,'delete_emailaddress'),(28,'Can add social account',10,'add_socialaccount'),(29,'Can change social account',10,'change_socialaccount'),(30,'Can delete social account',10,'delete_socialaccount'),(31,'Can add social application',11,'add_socialapp'),(32,'Can change social application',11,'change_socialapp'),(33,'Can delete social application',11,'delete_socialapp'),(34,'Can add social application token',12,'add_socialtoken'),(35,'Can change social application token',12,'change_socialtoken'),(36,'Can delete social application token',12,'delete_socialtoken'),(37,'Can add 时间线',13,'add_timeline'),(38,'Can change 时间线',13,'change_timeline'),(39,'Can delete 时间线',13,'delete_timeline'),(40,'Can add 图片轮播',14,'add_carousel'),(41,'Can change 图片轮播',14,'change_carousel'),(42,'Can delete 图片轮播',14,'delete_carousel'),(43,'Can add 标签',15,'add_tag'),(44,'Can change 标签',15,'change_tag'),(45,'Can delete 标签',15,'delete_tag'),(46,'Can add 友情链接',16,'add_friendlink'),(47,'Can change 友情链接',16,'change_friendlink'),(48,'Can delete 友情链接',16,'delete_friendlink'),(49,'Can add 死链',17,'add_silian'),(50,'Can change 死链',17,'change_silian'),(51,'Can delete 死链',17,'delete_silian'),(52,'Can add 关键词',18,'add_keyword'),(53,'Can change 关键词',18,'change_keyword'),(54,'Can delete 关键词',18,'delete_keyword'),(55,'Can add 文章',19,'add_article'),(56,'Can change 文章',19,'change_article'),(57,'Can delete 文章',19,'delete_article'),(58,'Can add 分类',20,'add_category'),(59,'Can change 分类',20,'change_category'),(60,'Can delete 分类',20,'delete_category'),(61,'Can add 推荐工具',21,'add_toollink'),(62,'Can change 推荐工具',21,'change_toollink'),(63,'Can delete 推荐工具',21,'delete_toollink'),(64,'Can add 工具分类',22,'add_toolcategory'),(65,'Can change 工具分类',22,'change_toolcategory'),(66,'Can delete 工具分类',22,'delete_toolcategory'),(67,'Can add 提示信息',23,'add_notification'),(68,'Can change 提示信息',23,'change_notification'),(69,'Can delete 提示信息',23,'delete_notification'),(70,'Can add 文章评论',24,'add_articlecomment'),(71,'Can change 文章评论',24,'change_articlecomment'),(72,'Can delete 文章评论',24,'delete_articlecomment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `summary` longtext NOT NULL,
  `body` longtext NOT NULL,
  `img_link` varchar(255) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `views` int(11) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `blog_article_author_id_905add38_fk_oauth_ouser_id` (`author_id`),
  KEY `blog_article_category_id_7e38f15e_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_author_id_905add38_fk_oauth_ouser_id` FOREIGN KEY (`author_id`) REFERENCES `oauth_ouser` (`id`),
  CONSTRAINT `blog_article_category_id_7e38f15e_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (3,'javascript','javascript基础知识','# 一、js中获取元素的方法 \r\n    1、通过id来获得获得标签： \r\n        var odiv = document.getElementById(\"odiv\"); \r\n\r\n    2、获得标签里面的内容： \r\n        var str1 = odiv.innerHTML; \r\n        内容可以累加(可以用来做无缝动画)： \r\n        odiv.innerHTML = odiv.innerHTML + odiv.innerHTML;\r\n\r\n# 二、函数的定义和调用：(可在定义前调用) 预编译 \r\n    1、定义： \r\n        function fun1() {} \r\n\r\n    2、调用： \r\n        fun1();\r\n\r\n# 三、控制标签 \r\n    1、控制内部的html \r\n        var odiv = document.getElementById(\"odiv\"); \r\n        内部的html：odiv.innerHTML \r\n\r\n    2、控制标签的属性（选中了标签直接用点语法） \r\n        通过id获取标签：var oip = document.getElementById(\"oinput\"); \r\n        获得：alert(oip.value) \r\n        修改：oip.value = \"修改后的值\" \r\n        注意：要获取class属性的时候,应该 标签.className; \r\n\r\n    3、控制标签的css属性(odiv.style.background:获取的是行内式中的，修改的话也是修改到行内式中) \r\n        var odiv = document.getElementById(\"odiv\"); \r\n        odiv.style.background = \"pink\" \r\n        odiv.style.fontSize = \"30px\" \r\n\r\n# 四、js中获取元素的方法 \r\n    1、通过id来获得获得标签： \r\n        var odiv = document.getElementById(\"odiv\"); \r\n\r\n    2、获得标签里面的内容： \r\n        var str1 = odiv.innerHTML; \r\n        内容可以累加(可以用来做无缝动画)： \r\n        odiv.innerHTML = odiv.innerHTML + odiv.innerHTML;\r\n\r\n# 五、函数的定义和调用：(可在定义前调用) 预编译 \r\n    1、定义： \r\n        function fun1() {} \r\n\r\n    2、调用： \r\n        fun1();\r\n\r\n# 六、控制标签 \r\n    1、控制内部的html \r\n        var odiv = document.getElementById(\"odiv\"); \r\n        内部的html：odiv.innerHTML \r\n\r\n    2、控制标签的属性（选中了标签直接用点语法） \r\n        var oip = document.getElementById(\"oinput\"); \r\n        获得：alert(oip.value) \r\n        修改：oip.value = \"修改后的值\" \r\n        注意：要获取class属性的时候,应该 标签.className; \r\n\r\n    3、控制标签的css属性(odiv.style.background:获取的是行内式中的，修改的话也是修改到行内式中) \r\n        var odiv = document.getElementById(\"odiv\"); \r\n        odiv.style.background = \"pink\" \r\n        odiv.style.fontSize = \"30px\"','/static/blog/img/JavaScript.jpg','2017-09-09 19:01:46.125703','2017-09-09 19:40:21.111403',3,'javascript',1,3),(4,'jquery选择器','jquery的各种选择器(没有特别指定就选择这一类(首选$(this))):1、基础选择器：以前css怎么选,$(\"\")现在就怎么选;2、其他选择器(都是在同一级);3、关系选择器(可以指定是哪一种)....','# 一、基础选择器：以前css怎么选,$(\"\")现在就怎么选\r\n    >>$(\"li\").css(\"color\"); \r\n    >>$(\".li04\").css(\"color\"); \r\n    >>$(\"#oli\").css(\"color\"); \r\n    >>$(\".box li\").css(\"color\");\r\n\r\n# 二、其他选择器(都是在同一级) \r\n    >>$(\".box li\").not(\".li04\"):选择到.box下所有的li，但除了.li04这种标签; \r\n    >>$(\".box li\").eq(2),选择.box下第三个li元素; \r\n    >>$(\".li04\").prev(),选择.li04前面紧挨着的一个; \r\n    >>$(\".li04\").prevAll(),选择.li04前面所有的元素; \r\n    >>$(\".li04\").next(),选择后面紧挨着的一个元素; \r\n    >>$(\".li04\").nextAll(),选择后面所有的元素; \r\n    >>$(\"div\").has(\"p\"),选择子类中有p标签的div标签； \r\n    >>$(\"div\").find(\"p\"),在div中查找p标签\r\n\r\n# 三、关系选择器(可以指定是哪一种) \r\n    >>$(\".box\").siblings();选择.box所有兄弟,可以指定兄弟的种类 \r\n    >>$(\".box\").parent();选择.box的父类 \r\n    >>$(\".box\").children();选择.box标签的所有子类\r\n\r\n# 四、jq的链式编程 \r\n    概念：如果一直对同一个元素进行操作,那么可以使用.语法一直写下去 \r\n    例如： \r\n        $(this).css(\"background\", \"pink\"); \r\n        $(this).siblings().css(\"background\", \"\"); \r\n        可以写成： \r\n        $(this).css(\"background\", \"pink\").siblings().css(\"background\", \"\");\r\n\r\n# 五、获取元素的下标：index() \r\n    用法：我们可以通过$(标签).index() 来获取这个标签在兄弟排行中的下标. \r\n    判断是否为第一个： $(标签).index() == 0 \r\n    判断是否为最后一个：$(标签).next().length == 0\r\n\r\n# 六、添加类和删除类(给标签添加样式) \r\n    添加：$(\"标签\").addClass(\"类名\"); \r\n    删除：$(\"标签\").removeClass(\"类名\"); \r\n    切换：$(\"标签\").toggleClass(\"类名\");','/static/blog/img/jquery.jpg','2017-09-20 21:09:46.125703','2017-09-21 21:47:46.125703',2,'jquery',1,3),(5,'jquery动画','jquery的特殊动画事件、jquery控制css样式（通过.css）和html（通过.prop）比较(一启动就接收它的值，那就是取默认值)常用的jquery事件...','# 一、jquery的特殊动画事件\r\n    1、对角线动画：\r\n         >>显示：$(\"div\").show(400);\r\n         >>隐藏：$(\"div\").hide(400);\r\n         >>切换：$(\"div\").toggle(400);\r\n\r\n    2、滑动动画：\r\n        >>向下显示：$(\"div\").slideDow(400);\r\n        >>向上收起：$(\"div\").slideUp(400);\r\n        >>切换：$(\"div\").slideToggle(400);\r\n\r\n    3、透明度动画：\r\n        >>淡入：$(\"div\").fadeIn(400);\r\n        >>淡出：$(\"div\").fadeOut(400);\r\n        >>切换：$(\"div\").fadeToggle(400);\r\n        >>透明到：$(\"div\").fadeTo(400, .3);\r\n\r\n# 二、jquery控制css样式（通过.css）和html（通过.prop）比较(一启动就接收它的值，那就是取默认值)\r\n    a>控制标签的属性:                                      b>控制css样式:\r\n    1、获取(一个属性名)                                     1、获取(一个样式名)\r\n     $(\"input\").prop(\"type\");                               $(\"标签\").css(\"样式\")；\r\n    2、修改一个(一个属性名和属性值,以元组封装)                2、修改一个(一个样式名和值,字典封装)\r\n     $(\"input\").prop(\"type\",\"text\");                        $(\"标签\").css(\"width\",\"100px\")\r\n    3、修改多个(多个属性名和属性值,以字典封装)                3、修改多个(多个样式名和值,字典封装)\r\n     $(\"div\").prop({\"class\":\"box\",\"id\":\"obox\"})             $(\"标签\").css({})\r\n\r\n    c>获取标签中的内容\r\n    1、全覆盖标签里面的内容：\r\n        $(\"div\").html(\"<p>段落标签</p>\");\r\n    2、获取标签中的内容\r\n        var str1 = $(\"div\").html();\r\n\r\n    d>渐变css样式(不管修改多少个都是用字典，只能修改数字类型)\r\n        $(\"div\").animate({\r\n                \"width\": \"1000px\",\r\n                \"height\": \"300px\",\r\n                \"font-size\": \"30px\"\r\n            }, 2000, \"linear\",function(){\r\n                alert(\"动画结束了\");\r\n            })\r\n# 三、 常用的jquery事件\r\n    .click(function(){  })                  鼠标点击事件\r\n    .focus()                                表单的聚焦事件\r\n    .blur()                                 表单的失焦事件\r\n    .mouseenter()                           鼠标移入事件\r\n    .mouseleave()                           鼠标移出事件\r\n    .hover(function(){},function(){})       第一个函数为移入，第二个为移出\r\n\r\n# 四、表单提交事件\r\n    $(\"my_frame\").submit(function(){\r\n        event.preventDefault();  //阻止默认提交\r\n    })\r\n\r\n# 五、正则表达式在js中的使用(用于表单验证)\r\n    var reUserName = /规则/参数;\r\n    ret = reUserName.test(要匹配的字符串);\r\n    ret为true则匹配成功,ret为false则匹配失败;\r\n\r\n# 六、表单元素验证\r\n    1、判空\r\n    2、验证是否满足规则','/static/blog/img/jquery.jpg','2017-10-15 20:33:46.125703','2017-10-15 20:33:46.125703',5,'jquery2',1,3),(6,'jquery与后端数据交互','事件冒泡、事件委托、DOM操作(操作节点) 、javascript对象、json、ajax.......','# 一、事件冒泡\r\n    1、概念：子集和父级有同类事件,子集触发父级也会被触发；\r\n    2、解决方法：在子集中添加event.stopPropagation()：加在哪个位置都可以，不会影响函数的执行或return false：后面的语句不会执行.\r\n\r\n# 二、事件委托\r\n    1、概念：可以提高性能,可为后面添加的节点加入这个事件；\r\n    2、格式：$(\"被委托父级元素\").delegate(\"委托的子级元素\",\"事件\",匿名函数).\r\n\r\n# 三、DOM操作(操作节点)\r\n    var $li = $(\'<li>新的里节点</li>\')\r\n    var $p = $(\'<p>新的外节点</p>\')\r\n    1、往父类中添加子节点：往最后面添加： $(\"ul\").append($li)\r\n                        往最前面添加： $(\"ul\").prepend($li)\r\n    2、在指定位置(p元素不存在为添加,p元素存在为剪切)：往后面添加：$p.insertAfter(\"ul\")\r\n                                                  往前面添加：$p.insertBefore(\"ul\")\r\n\r\n# 四、javascript对象\r\n    格式： var dog = {\r\n                name: \"哮天犬\",\r\n                age: 12,\r\n                say: function(){\r\n                    alert(\"my name is \" + this.name);\r\n               }\r\n            }\r\n    1、键值对的形式,每个元素用逗号隔开；\r\n    2、键不能有双引号,值可为任何类型；\r\n\r\n# 五、json\r\n    格式：\r\n            {\r\n                \"name\": \"小白\",\r\n                \"age\": 18,\r\n                \"arr\":[10, 20, 30, 40]\r\n            }\r\n    1、键值对的形式,元素之间逗号隔开；\r\n    2、键一定要有双引号,值不能为函数；\r\n    3、json也可以是一个单纯的数组。\r\n\r\n# 六、ajax\r\n    1、作用：用来页面局部刷新,即页面无刷新加载数据(向服务器发送请求获取数据填入html、向服务器提交数据，服务器处理后返回数据填入html)\r\n    2、格式：\r\n            $.ajax({\r\n                    url:\"请求的路径\",\r\n                    type:\"GET\",\r\n                    data: //要提交到服务器的数据\r\n                    contentType: //提交的数据的类型\r\n                    dataType: \"json\",  //服务器返回给我们的数据格式\r\n                    success:function(data){\r\n                        //数据返回成功时执行的代码\r\n                    },\r\n                    error:function(){\r\n                        //数据返回失败时执行的代码\r\n                    }\r\n                })\r\n    3、大括号里面就是javascript对象.','/static/blog/img/jquery.jpg','2017-11-05 22:01:46.125703','2017-11-05 22:01:46.125703',10,'jquery3',1,3),(7,'python 字符串操作','python字符串的操作函数介绍','mystr = \'hello world itcast and itcastcpp\'<br>\r\n\r\nmystr.find(\"it\")  在mystr字符串中找\"it\"这个子串，找到就返回第一次出现时候的下标，找不到返回-1<br>\r\nmystr.index(\"it\")  在mystr字符串中找\"it\"这个子串，找到就返回第一次出现时候的下标，找不到则报错<br>\r\nmystr.count(\"it\")  在mystr字符串中找\"it\"这个子串，找到就返回出现的次数，找不到返回0<br>\r\n\r\nmystr.isdigit()   判断mystr字符串是不是一个纯数字的字符串，如果是返回True，否则返回False<br>\r\nmystr.isalpha()   判断mystr字符串是不是一个纯字母的字符串，如果是返回True，否则返回False<br>\r\nmystr.isspace()   判断mystr字符串是不是一个纯空格的字符串，如果是返回True，否则返回False<br>\r\n\r\nmystr.startswith(\"ab\")   判断mystr字符串是不是以子串ab开始的，如果是返回True，否则返回False<br>\r\nmystr.endswith(\"ab\")   判断mystr字符串是不是以子串ab结尾的，如果是返回True，否则返回False<br>\r\n\r\nmystr.replace(子串1, 字符串2)   返回一个新字符串，把mystr中的子串1，全部替换成字符串2<br>\r\nmystr.strip()  返回一个新字符串，去掉mystr字符串中的前后空格<br>\r\nmystr.lstrip()  返回一个新字符串，去掉mystr字符串中的前空格<br>\r\nmystr.rstrip()  返回一个新字符串，去掉mystr字符串中的后空格<br>\r\n\r\nmystr.split(子串) 返回一个列表，把mystr按照子串进行分割成若干部分，每个部分作为列表中的每个元素，这个子串最终消失<br>\r\n\r\nmystr.partition(子串) <br>返回一个元组，把mystr按照子串进行分割成3个部分，子串作为第2个元素，子串前面的字符串作为元组第一个元素，子串后面的字符串作为元组第3个元素<br>\r\n\r\nmystr.upper()   返回一个新字符串，把字符串中所有的字母变成大写字母<br>\r\nmystr.lower()   返回一个新字符串，把字符串中所有的字母变成小写字母<br>\r\nmystr.capitalize()   返回一个新字符串，把字符串中第一个字母转换成大写，其余小写<br>\r\nmystr.title()   返回一个新字符串，把字符串中每个单词第一个字母转换成大写，其余小写<br>\r\nmystr.swapcase()   返回一个新字符串，把字符串中字母进行大小写互换<br>\r\nmystr.center(100)  返回一个新字符串，让mystr在100个字符的长度中做居中效果<br>\r\n\r\nlen(mystr)   返回出字符串中字符的个数  <br> \r\neval(mystr)  获得字符串的实际值<br>','/static/blog/img/summary.png','2017-07-20 16:18:16.955086','2017-07-20 18:48:39.256663',5,'str',1,1),(8,'python的tcp/udp多任务编程','tcp/udp多任务编程.....','# 一、多任务\r\n    多线程的创建(threading关键字)：定义一个就启动一个\r\n        方法一：创建函数，将函数名传入到threading.Thread(target = 函数名,args = (传入的实参，))\r\n        方法二：创建一个类继承threading.Thread,重写run方法，传参重写init方法，但是要调用父类的init方法\r\n    互斥锁：   创建锁— mutex_lock = threading.lock()\r\n        上锁— mutex_lock.acquire()   (请求锁)\r\n        解锁— mutex_lock.release()\r\n\r\n    多进程的创建（multiprocessing关键字）：定义一个就启动一个\r\n        方法一：创建函数，将函数名传入multiprocess.Process(target=函数名,args=(参数，)）\r\n        方法二：继承multiprocessing.Process类，重写run方法，传参重写init方法，但要调用父类的init方法\r\n        通信：multiprocessing.Queue()\r\n\r\n    进程池（重复使用进程，控制进程的数量，减少内存开销）：这样创建一次：pool = multiprocessing.Pool(processes=3)；这样循环使用（空闲的进程会派出去）：pool.apply_async(func=worker, args=(i,))\r\n        创建：multiprocessing.Pool()   计算机的核数\r\n        执行任务：pool.apply_async(func=目标函数名,args=(参数，), kwds={})\r\n        关闭进程池：pool.close() \r\n        阻塞主进程：pool.join()\r\n        通信：multiprocessing.Manage().Queue()\r\n\r\n    协程（遇到了耗时操作就不等,主进程不等协程,所以要打补丁来启动协程并进行轮训）  参数只能一个一个传递过去：启动：g1 = gevent.spawn(函数名,参数1,参数2)；阻塞：g1.join()\r\n        1、for...in....和next（迭代器有相同的效果）\r\n        2、创建协程：yield 要有循环       w1 = worker1()     worker1():生成器，w1迭代器\r\n        3、创建协程：关键字：gevent       ---封装了greenlet\r\n            import gevent\r\n            from gevent import monkey   # 打补丁\r\n            monkey.patch_all()\r\n            gevent.spawn(函数名,参数1,参数2)   # 不用join，打了补丁spawn就会轮训\r\n\r\n\r\n    总结：1、都可以通过绑定函数名来实现多任务，线程、进程用target参数，进程池用func参数；协程直接函数名gevent.spawn(函数名，参数)\r\n              2、线程、进程、进程池传参有args（元组）和kwargs（字典）,而协程只能一个一个传\r\n              3、主线程、主进程会等待子线程、子进程执行完，但是主进程不等进程池里面的进程执行完，所以要pool.close(),pool.join(),主进程也不等协程，gevent.joinall\r\n              4、进程、线程都要start启动，进程池：pool.close()、pool.join()，协程：gevent.joinall([])  或打补丁后gevent.spawn(函数名,参数1,参数2)       \r\n              5、多进程、进程池不共享全局变量，通信分别用multiprocessing.Queue()、multiprocess.Manage().Queue()；多线程共享全局变量（互斥锁）；协程共享全局变量。  \r\n\r\n# 二、udp:\r\n    创建过程：\r\n    udp_socket = socket.socket(socket.AF_INIT,socket.SOCK_DGRAM)\r\n    发送数据：\r\n    udp_socket.sendto(data.encode(\"utf-8\"),(\"192.168.64.70\",8888))\r\n    接收数据：\r\n    udp_socket.recvfrom(1024)[0].decode(\"utf-8\")\r\n    关闭资源\r\n    udp_socket.close()\r\n \r\n# 三、TCP：\r\n    1、tcp客户端实现：\r\n    创建过程\r\n    client_socket = socket.socket(socket.AF_INIT,socket.SOCK_STREAM)\r\n    连接服务端\r\n    client_socket.connect((\"192.168.64.70\",8888))\r\n    发送数据\r\n    client_socket.send(data.encode(\"utf-8\"))\r\n    接收数据\r\n    client_socket.recv(1024).decode(\"utf-8\")\r\n\r\n    2、tcp服务端实现：\r\n    创建监控的socket\r\n    server_socket = socket.socket(socket.AF_INIT,socket.SOCK_STREAM)\r\n    端口复用\r\n    server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, True)\r\n    绑定端口\r\n    server_socket.bind((\"\",8888))\r\n    化主动监控为被动监控\r\n    server_socket.listen(10)\r\n    接收连接\r\n    new_socket, client_address = server_socket.accept()    # 返回用于通信的新socket和客户端的地址\r\n    用新的socket接收消息\r\n    new_socket.recv(1024).decode(\"utf-8\")\r\n    用新的socket发送消息\r\n    new_socket.send(data.encode(\"utf-8\"))\r\n    关闭资源\r\n    new_socket.close()\r\n    server_socket.close()\r\n\r\n# 四、tcp保证通信稳定的机制：\r\n    1、发送应答机制；\r\n    2、超时重传机制；\r\n    3、错误校验机制； \r\n    4、流量控制阻塞管理。\r\n\r\n# 五、比较\r\n    1、udp面向数据报（既有要发送的消息，又有目标地址）的通信，不稳定;tcp是面向连接的通信。\r\n    2、udp获取到的信息是元组，要取第一个位置的数据进行解码；tcp获取到的是纯数据。\r\n    3、udp没有服务器端与客户端之分，tcp有明确的客户端与服务器端之分。\r\n    4、udp发送信息的函数为：sendto(data.encode(\"utf-8\"),(\"192.168.64.70\",8888))，接收信息的函数为：recvfrom(1024)[0].decode(\"utf-8\")；tcp发送消息为：send(data.encode(\"utf-8\"))，\r\n    接收信息为recv(1024).decode(\"utf-8\")。\r\n    5、udp当一端关闭时不会有任何提示；tcp有一端关闭都会想另一端发送一条空的信息。\r\n    6、tcp有连接机制：三次握手（当要连接时，客户端发送一个参数到服务端，服务端会将这个参数进行处理，而后将处理好的参数和服务端要发送的参数一起发送到客户端，最后客户端将来自服务端的参数进行处理后又发送回服务端）\r\n    ；tcp有断开机制：四次挥手（当要连接时，客户端发送一个参数到服务端；服务端会将这个参数进行处理后发送回客户端；而后服务端发送一个参数到客户端；最后客户端将来自服务端的参数进行处理后又发送回服务端）\r\n    7、udp适用场景：多点播放，如，广播，实时快速的通信等;tcp适用场景：通信质量要求高的场合  http传输、文件下载、高质量语音视频通信','/static/blog/img/HTTP.jpg','2017-08-28 20:29:04.591909','2017-08-28 20:29:04.591909',6,'tcpudp',1,2),(9,'mysql数据库','mysql数据库的增删改查,mysql数据库编程','# 一、数据库操作：\r\n	1、查看所有数据库  show databases;\r\n	2、使用数据库     use 数据库名;\r\n	3、查看当前使用的数据库  select database();\r\n	4、创建数据库   create database 数据库名 chartset=utf8;\r\n	5、删除数据库   drop database 数据库名;\r\n\r\n# 二、数据表操作：\r\n	1、查看当前数据库的所有表   show tables;\r\n	2、查看指定表的结构        desc 表名；\r\n	3、设计班级表结构为id、name，编写创建表的语句 create table t_cleasses(id int unsigned not null primary key auto_increment,name varchar(10));\r\n	4、给表添加列名：alter table 表名 add 列名 类型及约束；\r\n	5、修改字段的类型及约束： alter table 表名 modify 列名 类型及约束；\r\n	6、重命名字段：alter table 表名 change 旧名 新名  类型及约束\r\n	7、删除字段：alter table 表名 drop 列名\r\n\r\n# 三、注意\r\n	1、select* from student limit (n-1)*m,m; 查询第n页的数据；(n-1)*m开始的下标（从0开始），m查询的数据条数；\r\n	2、外连接、内连接可以创建一个虚拟的表，对这张虚拟表的修改会映射到真实的表（from后面的）；\r\n\r\n# 四、数据库编程：\r\n	创建连接\r\n	conn = pymysql.connect(host=\"localhost\", user=\"root\", password=\"mysql\", database=\"db_jingdong\", port=3306,charset=\'utf8\')\r\n\r\n	取得游标 ,默认是元组游标，即结果集记录以元组的形式呈现的\r\n	cur = conn.cursor()\r\n\r\n# 五、面试要点：\r\n	1、谈谈对视图的认识（虚拟表）：\r\n	    a>优点(简化查询、屏蔽了真实数据改变带来的影响、对机密数据有保护作用)：\r\n		1、简化查询操作：\r\n			对于复杂的查询结果保存为一个视图，便于下次查询时简化查询操作\r\n		2、逻辑上的独立性，屏蔽了真实数据表更改带来的影响：\r\n			视图是的应用程序和数据表在一定程度上独立。\r\n		3、视图对机密数据提供了一定的安全保护：\r\n			视图可以屏蔽一些敏感的栏位，不让他显示给用户\r\n	    b>、缺点（性能差、增加数据库的复杂度）：\r\n		1、性能差：\r\n			如果视图做一个简单的查询也需要关联多张表\r\n		2、增加数据库的复杂度：\r\n\r\n	 2、事务的ACID特性（原子性、一致性、隔离性、持久性）：\r\n		a>、原子性：语句不可分割，要么一起执行，要么一起不执行；\r\n		b>、一致性：数据库总是从一个一致性转换为另一个一致性；\r\n		c>、隔离性：一个事务所做的修改在最终提交之前，对其他事务是不可见的；（Serializable，Repeatable read, Read commit，Read uncommit）\r\n		d>、持久性：一旦事务提交，则其所做的修改会永久保存在数据库中\r\n\r\n	3、谈谈你对索引的认识：\r\n		1、索引最主要解决的问题：当数据量较大时，且这些数据不需要经常修改，使用索引来加快查询速度；\r\n		2、对于比较数据较少的表，查询开销不会太大，也没有必要建立另外的索引；\r\n		3、建立太多的索引将会影响更新和插入的速度，因为他需要同时更新每个索引文件\r\n		4、对于一个经常需要更新和插入的表格，就没有必要为很少使用的where字句单独创建索引；\r\n		5、建立索引会占用磁盘。\r\n	6、模糊查询防注入（一般查询条件由用户传过来）\r\n		query_name = input(\"请输入要查询的商品名称\")\r\n	   	 # 自己手动拼接sql语句\r\n	    	sql = \"select * from goods WHERE name like %s\"  # %笔记本%\r\n	    	# 通过游标执行sql语句\r\n	    	# return Number of affected rows  影响的行数　\r\n	    	# params = [query_name]\r\n	    	params = [\'%%%s%%\' % query_name]  # %笔记本%   % 需要转义\r\n	    	rows_affect = cur.execute(sql, params)\r\n\r\n\r\n# 七、注意：\r\n	1、group by 接多个字段只需用逗号隔开；\r\n	2、含有非聚合函数的栏位就要加在group by 后面；\r\n	3、子查询作为表，要取别名；\r\n	4、复杂查询：先把显示的项标出来，多做几个子查询；\r\n	5、操作：如何操作+对什么类型（table、view、index等）操作+要操作对象的名称','/static/blog/img/mysql.jpg','2017-10-20 19:38:04.406381','2017-10-20 19:38:04.406381',15,'mysql',1,6),(10,'flask视图和路由','Flask简介虚拟环境路由的各种定义方式正则路由转换器请求参数状态保持上下文Flask-Script....','# 一、创建python3虚拟环境\r\n\r\n	查看虚拟环境的命令 :\r\n	    workon 回车\r\n\r\n	创建python3虚拟环境的命令 :\r\n	    mkvirtualenv -p python3 虚拟环境名称\r\n\r\n	例如：\r\n	    mkvirtualenv -p python3 py3_flask08\r\n\r\n	使用某个虚拟环境 workon 虚拟环境名称\r\n	    workon 虚拟环境名称\r\n\r\n	退出虚拟环境\r\n	    deactivate\r\n\r\n	删除虚拟环境\r\n	    rmvirtualenv 虚拟环境名称\r\n\r\n# 二、基本流程(每一个视图函数都要有返回值):\r\n    1、创建项目:终端下，在某个虚拟环境下which python， 查看当前虚拟环境所在路径\r\n            (py3_flask08) python@ubuntu:~$ which python\r\n            /home/python/.virtualenvs/py3_flask08/bin/python\r\n\r\n            解释器环境选择的路径就是上面这个路径\r\n\r\n    2、函数书写流程: 导包(Flask)--->创建Flask对象(app)---->配置参数(class Config())---> 创建视图函数:@app.route(\"/index/<int:user_id>\",methods=[\"POST\", \"GET\"]))--->通过app.run()启动程序\r\n\r\n    3、记录了所有url地址和视图函数的对应关系:\r\n        print(app.url_map)\r\n\r\n    4、在装饰器上通过methods(methods=[\"POST\", \"GET\"])参数添加浏览器可以通过什么方式访问\r\n\r\n    5、通过<>浏览器可以将要发送的参数发送到服务器,加在url里面,而且被装饰的函数必须要有这个参数同名的参数,如(user_id在函数里面可以直接使用):\r\n                                        @app.route(\"user/<int:user_id>\")\r\n                                        def user(user_id):\r\n                                            pass\r\n\r\n    6、重定向url_for(\"函数名\")（通过查找函数名重定向另一个网页）：\r\n        重定向到自己的路由函数,传进来的参数名(要赋值)和路由函数的参数名要一样,如：\r\n            @app.route(\"user/<int:user_id>\")\r\n            def user(user_id):\r\n                pass\r\n\r\n            @app.route(\"register\", methods=[\"POST\",\"GET\"])\r\n            def register():\r\n                //用户请求register的时候，重定向到本框架的另外一个视图函数中\r\n                return redirect(url_for(\"user\", user_id=999)) 		//定位到一个函数执行    \r\n\r\n        总结：user_id:要和被装饰的函数形参名一样;重定向到自己的路由函数,传进来的参数名(要赋值)也要一样;多个参数名字也要一样,和顺序无关\r\n\r\n     7、路由转换器：可以通过对传如的参数进行格式化要求来规定响应的格式\r\n            导包\r\n            通过继承基础转换器(BaseConverter)创建自己的转换器类\r\n            将自己的转换器添加到url_map.converters[\"别名\"]=自己的转换器类\r\n                    导入BaseConverter这个类\r\n                        from werkzeug.routing import BaseConverter\r\n\r\n                    自定义路由转换器\r\n                        class RegexConverter(BaseConverter):\r\n                            记录了url地址中提取参数的正则(匹配规则)\r\n                            def __init__(self, map, regex1)\r\n                                super().__init__(map)\r\n                                self.regex = regex1\r\n\r\n                    添加路由转换器\r\n                        app.url_map.converters[\"re\"] = RegexConverter\r\n\r\n                    书写路由参数\r\n                        @app.route(\"/user/<re(r\'\\d{4}\'):user_id>\")\r\n\r\n    7、异常捕获:@app.errorhandler(状态码(404)或错误类型(ZeroDivisionError)),被装饰的函数必须有一个参数,自动接收错误描述,如：\r\n                            按错误码捕获异常\r\n                            @app.errorhandler(404)\r\n                            def page_not_found(e):\r\n                                return \"好看的404页面:%s\" % e\r\n\r\n                            按异常信息捕获异常\r\n                            @app.errorhandler(ZeroDivisionError)\r\n                            def zero_division_error(e):\r\n                                return \"除数不能为0:%s\" % e\r\n\r\n    8、jsonify(dict1):将字典转换为json','/static/blog/img/flask.jpg','2017-12-15 20:46:11.969648','2017-12-15 22:49:11.969648',12,'view',1,5),(11,'flask的jinjia2','基本使用过滤器&自定义过滤器控制代码块模板代码复用Flask 的模板中特有变量和方法CSRF...','# 一、jinja2模板特殊函数\r\n    (1)url_for(\'函数名\')\r\n        <p><a href=\"/demo\">点我跳转到demo</a></p>    访问方式:   域名/demo\r\n        <p><a href=\"{{ url_for(\'demo2\') }}\">点我跳转到demo2</a></p>  访问方式:   通过函数名重定向\r\n\r\n    (2)get_flashed_messages()  获取闪现消息,与python文件中的flash(\"\")结合使用,每次访问都会被清空\r\n\r\n        {% for i in get_flashed_messages() %}\r\n            {{ i }}<br/>\r\n        {% endfor %}\r\n        记得添加app.secret_key = \"@@$#%$%$@%$%T$%\"\r\n\r\n# 二、CSRF跨站请求伪造防护\r\n\r\n    import os, base64\r\n    def csrf_token():\r\n        \"\"\"得到一随机的48个长度的字符串\"\"\"\r\n        return base64.b64encode(os.urandom(48)).decode()\r\n    域名相同:\r\n        return render_template(\"transform.html\", csrf_token=token:要发送到网页中的参数)\r\n    域名不同:\r\n        return redirect(url_for(\"函数名\",后面确定用户类型的参数值))\r\n        # 通过cookie里面session的id来查找这个session,不是在服务器中直接拿,每次访问cookie都会被发送到服务器\r\n\r\n# 三、SQL-Alchemy扩展-安装和配置(导包－－>建立获取配置参数－－>创建数据库对象:db = SQLAlchemy(app))\r\n\r\n    安装flask-sqlalchemy：   pip install flask-sqlalchemy\r\n    安装 mysqldb 驱动：  pip install flask-mysqldb\r\n    (1)类对应表：\r\n        class Role(db.Model):\r\n            __tablename__ = \"roles\"   # 设置表名，不设置的时候默认为类名小写\r\n\r\n            # 列名 = db.Column()\r\n            # db.Integer说明字段是一个整数类型, primary_key=True设置主键，主键默认自动增加\r\n            id = db.Column(db.Integer, primary_key=True)\r\n\r\n        创建app下所有类对应的表： db.create_all()\r\n        删除app下所有类对应的表 db.drop_all()\r\n\r\n    (2)对象为一行数据：\r\n        增加(add):db.session.add()\r\n        删除(delete):db.session.delete()\r\n        提交(commit):db.session.commit()\r\n\r\n        # 增：在Role类对应的表中增加一条记录：\r\n            from test_1 import Role, db\r\n            role_obj = Role(name=\'admin\')\r\n            db.session.add(role_obj)\r\n            db.session.commit()\r\n\r\n        # 改：修改表中某个数据\r\n            from test_1 import Role, db\r\n            role_obj = Role.query.get(1)   # 查找到roles表中id为１的记录\r\n            role_obj.name = \"user\"\r\n            db.session.commit()\r\n\r\n        # 删：删除表中某条记录\r\n            from test_1 import Role, db\r\n            role_obj = Role.query.get(1)\r\n            db.session.delete(role_obj)\r\n            db.session.commit()','/static/blog/img/flask.jpg','2018-02-28 21:52:37.303435','2018-02-28 21:52:37.303435',2,'jinjia2',1,5),(12,'Flask-SQLAlchemy','使用数据库综合案例演练数据库迁移...','# 一、数据库\r\n	(1)一对多:\r\n	a>在一的一方添加(通过role_obj.users查找该角色的用户):\r\n	    users = db.relationship(\"User\", backref=\"role\"),第一个参数是多的一方类名,第二个参数是多的一方对象.xxx,它的值就是xxx\r\n	b>通过对方找:先找到角色,再找出为此角色的所有用户\r\n\r\n	(2)多对多\r\n	a>添加一张关系表:\r\n	    db_student_course = db.Table(\r\n	        \"db_student_course\",   # 表名\r\n	        db.Column(\"student_id\", db.Integer, db.ForeignKey(\"students.id\")),\r\n	        db.Colman(\"course_id\", db.Integer, db.ForeignKey(\"courses.id\"))\r\n	        )\r\n	b>随便添加到哪一方:\r\n	    courses = db.relationship(\"Course\", backref=\"students\", secondary=db_student_course)\r\n\r\n	(3)数据库迁移(结合flask_script):\r\n	a>流程:\r\n	    # 将Migrate和app、db绑定\r\n	    Migrate(app, db)\r\n	    # 添加db这个命令用于数据库迁移\r\n	    manage.add_command(\"db\", MigrateCommand)\r\n	b>各个指令:\r\n	    python manage.py db init                    数据库初始化,生成一个迁移文件夹\r\n	    python manage.py db migrate -m \'版本描述\'    生成迁移文件,并在目标数据库中创建表alembic_version\r\n	    python manage.py db upgrade                 根据迁移文件中的upgrade生成数据库中的表(更改表alembic_version记录当前数据库的版本)\r\n	    python manage.py db history                 查看历史版本\r\n	    python manage.py db current                 查看当前的版本号\r\n\r\n# 二、蓝图(from . import news_blue 从本包中导入蓝图对象)\r\n    a>流程:\r\n        在__init__.py文件中创建蓝图对象users_blu = Blueprint(\"users\", __name__)(user只是蓝图名称可以随便取名)--->在view.py中导入蓝图对像创建蓝图路由--->在__init__()文件中导入view.py(要写在生成蓝图对象的代码后,因为调用要在生成之后)--->在main.py中注册蓝图对象:app.register_blueprint(news_blu)\r\n    b>几个重要的参数:\r\n        template_folder = \"templates\"   在templates文件夹中查找模板文件, render_template(\"index.html\")\r\n        static_folder = \"static\"    在static文件夹下查找静态文件\r\n        static_url_path = \"/user\"   指定访问静态文件的前缀,如: 127.0.0.1/user/a.jpg\r\n        以上三个必须要有\r\n        url_prefix = \"/aa\"  模块中的统一前缀\r\n\r\n# 三、单元测试(assert 判断条件, 条件错误时返回的信息)\r\n    a>流程: 继承unittest.TestCase创建测试类--->书写setup函数,测试函数启动前进行初始化(app.testing=True)--->书写tearDown函数,在每个测试函数结束后都会调用这个函数--->创建测试函数,函数名以test_开头\r\n    b>可选中执行的区域','/static/blog/img/SQLAlchemy.png','2018-04-15 16:57:03.112980','2018-04-15 16:57:03.112980',7,'Flask-SQLAlchemy',1,5),(13,'django框架知识点总结','django框架知识点总结.......','# 一.创建项目：\r\n	django-admin startproject 项目名\r\n\r\n# 二.创建应用：\r\n	python manage.py startapp 应用名\r\n\r\n# 四.URL配置:\r\n	url(r\'^\', include(\'cart.urls\')): 项目同名下的\r\n	url(r\'^index/$\', views.index)： 应用下的\r\n	1.未命名参数（位置参数）： 按定义的顺序传递,匹配成功就传入到视图函数\r\n\r\n		 # 在项目下的 urls.py 文件中配置\r\n		 url(r\'^news/(\\d+)/(\\d+)$\', users.views.news),\r\n\r\n		 # 在 users/views.py 中定义\r\n		 def news(request, a, b):\r\n		     return HttpResponse(\"显示新闻：%s %s\" % (a,b)\r\n\r\n	2.命名参数（关键字参数）： 按定义的组名传递\r\n\r\n		 # 在项目下的 urls.py 文件中配置\r\n		 url(r\'^news/(?P<category>\\d+)/(?P<page>\\d+)$\', users.views.news),\r\n\r\n		 # 在 users/views.py 中定义\r\n		 def news(request, category, page):\r\n		     return HttpResponse(\"显示新闻：%s %s\" % (category, page)\r\n\r\n# 五.请求与响应:\r\n	1.request对象(最后用.get()获取数据)：\r\n		(1).user:\r\n			已登录：AbstractUser对象；未登录：AnonymousUser对象；request.user.is_authenticated()为true表示已登录.\r\n		(2).GET:\r\n			类似字典的QueryDict对象，包含url中所有的查询字符串参数.\r\n		(3).POST:\r\n			类似字典的QueryDict对象(一个键可以保存多个值)，包含POST请求的所有键值对参数.\r\n		(4).FILES:\r\n			类似于字典的对象，包含所有上传的文件.\r\n		(5).body:\r\n			获取原始的请求体数据，获取到的数据为bytes类型，非标单数据JSON、XML.\r\n		(6).META:\r\n			python的字典类型，封装了请求头headers中的数据\r\n			- REMOTE_ADDR:客户端的IP地址\r\n			注意：对于用户添加到请求头中的键值，Django会给键加上前缀HTTP_再转换成大写，再把键值保存到request.META中\r\n		(7).COOKIES:\r\n			一个标准的python字典，包含所有的cookies，键和值都是字符串.\r\n		(8).session:\r\n			可读可写的类似字典的对象： django.contrib.sessions.backends.db.SessionStore。\r\n			Django 提供了 session 模块，默认就会开启用来保存 session 数据\r\n\r\n	2.QueryDict对象：\r\n		(1).get()方法：\r\n			- 根据键获取值\r\n			- 如果一个键有多个值，将获取最后一个值\r\n			- 如果键不存在则返回None值，可以设置返回自定义的默认值\r\n				dict.get(\'键\'，默认值)\r\n		(2).getlist()方法：\r\n			- 根据键获取多个值，值一列表返回\r\n			- 如果键不存在则返回空列表\r\n				dict.getlist(\'键\', 默认值)\r\n\r\n	3.response:HttpResponse(content=响应体, content_type=响应体数据MIME类型, status=状态码)\r\n		- 视图必须返回一个 HttpResponse 对象（或其子类对象），不能像Flask一样直接返回字符串\r\n		- 可以将要返回的字符串数据传给 HttpResponse 对象再返回\r\n		- HttpRequest对象由Django创建，HttpResponse对象由开发人员创建\r\n		(1).响应头设置：\r\n			response = HttpResponse(\'响应内容\')\r\n 			response[\'Itcast\'] = \'Python\' \r\n 		(2).JsonResponse\r\n 			- 传入字典：\r\n 				return JsonResponse({\'name\': \'Jack\', \'age\': 20})\r\n 			- 传入非字典：\r\n 				return JsonResponse([{\'name\': \'Jack\'},{\'name\': \'Lucy\'}], safe=False)\r\n 		(3).redirect重定向:\r\n 			# 重定向到首页\r\n      		return redirect(\'/index\')\r\n\r\n    4.Cookie:\r\n    	(1).设置Cookie：\r\n    		response.set_cookie(\'键\',\'值\',max_age)\r\n    	(2).读取Cookie\r\n    		request.COOKIES.get(\'键\')\r\n\r\n    5.Session:\r\n    	i:session数据默认保存在django项目的一张数据库表中(表名为：django_session)\r\n		ii:在保存session数据库前，需要先生成django项目默认的数据库表;\r\n		iii:如何生成： 打开终端，并进入到项目根目录下，再执行以下2个命令生成数据库表：\r\n			python manage.py makemigrations\r\n			python manage.py migrate\r\n		(1).生成session数据：\r\n			request.session[\'键\'] = 值\r\n		(2).读取sessiion数据:\r\n			request.session.get(\'键\',\'默认值\')\r\n		(3).删除命令:\r\n			# 删除一个sessoin键值对（注意：键不存在会报错 `KeyError`）\r\n			del request.session[\'键\']\r\n		(4).设置session数据有效时间；如果不设置，默认过期时间为两周:\r\n			request.session.set_expiry(value)\r\n			- 如果value是一个整数，则 session数据 将在value秒没有活动后过期\r\n			- 如果value为0，则 session数据 将在用户 关闭浏览器时过期\r\n			- 如果value为None，则 session数据 将在 2周后过期\r\n\r\n# 六.类视图：\r\n	1.继承Django提供的View类,请求方式对应类方法\r\n	2.注册路由：url(r\'^post2$\', views.PostView.as_view())\r\n	3.给类视图添加装饰器：check_ip\r\n		（1） 给类视图的特定的方法添加装饰器：\r\n\r\n			class PostView(View):\r\n\r\n			    def get(self, request):\r\n			        return render(request, \'post2.html\')\r\n\r\n			    @method_decorator(check_ip)\r\n			    def post(self, request):\r\n			        return HttpResponse(\'处理发帖操作\')\r\n		（2）给类视图的所有方法应用装饰器：\r\n\r\n			class PostView(View):\r\n\r\n			    @method_decorator(check_ip)\r\n			    def dispatch(self, request, *args, **kwargs):\r\n			        return super().dispatch(request, *args, **kwargs)\r\n\r\n			    def get(self, request):\r\n			        return render(request, \'post2.html\')\r\n\r\n# 七.中间件:\r\n	1.定义中间件类： 通过继承Django的MiddlewareMixin扩展类实现，可以重写以下两个核心方法：\r\n	方法名										作用	返回值			备注\r\n	process_request(self, request)				在视图执行之前调用	返回 `None`: 会执行视图;返回 `HttpResponse`: 不会再执行视图\r\n	process_response(self, request, response)	在视图执行完之后调用	必须返回HttpResponse对象\r\n\r\n\r\n	2.在settings.py 文件中添加注册中间件\r\n\r\n# 八.模板:\r\n	模板渲染:\r\n	from django.template import loader\r\n	def index(request):\r\n		context = {\'name\': \'django\' }\r\n		# 获取模板对象\r\n		template = loader.get_template(\'index.html\')\r\n		# 渲染得到字符串\r\n		html_str = template.render(context)\r\n		# 响应请求\r\n		return HttpResponse(html_str)\r\n\r\n# 九.数据库(继承:models.Model):\r\n	1.生成迁移文件: \r\n		python manage.py makemigrations\r\n\r\n	2.生成数据表:\r\n		python manage.py migrate\r\n\r\n	3.在与项目同名包下的__init__()文件中，初始化mysql驱动：\r\n		import pymysql\r\n		pymysql.install_as_MySQLdb()\r\n\r\n	4.关联属性on_delete选项的取值:\r\n		(1)models.CASCADE 此为默认值，级联删除，会删除关联数据:\r\n			department = models.ForeignKey(\'Department\',on_delete=models.CASCADE)\r\n		(2)models.PROTECT 只要存在关联数据就不能删除:\r\n			department = models.ForeignKey(\'Department\', on_delete=models.PROTECT)\r\n		(3)models.SET_NULL 删除数据后关联字段设置为NULL，仅在该字段允许为null时可用（null=True）:\r\n			department = models.ForeignKey(\'Department\',on_delete=models.SET_NULL)\r\n\r\n	5.代码参考：\r\n		class Employee(models.Model):\r\n		    \"\"\"员工类\"\"\"\r\n\r\n		    choices_gender = (\r\n		        (0, \'男\'),\r\n		        (1, \'女\'),\r\n		    )\r\n\r\n		    name = models.CharField(max_length=20)\r\n		    age = models.IntegerField()\r\n		    gender = models.IntegerField(default=0, choices=choices_gender)\r\n		    # 工资：浮点类型（必须要指定两个选项）  999999.99\r\n		    salary = models.DecimalField(max_digits=8, decimal_places=2)\r\n		    # 备注信息: 可以为空\r\n		    comment = models.CharField(max_length=300, null=True, blank=True)\r\n		    # 员工入职时间\r\n		    hire_date = models.DateField(auto_now_add=True)\r\n		    # 一对多的外键：员工所属部门 department_id\r\n		    department = models.ForeignKey(\'Department\')\r\n\r\n		    def __str__(self):\r\n		        return self.name\r\n\r\n		    class Meta: \r\n		        # 指定表名\r\n		        db_table = \'employee\'\r\n\r\n	6.增删改(filter查询出来才能后接删除更新操作):\r\n		(1).增：\r\n			1.模型类.objects.create(属性1=值1，属性2=值2, ...)：\r\n				Department.objects.create(\r\n					name=\'后勤部\',\r\n					create_date=\'2017-1-1\'\r\n				）\r\n			2.模型类对象.save()：\r\n				d = Department()\r\n				d.name = \'人事部\'\r\n				d.create_date = \'2017-1-1\'\r\n				d.save()\r\n		(2).删：\r\n			1.模型类对象.delete()：\r\n				 d = Department.objects.get(id=1)\r\n				 d.delete()\r\n\r\n			2.模型类.filter(条件).delete()：\r\n				Department.objects.filter(id=1).delete()\r\n			\r\n		(3).改：\r\n			1.模型类对象.save()：\r\n				d = Department.objects.get(id=1)\r\n				d.name = \'人事部\'\r\n				d.save()\r\n			\r\n			2.模型类.filter(条件).update(属性1=值1，属性2=值2， ...):\r\n				Department.objects.filter(id=1).update(name=\'人事部\')\r\n\r\n	7.查询:\r\n		(1)条件查询(filter):\r\n			1.模糊查询： contains / endswith / startswith:\r\n				查询名字包含\'马\'的员工:\r\n					Employee.object.filter(name__contains=\'马\')\r\n			2.空查询： isnull\r\n				查询备注信息不为空的员工：\r\n					Employee.objects.filter(comment__isnull=False)\r\n			3.范围查询: in\r\n				查询id编号为1或3或5的员工:\r\n					Employee.objects.filter(id__in=[1,3,5])\r\n			4.比较查询: gt(greater than)、lt(less than)、gte、lte\r\n				查询age大于等于30的员工:\r\n					Employee.objects.filter(age__gte=30)\r\n			5.日期查询： year、month、day、week_day、hour、minute、second\r\n				查询2015年入职的员工:\r\n					Employee.objects.filter(hire_date__year=2015)\r\n				查询2014年1月1日后入职的员工\r\n					Employee.objects.filter(hire_date__gte=\'2014-1-1\')\r\n\r\n		(2)exclude方法:\r\n			查询id不为3的员工\r\n				Employee.objects.exclude(id=3)\r\n\r\n		(3)F对象:两个属性之间的比较\r\n			查询年龄大于id的员工信息：\r\n				Employee.objects.filter(age__gt=F(\'id\'))\r\n\r\n		(4).Q对象(& | ~)\r\n			查询id大于3且年龄大于30的员工信息:\r\n				Employee.objects.filter(id__gt=3, age__gt=30)\r\n			查询id大于3或者年龄大于30的员工信息:\r\n				Employee.objects.filter(Q(id__gt=3)|Q(age__gt=30))\r\n			查询id不等于3员工信息:\r\n				Employee.objects.filter(~Q(id=3))\r\n\r\n		(5).排序order_by：\r\n			升序： 模型类.objects.order_by(\'属性名\')\r\n			降序： 模型类.objects.order_by(\'-属性名\')\r\n			把id大于8的员工信息, 按年龄从大到小排序显示：\r\n				Employee.objects.filter(id__gt=8).order_by(\'-age\')\r\n\r\n		(6).aggregate 方法:\r\n		用法： 模型类.objects.aggregate（聚合类（\'属性名\'））\r\n		常用聚合类有：Sum, Count, Max, Min, Avg等\r\n		查询所有员工的平均工资:\r\n			Employee.objects.aggregate(AVG(\'salary\'))\r\n\r\n		(7).关联查询\r\n		有关联属性（多对一查询）： 模型类对象.关联属性\r\n		没有关联属性（一对多查询）：模型类对象.关联模型\r\n		查询 “研发部” 的所有员工:\r\n			d = Department.objects.get(name=\'研发部\')\r\n			d.employee_set.all()\r\n		查询 “赵小二” 所属的部门信息:\r\n			e = Employee.objects.get(name=\'赵小二\')\r\n			e.department()\r\n\r\n	8.查询集 QuerySet:\r\n		1.概念:当调用模型管理器的 all, filter, exclude, order_by等方法时，返回的是一个 QuerySet 对象，表示从数据库查询到的数据集合；\r\n		2. 支持 下标 和 切片 操作:\r\n			query_set[0]：取出查询集中的第一条数据，不存在会抛IndexError异常\r\n			query_set[0：2]：切片操作得到另一个新的QuerySet\r\n			注意：下标不能为负数\r\n		3.查询集两大特性\r\n			(1). 惰性查询\r\n				创建查询集时不会访问数据库，操作查询集中的数据时才会访问；\r\n			(2).缓存功能\r\n				当遍历（迭代）访问查询集 所有数据，会缓存查询集所有数据，当再次操作该查询集中的数据时，将会使用缓存；但如果只是访问查询集 部分数据（下标或切片）不会缓存\r\n				 # 创建查询集\r\n				 query_set = Department.objects.all()\r\n				 # 会查询数据库\r\n				 [dep.name for dep in query_set]\r\n				 # 使用缓存，不再查数据库\r\n				 [dep.name for dep in query_set]\r\n\r\n# 十.admin站点\r\n	(1).注册模型类：在应用下的admin.py中注册模型类，注册后才会在管理后台显示:\r\n		admin.site.register(Department)\r\n\r\n	(2).自定义列表页展示\r\n		1. 定义显示哪些字段:\r\n			# users/admin.py:\r\n			class EmployeeAdmin(admin.ModelAdmin):\r\n			    # 指定要显示的属性\r\n			    list_display = [\"id\", \"name\", \"age\", \"gender\", \"comment\", \"department\"]\r\n			# 参数2： 注册Admin类\r\n			admin.site.register(Employee, EmployeeAdmin)\r\n		2. 修改表头显示的名字:\r\n			在定义模型类的类属性时，使用 verbose_name 选项来指定在后台的字段显示\r\n		3. 定义每页显示多少条：\r\n			users/admin.py:\r\n			class EmployeeAdmin(admin.ModelAdmin):\r\n			    ...\r\n			    list_per_page = 5  # 每页显示5条，默认为100\r\n		4.显示或隐藏操作栏：\r\n			# users/admin.py\r\n			class DepartmentAdmin(admin.ModelAdmin):\r\n			    ...\r\n			    # 显示顶部操作栏\r\n			    actions_on_top = True\r\n			    # 显示底部操作栏\r\n			    actions_on_bottom = True\r\n		5. 显示过滤器栏：\r\n			# users/admin.py\r\n			class EmployeeAdmin(admin.ModelAdmin):\r\n			    ...\r\n			    # 显示过滤栏: 按性别和部门过滤\r\n			    list_filter = [\'gender\', \'department\']\r\n	    6.显示搜索栏\r\n	    	# users/models.py\r\n			class DepartmentAdmin(admin.ModelAdmin):\r\n			    ...\r\n			    # 搜索部门名称\r\n			    search_fields = [\'name\']','/static/blog/img/django.png','2018-05-17 22:08:26.352602','2018-05-17 22:08:26.352602',1,'django',1,4),(14,'drf知识点总结','drf知识点总结...','# 安装DRF\r\n	pip install djangorestframework\r\n\r\n	在settings中注册\r\n	INSTALLED_APPS = [\r\n	    \'rest_framework\',\r\n	]\r\n	\"\"\"\r\n	1.Serializer(instance=None, data=empty, **kwarg),通过传入data(反序列化)数据(字典),instance传入对象进行序列化,两个都传表示修改对象;\r\n	2.序列化对象.save()自动触发create()或update():返回值作为反序列化使用\r\n	3.序列化对象.date:序列化后的数据,只跟序列化器有关;序列化对象.validated_data符合要求的数据\r\n	4.request.data来自客户端的json数据，框架调用parse函数将数据转换为字典\r\n	5.s.is_valid()调用校验方法对数据进行校验\r\n	6.定义的栏位会自动接收从前端=>视图传过来的参数，且栏位名称要和前端传过来的一样\r\n	7.数据库表包含那些字段和序列化返回那些字段无关\r\n	8.序列化器中的Create方法，由序列化器对象.save()调用，Create方法的返回值作为 序列化器对象.save() 的返回值\r\n	9.视图中的Create方法由post请求调用，序列化器的Create方法中会调用save方法\r\n	\"\"\"\r\n\r\n# 一.序列化器(针对模型类)\r\n	(1).通过继承rest_framework.serializers.Serializer来定义序列化器;定义和模型类的定义类似,不过模型类的字段models.IntegerField(),而序列化器为serializers.IntegerField()\r\n\r\n	(2).通过继承serializers.ModelSerializer,那么字段都不用定义了,通过元类Meta指定模型类:\r\n	  所有:\r\n	  class Meta:\r\n	    # 1. 返回关联对象的主键\r\n	    department = PrimaryKeyRelatedField(read_only=True)\r\n	    model = Department      # 指定模型类\r\n	    fields = \'__all__\'      # 指定要序列化哪些栏位(可以是模型类中的字段，也可以模型类中没有的但需要校验的属性（加上write_only=True），比如：短信验证码，确认密码)\r\n	    read_only_fields = (\'id\', \'create_date\')  # 这些字段不能修改\r\n	    extra_kwargs = {\r\n	        \'name\': {\'min_length\': 5, \'max_length\': 20},\r\n	        \'age\': {\'min_value\': 1, \'max_value\': 200},\r\n	    }\r\n\r\n	  指定(元组):\r\n	  class DepartmentSerializer2(serializers.ModelSerializer):\r\n	    class Meta:\r\n	        model = Department\r\n	        fields = (\'id\', \'name\')\r\n\r\n	  排除:\r\n	  class DepartmentSerializer2(serializers.ModelSerializer):\r\n	    class Meta:\r\n	        model = Department\r\n	        exclude = (\'is_delete\',)\r\n\r\n\r\n# 二.序列化的使用(传入对象为序列化)\r\n	(1).基本使用(list、retrieve)\r\n	    传入模型类对象(如果要序列化的是包含多条数据的QuerySet，则需要指定many=True)来创建模型化器对象(serializer)-->通过data属性获得序列化后的结果(serializer.data)\r\n\r\n	(2).关联对象序列化(多个对象加入many=True)\r\n	    第1种:返回关联对象的主键(必须包含read_only=True或者queryset参数)\r\n	        在序列化其中加入:department = serializers.PrimaryKeyRelatedField(label=\'所属部门\', read_only=True)\r\n	    第2种：返回关联对象的 字符串表示方式，即__str__方法的返回值\r\n	        在序列化器中加入:department = serializers.StringRelatedField(label=\'所属部门\')\r\n	    第3种：返回关联对象序列化器定义的所有属性\r\n	        在对应序列化器中加入一个新的序列化器(包含要显示的字段):department = DepartmentSerializer(label=\'所属部门\')\r\n\r\n# 三.反序列化的使用(传入request.data为反序列化)\r\n	(1).通过调用is_valid(raise_exception=True)方法,自动调用检验方法校验传入的数据;\r\n	(2).error属性:获取校验出错信息,字典类型;\r\n	(3).validated_data属性:校验通过得到的对象,为OrderedDict类型.\r\n\r\n# 四.参数校验的集中方式(序列化器对象.is_validate()自动调用)\r\n	(1).通过写在序列化器中定义validate_字段名:对单个字段进行校验,def validate_name(self, value)自动会将name字段传入value接收\r\n	(2).validate:同时对多个字段进行比较验证,def validate(self, attrs)自动会将序列化器中fields中的字段以字典的形式传入由attrs接收\r\n\r\n# 五.保存或修改数据(save(),create(),update())\r\n	(1).新增(只传入了data数据)\r\n	    my_dict = {\'name\': \'研发部xx\', \'create_date\': \'2018-1-1\'}\r\n	    s = DepartmentSerializer(data=my_dict)\r\n	    s.save()\r\n\r\n	(2).修改(同时传入了模型类对象和data)\r\n	    department = Department.objects.get(id=1)\r\n	    my_dict = {\'name\': \'研发部xx\', \'create_date\': \'2018-1-1\'}\r\n	    s = DepartmentSerializer(instance=department, data=my_dict)\r\n	    s.save()\r\n\r\n	(3).部分修改:传入partial=True\r\n\r\n	(4).继承serializers.Serializer需要重写create和update方法(都要返回创建或修改好的对象)\r\n\r\n# 五.视图(调用序列化器不需要传入参数，除了APIView要传入对应参数外，其他只要指定就好序列化器、查询集)\r\n	\"\"\"\r\n	1.校验函数的调用也封装了(Minxin)\r\n		serializer = self.get_serializer(data=request.data)\r\n		serializer.is_valid(raise_exception=True)\r\n	2. 增加对象只需要指定序列化器就可以了,除了APIView其他指定序列化器都不需要传入参数\r\n	3.GenericAPIView只提供了属性(queryset、serializer_class)和方法(get_queryset(self)、get_serializer_class(self))，操作基本都有xxxModelMixin提供\r\n	\"\"\"\r\n	DRT用Response,Request;\r\n	request.data相当于request.POST, request.body和request.FILES组合;\r\n	request.query_params相当于request.GET\r\n\r\n	(1).APIView(和view类似,在类视图中根据请求方式定义不同的方法，传入参数进行处理)\r\n\r\n	(2).GenericAPIView(通常与五个扩展类结合使用)\r\n	 提供的关于序列化器使用的属性与方法\r\n	    1.serializer_class指明要使用的序列化器.\r\n	    2.get_serializer_class()返回序列化器类,默认返回serializer_class.\r\n	    3.get_serializer()获取序列化器对象\r\n\r\n	    4.queryset指明使用的数据查询集.\r\n	    5.get_queryset()返回查询集,默认返回queryset.\r\n	    6.get_object()根据pk来获取模型类对象\r\n\r\n# 六.GenericAPIView与五个扩展类的组合\r\n	ListModelMixin(list)\r\n	CreateModelMixin(create)\r\n	RetrieveModelMixin(retrieve)\r\n	UpdateModelMixin(update)\r\n	DestroyModelMixin(destroy)\r\n	继承相应的扩展类和GenericAPIView,在方法外面指定数据集和序列化器,返回相应的方法\r\n	class DepartmentListAPIView2(ListModelMixin, CreateModelMixin, GenericAPIView):\r\n\r\n	    queryset = Department.objects.all()\r\n	    serializer_class = DepartmentSerializer\r\n\r\n	    def get(self, request):\r\n	        # 调用ListModelMixin的方法,查询多条数据\r\n	        return self.list(request)\r\n\r\n# 七.其他子类视图\r\n    CreateAPIView\r\n    ListAPIView\r\n    RetrieveAPIView\r\n    DestroyAPIView\r\n    UpdateAPIView\r\n    继承相应的子类视图,只需指定查询集和序列化器就可以完成基本的增删改查\r\n\r\n# 八.视图集(将同一种查询方式放在同一个视图中):\r\n	(1).继承viewsets.ViewSet,定义list,retrieve方法\r\n\r\n	(2).继承GenericViewSet和五个扩展类其中一部分:\r\n	    1.视图类继承GenericViewSet和对应的扩展类,视图类中只需要指定queryset和serializer_class;\r\n	    2.自定义action方法:\r\n	    def latest(self, request):\r\n	        \"\"\"\r\n	        自定义action: 查询最新成立的部门\r\n	        \"\"\"\r\n	        department = Department.objects.latest(\'create_date\')\r\n	        serializer = self.get_serializer(department)\r\n	        return Response(serializer.data)\r\n\r\n	    def name(self, request, pk):\r\n	        \"\"\"\r\n	        自定义action: 修改部门名称\r\n	        \"\"\"\r\n	        dep = self.get_object()\r\n	        dep.name = request.data.get(\'name\')\r\n	        dep.save()\r\n	        serializer = self.get_serializer(dep)\r\n	        return Response(serializer.data)\r\n	    请求方式还是那些\r\n\r\n	(3).继承ModelViewSet默认实现五个接口\r\n\r\n	(4).视图集定义路由:\r\n	    router = SimpleRouter()\r\n	    #  参数1: 路由访问的前缀\r\n	    #  参数2: 视图集\r\n	    #  参数3: 路由名称的前缀, 可以不指定\r\n	    # ^departments/$            name: dep-list\r\n	    router.register(r\'depart2\', MyDepartmentViewSet2, base_name=\'dep\')  # 需要pk会默认传入\r\n	    router.register(r\'employee5\', MyEmployeeViewSet, base_name=\'emp\')  # 需要pk会默认传入\r\n\r\n	    urlpatterns += router.urls\r\n\r\n	    需要为自定义action方法添加一个装饰器 @action(methods=[\'get\'], detail=False)detail声明该action的路径是否与单一资源对应,才会自动生成路由:前缀/action方法名/','/static/blog/img/drf.png','2018-06-28 21:11:18.256901','2018-06-30 21:30:18.256901',8,'drf',1,4),(17,'redis数据库的使用','redis:非关系型数据库,由键值对构成,总共有16个数据库(0-15),是应用非常普遍的非关系型数据库,以下介绍redis的关键点.','# 一、服务端及客户端命令\r\n    (1)服务端启动命令(就是启动.conf文件) \r\n     sudo redis-server /etc/redis/redis.conf \r\n    (2)客户端启动(就是要连接到那个redis服务端) \r\n     redis-cli -h 127.0.0.1 -p 6397\r\n    \r\n     测试是否连接成功:\r\n         127.0.0.1:6379> ping\r\n         PONG\r\n\r\n# 二、redis数据库的操作\r\n    (1)公共方法: \r\n    >>查看本数据库中有多少个键(只有这个可以用正则): keys * \r\n    >>选择数据库:    select 10 \r\n    >>删除: del 键1 键2 \r\n    >>查看键的类型: type 键 \r\n    \r\n    (2)String \r\n    >>添加: set 键 值;  mset 键1 值1 键2 值2 \r\n    >>获取: get 键;     mget 键1 键2 \r\n    >>追加: append 键 值 \r\n    >>删除: del 键1 键2\r\n    \r\n    (3)hash(属性 值)>>>相当于键套键值对 \r\n    >>添加一个属性和值: hset 键 属性 值 \r\n    >>添加多个属性和值: hmset 键 属性1 值1 属性2 值2 \r\n    >>查看单个属性的值: hget 键 属性1 \r\n    >>查看多个属性的值: hmget 键 属性1 属性2 \r\n    >>查看所有属性的值: hvals 键 \r\n    >>查看键的所有属性: hkeys 键 \r\n    >>删除n个属性: hdel 键 属性1 属性2 \r\n    \r\n    (3)list \r\n    >>从左边插入数据(显示相反,没有的键就创建,有就添加不会覆盖原有的): lpush 键 值1 值2 值3 \r\n    >>从右边插入数据(显示相同,,没有的键就创建,有就添加不会覆盖原有的): rpush 键 值1 值2 值3 \r\n    >>从指定位置插入数据: linsert lst before c 999(从左往右找第一个c) \r\n    >>查看队列中的值: lrange lst 开始下标 结束下标  (首尾都包含)    查看所有 lrange lst 0 -1 \r\n    >>修改指定下标的值: lset set 0 hahaha \r\n    >>删除列表中的元素: lrem lst 2 b 从左往右开始数,删除两个b; lrem lst -2 b 从右往左数删除两个b; lrem lst 0 b 删除所有b \r\n    \r\n    (4)set(不重复,不可修改,无序) \r\n    >>创建: sadd names zhangsan lisi wangwu \r\n    >>查看: smembers names \r\n    >>删除某个: srem names zhangsan\r\n    \r\n    (5)zset(权重为序,越大越靠后) \r\n    >>添加: zadd names1 3 zhangsan 4 lisi 6 zhaoliu 5 wangwu \r\n    >>查看: zrange names1 0 -1;zrangebyscore name1 4 5 \r\n    >>查看某个值的权重: zscore names1 zhangsan \r\n    >>删除指定元素: zrem names zhangsan \r\n    >>删除指定权重范围内的(含前后): zremrangebyscore names 4 5\r\n\r\n# 三、Redis与Python交互(创建多个都是用字典做参数,查看所有键sr.keys(\"*\"))\r\n    # 导入：\r\n    from redis import StrictRedis\r\n    \r\n    \r\n    if __name__ == \"__main__\":\r\n        try:\r\n            # 创建redis链接对象\r\n            sr = StrictRedis(host=\'127.0.0.1\', port=6379, db=0, decode_responses=True)\r\n        except Exception as e:\r\n            print(e)\r\n\r\n# 四、主从配置(主服务器可读可写,从服务器只可读)\r\n    从服务器: 将配置文件中slaveof <主服务ip> <主服务port> 激活\r\n\r\n# 五、redis搭建集群(主服务器读写,从服务器备份,当主服务器宕机对应的从服务器补上)\r\n    (1)配置是注意修改服务器:IP和port \r\n    (2)启动服务端redis-cli -h 192.168.190.136 -p 7000 -c \r\n    (3)以下指令只是创建时运行,创建好了之后只要运行.conf文件就好了\r\n    redis-trib.rb create --replicas 1 192.168.190.136:7000 192.168.190.136:7001 192.168.190.136:7002 192.168.190.136:7003 192.168.190.136:7004 192.168.190.136:7005\r\n    (4)与python交互: \r\n    集群就是多了一个开始节点参数:\r\n    nodes = [{\"host\": \"192.168.190.136\", \"port\": 7002}]\r\n    \r\n    src = StrictRedisCluster(startup_nodes=nodes, decode_responses=True)','/static/blog/img/redis.jpg','2017-11-28 21:54:53.614553','2017-11-28 21:54:53.614553',9,'redis',1,6),(18,'git源码管理指令','git源码管理指令','git(暂存区-->本地仓库-->远程仓库): \r\n# 一、主要过程 \r\n    (1)在终端初始化: git init \r\n    (2)红色表示工作区: git add .  提交到暂存区 \r\n    (3)提交到本地仓库: git commit -m \'备注\' \r\n    (4)从远程仓库克隆(克隆后不需要初始化): git clone  地址 \r\n    (5)提交到远程仓库中: git push \r\n    (6)从远程仓库中获取: git pull,不成功 git push origin master\r\n\r\n# 二、其他命令: \r\n    (1)查看当前状态: git status \r\n    (2)查看git仓库区的历史记录: git log/reglog \r\n    (3)配置个人信息: git config user.name \'zhangsan\' \r\n                    git config user.email \'zhangsan@163.com\' \r\n    (4)将仓库区的版本回退: git reset --hard HEAD^ 或者 git reset --hard 版本号\r\n\r\n# 三、撤销命令 \r\n    (1)撤销工作区的代码: git checkout 文件名 \r\n    (2)撤销暂存区的代码分两步: \r\n                        a>git checkout HEAD 文件名 \r\n                        b>git checkout 文件名  \r\n\r\n# 四、git标签 \r\n    (1)为本地项目打标签: git tag -a 标签名 -m \'标签描述\' \r\n    (2)将标签推送到远程仓库: git push origin 标签名 \r\n    (3)删除本地标签 git tag -d 标签名 \r\n    (4)删除远程仓库标签 git push origin --delete tag 标签名\r\n\r\n# 五、git分支 \r\n    (1)查看分支: git branch \r\n    (2)创建并切换到dev分支: git checkout -b dev \r\n    (3)将分支推送到远程: git push -u origin dev \r\n    (4)克隆数据是会被完全克隆下来,但是可以通过git checkout 分支名,选择不同的分支\r\n\r\n# 六、记住用户名和密码的设置: \r\n    git config --global credential.helper cache   设置记住密码，默认15分钟后失效 \r\n    git config credential.helper \'cache --timeout=3600\'  设置记住密码，1小时后失效 \r\n    git config --global credential.helper store     长期存储密码','/static/blog/img/git.jpg','2018-03-25 18:06:37.958226','2018-03-25 18:06:37.958226',11,'git',1,2),(19,'MongoDB基础','MongoDB应用广泛的非关系型数据库...','# 一.MongoDB的优势\r\n	1.易扩展：数据之间无关系，这样就非常容易扩展\r\n	2.大量数据，高性能：NoSQL数据库具有非常高的读写性能，尤其在大数据量，同样表现优秀\r\n	3.灵活的数据模型：NoSQL无需事先为要存储的数据建立字段，随时可以存储自定义的数据格式.\r\n\r\n# 二.MongoDB（二进制的json）中的三要素 \r\n	1.数据库 \r\n	2.集合（相当于mysql中的表） \r\n	3.文档（相当于mysql中的一行数据）\r\n\r\n# 三.基本操作： \r\n	1.查看当前的数据库：db \r\n	2.查看所有的数据库：show dbs /show databases \r\n	3.切换数据库：use db_name \r\n		切换到没有的数据库, 添加数据会自动创建 \r\n	4.查看集合：show collections \r\n	5.删除当前的数据库：db.dropDatabase() \r\n	6.删除集合：db.集合名称.drop()\r\n\r\n# 四.增删改查 \r\n	1.db.stu.insert({name:\'gj\',gender:1}) \r\n	  db.stu.save({name:\'gj\',gender:1})： id重复不报错 \r\n	2.db.集合名称.remove(<query>,{justOne: <boolean>}) \r\n	3.db.集合名称.update(<query> ,<update>,{multi: <boolean>}) \r\n		(1).db.stu.update({name:\'hr\'},{name:\'mnc\'})更新一条，没有更新到的字段会被丢弃； \r\n		(2).db.stu.update({name:\'hr\'}, {$set:{name:\'hys\'}})更新一条数据的一个字段，其他字段不变 \r\n		(3).db.stu.update({name:\'hr\'}, {$set:{name:\'hys\'}}, {multi:true})更新全部 \r\n	4.db.stu.find()\r\n\r\n# 五.注意:在MongoDB中，数据库和集合都不用手动创建, 只要你使用了, 就会自动创建.\r\n\r\n# 六.db.集合名称.save(document)与db.集合名称.insert(document)区别：前者的文档id已存在则修改，不存在则添加；后者如果存在就会报错.','/static/blog/img/sMongoDB.jpg','2018-07-16 19:14:28.563631','2018-07-16 19:14:28.563631',5,'MongoDB',1,6),(20,'html与css知识点','html与css知识点...','# 一、常用标签\r\n    <!--注释的内容-->\r\n\r\n    <!--标题标签:6个级别-->\r\n    <h1>一级标题</h1>\r\n    <h2>二级标题</h2>\r\n    <h3>二级标题</h3>\r\n    <h6>六级标题</h6>\r\n    <!--常用标签-->\r\n    <p>段落标签p，用来存放一大段文字</p>\r\n    <div>做前端布局最最常用的标签，div里面可以放任意内容，任意标签</div>\r\n    <span>经常用来存放几个文字、小图片等</span>\r\n\r\n    <br>  换行符号\r\n\r\n# 二、常用的文字控制属性\r\n\r\n    color:red; 文字颜色\r\n    font-size:30px;  文字大小\r\n    font-family:\"宋体\"; 文字类型\r\n    font-weight:bold;  文字加粗\r\n    font-style:italic;  文字倾斜\r\n    text-decoration:underline;  设置下划线\r\n    line-height:26px;   设置行高\r\n    text-indent:2em;    首行缩进两个单位\r\n\r\n    三个去掉默认样式：\r\n    font-weight: normal;    文字不加粗\r\n    font-style: normal;     文字不倾斜\r\n    font-decoration: none;  文字没有下划线\r\n\r\n# 三、边框属性\r\n    四个方向的边框：边框粗细 实线/虚线 颜色\r\n    border: 5px solider/dash #000\r\n\r\n    四个方向设置边框：\r\n    border-top: 5px solider #000\r\n    border-left:\r\n    border-right:\r\n    border-bottom:\r\n\r\n# 四、列表标签\r\n	1、无序\r\n	    <ul>\r\n	        <li></li>\r\n	    </ul>\r\n\r\n	2、有序\r\n	    <ol>\r\n	        <li></li>\r\n	    <ol>\r\n\r\n	3、项目列表\r\n	    <dl>\r\n	        <dt></dt>\r\n	        <dd></dd>\r\n	        <dd></dd>\r\n	        <dd></dd>\r\n	    </dl>\r\n\r\n	在css中去掉默认样式（列表样式）：\r\n	    ul{\r\n	        list-style: none;\r\n	    }\r\n\r\n# 五、表单(写在表单内的元素才能提交到服务器)\r\n	1、表单区域：\r\n	    <form action=\"要提交到的地址\" method=\"post\"></form>\r\n\r\n	2、文本框：\r\n	    <input type=\"text\" placeholder=\"请输入用户名\">\r\n	    <input type=\"password\" placeholder=\"请输入密码\">\r\n\r\n	3、提交按钮\r\n	    <input type=\"submit\" value=\"注册\">\r\n\r\n	4、普通按钮\r\n	    <input type=\"button\" value=\"普通按钮\">\r\n\r\n	5、重置按钮\r\n	    <input type=\"reset\" value=\"重置\">\r\n\r\n	6、单选框\r\n	    <input type=\"radio\" name=\"sex\" id=\"man\"><label for=\"man\">男</label>\r\n	    注意： 1、要实现单选所有文本的name必须相同;\r\n	          2、要实现点字也能选,文本中必须有id属性,label中的for属性一定要等于id属性的值(文字写在label内);\r\n	          3、默认选中,文本中加上checked\r\n\r\n	7、下拉菜单:\r\n	    <select>\r\n	        <option value=\"北京\">北京</option>\r\n	        <option value=\"广州\" selected>广州</option>\r\n	    </select>\r\n\r\n	8、上传文件：\r\n	    <input type=\"file\">\r\n\r\n	9、文本域：\r\n	    <textarea><textarea>\r\n\r\n# 六、盒子实际尺寸的计算：width+padding+border\r\n    box-sizing:border-box:加上这个样式,盒子的尺寸就固定了\r\n\r\n# 七、文字居中\r\n    1、水平居中：text-align:center;\r\n    2、垂直居中：行高等于字体的大小;\r\n\r\n# 八、盒子水平居中：margin: 0 auto\r\n    margin-left给负值,盒子会向左偏移\r\n\r\n# 九、盒子隐藏与显示\r\n    display: none;   /*隐藏之后不占位*/\r\n    display: block;  /*对应的盒子显示*/\r\n\r\n# 十、盒子内容溢出处理\r\n    1、overflow:visible;默认值。会呈现在盒子之外;\r\n    2、overflow:hidden; 隐藏;\r\n    3、overflow:scroll; 有没有超出都有滚动条\r\n    4、overflow:auto;自调节滚动条\r\n\r\n# 十一、表格标签\r\n	 <!--table  表格整体标签-->\r\n	 <!--tr  行标签，一个tr表示一行-->\r\n	 <!--td  单元格标签，一个td表示一个单元格-->\r\n\r\n	    <table>\r\n	        <tr>\r\n	            <td>1-1</td>\r\n	            <td>1-2</td>\r\n	            <td>1-3</td>\r\n	        </tr>\r\n	        <tr>\r\n	            <td>2-1</td>\r\n	            <td>2-2</td>\r\n	            <td>2-3</td>\r\n	        </tr>\r\n	    </table>\r\n\r\n	    /*设置表格边框折叠*/\r\n	    border-collapse:collapse;\r\n\r\n	    table：大盒子要加边框(大小可调节)\r\n	    td:小盒子要加边框(撑满)\r\n\r\n	    td的标签属性(column列,row行)\r\n	    <td colspan=\"2\">1-1</td>  <!--理解成跨了两列，对应删除1-2-->\r\n	    <td rowspan=\"2\">1-3</td>  <!--理解成跨了两行，对应删除2-3-->\r\n\r\n# 十二、定位(要配合top、lef等方向属性来使用,子绝父相)\r\n	1、相对定位:position:relative;   以当前位置的左上角为起点(占位)\r\n\r\n	2、绝对定位:position:absolute;   以父级的左上角为起点(不占位)\r\n\r\n	3、固定定位:position:fixed;      以界面的左上角为起点(不占位)\r\n		定位居中：\r\n			position: fixed;\r\n		    right: 50%;\r\n		    top: 50%;\r\n		    width: 600px;\r\n		    height: 600px;\r\n		    margin-right: -300px;\r\n		    margin-top: -300px;\r\n		盒子居中：\r\n			margin: 0 auto;\r\n\r\n\r\n# 十三、css权重\r\n    权重：\r\n        标签选择器 < 类选择器< id选择器 < 行内样式','/static/blog/img/html+css.jpg','2017-09-01 12:06:43.911350','2017-09-01 12:06:43.911350',0,'htmlcss',1,3),(21,'ngnix + gunicorn + flask + mysql + redis部署','ngnix + gunicorn + flask + mysql + redis部署前后端分离项目...','# 前期准备\r\n    \r\n    选择云服务器:阿里云服务器 https://www.aliyun.com\r\n    注册云服务器账号，购买或者免费获取云服务器ECS\r\n    个人免费获取云服务器ECS     https://free.aliyun.com/\r\n    ！！注意：创建服务器选择ubuntu16.04 64位的操作系统\r\n\r\n\r\n# 一、从本地登录到远程ECS服务器\r\n\r\n	python@ubuntu:~$ ssh root@119.23.10.32    公网地址\r\n	(第一次访问的时候需要确认链接，键入 yes 就行)\r\n	root@119.23.10.32\'s password: 键入登录远程ECS服务器密码\r\n\r\n\r\n# 二、安装各种环境\r\n    现在你购买的这台服务器就像一台新电脑，需要安装各种环境、扩展包，才能跑我们的项目\r\n\r\n    先更新 apt 相关源\r\n        sudo apt-get update\r\n    mysql安装\r\n        apt-get install mysql-server\r\n        apt-get install libmysqlclient-dev\r\n    redis安装\r\n        sudo apt-get install redis-server\r\n    安装虚拟环境\r\n        pip install virtualenv\r\n            注意：如果虚拟环境安装报错 ：locale.Error: unsupported locale setting 执行指令 export LC_ALL=C\r\n        pip install virtualenvwrapper\r\n   \r\n    虚拟环境安装完毕之后  \r\n        vim ~/.bashrc    （在这个文件中最开始的地方写入下面三行）\r\n            export WORKON_HOME=$HOME/.virtualenvs\r\n            export PROJECT_HOME=$HOME/workspace\r\n            source /usr/local/bin/virtualenvwrapper.sh\r\n        编辑完之后，末行模式下保存退出，使编辑过后的文件生效\r\n            source ~/.bashrc\r\n\r\n    创建python3虚拟环境\r\n        mkvirtualenv -p python3 Flask_py3\r\n\r\n# 三、准备虚拟环境(虚拟环境必须有我们在本地虚拟环境py3_flask08中安装过的一些包)\r\n    先导出本地虚拟环境中已经安装过的包\r\n    (py3_flask08) python@ubuntu:~/information08$ pip freeze > ~/Desktop/requirements.txt\r\n    在本地桌面可以看到requirements.txt    可以看到里面就是我们本地虚拟环境中安装好的一些包\r\n    将文件拷贝到远程服务器：\r\n        在本地：\r\n        python@ubuntu:~$ scp ~/Desktop/requirements.txt root@119.23.10.32:~/\r\n        root@119.23.10.32\'s password: 键入登录远程ECS服务器密码\r\n        requirements.txt                              100%  508     0.5KB/s   00:00 \r\n\r\n        在远程服务器：\r\n        (Flask_py3) root@xxxxxxxxxxxxx:~# ls\r\n        dump.rdb  requirements.txt\r\n\r\n\r\n    将所有的包安装到远程服务器的虚拟环境Flask_py3中\r\n    (Flask_py3) root@xxxxxxxxxxxxx:~# pip install -r requirements.txt\r\n\r\n\r\n    安装过程中如果哪个包报错了，就把那个包删了后面单独安装\r\n\r\n    在安装 Flask-MySQLdb 的时候可能会报错，可能是依赖包没有安装，执行以下命令安装依赖包：\r\n    sudo apt-get build-dep python-mysqldb\r\n\r\n\r\n# 四、在远程的服务器中，继续安装环境\r\n\r\n    安装Nginx\r\n    sudo apt-get install nginx\r\n\r\n    安装完成之后就可以在浏览器下输入你的公网地址，看到Nginx服务页面\r\n\r\n        nginx的运行及停止\r\n        /etc/init.d/nginx start #启动\r\n        /etc/init.d/nginx stop  #停止\r\n\r\n\r\n# 五、安装完Nginx之后，部署一个hello程序\r\n    安装完Nginx之后，可以在浏览器下输入你的公网地址，看到Nginx服务页面，下面我们部署一个自己的hello程序\r\n\r\n    书写一个hello.py程序，在远程服务器桌面\r\n    命令 ls\r\n    dump.rdb  hello.py  requirements.txt\r\n\r\n    (Flask_py3) root@xxxxxxxx:~# python hello.py\r\n    * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)\r\n\r\n    发现即使在浏览器键入http://119.23.10.32:5000  也访问不了， 因为默认是127.0.0.1，只能在远程服务器那边访问，而我们现在hello.py中也没有使用manage管理，这时候就需要用到Nginx\r\n\r\n    让Nginx做中转\r\n\r\n    vim /etc/nginx/sites-available/default   修改location中的信息，如下：\r\n    location / {\r\n            # First attempt to serve request as file, then\r\n            # as directory, then fall back to displaying a 404.\r\n            # try_files $uri $uri/ =404;\r\n\r\n            proxy_pass http://127.0.0.1:5000;\r\n            \r\n            # proxy_pass http://flask;\r\n            \r\n            proxy_set_header Host $host;\r\n           \r\n            proxy_set_header X-Real-IP $remote_addr;\r\n    }\r\n\r\n\r\n    修改后重启Nginx\r\n    Nginx的运行及停止\r\n        /etc/init.d/nginx start #启动\r\n        /etc/init.d/nginx stop  #停止\r\n\r\n    现在，就可以通过互联网来访问公网地址http://119.23.10.32看到hello world页面了\r\n    (Flask_py3) root@xxxxxxxx:~# python hello.py    \r\n    * Running on http://127.0.0.1:5000/ (Press CTRL+C to quit)\r\n\r\n\r\n# 六、安装gunicorn\r\n    刚才，我们还是通过python hello.py来启动我们程序\r\n    现在我们安装gunicorn，之后再通过gunicorn来启动我们项目\r\n    \r\n    (Flask_py3) root@xxxxxxxx:~# pip install gunicorn\r\n\r\n    执行命令gunicorn -w 2 -b 127.0.0.1:5000 模块名：应用程序名\r\n    (Flask_py3) root@xxxxxxxx:~# gunicorn -w 2 -b 127.0.0.1:5000 hello:app\r\n    [2018-12-23 15:08:08 +0800] [23132] [INFO] Starting gunicorn 19.9.0\r\n    [2018-12-23 15:08:08 +0800] [23132] [INFO] Listening at: http://127.0.0.1:5000 (23132)\r\n    [2018-12-23 15:08:08 +0800] [23132] [INFO] Using worker: sync\r\n    [2018-12-23 15:08:08 +0800] [23135] [INFO] Booting worker with pid: 23135\r\n    [2018-12-23 15:08:08 +0800] [23137] [INFO] Booting worker with pid: 23137\r\n\r\n\r\n# 七、安装git\r\n     sudo apt-get install git\r\n\r\n\r\n# 八：部署项目\r\n    克隆项目到远程服务器\r\n    (Flask_py3) root@xxxxxxxxx:~# git clone https://gitee.com/itheima_py/information08.git\r\n\r\n\r\n    在远程服务器创建数据库 info_gz08\r\n\r\n    在information08目录下，做数据库迁移\r\n\r\n        python manage.py db init 数据库管理的初始化，会生成一个迁移文件夹\r\n        python manage.py db migrate -m \'对这个文件的说明信息\' 生成数据库迁移文件（生成版本文件）\r\n        python manage.py db upgrade   根据迁移文件中的upgrade生成数据库中表\r\n\r\n    导入数据到数据库（两个sql文件）\r\n\r\n\r\n    (Flask_py3) root@xxxxxxxx:~/information08# gunicorn -w 2 -b 127.0.0.1:5000 manage:app\r\n\r\n\r\n# 九、Nginx转发\r\n    (Flask_py3) root@iZwz94u33ixw0wcddjrvoeZ:~# cp -r information08 information08_2\r\n\r\n    修改information08_2某个样式\r\n\r\n    vim /etc/nginx/sites-available/default   修改location中的信息，如下：\r\n        upstream flask {\r\n                server 127.0.0.1:5000;\r\n                server 127.0.0.1:5001;\r\n        }\r\n        server {\r\n            # 监听80端口\r\n            listen 80 default_server;\r\n            listen [::]:80 default_server;\r\n\r\n            root /var/www/html;\r\n\r\n            index index.html index.htm index.nginx-debian.html;\r\n\r\n            server_name _;\r\n\r\n            location / {\r\n                    # 请求转发到gunicorn服务器\r\n                    # proxy_pass http://127.0.0.1:5000;\r\n                    # 请求转发到多个gunicorn服务器\r\n                    proxy_pass http://flask;\r\n                    # 设置请求头，并将头信息传递给服务器端 \r\n                    proxy_set_header Host $host;\r\n                    # 设置请求头，传递原始请求ip给 gunicorn 服务器\r\n                    proxy_set_header X-Real-IP $remote_addr;\r\n            }\r\n        }\r\n\r\n\r\n    重启Nginx\r\n        /etc/init.d/nginx start #启动\r\n        /etc/init.d/nginx stop  #停止\r\n\r\n\r\n    (Flask_py3) root@xxxxx:~/information08# gunicorn -w 2 -b 127.0.0.1:5000 manage:app -D\r\n    (Flask_py3) root@xxxxx:~/information08_2# gunicorn -w 2 -b 127.0.0.1:5001 manage:app -D','/static/blog/img/summary.png','2018-08-10 20:17:33.834552','2018-09-10 21:17:33.834552',1,'gunicorn',1,8),(22,'各个关键技术在项目开发中的应用','各个关键技术在项目开发中的应用..','# 一.配置注意项\r\n	1.使用MySQL之前，要在项目中配置MySQL驱动：\r\n		import pymysql\r\n		pymysql.install_as_MySQLdb()\r\n\r\n	2.配置redis数据库存储session:\r\n		CACHES = {\r\n		    \"session\": {	# session的容器\r\n		        \"BACKEND\": \"django_redis.cache.RedisCache\",\r\n		        \"LOCATION\": \"redis://10.211.55.5:6379/0\",\r\n		        \"OPTIONS\": {\r\n		            \"CLIENT_CLASS\": \"django_redis.client.DefaultClient\",\r\n		        }\r\n		    },\r\n		}\r\n		# 将项目中的session存储到redis中\r\n		SESSION_ENGINE = \"django.contrib.sessions.backends.cache\"\r\n		SESSION_CACHE_ALIAS = \"session\"\r\n\r\n	3.日志配置：\r\n		LOGGING = {\r\n		    \'version\': 1,\r\n		    \'disable_existing_loggers\': False,  # 是否禁用已经存在的日志器\r\n		    \'formatters\': {  # 日志信息显示的格式\r\n		        \'verbose\': {\r\n		            \'format\': \'%(levelname)s %(asctime)s %(module)s %(lineno)d %(message)s\'\r\n		        },\r\n		        \'simple\': {\r\n		            \'format\': \'%(levelname)s %(module)s %(lineno)d %(message)s\'\r\n		        },\r\n		    },\r\n		    \'filters\': {\r\n		        \'require_debug_true\': {  # django在debug模式下才输出日志\r\n		            \'()\': \'django.utils.log.RequireDebugTrue\',\r\n		        },\r\n		    },\r\n		    \'handlers\': {  # 日志处理方法\r\n		        \'console\': {  # 向终端中输出日志\r\n		            \'level\': \'INFO\',\r\n		            \'filters\': [\'require_debug_true\'],\r\n		            \'class\': \'logging.StreamHandler\',\r\n		            \'formatter\': \'simple\'\r\n		        },\r\n		        \'file\': {  # 向文件中输出日志\r\n		            \'level\': \'INFO\',\r\n		            \'class\': \'logging.handlers.RotatingFileHandler\',\r\n		            # 日志文件的位置\r\n		            \'filename\': os.path.join(os.path.dirname(BASE_DIR), \"logs/meiduo.log\"),\r\n		            \'maxBytes\': 300 * 1024 * 1024,  # 日志文件的最大容量  300M\r\n		            \'backupCount\': 10,  # 300M * 10\r\n		            \'formatter\': \'verbose\'\r\n		        },\r\n		    },\r\n		    \'loggers\': {\r\n		        \'django\': {  # 定义了一个名为django的日志器\r\n		            \'handlers\': [\'console\', \'file\'],  # 可以同时向终端与文件中输出日志\r\n		            \'level\': \'INFO\',  # 日志器接收的最低日志级别\r\n		        },\r\n		    }\r\n		}\r\n\r\n# 二.celery(两部分:brocker和worker和task result store)\r\n	1.在celery包中创建main.py,在main.py文件中创建celery应用,并将含有任务的文件路径添加到celery.autodiscover_tasks(\'celery_tasks.sms\'),扫描才能找到;\r\n	2.在任务文件中创建tasks.py(固定的名称),创建任务(被celery应用.task装饰之后才为celery应用)\r\n	3.由于任务的执行同主程序分开，如果主程序想获取任务执行的结果，就必须通过中间件存储。\r\n\r\n# 三.JWT(Header Payload Signature-用script-key加密,不需要自己加密和验证，只需要返回token)的使用流程:\r\n    1.后台生成jwt:使用第三方库djangorestframework-jwt生成JWT(手动添加认证方式)\r\n    2.前端保存JWT:前段通过localStorage或sessionStorage来保存JWT\r\n    3.通过请求头上传JWT:axios.get(\'url\', config)\r\n    4.校验JWT:\r\n        在项目配置文件中,配置djangorestframework-jwt提供的JWT认证类,会自动对请求的jwt进行校验,通过后,在django的视图中,可以通过\r\n        request.user验证能够登录的用户.\r\n    5.# 接收生成payload函数(user)\r\n        jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER\r\n        # 接收生成JWT函数(payload)\r\n        jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER\r\n\r\n# 四.QQ登录(outh2.0：要获得应用生产openid，每个QQ号对应一个openid)\r\n	1. 显示QQ登录界面\r\n    2. 准备回调界面,获取code(QQ后台会自动发送)参数\r\n    3. 实现QQ认证接口:\r\n        (1) 根据code获取access_token\r\n        (2) 根据access_token获取opendid\r\n        (3) 根据opendid,从映射表查询美多用户\r\n            - 如果能查询到美多用户,则生成响应jwt,user_id,username, 完成QQ登陆流程\r\n            - 如果不能查询到美多用户,则返回opendid,等待用户后续的绑定操作\r\n    4. 绑定opendid和美多用户\r\n\r\n# 五.itsdangerous加密(加密解密都要取得应用，秘钥为secre-key(需要制定))\r\n	1.安装： pip install itsdangerous\r\n    2.使用 TimedJSONWebSignatureSerializer 可以生成带有有效期的加密数据\r\n        -创建: TimedJSONWebSignatureSerializer(密钥, 有效期秒)\r\n        -签名: dumps(dict)    返回bytes类型数据(jwt字符串)\r\n        -验签: loads(str)     返回字典\r\n            - 可以确保没有被篡改\r\n            - 数据会过期\r\n        - 解密出错异常\r\n            - BadData 父类\r\n                - SignatureExpired:  签名过期\r\n                - BadSignature:  要解密的数据被篡改\r\n\r\n# 六.邮箱激活\r\n	1.163邮箱设置;\r\n	2.django项目配置：\r\n		EMAIL_BACKEND = \'django.core.mail.backends.smtp.EmailBackend\'\r\n		EMAIL_HOST = \'smtp.163.com\'\r\n		EMAIL_PORT = 25\r\n		#发送邮件的邮箱\r\n		EMAIL_HOST_USER = \'itcast88@163.com\'\r\n		#在邮箱中设置的客户端授权密码\r\n		EMAIL_HOST_PASSWORD = \'python808\'\r\n		#收件人看到的发件人\r\n		EMAIL_FROM = \'python<itcast88@163.com>\'\r\n	3.激活流程:\r\n		1.发送激活连接到邮箱:\r\n			send_mail(subject, message, from_email, recipient_list,html_message=None)\r\n			subject 邮件标题\r\n			message 普通邮件正文， 普通字符串\r\n			from_email 发件人\r\n			recipient_list 收件人列表\r\n			html_message 多媒体邮件正文，可以是html字符串\r\n		2.点击链接在mounted中发送连接：\r\n			1.获取token\r\n		    2.校验token的合法性(Timed...)\r\n		    3.从token中获取user_id和email\r\n		    4.查询用户对象是否已激活\r\n		    5.给用户激活邮箱\r\n		    6.返回验证成功\r\n		     http://www.meiduo.site:8080/success_verify_email.html?token=eyJhbGciOiJIUzUxMiIsImV4cCI6MTU0NzIwNzEyMiwiaWF0IjoxNTQ3MTIwNzIyfQ.eyJ1c2VyX2lkIjoxLCJlbWFpbCI6Iml0X3ptekAxNjMuY29tIn0.xwPHQLOv2IQI-MOQ5PhyD8iRhqmUJmVJJ3I8WB4v1TEpO--iv2OBV8dsCMVp8v4fKP1O7sOrVyuCWoYV--XsXA\r\n		    data = {\'user_id\': self.id, \'email\': self.email}\r\n\r\n# 七.给视图添加缓存(表的数据不经常改变):pip install drf-extensions\r\n	1.继承对应的缓存扩展类\r\n		1. ListCacheResponseMixin\r\n		    - 实际是为list方法添加了cache_response装饰器\r\n\r\n		2. RetrieveCacheResponseMixin\r\n		    - 实际是为retrieve方法添加了cache_response装饰器\r\n\r\n		3. CacheResponseMixin\r\n			为视图集同时补充List和Retrieve两种缓存，与ListModelMixin和RetrieveModelMixin一起配合使用。\r\n		    \r\n	2.在配置文件中指定缓存过期时间\r\n		REST_FRAMEWORK_EXTENSIONS = {\r\n		    \'DEFAULT_CACHE_RESPONSE_TIMEOUT\': 60 * 60,	# 缓存时间，单位秒\r\n		    \'DEFAULT_USE_CACHE\': \'default\',			    # 缓存存储缓存到哪里 (redis)\r\n		}    \r\n\r\n# 八.FastDFS分布式文件系统(文件去重(扫描文件内容,而不是文件名),海量存储,文件备份)\r\n	- 开源的分布式文件存储系统，可以实现包括 文件存储、文件上传、文件下载， 文件同步等功能；\r\n    - 应用场景：适合以文件为载体的在线服务，如相册网站、视频网站等\r\n	第一部分：Tracker Server： \'跟踪服务器\',调度服务器\r\n		作用：调度，在文件上传时，`Tracker Server`会找到 `Storage server`，提供文件上传服务\r\n	第二部分:Storage server： \'存储服务器\'\r\n		作用： 存储文件\r\n		可以集群，分成多个组，每个组又有多台服务器\r\n			不同的组保存的文件不同；\r\n			同一个组内的多台服务器保存的文件相同，起到文件备份的作用;\r\n			同一个组每台服务器地位平等，没有主从的概念\r\n	文件上传到FastDFS成功后，服务器会返回一个文件路径，型如：\r\n		group1/M00/00/00/wKjSnFpxjn2Aeds7AAfKM6ERqQA402\r\n		组名/虚拟磁盘路径/一级目录/二级目录/文件名\r\n\r\n# 九.docker（是一个客户端-服务器(C/S)架构程序）使用\r\n	打包应用及其依赖包到容器中，从而可以将应用快速地部署到任意的Linux系统上。\r\n	- 隔离环境\r\n	- 性能开销低，启动速度快\r\n	1.安装:\r\n		sudo apt-key add gpg\r\n		sudo dpkg -i docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb  # 老师资料中提供的安装包\r\n\r\n	2.开启与关闭\r\n		# 启动docker\r\n		sudo service docker start\r\n		# 停止docker\r\n		sudo service docker stop\r\n		# 重启docker\r\n		sudo service docker restart\r\n\r\n	3.镜像操作\r\n		# 一、列出镜像\r\n		sudo docker image ls\r\n		# 二、加载镜像 \r\n		# 1.拉取官方的镜像 （Docker官方提供的镜像，都放在默认的组library中，可以省略）\r\n		sudo docker image pull library/hello-world\r\n		sudo docker image pull hello-world\r\n		# 2.加载本地镜像\r\n		sudo docker load -i ./ubuntu.tar\r\n		sudo docker load -i fastdfs_docker.tar \r\n		# 三、删除镜像  （没有创建容器的镜像才可以删）\r\n		sudo docker image rm 镜像名或镜像id\r\n		例： sudo docker image rm hello-world\r\n\r\n	4.容器操作\r\n		一、创建容器（根据镜像运行容器） \r\n		sudo docker run [option] 镜像名:TAG [向启动容器中传入的命令]        # 说明 :TAG 部分可以省略\r\n		# 示例1：创建交互式容器\r\n		sudo docker run -it --name=myubuntu ubuntu /bin/bash\r\n		# 示例2：创建守护式容器\r\n		sudo docker run -dit --name=myubuntu2 ubuntu    \r\n		常用可选参数说明：\r\n		--name 为创建的容器命名\r\n		-i 表示以“交互模式”运行容器   --interactive\r\n		-t 表示容器启动后会进入其命令行。常与-i连用，加入这两个参数后，容器创建就能进入容器\r\n		-d Run container in background and print container ID   --detach 解绑\r\n		   守护式容器，后台运行，而不会自动进入容器（命令行）；		\r\n		   如果只加-i -t 两个参数，创建后就会自动进入容器（命令行）\r\n		-v 目录映射关系，使用格式： 宿主机目录:容器中目录，可以使用多个-v做多个目录或文件映射  --volume\r\n		   注意: 最好做目录映射，在宿主机上做修改，然后共享到容器上。    \r\n		--network=host 表示将主机的网络环境映射到容器中，容器的网络与主机相同    \r\n		-p 表示端口映射，前者是宿主机端口，后者是容器内的映射端口。可以使用多个-p 做多个端口映射\r\n		-e 为容器设置环境变量\r\n		二、查看容器\r\n		# 列出本机正在运行的容器\r\n		sudo docker container ls\r\n		# 列出本机所有容器，包括已经终止运行的\r\n		sudo docker container ls --all\r\n		三、启动和停止容器\r\n		# 启动一个已经停止的容器\r\n		sudo docker container start 容器名或容器id\r\n		# 停止一个已经在运行的容器\r\n		sudo docker container stop 容器名或容器id\r\n		# 杀掉一个已经在运行的容器\r\n		sudo docker container kill 容器名或容器id\r\n		四.将容器转换为镜像保存\r\n			sudo docker commit 容器名 镜像名\r\n		五.将镜像备份迁移\r\n			sudo docker save -o 保存的文件名 镜像名\r\n			另外一台电脑上打开：\r\n			sudo docker load -i 保存的文件名\r\n\r\n# 十.FastDFS客户端\r\n	1.安装\r\n		pip install fdfs_client-py-master.zip\r\n		pip install mutagen\r\n		pip isntall requests\r\n\r\n	2.配置\r\n		# 指定使用自定义的文件存储类\r\n		DEFAULT_FILE_STORAGE = \'meiduo_mall.utils.fastdfs.storage.FastDFSStorage\'\r\n\r\n	2.使用(FastDFSStorage:继承FileSystemStorage,重写_save方法和url(返回值会自动保存到数据库)方法)\r\n		client = Fdfs_client(\'meiduo_mall/utils/fastdfs/client.conf\')  获取应用\r\n		dict_data = client.upload_by_buffer(content.read())			   上传的结果\r\n\r\n# 十一.CKEditor基本使用\r\n	1. 安装： pip install django-ckeditor    \r\n\r\n	2. 在settings/dev.py中配置文件中注册应用\r\n	    INSTALLED_APPS = [\r\n	        ...\r\n	        \'ckeditor\',  			# 富文本编辑器\r\n	        \'ckeditor_uploader\',  	# 富文本编辑器上传图片模块\r\n	    ]        \r\n	3. 添加CKEditor设置\r\n		# dev.py\r\n	    # 富文本编辑器ckeditor配置\r\n	    CKEDITOR_CONFIGS = {\r\n	        \'default\': {\r\n	            \'toolbar\': \'full\',  # 工具条功能\r\n	            \'height\': 300,  	# 编辑器高度\r\n	            # \'width\': 300,    	# 编辑器宽\r\n	        },\r\n	    }\r\n	    # 上传图片保存的路径，使用了FastDFS后，此路径用不到\r\n	    CKEDITOR_UPLOAD_PATH = \'uploads/\'  \r\n	4. 添加ckeditor路由，在根路由中添加\r\n		# meiduo_mall/urls.py\r\n		url(r\'^ckeditor/\', include(\'ckeditor_uploader.urls\')),\r\n	5. 为 商品模型类 的三个字段 使用富文本编辑器类型\r\n	    ckeditor提供了两种类型的Django模型类字段：\r\n	    RichTextField 					不支持上传文件的富文本字段\r\n	    RichTextUploadingField 			支持上传文件的富文本字段\r\n	    # goods/models.py\r\n	    class Goods(BaseModel):\r\n	        \"\"\"商品SPU\"\"\"\r\n	        ...\r\n	        # 在商品模型类（SPU）中，要保存商品的详细介绍、包装信息、售后服务，这三个字段修改为富文本类型\r\n	        desc_detail = RichTextUploadingField(default=\'\', verbose_name=\'详细介绍\')\r\n	        desc_pack = RichTextField(default=\'\', verbose_name=\'包装信息\')\r\n	        desc_service = RichTextUploadingField(default=\'\', verbose_name=\'售后服务\')\r\n	6. 重新迁移生成数据库表\r\n\r\n# 十二.页面静态化(查询出数据,模板语法添加到html,将文件写到对应位置)\r\n	template = loader.get_template(\'index.html\')  # 在template文件夹中获取静态文件\r\n    html_text = template.render(context)	# 加载数据(bytes)\r\n    file_path = os.path.join(settings.GENERATED_STATIC_HTML_FILES_DIR, \'index.html\')  # 确定目标文件路径 \r\n    with open(file_path, \'w\', encoding=\'utf-8\') as f:	# 写入文件\r\n        f.write(html_text)\r\n\r\n# 十三.定时任务\r\n	1.安装:pip install django-crontab\r\n	2.添加应用: \'django_crontab\'\r\n	3.设置定时任务\r\n		CRONJOBS = [\r\n		    # 每5分钟执行一次生成主页静态文件\r\n		    (\'*/5 * * * *\', \'contents.crons.generate_static_index_html\', \'>> /Users/delron/Desktop/meiduo_mall/logs/crontab.log\')\r\n		]\r\n	4.解决crontab中文问题\r\n		CRONTAB_COMMAND_PREFIX = \'LANG_ALL=zh_cn.UTF-8\'\r\n	5.任务操作\r\n	添加定时任务到系统中\r\n	python manage.py crontab add\r\n	显示已经激活的定时任务\r\n	python manage.py crontab show\r\n	移除定时任务\r\n	python manage.py crontab remove\r\n\r\n# 十三.触发生成静态页面\r\n	class GoodsCategoryAdmin(admin.ModelAdmin):\r\n	    def save_model(self, request, obj, form, change):\r\n	        obj.save()	\r\n	        from celery_tasks.html.tasks import generate_static_list_search_html\r\n	        generate_static_list_search_html.delay()\r\n\r\n	    def delete_model(self, request, obj):\r\n	        obj.delete()\r\n	        from celery_tasks.html.tasks import generate_static_list_search_html\r\n	        generate_static_list_search_html.delay()\r\n\r\n	admin.site.register(models.GoodsCategory, GoodsCategoryAdmin)\r\n\r\n\r\n# 十四.ElasticSearch索引库创建\r\n	Databases（数据库） <->  Tables （模型类）\r\n	Indices（索引库）   <->  Types （索引类）\r\n	1.使用docker安装ElasticSearch\r\n		(1). 加载提供给大家的镜像文件\r\n		sudo docker load -i elasticsearch-ik-2.4.6_docker.tar\r\n		\r\n		(2). 把资料中提供的 elasticsearch 配置文件复制到 ubuntu home目录，并作如下修改：\r\n			elasticsearc-2.4.6/config/elasticsearch.yml 第54行，更改ip地址为ubuntu的ip地址\r\n			network.host: 192.168.210.160\r\n			\r\n		(3). 通过镜像运行elasticsearch容器\r\n		   sudo docker run -dti --network=host --name=elasticsearch -v /home/python/elasticsearch-2.4.6/config:/usr/share/elasticsearch/config delron/elasticsearch-ik:2.4.6-1.0   \r\n		   \r\n		(4). 测试 ElasticSearch 是否安装成功\r\n		   sudo apt install curl    						\r\n		   curl \'http://192.168.210.160:9200/\'		\r\n		   \r\n		   看到类似如下图的返回结果，说明elasticsearch安装成功，并且elasticsearch服务器端已经启动起来。\r\n  	\r\n  	2.安装媒介Haystack\r\n  		(1). 安装python包\r\n			# pip install django-haystack\r\n		    pip install drf-haystack\r\n		    pip install elasticsearch==2.4.1\r\n    \r\n		(2). 注册应用\r\n		    INSTALLED_APPS = [\r\n		        ...\r\n		        \'haystack\',\r\n		        ...\r\n		    ]\r\n		    \r\n		(3). 在项目的配置文件中配置haystack   \r\n			# dev.py  配置haystack全文检索框架\r\n		    HAYSTACK_CONNECTIONS = {\r\n		        \'default\': {\r\n		            \'ENGINE\': \'haystack.backends.elasticsearch_backend.ElasticsearchSearchEngine\',\r\n		            # 此处为elasticsearch运行的服务器ip地址，端口号默认为9200\r\n		            \'URL\': \'http://192.168.210.160:9200/\',  \r\n		            # 指定elasticsearch建立的索引库的名称\r\n		            \'INDEX_NAME\': \'meiduo\',  \r\n		        },\r\n		    }\r\n		    # 当添加、修改、删除数据时，自动更新索引\r\n		    HAYSTACK_SIGNAL_PROCESSOR = \'haystack.signals.RealtimeSignalProcessor\'\r\n\r\n	3.在search_indexes.py(名字固定)中创建索引类:\r\n		(1)特殊字段:\r\n			text = indexes.CharField(document=True, use_template=True),通过他来搜索,其他字段来自于模型类\r\n\r\n		(2)两个特殊函数:\r\n			def get_model(self):\r\n		        \"\"\"返回建立索引的模型类\"\"\"\r\n		        return SKU\r\n		    def index_queryset(self, using=None):\r\n		        \"\"\"返回要建立索引的数据查询集\"\"\"\r\n		        return self.get_model().objects.filter(is_launched=True)\r\n\r\n    4.模板文件\r\n	    templates/search/indexes/goods/sku_text.txt   # 路径和名字固定， 否则报错如下\r\n		{{ object.name }}\r\n		{{ object.caption }}\r\n		{{ object.id }}\r\n\r\n	5.运行创建ES索引库\r\n		python manage.py rebuild_index\r\n\r\n# 十五.ElasticSearch使用\r\n	1.序列化器:\r\n		from drf_haystack.serializers import HaystackSerializer\r\n		class SKUIndexSerializer(HaystackSerializer):\r\n		    \"\"\"\r\n		    SKU索引结果数据序列化器\r\n		    \"\"\"\r\n		    class Meta:\r\n		        index_classes = [SKUIndex]\r\n		        fields = (\'text\', \'id\', \'name\', \'price\', \'default_image_url\', \'comments\')\r\n\r\n	2.视图：\r\n		from drf_haystack.viewsets import HaystackViewSet\r\n		class SKUSearchViewSet(HaystackViewSet):\r\n		    \"\"\"\r\n		    SKU搜索\r\n		    HaystackViewSet： 查一条，查多条\r\n		    \"\"\"\r\n		    index_models = [SKU]\r\n		    serializer_class = SKUIndexSerializer\r\n\r\n# 十六.支付宝：(传入公钥和私钥创建应用，RSA2加密)第三方SDK\r\n	传回来的参数自己验证\r\n		获取alipay应用\r\n	        alipay = AliPay(\r\n	            appid=settings.ALIPAY_APPID,\r\n	            app_notify_url=\'http://www.meiduo.site/pay_success.html\',  # 默认回调url(确认订单自己调用)\r\n	            app_private_key_string=app_private_key_string,\r\n	            # 支付宝的公钥，验证支付宝回传消息使用，不是你自己的公钥,\r\n	            alipay_public_key_string=alipay_public_key_string,\r\n	            sign_type=\"RSA2\",  # RSA 或者 RSA2\r\n	            debug=settings.ALIPAY_DEBUG\r\n	        )\r\n		success = alipay.verify(data, signature)\r\n\r\n# 十七.mysql主从配置\r\n	将主数据库的内容添加到从数据库:\r\n		mysqldump -uroot -pmysql --all-databases --lock-all-tables > ~/master_db.sql\r\n		mysql -uroot -pmysql -h127.0.0.1 --port=8306 < ~/master_db.sql\r\n		\r\n	主服务器：\r\n		开启二进制日志\r\n		配置唯一的server-id\r\n		获得master二进制日志文件名及位置\r\n		创建一个用于slave和master通信的用户账号\r\n\r\n	从服务器：\r\n		配置唯一的server-id\r\n		使用master分配的用户账号读取master二进制日志\r\n		启用slave服务','/static/blog/img/summary.png','2018-09-11 21:29:57.715594','2018-09-11 21:29:57.715594',1,'develop',1,4),(23,'mysql主从配置','mysql主从配置','# 一、有很多种配置主从同步的方法，可以总结为如下的步骤：\r\n\r\n	（1） 在主服务器上，必须开启二进制日志机制和配置一个独立的ID\r\n\r\n	（2） 在每一个从服务器上，配置一个唯一的ID，创建一个用来专门复制主服务器数据的账号\r\n\r\n	（3） 在开始复制进程前，在主服务器上记录二进制文件的位置信息\r\n\r\n	（4） 如果在开始复制之前，数据库中已经有数据，就必须先创建一个数据快照（可以使用mysqldump导出数据库，或者直接复制数据文件）\r\n\r\n	（5） 配置从服务器要连接的主服务器的IP地址和登陆授权，二进制日志文件名和位置\r\n\r\n# 二、详细配置主从同步的方法\r\n## 1）安装mysql\r\n	我们在ubuntu中已经有安装一台mysql了，现在使用docker安装另外一台mysql\r\n\r\n	获取mysql的镜像，主从同步尽量保证多台mysql的版本相同，我们的ubuntu中存在的mysql是5.7.22版本，所以获取5.7.22版本的镜像\r\n\r\n	sudo docker image pull mysql:5.7.22\r\n	或\r\n	sudo docker load -i mysql_docker_5722.tar\r\n	运行mysql docker镜像，需要在宿主机中建立文件目录用于mysql容器保存数据和读取配置文件。\r\n\r\n	在家目录中（/home/python）中创建目录，将mysql的配置文件放到此目录中\r\n\r\n	cd ~\r\n	mkdir mysql_slave\r\n	cd mysql_slave\r\n	mkdir data\r\n	cp -r /etc/mysql/mysql.conf.d ./\r\n	我们要将docker运行的mysql作为slave来运行，开启前需要修改配置文件。\r\n\r\n	编辑 ~/mysql_slave/mysql.conf.d/mysqld.cnf 文件，修改\r\n\r\n	port  =  8306\r\n	general_log  = 0  # 关闭日志\r\n	server-id  = 2\r\n	我们让此台mysql运行在8306端口上，且mysql编号为2\r\n\r\n	创建docker容器\r\n\r\n	docker run --name mysql-slave -e MYSQL_ROOT_PASSWORD=mysql -d --network=host -v /home/python/mysql_slave/data:/var/lib/mysql -v /home/python/mysql_slave/mysql.conf.d:/etc/mysql/mysql.conf.d  mysql:5.7.22\r\n	MYSQL_ROOT_PASSWORD 是创建mysql root用户的密码\r\n	测试，在ubuntu中使用mysql命令尝试连接docker容器中的mysql\r\n\r\n	mysql -uroot -pmysql -h 127.0.0.1 --port=8306\r\n## 2）备份主服务器原有数据到从服务器\r\n	如果在设置主从同步前，主服务器上已有大量数据，可以使用mysqldump进行数据备份并还原到从服务器以实现数据的复制。\r\n\r\n	在主服务器Ubuntu上进行备份，执行命令：\r\n\r\n	mysqldump -uroot -pmysql --all-databases --lock-all-tables > ~/master_db.sql\r\n\r\n	-u ：用户名\r\n\r\n	-p ：示密码\r\n\r\n	--all-databases ：导出所有数据库\r\n\r\n	--lock-all-tables ：执行操作时锁住所有表，防止操作时有数据修改\r\n\r\n	~/master_db.sql :导出的备份数据（sql文件）位置，可自己指定\r\n\r\n	在docker容器中导入数据\r\n\r\n	mysql -uroot -pmysql -h127.0.0.1 --port=8306 < ~/master_db.sql\r\n## 3）配置主服务器master（Ubuntu中的MySQL）\r\n	编辑设置mysqld的配置文件，设置log_bin和server-id，将log_bin开启，设置server-id=1\r\n\r\n		sudo vim /etc/mysql/mysql.conf.d/mysqld.cnf\r\n\r\n	重启mysql服务\r\n\r\n		sudo service mysql restart\r\n	登入主服务器Ubuntu中的mysql，创建用于从服务器同步数据使用的帐号\r\n\r\n		mysql –uroot –pmysql\r\n\r\n		GRANT REPLICATION SLAVE ON *.* TO \'slave\'@\'%\' identified by \'slave\';\r\n\r\n		FLUSH PRIVILEGES;\r\n\r\n	获取主服务器的二进制日志信息\r\n\r\n		SHOW MASTER STATUS;\r\n\r\n	File为使用的日志文件名字，Position为使用的文件位置，这两个参数须记下，配置从服务器时会用到。\r\n\r\n## 4）配置从服务器slave （docker中的mysql）\r\n	进入docker中的mysql\r\n\r\n	mysql -uroot -pmysql -h 127.0.0.1 --port=8306\r\n	执行\r\n\r\n	change master to master_host=\'127.0.0.1\', master_user=\'slave\', master_password=\'slave\',master_log_file=\'mysql-bin.000006\', master_log_pos=position;\r\n	master_host：主服务器Ubuntu的ip地址\r\n	master_log_file: 前面查询到的主服务器日志文件名\r\n	master_log_pos: 前面查询到的主服务器日志文件位置\r\n	启动slave服务器，并查看同步状态\r\n\r\n	start slave;\r\n	show slave status \\G\r\n\r\n	看到两个Yes，表示正常开启了。','/static/blog/img/mysql2.jpg','2018-08-25 22:02:05.443744','2018-08-25 22:02:05.443744',3,'master-slave',1,6),(24,'Docker介绍','Docker 是一个开源的应用容器引擎，让开发者可以打包他们的应用以及依赖包到一个可移植的容器中，然后发布到任何流行的 Linux 机器上，也可以实现虚拟化。容器是完全使用沙箱机制，相互之间不会有任何接口。','# docker简介\r\n	打包应用及其依赖包到容器中，从而可以将应用快速地部署到任意的Linux系统上。\r\n	- 隔离环境\r\n	- 性能开销低，启动速度快\r\n\r\n# Docker组件\r\n## 一、Docker架构 （C/S）\r\n	Docker是一个客户端-服务器(C/S)架构程序，类似 redis\r\n	- 客户端： docker命令行工具\r\n	- 服务器： Docker守护进程(docker引擎)\r\n\r\n## 二、docker镜像 (image)：\r\n	- 压缩包文件，包含了应用程序及其运行依赖的软件和配置\r\n	- 生成镜像： 新镜像  = 现有镜像/官方镜像  + 个性化软件和配置 \r\n	  例： 新镜像 = ubuntu镜像  + fastdfs + nginx \r\n	    \r\n		一些镜像举例：\r\n	    1. 系统级镜像: 如Ubuntu镜像，CentOS镜像等；\r\n	    2. 工具栈镜像: 如Golang镜像，Flask镜像，Tomcat镜像等；\r\n	    3. 服务级镜像: 如MySQL镜像，MongoDB镜像，RabbitMQ镜像等；\r\n    \r\n## 三、docker仓库 （Registry，注册中心）： 保存docker镜像\r\n	- 公有仓库\r\n	    - Docker Hub： Docker的官方仓库，最重要、最常用的 image 仓库。\r\n	    - https://hub.docker.com/\r\n	- 私有仓库\r\n		- 是开发者或者企业自建的镜像存储库，用于内部开发和产品的发布\r\n    \r\n## 四、docker容器(container)\r\n	- 由镜像文件运行得到容器\r\n	- 每个容器相互隔离\r\n	- 类比\r\n	    - 镜像： 类   \r\n	    - 容器： 对象','/static/blog/img/docker.jpg','2018-10-12 23:11:40.709642','2018-10-12 23:11:40.709642',1,'docker1',1,8),(25,'Docker的使用','Docker的使用','# 安装docker\r\n	执行以下命令安装\r\n		sudo apt-key add gpg\r\n		sudo dpkg -i docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb \r\n	解释：docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb：docker的安装包\r\n\r\n# docker的启动与停止\r\n	启动docker\r\n	sudo service docker start\r\n	停止docker\r\n	sudo service docker stop\r\n	重启docker\r\n	sudo service docker restar\r\n\r\n# 检查Docker CE是否安装正确\r\n	sudo docker run hello-world\r\n	出现：Hello from Docker！，说明docker安装成功。\r\n\r\n# 镜像操作命令\r\n\r\n## 一、列出镜像\r\n	sudo docker image ls\r\n## 二、加载镜像 \r\n### 1.拉取官方的镜像 （Docker官方提供的镜像，都放在默认的组library中，可以省略）\r\n	sudo docker image pull library/hello-world\r\n	sudo docker image pull hello-world\r\n\r\n### 2.加载本地镜像\r\n	sudo docker load -i ./ubuntu.tar\r\n	sudo docker load -i fastdfs_docker.tar \r\n\r\n## 三、删除镜像  （没有创建容器的镜像才可以删）\r\n	sudo docker image rm 镜像名或镜像id\r\n	例： sudo docker image rm hello-world\r\n\r\n# 容器操作命令\r\n## 一、创建容器（根据镜像运行容器） \r\n	sudo docker run [option] 镜像名:TAG [向启动容器中传入的命令]        # 说明 :TAG 部分可以省略\r\n	示例1：创建交互式容器\r\n	sudo docker run -it --name=myubuntu ubuntu /bin/bash\r\n	示例2：创建守护式容器\r\n	sudo docker run -dit --name=myubuntu2 ubuntu    \r\n### 常用可选参数说明：\r\n	--name 为创建的容器命名\r\n	-i 表示以“交互模式”运行容器   --interactive\r\n	-t 表示容器启动后会进入其命令行。常与-i连用，加入这两个参数后，容器创建就能进入容器\r\n	-d Run container in background and print container ID   --detach 解绑\r\n	   守护式容器，后台运行，而不会自动进入容器（命令行）；		\r\n	   如果只加-i -t 两个参数，创建后就会自动进入容器（命令行）\r\n	-v 目录映射关系，使用格式： 宿主机目录:容器中目录，可以使用多个-v做多个目录或文件映射  --volume\r\n	   注意: 最好做目录映射，在宿主机上做修改，然后共享到容器上。    \r\n	--network=host 表示将主机的网络环境映射到容器中，容器的网络与主机相同    \r\n	-p 表示端口映射，前者是宿主机端口，后者是容器内的映射端口。可以使用多个-p 做多个端口映射\r\n	-e 为容器设置环境变量\r\n\r\n## 二、查看容器\r\n	列出本机正在运行的容器\r\n	sudo docker container ls\r\n	列出本机所有容器，包括已经终止运行的\r\n	sudo docker container ls --all\r\n\r\n## 三、启动和停止容器\r\n	启动一个已经停止的容器\r\n	sudo docker container start 容器名或容器id\r\n	停止一个已经在运行的容器\r\n	sudo docker container stop 容器名或容器id\r\n	杀掉一个已经在运行的容器\r\n	sudo docker container kill 容器名或容器id\r\n\r\n## 四、删除容器：不能删除正在运行的容器\r\n	sudo docker container rm 容器名或容器id\r\n## 五、进入已运行的容器\r\n	sudo docker exec -it 容器名或容器id 进入后执行的第一个命令\r\n	sudo docker exec -it myubuntu2 /bin/bash\r\n## 六、将容器保存为镜像\r\n	sudo docker commit 容器名 镜像名\r\n## 七、镜像备份与迁移\r\n	我们可以通过save命令将镜像打包成文件，拷贝给别人使用\r\n	sudo docker save -o 保存的文件名 镜像名\r\n	sudo docker save -o ./ubuntu.tar ubuntu\r\n	在拿到镜像文件后，可以通过load方法，将镜像加载到docker中\r\n	sudo docker load -i ./ubuntu.tar','/static/blog/img/docker.jpg','2018-12-17 22:28:29.844502','2018-12-17 22:28:29.844502',3,'docker2',1,8),(26,'MongoDB使用','MongoDB使用','# 1.查询条件放在第一个大括号中：\r\n	查询年龄⼤于18或性别为男⽣，并且家乡为大理 \r\n    	db.stu.find({$or:[{age:{$gt:18}}, {gender:true}], hometown:\'大理\'})\r\n\r\n# 2.第二个大括号放投影条件（控制那些现实出来）：\r\n	查询所有学生信息,只显示姓名和年龄\r\n		db.stu.find({}, {name:1, age: 1})\r\n\r\n# 3.排序：查询出来点sort:\r\n	根据性别降序， 再根据年龄升序\r\n		db.stu.find().sort({gender:-1, age: 1})\r\n\r\n# 4.消除重复： db.集合名称.distinct(\'去重字段\',{条件})\r\n	查询年龄大于20的学生的家乡, 不能重复\r\n 		db.stu.distinct(\'hometown\', {age:{$gt: 20}})\r\n\r\n# 5.聚合是放在第一个大括号中：\r\n 	db.stu.aggregate(\r\n    	{$group:{_id:\'$gender\', counter:{$sum: 1}}}\r\n    )\r\n# 6.多个聚合文档就要取别名：\r\n	db.t2.aggregate( {$group: {_id:{country:\'$country\',province:\'$province\',userid:\'$userid\' }}} )\r\n\r\n# 7.数据库备份与恢复：\r\n	备份itcast数据库到桌面\r\n		mongodump -h 127.0.0.1:27017 -d itcast -o ~/Desktop \r\n	恢复itcast数据库为itcast2\r\n		mongorestore -h 127.0.0.1:27017 -d itcast2 --dir  ~/Desktop/itcast\r\n\r\n# 8.导入导出：\r\n	以json格式导出itcast数据库中stu集合, 文件名为stu.jsonlines\r\n		mongoexport -h 127.0.0.1:27017 -d itcast -c stu -o ~/Desktop/stu.jsonlines\r\n	以csv格式导出itcast数据库中stu集合, 导出字段:name, age, gender, hometown\r\n		mongoexport  -h 127.0.0.1:27017 -d itcast -c stu -o ~/Desktop/stu.csv --type csv -f name,age,gender,hometown\r\n\r\n	导入stu.json到itcast数据中stu2集合中\r\n		mongoimport -h 127.0.0.1:27017 -d itcast -c stu2 --file ~/Desktop/stu.jsonlines\r\n	导入stu.csv到itcast数据中stu3集合中\r\n		mongoimport -h 127.0.0.1:27017 -d itcast -c stu3 --file ~/Desktop/stu.csv --type csv --headerline\r\n\r\n# 9.权限管理：\r\n	改为认证模式：修改mongod.conf 文件, 增加:\r\n		security:\r\n    		authorization: enabled\r\n\r\n    在admin数据库中创建管理员用户：\r\n		db.createUser({\"user\":\"python\",\"pwd\":\"python\",\"roles\":[\"root\"]})\r\n\r\n	在指定数据库中创建一般用户：\r\n		db.createUser(\"user\":\"user1\", \"pwd\":\"pwd1\", roles:[\"read\"])\r\n		db.createUser(\"user\":\"user1\", \"pwd\":\"pwd1\", roles:[\"readWrite\"])\r\n\r\n	在指定数据库中认证登录：\r\n		db.auth(\'username\': \'pwd\')\r\n\r\n# 10.与python的交互：\r\n	- 获取认证：client = MongoClient(\'mongodb://py6:123@127.0.0.1:27017\')\r\n	- 获取操作集合：collection = client[\'数据库名\'][\'集合名\']\r\n	- 添加一条数据: insert_one\r\n	- 添加多条数据: insert_many(字典列表)\r\n	- 查找一条数据: find_one\r\n	- 查找全部数据: find, 返回一个游标对象, 只能遍历一次\r\n	- 更新一条数据 注意使用$set命令: update_one\r\n	- 更行全部数据: update_many\r\n	- 删除一条数据: delete_one\r\n	- 删除全部数据: delete_many','/static/blog/img/MongoDB.jpg','2019-02-18 21:12:15.106656','2019-03-03 00:21:38.507438',6,'MongoDB2',1,6);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_keywords`
--

DROP TABLE IF EXISTS `blog_article_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_keywords_article_id_keyword_id_9de3a8ff_uniq` (`article_id`,`keyword_id`),
  KEY `blog_article_keywords_keyword_id_43076791_fk_blog_keyword_id` (`keyword_id`),
  CONSTRAINT `blog_article_keywords_article_id_b4779209_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_keywords_keyword_id_43076791_fk_blog_keyword_id` FOREIGN KEY (`keyword_id`) REFERENCES `blog_keyword` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_keywords`
--

LOCK TABLES `blog_article_keywords` WRITE;
/*!40000 ALTER TABLE `blog_article_keywords` DISABLE KEYS */;
INSERT INTO `blog_article_keywords` VALUES (3,3,5),(4,4,6),(5,5,6),(7,6,6),(6,6,8),(8,7,9),(9,8,9),(10,9,10),(11,10,11),(12,10,12),(13,11,13),(14,12,14),(16,13,16),(17,14,17),(20,17,20),(21,18,21),(22,19,22),(23,20,3),(24,20,4),(27,21,23),(25,21,24),(26,21,25),(35,22,17),(36,22,26),(37,22,27),(38,22,28),(39,22,29),(40,22,31),(28,22,32),(29,22,33),(30,22,34),(31,22,35),(32,22,36),(33,22,37),(34,22,38),(41,23,10),(42,24,26),(43,25,26),(44,26,22);
/*!40000 ALTER TABLE `blog_article_keywords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `blog_article_tags_article_id_tag_id_b78a22e9_uniq` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_82c02dd6_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_88eb3ed9_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (2,3,1),(3,4,1),(4,5,1),(5,6,1),(6,7,2),(7,8,2),(8,9,3),(9,10,4),(10,10,5),(12,11,6),(13,12,7),(15,13,9),(16,14,10),(20,17,13),(21,18,14),(22,19,15),(23,20,1),(24,21,16),(25,21,17),(26,22,18),(27,23,3),(28,24,18),(29,24,19),(30,25,19),(31,26,15);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_carousel`
--

DROP TABLE IF EXISTS `blog_carousel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(80) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_carousel`
--

LOCK TABLES `blog_carousel` WRITE;
/*!40000 ALTER TABLE `blog_carousel` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_carousel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'python基础','python','python基础知识'),(2,'python高级','python2','python高级知识点'),(3,'前端','front','前端知识点'),(4,'Django框架','Django','Django框架使用'),(5,'Flask框架','Flask','Flask'),(6,'database','database','数据库'),(7,'容器化','docker ','容器化'),(8,'部署','deploy','deploy');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_friendlink`
--

DROP TABLE IF EXISTS `blog_friendlink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `logo` varchar(200) NOT NULL,
  `create_date` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_friendlink`
--

LOCK TABLES `blog_friendlink` WRITE;
/*!40000 ALTER TABLE `blog_friendlink` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_friendlink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_keyword`
--

DROP TABLE IF EXISTS `blog_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_keyword`
--

LOCK TABLES `blog_keyword` WRITE;
/*!40000 ALTER TABLE `blog_keyword` DISABLE KEYS */;
INSERT INTO `blog_keyword` VALUES (3,'html'),(4,'css'),(5,'javascript'),(6,'jquery'),(7,'vue'),(8,'ajax'),(9,'python'),(10,'mysql'),(11,'view'),(12,'route'),(13,'jinjia2'),(14,'flask-sqlalchemy'),(15,'BluePrint'),(16,'django'),(17,'drf'),(20,'redis'),(21,'git'),(22,'MongoDB'),(23,'flask'),(24,'nginx'),(25,'gunicorn'),(26,'docker'),(27,'celery'),(28,'jwt'),(29,'QQ登录'),(30,'itsdangerous'),(31,'邮箱激活'),(32,'drf-extensions'),(33,'FastDFS'),(34,'CKEditor'),(35,'页面静态化'),(36,'django-crontab'),(37,'ElasticSearch'),(38,'支付宝'),(39,'mysql主从配置');
/*!40000 ALTER TABLE `blog_keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_silian`
--

DROP TABLE IF EXISTS `blog_silian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_silian` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badurl` varchar(200) NOT NULL,
  `remark` varchar(50) DEFAULT NULL,
  `add_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_silian`
--

LOCK TABLES `blog_silian` WRITE;
/*!40000 ALTER TABLE `blog_silian` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_silian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'前端','前端','前端'),(2,'python','python','python'),(3,'mysql','mysql','mysql'),(4,'view router','flask','flask视图和路由'),(5,'virtualenvs','virtualenvs','虚拟环境'),(6,'jinjia2','jinjia2','flask模板语法'),(7,'ORM','ORM','对象-关系映射'),(8,'BluePrint','BluePrint','flask蓝图'),(9,'django','django','django'),(10,'drf','drf','drf'),(13,'redis','redis','redis'),(14,'git','git','git'),(15,'MongoDB','MongoDB','MongoDB'),(16,'Nginx','Nginx','Nginx'),(17,'gunicorn','gunicorn','gunicorn'),(18,'实际开发对技术的使用','develop','develop'),(19,'docker','docker','docker');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_timeline`
--

DROP TABLE IF EXISTS `blog_timeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `side` varchar(1) NOT NULL,
  `star_num` int(11) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `icon_color` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `update_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_timeline`
--

LOCK TABLES `blog_timeline` WRITE;
/*!40000 ALTER TABLE `blog_timeline` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_timeline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_articlecomment`
--

DROP TABLE IF EXISTS `comment_articlecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_articlecomment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `content` longtext NOT NULL,
  `author_id` int(11) NOT NULL,
  `belong_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `rep_to_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_articlecomment_author_id_46e6fdb8_fk_oauth_ouser_id` (`author_id`),
  KEY `comment_articlecomment_belong_id_58e0232c_fk_blog_article_id` (`belong_id`),
  KEY `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` (`parent_id`),
  KEY `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` (`rep_to_id`),
  CONSTRAINT `comment_articlecomme_parent_id_f0ab594d_fk_comment_a` FOREIGN KEY (`parent_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomme_rep_to_id_84dab3d5_fk_comment_a` FOREIGN KEY (`rep_to_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_articlecomment_author_id_46e6fdb8_fk_oauth_ouser_id` FOREIGN KEY (`author_id`) REFERENCES `oauth_ouser` (`id`),
  CONSTRAINT `comment_articlecomment_belong_id_58e0232c_fk_blog_article_id` FOREIGN KEY (`belong_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_articlecomment`
--

LOCK TABLES `comment_articlecomment` WRITE;
/*!40000 ALTER TABLE `comment_articlecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_articlecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_notification`
--

DROP TABLE IF EXISTS `comment_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `create_p_id` int(11) NOT NULL,
  `get_p_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_notification_comment_id_94e60ae3_fk_comment_a` (`comment_id`),
  KEY `comment_notification_create_p_id_a955a2f8_fk_oauth_ouser_id` (`create_p_id`),
  KEY `comment_notification_get_p_id_73b11c09_fk_oauth_ouser_id` (`get_p_id`),
  CONSTRAINT `comment_notification_comment_id_94e60ae3_fk_comment_a` FOREIGN KEY (`comment_id`) REFERENCES `comment_articlecomment` (`id`),
  CONSTRAINT `comment_notification_create_p_id_a955a2f8_fk_oauth_ouser_id` FOREIGN KEY (`create_p_id`) REFERENCES `oauth_ouser` (`id`),
  CONSTRAINT `comment_notification_get_p_id_73b11c09_fk_oauth_ouser_id` FOREIGN KEY (`get_p_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_notification`
--

LOCK TABLES `comment_notification` WRITE;
/*!40000 ALTER TABLE `comment_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-28 14:12:25.075687','1','python基础',1,'[{\"added\": {}}]',20,1),(2,'2019-02-28 14:14:21.762993','2','python高级',1,'[{\"added\": {}}]',20,1),(3,'2019-02-28 14:15:45.094110','3','前端',1,'[{\"added\": {}}]',20,1),(4,'2019-02-28 14:17:04.353651','4','Django框架',1,'[{\"added\": {}}]',20,1),(5,'2019-02-28 14:17:36.734679','5','Flask框架',1,'[{\"added\": {}}]',20,1),(6,'2019-02-28 15:45:14.807869','1','html与css基础知识',2,'[{\"changed\": {\"fields\": [\"body\", \"tags\", \"keywords\"]}}]',19,1),(7,'2019-02-28 15:49:37.150246','3','javascript',2,'[{\"changed\": {\"fields\": [\"body\", \"tags\", \"keywords\"]}}]',19,1),(8,'2019-02-28 15:49:57.806668','4','jquery选择器',2,'[{\"changed\": {\"fields\": [\"body\", \"tags\", \"keywords\"]}}]',19,1),(9,'2019-02-28 15:50:16.747613','5','jquery动画',2,'[{\"changed\": {\"fields\": [\"body\", \"tags\", \"keywords\"]}}]',19,1),(10,'2019-02-28 16:01:46.273688','6','jquery与后端数据交互',1,'[{\"added\": {}}]',19,1),(11,'2019-02-28 16:18:17.250905','7','python 字符串操作',1,'[{\"added\": {}}]',19,1),(12,'2019-02-28 16:29:04.745494','8','tcp/udp多任务编程',1,'[{\"added\": {}}]',19,1),(13,'2019-02-28 16:29:26.510918','8','pythontcp/udp多任务编程',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',19,1),(14,'2019-02-28 16:29:39.953813','8','python的tcp/udp多任务编程',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',19,1),(15,'2019-02-28 16:38:04.503933','9','mysql数据库',1,'[{\"added\": {}}]',19,1),(16,'2019-02-28 16:46:12.775294','10','flask视图和路由',1,'[{\"added\": {}}]',19,1),(17,'2019-02-28 16:49:04.907986','10','flask视图和路由',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',19,1),(18,'2019-02-28 16:52:37.443523','11','flask的jinjia2',1,'[{\"added\": {}}]',19,1),(19,'2019-02-28 16:52:54.020634','11','flask的jinjia2',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',19,1),(20,'2019-02-28 16:57:03.313922','12','Flask-SQLAlchemy',1,'[{\"added\": {}}]',19,1),(21,'2019-02-28 17:01:00.944177','11','flask的jinjia2',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(22,'2019-02-28 17:01:34.669118','12','Flask-SQLAlchemy',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(23,'2019-02-28 17:08:27.218386','13','django框架知识点总结',1,'[{\"added\": {}}]',19,1),(24,'2019-02-28 17:09:07.833879','13','django框架知识点总结',2,'[{\"changed\": {\"fields\": [\"tags\", \"keywords\"]}}]',19,1),(25,'2019-02-28 17:11:18.419902','14','drf知识点总结',1,'[{\"added\": {}}]',19,1),(26,'2019-02-28 17:24:24.259321','15','容器化部署博客-docker-compo',1,'[{\"added\": {}}]',19,1),(27,'2019-02-28 17:28:28.589027','15','容器化部署博客-docker-compo',3,'',19,1),(28,'2019-02-28 17:37:30.565877','16','git源码管理指令',1,'[{\"added\": {}}]',19,1),(29,'2019-02-28 17:39:30.676318','16','git源码管理指令',3,'',19,1),(30,'2019-02-28 17:39:54.700710','19','git',3,'',18,1),(31,'2019-02-28 17:40:34.751348','12','git',3,'',15,1),(32,'2019-02-28 17:48:58.666380','20','redis',1,'[{\"added\": {}}]',18,1),(33,'2019-02-28 17:54:53.748175','17','redis数据库的使用',1,'[{\"added\": {}}]',19,1),(34,'2019-02-28 17:55:32.412320','13','redis',1,'[{\"added\": {}}]',15,1),(35,'2019-02-28 17:55:53.791008','17','redis数据库的使用',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',19,1),(36,'2019-02-28 18:02:54.522523','17','redis数据库的使用',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(37,'2019-02-28 18:04:12.367820','21','git',1,'[{\"added\": {}}]',18,1),(38,'2019-02-28 18:05:07.959236','14','git',1,'[{\"added\": {}}]',15,1),(39,'2019-02-28 18:06:39.005837','18','git源码管理指令',1,'[{\"added\": {}}]',19,1),(40,'2019-02-28 18:09:22.521936','18','git源码管理指令',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(41,'2019-02-28 18:14:57.375605','18','git源码管理指令',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(42,'2019-02-28 18:16:35.057779','18','git源码管理指令',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(43,'2019-02-28 18:23:37.777419','22','MongoDB',1,'[{\"added\": {}}]',18,1),(44,'2019-02-28 18:24:14.229395','15','MongoDB',1,'[{\"added\": {}}]',15,1),(45,'2019-02-28 18:27:05.902909','19','MongoDB',1,'[{\"added\": {}}]',19,1),(46,'2019-02-28 18:28:45.481431','1','html与css基础知识',3,'',19,1),(47,'2019-02-28 18:35:12.212893','3','javascript',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(48,'2019-02-28 18:37:55.918094','4','jquery选择器',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(49,'2019-02-28 18:42:16.716777','5','jquery动画',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(50,'2019-02-28 18:43:36.005719','5','jquery动画',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(51,'2019-02-28 18:47:08.264379','6','jquery与后端数据交互',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(52,'2019-02-28 18:48:39.317751','7','python 字符串操作',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(53,'2019-02-28 18:56:18.416497','8','python的tcp/udp多任务编程',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(54,'2019-02-28 19:01:58.946023','9','mysql数据库',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(55,'2019-02-28 19:04:37.306620','11','flask的jinjia2',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(56,'2019-02-28 19:06:08.511566','12','Flask-SQLAlchemy',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(57,'2019-02-28 19:08:08.984210','13','django框架知识点总结',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(58,'2019-02-28 19:10:50.598452','14','drf知识点总结',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(59,'2019-02-28 19:14:28.675374','19','MongoDB',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(60,'2019-02-28 19:16:34.105069','18','git源码管理指令',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(61,'2019-02-28 19:19:12.045882','17','redis数据库的使用',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(62,'2019-02-28 19:22:23.801605','10','flask视图和路由',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(63,'2019-02-28 19:23:26.446687','9','mysql数据库',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(64,'2019-02-28 19:24:13.816339','8','python的tcp/udp多任务编程',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(65,'2019-02-28 19:25:05.846896','6','jquery与后端数据交互',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(66,'2019-02-28 19:25:48.880206','5','jquery动画',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(67,'2019-02-28 19:26:32.257859','4','jquery选择器',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(68,'2019-02-28 19:27:11.558204','3','javascript',2,'[{\"changed\": {\"fields\": [\"body\"]}}]',19,1),(69,'2019-02-28 21:47:10.242286','23','htmlcss',1,'[{\"added\": {}}]',18,1),(70,'2019-02-28 21:47:56.653692','23','htmlcss',3,'',18,1),(71,'2019-02-28 21:48:48.143509','16','htmlcss',1,'[{\"added\": {}}]',15,1),(72,'2019-02-28 22:01:33.273603','16','htmlcss',3,'',15,1),(73,'2019-02-28 23:42:49.920247','8','部署',1,'[{\"added\": {}}]',20,1),(74,'2019-02-28 23:43:52.581794','16','Nginx',1,'[{\"added\": {}}]',15,1),(75,'2019-02-28 23:44:21.702004','17','gunicorn',1,'[{\"added\": {}}]',15,1),(76,'2019-02-28 23:49:19.116858','23','flask',1,'[{\"added\": {}}]',18,1),(77,'2019-02-28 23:50:10.835609','24','nginx',1,'[{\"added\": {}}]',18,1),(78,'2019-02-28 23:50:17.821785','25','gunicorn',1,'[{\"added\": {}}]',18,1),(79,'2019-03-01 11:59:20.344997','19','MongoDB',2,'[]',19,1),(80,'2019-03-01 12:06:45.055794','20','html与css知识点',1,'[{\"added\": {}}]',19,1),(81,'2019-03-01 12:17:34.854905','21','ngnix + gunicorn + f',1,'[{\"added\": {}}]',19,1),(82,'2019-03-01 12:21:11.802384','18','docker',1,'[{\"added\": {}}]',15,1),(83,'2019-03-01 12:23:13.749533','18','实际开发对技术的使用',2,'[{\"changed\": {\"fields\": [\"name\", \"slug\", \"description\"]}}]',15,1),(84,'2019-03-01 12:23:34.096401','26','docker',1,'[{\"added\": {}}]',18,1),(85,'2019-03-01 12:23:53.608537','27','celery',1,'[{\"added\": {}}]',18,1),(86,'2019-03-01 12:23:59.533617','28','jwt',1,'[{\"added\": {}}]',18,1),(87,'2019-03-01 12:24:13.037683','29','QQ登录',1,'[{\"added\": {}}]',18,1),(88,'2019-03-01 12:24:26.622643','30','itsdangerous',1,'[{\"added\": {}}]',18,1),(89,'2019-03-01 12:24:36.653586','31','邮箱激活',1,'[{\"added\": {}}]',18,1),(90,'2019-03-01 12:25:03.363732','32','drf-extensions',1,'[{\"added\": {}}]',18,1),(91,'2019-03-01 12:25:15.117234','33','FastDFS',1,'[{\"added\": {}}]',18,1),(92,'2019-03-01 12:25:29.881778','34','CKEditor',1,'[{\"added\": {}}]',18,1),(93,'2019-03-01 12:25:42.869301','35','页面静态化',1,'[{\"added\": {}}]',18,1),(94,'2019-03-01 12:25:53.508104','36','django-crontab',1,'[{\"added\": {}}]',18,1),(95,'2019-03-01 12:26:16.033670','37','ElasticSearch',1,'[{\"added\": {}}]',18,1),(96,'2019-03-01 12:26:30.505433','38','支付宝',1,'[{\"added\": {}}]',18,1),(97,'2019-03-01 12:26:49.345240','39','mysql主从配置',1,'[{\"added\": {}}]',18,1),(98,'2019-03-01 12:29:59.616781','22','各个关键技术在项目开发中的应用',1,'[{\"added\": {}}]',19,1),(99,'2019-03-01 14:02:05.654659','23','mysql主从配置',1,'[{\"added\": {}}]',19,1),(100,'2019-03-01 14:11:42.872511','24','Docker介绍',1,'[{\"added\": {}}]',19,1),(101,'2019-03-01 14:12:28.558073','19','docker',1,'[{\"added\": {}}]',15,1),(102,'2019-03-01 14:12:58.732619','24','Docker介绍',2,'[{\"changed\": {\"fields\": [\"tags\"]}}]',19,1),(103,'2019-03-01 14:28:29.957067','25','Docker的使用',1,'[{\"added\": {}}]',19,1),(104,'2019-03-01 14:31:10.880524','25','Docker的使用',2,'[]',19,1),(105,'2019-03-01 18:33:59.766580','25','Docker的使用',2,'[]',19,1),(106,'2019-03-01 18:35:01.756733','25','Docker的使用',2,'[]',19,1),(107,'2019-03-01 19:31:08.237887','24','Docker介绍',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(108,'2019-03-01 19:32:11.581696','25','Docker的使用',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(109,'2019-03-01 19:35:10.982146','20','html与css知识点',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(110,'2019-03-01 19:36:57.295389','5','jquery动画',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(111,'2019-03-01 19:37:15.657009','6','jquery与后端数据交互',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(112,'2019-03-01 19:37:36.028425','4','jquery选择器',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(113,'2019-03-01 19:40:21.172454','3','javascript',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(114,'2019-03-01 19:46:21.752192','21','ngnix + gunicorn + f',2,'[{\"changed\": {\"fields\": [\"title\", \"summary\"]}}]',19,1),(115,'2019-03-01 19:47:53.099053','18','git源码管理指令',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(116,'2019-03-01 19:50:20.572538','8','python的tcp/udp多任务编程',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(117,'2019-03-01 19:53:24.736191','10','flask视图和路由',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(118,'2019-03-01 19:53:39.450399','11','flask的jinjia2',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(119,'2019-03-01 19:58:51.010908','12','Flask-SQLAlchemy',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(120,'2019-03-01 20:00:44.206021','13','django框架知识点总结',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(121,'2019-03-01 20:04:21.482626','14','drf知识点总结',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(122,'2019-03-01 20:07:39.130338','19','MongoDB基础',2,'[{\"changed\": {\"fields\": [\"title\"]}}]',19,1),(123,'2019-03-01 20:12:15.324462','26','MongoDB使用',1,'[{\"added\": {}}]',19,1),(124,'2019-03-01 20:12:52.500079','19','MongoDB基础',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(125,'2019-03-01 20:14:15.917431','9','mysql数据库',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(126,'2019-03-01 20:17:00.220734','17','redis数据库的使用',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(127,'2019-03-01 20:18:48.288782','23','mysql主从配置',2,'[{\"changed\": {\"fields\": [\"img_link\"]}}]',19,1),(128,'2019-03-01 22:25:19.753220','2','127.0.0.1:8000',2,'[{\"changed\": {\"fields\": [\"domain\", \"name\"]}}]',7,1),(129,'2019-03-01 22:31:59.480846','1','GitHub',1,'[{\"added\": {}}]',11,1),(130,'2019-03-01 22:38:35.120085','3','admin',3,'',6,1),(131,'2019-03-01 22:38:35.128813','2','python',3,'',6,1),(132,'2019-03-02 09:52:24.470363','26','MongoDB使用',2,'[]',19,1),(133,'2019-03-02 21:42:29.116757','26','MongoDB使用',2,'[]',19,1),(134,'2019-03-03 00:21:39.837530','26','MongoDB使用',2,'[]',19,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (9,'account','emailaddress'),(8,'account','emailconfirmation'),(1,'admin','logentry'),(2,'auth','group'),(3,'auth','permission'),(19,'blog','article'),(14,'blog','carousel'),(20,'blog','category'),(16,'blog','friendlink'),(18,'blog','keyword'),(17,'blog','silian'),(15,'blog','tag'),(13,'blog','timeline'),(24,'comment','articlecomment'),(23,'comment','notification'),(4,'contenttypes','contenttype'),(6,'oauth','ouser'),(5,'sessions','session'),(7,'sites','site'),(10,'socialaccount','socialaccount'),(11,'socialaccount','socialapp'),(12,'socialaccount','socialtoken'),(22,'tool','toolcategory'),(21,'tool','toollink');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-28 08:51:54.262992'),(2,'contenttypes','0002_remove_content_type_name','2019-02-28 08:51:54.301285'),(3,'auth','0001_initial','2019-02-28 08:51:54.382601'),(4,'auth','0002_alter_permission_name_max_length','2019-02-28 08:51:54.403508'),(5,'auth','0003_alter_user_email_max_length','2019-02-28 08:51:54.411434'),(6,'auth','0004_alter_user_username_opts','2019-02-28 08:51:54.420027'),(7,'auth','0005_alter_user_last_login_null','2019-02-28 08:51:54.430697'),(8,'auth','0006_require_contenttypes_0002','2019-02-28 08:51:54.441733'),(9,'auth','0007_alter_validators_add_error_messages','2019-02-28 08:51:54.452386'),(10,'auth','0008_alter_user_username_max_length','2019-02-28 08:51:54.464190'),(11,'oauth','0001_initial','2019-02-28 08:51:54.551992'),(12,'account','0001_initial','2019-02-28 08:51:54.615182'),(13,'account','0002_email_max_length','2019-02-28 08:51:54.651019'),(14,'admin','0001_initial','2019-02-28 08:51:54.694115'),(15,'admin','0002_logentry_remove_auto_add','2019-02-28 08:51:54.712074'),(16,'blog','0001_initial','2019-02-28 08:51:54.802718'),(17,'blog','0002_auto_20190228_0851','2019-02-28 08:51:54.939284'),(18,'comment','0001_initial','2019-02-28 08:51:54.974176'),(19,'comment','0002_auto_20190228_0851','2019-02-28 08:51:55.189764'),(20,'sessions','0001_initial','2019-02-28 08:51:55.204761'),(21,'sites','0001_initial','2019-02-28 08:51:55.217528'),(22,'sites','0002_alter_domain_unique','2019-02-28 08:51:55.229311'),(23,'socialaccount','0001_initial','2019-02-28 08:51:55.374904'),(24,'socialaccount','0002_token_max_lengths','2019-02-28 08:51:55.411907'),(25,'socialaccount','0003_extra_data_default_dict','2019-02-28 08:51:55.422675'),(26,'tool','0001_initial','2019-02-28 08:51:55.458962');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('c743yigjnacr8xxtrtds8a1s4q61kkl6','M2YyOTA2MGI1NTlhYTYyNTEyMjdhMDkxNGQ5YjU5MjI4ZjJmYzI5Nzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwLCJfYXV0aF91c2VyX2hhc2giOiJhNmI3YTNlOGI1YjZlYzA3NWVhZTdjNDU4NTc5OTliMjI4MTM5MDkzIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2019-03-14 23:41:20.064341'),('iteabs1jujljvk1pwz9p4zla3efu9w4i','OTRkZTEzYmU5NDAxY2Y2NTFhMzkxZDhmMWQwODc5NzQwNWFkMjM1NDp7Il9zZXNzaW9uX2V4cGlyeSI6MCwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfaGFzaCI6ImE2YjdhM2U4YjViNmVjMDc1ZWFlN2M0NTg1Nzk5OWIyMjgxMzkwOTMifQ==','2019-03-14 23:28:34.112882'),('lnw6uynjupceznu0fncyjpcu96m7gel3','MTQ4MGFmMDJiMmI3N2Y5MDE3MjQ0ZmQzYjUwMGM3ODU4MjQ4ODdkYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX3Nlc3Npb25fZXhwaXJ5IjoxMjA5NjAwLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImE2YjdhM2U4YjViNmVjMDc1ZWFlN2M0NTg1Nzk5OWIyMjgxMzkwOTMifQ==','2019-03-14 14:04:33.396145'),('rmb2exr8neieazohz08b36tml3tbymdy','MDNmMmJkODE2MjVlYzQwMGFjNDQ1ZGU4NDQxMThkNGZhYmU2NjhmMzp7ImlzX3JlYWRfMjUiOjE1NTE0ODg2MjMuMTMxNDY4LCJpc19yZWFkXzI2IjoxNTUxNDg4NTgxLjU2NTE2MzF9','2019-03-16 09:03:43.192383'),('t4ew5i2276baqm19rbquasyucadzcm23','M2FhMjM3MTJkZmY3YmMyMTQyMDE3NTc5MmU3YjEzYzg4MjgyMzQyNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX3Nlc3Npb25fZXhwaXJ5IjowLCJfYXV0aF91c2VyX2hhc2giOiJhNmI3YTNlOGI1YjZlYzA3NWVhZTdjNDU4NTc5OTliMjI4MTM5MDkzIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2019-03-14 21:58:38.713636');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (2,'127.0.0.1:8000','127.0.0.1:8000');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_ouser`
--

DROP TABLE IF EXISTS `oauth_ouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_ouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `link` varchar(200) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_ouser`
--

LOCK TABLES `oauth_ouser` WRITE;
/*!40000 ALTER TABLE `oauth_ouser` DISABLE KEYS */;
INSERT INTO `oauth_ouser` VALUES (1,'pbkdf2_sha256$36000$pU6T0kA89mSV$Aj+S6QDhlMDym5Y9cz54JXK/hXyEPqDv4jscuoq798g=','2019-03-03 00:21:26.727882',1,'Wise-Zhang','','','',1,1,'2019-02-28 08:56:13.080415','https://github.com/','avatar/default.png'),(4,'!2Dc5xmuoh3dkYFqOma2CkzpdvMTPoEHCC2F0KQJc','2019-03-01 22:39:28.181247',0,'1296726935','','','1296726935@qq.com',0,1,'2019-03-01 22:39:28.148584','','avatar/default.png');
/*!40000 ALTER TABLE `oauth_ouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_ouser_groups`
--

DROP TABLE IF EXISTS `oauth_ouser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_ouser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_groups_ouser_id_group_id_4a9e5409_uniq` (`ouser_id`,`group_id`),
  KEY `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` (`group_id`),
  CONSTRAINT `oauth_ouser_groups_group_id_ee861e08_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `oauth_ouser_groups_ouser_id_c543bcdc_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_ouser_groups`
--

LOCK TABLES `oauth_ouser_groups` WRITE;
/*!40000 ALTER TABLE `oauth_ouser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_ouser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_ouser_user_permissions`
--

DROP TABLE IF EXISTS `oauth_ouser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_ouser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ouser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth_ouser_user_permiss_ouser_id_permission_id_ab6b2ccc_uniq` (`ouser_id`,`permission_id`),
  KEY `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `oauth_ouser_user_per_permission_id_2b5b927f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `oauth_ouser_user_permissions_ouser_id_12e23549_fk_oauth_ouser_id` FOREIGN KEY (`ouser_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_ouser_user_permissions`
--

LOCK TABLES `oauth_ouser_user_permissions` WRITE;
/*!40000 ALTER TABLE `oauth_ouser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_ouser_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_oauth_ouser_id` FOREIGN KEY (`user_id`) REFERENCES `oauth_ouser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'github','32256021','2019-03-01 22:39:28.162487','2019-03-01 22:39:28.162512','{\"blog\": \"\", \"avatar_url\": \"https://avatars3.githubusercontent.com/u/32256021?v=4\", \"company\": null, \"events_url\": \"https://api.github.com/users/Wise-zhang/events{/privacy}\", \"type\": \"User\", \"url\": \"https://api.github.com/users/Wise-zhang\", \"id\": 32256021, \"email\": \"1296726935@qq.com\", \"repos_url\": \"https://api.github.com/users/Wise-zhang/repos\", \"location\": null, \"node_id\": \"MDQ6VXNlcjMyMjU2MDIx\", \"bio\": null, \"followers_url\": \"https://api.github.com/users/Wise-zhang/followers\", \"public_repos\": 1, \"gravatar_id\": \"\", \"created_at\": \"2017-09-25T05:47:42Z\", \"followers\": 0, \"received_events_url\": \"https://api.github.com/users/Wise-zhang/received_events\", \"gists_url\": \"https://api.github.com/users/Wise-zhang/gists{/gist_id}\", \"updated_at\": \"2019-03-01T14:33:28Z\", \"following\": 0, \"site_admin\": false, \"login\": \"Wise-zhang\", \"subscriptions_url\": \"https://api.github.com/users/Wise-zhang/subscriptions\", \"name\": null, \"html_url\": \"https://github.com/Wise-zhang\", \"hireable\": null, \"starred_url\": \"https://api.github.com/users/Wise-zhang/starred{/owner}{/repo}\", \"organizations_url\": \"https://api.github.com/users/Wise-zhang/orgs\", \"following_url\": \"https://api.github.com/users/Wise-zhang/following{/other_user}\", \"public_gists\": 0}',4);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp` VALUES (1,'github','GitHub','90c513698bf865d49387','6fa05fbc225e4a33002c8b1cc848a1a1c172a424','');
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
INSERT INTO `socialaccount_socialapp_sites` VALUES (1,1,2);
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
INSERT INTO `socialaccount_socialtoken` VALUES (1,'e8a9f2425cae128e60cfeb8e26f4bee6a6e8c573','',NULL,1,1);
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_toolcategory`
--

DROP TABLE IF EXISTS `tool_toolcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_toolcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `order_num` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_toolcategory`
--

LOCK TABLES `tool_toolcategory` WRITE;
/*!40000 ALTER TABLE `tool_toolcategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_toolcategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_toollink`
--

DROP TABLE IF EXISTS `tool_toollink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tool_toollink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `order_num` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tool_toollink_category_id_87363121_fk_tool_toolcategory_id` (`category_id`),
  CONSTRAINT `tool_toollink_category_id_87363121_fk_tool_toolcategory_id` FOREIGN KEY (`category_id`) REFERENCES `tool_toolcategory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_toollink`
--

LOCK TABLES `tool_toollink` WRITE;
/*!40000 ALTER TABLE `tool_toollink` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_toollink` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-03 10:18:30
