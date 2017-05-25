/* DUPLICATOR MYSQL SCRIPT CREATED ON : 2017-05-23 19:51:32 */

SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_debt_paper_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(50) DEFAULT NULL,
  `payed_number` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_debt_roll_statistic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer` varchar(50) DEFAULT NULL,
  `payed_number` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_duplicator_packages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `hash` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `owner` varchar(60) NOT NULL,
  `package` mediumblob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=861 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_order_paper` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `order_type` text NOT NULL,
  `customer` text,
  `customer_id` int(11) DEFAULT NULL,
  `phone` bigint(6) NOT NULL,
  `printing_count` int(6) NOT NULL,
  `page_count` int(6) NOT NULL,
  `size_x` float NOT NULL,
  `size_y` float NOT NULL,
  `material` text NOT NULL,
  `form_id` int(11) NOT NULL,
  `form` smallint(6) NOT NULL,
  `foil_id` int(11) NOT NULL,
  `foil` smallint(6) NOT NULL,
  `rubber_id` int(11) NOT NULL,
  `rubber` smallint(6) NOT NULL,
  `lacquer_id` int(11) NOT NULL,
  `lacquer` smallint(6) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `debt` int(11) NOT NULL,
  `paid` int(11) NOT NULL DEFAULT '0',
  `status` text NOT NULL,
  `type` text NOT NULL,
  `type_of_order` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_order_roll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `order_type` text NOT NULL,
  `customer` text,
  `customer_id` int(11) DEFAULT NULL,
  `phone` bigint(11) NOT NULL,
  `printing_count` int(6) NOT NULL,
  `count_per_page` int(6) NOT NULL,
  `step_lenght` float NOT NULL,
  `label_count` int(6) NOT NULL,
  `material` text NOT NULL,
  `form_id` int(11) NOT NULL,
  `form` int(6) NOT NULL,
  `foil_id` int(11) NOT NULL,
  `foil` int(6) NOT NULL,
  `rubber_id` int(11) NOT NULL,
  `rubber` int(6) NOT NULL,
  `lacquer_id` int(11) NOT NULL,
  `lacquer` int(6) NOT NULL,
  `selling_price` int(11) NOT NULL,
  `debt` int(11) NOT NULL,
  `paid` int(11) NOT NULL DEFAULT '0',
  `status` text NOT NULL,
  `type` text NOT NULL,
  `type_of_order` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=519 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(255) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=MyISAM AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_product_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `type` text NOT NULL,
  `count` float NOT NULL,
  `price` float NOT NULL,
  `percent` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_product_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `company` text NOT NULL,
  `density` int(11) NOT NULL,
  `type` text NOT NULL,
  `size_x` float NOT NULL,
  `size_y` float NOT NULL,
  `one_page_weight` float NOT NULL,
  `page_count` float NOT NULL,
  `weight` float NOT NULL,
  `price` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_product_roll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `company` text NOT NULL,
  `type` text NOT NULL,
  `size_x` float NOT NULL,
  `size_y` float NOT NULL,
  `area` float NOT NULL,
  `price` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_sale_other` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `paint_count` int(11) NOT NULL,
  `paint_id` int(11) NOT NULL,
  `form_count` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `foil_count` int(11) NOT NULL,
  `foil_id` int(11) NOT NULL,
  `rubber_count` int(11) NOT NULL,
  `rubber_id` int(11) NOT NULL,
  `lacquer_count` int(11) NOT NULL,
  `lacquer_id` int(11) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_sale_other_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_sale_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `material_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_sale_paper_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `size_x` int(11) NOT NULL,
  `size_y` int(11) NOT NULL,
  `density` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_sale_roll` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `material_id` int(11) NOT NULL,
  `area` float NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_sale_roll_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `size_x` int(11) NOT NULL,
  `size_y` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

CREATE TABLE `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(255) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;


/* INSERT TABLE DATA: wp_comments */
INSERT INTO `wp_comments` VALUES("1", "1", "Автор комментария", "wapuu@wordpress.example", "https://wordpress.org/", "", "2017-02-20 03:06:01", "2017-02-20 00:06:01", "Привет! Это комментарий.\nЧтобы начать модерировать, редактировать и удалять комментарии, перейдите на экран «Комментарии» в консоли.\nАватары авторов комментариев загружаются с сервиса <a href=\"https://ru.gravatar.com\">Gravatar</a>.", "0", "1", "", "", "0", "0");

/* INSERT TABLE DATA: wp_customers */
INSERT INTO `wp_customers` VALUES("1", "Sargis");
INSERT INTO `wp_customers` VALUES("2", "Vilenchik");
INSERT INTO `wp_customers` VALUES("3", "Messi");
INSERT INTO `wp_customers` VALUES("4", "Ashtarak kat");

/* INSERT TABLE DATA: wp_duplicator_packages */
INSERT INTO `wp_duplicator_packages` VALUES("1", "20170523_ayasprint", "ebbb55039f2d0ab47493170523194116", "100", "2017-05-23 19:41:44", "Artyom_admin", "O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2017-05-23 19:41:16\";s:7:\"Version\";s:5:\"1.2.8\";s:9:\"VersionWP\";s:5:\"4.7.4\";s:9:\"VersionDB\";s:6:\"5.6.17\";s:10:\"VersionPHP\";s:6:\"5.5.12\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";i:1;s:4:\"Name\";s:18:\"20170523_ayasprint\";s:4:\"Hash\";s:32:\"ebbb55039f2d0ab47493170523194116\";s:8:\"NameHash\";s:51:\"20170523_ayasprint_ebbb55039f2d0ab47493170523194116\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:28:\"D:/wamp/www/wp-snapshots/tmp\";s:8:\"StoreURL\";s:30:\"http://localhost/wp-snapshots/\";s:8:\"ScanFile\";s:61:\"20170523_ayasprint_ebbb55039f2d0ab47493170523194116_scan.json\";s:7:\"Runtime\";s:10:\"23.41 sec.\";s:7:\"ExeSize\";s:8:\"428.38KB\";s:7:\"ZipSize\";s:7:\"18.26MB\";s:6:\"Status\";N;s:6:\"WPUser\";s:12:\"Artyom_admin\";s:7:\"Archive\";O:11:\"DUP_Archive\":14:{s:10:\"FilterDirs\";s:0:\"\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:0;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";s:63:\"20170523_ayasprint_ebbb55039f2d0ab47493170523194116_archive.zip\";s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:11:\"D:/wamp/www\";s:4:\"Size\";i:19147871;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":6:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":4:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":5:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":2:{s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;}s:10:\"\0*\0Package\";r:1;}s:9:\"Installer\";O:13:\"DUP_Installer\":12:{s:4:\"File\";s:65:\"20170523_ayasprint_ebbb55039f2d0ab47493170523194116_installer.php\";s:4:\"Size\";i:438660;s:10:\"OptsDBHost\";s:0:\"\";s:10:\"OptsDBPort\";s:0:\"\";s:10:\"OptsDBName\";s:0:\"\";s:10:\"OptsDBUser\";s:0:\"\";s:12:\"OptsSSLAdmin\";i:0;s:12:\"OptsSSLLogin\";i:0;s:11:\"OptsCacheWP\";i:0;s:13:\"OptsCachePath\";i:0;s:10:\"OptsURLNew\";s:0:\"\";s:10:\"\0*\0Package\";r:1;}s:8:\"Database\";O:12:\"DUP_Database\":13:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";i:292208;s:4:\"File\";s:64:\"20170523_ayasprint_ebbb55039f2d0ab47493170523194116_database.sql\";s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:28:\"MySQL Community Server (GPL)\";s:10:\"\0*\0Package\";r:1;s:25:\"\0DUP_Database\0dbStorePath\";s:93:\"D:/wamp/www/wp-snapshots/tmp/20170523_ayasprint_ebbb55039f2d0ab47493170523194116_database.sql\";s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;}}");
INSERT INTO `wp_duplicator_packages` VALUES("2", "20170523_ayasprint", "83d8c503b69b448b9810170523195110", "20", "2017-05-23 19:51:32", "Artyom_admin", "O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2017-05-23 19:51:10\";s:7:\"Version\";s:5:\"1.2.8\";s:9:\"VersionWP\";s:5:\"4.7.4\";s:9:\"VersionDB\";s:6:\"5.6.17\";s:10:\"VersionPHP\";s:6:\"5.5.12\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";i:2;s:4:\"Name\";s:18:\"20170523_ayasprint\";s:4:\"Hash\";s:32:\"83d8c503b69b448b9810170523195110\";s:8:\"NameHash\";s:51:\"20170523_ayasprint_83d8c503b69b448b9810170523195110\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:28:\"D:/wamp/www/wp-snapshots/tmp\";s:8:\"StoreURL\";s:30:\"http://localhost/wp-snapshots/\";s:8:\"ScanFile\";s:61:\"20170523_ayasprint_83d8c503b69b448b9810170523195110_scan.json\";s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";s:12:\"Artyom_admin\";s:7:\"Archive\";O:11:\"DUP_Archive\":14:{s:10:\"FilterDirs\";s:0:\"\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:0;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";s:63:\"20170523_ayasprint_83d8c503b69b448b9810170523195110_archive.zip\";s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:11:\"D:/wamp/www\";s:4:\"Size\";i:0;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":6:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":4:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":5:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":2:{s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;}s:10:\"\0*\0Package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2017-05-23 19:51:10\";s:7:\"Version\";s:5:\"1.2.8\";s:9:\"VersionWP\";s:5:\"4.7.4\";s:9:\"VersionDB\";s:6:\"5.6.17\";s:10:\"VersionPHP\";s:6:\"5.5.12\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:18:\"20170523_ayasprint\";s:4:\"Hash\";s:32:\"83d8c503b69b448b9810170523195110\";s:8:\"NameHash\";s:51:\"20170523_ayasprint_83d8c503b69b448b9810170523195110\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:28:\"D:/wamp/www/wp-snapshots/tmp\";s:8:\"StoreURL\";s:30:\"http://localhost/wp-snapshots/\";s:8:\"ScanFile\";N;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";r:22;s:9:\"Installer\";O:13:\"DUP_Installer\":12:{s:4:\"File\";s:65:\"20170523_ayasprint_83d8c503b69b448b9810170523195110_installer.php\";s:4:\"Size\";i:0;s:10:\"OptsDBHost\";s:9:\"localhost\";s:10:\"OptsDBPort\";s:2:\"80\";s:10:\"OptsDBName\";s:12:\"cf09127_main\";s:10:\"OptsDBUser\";s:12:\"cf09127_main\";s:12:\"OptsSSLAdmin\";i:0;s:12:\"OptsSSLLogin\";i:0;s:11:\"OptsCacheWP\";i:0;s:13:\"OptsCachePath\";i:0;s:10:\"OptsURLNew\";s:0:\"\";s:10:\"\0*\0Package\";r:53;}s:8:\"Database\";O:12:\"DUP_Database\":13:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";N;s:4:\"File\";s:64:\"20170523_ayasprint_83d8c503b69b448b9810170523195110_database.sql\";s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:28:\"MySQL Community Server (GPL)\";s:10:\"\0*\0Package\";r:1;s:25:\"\0DUP_Database\0dbStorePath\";N;s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;}}}s:9:\"Installer\";r:75;s:8:\"Database\";r:88;}");

/* INSERT TABLE DATA: wp_options */
INSERT INTO `wp_options` VALUES("1", "siteurl", "http://cf09127.tmweb.ru", "yes");
INSERT INTO `wp_options` VALUES("2", "home", "http://cf09127.tmweb.ru", "yes");
INSERT INTO `wp_options` VALUES("3", "blogname", "AYAS PRINT", "yes");
INSERT INTO `wp_options` VALUES("4", "blogdescription", "", "yes");
INSERT INTO `wp_options` VALUES("5", "users_can_register", "0", "yes");
INSERT INTO `wp_options` VALUES("6", "admin_email", "gevs91.p@gmail.com", "yes");
INSERT INTO `wp_options` VALUES("7", "start_of_week", "1", "yes");
INSERT INTO `wp_options` VALUES("8", "use_balanceTags", "0", "yes");
INSERT INTO `wp_options` VALUES("9", "use_smilies", "1", "yes");
INSERT INTO `wp_options` VALUES("10", "require_name_email", "1", "yes");
INSERT INTO `wp_options` VALUES("11", "comments_notify", "1", "yes");
INSERT INTO `wp_options` VALUES("12", "posts_per_rss", "10", "yes");
INSERT INTO `wp_options` VALUES("13", "rss_use_excerpt", "0", "yes");
INSERT INTO `wp_options` VALUES("14", "mailserver_url", "mail.example.com", "yes");
INSERT INTO `wp_options` VALUES("15", "mailserver_login", "login@example.com", "yes");
INSERT INTO `wp_options` VALUES("16", "mailserver_pass", "password", "yes");
INSERT INTO `wp_options` VALUES("17", "mailserver_port", "110", "yes");
INSERT INTO `wp_options` VALUES("18", "default_category", "1", "yes");
INSERT INTO `wp_options` VALUES("19", "default_comment_status", "open", "yes");
INSERT INTO `wp_options` VALUES("20", "default_ping_status", "open", "yes");
INSERT INTO `wp_options` VALUES("21", "default_pingback_flag", "0", "yes");
INSERT INTO `wp_options` VALUES("22", "posts_per_page", "10", "yes");
INSERT INTO `wp_options` VALUES("23", "date_format", "d.m.Y", "yes");
INSERT INTO `wp_options` VALUES("24", "time_format", "H:i", "yes");
INSERT INTO `wp_options` VALUES("25", "links_updated_date_format", "d.m.Y H:i", "yes");
INSERT INTO `wp_options` VALUES("26", "comment_moderation", "0", "yes");
INSERT INTO `wp_options` VALUES("27", "moderation_notify", "1", "yes");
INSERT INTO `wp_options` VALUES("28", "permalink_structure", "/%year%/%monthnum%/%day%/%postname%/", "yes");
INSERT INTO `wp_options` VALUES("29", "rewrite_rules", "a:91:{s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:39:\"index.php?&page_id=29&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}", "yes");
INSERT INTO `wp_options` VALUES("30", "hack_file", "0", "yes");
INSERT INTO `wp_options` VALUES("31", "blog_charset", "UTF-8", "yes");
INSERT INTO `wp_options` VALUES("32", "moderation_keys", "", "no");
INSERT INTO `wp_options` VALUES("33", "active_plugins", "a:2:{i:0;s:25:\"duplicator/duplicator.php\";i:1;s:27:\"wp-super-cache/wp-cache.php\";}", "yes");
INSERT INTO `wp_options` VALUES("34", "category_base", "", "yes");
INSERT INTO `wp_options` VALUES("35", "ping_sites", "http://rpc.pingomatic.com/", "yes");
INSERT INTO `wp_options` VALUES("36", "comment_max_links", "2", "yes");
INSERT INTO `wp_options` VALUES("37", "gmt_offset", "3", "yes");
INSERT INTO `wp_options` VALUES("38", "default_email_category", "1", "yes");
INSERT INTO `wp_options` VALUES("39", "recently_edited", "a:2:{i:0;s:98:\"D:\\wamp\\www/wp-content/plugins/wp-super-cache-clear-cache-menu/wp-super-cache-clear-cache-menu.php\";i:2;s:0:\"\";}", "no");
INSERT INTO `wp_options` VALUES("40", "template", "twentyfifteen", "yes");
INSERT INTO `wp_options` VALUES("41", "stylesheet", "twentyfifteen", "yes");
INSERT INTO `wp_options` VALUES("42", "comment_whitelist", "1", "yes");
INSERT INTO `wp_options` VALUES("43", "blacklist_keys", "", "no");
INSERT INTO `wp_options` VALUES("44", "comment_registration", "0", "yes");
INSERT INTO `wp_options` VALUES("45", "html_type", "text/html", "yes");
INSERT INTO `wp_options` VALUES("46", "use_trackback", "0", "yes");
INSERT INTO `wp_options` VALUES("47", "default_role", "subscriber", "yes");
INSERT INTO `wp_options` VALUES("48", "db_version", "38590", "yes");
INSERT INTO `wp_options` VALUES("49", "uploads_use_yearmonth_folders", "1", "yes");
INSERT INTO `wp_options` VALUES("50", "upload_path", "", "yes");
INSERT INTO `wp_options` VALUES("51", "blog_public", "0", "yes");
INSERT INTO `wp_options` VALUES("52", "default_link_category", "2", "yes");
INSERT INTO `wp_options` VALUES("53", "show_on_front", "page", "yes");
INSERT INTO `wp_options` VALUES("54", "tag_base", "", "yes");
INSERT INTO `wp_options` VALUES("55", "show_avatars", "1", "yes");
INSERT INTO `wp_options` VALUES("56", "avatar_rating", "G", "yes");
INSERT INTO `wp_options` VALUES("57", "upload_url_path", "", "yes");
INSERT INTO `wp_options` VALUES("58", "thumbnail_size_w", "150", "yes");
INSERT INTO `wp_options` VALUES("59", "thumbnail_size_h", "150", "yes");
INSERT INTO `wp_options` VALUES("60", "thumbnail_crop", "1", "yes");
INSERT INTO `wp_options` VALUES("61", "medium_size_w", "300", "yes");
INSERT INTO `wp_options` VALUES("62", "medium_size_h", "300", "yes");
INSERT INTO `wp_options` VALUES("63", "avatar_default", "mystery", "yes");
INSERT INTO `wp_options` VALUES("64", "large_size_w", "1024", "yes");
INSERT INTO `wp_options` VALUES("65", "large_size_h", "1024", "yes");
INSERT INTO `wp_options` VALUES("66", "image_default_link_type", "none", "yes");
INSERT INTO `wp_options` VALUES("67", "image_default_size", "", "yes");
INSERT INTO `wp_options` VALUES("68", "image_default_align", "", "yes");
INSERT INTO `wp_options` VALUES("69", "close_comments_for_old_posts", "0", "yes");
INSERT INTO `wp_options` VALUES("70", "close_comments_days_old", "14", "yes");
INSERT INTO `wp_options` VALUES("71", "thread_comments", "1", "yes");
INSERT INTO `wp_options` VALUES("72", "thread_comments_depth", "5", "yes");
INSERT INTO `wp_options` VALUES("73", "page_comments", "0", "yes");
INSERT INTO `wp_options` VALUES("74", "comments_per_page", "50", "yes");
INSERT INTO `wp_options` VALUES("75", "default_comments_page", "newest", "yes");
INSERT INTO `wp_options` VALUES("76", "comment_order", "asc", "yes");
INSERT INTO `wp_options` VALUES("77", "sticky_posts", "a:0:{}", "yes");
INSERT INTO `wp_options` VALUES("78", "widget_categories", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("79", "widget_text", "a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("80", "widget_rss", "a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("81", "uninstall_plugins", "a:1:{s:27:\"wp-super-cache/wp-cache.php\";s:22:\"wpsupercache_uninstall\";}", "no");
INSERT INTO `wp_options` VALUES("82", "timezone_string", "", "yes");
INSERT INTO `wp_options` VALUES("83", "page_for_posts", "0", "yes");
INSERT INTO `wp_options` VALUES("84", "page_on_front", "29", "yes");
INSERT INTO `wp_options` VALUES("85", "default_post_format", "0", "yes");
INSERT INTO `wp_options` VALUES("86", "link_manager_enabled", "0", "yes");
INSERT INTO `wp_options` VALUES("87", "finished_splitting_shared_terms", "1", "yes");
INSERT INTO `wp_options` VALUES("88", "site_icon", "0", "yes");
INSERT INTO `wp_options` VALUES("89", "medium_large_size_w", "768", "yes");
INSERT INTO `wp_options` VALUES("90", "medium_large_size_h", "0", "yes");
INSERT INTO `wp_options` VALUES("91", "initial_db_version", "38590", "yes");
INSERT INTO `wp_options` VALUES("92", "wp_user_roles", "a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:61:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}", "yes");
INSERT INTO `wp_options` VALUES("93", "fresh_site", "0", "yes");
INSERT INTO `wp_options` VALUES("94", "WPLANG", "ru_RU", "yes");
INSERT INTO `wp_options` VALUES("95", "widget_search", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("96", "widget_recent-posts", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("97", "widget_recent-comments", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("98", "widget_archives", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("99", "widget_meta", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("100", "sidebars_widgets", "a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:0:{}s:13:\"array_version\";i:3;}", "yes");
INSERT INTO `wp_options` VALUES("145", "nav_menu_options", "a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}", "yes");
INSERT INTO `wp_options` VALUES("101", "widget_pages", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("102", "widget_calendar", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("103", "widget_tag_cloud", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("104", "widget_nav_menu", "a:1:{s:12:\"_multiwidget\";i:1;}", "yes");
INSERT INTO `wp_options` VALUES("105", "cron", "a:4:{i:1495584362;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1495584419;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1495584423;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}", "yes");
INSERT INTO `wp_options` VALUES("106", "theme_mods_twentyseventeen", "a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1487549583;s:4:\"data\";a:4:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:9:\"sidebar-2\";a:0:{}s:9:\"sidebar-3\";a:0:{}}}}", "yes");
INSERT INTO `wp_options` VALUES("624", "_transient_timeout_feed_d117b5738fbd35bd8c0391cda1f2b5d9", "1490491900", "no");
INSERT INTO `wp_options` VALUES("625", "_transient_timeout_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9", "1490491900", "no");
INSERT INTO `wp_options` VALUES("626", "_transient_feed_mod_d117b5738fbd35bd8c0391cda1f2b5d9", "1490448700", "no");
INSERT INTO `wp_options` VALUES("629", "_transient_timeout_feed_mod_b9388c83948825c1edaef0d856b7b109", "1490491901", "no");
INSERT INTO `wp_options` VALUES("630", "_transient_feed_mod_b9388c83948825c1edaef0d856b7b109", "1490448701", "no");
INSERT INTO `wp_options` VALUES("623", "_transient_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca", "1490448698", "no");
INSERT INTO `wp_options` VALUES("621", "_transient_timeout_feed_ac0b00fe65abe10e0c5b588f3ed8c7ca", "1490491898", "no");
INSERT INTO `wp_options` VALUES("622", "_transient_timeout_feed_mod_ac0b00fe65abe10e0c5b588f3ed8c7ca", "1490491898", "no");
INSERT INTO `wp_options` VALUES("118", "can_compress_scripts", "0", "no");
INSERT INTO `wp_options` VALUES("816", "_site_transient_timeout_theme_roots", "1495568594", "no");
INSERT INTO `wp_options` VALUES("817", "_site_transient_theme_roots", "a:1:{s:13:\"twentyfifteen\";s:7:\"/themes\";}", "no");
INSERT INTO `wp_options` VALUES("447", "_site_transient_timeout_browser_cd07c4a7a86f684d711f0467bdfe13bf", "1489945843", "no");
INSERT INTO `wp_options` VALUES("533", "_site_transient_timeout_browser_88337cd9fed317d029aaa03191c0be0b", "1490439408", "no");
INSERT INTO `wp_options` VALUES("534", "_site_transient_browser_88337cd9fed317d029aaa03191c0be0b", "a:9:{s:8:\"platform\";s:7:\"Windows\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"56.0.2924.87\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}", "no");
INSERT INTO `wp_options` VALUES("448", "_site_transient_browser_cd07c4a7a86f684d711f0467bdfe13bf", "a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Safari\";s:7:\"version\";s:6:\"10.0.1\";s:10:\"update_url\";s:28:\"http://www.apple.com/safari/\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/safari.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/safari.png\";s:15:\"current_version\";s:1:\"5\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}", "no");
INSERT INTO `wp_options` VALUES("627", "_transient_timeout_feed_b9388c83948825c1edaef0d856b7b109", "1490491901", "no");
INSERT INTO `wp_options` VALUES("628", "_transient_feed_b9388c83948825c1edaef0d856b7b109", "a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:3:\"\n \n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:117:\"\n   \n    \n    \n    \n    \n    \n        \n\n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n\n  \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:7:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"WordPress Plugins » View: Popular\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:45:\"https://wordpress.org/plugins/browse/popular/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"WordPress Plugins » View: Popular\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:8:\"language\";a:1:{i:0;a:5:{s:4:\"data\";s:5:\"en-US\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 25 Mar 2017 13:14:05 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:9:\"generator\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"http://bbpress.org/?v=1.1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:30:{i:0;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"All in One SEO Pack\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://wordpress.org/plugins/all-in-one-seo-pack/#post-753\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 30 Mar 2007 20:08:18 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"753@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:83:\"The original SEO plugin for WordPress, downloaded over 30,000,000 times since 2007.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"uberdose\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"Akismet\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:46:\"https://wordpress.org/plugins/akismet/#post-15\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Mar 2007 22:11:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"15@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:146:\"Akismet checks your comments and contact form submissions against our global database of spam to protect you and your site from malicious content.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Matt Mullenweg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"WP Super Cache\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://wordpress.org/plugins/wp-super-cache/#post-2572\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Nov 2007 11:40:04 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"2572@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"A very fast caching engine for WordPress that produces static html files.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"Donncha O Caoimh\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Really Simple CAPTCHA\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://wordpress.org/plugins/really-simple-captcha/#post-9542\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 09 Mar 2009 02:17:35 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"9542@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:138:\"Really Simple CAPTCHA is a CAPTCHA module intended to be called from other plugins. It is originally created for my Contact Form 7 plugin.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"Takayuki Miyoshi\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"Yoast SEO\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"https://wordpress.org/plugins/wordpress-seo/#post-8321\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 01 Jan 2009 20:34:44 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"8321@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:118:\"Improve your WordPress SEO: Write better content and have a fully optimized WordPress site using the Yoast SEO plugin.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"Joost de Valk\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:42:\"NextGEN Gallery - WordPress Gallery Plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/plugins/nextgen-gallery/#post-1169\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 23 Apr 2007 20:08:06 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"1169@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:123:\"The most popular WordPress gallery plugin and one of the most popular plugins of all time with over 16.5 million downloads.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"Alex Rabe\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"WP-PageNavi\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"https://wordpress.org/plugins/wp-pagenavi/#post-363\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Mar 2007 23:17:57 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"363@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"Adds a more advanced paging navigation interface.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Lester Chan\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:19:\"Google XML Sitemaps\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://wordpress.org/plugins/google-sitemap-generator/#post-132\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 09 Mar 2007 22:31:32 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:34:\"132@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:105:\"This plugin will generate a special XML sitemap which will help search engines to better index your blog.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Arne Brachhold\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"W3 Total Cache\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:56:\"https://wordpress.org/plugins/w3-total-cache/#post-12073\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 29 Jul 2009 18:46:31 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"12073@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:144:\"Search Engine (SEO) &#38; Performance Optimization (WPO) via caching. Integrated caching: CDN, Minify, Page, Object, Fragment, Database support.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"Frederick Townes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"TinyMCE Advanced\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:57:\"https://wordpress.org/plugins/tinymce-advanced/#post-2082\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 27 Jun 2007 15:00:26 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"2082@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"Extends and enhances TinyMCE, the WordPress Visual Editor.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Andrew Ozz\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:10;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"Jetpack by WordPress.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"https://wordpress.org/plugins/jetpack/#post-23862\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 20 Jan 2011 02:21:38 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"23862@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:148:\"The one plugin you need for stats, related posts, search engine optimization, social sharing, protection, backups, speed, and email list management.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Automattic\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:11;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"WordPress Importer\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://wordpress.org/plugins/wordpress-importer/#post-18101\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 20 May 2010 17:42:45 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"18101@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:101:\"Import posts, pages, comments, custom fields, categories, tags and more from a WordPress export file.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Brian Colinger\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:12;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:22:\"Advanced Custom Fields\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:64:\"https://wordpress.org/plugins/advanced-custom-fields/#post-25254\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 17 Mar 2011 04:07:30 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"25254@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:68:\"Customise WordPress with powerful, professional and intuitive fields\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"elliotcondon\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:13;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Contact Form 7\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://wordpress.org/plugins/contact-form-7/#post-2141\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 02 Aug 2007 12:45:03 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"2141@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"Just another contact form plugin. Simple but flexible.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"Takayuki Miyoshi\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:14;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Duplicate Post\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:55:\"https://wordpress.org/plugins/duplicate-post/#post-2646\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Wed, 05 Dec 2007 17:40:03 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"2646@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:22:\"Clone posts and pages.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:4:\"Lopo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:15;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"Page Builder by SiteOrigin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://wordpress.org/plugins/siteorigin-panels/#post-51888\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 11 Apr 2013 10:36:42 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"51888@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:111:\"Build responsive page layouts using the widgets you know and love using this simple drag and drop page builder.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Greg Priday\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:16;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Regenerate Thumbnails\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:62:\"https://wordpress.org/plugins/regenerate-thumbnails/#post-6743\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 23 Aug 2008 14:38:58 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"6743@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"Allows you to regenerate your thumbnails after changing the thumbnail sizes.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"Alex Mills (Viper007Bond)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:17;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Hello Dolly\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"https://wordpress.org/plugins/hello-dolly/#post-5790\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 29 May 2008 22:11:34 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"5790@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:150:\"This is not just a plugin, it symbolizes the hope and enthusiasm of an entire generation summed up in two words sung most famously by Louis Armstrong.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Matt Mullenweg\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:18;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"WooCommerce\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"https://wordpress.org/plugins/woocommerce/#post-29860\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 05 Sep 2011 08:13:36 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"29860@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:97:\"WooCommerce is a powerful, extendable eCommerce plugin that helps you sell anything. Beautifully.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"WooThemes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:19;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"UpdraftPlus WordPress Backup Plugin\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"https://wordpress.org/plugins/updraftplus/#post-38058\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 21 May 2012 15:14:11 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"38058@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:148:\"Backup and restoration made easy. Complete backups; manual or scheduled (backup to S3, Dropbox, Google Drive, Rackspace, FTP, SFTP, email + others).\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"David Anderson\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:20;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"Google Analytics for WordPress by MonsterInsights\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"https://wordpress.org/plugins/google-analytics-for-wordpress/#post-2316\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 14 Sep 2007 12:15:27 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:35:\"2316@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:125:\"The best Google Analytics plugin for WordPress. See how visitors find and use your website, so you can keep them coming back.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Syed Balkhi\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:21;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"Wordfence Security\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:51:\"https://wordpress.org/plugins/wordfence/#post-29832\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sun, 04 Sep 2011 03:13:51 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"29832@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:149:\"Secure your website with the most comprehensive WordPress security plugin. Firewall, malware scan, blocking, live traffic, login security &#38; more.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"Wordfence\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:22;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:33:\"Google Analytics Dashboard for WP\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:75:\"https://wordpress.org/plugins/google-analytics-dashboard-for-wp/#post-50539\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sun, 10 Mar 2013 17:07:11 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"50539@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:125:\"Displays Google Analytics stats in your WordPress Dashboard. Inserts the latest Google Analytics tracking code in your pages.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Alin Marcu\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:23;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Duplicator\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:52:\"https://wordpress.org/plugins/duplicator/#post-26607\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Mon, 16 May 2011 12:15:41 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"26607@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:88:\"Duplicate, clone, backup, move and transfer an entire site from one location to another.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Cory Lamle\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:24;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"Disable Comments\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:58:\"https://wordpress.org/plugins/disable-comments/#post-26907\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 27 May 2011 04:42:58 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"26907@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:150:\"Allows administrators to globally disable comments on their site. Comments can be disabled according to post type. Multisite friendly. Provides tool t\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:10:\"Samir Shah\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:25;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:18:\"WP Multibyte Patch\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://wordpress.org/plugins/wp-multibyte-patch/#post-28395\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 14 Jul 2011 12:22:53 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"28395@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:71:\"Multibyte functionality enhancement for the WordPress Japanese package.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:13:\"plugin-master\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:26;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:27:\"Black Studio TinyMCE Widget\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:69:\"https://wordpress.org/plugins/black-studio-tinymce-widget/#post-31973\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Thu, 10 Nov 2011 15:06:14 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"31973@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:39:\"The visual editor widget for Wordpress.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Marco Chiesi\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:27;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"SiteOrigin Widgets Bundle\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:59:\"https://wordpress.org/plugins/so-widgets-bundle/#post-67824\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Sat, 24 May 2014 14:27:05 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"67824@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:128:\"A collection of all widgets, neatly bundled into a single plugin. It&#039;s also a framework to code your own widgets on top of.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Greg Priday\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:28;a:6:{s:4:\"data\";s:30:\"\n      \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:46:\"iThemes Security (formerly Better WP Security)\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:60:\"https://wordpress.org/plugins/better-wp-security/#post-21738\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Fri, 22 Oct 2010 22:06:05 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"21738@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:146:\"Take the guesswork out of WordPress security. iThemes Security offers 30+ ways to lock down WordPress in an easy-to-use WordPress security plugin.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"iThemes\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:29;a:6:{s:4:\"data\";s:30:\"\n     \n      \n      \n      \n      \n      \n          \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:5:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Ninja Forms\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:53:\"https://wordpress.org/plugins/ninja-forms/#post-33147\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"pubDate\";a:1:{i:0;a:5:{s:4:\"data\";s:31:\"Tue, 20 Dec 2011 18:11:48 +0000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"guid\";a:1:{i:0;a:5:{s:4:\"data\";s:36:\"33147@https://wordpress.org/plugins/\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:11:\"isPermaLink\";s:5:\"false\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:147:\"Drag and drop fields in an intuitive UI to create create contact forms, email subscription forms, order forms, payment forms, send emails and more!\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:1:{s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"Kevin Stover\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:27:\"http://www.w3.org/2005/Atom\";a:1:{s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:0:\"\";s:7:\"attribs\";a:1:{s:0:\"\";a:3:{s:4:\"href\";s:46:\"https://wordpress.org/plugins/rss/view/popular\";s:3:\"rel\";s:4:\"self\";s:4:\"type\";s:19:\"application/rss+xml\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";O:42:\"Requests_Utility_CaseInsensitiveDictionary\":1:{s:7:\"\0*\0data\";a:12:{s:6:\"server\";s:5:\"nginx\";s:4:\"date\";s:29:\"Sat, 25 Mar 2017 13:31:41 GMT\";s:12:\"content-type\";s:23:\"text/xml; charset=UTF-8\";s:4:\"vary\";s:15:\"Accept-Encoding\";s:25:\"strict-transport-security\";s:11:\"max-age=360\";s:7:\"expires\";s:29:\"Sat, 25 Mar 2017 13:49:05 GMT\";s:13:\"cache-control\";s:0:\"\";s:6:\"pragma\";s:0:\"\";s:13:\"last-modified\";s:31:\"Sat, 25 Mar 2017 13:14:05 +0000\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:4:\"x-nc\";s:11:\"HIT lax 249\";s:16:\"content-encoding\";s:4:\"gzip\";}}s:5:\"build\";s:14:\"20170220000248\";}", "no");
INSERT INTO `wp_options` VALUES("631", "_transient_timeout_plugin_slugs", "1495654517", "no");
INSERT INTO `wp_options` VALUES("632", "_transient_plugin_slugs", "a:2:{i:0;s:25:\"duplicator/duplicator.php\";i:1;s:27:\"wp-super-cache/wp-cache.php\";}", "no");
INSERT INTO `wp_options` VALUES("633", "_transient_timeout_dash_f69de0bbfe7eaa113146875f40c02000", "1490491901", "no");
INSERT INTO `wp_options` VALUES("634", "_transient_dash_f69de0bbfe7eaa113146875f40c02000", "<div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wordpress.org/news/2017/03/wordpress-4-7-3-security-and-maintenance-release/\'>WordPress 4.7.3 Security and Maintenance Release</a> <span class=\"rss-date\">06.03.2017</span><div class=\"rssSummary\">WordPress 4.7.3 is now available. This is a security release for all previous versions and we strongly encourage you to update your sites immediately. WordPress versions 4.7.2 and earlier are affected by six security issues: Cross-site scripting (XSS) via media file metadata.  Reported by Chris Andrè Dale, Yorick Koster, and Simon P. Briggs. Control characters can trick redirect [&hellip;]</div></li></ul></div><div class=\"rss-widget\"><ul><li><a class=\'rsswidget\' href=\'https://wptavern.com/wordcamp-miami-2017-will-livestream-all-sessions-this-weekend\'>WPTavern: WordCamp Miami 2017 Will Livestream All Sessions this Weekend</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/medium-aims-to-fix-broken-media-with-new-5-subscription-program\'>WPTavern: Medium Aims to Fix ‘Broken’ Media with New $5 Subscription Program</a></li><li><a class=\'rsswidget\' href=\'https://wptavern.com/how-to-find-the-age-of-a-plugin-hosted-in-the-wordpress-plugin-directory\'>WPTavern: How to Find the Age of a Plugin Hosted in the WordPress Plugin Directory</a></li></ul></div><div class=\"rss-widget\"><ul><li class=\"dashboard-news-plugin\"><span>Популярный плагин:</span> UpdraftPlus WordPress Backup Plugin&nbsp;<a href=\"plugin-install.php?tab=plugin-information&amp;plugin=updraftplus&amp;_wpnonce=6124009514&amp;TB_iframe=true&amp;width=600&amp;height=800\" class=\"thickbox open-plugin-details-modal\" aria-label=\"Установить UpdraftPlus WordPress Backup Plugin\">(Установить)</a></li></ul></div>", "no");
INSERT INTO `wp_options` VALUES("409", "_site_transient_timeout_browser_06981e5cdbd5e21309831222a3771c7f", "1489870745", "no");
INSERT INTO `wp_options` VALUES("410", "_site_transient_browser_06981e5cdbd5e21309831222a3771c7f", "a:9:{s:8:\"platform\";s:5:\"Linux\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"57.0.2987.98\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}", "no");
INSERT INTO `wp_options` VALUES("820", "_site_transient_timeout_available_translations", "1495577719", "no");
INSERT INTO `wp_options` VALUES("821", "_site_transient_available_translations", "a:108:{s:2:\"af\";a:8:{s:8:\"language\";s:2:\"af\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-27 04:32:49\";s:12:\"english_name\";s:9:\"Afrikaans\";s:11:\"native_name\";s:9:\"Afrikaans\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/af.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"af\";i:2;s:3:\"afr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Gaan voort\";}}s:2:\"ar\";a:8:{s:8:\"language\";s:2:\"ar\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:49:08\";s:12:\"english_name\";s:6:\"Arabic\";s:11:\"native_name\";s:14:\"العربية\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/ar.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:2;s:3:\"ara\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:3:\"ary\";a:8:{s:8:\"language\";s:3:\"ary\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:42:35\";s:12:\"english_name\";s:15:\"Moroccan Arabic\";s:11:\"native_name\";s:31:\"العربية المغربية\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.4/ary.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ar\";i:3;s:3:\"ary\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"المتابعة\";}}s:2:\"as\";a:8:{s:8:\"language\";s:2:\"as\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-22 18:59:07\";s:12:\"english_name\";s:8:\"Assamese\";s:11:\"native_name\";s:21:\"অসমীয়া\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/as.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"as\";i:2;s:3:\"asm\";i:3;s:3:\"asm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:3:\"azb\";a:8:{s:8:\"language\";s:3:\"azb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-12 20:34:31\";s:12:\"english_name\";s:17:\"South Azerbaijani\";s:11:\"native_name\";s:29:\"گؤنئی آذربایجان\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/azb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:3;s:3:\"azb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"az\";a:8:{s:8:\"language\";s:2:\"az\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-06 00:09:27\";s:12:\"english_name\";s:11:\"Azerbaijani\";s:11:\"native_name\";s:16:\"Azərbaycan dili\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/az.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"az\";i:2;s:3:\"aze\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Davam\";}}s:3:\"bel\";a:8:{s:8:\"language\";s:3:\"bel\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-09 11:39:31\";s:12:\"english_name\";s:10:\"Belarusian\";s:11:\"native_name\";s:29:\"Беларуская мова\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.4/bel.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"be\";i:2;s:3:\"bel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Працягнуць\";}}s:5:\"bg_BG\";a:8:{s:8:\"language\";s:5:\"bg_BG\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-16 13:06:08\";s:12:\"english_name\";s:9:\"Bulgarian\";s:11:\"native_name\";s:18:\"Български\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/bg_BG.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bg\";i:2;s:3:\"bul\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Напред\";}}s:5:\"bn_BD\";a:8:{s:8:\"language\";s:5:\"bn_BD\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-04 16:58:43\";s:12:\"english_name\";s:7:\"Bengali\";s:11:\"native_name\";s:15:\"বাংলা\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/bn_BD.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"bn\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:23:\"এগিয়ে চল.\";}}s:2:\"bo\";a:8:{s:8:\"language\";s:2:\"bo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-05 09:44:12\";s:12:\"english_name\";s:7:\"Tibetan\";s:11:\"native_name\";s:21:\"བོད་ཡིག\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/bo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bo\";i:2;s:3:\"tib\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"མུ་མཐུད།\";}}s:5:\"bs_BA\";a:8:{s:8:\"language\";s:5:\"bs_BA\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-04 20:20:28\";s:12:\"english_name\";s:7:\"Bosnian\";s:11:\"native_name\";s:8:\"Bosanski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/bs_BA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"bs\";i:2;s:3:\"bos\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:2:\"ca\";a:8:{s:8:\"language\";s:2:\"ca\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-12 09:29:39\";s:12:\"english_name\";s:7:\"Catalan\";s:11:\"native_name\";s:7:\"Català\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/ca.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ca\";i:2;s:3:\"cat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:3:\"ceb\";a:8:{s:8:\"language\";s:3:\"ceb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-02 17:25:51\";s:12:\"english_name\";s:7:\"Cebuano\";s:11:\"native_name\";s:7:\"Cebuano\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ceb.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"ceb\";i:3;s:3:\"ceb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Padayun\";}}s:5:\"cs_CZ\";a:8:{s:8:\"language\";s:5:\"cs_CZ\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 08:46:26\";s:12:\"english_name\";s:5:\"Czech\";s:11:\"native_name\";s:12:\"Čeština‎\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/cs_CZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cs\";i:2;s:3:\"ces\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Pokračovat\";}}s:2:\"cy\";a:8:{s:8:\"language\";s:2:\"cy\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:49:29\";s:12:\"english_name\";s:5:\"Welsh\";s:11:\"native_name\";s:7:\"Cymraeg\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/cy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"cy\";i:2;s:3:\"cym\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Parhau\";}}s:5:\"da_DK\";a:8:{s:8:\"language\";s:5:\"da_DK\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-05 09:50:06\";s:12:\"english_name\";s:6:\"Danish\";s:11:\"native_name\";s:5:\"Dansk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/da_DK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"da\";i:2;s:3:\"dan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Forts&#230;t\";}}s:14:\"de_CH_informal\";a:8:{s:8:\"language\";s:14:\"de_CH_informal\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:39:59\";s:12:\"english_name\";s:30:\"German (Switzerland, Informal)\";s:11:\"native_name\";s:21:\"Deutsch (Schweiz, Du)\";s:7:\"package\";s:73:\"https://downloads.wordpress.org/translation/core/4.7.4/de_CH_informal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_CH\";a:8:{s:8:\"language\";s:5:\"de_CH\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:40:03\";s:12:\"english_name\";s:20:\"German (Switzerland)\";s:11:\"native_name\";s:17:\"Deutsch (Schweiz)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/de_CH.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:12:\"de_DE_formal\";a:8:{s:8:\"language\";s:12:\"de_DE_formal\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-28 14:35:15\";s:12:\"english_name\";s:15:\"German (Formal)\";s:11:\"native_name\";s:13:\"Deutsch (Sie)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.7.4/de_DE_formal.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:5:\"de_DE\";a:8:{s:8:\"language\";s:5:\"de_DE\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-18 13:57:42\";s:12:\"english_name\";s:6:\"German\";s:11:\"native_name\";s:7:\"Deutsch\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/de_DE.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"de\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Weiter\";}}s:3:\"dzo\";a:8:{s:8:\"language\";s:3:\"dzo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-06-29 08:59:03\";s:12:\"english_name\";s:8:\"Dzongkha\";s:11:\"native_name\";s:18:\"རྫོང་ཁ\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/dzo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"dz\";i:2;s:3:\"dzo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:2:\"el\";a:8:{s:8:\"language\";s:2:\"el\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-11 20:10:39\";s:12:\"english_name\";s:5:\"Greek\";s:11:\"native_name\";s:16:\"Ελληνικά\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/el.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"el\";i:2;s:3:\"ell\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Συνέχεια\";}}s:5:\"en_NZ\";a:8:{s:8:\"language\";s:5:\"en_NZ\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:54:30\";s:12:\"english_name\";s:21:\"English (New Zealand)\";s:11:\"native_name\";s:21:\"English (New Zealand)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/en_NZ.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_GB\";a:8:{s:8:\"language\";s:5:\"en_GB\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-28 03:10:25\";s:12:\"english_name\";s:12:\"English (UK)\";s:11:\"native_name\";s:12:\"English (UK)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/en_GB.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_CA\";a:8:{s:8:\"language\";s:5:\"en_CA\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:49:34\";s:12:\"english_name\";s:16:\"English (Canada)\";s:11:\"native_name\";s:16:\"English (Canada)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/en_CA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_ZA\";a:8:{s:8:\"language\";s:5:\"en_ZA\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:53:43\";s:12:\"english_name\";s:22:\"English (South Africa)\";s:11:\"native_name\";s:22:\"English (South Africa)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/en_ZA.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:5:\"en_AU\";a:8:{s:8:\"language\";s:5:\"en_AU\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-27 00:40:28\";s:12:\"english_name\";s:19:\"English (Australia)\";s:11:\"native_name\";s:19:\"English (Australia)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/en_AU.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"en\";i:2;s:3:\"eng\";i:3;s:3:\"eng\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continue\";}}s:2:\"eo\";a:8:{s:8:\"language\";s:2:\"eo\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-04 18:08:49\";s:12:\"english_name\";s:9:\"Esperanto\";s:11:\"native_name\";s:9:\"Esperanto\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/eo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eo\";i:2;s:3:\"epo\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Daŭrigi\";}}s:5:\"es_CO\";a:8:{s:8:\"language\";s:5:\"es_CO\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:54:37\";s:12:\"english_name\";s:18:\"Spanish (Colombia)\";s:11:\"native_name\";s:20:\"Español de Colombia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/es_CO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_VE\";a:8:{s:8:\"language\";s:5:\"es_VE\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-23 23:02:31\";s:12:\"english_name\";s:19:\"Spanish (Venezuela)\";s:11:\"native_name\";s:21:\"Español de Venezuela\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/es_VE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_AR\";a:8:{s:8:\"language\";s:5:\"es_AR\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:41:31\";s:12:\"english_name\";s:19:\"Spanish (Argentina)\";s:11:\"native_name\";s:21:\"Español de Argentina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/es_AR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_PE\";a:8:{s:8:\"language\";s:5:\"es_PE\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-09 09:36:22\";s:12:\"english_name\";s:14:\"Spanish (Peru)\";s:11:\"native_name\";s:17:\"Español de Perú\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_PE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_CL\";a:8:{s:8:\"language\";s:5:\"es_CL\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-28 20:09:49\";s:12:\"english_name\";s:15:\"Spanish (Chile)\";s:11:\"native_name\";s:17:\"Español de Chile\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/es_CL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_GT\";a:8:{s:8:\"language\";s:5:\"es_GT\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:54:37\";s:12:\"english_name\";s:19:\"Spanish (Guatemala)\";s:11:\"native_name\";s:21:\"Español de Guatemala\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/es_GT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_MX\";a:8:{s:8:\"language\";s:5:\"es_MX\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:42:28\";s:12:\"english_name\";s:16:\"Spanish (Mexico)\";s:11:\"native_name\";s:19:\"Español de México\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/es_MX.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"es\";i:2;s:3:\"spa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"es_ES\";a:8:{s:8:\"language\";s:5:\"es_ES\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-10 16:26:52\";s:12:\"english_name\";s:15:\"Spanish (Spain)\";s:11:\"native_name\";s:8:\"Español\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/es_ES.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"es\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"et\";a:8:{s:8:\"language\";s:2:\"et\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 16:37:11\";s:12:\"english_name\";s:8:\"Estonian\";s:11:\"native_name\";s:5:\"Eesti\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/et.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"et\";i:2;s:3:\"est\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Jätka\";}}s:2:\"eu\";a:8:{s:8:\"language\";s:2:\"eu\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-12 06:40:28\";s:12:\"english_name\";s:6:\"Basque\";s:11:\"native_name\";s:7:\"Euskara\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/eu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"eu\";i:2;s:3:\"eus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Jarraitu\";}}s:5:\"fa_IR\";a:8:{s:8:\"language\";s:5:\"fa_IR\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-02-02 15:21:03\";s:12:\"english_name\";s:7:\"Persian\";s:11:\"native_name\";s:10:\"فارسی\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/fa_IR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fa\";i:2;s:3:\"fas\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:2:\"fi\";a:8:{s:8:\"language\";s:2:\"fi\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:42:25\";s:12:\"english_name\";s:7:\"Finnish\";s:11:\"native_name\";s:5:\"Suomi\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/fi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fi\";i:2;s:3:\"fin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Jatka\";}}s:5:\"fr_FR\";a:8:{s:8:\"language\";s:5:\"fr_FR\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-05 12:10:24\";s:12:\"english_name\";s:15:\"French (France)\";s:11:\"native_name\";s:9:\"Français\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/fr_FR.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"fr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_CA\";a:8:{s:8:\"language\";s:5:\"fr_CA\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-02-03 21:08:25\";s:12:\"english_name\";s:15:\"French (Canada)\";s:11:\"native_name\";s:19:\"Français du Canada\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/fr_CA.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:5:\"fr_BE\";a:8:{s:8:\"language\";s:5:\"fr_BE\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:40:32\";s:12:\"english_name\";s:16:\"French (Belgium)\";s:11:\"native_name\";s:21:\"Français de Belgique\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/fr_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"fr\";i:2;s:3:\"fra\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuer\";}}s:2:\"gd\";a:8:{s:8:\"language\";s:2:\"gd\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-08-23 17:41:37\";s:12:\"english_name\";s:15:\"Scottish Gaelic\";s:11:\"native_name\";s:9:\"Gàidhlig\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/gd.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"gd\";i:2;s:3:\"gla\";i:3;s:3:\"gla\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"Lean air adhart\";}}s:5:\"gl_ES\";a:8:{s:8:\"language\";s:5:\"gl_ES\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:40:27\";s:12:\"english_name\";s:8:\"Galician\";s:11:\"native_name\";s:6:\"Galego\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/gl_ES.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gl\";i:2;s:3:\"glg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:2:\"gu\";a:8:{s:8:\"language\";s:2:\"gu\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-21 14:17:42\";s:12:\"english_name\";s:8:\"Gujarati\";s:11:\"native_name\";s:21:\"ગુજરાતી\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/gu.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"gu\";i:2;s:3:\"guj\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:31:\"ચાલુ રાખવું\";}}s:3:\"haz\";a:8:{s:8:\"language\";s:3:\"haz\";s:7:\"version\";s:5:\"4.4.2\";s:7:\"updated\";s:19:\"2015-12-05 00:59:09\";s:12:\"english_name\";s:8:\"Hazaragi\";s:11:\"native_name\";s:15:\"هزاره گی\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.4.2/haz.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"haz\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"ادامه\";}}s:5:\"he_IL\";a:8:{s:8:\"language\";s:5:\"he_IL\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-29 21:21:10\";s:12:\"english_name\";s:6:\"Hebrew\";s:11:\"native_name\";s:16:\"עִבְרִית\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/he_IL.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"he\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"המשך\";}}s:5:\"hi_IN\";a:8:{s:8:\"language\";s:5:\"hi_IN\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-01 10:53:22\";s:12:\"english_name\";s:5:\"Hindi\";s:11:\"native_name\";s:18:\"हिन्दी\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/hi_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hi\";i:2;s:3:\"hin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"जारी\";}}s:2:\"hr\";a:8:{s:8:\"language\";s:2:\"hr\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-28 13:34:22\";s:12:\"english_name\";s:8:\"Croatian\";s:11:\"native_name\";s:8:\"Hrvatski\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/hr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hr\";i:2;s:3:\"hrv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:7:\"Nastavi\";}}s:5:\"hu_HU\";a:8:{s:8:\"language\";s:5:\"hu_HU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:48:39\";s:12:\"english_name\";s:9:\"Hungarian\";s:11:\"native_name\";s:6:\"Magyar\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/hu_HU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hu\";i:2;s:3:\"hun\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Folytatás\";}}s:2:\"hy\";a:8:{s:8:\"language\";s:2:\"hy\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-03 16:21:10\";s:12:\"english_name\";s:8:\"Armenian\";s:11:\"native_name\";s:14:\"Հայերեն\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/hy.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"hy\";i:2;s:3:\"hye\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Շարունակել\";}}s:5:\"id_ID\";a:8:{s:8:\"language\";s:5:\"id_ID\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-02 14:01:52\";s:12:\"english_name\";s:10:\"Indonesian\";s:11:\"native_name\";s:16:\"Bahasa Indonesia\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/id_ID.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"id\";i:2;s:3:\"ind\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Lanjutkan\";}}s:5:\"is_IS\";a:8:{s:8:\"language\";s:5:\"is_IS\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-13 13:55:54\";s:12:\"english_name\";s:9:\"Icelandic\";s:11:\"native_name\";s:9:\"Íslenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/is_IS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"is\";i:2;s:3:\"isl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Áfram\";}}s:5:\"it_IT\";a:8:{s:8:\"language\";s:5:\"it_IT\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-08 04:57:54\";s:12:\"english_name\";s:7:\"Italian\";s:11:\"native_name\";s:8:\"Italiano\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/it_IT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"it\";i:2;s:3:\"ita\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Continua\";}}s:2:\"ja\";a:8:{s:8:\"language\";s:2:\"ja\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-02 05:13:51\";s:12:\"english_name\";s:8:\"Japanese\";s:11:\"native_name\";s:9:\"日本語\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/ja.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"ja\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"続ける\";}}s:5:\"ka_GE\";a:8:{s:8:\"language\";s:5:\"ka_GE\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-05 06:17:00\";s:12:\"english_name\";s:8:\"Georgian\";s:11:\"native_name\";s:21:\"ქართული\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/ka_GE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ka\";i:2;s:3:\"kat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"გაგრძელება\";}}s:3:\"kab\";a:8:{s:8:\"language\";s:3:\"kab\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:39:13\";s:12:\"english_name\";s:6:\"Kabyle\";s:11:\"native_name\";s:9:\"Taqbaylit\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/kab.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"kab\";i:3;s:3:\"kab\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Kemmel\";}}s:2:\"km\";a:8:{s:8:\"language\";s:2:\"km\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-07 02:07:59\";s:12:\"english_name\";s:5:\"Khmer\";s:11:\"native_name\";s:27:\"ភាសាខ្មែរ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/km.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"km\";i:2;s:3:\"khm\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"បន្ត\";}}s:5:\"ko_KR\";a:8:{s:8:\"language\";s:5:\"ko_KR\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-18 05:09:08\";s:12:\"english_name\";s:6:\"Korean\";s:11:\"native_name\";s:9:\"한국어\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/ko_KR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ko\";i:2;s:3:\"kor\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"계속\";}}s:3:\"ckb\";a:8:{s:8:\"language\";s:3:\"ckb\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:48:25\";s:12:\"english_name\";s:16:\"Kurdish (Sorani)\";s:11:\"native_name\";s:13:\"كوردی‎\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/ckb.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ku\";i:3;s:3:\"ckb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"به‌رده‌وام به‌\";}}s:2:\"lo\";a:8:{s:8:\"language\";s:2:\"lo\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 09:59:23\";s:12:\"english_name\";s:3:\"Lao\";s:11:\"native_name\";s:21:\"ພາສາລາວ\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/lo.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lo\";i:2;s:3:\"lao\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"ຕໍ່​ໄປ\";}}s:5:\"lt_LT\";a:8:{s:8:\"language\";s:5:\"lt_LT\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-30 09:46:13\";s:12:\"english_name\";s:10:\"Lithuanian\";s:11:\"native_name\";s:15:\"Lietuvių kalba\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/lt_LT.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lt\";i:2;s:3:\"lit\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Tęsti\";}}s:2:\"lv\";a:8:{s:8:\"language\";s:2:\"lv\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-17 20:40:40\";s:12:\"english_name\";s:7:\"Latvian\";s:11:\"native_name\";s:16:\"Latviešu valoda\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/lv.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"lv\";i:2;s:3:\"lav\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Turpināt\";}}s:5:\"mk_MK\";a:8:{s:8:\"language\";s:5:\"mk_MK\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:54:41\";s:12:\"english_name\";s:10:\"Macedonian\";s:11:\"native_name\";s:31:\"Македонски јазик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/mk_MK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mk\";i:2;s:3:\"mkd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:16:\"Продолжи\";}}s:5:\"ml_IN\";a:8:{s:8:\"language\";s:5:\"ml_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:43:32\";s:12:\"english_name\";s:9:\"Malayalam\";s:11:\"native_name\";s:18:\"മലയാളം\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ml_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ml\";i:2;s:3:\"mal\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:18:\"തുടരുക\";}}s:2:\"mn\";a:8:{s:8:\"language\";s:2:\"mn\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-12 07:29:35\";s:12:\"english_name\";s:9:\"Mongolian\";s:11:\"native_name\";s:12:\"Монгол\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/mn.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mn\";i:2;s:3:\"mon\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"Үргэлжлүүлэх\";}}s:2:\"mr\";a:8:{s:8:\"language\";s:2:\"mr\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-24 06:52:11\";s:12:\"english_name\";s:7:\"Marathi\";s:11:\"native_name\";s:15:\"मराठी\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/mr.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"mr\";i:2;s:3:\"mar\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"सुरु ठेवा\";}}s:5:\"ms_MY\";a:8:{s:8:\"language\";s:5:\"ms_MY\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-05 09:45:10\";s:12:\"english_name\";s:5:\"Malay\";s:11:\"native_name\";s:13:\"Bahasa Melayu\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/ms_MY.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ms\";i:2;s:3:\"msa\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Teruskan\";}}s:5:\"my_MM\";a:8:{s:8:\"language\";s:5:\"my_MM\";s:7:\"version\";s:6:\"4.1.18\";s:7:\"updated\";s:19:\"2015-03-26 15:57:42\";s:12:\"english_name\";s:17:\"Myanmar (Burmese)\";s:11:\"native_name\";s:15:\"ဗမာစာ\";s:7:\"package\";s:65:\"https://downloads.wordpress.org/translation/core/4.1.18/my_MM.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"my\";i:2;s:3:\"mya\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:54:\"ဆက်လက်လုပ်ဆောင်ပါ။\";}}s:5:\"nb_NO\";a:8:{s:8:\"language\";s:5:\"nb_NO\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:42:31\";s:12:\"english_name\";s:19:\"Norwegian (Bokmål)\";s:11:\"native_name\";s:13:\"Norsk bokmål\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/nb_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nb\";i:2;s:3:\"nob\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Fortsett\";}}s:5:\"ne_NP\";a:8:{s:8:\"language\";s:5:\"ne_NP\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:48:31\";s:12:\"english_name\";s:6:\"Nepali\";s:11:\"native_name\";s:18:\"नेपाली\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ne_NP.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ne\";i:2;s:3:\"nep\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:43:\"जारी राख्नुहोस्\";}}s:12:\"nl_NL_formal\";a:8:{s:8:\"language\";s:12:\"nl_NL_formal\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-02-16 13:24:21\";s:12:\"english_name\";s:14:\"Dutch (Formal)\";s:11:\"native_name\";s:20:\"Nederlands (Formeel)\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/translation/core/4.7.4/nl_NL_formal.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_NL\";a:8:{s:8:\"language\";s:5:\"nl_NL\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-11 15:57:29\";s:12:\"english_name\";s:5:\"Dutch\";s:11:\"native_name\";s:10:\"Nederlands\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/nl_NL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nl_BE\";a:8:{s:8:\"language\";s:5:\"nl_BE\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-15 08:29:44\";s:12:\"english_name\";s:15:\"Dutch (Belgium)\";s:11:\"native_name\";s:20:\"Nederlands (België)\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/nl_BE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nl\";i:2;s:3:\"nld\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Doorgaan\";}}s:5:\"nn_NO\";a:8:{s:8:\"language\";s:5:\"nn_NO\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:40:57\";s:12:\"english_name\";s:19:\"Norwegian (Nynorsk)\";s:11:\"native_name\";s:13:\"Norsk nynorsk\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/nn_NO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"nn\";i:2;s:3:\"nno\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Hald fram\";}}s:3:\"oci\";a:8:{s:8:\"language\";s:3:\"oci\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-02 13:47:38\";s:12:\"english_name\";s:7:\"Occitan\";s:11:\"native_name\";s:7:\"Occitan\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/oci.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"oc\";i:2;s:3:\"oci\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Contunhar\";}}s:5:\"pa_IN\";a:8:{s:8:\"language\";s:5:\"pa_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-16 05:19:43\";s:12:\"english_name\";s:7:\"Punjabi\";s:11:\"native_name\";s:18:\"ਪੰਜਾਬੀ\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/pa_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pa\";i:2;s:3:\"pan\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:25:\"ਜਾਰੀ ਰੱਖੋ\";}}s:5:\"pl_PL\";a:8:{s:8:\"language\";s:5:\"pl_PL\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-23 09:31:28\";s:12:\"english_name\";s:6:\"Polish\";s:11:\"native_name\";s:6:\"Polski\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/pl_PL.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pl\";i:2;s:3:\"pol\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Kontynuuj\";}}s:2:\"ps\";a:8:{s:8:\"language\";s:2:\"ps\";s:7:\"version\";s:6:\"4.1.18\";s:7:\"updated\";s:19:\"2015-03-29 22:19:48\";s:12:\"english_name\";s:6:\"Pashto\";s:11:\"native_name\";s:8:\"پښتو\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.1.18/ps.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ps\";i:2;s:3:\"pus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"دوام ورکړه\";}}s:5:\"pt_BR\";a:8:{s:8:\"language\";s:5:\"pt_BR\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-17 15:02:48\";s:12:\"english_name\";s:19:\"Portuguese (Brazil)\";s:11:\"native_name\";s:20:\"Português do Brasil\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/pt_BR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"pt\";i:2;s:3:\"por\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:5:\"pt_PT\";a:8:{s:8:\"language\";s:5:\"pt_PT\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-15 10:57:32\";s:12:\"english_name\";s:21:\"Portuguese (Portugal)\";s:11:\"native_name\";s:10:\"Português\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/pt_PT.zip\";s:3:\"iso\";a:1:{i:1;s:2:\"pt\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuar\";}}s:3:\"rhg\";a:8:{s:8:\"language\";s:3:\"rhg\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-16 13:03:18\";s:12:\"english_name\";s:8:\"Rohingya\";s:11:\"native_name\";s:8:\"Ruáinga\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/rhg.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"rhg\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ro_RO\";a:8:{s:8:\"language\";s:5:\"ro_RO\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-15 14:53:36\";s:12:\"english_name\";s:8:\"Romanian\";s:11:\"native_name\";s:8:\"Română\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/ro_RO.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ro\";i:2;s:3:\"ron\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Continuă\";}}s:5:\"ru_RU\";a:8:{s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-20 10:13:53\";s:12:\"english_name\";s:7:\"Russian\";s:11:\"native_name\";s:14:\"Русский\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/ru_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ru\";i:2;s:3:\"rus\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продолжить\";}}s:3:\"sah\";a:8:{s:8:\"language\";s:3:\"sah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-21 02:06:41\";s:12:\"english_name\";s:5:\"Sakha\";s:11:\"native_name\";s:14:\"Сахалыы\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/sah.zip\";s:3:\"iso\";a:2:{i:2;s:3:\"sah\";i:3;s:3:\"sah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Салҕаа\";}}s:5:\"si_LK\";a:8:{s:8:\"language\";s:5:\"si_LK\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-12 06:00:52\";s:12:\"english_name\";s:7:\"Sinhala\";s:11:\"native_name\";s:15:\"සිංහල\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/si_LK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"si\";i:2;s:3:\"sin\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:44:\"දිගටම කරගෙන යන්න\";}}s:5:\"sk_SK\";a:8:{s:8:\"language\";s:5:\"sk_SK\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-10 13:48:29\";s:12:\"english_name\";s:6:\"Slovak\";s:11:\"native_name\";s:11:\"Slovenčina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/sk_SK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sk\";i:2;s:3:\"slk\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Pokračovať\";}}s:5:\"sl_SI\";a:8:{s:8:\"language\";s:5:\"sl_SI\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-02-08 17:57:45\";s:12:\"english_name\";s:9:\"Slovenian\";s:11:\"native_name\";s:13:\"Slovenščina\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/sl_SI.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sl\";i:2;s:3:\"slv\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:8:\"Nadaljuj\";}}s:2:\"sq\";a:8:{s:8:\"language\";s:2:\"sq\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-24 08:35:30\";s:12:\"english_name\";s:8:\"Albanian\";s:11:\"native_name\";s:5:\"Shqip\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/sq.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sq\";i:2;s:3:\"sqi\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"Vazhdo\";}}s:5:\"sr_RS\";a:8:{s:8:\"language\";s:5:\"sr_RS\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:41:03\";s:12:\"english_name\";s:7:\"Serbian\";s:11:\"native_name\";s:23:\"Српски језик\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/sr_RS.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sr\";i:2;s:3:\"srp\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:14:\"Настави\";}}s:5:\"sv_SE\";a:8:{s:8:\"language\";s:5:\"sv_SE\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-03 00:34:10\";s:12:\"english_name\";s:7:\"Swedish\";s:11:\"native_name\";s:7:\"Svenska\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/sv_SE.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"sv\";i:2;s:3:\"swe\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:9:\"Fortsätt\";}}s:3:\"szl\";a:8:{s:8:\"language\";s:3:\"szl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-09-24 19:58:14\";s:12:\"english_name\";s:8:\"Silesian\";s:11:\"native_name\";s:17:\"Ślōnskŏ gŏdka\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/szl.zip\";s:3:\"iso\";a:1:{i:3;s:3:\"szl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:13:\"Kōntynuować\";}}s:5:\"ta_IN\";a:8:{s:8:\"language\";s:5:\"ta_IN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-27 03:22:47\";s:12:\"english_name\";s:5:\"Tamil\";s:11:\"native_name\";s:15:\"தமிழ்\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ta_IN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ta\";i:2;s:3:\"tam\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:24:\"தொடரவும்\";}}s:2:\"te\";a:8:{s:8:\"language\";s:2:\"te\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:47:39\";s:12:\"english_name\";s:6:\"Telugu\";s:11:\"native_name\";s:18:\"తెలుగు\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/te.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"te\";i:2;s:3:\"tel\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:30:\"కొనసాగించు\";}}s:2:\"th\";a:8:{s:8:\"language\";s:2:\"th\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2017-01-26 15:48:43\";s:12:\"english_name\";s:4:\"Thai\";s:11:\"native_name\";s:9:\"ไทย\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/th.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"th\";i:2;s:3:\"tha\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:15:\"ต่อไป\";}}s:2:\"tl\";a:8:{s:8:\"language\";s:2:\"tl\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-30 02:38:08\";s:12:\"english_name\";s:7:\"Tagalog\";s:11:\"native_name\";s:7:\"Tagalog\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.2/tl.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tl\";i:2;s:3:\"tgl\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:10:\"Magpatuloy\";}}s:5:\"tr_TR\";a:8:{s:8:\"language\";s:5:\"tr_TR\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-15 09:03:35\";s:12:\"english_name\";s:7:\"Turkish\";s:11:\"native_name\";s:8:\"Türkçe\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/tr_TR.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tr\";i:2;s:3:\"tur\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:5:\"Devam\";}}s:5:\"tt_RU\";a:8:{s:8:\"language\";s:5:\"tt_RU\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-11-20 20:20:50\";s:12:\"english_name\";s:5:\"Tatar\";s:11:\"native_name\";s:19:\"Татар теле\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/tt_RU.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"tt\";i:2;s:3:\"tat\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:17:\"дәвам итү\";}}s:3:\"tah\";a:8:{s:8:\"language\";s:3:\"tah\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-03-06 18:39:39\";s:12:\"english_name\";s:8:\"Tahitian\";s:11:\"native_name\";s:10:\"Reo Tahiti\";s:7:\"package\";s:62:\"https://downloads.wordpress.org/translation/core/4.7.2/tah.zip\";s:3:\"iso\";a:3:{i:1;s:2:\"ty\";i:2;s:3:\"tah\";i:3;s:3:\"tah\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:0:\"\";}}s:5:\"ug_CN\";a:8:{s:8:\"language\";s:5:\"ug_CN\";s:7:\"version\";s:5:\"4.7.2\";s:7:\"updated\";s:19:\"2016-12-05 09:23:39\";s:12:\"english_name\";s:6:\"Uighur\";s:11:\"native_name\";s:9:\"Uyƣurqə\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.2/ug_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ug\";i:2;s:3:\"uig\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:26:\"داۋاملاشتۇرۇش\";}}s:2:\"uk\";a:8:{s:8:\"language\";s:2:\"uk\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-17 03:13:31\";s:12:\"english_name\";s:9:\"Ukrainian\";s:11:\"native_name\";s:20:\"Українська\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/uk.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uk\";i:2;s:3:\"ukr\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:20:\"Продовжити\";}}s:2:\"ur\";a:8:{s:8:\"language\";s:2:\"ur\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-27 07:08:07\";s:12:\"english_name\";s:4:\"Urdu\";s:11:\"native_name\";s:8:\"اردو\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/ur.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"ur\";i:2;s:3:\"urd\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:19:\"جاری رکھیں\";}}s:5:\"uz_UZ\";a:8:{s:8:\"language\";s:5:\"uz_UZ\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-13 09:55:38\";s:12:\"english_name\";s:5:\"Uzbek\";s:11:\"native_name\";s:11:\"O‘zbekcha\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/uz_UZ.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"uz\";i:2;s:3:\"uzb\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:11:\"Davom etish\";}}s:2:\"vi\";a:8:{s:8:\"language\";s:2:\"vi\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-04-10 15:33:37\";s:12:\"english_name\";s:10:\"Vietnamese\";s:11:\"native_name\";s:14:\"Tiếng Việt\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/translation/core/4.7.4/vi.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"vi\";i:2;s:3:\"vie\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:12:\"Tiếp tục\";}}s:5:\"zh_HK\";a:8:{s:8:\"language\";s:5:\"zh_HK\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-03-28 12:03:30\";s:12:\"english_name\";s:19:\"Chinese (Hong Kong)\";s:11:\"native_name\";s:16:\"香港中文版	\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/zh_HK.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}s:5:\"zh_CN\";a:8:{s:8:\"language\";s:5:\"zh_CN\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-01-26 15:54:45\";s:12:\"english_name\";s:15:\"Chinese (China)\";s:11:\"native_name\";s:12:\"简体中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/zh_CN.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"继续\";}}s:5:\"zh_TW\";a:8:{s:8:\"language\";s:5:\"zh_TW\";s:7:\"version\";s:5:\"4.7.4\";s:7:\"updated\";s:19:\"2017-05-08 04:16:08\";s:12:\"english_name\";s:16:\"Chinese (Taiwan)\";s:11:\"native_name\";s:12:\"繁體中文\";s:7:\"package\";s:64:\"https://downloads.wordpress.org/translation/core/4.7.4/zh_TW.zip\";s:3:\"iso\";a:2:{i:1;s:2:\"zh\";i:2;s:3:\"zho\";}s:7:\"strings\";a:1:{s:8:\"continue\";s:6:\"繼續\";}}}", "no");
INSERT INTO `wp_options` VALUES("140", "current_theme", "Twenty Fifteen", "yes");
INSERT INTO `wp_options` VALUES("141", "theme_mods_twentyfifteen", "a:3:{i:0;b:0;s:18:\"custom_css_post_id\";i:-1;s:18:\"nav_menu_locations\";a:2:{s:7:\"primary\";i:2;s:6:\"social\";i:0;}}", "yes");
INSERT INTO `wp_options` VALUES("142", "theme_switched", "", "yes");
INSERT INTO `wp_options` VALUES("346", "auto_core_update_notified", "a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:18:\"gevs91.p@gmail.com\";s:7:\"version\";s:5:\"4.7.4\";s:9:\"timestamp\";i:1493015822;}", "no");
INSERT INTO `wp_options` VALUES("206", "recently_activated", "a:2:{s:35:\"backupwordpress/backupwordpress.php\";i:1495568030;s:67:\"wp-super-cache-clear-cache-menu/wp-super-cache-clear-cache-menu.php\";i:1495567111;}", "yes");
INSERT INTO `wp_options` VALUES("619", "_site_transient_timeout_browser_7d5717485b1766ead3ace00da0201229", "1491053495", "no");
INSERT INTO `wp_options` VALUES("620", "_site_transient_browser_7d5717485b1766ead3ace00da0201229", "a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:12:\"56.0.2924.87\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}", "no");
INSERT INTO `wp_options` VALUES("484", "_site_transient_update_themes", "O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1495568108;s:7:\"checked\";a:1:{s:13:\"twentyfifteen\";s:3:\"1.7\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}", "no");
INSERT INTO `wp_options` VALUES("716", "_site_transient_update_core", "O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.7.5.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.7.5.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.7.5\";s:7:\"version\";s:5:\"4.7.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.7.5.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.7.5.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.7.5-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.7.5-new-bundled.zip\";s:7:\"partial\";s:69:\"https://downloads.wordpress.org/release/wordpress-4.7.5-partial-4.zip\";s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.7.5\";s:7:\"version\";s:5:\"4.7.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:5:\"4.7.4\";}i:2;O:8:\"stdClass\":11:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.7.5.zip\";s:6:\"locale\";s:5:\"ru_RU\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:65:\"https://downloads.wordpress.org/release/ru_RU/wordpress-4.7.5.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.7.5\";s:7:\"version\";s:5:\"4.7.5\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.7\";s:15:\"partial_version\";s:0:\"\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1495568106;s:15:\"version_checked\";s:5:\"4.7.4\";s:12:\"translations\";a:0:{}}", "no");
INSERT INTO `wp_options` VALUES("813", "_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a", "1495577342", "no");
INSERT INTO `wp_options` VALUES("814", "_site_transient_poptags_40cd750bba9870f18aada2478b24840a", "O:8:\"stdClass\":100:{s:6:\"widget\";a:3:{s:4:\"name\";s:6:\"widget\";s:4:\"slug\";s:6:\"widget\";s:5:\"count\";i:4338;}s:4:\"post\";a:3:{s:4:\"name\";s:4:\"post\";s:4:\"slug\";s:4:\"post\";s:5:\"count\";i:2479;}s:5:\"admin\";a:3:{s:4:\"name\";s:5:\"admin\";s:4:\"slug\";s:5:\"admin\";s:5:\"count\";i:2349;}s:11:\"woocommerce\";a:3:{s:4:\"name\";s:11:\"woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:5:\"count\";i:2083;}s:5:\"posts\";a:3:{s:4:\"name\";s:5:\"posts\";s:4:\"slug\";s:5:\"posts\";s:5:\"count\";i:1820;}s:8:\"comments\";a:3:{s:4:\"name\";s:8:\"comments\";s:4:\"slug\";s:8:\"comments\";s:5:\"count\";i:1579;}s:9:\"shortcode\";a:3:{s:4:\"name\";s:9:\"shortcode\";s:4:\"slug\";s:9:\"shortcode\";s:5:\"count\";i:1554;}s:7:\"twitter\";a:3:{s:4:\"name\";s:7:\"twitter\";s:4:\"slug\";s:7:\"twitter\";s:5:\"count\";i:1431;}s:6:\"google\";a:3:{s:4:\"name\";s:6:\"google\";s:4:\"slug\";s:6:\"google\";s:5:\"count\";i:1331;}s:6:\"images\";a:3:{s:4:\"name\";s:6:\"images\";s:4:\"slug\";s:6:\"images\";s:5:\"count\";i:1321;}s:8:\"facebook\";a:3:{s:4:\"name\";s:8:\"facebook\";s:4:\"slug\";s:8:\"facebook\";s:5:\"count\";i:1311;}s:7:\"sidebar\";a:3:{s:4:\"name\";s:7:\"sidebar\";s:4:\"slug\";s:7:\"sidebar\";s:5:\"count\";i:1266;}s:5:\"image\";a:3:{s:4:\"name\";s:5:\"image\";s:4:\"slug\";s:5:\"image\";s:5:\"count\";i:1261;}s:3:\"seo\";a:3:{s:4:\"name\";s:3:\"seo\";s:4:\"slug\";s:3:\"seo\";s:5:\"count\";i:1099;}s:7:\"gallery\";a:3:{s:4:\"name\";s:7:\"gallery\";s:4:\"slug\";s:7:\"gallery\";s:5:\"count\";i:1040;}s:4:\"page\";a:3:{s:4:\"name\";s:4:\"page\";s:4:\"slug\";s:4:\"page\";s:5:\"count\";i:1036;}s:6:\"social\";a:3:{s:4:\"name\";s:6:\"social\";s:4:\"slug\";s:6:\"social\";s:5:\"count\";i:981;}s:5:\"email\";a:3:{s:4:\"name\";s:5:\"email\";s:4:\"slug\";s:5:\"email\";s:5:\"count\";i:923;}s:5:\"links\";a:3:{s:4:\"name\";s:5:\"links\";s:4:\"slug\";s:5:\"links\";s:5:\"count\";i:812;}s:9:\"ecommerce\";a:3:{s:4:\"name\";s:9:\"ecommerce\";s:4:\"slug\";s:9:\"ecommerce\";s:5:\"count\";i:790;}s:5:\"login\";a:3:{s:4:\"name\";s:5:\"login\";s:4:\"slug\";s:5:\"login\";s:5:\"count\";i:785;}s:7:\"widgets\";a:3:{s:4:\"name\";s:7:\"widgets\";s:4:\"slug\";s:7:\"widgets\";s:5:\"count\";i:762;}s:5:\"video\";a:3:{s:4:\"name\";s:5:\"video\";s:4:\"slug\";s:5:\"video\";s:5:\"count\";i:758;}s:3:\"rss\";a:3:{s:4:\"name\";s:3:\"rss\";s:4:\"slug\";s:3:\"rss\";s:5:\"count\";i:665;}s:7:\"content\";a:3:{s:4:\"name\";s:7:\"content\";s:4:\"slug\";s:7:\"content\";s:5:\"count\";i:654;}s:10:\"buddypress\";a:3:{s:4:\"name\";s:10:\"buddypress\";s:4:\"slug\";s:10:\"buddypress\";s:5:\"count\";i:652;}s:4:\"spam\";a:3:{s:4:\"name\";s:4:\"spam\";s:4:\"slug\";s:4:\"spam\";s:5:\"count\";i:645;}s:5:\"pages\";a:3:{s:4:\"name\";s:5:\"pages\";s:4:\"slug\";s:5:\"pages\";s:5:\"count\";i:643;}s:6:\"jquery\";a:3:{s:4:\"name\";s:6:\"jquery\";s:4:\"slug\";s:6:\"jquery\";s:5:\"count\";i:634;}s:8:\"security\";a:3:{s:4:\"name\";s:8:\"security\";s:4:\"slug\";s:8:\"security\";s:5:\"count\";i:619;}s:6:\"slider\";a:3:{s:4:\"name\";s:6:\"slider\";s:4:\"slug\";s:6:\"slider\";s:5:\"count\";i:598;}s:5:\"media\";a:3:{s:4:\"name\";s:5:\"media\";s:4:\"slug\";s:5:\"media\";s:5:\"count\";i:590;}s:4:\"ajax\";a:3:{s:4:\"name\";s:4:\"ajax\";s:4:\"slug\";s:4:\"ajax\";s:5:\"count\";i:589;}s:8:\"category\";a:3:{s:4:\"name\";s:8:\"category\";s:4:\"slug\";s:8:\"category\";s:5:\"count\";i:572;}s:4:\"feed\";a:3:{s:4:\"name\";s:4:\"feed\";s:4:\"slug\";s:4:\"feed\";s:5:\"count\";i:572;}s:9:\"analytics\";a:3:{s:4:\"name\";s:9:\"analytics\";s:4:\"slug\";s:9:\"analytics\";s:5:\"count\";i:568;}s:6:\"search\";a:3:{s:4:\"name\";s:6:\"search\";s:4:\"slug\";s:6:\"search\";s:5:\"count\";i:567;}s:10:\"e-commerce\";a:3:{s:4:\"name\";s:10:\"e-commerce\";s:4:\"slug\";s:10:\"e-commerce\";s:5:\"count\";i:553;}s:4:\"menu\";a:3:{s:4:\"name\";s:4:\"menu\";s:4:\"slug\";s:4:\"menu\";s:5:\"count\";i:546;}s:5:\"embed\";a:3:{s:4:\"name\";s:5:\"embed\";s:4:\"slug\";s:5:\"embed\";s:5:\"count\";i:536;}s:10:\"javascript\";a:3:{s:4:\"name\";s:10:\"javascript\";s:4:\"slug\";s:10:\"javascript\";s:5:\"count\";i:528;}s:4:\"form\";a:3:{s:4:\"name\";s:4:\"form\";s:4:\"slug\";s:4:\"form\";s:5:\"count\";i:520;}s:4:\"link\";a:3:{s:4:\"name\";s:4:\"link\";s:4:\"slug\";s:4:\"link\";s:5:\"count\";i:518;}s:3:\"css\";a:3:{s:4:\"name\";s:3:\"css\";s:4:\"slug\";s:3:\"css\";s:5:\"count\";i:503;}s:5:\"share\";a:3:{s:4:\"name\";s:5:\"share\";s:4:\"slug\";s:5:\"share\";s:5:\"count\";i:495;}s:7:\"comment\";a:3:{s:4:\"name\";s:7:\"comment\";s:4:\"slug\";s:7:\"comment\";s:5:\"count\";i:488;}s:7:\"youtube\";a:3:{s:4:\"name\";s:7:\"youtube\";s:4:\"slug\";s:7:\"youtube\";s:5:\"count\";i:487;}s:5:\"theme\";a:3:{s:4:\"name\";s:5:\"theme\";s:4:\"slug\";s:5:\"theme\";s:5:\"count\";i:476;}s:6:\"custom\";a:3:{s:4:\"name\";s:6:\"custom\";s:4:\"slug\";s:6:\"custom\";s:5:\"count\";i:464;}s:10:\"categories\";a:3:{s:4:\"name\";s:10:\"categories\";s:4:\"slug\";s:10:\"categories\";s:5:\"count\";i:462;}s:10:\"responsive\";a:3:{s:4:\"name\";s:10:\"responsive\";s:4:\"slug\";s:10:\"responsive\";s:5:\"count\";i:459;}s:9:\"dashboard\";a:3:{s:4:\"name\";s:9:\"dashboard\";s:4:\"slug\";s:9:\"dashboard\";s:5:\"count\";i:456;}s:3:\"ads\";a:3:{s:4:\"name\";s:3:\"ads\";s:4:\"slug\";s:3:\"ads\";s:5:\"count\";i:439;}s:6:\"button\";a:3:{s:4:\"name\";s:6:\"button\";s:4:\"slug\";s:6:\"button\";s:5:\"count\";i:433;}s:4:\"tags\";a:3:{s:4:\"name\";s:4:\"tags\";s:4:\"slug\";s:4:\"tags\";s:5:\"count\";i:432;}s:9:\"affiliate\";a:3:{s:4:\"name\";s:9:\"affiliate\";s:4:\"slug\";s:9:\"affiliate\";s:5:\"count\";i:431;}s:6:\"editor\";a:3:{s:4:\"name\";s:6:\"editor\";s:4:\"slug\";s:6:\"editor\";s:5:\"count\";i:425;}s:5:\"photo\";a:3:{s:4:\"name\";s:5:\"photo\";s:4:\"slug\";s:5:\"photo\";s:5:\"count\";i:417;}s:12:\"contact-form\";a:3:{s:4:\"name\";s:12:\"contact form\";s:4:\"slug\";s:12:\"contact-form\";s:5:\"count\";i:410;}s:4:\"user\";a:3:{s:4:\"name\";s:4:\"user\";s:4:\"slug\";s:4:\"user\";s:5:\"count\";i:409;}s:9:\"slideshow\";a:3:{s:4:\"name\";s:9:\"slideshow\";s:4:\"slug\";s:9:\"slideshow\";s:5:\"count\";i:404;}s:6:\"mobile\";a:3:{s:4:\"name\";s:6:\"mobile\";s:4:\"slug\";s:6:\"mobile\";s:5:\"count\";i:400;}s:5:\"stats\";a:3:{s:4:\"name\";s:5:\"stats\";s:4:\"slug\";s:5:\"stats\";s:5:\"count\";i:399;}s:7:\"contact\";a:3:{s:4:\"name\";s:7:\"contact\";s:4:\"slug\";s:7:\"contact\";s:5:\"count\";i:394;}s:5:\"users\";a:3:{s:4:\"name\";s:5:\"users\";s:4:\"slug\";s:5:\"users\";s:5:\"count\";i:393;}s:6:\"photos\";a:3:{s:4:\"name\";s:6:\"photos\";s:4:\"slug\";s:6:\"photos\";s:5:\"count\";i:393;}s:10:\"statistics\";a:3:{s:4:\"name\";s:10:\"statistics\";s:4:\"slug\";s:10:\"statistics\";s:5:\"count\";i:376;}s:3:\"api\";a:3:{s:4:\"name\";s:3:\"api\";s:4:\"slug\";s:3:\"api\";s:5:\"count\";i:376;}s:10:\"navigation\";a:3:{s:4:\"name\";s:10:\"navigation\";s:4:\"slug\";s:10:\"navigation\";s:5:\"count\";i:365;}s:6:\"events\";a:3:{s:4:\"name\";s:6:\"events\";s:4:\"slug\";s:6:\"events\";s:5:\"count\";i:361;}s:4:\"news\";a:3:{s:4:\"name\";s:4:\"news\";s:4:\"slug\";s:4:\"news\";s:5:\"count\";i:349;}s:7:\"plugins\";a:3:{s:4:\"name\";s:7:\"plugins\";s:4:\"slug\";s:7:\"plugins\";s:5:\"count\";i:331;}s:12:\"social-media\";a:3:{s:4:\"name\";s:12:\"social media\";s:4:\"slug\";s:12:\"social-media\";s:5:\"count\";i:331;}s:8:\"calendar\";a:3:{s:4:\"name\";s:8:\"calendar\";s:4:\"slug\";s:8:\"calendar\";s:5:\"count\";i:331;}s:9:\"multisite\";a:3:{s:4:\"name\";s:9:\"multisite\";s:4:\"slug\";s:9:\"multisite\";s:5:\"count\";i:329;}s:10:\"shortcodes\";a:3:{s:4:\"name\";s:10:\"shortcodes\";s:4:\"slug\";s:10:\"shortcodes\";s:5:\"count\";i:321;}s:4:\"code\";a:3:{s:4:\"name\";s:4:\"code\";s:4:\"slug\";s:4:\"code\";s:5:\"count\";i:321;}s:4:\"meta\";a:3:{s:4:\"name\";s:4:\"meta\";s:4:\"slug\";s:4:\"meta\";s:5:\"count\";i:320;}s:4:\"list\";a:3:{s:4:\"name\";s:4:\"list\";s:4:\"slug\";s:4:\"list\";s:5:\"count\";i:317;}s:3:\"url\";a:3:{s:4:\"name\";s:3:\"url\";s:4:\"slug\";s:3:\"url\";s:5:\"count\";i:314;}s:7:\"payment\";a:3:{s:4:\"name\";s:7:\"payment\";s:4:\"slug\";s:7:\"payment\";s:5:\"count\";i:313;}s:10:\"newsletter\";a:3:{s:4:\"name\";s:10:\"newsletter\";s:4:\"slug\";s:10:\"newsletter\";s:5:\"count\";i:310;}s:6:\"simple\";a:3:{s:4:\"name\";s:6:\"simple\";s:4:\"slug\";s:6:\"simple\";s:5:\"count\";i:293;}s:9:\"marketing\";a:3:{s:4:\"name\";s:9:\"marketing\";s:4:\"slug\";s:9:\"marketing\";s:5:\"count\";i:293;}s:3:\"tag\";a:3:{s:4:\"name\";s:3:\"tag\";s:4:\"slug\";s:3:\"tag\";s:5:\"count\";i:291;}s:5:\"popup\";a:3:{s:4:\"name\";s:5:\"popup\";s:4:\"slug\";s:5:\"popup\";s:5:\"count\";i:290;}s:16:\"custom-post-type\";a:3:{s:4:\"name\";s:16:\"custom post type\";s:4:\"slug\";s:16:\"custom-post-type\";s:5:\"count\";i:286;}s:8:\"redirect\";a:3:{s:4:\"name\";s:8:\"redirect\";s:4:\"slug\";s:8:\"redirect\";s:5:\"count\";i:285;}s:4:\"chat\";a:3:{s:4:\"name\";s:4:\"chat\";s:4:\"slug\";s:4:\"chat\";s:5:\"count\";i:284;}s:11:\"advertising\";a:3:{s:4:\"name\";s:11:\"advertising\";s:4:\"slug\";s:11:\"advertising\";s:5:\"count\";i:280;}s:6:\"author\";a:3:{s:4:\"name\";s:6:\"author\";s:4:\"slug\";s:6:\"author\";s:5:\"count\";i:278;}s:7:\"adsense\";a:3:{s:4:\"name\";s:7:\"adsense\";s:4:\"slug\";s:7:\"adsense\";s:5:\"count\";i:275;}s:4:\"html\";a:3:{s:4:\"name\";s:4:\"html\";s:4:\"slug\";s:4:\"html\";s:5:\"count\";i:273;}s:8:\"lightbox\";a:3:{s:4:\"name\";s:8:\"lightbox\";s:4:\"slug\";s:8:\"lightbox\";s:5:\"count\";i:270;}s:5:\"forms\";a:3:{s:4:\"name\";s:5:\"forms\";s:4:\"slug\";s:5:\"forms\";s:5:\"count\";i:267;}s:15:\"payment-gateway\";a:3:{s:4:\"name\";s:15:\"payment gateway\";s:4:\"slug\";s:15:\"payment-gateway\";s:5:\"count\";i:266;}s:14:\"administration\";a:3:{s:4:\"name\";s:14:\"administration\";s:4:\"slug\";s:14:\"administration\";s:5:\"count\";i:262;}s:12:\"notification\";a:3:{s:4:\"name\";s:12:\"notification\";s:4:\"slug\";s:12:\"notification\";s:5:\"count\";i:261;}s:7:\"captcha\";a:3:{s:4:\"name\";s:7:\"captcha\";s:4:\"slug\";s:7:\"captcha\";s:5:\"count\";i:260;}s:7:\"tinymce\";a:3:{s:4:\"name\";s:7:\"tinyMCE\";s:4:\"slug\";s:7:\"tinymce\";s:5:\"count\";i:260;}}", "no");
INSERT INTO `wp_options` VALUES("857", "duplicator_settings", "a:10:{s:7:\"version\";s:5:\"1.2.8\";s:18:\"uninstall_settings\";b:1;s:15:\"uninstall_files\";b:1;s:16:\"uninstall_tables\";b:1;s:13:\"package_debug\";b:0;s:17:\"package_mysqldump\";b:0;s:22:\"package_mysqldump_path\";s:0:\"\";s:24:\"package_phpdump_qrylimit\";s:3:\"100\";s:17:\"package_zip_flush\";b:0;s:20:\"storage_htaccess_off\";b:0;}", "yes");
INSERT INTO `wp_options` VALUES("856", "_site_transient_update_plugins", "O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1495568114;s:7:\"checked\";a:2:{s:25:\"duplicator/duplicator.php\";s:5:\"1.2.8\";s:27:\"wp-super-cache/wp-cache.php\";s:5:\"1.4.9\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:2:{i:0;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:10:\"duplicator\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"1.2.8\";s:7:\"updated\";s:19:\"2017-04-07 02:39:16\";s:7:\"package\";s:77:\"https://downloads.wordpress.org/translation/plugin/duplicator/1.2.8/ru_RU.zip\";s:10:\"autoupdate\";b:1;}i:1;a:7:{s:4:\"type\";s:6:\"plugin\";s:4:\"slug\";s:14:\"wp-super-cache\";s:8:\"language\";s:5:\"ru_RU\";s:7:\"version\";s:5:\"1.4.9\";s:7:\"updated\";s:19:\"2017-03-12 17:04:27\";s:7:\"package\";s:81:\"https://downloads.wordpress.org/translation/plugin/wp-super-cache/1.4.9/ru_RU.zip\";s:10:\"autoupdate\";b:1;}}s:9:\"no_update\";a:2:{s:25:\"duplicator/duplicator.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:24:\"w.org/plugins/duplicator\";s:4:\"slug\";s:10:\"duplicator\";s:6:\"plugin\";s:25:\"duplicator/duplicator.php\";s:11:\"new_version\";s:5:\"1.2.8\";s:3:\"url\";s:41:\"https://wordpress.org/plugins/duplicator/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/plugin/duplicator.1.2.8.zip\";}s:27:\"wp-super-cache/wp-cache.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:28:\"w.org/plugins/wp-super-cache\";s:4:\"slug\";s:14:\"wp-super-cache\";s:6:\"plugin\";s:27:\"wp-super-cache/wp-cache.php\";s:11:\"new_version\";s:5:\"1.4.9\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/wp-super-cache/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/wp-super-cache.1.4.9.zip\";}}}", "no");
INSERT INTO `wp_options` VALUES("833", "supercache_stats", "a:3:{s:9:\"generated\";i:1495567178;s:10:\"supercache\";a:5:{s:7:\"expired\";i:0;s:12:\"expired_list\";a:0:{}s:6:\"cached\";i:0;s:11:\"cached_list\";a:0:{}s:2:\"ts\";i:1495567178;}s:7:\"wpcache\";a:3:{s:6:\"cached\";i:0;s:7:\"expired\";i:0;s:5:\"fsize\";s:3:\"0KB\";}}", "yes");
INSERT INTO `wp_options` VALUES("824", "ossdl_off_cdn_url", "http://localhost", "yes");
INSERT INTO `wp_options` VALUES("825", "ossdl_off_include_dirs", "wp-content,wp-includes", "yes");
INSERT INTO `wp_options` VALUES("826", "ossdl_off_exclude", ".php", "yes");
INSERT INTO `wp_options` VALUES("827", "ossdl_cname", "", "yes");
INSERT INTO `wp_options` VALUES("830", "wpsupercache_start", "1495567081", "yes");
INSERT INTO `wp_options` VALUES("831", "wpsupercache_count", "0", "yes");
INSERT INTO `wp_options` VALUES("829", "wp_super_cache_index_detected", "1", "no");
INSERT INTO `wp_options` VALUES("860", "duplicator_package_active", "O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2017-05-23 19:51:10\";s:7:\"Version\";s:5:\"1.2.8\";s:9:\"VersionWP\";s:5:\"4.7.4\";s:9:\"VersionDB\";s:6:\"5.6.17\";s:10:\"VersionPHP\";s:6:\"5.5.12\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:18:\"20170523_ayasprint\";s:4:\"Hash\";s:32:\"83d8c503b69b448b9810170523195110\";s:8:\"NameHash\";s:51:\"20170523_ayasprint_83d8c503b69b448b9810170523195110\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:28:\"D:/wamp/www/wp-snapshots/tmp\";s:8:\"StoreURL\";s:30:\"http://localhost/wp-snapshots/\";s:8:\"ScanFile\";s:61:\"20170523_ayasprint_83d8c503b69b448b9810170523195110_scan.json\";s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";O:11:\"DUP_Archive\":14:{s:10:\"FilterDirs\";s:0:\"\";s:10:\"FilterExts\";s:0:\"\";s:13:\"FilterDirsAll\";a:0:{}s:13:\"FilterExtsAll\";a:0:{}s:8:\"FilterOn\";i:0;s:12:\"ExportOnlyDB\";i:0;s:4:\"File\";N;s:6:\"Format\";s:3:\"ZIP\";s:7:\"PackDir\";s:11:\"D:/wamp/www\";s:4:\"Size\";i:0;s:4:\"Dirs\";a:0:{}s:5:\"Files\";a:0:{}s:10:\"FilterInfo\";O:23:\"DUP_Archive_Filter_Info\":6:{s:4:\"Dirs\";O:34:\"DUP_Archive_Filter_Scope_Directory\":4:{s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:5:\"Files\";O:29:\"DUP_Archive_Filter_Scope_File\":5:{s:4:\"Size\";a:0:{}s:7:\"Warning\";a:0:{}s:10:\"Unreadable\";a:0:{}s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:4:\"Exts\";O:29:\"DUP_Archive_Filter_Scope_Base\":2:{s:4:\"Core\";a:0:{}s:8:\"Instance\";a:0:{}}s:9:\"UDirCount\";i:0;s:10:\"UFileCount\";i:0;s:9:\"UExtCount\";i:0;}s:10:\"\0*\0Package\";O:11:\"DUP_Package\":23:{s:7:\"Created\";s:19:\"2017-05-23 19:51:10\";s:7:\"Version\";s:5:\"1.2.8\";s:9:\"VersionWP\";s:5:\"4.7.4\";s:9:\"VersionDB\";s:6:\"5.6.17\";s:10:\"VersionPHP\";s:6:\"5.5.12\";s:9:\"VersionOS\";s:5:\"WINNT\";s:2:\"ID\";N;s:4:\"Name\";s:18:\"20170523_ayasprint\";s:4:\"Hash\";s:32:\"83d8c503b69b448b9810170523195110\";s:8:\"NameHash\";s:51:\"20170523_ayasprint_83d8c503b69b448b9810170523195110\";s:4:\"Type\";i:0;s:5:\"Notes\";s:0:\"\";s:9:\"StorePath\";s:28:\"D:/wamp/www/wp-snapshots/tmp\";s:8:\"StoreURL\";s:30:\"http://localhost/wp-snapshots/\";s:8:\"ScanFile\";N;s:7:\"Runtime\";N;s:7:\"ExeSize\";N;s:7:\"ZipSize\";N;s:6:\"Status\";N;s:6:\"WPUser\";N;s:7:\"Archive\";r:22;s:9:\"Installer\";O:13:\"DUP_Installer\":12:{s:4:\"File\";N;s:4:\"Size\";i:0;s:10:\"OptsDBHost\";s:9:\"localhost\";s:10:\"OptsDBPort\";s:2:\"80\";s:10:\"OptsDBName\";s:12:\"cf09127_main\";s:10:\"OptsDBUser\";s:12:\"cf09127_main\";s:12:\"OptsSSLAdmin\";i:0;s:12:\"OptsSSLLogin\";i:0;s:11:\"OptsCacheWP\";i:0;s:13:\"OptsCachePath\";i:0;s:10:\"OptsURLNew\";s:0:\"\";s:10:\"\0*\0Package\";r:53;}s:8:\"Database\";O:12:\"DUP_Database\":13:{s:4:\"Type\";s:5:\"MySQL\";s:4:\"Size\";N;s:4:\"File\";N;s:4:\"Path\";N;s:12:\"FilterTables\";s:0:\"\";s:8:\"FilterOn\";i:0;s:4:\"Name\";N;s:10:\"Compatible\";s:0:\"\";s:8:\"Comments\";s:28:\"MySQL Community Server (GPL)\";s:10:\"\0*\0Package\";r:53;s:25:\"\0DUP_Database\0dbStorePath\";N;s:23:\"\0DUP_Database\0EOFMarker\";s:0:\"\";s:26:\"\0DUP_Database\0networkFlush\";b:0;}}}s:9:\"Installer\";r:75;s:8:\"Database\";r:88;}", "yes");
INSERT INTO `wp_options` VALUES("858", "duplicator_version_plugin", "1.2.8", "yes");
INSERT INTO `wp_options` VALUES("859", "duplicator_ui_view_state", "a:5:{s:28:\"dup-settings-diag-opts-panel\";s:1:\"0\";s:27:\"dup-settings-diag-srv-panel\";s:1:\"0\";s:22:\"dup-pack-storage-panel\";s:1:\"1\";s:24:\"dup-pack-installer-panel\";s:1:\"1\";s:22:\"dup-pack-archive-panel\";s:1:\"0\";}", "yes");
INSERT INTO `wp_options` VALUES("853", "_transient_timeout_hmbkp_schedules", "1496172549", "no");
INSERT INTO `wp_options` VALUES("854", "_transient_hmbkp_schedules", "a:2:{i:0;s:25:\"hmbkp_schedule_1495567613\";i:1;s:25:\"hmbkp_schedule_1495567614\";}", "no");
INSERT INTO `wp_options` VALUES("847", "_transient_timeout_hmbkp_database_size", "1496172504", "no");
INSERT INTO `wp_options` VALUES("848", "_transient_hmbkp_database_size", "192804", "no");

/* INSERT TABLE DATA: wp_order_paper */
INSERT INTO `wp_order_paper` VALUES("5", "2017-03-18", "Sell", "APST", NULL, "99318831", "1000", "1000", "100", "70", "31", "0", "0", "0", "0", "0", "0", "0", "0", "172000", "0", "1", "Резка", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("4", "2017-03-18", "SOLD", "AVO", NULL, "0", "1", "200", "100", "70", "31", "0", "0", "0", "0", "0", "0", "0", "0", "37600", "0", "1", "Резка", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("6", "2017-03-18", "Sell", "Suren Xalachyan", NULL, "99413922", "1000", "1000", "100", "70", "33", "0", "0", "0", "0", "0", "0", "0", "0", "240000", "0", "1", "Резка", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("7", "2017-03-18", "Sell", "Amat", NULL, "91015105", "7200", "7200", "100", "70", "2", "0", "0", "0", "0", "0", "0", "0", "0", "663264", "663200", "0", "Резка", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("8", "2017-03-18", "Sell", "Ani Print LLC", NULL, "91434774", "500", "500", "100", "70", "18", "0", "0", "0", "0", "0", "0", "0", "0", "27440", "0", "1", "Резка", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("30", "2017-03-18", "0.5 l limonad ", "Bjni", NULL, "0", "150000", "4200", "50", "35", "19", "23", "4", "56", "4147", "0", "0", "0", "0", "825000", "0", "1", "Оформлен", "Фактура", "Заказ");
INSERT INTO `wp_order_paper` VALUES("27", "2017-03-18", "Noy 0.33l russia", "Bjni", NULL, "0", "20000", "192", "50", "35", "18", "0", "0", "0", "0", "0", "0", "0", "0", "16600", "0", "1", "Резка", "Фактура", "Заказ");
INSERT INTO `wp_order_paper` VALUES("28", "2017-03-18", "Noy 0.5l russia", "Bjni", NULL, "0", "60000", "775", "50", "35", "18", "0", "0", "0", "0", "0", "0", "0", "0", "70800", "0", "1", "Резка", "Фактура", "Заказ");
INSERT INTO `wp_order_paper` VALUES("29", "2017-03-18", "Noy 1.5 l russia", "Bjni", NULL, "0", "20000", "640", "33", "70", "18", "23", "3", "0", "0", "0", "0", "0", "0", "52800", "0", "1", "Резка", "Фактура", "Заказ");
INSERT INTO `wp_order_paper` VALUES("34", "2017-03-20", "", "APST", NULL, "0", "0", "1070", "64", "90", "49", "0", "0", "0", "0", "0", "0", "0", "0", "59000", "0", "1", "Склад", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("35", "2017-03-21", "", "APST", NULL, "94113331", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("36", "2017-03-21", "", "Arson LLC", NULL, "94494331", "0", "2000", "70", "100", "19", "0", "0", "0", "0", "0", "0", "0", "0", "118496", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("37", "2017-03-21", "", "APST", NULL, "0", "0", "270", "64", "90", "49", "0", "0", "0", "0", "0", "0", "0", "0", "12298", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("38", "2017-03-21", "", "APST", NULL, "0", "0", "200", "70", "100", "2", "0", "0", "0", "0", "0", "0", "0", "0", "19100", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("39", "2017-03-21", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("40", "2017-01-10", "Bjni 0.5 l ", "Bjni", NULL, "0", "100000", "2836", "35", "50", "22", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("41", "2017-03-10", "Tan 0.5l", "Gntunik", NULL, "0", "40000", "1162", "64", "45", "29", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("42", "2017-01-10", "Limonad", "BJNI", NULL, "0", "22000", "640", "35", "50", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("43", "2017-01-10", "0.5 l Russia", "Jermuk Group", NULL, "0", "100000", "2530", "35", "50", "22", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("44", "2017-01-12", "Byuregh 0.5l (russia mountain)", "Jermuk Group", NULL, "0", "30000", "860", "35", "50", "22", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("45", "2017-01-12", "Bjni 0.5 l elit. russia", "BJNI", NULL, "0", "100000", "2805", "35", "50", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("46", "2017-01-12", "Տուփ մեծ", "City", NULL, "0", "5000", "2594", "50", "70", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("47", "2017-01-12", "Միջին տուփ", "City", NULL, "0", "6000", "3050", "50", "70", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("48", "2017-01-12", "Փոքր տուփ", "City", NULL, "0", "5000", "1700", "70", "33", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("49", "2017-01-12", "Ararat 0.33l ", "Gyumri Beer", NULL, "0", "10000", "600", "51", "32", "41", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("50", "2017-01-12", "Dilijan 0.5l", "Gago Vachik", NULL, "0", "150000", "3150", "35", "50", "22", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("51", "2017-03-21", "", "Surik UV", NULL, "0", "0", "600", "70", "100", "3", "0", "0", "0", "0", "0", "0", "0", "0", "51450", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("52", "2017-03-22", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("53", "2017-03-18", "Gyumri 0.33l", "Gyumri Beer", NULL, "0", "1000000", "41400", "51", "38", "51", "23", "4", "0", "0", "0", "0", "51", "15", "0", "0", "0", "Склад", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("54", "2017-03-18", "buklet", "Buklet", NULL, "0", "6000", "1200", "35", "50", "52", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Склад", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("55", "2017-03-21", "Baby go sticker", "Alex Textile", NULL, "0", "17160", "64", "35", "50", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Склад", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("56", "2017-03-21", "Plakat", "Buklet", NULL, "0", "200", "200", "64", "45", "52", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Печать", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("57", "2017-03-21", "0.5l classic Litva", "Jermuk Group", NULL, "0", "35000", "1000", "35", "50", "22", "23", "4", "0", "0", "0", "0", "51", "1", "0", "0", "0", "Печать", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("58", "2017-03-21", "0.33l classic mountain", "Jermuk Group", NULL, "0", "10000", "234", "35", "50", "22", "23", "4", "0", "0", "0", "0", "51", "0", "0", "0", "0", "Печать", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("59", "2017-03-22", "Gold 0.5l", "Gyumri Beer", NULL, "0", "200000", "5025", "35", "50", "38", "23", "4", "0", "0", "0", "0", "51", "7", "0", "0", "0", "Печать", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("60", "2017-03-22", "Ամսագիր (կազմ)", "Abul", NULL, "0", "2000", "550", "60", "42", "21", "23", "8", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Печать", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("61", "2017-03-23", "", "Surik UV", NULL, "0", "0", "1400", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "250600", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("62", "2017-03-23", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("63", "2017-03-23", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("64", "2017-03-23", "", "AG Tparan", NULL, "0", "0", "1500", "70", "100", "33", "0", "0", "0", "0", "0", "0", "0", "0", "300000", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("65", "2017-03-23", "", "APST", NULL, "0", "0", "1400", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "250600", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("66", "2017-03-24", "", "Verona Print LLC", NULL, "0", "0", "10000", "70", "100", "32", "0", "0", "0", "0", "0", "0", "0", "0", "1790000", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("67", "2017-03-24", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("68", "2017-03-24", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "0", "1", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("69", "2017-03-25", "", "Amat", NULL, "0", "0", "12000", "70", "100", "2", "0", "0", "0", "0", "0", "0", "0", "0", "1151500", "1151500", "1", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("70", "2017-03-25", "", "Artak mer", NULL, "0", "0", "2000", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "345800", "345800", "0", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("71", "2017-03-25", "", "Avo", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "38300", "38300", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("75", "2017-03-27", "", "Artak", NULL, "0", "0", "600", "70", "100", "32", "0", "0", "0", "0", "0", "0", "0", "0", "103750", "103750", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("74", "2017-03-27", "", "APST", NULL, "0", "0", "800", "64", "90", "10", "0", "0", "0", "0", "0", "0", "0", "0", "36600", "36600", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("76", "2017-03-27", "", "Artak", NULL, "0", "0", "1400", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "242000", "242000", "0", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("77", "2017-03-27", "", "XXX", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "38300", "38300", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("78", "2017-03-27", "", "Arminpex", NULL, "0", "0", "4000", "64", "90", "10", "0", "0", "0", "0", "0", "0", "0", "0", "182208", "182208", "0", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("79", "2017-03-28", "", "APST", NULL, "0", "0", "800", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "143300", "143300", "0", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("80", "2017-03-28", "", "APST", NULL, "0", "0", "2000", "70", "100", "2", "0", "0", "0", "0", "0", "0", "0", "0", "191916", "191916", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("81", "2017-03-28", "", "XXX", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("82", "2017-03-28", "", "APST", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "35800", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("83", "2017-03-29", "", "Surik UV", NULL, "0", "0", "1000", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "215000", "215000", "0", "Готово", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("84", "2017-03-29", "", "Gago Vachik", NULL, "0", "0", "4000", "60", "100", "4", "0", "0", "0", "0", "0", "0", "0", "0", "378000", "378000", "0", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("85", "2017-03-29", "", "Gago Vachik", NULL, "0", "0", "2500", "70", "100", "2", "0", "0", "0", "0", "0", "0", "0", "0", "246750", "246750", "0", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("86", "2017-03-29", "", "Gago Vachik", NULL, "0", "0", "3000", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "537500", "537500", "0", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("87", "2017-03-29", "", "Gago Vachik", NULL, "0", "0", "2500", "70", "100", "18", "0", "0", "0", "0", "0", "0", "0", "0", "153100", "153100", "0", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("88", "2017-03-23", "Տուփ միջին", "City ", NULL, "0", "5000", "2550", "70", "50", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "Фактура", "Заказ");
INSERT INTO `wp_order_paper` VALUES("89", "2017-03-23", "Flyer", "Flyer", NULL, "0", "5000", "363", "64", "45", "21", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("90", "2017-03-24", "Տուփ փոքր", "City", NULL, "0", "7000", "2365", "70", "33", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("91", "2017-03-24", "Top Sun", "Spitak Glxark", NULL, "0", "20000", "860", "35", "50", "42", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("92", "2017-03-24", "Top Sun", "Spitak Glxark", NULL, "0", "15000", "864", "70", "33", "42", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("93", "2017-03-24", "Magazine", "Football Federation", NULL, "0", "300", "275", "50", "70", "53", "23", "12", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("94", "2017-03-24", "Magazine kazm", "Football Federation", NULL, "0", "300", "88", "50", "70", "54", "23", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("95", "2017-03-24", "Magazine mijuk", "Abul", NULL, "0", "2000", "3630", "42", "60", "46", "23", "32", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("96", "2017-03-30", "", "Ani Print LLC", NULL, "0", "0", "12000", "70", "100", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Склад", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("97", "2017-03-30", "", "Surik Uv", NULL, "0", "0", "1000", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "179166", "179166", "0", "Склад", "null", "Продажа");
INSERT INTO `wp_order_paper` VALUES("98", "2017-03-30", "", "Ando Tairov", NULL, "0", "0", "1000", "70", "100", "13", "0", "0", "0", "0", "0", "0", "0", "0", "116500", "116500", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("99", "2017-04-01", "", "Mayis Deni", NULL, "0", "0", "600", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "103750", "103750", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("100", "2017-04-01", "", "Arson LLC", NULL, "0", "0", "1000", "70", "100", "19", "0", "0", "0", "0", "0", "0", "0", "0", "58300", "58300", "0", "Готово", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("101", "2017-03-30", "", "AG Print LLC", NULL, "0", "0", "2000", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Склад", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("102", "2017-03-31", "", "APST LLC", NULL, "0", "0", "1000", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "179000", "179000", "0", "Склад", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("103", "2017-03-31", "", "APST LLC", NULL, "0", "0", "1400", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "250800", "250800", "0", "Склад", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("104", "2017-03-31", "", "Ani Print LLC", NULL, "0", "0", "1500", "70", "100", "18", "0", "0", "0", "0", "0", "0", "0", "0", "86730", "86730", "0", "Склад", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("105", "2017-03-31", "", "Ani Print LLC", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "35800", "0", "Склад", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("106", "2017-03-31", "", "Amat", NULL, "0", "0", "200", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "36600", "36600", "0", "Склад", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("107", "2017-04-01", "", "APST LLC", NULL, "0", "0", "1000", "70", "100", "2", "0", "0", "0", "0", "0", "0", "0", "0", "95900", "95900", "0", "Склад", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("108", "2017-04-01", "", "AVO", NULL, "0", "0", "800", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "153300", "153300", "0", "Склад", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("109", "2017-04-04", "", "APST LLC", NULL, "0", "0", "400", "70", "100", "31", "0", "0", "0", "0", "0", "0", "0", "0", "71600", "71600", "0", "Склад", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("110", "2017-04-04", "", "APST LLC", NULL, "0", "0", "1350", "0", "0", "22", "0", "0", "0", "0", "0", "0", "0", "0", "136000", "0", "1", "Склад", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("111", "2017-04-04", "", "APST LLC", NULL, "0", "0", "1000", "70", "100", "1", "0", "0", "0", "0", "0", "0", "0", "0", "110250", "110250", "0", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("112", "2017-04-04", "", "APST LLC", NULL, "0", "0", "600", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "107500", "107500", "0", "Оформлен", "Налич", "Продажа");
INSERT INTO `wp_order_paper` VALUES("113", "2017-04-04", "", "APST LLC", NULL, "0", "0", "200", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "35800", "35800", "0", "Оформлен", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("114", "2017-04-04", "", "Ani Print LLC", NULL, "0", "0", "400", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "71600", "71600", "0", "Оформлен", "Фактура", "Продажа");
INSERT INTO `wp_order_paper` VALUES("115", "2017-01-10", "", "Ani Print LLC", NULL, "0", "0", "6500", "0", "0", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("116", "2017-01-13", "", "Ani Print LLC", NULL, "0", "0", "14000", "0", "0", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("117", "2017-01-14", "", "Ani Print LLC", NULL, "0", "0", "250", "0", "0", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("118", "2017-01-12", "", "APST", NULL, "0", "0", "400", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("119", "2017-01-12", "", "APST LLC", NULL, "0", "0", "600", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("120", "2017-01-12", "", "APST LLC", NULL, "0", "0", "200", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("121", "2017-01-13", "", "SURIK UV", NULL, "0", "0", "2200", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("122", "2017-01-14", "", "X", NULL, "0", "0", "200", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("123", "2017-01-14", "", "X", NULL, "0", "0", "2000", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("124", "2017-01-14", "", "AMAT", NULL, "0", "0", "400", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("125", "2017-01-16", "", "ANDO TAIROV", NULL, "0", "0", "600", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("126", "2017-01-17", "", "APST LLC", NULL, "0", "0", "1800", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("127", "2017-01-17", "", "SURIK UV", NULL, "0", "0", "2000", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("128", "2017-01-18", "", "GAGO VACHIK", NULL, "0", "0", "1400", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("129", "2017-01-26", "", "SURIK UV", NULL, "0", "0", "4000", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("130", "2017-01-26", "", "SENIK", NULL, "0", "0", "400", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("131", "2017-01-27", "", "ARTAK KILIKYAN", NULL, "0", "0", "2000", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("132", "2017-01-28", "", "X", NULL, "0", "0", "200", "0", "0", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("133", "2017-01-11", "", "X", NULL, "0", "0", "125", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Склад", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("134", "2017-01-13", "", "ANI PRINT LLC", NULL, "0", "0", "375", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Склад", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("135", "2017-01-14", "", "X", NULL, "0", "0", "100", "0", "0", "3", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("136", "2017-01-20", "", "MAXPRINT", NULL, "0", "0", "125", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("137", "2017-01-23", "", "TALIN", NULL, "0", "0", "750", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("138", "2017-01-23", "", "PRINTARMDANVEST", NULL, "0", "0", "700", "0", "0", "13", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("139", "2017-01-24", "", "SURIK UV", NULL, "0", "0", "750", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("140", "2017-01-24", "", "X", NULL, "0", "0", "1000", "0", "0", "22", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("141", "2017-01-24", "", "VAGA PRINT LLC", NULL, "0", "0", "600", "0", "0", "13", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("142", "2017-01-24", "", "DZKANOC", NULL, "0", "0", "111", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("143", "2017-01-24", "", "SURIK UV", NULL, "0", "0", "375", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("144", "2017-01-25", "", "ARSON LLC", NULL, "0", "0", "500", "0", "0", "22", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("145", "2017-01-25", "", "ARSON LLC", NULL, "0", "0", "2000", "0", "0", "19", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("146", "2017-01-27", "", "ARSON LLC", NULL, "0", "0", "1500", "0", "0", "19", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("147", "2017-01-27", "", "PRINTARMDANVEST", NULL, "0", "0", "100", "0", "0", "15", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("148", "2017-01-30", "", "PRINTARMDANVEST", NULL, "0", "0", "250", "0", "0", "21", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("149", "2017-01-30", "", "AG PRINT LLC", NULL, "0", "0", "125", "0", "0", "33", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("150", "2017-01-30", "", NULL, "4", "0", "0", "30", "0", "0", "2", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("151", "2017-01-31", "", "ANI PRINT LLC", NULL, "0", "0", "1500", "0", "0", "22", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("152", "2017-01-31", "", "MUSALER LLC", NULL, "0", "0", "620", "0", "0", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("153", "2017-01-10", "", "GAGO VACHIK", NULL, "0", "0", "600", "0", "0", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("154", "2017-02-02", "", "ANI PRINT LLC", NULL, "0", "0", "14000", "0", "0", "18", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Продажа");
INSERT INTO `wp_order_paper` VALUES("155", "2017-05-12", "mercury", NULL, "3", "91611780", "12", "12", "12", "1", "38", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("156", "2017-05-21", "3333333", NULL, "2", "333333", "333", "33", "3", "3", "31", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_paper` VALUES("157", "2017-05-20", "datark", NULL, "1", "91", "12", "8", "12", "17", "3", "24", "9", "0", "0", "0", "0", "0", "0", "13168", "13168", "0", "Оформлен", "datark", "Заказ");
INSERT INTO `wp_order_paper` VALUES("158", "2017-05-31", "Налич", NULL, "1", "0", "12", "100", "19", "200", "1", "23", "30", "0", "0", "0", "0", "0", "0", "40600", "40600", "0", "Оформлен", "Налич", "Заказ");

/* INSERT TABLE DATA: wp_order_roll */
INSERT INTO `wp_order_roll` VALUES("5", "2017-01-10", "Yogurt", NULL, "4", "0", "60000", "145", "0.07", "8", "3", "0", "0", "0", "0", "0", "0", "0", "0", "105000", "101000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("11", "2017-01-12", "Vanakan (etapitak England)", "Voskevaz", NULL, "0", "500", "4", "0.085", "2", "22", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Резка", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("7", "2017-01-12", "Vokevaz ( dry red )", "Voskevaz", NULL, "0", "500", "37", "0.123", "2", "16", "24", "1", "59", "18", "0", "0", "39", "1", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("10", "2017-01-12", "Voskevaz (Dry red)", "Voskevaz", NULL, "0", "500", "10", "0.123", "2", "16", "24", "1", "59", "3", "0", "0", "39", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("9", "2017-01-14", "Nur ", "Voskevaz", NULL, "0", "500", "23", "0.075", "2", "16", "24", "4", "58", "3", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("12", "2017-01-14", "Rose dimapitak", "Voskevaz", NULL, "0", "500", "6", "0.075", "2", "16", "24", "4", "58", "5", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("13", "2017-01-17", "Karasi colection", "Voskevaz", NULL, "0", "7500", "86", "0.115", "2", "24", "24", "1", "58", "30", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("14", "2017-01-17", "Karasi Colection (dimapitak)", "Voskevaz", NULL, "0", "4200", "61", "0.115", "2", "18", "24", "0", "58", "17", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("15", "2017-01-18", "Karasi colection (russia etapitak)", "Voskevaz", NULL, "0", "4800", "45", "0.077", "2", "22", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("16", "2017-01-18", "Vanakan (etapitak russia)", "Voskevaz", NULL, "0", "1400", "15", "0.085", "2", "22", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("17", "2017-01-19", "sticker", "Artik kat", NULL, "0", "150000", "506", "0.092", "6", "3", "24", "1", "0", "0", "0", "0", "0", "0", "300000", "0", "1", "Готово", "Налич", "Заказ");
INSERT INTO `wp_order_roll` VALUES("18", "2017-01-19", "sticker", "Ararat Group", NULL, "0", "30000", "28", "0.12", "35", "3", "24", "1", "0", "0", "0", "0", "0", "0", "18000", "0", "1", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("19", "2017-01-22", "Voskepar ", "Voskevaz", NULL, "0", "500", "8", "0.085", "2", "17", "24", "3", "58", "6", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("20", "2017-01-20", "Areni", "Voskevaz", NULL, "0", "500", "8", "0.085", "2", "17", "24", "3", "58", "6", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("21", "2017-01-20", "Urzana", "Voskevaz", NULL, "0", "500", "8", "0.085", "2", "17", "24", "3", "58", "6", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("22", "2017-01-20", "Nuraz", "Voskevaz", NULL, "0", "500", "8", "0.085", "2", "17", "24", "3", "58", "6", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("23", "2017-01-23", "Vanakan England", "Voskevaz", NULL, "0", "1600", "23", "0.095", "2", "22", "24", "2", "61", "5", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("24", "2017-01-24", "Katarine", "Voskevaz", NULL, "0", "500", "5", "0.064", "2", "16", "24", "4", "58", "5", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("25", "2017-03-23", "Muscat Rosali", "Voskevaz", NULL, "0", "500", "5", "0.064", "2", "16", "24", "4", "58", "5", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("26", "2017-01-24", "Katarine (etapitak)", "Voskevaz", NULL, "0", "500", "3", "0.06", "2", "30", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("27", "2017-01-24", "Muscat", "Voskevaz", NULL, "0", "500", "3", "0.06", "2", "30", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("28", "2017-01-25", "Tesakani ", "Noyan", NULL, "0", "103000", "1300", "0.172", "3", "3", "24", "60", "0", "0", "0", "0", "0", "0", "901250", "0", "1", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("29", "2017-01-31", "Byuregh 5l", "Jermuk Group", NULL, "0", "20000", "506", "0.23", "2", "3", "24", "5", "0", "0", "0", "0", "39", "1", "270000", "270000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("30", "2017-01-31", "Byuregh 3l", "Jermuk Group", NULL, "0", "3000", "51", "0.186", "2", "4", "24", "5", "0", "0", "0", "0", "39", "1", "30000", "30000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("31", "2017-02-15", "Vokevaz (Red semi sweet) ", "Voskevaz", NULL, "0", "10000", "86", "0.075", "2", "30", "24", "1", "0", "0", "0", "0", "39", "1", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("32", "2017-02-15", "Voskevaz Rd. d. et. white semi sweet et. ", "Voskevaz", NULL, "0", "10000", "86", "0.075", "2", "30", "24", "1", "0", "0", "0", "0", "39", "1", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("33", "2017-02-15", "Voskevaz white dry et.", "Voskevaz", NULL, "0", "2000", "17", "0.075", "2", "30", "24", "1", "0", "0", "0", "0", "39", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("34", "2017-02-15", "Nur et.", "Voskevaz", NULL, "0", "5000", "45", "0.077", "2", "18", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("35", "2017-02-02", "Byuregh 5l", "Jermuk Group", NULL, "0", "20000", "506", "0.23", "2", "3", "0", "0", "0", "0", "0", "0", "39", "1", "270000", "270000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("36", "2017-02-03", "Splash water 5+1 L", "Bjni", NULL, "0", "15000", "189", "0.105", "2", "3", "24", "2", "0", "0", "0", "0", "39", "1", "150000", "150000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("37", "2017-02-04", "Ֆեյխոա 1l", "Artsakh Bio", NULL, "0", "2000", "44", "0.16", "2", "3", "24", "5", "0", "0", "0", "0", "39", "0", "20000", "20000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("38", "2017-02-06", "Tomat 950 ml.", "Artsakh Bio", NULL, "0", "5000", "84", "0.17", "2", "8", "24", "5", "0", "0", "0", "0", "39", "0", "50000", "50000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("39", "2017-02-06", "Խորոված բանջարեղեն 950 ml.", "Artsakh Bio", NULL, "0", "5000", "84", "0.17", "2", "8", "24", "5", "0", "0", "0", "0", "39", "0", "50000", "50000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("40", "2017-02-07", "Սխտորի մարինադ 580 ml.", "Artsakh Bio", NULL, "0", "3000", "29", "0.145", "3", "8", "24", "5", "0", "0", "0", "0", "39", "0", "26000", "26000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("41", "2017-02-07", "կարմիր բիբար", "Artsakh Bio", NULL, "0", "5000", "34", "0.145", "3", "8", "24", "5", "0", "0", "0", "0", "39", "1", "42800", "42800", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("42", "2017-02-08", "Աջիկա 580 ml.", "Artsakh Bio", NULL, "0", "5000", "73", "0.16", "2", "4", "24", "5", "0", "0", "0", "0", "39", "0", "54799", "54799", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("43", "2017-02-08", "խաղողի տերև 720 ml.", "Artsakh Bio", NULL, "0", "5000", "77", "0.17", "2", "4", "24", "5", "0", "0", "0", "0", "39", "0", "54000", "54000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("69", "2017-02-09", "Ֆեյխոա 1l", "Artsakh Bio", NULL, "0", "5000", "110", "0.16", "2", "3", "24", "4", "0", "0", "0", "0", "39", "1", "51000", "51000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("45", "2017-02-10", "Yogurt", "Ashtarak Kat", NULL, "0", "80000", "193", "0.07", "8", "3", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("46", "2017-02-11", "ՊՆ մար. վարունգ", "Artsakh Bio", NULL, "0", "5000", "32", "0.104", "3", "4", "24", "4", "0", "0", "0", "0", "39", "0", "20000", "20000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("47", "2017-02-12", "Sizes", "Alex Textile", NULL, "0", "120000", "55", "0.18", "72", "4", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("48", "2017-02-13", "Խավիար Germany", "Artsakh Bio", NULL, "0", "5000", "73", "0.16", "2", "4", "24", "0", "0", "0", "0", "0", "39", "0", "54000", "54000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("49", "2017-02-14", "Լեչո 720 ml.", "Artsakh Bio", NULL, "0", "2000", "31", "0.17", "2", "4", "24", "0", "0", "0", "0", "0", "39", "0", "22700", "22700", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("50", "2017-02-14", "Խորոված բանջարեղեն 970 ml.", "Artsakh Bio", NULL, "0", "2500", "42", "0.17", "2", "8", "0", "0", "0", "0", "0", "0", "39", "0", "25000", "25000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("51", "2017-02-14", "Տոմատ germ. 980 ml.", "Artsakh Bio", NULL, "0", "1500", "25", "0.17", "2", "8", "0", "0", "0", "0", "0", "0", "39", "0", "18000", "18000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("52", "2017-02-17", "Իմամ բայալդի ger. 560 - 300 g", "Artsakh Bio", NULL, "0", "2500", "24", "0.145", "3", "8", "0", "0", "0", "0", "0", "0", "39", "0", "21600", "21600", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("53", "2017-02-17", "կանաչ սխտոր 560-300 g", "Artsakh Bio", NULL, "0", "2000", "20", "0.145", "3", "8", "0", "0", "0", "0", "0", "0", "39", "0", "21000", "21000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("54", "2017-02-18", "Սերկեֆիլ կոմպոտ 1l", "Artsakh Bio", NULL, "0", "2000", "44", "0.16", "2", "3", "0", "0", "0", "0", "0", "0", "39", "0", "21000", "21000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("55", "2017-02-18", "Վայրի տանձ կոմպոտ 1l", "Artsakh Bio", NULL, "0", "2000", "44", "0.16", "2", "3", "0", "0", "0", "0", "0", "0", "39", "0", "20800", "20800", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("56", "2017-03-01", "Noy 0.5l china (դիմապիտակ ՊԷԹ)", "BJNI", NULL, "0", "7000", "91", "0.065", "2", "26", "24", "4", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("57", "2017-03-01", "Noy 0.5l ետապիտակ ՊԷԹ china", "BJNI", NULL, "0", "7000", "23", "0.05", "6", "26", "24", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("58", "2017-03-01", "Noy 0.33l ՊԷԹ դիմապիտակ china", "BJNI", NULL, "0", "7000", "46", "0.05", "3", "26", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("59", "2017-03-01", "Noy 0.33l ՊԷԹ ետապիտակ china", "BJNI", NULL, "0", "7000", "27", "0.092", "6", "27", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("60", "2017-03-06", "Byuregh 3l", "Jermuk Group", NULL, "0", "5000", "85", "0.186", "2", "4", "0", "0", "0", "0", "0", "0", "39", "0", "50000", "50000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("61", "2017-03-07", "Voskepar", "Voskevaz", NULL, "0", "2000", "28", "0.085", "2", "17", "24", "3", "58", "21", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("62", "2017-03-08", "Byuregh 5l", "Jermuk Group", NULL, "0", "10000", "253", "0.23", "2", "31", "0", "0", "0", "0", "0", "0", "39", "1", "135000", "135000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("63", "2017-03-10", "Tesakani", "Noyan", NULL, "0", "40000", "505", "0.172", "3", "31", "0", "0", "0", "0", "0", "0", "0", "0", "350000", "350000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("64", "2017-03-11", "Voskepar ետապիտակ 2014", "Voskevaz", NULL, "0", "1000", "8", "0.077", "2", "30", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("65", "2017-03-11", "Areni 2013 ետապիտակ", "Voskevaz ", NULL, "0", "1000", "8", "0.077", "2", "30", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("66", "2017-03-13", "Nur dimapitak", "Voskevaz", NULL, "0", "5000", "6", "0.075", "2", "16", "24", "4", "58", "15", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("67", "2017-03-13", "Nur small", "Voskevaz", NULL, "0", "5000", "61", "0.075", "2", "16", "24", "4", "58", "23", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("68", "2017-03-15", "Voskevaz Red semi sweet", "Voskevaz", NULL, "0", "10000", "175", "0.108", "2", "16", "24", "2", "57", "58", "0", "0", "0", "0", "0", "0", "0", "Готово", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("70", "2016-11-30", "Voskevaz (semi sweet dimapitak)", "Voskevaz", NULL, "0", "1000", "20", "0.123", "2", "16", "24", "2", "57", "6", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("71", "2016-11-12", "Նուռ USA", "Voskevaz", NULL, "0", "2000", "28", "0.08", "2", "17", "24", "4", "58", "9", "0", "0", "39", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("72", "2016-11-12", "Rose USA", "Voskevaz", NULL, "0", "2000", "28", "0.08", "2", "17", "24", "4", "58", "24", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("73", "2016-11-30", "Voskevaz (ետապիտակ USA)", "Voskevaz", NULL, "0", "5000", "44", "0.077", "2", "30", "24", "1", "0", "0", "0", "0", "39", "1", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("74", "2016-11-19", "Voskepar", "Voskevaz", NULL, "0", "3000", "47", "0.09", "2", "17", "24", "4", "58", "32", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("75", "2016-12-19", "Voskepar (ետապիտակ)", "Voskevaz", NULL, "0", "800", "8", "0.08", "2", "18", "24", "1", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("76", "2016-12-22", "Vanakan ", "Voskevaz", NULL, "0", "1000", "14", "0.095", "2", "22", "24", "0", "61", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("77", "2016-12-15", "Nur (eng.)", "Voskevaz", NULL, "0", "500", "7", "0.08", "2", "17", "24", "4", "58", "2", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("78", "2016-12-15", "Rose (eng.)", "Voskevaz", NULL, "0", "500", "7", "0.08", "2", "17", "24", "4", "58", "6", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("79", "2017-03-22", "Yogurt", "Ashtarak kat", NULL, "0", "60000", "135", "0.07", "8", "3", "24", "1", "0", "0", "0", "0", "0", "0", "102000", "102000", "0", "Готово", "Фактура", "Заказ");
INSERT INTO `wp_order_roll` VALUES("80", "2017-05-12", "Ssss", "sssss", NULL, "0", "4", "4", "4", "4", "29", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("81", "2017-05-28", "forma", "Saqo", NULL, "9161179", "22", "22", "22", "22", "27", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");
INSERT INTO `wp_order_roll` VALUES("82", "2017-05-21", "forward", NULL, "3", "10", "22", "11", "11", "11", "29", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "Оформлен", "", "Заказ");

/* INSERT TABLE DATA: wp_postmeta */
INSERT INTO `wp_postmeta` VALUES("17", "14", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("18", "14", "_edit_lock", "1494181297:1");
INSERT INTO `wp_postmeta` VALUES("19", "14", "_wp_page_template", "template_stock_paper.php");
INSERT INTO `wp_postmeta` VALUES("23", "16", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("24", "16", "_menu_item_menu_item_parent", "23");
INSERT INTO `wp_postmeta` VALUES("25", "16", "_menu_item_object_id", "14");
INSERT INTO `wp_postmeta` VALUES("26", "16", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("27", "16", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("28", "16", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("29", "16", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("30", "16", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("41", "19", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("42", "19", "_edit_lock", "1487628825:1");
INSERT INTO `wp_postmeta` VALUES("43", "19", "_wp_page_template", "template_create_paper.php");
INSERT INTO `wp_postmeta` VALUES("44", "21", "_menu_item_type", "custom");
INSERT INTO `wp_postmeta` VALUES("45", "21", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("46", "21", "_menu_item_object_id", "21");
INSERT INTO `wp_postmeta` VALUES("47", "21", "_menu_item_object", "custom");
INSERT INTO `wp_postmeta` VALUES("48", "21", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("49", "21", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("50", "21", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("51", "21", "_menu_item_url", "#");
INSERT INTO `wp_postmeta` VALUES("63", "23", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("53", "22", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("54", "22", "_menu_item_menu_item_parent", "21");
INSERT INTO `wp_postmeta` VALUES("55", "22", "_menu_item_object_id", "19");
INSERT INTO `wp_postmeta` VALUES("56", "22", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("57", "22", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("58", "22", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("59", "22", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("60", "22", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("62", "23", "_menu_item_type", "custom");
INSERT INTO `wp_postmeta` VALUES("64", "23", "_menu_item_object_id", "23");
INSERT INTO `wp_postmeta` VALUES("65", "23", "_menu_item_object", "custom");
INSERT INTO `wp_postmeta` VALUES("66", "23", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("67", "23", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("68", "23", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("69", "23", "_menu_item_url", "#");
INSERT INTO `wp_postmeta` VALUES("85", "28", "_menu_item_object_id", "28");
INSERT INTO `wp_postmeta` VALUES("84", "28", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("83", "28", "_menu_item_type", "custom");
INSERT INTO `wp_postmeta` VALUES("82", "26", "_edit_lock", "1488484647:1");
INSERT INTO `wp_postmeta` VALUES("80", "26", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("81", "26", "_wp_page_template", "template_stock_edit.php");
INSERT INTO `wp_postmeta` VALUES("86", "28", "_menu_item_object", "custom");
INSERT INTO `wp_postmeta` VALUES("87", "28", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("88", "28", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("89", "28", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("90", "28", "_menu_item_url", "#");
INSERT INTO `wp_postmeta` VALUES("92", "29", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("93", "29", "_wp_page_template", "template_order_new.php");
INSERT INTO `wp_postmeta` VALUES("94", "29", "_edit_lock", "1495566390:1");
INSERT INTO `wp_postmeta` VALUES("140", "47", "_menu_item_menu_item_parent", "28");
INSERT INTO `wp_postmeta` VALUES("139", "47", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("138", "45", "_wp_page_template", "template_order_roll.php");
INSERT INTO `wp_postmeta` VALUES("137", "45", "_edit_lock", "1494689844:1");
INSERT INTO `wp_postmeta` VALUES("136", "45", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("104", "32", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("105", "32", "_edit_lock", "1494699228:1");
INSERT INTO `wp_postmeta` VALUES("106", "32", "_wp_page_template", "order_handler.php");
INSERT INTO `wp_postmeta` VALUES("109", "37", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("110", "37", "_wp_page_template", "template_order_paper.php");
INSERT INTO `wp_postmeta` VALUES("111", "37", "_edit_lock", "1494267517:1");
INSERT INTO `wp_postmeta` VALUES("112", "39", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("113", "39", "_menu_item_menu_item_parent", "28");
INSERT INTO `wp_postmeta` VALUES("114", "39", "_menu_item_object_id", "37");
INSERT INTO `wp_postmeta` VALUES("115", "39", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("116", "39", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("117", "39", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("118", "39", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("119", "39", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("121", "40", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("122", "40", "_edit_lock", "1494689829:1");
INSERT INTO `wp_postmeta` VALUES("123", "40", "_wp_page_template", "template_order_single.php");
INSERT INTO `wp_postmeta` VALUES("127", "43", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("128", "43", "_menu_item_menu_item_parent", "28");
INSERT INTO `wp_postmeta` VALUES("129", "43", "_menu_item_object_id", "29");
INSERT INTO `wp_postmeta` VALUES("130", "43", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("131", "43", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("132", "43", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("133", "43", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("134", "43", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("141", "47", "_menu_item_object_id", "45");
INSERT INTO `wp_postmeta` VALUES("142", "47", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("143", "47", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("144", "47", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("145", "47", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("146", "47", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("148", "48", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("149", "48", "_edit_lock", "1494267832:1");
INSERT INTO `wp_postmeta` VALUES("150", "48", "_wp_page_template", "template_create_roll.php");
INSERT INTO `wp_postmeta` VALUES("151", "50", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("152", "50", "_menu_item_menu_item_parent", "21");
INSERT INTO `wp_postmeta` VALUES("153", "50", "_menu_item_object_id", "48");
INSERT INTO `wp_postmeta` VALUES("154", "50", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("155", "50", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("156", "50", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("157", "50", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("158", "50", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("160", "51", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("161", "51", "_edit_lock", "1488485476:1");
INSERT INTO `wp_postmeta` VALUES("162", "51", "_wp_page_template", "template_create_other.php");
INSERT INTO `wp_postmeta` VALUES("185", "58", "_menu_item_menu_item_parent", "23");
INSERT INTO `wp_postmeta` VALUES("184", "58", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("183", "56", "_wp_page_template", "template_stock_roll.php");
INSERT INTO `wp_postmeta` VALUES("182", "56", "_edit_lock", "1488750908:1");
INSERT INTO `wp_postmeta` VALUES("181", "56", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("172", "54", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("173", "54", "_menu_item_menu_item_parent", "21");
INSERT INTO `wp_postmeta` VALUES("174", "54", "_menu_item_object_id", "51");
INSERT INTO `wp_postmeta` VALUES("175", "54", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("176", "54", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("177", "54", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("178", "54", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("179", "54", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("186", "58", "_menu_item_object_id", "56");
INSERT INTO `wp_postmeta` VALUES("187", "58", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("188", "58", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("189", "58", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("190", "58", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("191", "58", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("193", "59", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("194", "59", "_edit_lock", "1488750975:1");
INSERT INTO `wp_postmeta` VALUES("195", "59", "_wp_page_template", "template_stock_other.php");
INSERT INTO `wp_postmeta` VALUES("196", "61", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("197", "61", "_menu_item_menu_item_parent", "23");
INSERT INTO `wp_postmeta` VALUES("198", "61", "_menu_item_object_id", "59");
INSERT INTO `wp_postmeta` VALUES("199", "61", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("200", "61", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("201", "61", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("202", "61", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("203", "61", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("205", "62", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("206", "62", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("207", "62", "_menu_item_object_id", "45");
INSERT INTO `wp_postmeta` VALUES("208", "62", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("209", "62", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("210", "62", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("211", "62", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("212", "62", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("214", "63", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("215", "63", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("216", "63", "_menu_item_object_id", "37");
INSERT INTO `wp_postmeta` VALUES("217", "63", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("218", "63", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("219", "63", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("220", "63", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("221", "63", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("223", "64", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("224", "64", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("225", "64", "_menu_item_object_id", "29");
INSERT INTO `wp_postmeta` VALUES("226", "64", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("227", "64", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("228", "64", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("229", "64", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("230", "64", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("259", "68", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("260", "68", "_menu_item_menu_item_parent", "71");
INSERT INTO `wp_postmeta` VALUES("261", "68", "_menu_item_object_id", "59");
INSERT INTO `wp_postmeta` VALUES("262", "68", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("263", "68", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("264", "68", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("265", "68", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("266", "68", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("295", "73", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("268", "69", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("269", "69", "_menu_item_menu_item_parent", "71");
INSERT INTO `wp_postmeta` VALUES("270", "69", "_menu_item_object_id", "56");
INSERT INTO `wp_postmeta` VALUES("271", "69", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("272", "69", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("273", "69", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("274", "69", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("275", "69", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("296", "73", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("277", "70", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("278", "70", "_menu_item_menu_item_parent", "71");
INSERT INTO `wp_postmeta` VALUES("279", "70", "_menu_item_object_id", "14");
INSERT INTO `wp_postmeta` VALUES("280", "70", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("281", "70", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("282", "70", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("283", "70", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("284", "70", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("297", "73", "_menu_item_object_id", "45");
INSERT INTO `wp_postmeta` VALUES("286", "71", "_menu_item_type", "custom");
INSERT INTO `wp_postmeta` VALUES("287", "71", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("288", "71", "_menu_item_object_id", "71");
INSERT INTO `wp_postmeta` VALUES("289", "71", "_menu_item_object", "custom");
INSERT INTO `wp_postmeta` VALUES("290", "71", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("291", "71", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("292", "71", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("293", "71", "_menu_item_url", "#");
INSERT INTO `wp_postmeta` VALUES("298", "73", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("299", "73", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("300", "73", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("301", "73", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("302", "73", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("313", "75", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("304", "74", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("305", "74", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("306", "74", "_menu_item_object_id", "37");
INSERT INTO `wp_postmeta` VALUES("307", "74", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("308", "74", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("309", "74", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("310", "74", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("311", "74", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("314", "75", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("315", "75", "_menu_item_object_id", "45");
INSERT INTO `wp_postmeta` VALUES("316", "75", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("317", "75", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("318", "75", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("319", "75", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("320", "75", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("331", "77", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("322", "76", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("323", "76", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("324", "76", "_menu_item_object_id", "37");
INSERT INTO `wp_postmeta` VALUES("325", "76", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("326", "76", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("327", "76", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("328", "76", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("329", "76", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("332", "77", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("333", "77", "_menu_item_object_id", "45");
INSERT INTO `wp_postmeta` VALUES("334", "77", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("335", "77", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("336", "77", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("337", "77", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("338", "77", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("349", "80", "_edit_lock", "1489838327:1");
INSERT INTO `wp_postmeta` VALUES("340", "78", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("341", "78", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("342", "78", "_menu_item_object_id", "37");
INSERT INTO `wp_postmeta` VALUES("343", "78", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("344", "78", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("345", "78", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("346", "78", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("347", "78", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("350", "80", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("351", "80", "_wp_page_template", "template_finance_paper.php");
INSERT INTO `wp_postmeta` VALUES("352", "82", "_edit_lock", "1489533523:1");
INSERT INTO `wp_postmeta` VALUES("353", "82", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("354", "82", "_wp_page_template", "template_finance_roll.php");
INSERT INTO `wp_postmeta` VALUES("355", "84", "_menu_item_type", "custom");
INSERT INTO `wp_postmeta` VALUES("356", "84", "_menu_item_menu_item_parent", "0");
INSERT INTO `wp_postmeta` VALUES("357", "84", "_menu_item_object_id", "84");
INSERT INTO `wp_postmeta` VALUES("358", "84", "_menu_item_object", "custom");
INSERT INTO `wp_postmeta` VALUES("359", "84", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("360", "84", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("361", "84", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("362", "84", "_menu_item_url", "#");
INSERT INTO `wp_postmeta` VALUES("384", "88", "_edit_lock", "1494179279:1");
INSERT INTO `wp_postmeta` VALUES("364", "85", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("365", "85", "_menu_item_menu_item_parent", "84");
INSERT INTO `wp_postmeta` VALUES("366", "85", "_menu_item_object_id", "82");
INSERT INTO `wp_postmeta` VALUES("367", "85", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("368", "85", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("369", "85", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("370", "85", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("371", "85", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("373", "86", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("374", "86", "_menu_item_menu_item_parent", "84");
INSERT INTO `wp_postmeta` VALUES("375", "86", "_menu_item_object_id", "80");
INSERT INTO `wp_postmeta` VALUES("376", "86", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("377", "86", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("378", "86", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("379", "86", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("380", "86", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("385", "88", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("386", "88", "_wp_page_template", "template_sale_new.php");
INSERT INTO `wp_postmeta` VALUES("405", "92", "_edit_lock", "1494963389:1");
INSERT INTO `wp_postmeta` VALUES("406", "92", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("407", "92", "_wp_page_template", "sale_handler.php");
INSERT INTO `wp_postmeta` VALUES("408", "94", "_edit_lock", "1489676400:1");
INSERT INTO `wp_postmeta` VALUES("409", "94", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("410", "94", "_wp_page_template", "template_sale_paper.php");
INSERT INTO `wp_postmeta` VALUES("420", "97", "_edit_lock", "1489620296:1");
INSERT INTO `wp_postmeta` VALUES("421", "97", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("422", "97", "_wp_page_template", "template_sale_single.php");
INSERT INTO `wp_postmeta` VALUES("423", "99", "_edit_lock", "1489676355:1");
INSERT INTO `wp_postmeta` VALUES("424", "99", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("425", "99", "_wp_page_template", "template_sale_roll.php");
INSERT INTO `wp_postmeta` VALUES("439", "104", "_edit_lock", "1494704036:1");
INSERT INTO `wp_postmeta` VALUES("440", "104", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("441", "104", "_wp_page_template", "template_sale_other.php");
INSERT INTO `wp_postmeta` VALUES("513", "128", "_wp_trash_meta_status", "draft");
INSERT INTO `wp_postmeta` VALUES("452", "111", "_edit_lock", "1494284284:1");
INSERT INTO `wp_postmeta` VALUES("453", "111", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("454", "112", "_edit_lock", "1494290281:1");
INSERT INTO `wp_postmeta` VALUES("455", "112", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("456", "112", "_wp_page_template", "template_create_client.php");
INSERT INTO `wp_postmeta` VALUES("457", "114", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("458", "114", "_menu_item_menu_item_parent", "21");
INSERT INTO `wp_postmeta` VALUES("459", "114", "_menu_item_object_id", "112");
INSERT INTO `wp_postmeta` VALUES("460", "114", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("461", "114", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("462", "114", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("463", "114", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("464", "114", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("466", "115", "_edit_lock", "1494283929:1");
INSERT INTO `wp_postmeta` VALUES("467", "115", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("468", "116", "_edit_lock", "1494615813:1");
INSERT INTO `wp_postmeta` VALUES("469", "116", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("470", "116", "_wp_page_template", "template_stock_customer.php");
INSERT INTO `wp_postmeta` VALUES("471", "118", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("472", "118", "_menu_item_menu_item_parent", "23");
INSERT INTO `wp_postmeta` VALUES("473", "118", "_menu_item_object_id", "116");
INSERT INTO `wp_postmeta` VALUES("474", "118", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("475", "118", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("476", "118", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("477", "118", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("478", "118", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("480", "115", "_wp_trash_meta_status", "draft");
INSERT INTO `wp_postmeta` VALUES("481", "115", "_wp_trash_meta_time", "1494284399");
INSERT INTO `wp_postmeta` VALUES("482", "115", "_wp_desired_post_slug", "");
INSERT INTO `wp_postmeta` VALUES("483", "111", "_wp_trash_meta_status", "draft");
INSERT INTO `wp_postmeta` VALUES("484", "111", "_wp_trash_meta_time", "1494284436");
INSERT INTO `wp_postmeta` VALUES("485", "111", "_wp_desired_post_slug", "");
INSERT INTO `wp_postmeta` VALUES("486", "122", "_edit_lock", "1494703839:1");
INSERT INTO `wp_postmeta` VALUES("487", "122", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("488", "122", "_wp_page_template", "template_customer_orders.php");
INSERT INTO `wp_postmeta` VALUES("489", "124", "_edit_lock", "1494699493:1");
INSERT INTO `wp_postmeta` VALUES("490", "124", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("491", "125", "_edit_lock", "1494703633:1");
INSERT INTO `wp_postmeta` VALUES("492", "125", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("493", "125", "_wp_page_template", "template_order_degt_statistic.php");
INSERT INTO `wp_postmeta` VALUES("494", "124", "_wp_trash_meta_status", "draft");
INSERT INTO `wp_postmeta` VALUES("495", "124", "_wp_trash_meta_time", "1494703784");
INSERT INTO `wp_postmeta` VALUES("496", "124", "_wp_desired_post_slug", "");
INSERT INTO `wp_postmeta` VALUES("497", "128", "_edit_lock", "1494704382:1");
INSERT INTO `wp_postmeta` VALUES("498", "128", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("499", "129", "_edit_lock", "1494704446:1");
INSERT INTO `wp_postmeta` VALUES("500", "129", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("501", "130", "_edit_lock", "1494963677:1");
INSERT INTO `wp_postmeta` VALUES("502", "130", "_edit_last", "1");
INSERT INTO `wp_postmeta` VALUES("503", "130", "_wp_page_template", "template_sale_product.php");
INSERT INTO `wp_postmeta` VALUES("504", "132", "_menu_item_type", "post_type");
INSERT INTO `wp_postmeta` VALUES("505", "132", "_menu_item_menu_item_parent", "28");
INSERT INTO `wp_postmeta` VALUES("506", "132", "_menu_item_object_id", "130");
INSERT INTO `wp_postmeta` VALUES("507", "132", "_menu_item_object", "page");
INSERT INTO `wp_postmeta` VALUES("508", "132", "_menu_item_target", "");
INSERT INTO `wp_postmeta` VALUES("509", "132", "_menu_item_classes", "a:1:{i:0;s:0:\"\";}");
INSERT INTO `wp_postmeta` VALUES("510", "132", "_menu_item_xfn", "");
INSERT INTO `wp_postmeta` VALUES("511", "132", "_menu_item_url", "");
INSERT INTO `wp_postmeta` VALUES("514", "128", "_wp_trash_meta_time", "1494963545");
INSERT INTO `wp_postmeta` VALUES("515", "128", "_wp_desired_post_slug", "");
INSERT INTO `wp_postmeta` VALUES("516", "129", "_wp_trash_meta_status", "draft");
INSERT INTO `wp_postmeta` VALUES("517", "129", "_wp_trash_meta_time", "1494963552");
INSERT INTO `wp_postmeta` VALUES("518", "129", "_wp_desired_post_slug", "");

/* INSERT TABLE DATA: wp_posts */
INSERT INTO `wp_posts` VALUES("1", "1", "2017-02-20 03:06:01", "2017-02-20 00:06:01", "Добро пожаловать в WordPress. Это ваша первая запись. Отредактируйте или удалите её, затем пишите!", "Привет, мир!", "", "publish", "open", "open", "", "%d0%bf%d1%80%d0%b8%d0%b2%d0%b5%d1%82-%d0%bc%d0%b8%d1%80", "", "", "2017-02-20 03:06:01", "2017-02-20 00:06:01", "", "0", "http://cf09127.tmweb.ru/?p=1", "0", "post", "", "1");
INSERT INTO `wp_posts` VALUES("46", "1", "2017-03-01 23:41:42", "2017-03-01 20:41:42", "", "All roll orders", "", "inherit", "closed", "closed", "", "45-revision-v1", "", "", "2017-03-01 23:41:42", "2017-03-01 20:41:42", "", "45", "http://cf09127.tmweb.ru/2017/03/01/45-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("47", "1", "2017-03-01 23:42:32", "2017-03-01 20:42:32", "", "Все (рулон)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d1%80%d1%83%d0%bb%d0%be%d0%bd", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=47", "15", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("45", "1", "2017-03-01 23:41:42", "2017-03-01 20:41:42", "", "All roll orders", "", "publish", "closed", "closed", "", "all-roll-orders", "", "", "2017-03-02 21:55:30", "2017-03-02 18:55:30", "", "0", "http://cf09127.tmweb.ru/?page_id=45", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("14", "1", "2017-02-20 03:13:28", "2017-02-20 00:13:28", "", "Склад Бумага", "", "publish", "closed", "closed", "", "stock-paper", "", "", "2017-03-06 00:58:52", "2017-03-05 21:58:52", "", "0", "http://cf09127.tmweb.ru/?page_id=14", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("15", "1", "2017-02-20 03:13:28", "2017-02-20 00:13:28", "", "Склад", "", "inherit", "closed", "closed", "", "14-revision-v1", "", "", "2017-02-20 03:13:28", "2017-02-20 00:13:28", "", "14", "http://cf09127.tmweb.ru/2017/02/20/14-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("16", "1", "2017-02-20 03:15:03", "2017-02-20 00:15:03", "", "Бумага", "", "publish", "closed", "closed", "", "16", "", "", "2017-05-13 22:42:37", "2017-05-13 19:42:37", "", "0", "http://cf09127.tmweb.ru/?p=16", "3", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("19", "1", "2017-02-20 17:36:02", "2017-02-20 14:36:02", "", "Создать Бумагу", "", "publish", "closed", "closed", "", "create_papar", "", "", "2017-02-21 01:15:11", "2017-02-20 22:15:11", "", "0", "http://cf09127.tmweb.ru/?page_id=19", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("20", "1", "2017-02-20 17:36:02", "2017-02-20 14:36:02", "", "Создать Бумагу", "", "inherit", "closed", "closed", "", "19-revision-v1", "", "", "2017-02-20 17:36:02", "2017-02-20 14:36:02", "", "19", "http://cf09127.tmweb.ru/2017/02/20/19-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("21", "1", "2017-02-20 17:36:41", "2017-02-20 14:36:41", "", "Создать", "", "publish", "closed", "closed", "", "%d1%81%d0%be%d0%b7%d0%b4%d0%b0%d1%82%d1%8c", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=21", "6", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("22", "1", "2017-02-20 17:36:41", "2017-02-20 14:36:41", "", "Бумагу", "", "publish", "closed", "closed", "", "%d0%b1%d1%83%d0%bc%d0%b0%d0%b3%d1%83", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=22", "8", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("23", "1", "2017-02-20 17:50:16", "2017-02-20 14:50:16", "", "Склад", "", "publish", "closed", "closed", "", "%d1%81%d0%ba%d0%bb%d0%b0%d0%b4", "", "", "2017-05-13 22:42:37", "2017-05-13 19:42:37", "", "0", "http://cf09127.tmweb.ru/?p=23", "1", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("26", "1", "2017-02-20 18:21:45", "2017-02-20 15:21:45", "", "Склад Изменить Бумага", "", "publish", "closed", "closed", "", "stock_edit", "", "", "2017-02-26 15:47:52", "2017-02-26 12:47:52", "", "0", "http://cf09127.tmweb.ru/?page_id=26", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("25", "1", "2017-02-20 18:19:55", "2017-02-20 15:19:55", "", "Склад Бумага", "", "inherit", "closed", "closed", "", "14-revision-v1", "", "", "2017-02-20 18:19:55", "2017-02-20 15:19:55", "", "14", "http://cf09127.tmweb.ru/2017/02/20/14-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("28", "1", "2017-02-24 18:27:57", "2017-02-24 15:27:57", "", "Заказы", "", "publish", "closed", "closed", "", "%d0%b7%d0%b0%d0%ba%d0%b0%d0%b7%d1%8b", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=28", "11", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("27", "1", "2017-02-20 18:21:45", "2017-02-20 15:21:45", "", "Склад Изменить Бумага", "", "inherit", "closed", "closed", "", "26-revision-v1", "", "", "2017-02-20 18:21:45", "2017-02-20 15:21:45", "", "26", "http://cf09127.tmweb.ru/2017/02/20/26-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("29", "1", "2017-02-24 18:29:19", "2017-02-24 15:29:19", "", "Новый заказ", "", "publish", "closed", "closed", "", "new-order", "", "", "2017-02-26 19:05:51", "2017-02-26 16:05:51", "", "0", "http://cf09127.tmweb.ru/?page_id=29", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("43", "1", "2017-02-26 19:06:24", "2017-02-26 16:06:24", " ", "", "", "publish", "closed", "closed", "", "43", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=43", "12", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("30", "1", "2017-02-24 18:29:19", "2017-02-24 15:29:19", "", "Новый заказ", "", "inherit", "closed", "closed", "", "29-revision-v1", "", "", "2017-02-24 18:29:19", "2017-02-24 15:29:19", "", "29", "http://cf09127.tmweb.ru/2017/02/24/29-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("32", "1", "2017-02-25 01:15:09", "2017-02-24 22:15:09", "", "Order paper", "", "publish", "closed", "closed", "", "order", "", "", "2017-02-26 19:07:05", "2017-02-26 16:07:05", "", "0", "http://cf09127.tmweb.ru/?page_id=32", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("33", "1", "2017-02-25 01:15:09", "2017-02-24 22:15:09", "", "Order handler", "", "inherit", "closed", "closed", "", "32-revision-v1", "", "", "2017-02-25 01:15:09", "2017-02-24 22:15:09", "", "32", "http://cf09127.tmweb.ru/2017/02/25/32-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("34", "1", "2017-02-26 15:49:48", "2017-02-26 12:49:48", "", "Order paper", "", "inherit", "closed", "closed", "", "32-revision-v1", "", "", "2017-02-26 15:49:48", "2017-02-26 12:49:48", "", "32", "http://cf09127.tmweb.ru/2017/02/26/32-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("62", "1", "2017-03-06 19:31:47", "2017-03-06 16:31:47", "", "Все(рулонные)", "", "publish", "closed", "closed", "", "62", "", "", "2017-03-06 19:34:07", "2017-03-06 16:34:07", "", "0", "http://cf09127.tmweb.ru/?p=62", "3", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("37", "1", "2017-02-26 15:50:57", "2017-02-26 12:50:57", "", "All paper orders", "", "publish", "closed", "closed", "", "all-paper-orders", "", "", "2017-02-26 15:50:57", "2017-02-26 12:50:57", "", "0", "http://cf09127.tmweb.ru/?page_id=37", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("38", "1", "2017-02-26 15:50:57", "2017-02-26 12:50:57", "", "All paper orders", "", "inherit", "closed", "closed", "", "37-revision-v1", "", "", "2017-02-26 15:50:57", "2017-02-26 12:50:57", "", "37", "http://cf09127.tmweb.ru/2017/02/26/37-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("39", "1", "2017-02-26 17:56:48", "2017-02-26 14:56:48", "", "Все (листовой)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d0%b1%d1%83%d0%bc%d0%b0%d0%b3%d0%b0", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=39", "14", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("40", "1", "2017-02-26 18:05:45", "2017-02-26 15:05:45", "", "Order single", "", "publish", "closed", "closed", "", "order-single", "", "", "2017-02-26 18:05:45", "2017-02-26 15:05:45", "", "0", "http://cf09127.tmweb.ru/?page_id=40", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("41", "1", "2017-02-26 18:05:45", "2017-02-26 15:05:45", "", "Order single", "", "inherit", "closed", "closed", "", "40-revision-v1", "", "", "2017-02-26 18:05:45", "2017-02-26 15:05:45", "", "40", "http://cf09127.tmweb.ru/2017/02/26/40-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("48", "1", "2017-03-02 23:00:39", "2017-03-02 20:00:39", "", "Создать Рулон", "", "publish", "closed", "closed", "", "create-roll", "", "", "2017-05-08 21:24:41", "2017-05-08 18:24:41", "", "0", "http://cf09127.tmweb.ru/?page_id=48", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("49", "1", "2017-03-02 23:00:39", "2017-03-02 20:00:39", "", "Создать Рулон", "", "inherit", "closed", "closed", "", "48-revision-v1", "", "", "2017-03-02 23:00:39", "2017-03-02 20:00:39", "", "48", "http://cf09127.tmweb.ru/2017/03/02/48-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("50", "1", "2017-03-02 23:02:22", "2017-03-02 20:02:22", "", "Рулон", "", "publish", "closed", "closed", "", "%d1%80%d1%83%d0%bb%d0%be%d0%bd", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=50", "9", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("51", "1", "2017-03-02 23:13:38", "2017-03-02 20:13:38", "", "Создать Остальное", "", "publish", "closed", "closed", "", "create-other", "", "", "2017-03-02 23:13:38", "2017-03-02 20:13:38", "", "0", "http://cf09127.tmweb.ru/?page_id=51", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("52", "1", "2017-03-02 23:13:38", "2017-03-02 20:13:38", "", "Создать Остальное", "", "inherit", "closed", "closed", "", "51-revision-v1", "", "", "2017-03-02 23:13:38", "2017-03-02 20:13:38", "", "51", "http://cf09127.tmweb.ru/2017/03/02/51-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("73", "1", "2017-03-12 00:02:36", "2017-03-11 21:02:36", "", "Все (рулон)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d1%80%d1%83%d0%bb%d0%be%d0%bd-2", "", "", "2017-03-12 00:02:36", "2017-03-11 21:02:36", "", "0", "http://cf09127.tmweb.ru/?p=73", "2", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("56", "1", "2017-03-02 23:32:13", "2017-03-02 20:32:13", "", "Склад Рулон", "", "publish", "closed", "closed", "", "stock-roll", "", "", "2017-03-06 00:57:31", "2017-03-05 21:57:31", "", "0", "http://cf09127.tmweb.ru/?page_id=56", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("54", "1", "2017-03-02 23:15:12", "2017-03-02 20:15:12", "", "Разное", "", "publish", "closed", "closed", "", "%d1%80%d0%b0%d0%b7%d0%bd%d0%be%d0%b5-2", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=54", "10", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("63", "1", "2017-03-06 19:31:47", "2017-03-06 16:31:47", "", "Все(листовые)", "", "publish", "closed", "closed", "", "63", "", "", "2017-03-06 19:34:07", "2017-03-06 16:34:07", "", "0", "http://cf09127.tmweb.ru/?p=63", "2", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("57", "1", "2017-03-02 23:32:13", "2017-03-02 20:32:13", "", "Склад Рулон", "", "inherit", "closed", "closed", "", "56-revision-v1", "", "", "2017-03-02 23:32:13", "2017-03-02 20:32:13", "", "56", "http://cf09127.tmweb.ru/2017/03/02/56-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("58", "1", "2017-03-02 23:32:26", "2017-03-02 20:32:26", "", "Рулон", "", "publish", "closed", "closed", "", "58", "", "", "2017-05-13 22:42:37", "2017-05-13 19:42:37", "", "0", "http://cf09127.tmweb.ru/?p=58", "4", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("59", "1", "2017-03-02 23:39:05", "2017-03-02 20:39:05", "", "Склад Разное", "", "publish", "closed", "closed", "", "stock-other", "", "", "2017-03-06 00:58:37", "2017-03-05 21:58:37", "", "0", "http://cf09127.tmweb.ru/?page_id=59", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("60", "1", "2017-03-02 23:39:05", "2017-03-02 20:39:05", "", "Склад Разное", "", "inherit", "closed", "closed", "", "59-revision-v1", "", "", "2017-03-02 23:39:05", "2017-03-02 20:39:05", "", "59", "http://cf09127.tmweb.ru/2017/03/02/59-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("61", "1", "2017-03-02 23:39:46", "2017-03-02 20:39:46", "", "Разное", "", "publish", "closed", "closed", "", "%d1%80%d0%b0%d0%b7%d0%bd%d0%be%d0%b5", "", "", "2017-05-13 22:42:37", "2017-05-13 19:42:37", "", "0", "http://cf09127.tmweb.ru/?p=61", "5", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("64", "1", "2017-03-06 19:31:47", "2017-03-06 16:31:47", " ", "", "", "publish", "closed", "closed", "", "64", "", "", "2017-03-06 19:34:07", "2017-03-06 16:34:07", "", "0", "http://cf09127.tmweb.ru/?p=64", "1", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("68", "1", "2017-03-06 19:52:38", "2017-03-06 16:52:38", "", "Разное", "", "publish", "closed", "closed", "", "%d1%80%d0%b0%d0%b7%d0%bd%d0%be%d0%b5-3", "", "", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "0", "http://cf09127.tmweb.ru/?p=68", "4", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("69", "1", "2017-03-06 19:52:38", "2017-03-06 16:52:38", "", "Рулон", "", "publish", "closed", "closed", "", "%d1%80%d1%83%d0%bb%d0%be%d0%bd-2", "", "", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "0", "http://cf09127.tmweb.ru/?p=69", "3", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("70", "1", "2017-03-06 19:52:38", "2017-03-06 16:52:38", "", "Бумага", "", "publish", "closed", "closed", "", "%d0%b1%d1%83%d0%bc%d0%b0%d0%b3%d0%b0", "", "", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "0", "http://cf09127.tmweb.ru/?p=70", "2", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("71", "1", "2017-03-06 19:52:38", "2017-03-06 16:52:38", "", "Склад", "", "publish", "closed", "closed", "", "%d1%81%d0%ba%d0%bb%d0%b0%d0%b4-2", "", "", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "0", "http://cf09127.tmweb.ru/?p=71", "1", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("74", "1", "2017-03-12 00:02:36", "2017-03-11 21:02:36", "", "Все (листовой)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d0%bb%d0%b8%d1%81%d1%82%d0%be%d0%b2%d0%be%d0%b9", "", "", "2017-03-12 00:02:36", "2017-03-11 21:02:36", "", "0", "http://cf09127.tmweb.ru/?p=74", "1", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("75", "1", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "Все (рулон)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d1%80%d1%83%d0%bb%d0%be%d0%bd-3", "", "", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "0", "http://cf09127.tmweb.ru/?p=75", "6", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("76", "1", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "Все (листовой)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d0%bb%d0%b8%d1%81%d1%82%d0%be%d0%b2%d0%be%d0%b9-2", "", "", "2017-03-12 00:04:05", "2017-03-11 21:04:05", "", "0", "http://cf09127.tmweb.ru/?p=76", "5", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("77", "1", "2017-03-12 00:05:30", "2017-03-11 21:05:30", "", "Все (рулон)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d1%80%d1%83%d0%bb%d0%be%d0%bd-4", "", "", "2017-03-12 00:05:30", "2017-03-11 21:05:30", "", "0", "http://cf09127.tmweb.ru/?p=77", "2", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("78", "1", "2017-03-12 00:05:30", "2017-03-11 21:05:30", "", "Все (листовой)", "", "publish", "closed", "closed", "", "%d0%b2%d1%81%d0%b5-%d0%bb%d0%b8%d1%81%d1%82%d0%be%d0%b2%d0%be%d0%b9-3", "", "", "2017-03-12 00:05:30", "2017-03-11 21:05:30", "", "0", "http://cf09127.tmweb.ru/?p=78", "1", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("80", "1", "2017-03-15 02:20:11", "2017-03-14 23:20:11", "", "Листовой", "", "publish", "closed", "closed", "", "%d0%bb%d0%b8%d1%81%d1%82%d0%be%d0%b2%d0%be%d0%b9", "", "", "2017-03-15 02:20:11", "2017-03-14 23:20:11", "", "0", "http://cf09127.tmweb.ru/?page_id=80", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("81", "1", "2017-03-15 02:20:11", "2017-03-14 23:20:11", "", "Листовой", "", "inherit", "closed", "closed", "", "80-revision-v1", "", "", "2017-03-15 02:20:11", "2017-03-14 23:20:11", "", "80", "http://cf09127.tmweb.ru/2017/03/15/80-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("82", "1", "2017-03-15 02:21:05", "2017-03-14 23:21:05", "", "Рулон", "", "publish", "closed", "closed", "", "%d1%80%d1%83%d0%bb%d0%be%d0%bd", "", "", "2017-03-15 02:21:05", "2017-03-14 23:21:05", "", "0", "http://cf09127.tmweb.ru/?page_id=82", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("83", "1", "2017-03-15 02:21:05", "2017-03-14 23:21:05", "", "Рулон", "", "inherit", "closed", "closed", "", "82-revision-v1", "", "", "2017-03-15 02:21:05", "2017-03-14 23:21:05", "", "82", "http://cf09127.tmweb.ru/2017/03/15/82-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("84", "1", "2017-03-15 02:22:30", "2017-03-14 23:22:30", "", "Финансовый отчет", "", "publish", "closed", "closed", "", "%d1%84%d0%b8%d0%bd%d0%b0%d0%bd%d1%81%d0%be%d0%b2%d1%8b%d0%b9-%d0%be%d1%82%d1%87%d0%b5%d1%82", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=84", "16", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("85", "1", "2017-03-15 02:22:30", "2017-03-14 23:22:30", " ", "", "", "publish", "closed", "closed", "", "85", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=85", "18", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("86", "1", "2017-03-15 02:22:30", "2017-03-14 23:22:30", " ", "", "", "publish", "closed", "closed", "", "86", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://cf09127.tmweb.ru/?p=86", "17", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("88", "1", "2017-03-15 18:16:14", "2017-03-15 15:16:14", "", "Продажа", "", "publish", "closed", "closed", "", "sale", "", "", "2017-03-15 22:51:36", "2017-03-15 19:51:36", "", "0", "http://cf09127.tmweb.ru/?page_id=88", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("89", "1", "2017-03-15 18:16:14", "2017-03-15 15:16:14", "", "Продажа", "", "inherit", "closed", "closed", "", "88-revision-v1", "", "", "2017-03-15 18:16:14", "2017-03-15 15:16:14", "", "88", "http://cf09127.tmweb.ru/2017/03/15/88-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("92", "1", "2017-03-15 22:53:23", "2017-03-15 19:53:23", "", "create-sale", "", "publish", "closed", "closed", "", "create-sale", "", "", "2017-03-15 22:53:23", "2017-03-15 19:53:23", "", "0", "http://cf09127.tmweb.ru/?page_id=92", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("93", "1", "2017-03-15 22:53:23", "2017-03-15 19:53:23", "", "create-sale", "", "inherit", "closed", "closed", "", "92-revision-v1", "", "", "2017-03-15 22:53:23", "2017-03-15 19:53:23", "", "92", "http://cf09127.tmweb.ru/2017/03/15/92-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("94", "1", "2017-03-16 02:14:04", "2017-03-15 23:14:04", "", "Продажи бумага", "", "publish", "closed", "closed", "", "sale-all-paper", "", "", "2017-03-16 02:14:04", "2017-03-15 23:14:04", "", "0", "http://cf09127.tmweb.ru/?page_id=94", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("95", "1", "2017-03-16 02:14:04", "2017-03-15 23:14:04", "", "Продажи бумага", "", "inherit", "closed", "closed", "", "94-revision-v1", "", "", "2017-03-16 02:14:04", "2017-03-15 23:14:04", "", "94", "http://cf09127.tmweb.ru/2017/03/16/94-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("97", "1", "2017-03-16 02:27:18", "2017-03-15 23:27:18", "", "Sale single", "", "publish", "closed", "closed", "", "sale-single", "", "", "2017-03-16 02:27:18", "2017-03-15 23:27:18", "", "0", "http://cf09127.tmweb.ru/?page_id=97", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("98", "1", "2017-03-16 02:27:18", "2017-03-15 23:27:18", "", "Sale single", "", "inherit", "closed", "closed", "", "97-revision-v1", "", "", "2017-03-16 02:27:18", "2017-03-15 23:27:18", "", "97", "http://cf09127.tmweb.ru/2017/03/16/97-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("99", "1", "2017-03-16 15:49:01", "2017-03-16 12:49:01", "", "Sale roll", "", "publish", "closed", "closed", "", "sale-all-roll", "", "", "2017-03-16 18:01:37", "2017-03-16 15:01:37", "", "0", "http://cf09127.tmweb.ru/?page_id=99", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("100", "1", "2017-03-16 15:49:01", "2017-03-16 12:49:01", "", "Order roll", "", "inherit", "closed", "closed", "", "99-revision-v1", "", "", "2017-03-16 15:49:01", "2017-03-16 12:49:01", "", "99", "http://cf09127.tmweb.ru/2017/03/16/99-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("104", "1", "2017-03-16 18:02:17", "2017-03-16 15:02:17", "", "Sale other", "", "publish", "closed", "closed", "", "sale-all-other", "", "", "2017-03-16 18:02:17", "2017-03-16 15:02:17", "", "0", "http://cf09127.tmweb.ru/?page_id=104", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("105", "1", "2017-03-16 18:01:37", "2017-03-16 15:01:37", "", "Sale roll", "", "inherit", "closed", "closed", "", "99-revision-v1", "", "", "2017-03-16 18:01:37", "2017-03-16 15:01:37", "", "99", "http://cf09127.tmweb.ru/2017/03/16/99-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("106", "1", "2017-03-16 18:02:17", "2017-03-16 15:02:17", "", "Sale other", "", "inherit", "closed", "closed", "", "104-revision-v1", "", "", "2017-03-16 18:02:17", "2017-03-16 15:02:17", "", "104", "http://cf09127.tmweb.ru/2017/03/16/104-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("133", "1", "2017-05-16 22:39:05", "2017-05-16 19:39:05", "", "Sale Product", "", "inherit", "closed", "closed", "", "128-revision-v1", "", "", "2017-05-16 22:39:05", "2017-05-16 19:39:05", "", "128", "http://localhost/2017/05/16/128-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("111", "1", "2017-05-08 21:22:24", "2017-05-08 18:22:24", "", "Создать Клиента", "", "trash", "closed", "closed", "", "__trashed-2", "", "", "2017-05-09 02:00:36", "2017-05-08 23:00:36", "", "0", "http://localhost/?page_id=111", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("112", "1", "2017-05-08 21:24:46", "2017-05-08 18:24:46", "", "Создать Клиента", "", "publish", "closed", "closed", "", "create-customer", "", "", "2017-05-09 02:01:06", "2017-05-08 23:01:06", "", "0", "http://localhost/?page_id=112", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("113", "1", "2017-05-08 21:24:46", "2017-05-08 18:24:46", "", "Создать Клиента", "", "inherit", "closed", "closed", "", "112-revision-v1", "", "", "2017-05-08 21:24:46", "2017-05-08 18:24:46", "", "112", "http://localhost/2017/05/08/112-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("114", "1", "2017-05-08 21:27:35", "2017-05-08 18:27:35", "", "Клиента", "", "publish", "closed", "closed", "", "%d0%ba%d0%bb%d0%b8%d0%b5%d0%bd%d1%82%d0%b0", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://localhost/?p=114", "7", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("115", "1", "2017-05-09 01:51:24", "2017-05-08 22:51:24", "", "Клиент", "", "trash", "closed", "closed", "", "__trashed", "", "", "2017-05-09 01:59:59", "2017-05-08 22:59:59", "", "0", "http://localhost/?page_id=115", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("116", "1", "2017-05-09 01:53:18", "2017-05-08 22:53:18", "", "Клиент", "", "publish", "closed", "closed", "", "stock-customer", "", "", "2017-05-09 01:53:18", "2017-05-08 22:53:18", "", "0", "http://localhost/?page_id=116", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("117", "1", "2017-05-09 01:53:18", "2017-05-08 22:53:18", "", "Клиент", "", "inherit", "closed", "closed", "", "116-revision-v1", "", "", "2017-05-09 01:53:18", "2017-05-08 22:53:18", "", "116", "http://localhost/2017/05/09/116-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("118", "1", "2017-05-09 01:54:02", "2017-05-08 22:54:02", " ", "", "", "publish", "closed", "closed", "", "118", "", "", "2017-05-13 22:42:37", "2017-05-13 19:42:37", "", "0", "http://localhost/?p=118", "2", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("119", "1", "2017-05-09 01:59:59", "2017-05-08 22:59:59", "", "Клиент", "", "inherit", "closed", "closed", "", "115-revision-v1", "", "", "2017-05-09 01:59:59", "2017-05-08 22:59:59", "", "115", "http://localhost/2017/05/09/115-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("120", "1", "2017-05-09 02:00:36", "2017-05-08 23:00:36", "", "Создать Клиента", "", "inherit", "closed", "closed", "", "111-revision-v1", "", "", "2017-05-09 02:00:36", "2017-05-08 23:00:36", "", "111", "http://localhost/2017/05/09/111-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("122", "1", "2017-05-13 18:36:21", "2017-05-13 15:36:21", "", "Customer orders", "", "publish", "closed", "closed", "", "customer-orders", "", "", "2017-05-13 18:41:41", "2017-05-13 15:41:41", "", "0", "http://localhost/?page_id=122", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("123", "1", "2017-05-13 18:36:21", "2017-05-13 15:36:21", "", "Customer orders", "", "inherit", "closed", "closed", "", "122-revision-v1", "", "", "2017-05-13 18:36:21", "2017-05-13 15:36:21", "", "122", "http://localhost/2017/05/13/122-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("124", "1", "2017-05-13 21:16:21", "2017-05-13 18:16:21", "", "Degt", "", "trash", "closed", "closed", "", "__trashed-3", "", "", "2017-05-13 22:29:44", "2017-05-13 19:29:44", "", "0", "http://localhost/?page_id=124", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("125", "1", "2017-05-13 21:18:46", "2017-05-13 18:18:46", "", "Degt Statistic", "", "publish", "closed", "closed", "", "degt-statistic", "", "", "2017-05-13 21:18:46", "2017-05-13 18:18:46", "", "0", "http://localhost/?page_id=125", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("126", "1", "2017-05-13 21:18:46", "2017-05-13 18:18:46", "", "Degt Statistic", "", "inherit", "closed", "closed", "", "125-revision-v1", "", "", "2017-05-13 21:18:46", "2017-05-13 18:18:46", "", "125", "http://localhost/2017/05/13/125-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("127", "1", "2017-05-13 22:29:44", "2017-05-13 19:29:44", "", "Degt", "", "inherit", "closed", "closed", "", "124-revision-v1", "", "", "2017-05-13 22:29:44", "2017-05-13 19:29:44", "", "124", "http://localhost/2017/05/13/124-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("128", "1", "2017-05-13 22:39:27", "2017-05-13 19:39:27", "", "Sale Product", "", "trash", "closed", "closed", "", "__trashed-4", "", "", "2017-05-16 22:39:05", "2017-05-16 19:39:05", "", "0", "http://localhost/?page_id=128", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("129", "1", "2017-05-13 22:39:57", "2017-05-13 19:39:57", "", "Sale product", "", "trash", "closed", "closed", "", "__trashed-5", "", "", "2017-05-16 22:39:12", "2017-05-16 19:39:12", "", "0", "http://localhost/?page_id=129", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("130", "1", "2017-05-13 22:41:16", "2017-05-13 19:41:16", "", "Sale Product", "", "publish", "closed", "closed", "", "sale-product", "", "", "2017-05-13 22:41:16", "2017-05-13 19:41:16", "", "0", "http://localhost/?page_id=130", "0", "page", "", "0");
INSERT INTO `wp_posts` VALUES("131", "1", "2017-05-13 22:41:16", "2017-05-13 19:41:16", "", "Sale Product", "", "inherit", "closed", "closed", "", "130-revision-v1", "", "", "2017-05-13 22:41:16", "2017-05-13 19:41:16", "", "130", "http://localhost/2017/05/13/130-revision-v1/", "0", "revision", "", "0");
INSERT INTO `wp_posts` VALUES("132", "1", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "Продажа", "", "publish", "closed", "closed", "", "%d0%bf%d1%80%d0%be%d0%b4%d0%b0%d0%b6%d0%b0", "", "", "2017-05-13 22:42:38", "2017-05-13 19:42:38", "", "0", "http://localhost/?p=132", "13", "nav_menu_item", "", "0");
INSERT INTO `wp_posts` VALUES("134", "1", "2017-05-16 22:39:12", "2017-05-16 19:39:12", "", "Sale product", "", "inherit", "closed", "closed", "", "129-revision-v1", "", "", "2017-05-16 22:39:12", "2017-05-16 19:39:12", "", "129", "http://localhost/2017/05/16/129-revision-v1/", "0", "revision", "", "0");

/* INSERT TABLE DATA: wp_product_other */
INSERT INTO `wp_product_other` VALUES("10", "Huber Resista ( Yellow)", "Краска", "150", "2860", "0");
INSERT INTO `wp_product_other` VALUES("9", "Huber  Resista (Red)", "Краска", "95", "2860", "0");
INSERT INTO `wp_product_other` VALUES("8", "Huber ( white)", "Краска", "104", "7200", "0");
INSERT INTO `wp_product_other` VALUES("23", "745x605", "Форма", "9415", "1000", "5");
INSERT INTO `wp_product_other` VALUES("11", "Huber Resista ( Black)", "Краска", "135", "2860", "0");
INSERT INTO `wp_product_other` VALUES("12", "Huber Resista ( Blue )", "Краска", "123", "2860", "0");
INSERT INTO `wp_product_other` VALUES("13", "Huber Intense ( Yellow ) ", "Краска", "20", "0", "0");
INSERT INTO `wp_product_other` VALUES("14", "Huber Intense ( Black )", "Краска", "53", "0", "0");
INSERT INTO `wp_product_other` VALUES("15", "Huber Intense ( Red )", "Краска", "23", "0", "0");
INSERT INTO `wp_product_other` VALUES("16", "Huber Intense ( Blue )", "Краска", "30", "0", "0");
INSERT INTO `wp_product_other` VALUES("17", "Huber Foil ( Blue )", "Краска", "10", "0", "0");
INSERT INTO `wp_product_other` VALUES("18", "Huber Foil ( Yellow )", "Краска", "9", "0", "0");
INSERT INTO `wp_product_other` VALUES("19", "Flint Novaplast ( White )", "Краска", "10", "6400", "0");
INSERT INTO `wp_product_other` VALUES("20", "Flint Novaplast ( Reflex blue )", "Краска", "52", "8850", "0");
INSERT INTO `wp_product_other` VALUES("21", "Hostman ( Reflex blue ) ", "Краска", "14", "0", "0");
INSERT INTO `wp_product_other` VALUES("22", "Hostman ( Black Foil )", "Краска", "3", "0", "0");
INSERT INTO `wp_product_other` VALUES("24", "377х342", "Форма", "1862", "1400", "0");
INSERT INTO `wp_product_other` VALUES("26", "Vanson Foil ( Red )", "Краска", "350", "0", "0");
INSERT INTO `wp_product_other` VALUES("27", "Vanson Foil ( White)", "Краска", "8", "0", "0");
INSERT INTO `wp_product_other` VALUES("28", "Vanson  ( Cyan )", "Краска", "80", "0", "0");
INSERT INTO `wp_product_other` VALUES("29", "Vanson ( Gold )", "Краска", "94", "0", "0");
INSERT INTO `wp_product_other` VALUES("30", "Vanson Foil ( Black )", "Краска", "183", "0", "0");
INSERT INTO `wp_product_other` VALUES("31", "Vanson Foil ( Cyan )", "Краска", "251", "0", "0");
INSERT INTO `wp_product_other` VALUES("32", "Vanson ( Silver )", "Краска", "4", "0", "0");
INSERT INTO `wp_product_other` VALUES("33", "Vanson Foil ( Yellow )", "Краска", "333", "0", "0");
INSERT INTO `wp_product_other` VALUES("34", "Vegra ", "Лак", "635", "0", "0");
INSERT INTO `wp_product_other` VALUES("35", "Vegra UV ", "Лак", "290", "0", "0");
INSERT INTO `wp_product_other` VALUES("36", "Roland 204", "Резина", "65", "0", "0");
INSERT INTO `wp_product_other` VALUES("37", "Roland 305 ( Lack )", "Резина", "2", "0", "0");
INSERT INTO `wp_product_other` VALUES("38", "Roland 305 ( планка)", "Резина", "16", "25500", "0");
INSERT INTO `wp_product_other` VALUES("39", "УФ лак ", "Лак", "251", "3233", "0");
INSERT INTO `wp_product_other` VALUES("49", "Classic Colours ( Reflex Blue )", "Краска", "52", "19000", "0");
INSERT INTO `wp_product_other` VALUES("41", "Classic Colours ( Yellow )", "Краска", "23", "19000", "0");
INSERT INTO `wp_product_other` VALUES("42", "Classic Colours ( Black )", "Краска", "33", "19000", "0");
INSERT INTO `wp_product_other` VALUES("43", "Classic Colours ( Magenta )", "Краска", "23", "19000", "0");
INSERT INTO `wp_product_other` VALUES("44", "Classic Colours ( Cyan )", "Краска", "30", "19000", "0");
INSERT INTO `wp_product_other` VALUES("45", "Classic Colours ( White )", "Краска", "45", "19000", "0");
INSERT INTO `wp_product_other` VALUES("46", "Classic Colours ( Rich pasta )", "Краска", "3", "0", "0");
INSERT INTO `wp_product_other` VALUES("47", "Classic Colours ( Rich varnish )", "Краска", "3", "0", "0");
INSERT INTO `wp_product_other` VALUES("48", "Classic Colours ( Silver )", "Краска", "5", "23000", "0");
INSERT INTO `wp_product_other` VALUES("50", "Sun Chemicals ( Cyan )", "Краска", "3", "0", "0");
INSERT INTO `wp_product_other` VALUES("51", "Dispersion Lack", "Лак", "377", "830", "0");
INSERT INTO `wp_product_other` VALUES("56", "64x240 gold", "Фольга", "2918.4", "76", "0");
INSERT INTO `wp_product_other` VALUES("57", "Kurz Red", "Фольга", "0", "390", "0");
INSERT INTO `wp_product_other` VALUES("58", "Kurz Gold", "Фольга", "0", "390", "0");
INSERT INTO `wp_product_other` VALUES("59", "Kurz Rose", "Фольга", "0", "390", "0");
INSERT INTO `wp_product_other` VALUES("60", "Kurz Green", "Фольга", "0", "390", "0");
INSERT INTO `wp_product_other` VALUES("61", "Kurz Silver", "Фольга", "0", "104", "0");
INSERT INTO `wp_product_other` VALUES("62", "T&K Cyan ", "Краска", "238", "13300", "0");
INSERT INTO `wp_product_other` VALUES("63", "T&K Magenta", "Краска", "236", "13300", "0");
INSERT INTO `wp_product_other` VALUES("64", "T&K Yellow", "Краска", "226", "13300", "0");
INSERT INTO `wp_product_other` VALUES("65", "T&K Black", "Краска", "251", "13300", "0");
INSERT INTO `wp_product_other` VALUES("66", "T&K White", "Краска", "223.5", "13300", "0");
INSERT INTO `wp_product_other` VALUES("68", "Kurz Gold 35x240", "Фольга", "8400", "110", "0");
INSERT INTO `wp_product_other` VALUES("69", "Gold 64x120", "Фольга", "4147.2", "76", "0");

/* INSERT TABLE DATA: wp_product_paper */
INSERT INTO `wp_product_paper` VALUES("1", "FB", "APP", "270", "FB", "70", "100", "0.189", "12072", "2281.61", "91", "0", "");
INSERT INTO `wp_product_paper` VALUES("2", "FB", "APP", "235", "FB", "70", "100", "0.1645", "157350", "25884.1", "79", "0", "");
INSERT INTO `wp_product_paper` VALUES("3", "FB", "APP", "210", "FB", "70", "100", "0.147", "82850", "12179", "71", "0", "");
INSERT INTO `wp_product_paper` VALUES("4", "FB", "APP", "270", "FB", "60", "100", "0.162", "51964", "8418.17", "78", "0", "");
INSERT INTO `wp_product_paper` VALUES("5", "FB", "APP", "300", "FB", "70", "100", "0.21", "7250", "1522.5", "101", "0", "");
INSERT INTO `wp_product_paper` VALUES("7", "Gloss", "Korea", "200", "Gloss", "64", "90", "0.1152", "3312.5", "381.6", "57", "0", "");
INSERT INTO `wp_product_paper` VALUES("8", "Gloss", "Korea", "170", "Gloss", "64", "90", "0.09792", "164600", "16117.6", "49", "0", "");
INSERT INTO `wp_product_paper` VALUES("9", "Gloss", "Korea", "135", "Gloss", "64", "90", "0.07776", "10768", "837.32", "39", "0", "");
INSERT INTO `wp_product_paper` VALUES("10", "Gloss", "Korea", "130", "Gloss", "64", "90", "0.07488", "14604", "1093.55", "37", "0", "");
INSERT INTO `wp_product_paper` VALUES("13", "Gloss", "Korea", "250", "Gloss", "70", "100", "0.175", "44025", "7704.38", "87", "0", "");
INSERT INTO `wp_product_paper` VALUES("14", "Gloss", "Korea", "90", "Gloss", "70", "100", "0.063", "269250", "16962.8", "31", "0", "");
INSERT INTO `wp_product_paper` VALUES("15", "Gloss", "Korea", "300", "Gloss", "70", "100", "0.21", "39125", "8216.25", "105", "0", "");
INSERT INTO `wp_product_paper` VALUES("31", "Sticker Adestor (slited)", "Adestor", "180", "Sticker Slitted", "70", "100", "0.1316", "84800", "11159.7", "140", "0", "");
INSERT INTO `wp_product_paper` VALUES("32", "Sticker Adestor (not slited)", "Adestor", "180", "not slited", "70", "100", "0.1316", "29200", "3842.72", "140", "0", "");
INSERT INTO `wp_product_paper` VALUES("33", "Sticker UPM", "UPM", "180", "sticker", "70", "100", "0.1288", "11561", "1489.06", "190", "0", "");
INSERT INTO `wp_product_paper` VALUES("18", "Lion", "Zanders", "70", "Lion", "70", "100", "0.049", "493013", "24157.6", "34", "0", "");
INSERT INTO `wp_product_paper` VALUES("19", "Xromolux", "Zanders", "80", "Xromolux", "70", "100", "0.056", "72000", "4032", "43", "0", "");
INSERT INTO `wp_product_paper` VALUES("21", "Gloss", "Korea", "115", "Gloss", "64", "90", "0.06624", "-475", "-31.464", "33", "0", "");
INSERT INTO `wp_product_paper` VALUES("22", "Matalised", "Galileo", "71", "Metalised", "70", "100", "0.0497", "243416", "12097.8", "72", "0", "");
INSERT INTO `wp_product_paper` VALUES("24", "Metalised FB", "Galileo", "223", "Metalised FB", "70", "100", "0.1561", "0", "0", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("34", "Metalised Галаграма", "ARM", "68", "Metalised", "70", "100", "0.0476", "14000", "666.4", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("29", "Lable", "Korea", "80", "Lable", "64", "90", "0.04608", "14250", "656.64", "667", "0", "");
INSERT INTO `wp_product_paper` VALUES("35", "Metalised", "ARM", "68", "Metlised", "740", "970", "0.0488104", "118300", "5774.27", "34", "0", "");
INSERT INTO `wp_product_paper` VALUES("38", "Metalised Гладкий", "Galileo", "71", "Metalised", "70", "100", "0.0497", "18475", "918.208", "72", "0", "");
INSERT INTO `wp_product_paper` VALUES("37", "Metalised", "ARM", "68", "Metalised", "699", "982", "0.0466764", "23000", "1073.56", "33", "0", "");
INSERT INTO `wp_product_paper` VALUES("39", "Metalised", "Galileo", "71", "Metalised", "51", "70", "0.025347", "65600", "1662.76", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("42", "Lable silk", "", "80", "Lable", "70", "100", "0.056", "6000", "336", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("41", "Metalised", "Galileo", "71", "Metalised", "51", "32", "0.0115872", "24400", "282.728", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("43", "Lable", "", "80", "Lable", "70", "100", "0.056", "2000", "112", "667", "0", "");
INSERT INTO `wp_product_paper` VALUES("44", "Ofset", "", "80", "Ofset", "70", "100", "0.056", "3500", "196", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("45", "Ofset", "", "60", "Ofset", "70", "100", "0.042", "1000", "42", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("46", "Ofset", "", "65", "Ofset", "70", "100", "0.0455", "2000", "91", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("47", "Ofset", "", "0", "Ofset", "60", "84", "0", "1000", "0", "0", "0", "");
INSERT INTO `wp_product_paper` VALUES("50", "Silk", "SAPI", "115", "silk", "64", "90", "0.06624", "72579", "4807.63", "33", "0", "");
INSERT INTO `wp_product_paper` VALUES("49", "Silk", "Sapi", "130", "silk", "64", "90", "0.07488", "144379", "10811.1", "37", "0", "");
INSERT INTO `wp_product_paper` VALUES("51", "Metalised", "Galileo", "71", "Metalised", "38", "51", "0.0137598", "0", "0", "20", "0", "");
INSERT INTO `wp_product_paper` VALUES("52", "Silk", "Sapi", "170", "Silk", "64", "45", "0.04896", "0", "0", "25", "0", "");
INSERT INTO `wp_product_paper` VALUES("53", "Gloss", "X", "115", "Gloss", "70", "100", "0.0805", "325", "26.1625", "52", "0", "");
INSERT INTO `wp_product_paper` VALUES("54", "Gloss", "X", "130", "Gloss", "70", "100", "0.091", "88", "8.008", "59", "0", "");
INSERT INTO `wp_product_paper` VALUES("55", "Lable", "APST", "80", "Lable", "70", "100", "0.056", "1250", "70", "667", "0", "");

/* INSERT TABLE DATA: wp_product_roll */
INSERT INTO `wp_product_roll` VALUES("1", "Honey Glassine", "UPM", "Sticker", "2000", "0.33", "16500", "200", "0");
INSERT INTO `wp_product_roll` VALUES("8", "Honey Glassine", "UPM", "Sticker", "2000", "0.18", "3240", "200", "0");
INSERT INTO `wp_product_roll` VALUES("3", "Honey Glassine", "UPM", "Sticker", "2000", "0.25", "11865", "200", "0");
INSERT INTO `wp_product_roll` VALUES("4", "Honey Glassine", "UPM", "Sticker", "2000", "0.165", "2970", "200", "0");
INSERT INTO `wp_product_roll` VALUES("5", "Honey Glassine", "UPM", "Sticker", "2000", "0.15", "2400", "200", "0");
INSERT INTO `wp_product_roll` VALUES("6", "Honey Glassine", "UPM", "Sticker", "2000", "0", "1200", "200", "0");
INSERT INTO `wp_product_roll` VALUES("9", "Metalised", "UPM", "Sticker", "2000", "0.33", "11800", "354", "0");
INSERT INTO `wp_product_roll` VALUES("10", "2/side metalised", "UPM", "Sticker", "2000", "0.33", "19800", "0", "0");
INSERT INTO `wp_product_roll` VALUES("11", "Rohmboid Pearl", "UPM", "Sticker", "2200", "0.22", "484", "882", "0");
INSERT INTO `wp_product_roll` VALUES("12", "Rohmboid Pearl", "UPM", "Sticker", "2200", "0.19", "836", "882", "0");
INSERT INTO `wp_product_roll` VALUES("13", "Rohmboid Pearl", "UPM", "Sticker", "2200", "0.17", "374", "882", "0");
INSERT INTO `wp_product_roll` VALUES("14", "Rohmboid Pearl", "UPM", "Sticker", "2200", "0.165", "363", "882", "0");
INSERT INTO `wp_product_roll` VALUES("15", "Rohmboid Pearl", "UPM", "Sticker", "2200", "0.15", "660", "882", "0");
INSERT INTO `wp_product_roll` VALUES("16", "Fluer de cotton", "UPM", "Sticker", "2030", "0.27", "2192.4", "512", "0");
INSERT INTO `wp_product_roll` VALUES("17", "Fluer de cotton", "UPM", "Sticker", "1000", "0.29", "725", "512", "0");
INSERT INTO `wp_product_roll` VALUES("18", "Fluer de cotton", "UPM", "Sticker", "1000", "0.21", "630", "512", "0");
INSERT INTO `wp_product_roll` VALUES("22", "Welmart", "UPM", "Sticker", "1000", "0.235", "705", "401", "0");
INSERT INTO `wp_product_roll` VALUES("20", "Fluer de cotton ICE", "UPM", "Sticker ( ICE )", "1000", "0.27", "810", "0", "0");
INSERT INTO `wp_product_roll` VALUES("21", "Fluer de cotton", "UPM", "Sticker ( ICE )", "1000", "0.19", "190", "512", "0");
INSERT INTO `wp_product_roll` VALUES("23", "Welmart", "UPM", "Sticker", "1000", "0.2", "200", "401", "0");
INSERT INTO `wp_product_roll` VALUES("24", "Welmart", "UPM", "Sticker", "1000", "0.165", "495", "401", "0");
INSERT INTO `wp_product_roll` VALUES("31", "Galileo Sticker", "Galileo", "Sticker", "2000", "0.2", "3000", "203", "0");
INSERT INTO `wp_product_roll` VALUES("26", "Թափանցիկ ", "UPM", "sticker", "2000", "0.33", "40260", "300", "0");
INSERT INTO `wp_product_roll` VALUES("27", "Թափանցիկ ", "UPM", "sticker", "2000", "0.21", "39900", "300", "0");
INSERT INTO `wp_product_roll` VALUES("29", "Super (թափանցիկ)", "UPM", "Sticker", "2000", "0.3", "21000", "330", "0");
INSERT INTO `wp_product_roll` VALUES("30", "Fluer de cotton", "UPM", "Sticker", "2000", "0.19", "0", "512", "0");

/* INSERT TABLE DATA: wp_sale_other */
INSERT INTO `wp_sale_other` VALUES("1", "0000-00-00", "4", "2", "4", "2", "1", "3", "0", "0", "0", "0", "Оформлен");
INSERT INTO `wp_sale_other` VALUES("2", "0000-00-00", "12", "5", "10", "2", "10", "3", "0", "0", "0", "0", "Оформлен");

/* INSERT TABLE DATA: wp_sale_paper */
INSERT INTO `wp_sale_paper` VALUES("21", "0000-00-00", "4", "12", "");

/* INSERT TABLE DATA: wp_sale_roll */
INSERT INTO `wp_sale_roll` VALUES("1", "2017-03-16", "9", "12", "");
INSERT INTO `wp_sale_roll` VALUES("2", "2017-03-14", "12", "14", "Вышел со склада");
INSERT INTO `wp_sale_roll` VALUES("3", "2017-03-14", "12", "14", "Вышел со склада");

/* INSERT TABLE DATA: wp_term_relationships */
INSERT INTO `wp_term_relationships` VALUES("1", "1", "0");
INSERT INTO `wp_term_relationships` VALUES("16", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("21", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("22", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("23", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("28", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("47", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("39", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("43", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("50", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("58", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("54", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("61", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("62", "6", "0");
INSERT INTO `wp_term_relationships` VALUES("63", "6", "0");
INSERT INTO `wp_term_relationships` VALUES("64", "6", "0");
INSERT INTO `wp_term_relationships` VALUES("71", "3", "0");
INSERT INTO `wp_term_relationships` VALUES("70", "3", "0");
INSERT INTO `wp_term_relationships` VALUES("69", "3", "0");
INSERT INTO `wp_term_relationships` VALUES("68", "3", "0");
INSERT INTO `wp_term_relationships` VALUES("74", "5", "0");
INSERT INTO `wp_term_relationships` VALUES("73", "5", "0");
INSERT INTO `wp_term_relationships` VALUES("76", "3", "0");
INSERT INTO `wp_term_relationships` VALUES("75", "3", "0");
INSERT INTO `wp_term_relationships` VALUES("78", "4", "0");
INSERT INTO `wp_term_relationships` VALUES("77", "4", "0");
INSERT INTO `wp_term_relationships` VALUES("84", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("86", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("85", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("114", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("118", "2", "0");
INSERT INTO `wp_term_relationships` VALUES("132", "2", "0");

/* INSERT TABLE DATA: wp_term_taxonomy */
INSERT INTO `wp_term_taxonomy` VALUES("1", "1", "category", "", "0", "1");
INSERT INTO `wp_term_taxonomy` VALUES("2", "2", "nav_menu", "", "0", "18");
INSERT INTO `wp_term_taxonomy` VALUES("3", "3", "nav_menu", "", "0", "6");
INSERT INTO `wp_term_taxonomy` VALUES("4", "4", "nav_menu", "", "0", "2");
INSERT INTO `wp_term_taxonomy` VALUES("5", "5", "nav_menu", "", "0", "2");
INSERT INTO `wp_term_taxonomy` VALUES("6", "6", "nav_menu", "", "0", "3");

/* INSERT TABLE DATA: wp_terms */
INSERT INTO `wp_terms` VALUES("1", "Без рубрики", "%d0%b1%d0%b5%d0%b7-%d1%80%d1%83%d0%b1%d1%80%d0%b8%d0%ba%d0%b8", "0");
INSERT INTO `wp_terms` VALUES("2", "Директор", "%d0%b4%d0%b8%d1%80%d0%b5%d0%ba%d1%82%d0%be%d1%80", "0");
INSERT INTO `wp_terms` VALUES("3", "Склад", "%d1%81%d0%ba%d0%bb%d0%b0%d0%b4", "0");
INSERT INTO `wp_terms` VALUES("4", "Типография", "%d1%82%d0%b8%d0%bf%d0%be%d0%b3%d1%80%d0%b0%d1%84%d0%b8%d1%8f", "0");
INSERT INTO `wp_terms` VALUES("5", "Резка", "%d1%80%d0%b5%d0%b7%d0%ba%d0%b0", "0");
INSERT INTO `wp_terms` VALUES("6", "Заказ", "%d0%b7%d0%b0%d0%ba%d0%b0%d0%b7", "0");

/* INSERT TABLE DATA: wp_usermeta */
INSERT INTO `wp_usermeta` VALUES("1", "1", "nickname", "Artyom_admin");
INSERT INTO `wp_usermeta` VALUES("2", "1", "first_name", "");
INSERT INTO `wp_usermeta` VALUES("3", "1", "last_name", "");
INSERT INTO `wp_usermeta` VALUES("4", "1", "description", "");
INSERT INTO `wp_usermeta` VALUES("5", "1", "rich_editing", "true");
INSERT INTO `wp_usermeta` VALUES("6", "1", "comment_shortcuts", "false");
INSERT INTO `wp_usermeta` VALUES("7", "1", "admin_color", "fresh");
INSERT INTO `wp_usermeta` VALUES("8", "1", "use_ssl", "0");
INSERT INTO `wp_usermeta` VALUES("9", "1", "show_admin_bar_front", "true");
INSERT INTO `wp_usermeta` VALUES("10", "1", "locale", "");
INSERT INTO `wp_usermeta` VALUES("11", "1", "wp_capabilities", "a:1:{s:13:\"administrator\";b:1;}");
INSERT INTO `wp_usermeta` VALUES("12", "1", "wp_user_level", "10");
INSERT INTO `wp_usermeta` VALUES("13", "1", "dismissed_wp_pointers", "");
INSERT INTO `wp_usermeta` VALUES("14", "1", "show_welcome_panel", "1");
INSERT INTO `wp_usermeta` VALUES("15", "1", "session_tokens", "a:1:{s:64:\"44edb2ab866cb3d0bda453f8636c75c4962712eaeea01f9d8c5eab26550abdb5\";a:4:{s:10:\"expiration\";i:1495739165;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:114:\"Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36\";s:5:\"login\";i:1495566365;}}");
INSERT INTO `wp_usermeta` VALUES("16", "1", "wp_user-settings", "libraryContent=browse");
INSERT INTO `wp_usermeta` VALUES("17", "1", "wp_user-settings-time", "1487549161");
INSERT INTO `wp_usermeta` VALUES("18", "1", "wp_dashboard_quick_press_last_post_id", "108");
INSERT INTO `wp_usermeta` VALUES("19", "1", "managenav-menuscolumnshidden", "a:5:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";i:4;s:15:\"title-attribute\";}");
INSERT INTO `wp_usermeta` VALUES("20", "1", "metaboxhidden_nav-menus", "a:2:{i:0;s:12:\"add-post_tag\";i:1;s:15:\"add-post_format\";}");
INSERT INTO `wp_usermeta` VALUES("21", "1", "nav_menu_recently_edited", "2");
INSERT INTO `wp_usermeta` VALUES("22", "1", "closedpostboxes_page", "a:0:{}");
INSERT INTO `wp_usermeta` VALUES("23", "1", "metaboxhidden_page", "a:5:{i:0;s:10:\"postcustom\";i:1;s:16:\"commentstatusdiv\";i:2;s:11:\"commentsdiv\";i:3;s:7:\"slugdiv\";i:4;s:9:\"authordiv\";}");
INSERT INTO `wp_usermeta` VALUES("24", "2", "nickname", "zakaz");
INSERT INTO `wp_usermeta` VALUES("25", "2", "first_name", "");
INSERT INTO `wp_usermeta` VALUES("26", "2", "last_name", "");
INSERT INTO `wp_usermeta` VALUES("27", "2", "description", "");
INSERT INTO `wp_usermeta` VALUES("28", "2", "rich_editing", "true");
INSERT INTO `wp_usermeta` VALUES("29", "2", "comment_shortcuts", "false");
INSERT INTO `wp_usermeta` VALUES("30", "2", "admin_color", "fresh");
INSERT INTO `wp_usermeta` VALUES("31", "2", "use_ssl", "0");
INSERT INTO `wp_usermeta` VALUES("32", "2", "show_admin_bar_front", "false");
INSERT INTO `wp_usermeta` VALUES("33", "2", "locale", "");
INSERT INTO `wp_usermeta` VALUES("34", "2", "wp_capabilities", "a:1:{s:10:\"subscriber\";b:1;}");
INSERT INTO `wp_usermeta` VALUES("35", "2", "wp_user_level", "0");
INSERT INTO `wp_usermeta` VALUES("36", "2", "dismissed_wp_pointers", "");
INSERT INTO `wp_usermeta` VALUES("90", "4", "session_tokens", "a:1:{s:64:\"9b739f4b78895aeebc37a2af50e41c6b4b9db34a17247289b828a8ee68e48214\";a:4:{s:10:\"expiration\";i:1489512167;s:2:\"ip\";s:14:\"141.136.69.255\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36\";s:5:\"login\";i:1489339367;}}");
INSERT INTO `wp_usermeta` VALUES("38", "3", "nickname", "Artem-admin");
INSERT INTO `wp_usermeta` VALUES("39", "3", "first_name", "");
INSERT INTO `wp_usermeta` VALUES("40", "3", "last_name", "");
INSERT INTO `wp_usermeta` VALUES("41", "3", "description", "");
INSERT INTO `wp_usermeta` VALUES("42", "3", "rich_editing", "true");
INSERT INTO `wp_usermeta` VALUES("43", "3", "comment_shortcuts", "false");
INSERT INTO `wp_usermeta` VALUES("44", "3", "admin_color", "fresh");
INSERT INTO `wp_usermeta` VALUES("45", "3", "use_ssl", "0");
INSERT INTO `wp_usermeta` VALUES("46", "3", "show_admin_bar_front", "true");
INSERT INTO `wp_usermeta` VALUES("47", "3", "locale", "");
INSERT INTO `wp_usermeta` VALUES("48", "3", "wp_capabilities", "a:1:{s:13:\"administrator\";b:1;}");
INSERT INTO `wp_usermeta` VALUES("49", "3", "wp_user_level", "10");
INSERT INTO `wp_usermeta` VALUES("50", "3", "dismissed_wp_pointers", "");
INSERT INTO `wp_usermeta` VALUES("51", "4", "nickname", "pahestapet");
INSERT INTO `wp_usermeta` VALUES("52", "4", "first_name", "");
INSERT INTO `wp_usermeta` VALUES("53", "4", "last_name", "");
INSERT INTO `wp_usermeta` VALUES("54", "4", "description", "");
INSERT INTO `wp_usermeta` VALUES("55", "4", "rich_editing", "true");
INSERT INTO `wp_usermeta` VALUES("56", "4", "comment_shortcuts", "false");
INSERT INTO `wp_usermeta` VALUES("57", "4", "admin_color", "fresh");
INSERT INTO `wp_usermeta` VALUES("58", "4", "use_ssl", "0");
INSERT INTO `wp_usermeta` VALUES("59", "4", "show_admin_bar_front", "false");
INSERT INTO `wp_usermeta` VALUES("60", "4", "locale", "");
INSERT INTO `wp_usermeta` VALUES("61", "4", "wp_capabilities", "a:1:{s:6:\"editor\";b:1;}");
INSERT INTO `wp_usermeta` VALUES("62", "4", "wp_user_level", "7");
INSERT INTO `wp_usermeta` VALUES("63", "4", "dismissed_wp_pointers", "");
INSERT INTO `wp_usermeta` VALUES("64", "5", "nickname", "ktrich");
INSERT INTO `wp_usermeta` VALUES("65", "5", "first_name", "");
INSERT INTO `wp_usermeta` VALUES("66", "5", "last_name", "");
INSERT INTO `wp_usermeta` VALUES("67", "5", "description", "");
INSERT INTO `wp_usermeta` VALUES("68", "5", "rich_editing", "true");
INSERT INTO `wp_usermeta` VALUES("69", "5", "comment_shortcuts", "false");
INSERT INTO `wp_usermeta` VALUES("70", "5", "admin_color", "fresh");
INSERT INTO `wp_usermeta` VALUES("71", "5", "use_ssl", "0");
INSERT INTO `wp_usermeta` VALUES("72", "5", "show_admin_bar_front", "false");
INSERT INTO `wp_usermeta` VALUES("73", "5", "locale", "");
INSERT INTO `wp_usermeta` VALUES("74", "5", "wp_capabilities", "a:1:{s:11:\"contributor\";b:1;}");
INSERT INTO `wp_usermeta` VALUES("75", "5", "wp_user_level", "1");
INSERT INTO `wp_usermeta` VALUES("76", "5", "dismissed_wp_pointers", "");
INSERT INTO `wp_usermeta` VALUES("77", "6", "nickname", "printing");
INSERT INTO `wp_usermeta` VALUES("78", "6", "first_name", "");
INSERT INTO `wp_usermeta` VALUES("79", "6", "last_name", "");
INSERT INTO `wp_usermeta` VALUES("80", "6", "description", "");
INSERT INTO `wp_usermeta` VALUES("81", "6", "rich_editing", "true");
INSERT INTO `wp_usermeta` VALUES("82", "6", "comment_shortcuts", "false");
INSERT INTO `wp_usermeta` VALUES("83", "6", "admin_color", "fresh");
INSERT INTO `wp_usermeta` VALUES("84", "6", "use_ssl", "0");
INSERT INTO `wp_usermeta` VALUES("85", "6", "show_admin_bar_front", "false");
INSERT INTO `wp_usermeta` VALUES("86", "6", "locale", "");
INSERT INTO `wp_usermeta` VALUES("87", "6", "wp_capabilities", "a:1:{s:6:\"author\";b:1;}");
INSERT INTO `wp_usermeta` VALUES("88", "6", "wp_user_level", "2");
INSERT INTO `wp_usermeta` VALUES("89", "6", "dismissed_wp_pointers", "");
INSERT INTO `wp_usermeta` VALUES("92", "3", "session_tokens", "a:1:{s:64:\"8367dc4814f6e4d0a5aa8a90730152099b33063697256c9d7ff8cdf94b94d8fc\";a:4:{s:10:\"expiration\";i:1493188656;s:2:\"ip\";s:14:\"141.136.69.255\";s:2:\"ua\";s:121:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36\";s:5:\"login\";i:1493015856;}}");
INSERT INTO `wp_usermeta` VALUES("95", "3", "wp_dashboard_quick_press_last_post_id", "109");
INSERT INTO `wp_usermeta` VALUES("94", "6", "session_tokens", "a:1:{s:64:\"d14d38b5b747618d2b0f0392240b57600c4cedd0094f2c63f5726b757bc23cb1\";a:4:{s:10:\"expiration\";i:1489512560;s:2:\"ip\";s:14:\"141.136.69.255\";s:2:\"ua\";s:120:\"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36\";s:5:\"login\";i:1489339760;}}");

/* INSERT TABLE DATA: wp_users */
INSERT INTO `wp_users` VALUES("1", "Artyom_admin", "$P$B66RjE4wBfMf.zhk3vy0xOWjuF/T6L/", "artyom_admin", "gevs91.p@gmail.com", "", "2017-02-20 00:06:01", "", "0", "Artyom_admin");
INSERT INTO `wp_users` VALUES("2", "zakaz", "$P$Ble8Upnc085GapU5FrzMMTnPnYr4c10", "zakaz", "dsf@adf.ru", "", "2017-03-06 16:29:55", "", "0", "zakaz");
INSERT INTO `wp_users` VALUES("3", "Artem-admin", "$P$BgpgzF3kTJEipQ7PvfZeLzNh7SDG.51", "artem-admin", "sdf@af.com", "", "2017-03-06 16:44:03", "", "0", "Artem-admin");
INSERT INTO `wp_users` VALUES("4", "pahestapet", "$P$BTBDDiK0RvA6M4fobm/QAerVUJ33PY/", "pahestapet", "sdf@aff.com", "", "2017-03-06 16:45:08", "1488818709:$P$Bax.sGFlTi1FiBxo5/wAX77I4YCGfP1", "0", "pahestapet");
INSERT INTO `wp_users` VALUES("5", "ktrich", "$P$Bd30C8FEcLbARHgNn.L930RhT/kQse.", "ktrich", "ktrich@mail.ru", "", "2017-03-06 16:45:49", "", "0", "ktrich");
INSERT INTO `wp_users` VALUES("6", "printing", "$P$BwGjS1XTjBJxzBOjqve4xcjZue9GGM.", "printing", "sdf@afa.com", "", "2017-03-06 16:46:25", "1488818785:$P$BVyu1N3kS17HGe7vX4lYeMVOPOelnr.", "0", "printing");

SET FOREIGN_KEY_CHECKS = 1; 

/* Duplicator WordPress Timestamp: 2017-05-23 19:51:32*/
/* DUPLICATOR_MYSQLDUMP_EOF */
