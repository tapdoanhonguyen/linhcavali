-- phpMyAdmin SQL Dump
-- version 3.5.8.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 17, 2023 at 01:22 PM
-- Server version: 5.6.34
-- PHP Version: 5.6.30

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `licavali_home`
--

-- --------------------------------------------------------

--
-- Table structure for table `hn4_api_role`
--

CREATE TABLE IF NOT EXISTS `hn4_api_role` (
  `role_id` smallint(4) NOT NULL AUTO_INCREMENT,
  `role_md5title` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_type` enum('private','public') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'private',
  `role_object` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `role_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `role_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_period` int(11) NOT NULL DEFAULT '0',
  `flood_rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `edittime` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_md5title` (`role_md5title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_api_role_credential`
--

CREATE TABLE IF NOT EXISTS `hn4_api_role_credential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `role_id` smallint(4) unsigned NOT NULL DEFAULT '0',
  `access_count` int(11) unsigned NOT NULL DEFAULT '0',
  `last_access` int(11) unsigned NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `quota` int(20) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_role_id` (`userid`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_api_role_logs`
--

CREATE TABLE IF NOT EXISTS `hn4_api_role_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` smallint(4) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `command` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `log_time` int(11) NOT NULL DEFAULT '0',
  `log_ip` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_api_user`
--

CREATE TABLE IF NOT EXISTS `hn4_api_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) unsigned NOT NULL,
  `ident` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ips` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` enum('none','password_verify','md5_verify') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'password_verify',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `edittime` int(11) NOT NULL DEFAULT '0',
  `last_access` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_method` (`userid`,`method`),
  UNIQUE KEY `ident` (`ident`),
  UNIQUE KEY `secret` (`secret`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_authors`
--

CREATE TABLE IF NOT EXISTS `hn4_authors` (
  `admin_id` int(11) unsigned NOT NULL,
  `editor` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lev` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `files_level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `position` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'siteinfo',
  `admin_theme` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `edittime` int(11) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `susp_reason` text COLLATE utf8mb4_unicode_ci,
  `pre_check_num` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pre_last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `pre_last_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pre_last_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `check_num` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_authors`
--

INSERT INTO `hn4_authors` (`admin_id`, `editor`, `lev`, `files_level`, `position`, `main_module`, `admin_theme`, `addtime`, `edittime`, `is_suspend`, `susp_reason`, `pre_check_num`, `pre_last_login`, `pre_last_ip`, `pre_last_agent`, `check_num`, `last_login`, `last_ip`, `last_agent`) VALUES
(1, 'ckeditor', 1, 'adobe,archives,audio,documents,images,real,video|1|1|1', 'Administrator', 'siteinfo', '', 0, 0, 0, '', '', 0, '', '', '365eb5fb2633f61b0d9b3448bcdae1ef', 1678893014, '171.247.155.49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_authors_config`
--

CREATE TABLE IF NOT EXISTS `hn4_authors_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `keyname` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mask` tinyint(4) NOT NULL DEFAULT '0',
  `begintime` int(11) unsigned NOT NULL DEFAULT '0',
  `endtime` int(11) unsigned NOT NULL DEFAULT '0',
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyname` (`keyname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_authors_module`
--

CREATE TABLE IF NOT EXISTS `hn4_authors_module` (
  `mid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` mediumint(8) NOT NULL DEFAULT '0',
  `act_1` tinyint(4) NOT NULL DEFAULT '0',
  `act_2` tinyint(4) NOT NULL DEFAULT '1',
  `act_3` tinyint(4) NOT NULL DEFAULT '1',
  `checksum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`mid`),
  UNIQUE KEY `module` (`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `hn4_authors_module`
--

INSERT INTO `hn4_authors_module` (`mid`, `module`, `lang_key`, `weight`, `act_1`, `act_2`, `act_3`, `checksum`) VALUES
(1, 'siteinfo', 'mod_siteinfo', 1, 1, 1, 1, '12f0ba979430772399a29deabee4060f'),
(2, 'authors', 'mod_authors', 2, 1, 1, 1, 'f78ee9d8896dcc5da42973cb6d036b63'),
(3, 'settings', 'mod_settings', 3, 1, 1, 0, 'c54567930dba636090e0e58b2d69b392'),
(4, 'database', 'mod_database', 4, 1, 0, 0, '6f4cdc7624397c94d9d1f3290d41d118'),
(5, 'webtools', 'mod_webtools', 5, 1, 1, 0, '943766ad20ada5062b5142ac71038a5d'),
(6, 'seotools', 'mod_seotools', 6, 1, 1, 0, '73dadcad2790beca9df82b9e9087d726'),
(7, 'language', 'mod_language', 7, 1, 1, 0, '3759e1586fcdefdf1dbdb94e2f7f3034'),
(8, 'modules', 'mod_modules', 8, 1, 1, 0, 'def46a06a18b577b1fab22f8d70bef8f'),
(9, 'themes', 'mod_themes', 9, 1, 1, 0, '0e9625e600541a1d95afd9e7391e844e'),
(10, 'extensions', 'mod_extensions', 10, 1, 0, 0, '0895f05bfe989d8df59594f94723053f'),
(11, 'upload', 'mod_upload', 11, 1, 1, 1, 'b03e4477b4cc2e284fd7fbf632b86355');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_authors_oauth`
--

CREATE TABLE IF NOT EXISTS `hn4_authors_oauth` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) unsigned NOT NULL COMMENT 'ID của quản trị',
  `oauth_server` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Eg: facebook, google...',
  `oauth_uid` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ID duy nhất ứng với server',
  `oauth_email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email',
  `oauth_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_id` (`admin_id`,`oauth_server`,`oauth_uid`),
  KEY `oauth_email` (`oauth_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Bảng lưu xác thực 2 bước từ oauth của admin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_banners_click`
--

CREATE TABLE IF NOT EXISTS `hn4_banners_click` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `bid` mediumint(8) NOT NULL DEFAULT '0',
  `click_time` int(11) unsigned NOT NULL DEFAULT '0',
  `click_day` int(2) NOT NULL,
  `click_ip` varchar(46) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_country` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_browse_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_browse_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_os_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_os_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bid` (`bid`),
  KEY `click_day` (`click_day`),
  KEY `click_ip` (`click_ip`),
  KEY `click_country` (`click_country`),
  KEY `click_browse_key` (`click_browse_key`),
  KEY `click_os_key` (`click_os_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_banners_plans`
--

CREATE TABLE IF NOT EXISTS `hn4_banners_plans` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `blang` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `form` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `require_image` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `uploadtype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `uploadgroup` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exp_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hn4_banners_plans`
--

INSERT INTO `hn4_banners_plans` (`id`, `blang`, `title`, `description`, `form`, `width`, `height`, `act`, `require_image`, `uploadtype`, `uploadgroup`, `exp_time`) VALUES
(1, '', 'Mid-page ad block', '', 'sequential', 575, 72, 1, 1, 'images', '', 0),
(2, '', 'Left-column ad block', '', 'sequential', 212, 800, 1, 1, 'images', '', 0),
(3, '', 'Right-column ad block', '', 'random', 250, 500, 1, 1, 'images', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_banners_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_banners_rows` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `clid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_ext` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `width` int(4) unsigned NOT NULL DEFAULT '0',
  `height` int(4) unsigned NOT NULL DEFAULT '0',
  `file_alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageforswf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `click_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `target` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_blank',
  `bannerhtml` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `publ_time` int(11) unsigned NOT NULL DEFAULT '0',
  `exp_time` int(11) unsigned NOT NULL DEFAULT '0',
  `hits_total` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `clid` (`clid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_banners_rows`
--

INSERT INTO `hn4_banners_rows` (`id`, `title`, `pid`, `clid`, `file_name`, `file_ext`, `file_mime`, `width`, `height`, `file_alt`, `imageforswf`, `click_url`, `target`, `bannerhtml`, `add_time`, `publ_time`, `exp_time`, `hits_total`, `act`, `weight`) VALUES
(1, 'Mid-page advertisement', 1, 1, 'webnhanh.jpg', 'png', 'image/jpeg', 575, 72, '', '', 'http://webnhanh.vn', '_blank', '', 1677364656, 1677364656, 0, 0, 1, 1),
(2, 'Left-column advertisement', 2, 1, 'vinades.jpg', 'jpg', 'image/jpeg', 212, 400, '', '', 'http://vinades.vn', '_blank', '', 1677364656, 1677364656, 0, 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_config`
--

CREATE TABLE IF NOT EXISTS `hn4_config` (
  `lang` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sys',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'global',
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `config_value` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `lang` (`lang`,`module`,`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_config`
--

INSERT INTO `hn4_config` (`lang`, `module`, `config_name`, `config_value`) VALUES
('sys', 'site', 'admin_theme', 'admin_default'),
('sys', 'site', 'date_pattern', 'l, d/m/Y'),
('sys', 'site', 'time_pattern', 'H:i'),
('sys', 'site', 'online_upd', '1'),
('sys', 'site', 'statistic', '1'),
('sys', 'site', 'site_phone', ''),
('sys', 'site', 'mailer_mode', 'mail'),
('sys', 'site', 'smtp_host', 'smtp.gmail.com'),
('sys', 'site', 'smtp_ssl', '1'),
('sys', 'site', 'smtp_port', '465'),
('sys', 'site', 'verify_peer_ssl', '1'),
('sys', 'site', 'verify_peer_name_ssl', '1'),
('sys', 'site', 'smtp_username', 'user@gmail.com'),
('sys', 'site', 'smtp_password', ''),
('sys', 'site', 'sender_name', ''),
('sys', 'site', 'sender_email', ''),
('sys', 'site', 'reply_name', ''),
('sys', 'site', 'reply_email', ''),
('sys', 'site', 'force_sender', '0'),
('sys', 'site', 'force_reply', '0'),
('sys', 'site', 'notify_email_error', '0'),
('sys', 'site', 'googleAnalyticsID', ''),
('sys', 'site', 'googleAnalyticsSetDomainName', '0'),
('sys', 'site', 'googleAnalyticsMethod', 'classic'),
('sys', 'site', 'googleAnalytics4ID', ''),
('sys', 'site', 'searchEngineUniqueID', ''),
('sys', 'global', 'zaloWebhookIPs', ''),
('sys', 'site', 'zaloOASecretKey', ''),
('sys', 'site', 'zaloOAAccessTokenTime', '0'),
('sys', 'site', 'zaloOARefreshToken', ''),
('sys', 'site', 'metaTagsOgp', '1'),
('sys', 'site', 'pageTitleMode', 'pagetitle'),
('sys', 'site', 'description_length', '170'),
('sys', 'site', 'nv_unickmin', '4'),
('sys', 'site', 'nv_unickmax', '20'),
('sys', 'site', 'nv_upassmin', '8'),
('sys', 'site', 'nv_upassmax', '32'),
('sys', 'site', 'dir_forum', ''),
('sys', 'site', 'nv_unick_type', '4'),
('sys', 'site', 'nv_upass_type', '3'),
('sys', 'site', 'allowmailchange', '1'),
('sys', 'site', 'allowuserpublic', '1'),
('sys', 'site', 'allowquestion', '0'),
('sys', 'site', 'allowloginchange', '0'),
('sys', 'site', 'allowuserlogin', '1'),
('sys', 'site', 'allowuserloginmulti', '0'),
('sys', 'site', 'allowuserreg', '2'),
('sys', 'site', 'is_user_forum', '0'),
('sys', 'site', 'openid_servers', ''),
('sys', 'site', 'openid_processing', 'connect,create,auto'),
('sys', 'site', 'user_check_pass_time', '1800'),
('sys', 'site', 'auto_login_after_reg', '1'),
('sys', 'site', 'email_dot_equivalent', '1'),
('sys', 'site', 'whoviewuser', '2'),
('sys', 'site', 'ssl_https', '0'),
('sys', 'site', 'facebook_client_id', ''),
('sys', 'site', 'facebook_client_secret', ''),
('sys', 'site', 'google_client_id', ''),
('sys', 'site', 'google_client_secret', ''),
('sys', 'site', 'referer_blocker', '1'),
('sys', 'site', 'private_site', '1'),
('sys', 'site', 'max_user_admin', '0'),
('sys', 'site', 'max_user_number', '0'),
('sys', 'site', 'captcha_area', 'r,m,p'),
('sys', 'site', 'captcha_type', 'captcha'),
('sys', 'site', 'dkim_included', 'sendmail,mail'),
('sys', 'site', 'smime_included', 'sendmail,mail'),
('sys', 'site', 'nv_csp', '{"default-src":{"all":1,"self":1,"data":1,"unsafe-inline":1,"unsafe-eval":1,"hosts":["shop.mango.com","*.acfc.com.vn"]},"script-src":{"all":1,"self":1,"data":1,"unsafe-inline":1,"unsafe-eval":1,"hosts":["*.google.com","*.google-analytics.com","*.googletagmanager.com","*.gstatic.com","*.facebook.com","*.facebook.net","*.twitter.com","*.zalo.me","*.zaloapp.com","*.tawk.to","*.cloudflareinsights.com","shop.mango.com","*.acfc.com.vn"]},"style-src":{"all":1,"self":1,"data":1,"unsafe-inline":1,"hosts":["*.google.com","*.googleapis.com","*.tawk.to","shop.mango.com","*.acfc.com.vn"]},"img-src":{"all":1,"self":1,"data":1,"hosts":["*.twitter.com","*.google.com","*.googleapis.com","*.google-analytics.com","*.gstatic.com","*.facebook.com","tawk.link","*.tawk.to","static.nukeviet.vn","*.acfc.com.vn"]},"font-src":{"all":1,"self":1,"data":1,"hosts":["*.googleapis.com","*.gstatic.com","*.tawk.to","shop.mango.com","*.acfc.com.vn"]},"connect-src":{"all":1,"self":1,"hosts":["*.google-analytics.com","*.zalo.me","*.tawk.to","wss:\\/\\/*.tawk.to","shop.mango.com","*.acfc.com.vn"]},"media-src":{"all":1,"self":1,"hosts":["*.tawk.to","shop.mango.com","*.acfc.com.vn"]},"object-src":{"all":1,"self":1,"hosts":["shop.mango.com","*.acfc.com.vn"]},"prefetch-src":{"all":1,"self":1,"hosts":["shop.mango.com","*.acfc.com.vn"]},"frame-src":{"all":1,"self":1,"hosts":["*.google.com","*.youtube.com","*.facebook.com","*.facebook.net","*.twitter.com","*.zalo.me","*.acfc.com.vn"]},"frame-ancestors":{"all":1,"self":1},"form-action":{"all":1,"self":1,"hosts":["*.google.com","*.acfc.com.vn"]},"base-uri":{"all":1,"self":1,"hosts":["shop.mango.com","*.acfc.com.vn"]},"manifest-src":{"all":1,"self":1,"hosts":["shop.mango.com","*.acfc.com.vn"]}}'),
('sys', 'site', 'nv_csp_act', '1'),
('sys', 'site', 'nv_csp_script_nonce', '0'),
('sys', 'site', 'nv_rp', 'no-referrer-when-downgrade, strict-origin-when-cross-origin'),
('sys', 'site', 'nv_rp_act', '1'),
('sys', 'site', 'pass_timeout', '0'),
('sys', 'site', 'oldpass_num', '5'),
('sys', 'site', 'send_pass', '1'),
('sys', 'site', 'login_name_type', '3'),
('sys', 'site', 'ogp_image', ''),
('sys', 'site', 'cronjobs_last_time', '1679054081'),
('sys', 'site', 'cronjobs_interval', '5'),
('sys', 'site', 'cronjobs_launcher', 'system'),
('sys', 'site', 'push_active', '1'),
('sys', 'site', 'push_default_exp', '604800'),
('sys', 'site', 'push_exp_del', '604800'),
('sys', 'site', 'push_refresh_time', '30'),
('sys', 'site', 'push_max_characters', '200'),
('sys', 'site', 'push_numrows', '10'),
('sys', 'site', 'over_capacity', '0'),
('sys', 'define', 'nv_gfx_num', '6'),
('sys', 'global', 'closed_site', '0'),
('sys', 'global', 'site_reopening_time', '0'),
('sys', 'global', 'notification_active', '1'),
('sys', 'global', 'notification_autodel', '15'),
('sys', 'global', 'site_keywords', 'NukeViet, portal, mysql, php'),
('sys', 'global', 'block_admin_ip', '0'),
('sys', 'global', 'admfirewall', '0'),
('sys', 'global', 'dump_autobackup', '0'),
('sys', 'global', 'dump_backup_ext', 'gz'),
('sys', 'global', 'dump_backup_day', '30'),
('sys', 'global', 'file_allowed_ext', 'adobe,archives,audio,documents,images,real,video'),
('sys', 'global', 'forbid_extensions', 'htm,html,htmls,js,php,php3,php4,php5,phtml,inc'),
('sys', 'global', 'forbid_mimes', 'application/ecmascript,application/javascript,application/x-javascript,text/ecmascript,text/html,text/javascript,application/x-httpd-php,application/x-httpd-php-source,application/php,application/x-php,text/php,text/x-php'),
('sys', 'global', 'nv_max_size', '67108864'),
('sys', 'global', 'nv_overflow_size', '0'),
('sys', 'global', 'upload_checking_mode', 'strong'),
('sys', 'global', 'upload_alt_require', '1'),
('sys', 'global', 'upload_auto_alt', '1'),
('sys', 'global', 'upload_chunk_size', '0'),
('sys', 'global', 'useactivate', '2'),
('sys', 'global', 'allow_sitelangs', 'vi'),
('sys', 'global', 'read_type', '0'),
('sys', 'global', 'rewrite_enable', '1'),
('sys', 'global', 'rewrite_optional', '0'),
('sys', 'global', 'rewrite_endurl', '/'),
('sys', 'global', 'rewrite_exturl', '.html'),
('sys', 'global', 'rewrite_op_mod', ''),
('sys', 'global', 'autocheckupdate', '1'),
('sys', 'global', 'autoupdatetime', '24'),
('sys', 'global', 'gzip_method', '1'),
('sys', 'global', 'resource_preload', '2'),
('sys', 'global', 'authors_detail_main', '0'),
('sys', 'global', 'spadmin_add_admin', '1'),
('sys', 'global', 'timestamp', '1678893020'),
('sys', 'global', 'static_noquerystring', '0'),
('sys', 'global', 'version', '4.6.00'),
('sys', 'global', 'cookie_httponly', '1'),
('sys', 'global', 'admin_check_pass_time', '1800'),
('sys', 'global', 'admin_login_duration', '10800'),
('sys', 'global', 'admin_user_logout', '0'),
('sys', 'global', 'cookie_secure', '0'),
('sys', 'global', 'cookie_SameSite', 'Lax'),
('sys', 'global', 'is_flood_blocker', '1'),
('sys', 'global', 'max_requests_60', '40'),
('sys', 'global', 'max_requests_300', '150'),
('sys', 'global', 'is_login_blocker', '1'),
('sys', 'global', 'login_number_tracking', '5'),
('sys', 'global', 'login_time_tracking', '5'),
('sys', 'global', 'login_time_ban', '30'),
('sys', 'global', 'nv_display_errors_list', '1'),
('sys', 'global', 'display_errors_list', '1'),
('sys', 'global', 'nv_auto_resize', '1'),
('sys', 'global', 'dump_interval', '1'),
('sys', 'global', 'nv_static_url', ''),
('sys', 'global', 'cdn_url', ''),
('sys', 'global', 'assets_cdn', '0'),
('sys', 'global', 'two_step_verification', '0'),
('sys', 'global', 'admin_2step_opt', 'code'),
('sys', 'global', 'admin_2step_default', 'code'),
('sys', 'global', 'recaptcha_sitekey', ''),
('sys', 'global', 'recaptcha_secretkey', ''),
('sys', 'global', 'recaptcha_type', 'image'),
('sys', 'global', 'recaptcha_ver', '2'),
('sys', 'global', 'users_special', '0'),
('sys', 'global', 'crosssite_restrict', '1'),
('sys', 'global', 'crosssite_valid_domains', '["http:\\/\\/shop.mango.com","https:\\/\\/shop.mango.com","https:\\/\\/www.acfc.com.vn","http:\\/\\/www.acfc.com.vn"]'),
('sys', 'global', 'crosssite_valid_ips', ''),
('sys', 'global', 'crosssite_allowed_variables', ''),
('sys', 'global', 'crossadmin_restrict', '1'),
('sys', 'global', 'crossadmin_valid_domains', '["http:\\/\\/shop.mango.com","https:\\/\\/shop.mango.com","https:\\/\\/www.acfc.com.vn","http:\\/\\/www.acfc.com.vn"]'),
('sys', 'global', 'crossadmin_valid_ips', ''),
('sys', 'global', 'domains_whitelist', '["youtube.com","www.youtube.com","google.com","www.google.com","drive.google.com","docs.google.com"]'),
('sys', 'global', 'domains_restrict', '1'),
('sys', 'global', 'remote_api_access', '1'),
('sys', 'global', 'allow_null_origin', '1'),
('sys', 'global', 'ip_allow_null_origin', ''),
('sys', 'global', 'cookie_notice_popup', '1'),
('sys', 'site', 'zaloOAAccessToken', ''),
('sys', 'global', 'end_url_variables', ''),
('sys', 'global', 'request_uri_check', 'page'),
('sys', 'global', 'XSSsanitize', '1'),
('sys', 'global', 'admin_XSSsanitize', '1'),
('sys', 'global', 'unsign_vietwords', '1'),
('sys', 'global', 'passshow_button', '0'),
('sys', 'define', 'nv_gfx_width', '150'),
('sys', 'define', 'nv_gfx_height', '40'),
('sys', 'define', 'nv_max_width', '1500'),
('sys', 'define', 'nv_max_height', '1500'),
('sys', 'define', 'nv_mobile_mode_img', '480'),
('sys', 'define', 'nv_live_cookie_time', '31104000'),
('sys', 'define', 'nv_live_session_time', '0'),
('sys', 'define', 'nv_anti_iframe', '1'),
('sys', 'define', 'nv_anti_agent', '0'),
('sys', 'define', 'nv_allowed_html_tags', 'embed, object, param, a, b, blockquote, br, caption, col, colgroup, div, em, h1, h2, h3, h4, h5, h6, hr, i, img, li, p, span, strong, s, sub, sup, table, tbody, td, th, tr, u, ul, ol, iframe, figure, figcaption, video, audio, source, track, code, pre'),
('sys', 'define', 'nv_debug', '1'),
('vi', 'global', 'site_domain', ''),
('vi', 'global', 'site_name', 'Fashion for Woman | LINH CAVALIVietnam'),
('vi', 'global', 'site_logo', 'uploads/linh-cavali.jpg'),
('vi', 'global', 'site_banner', ''),
('vi', 'global', 'site_favicon', ''),
('vi', 'global', 'site_description', 'Latest trends in fashion for women. Discover our designs&#x3A; dresses, tops, jeans, shoes, bags and accessories.'),
('vi', 'global', 'site_keywords', 'Latest trends in fashion for women. Discover our designs&#x3A; dresses, tops, jeans, shoes, bags and accessories.'),
('vi', 'global', 'theme_type', 'r,d,m'),
('vi', 'global', 'site_theme', 'licavali'),
('vi', 'global', 'preview_theme', ''),
('vi', 'global', 'user_allowed_theme', ''),
('vi', 'global', 'mobile_theme', ''),
('vi', 'global', 'site_home_module', 'shops'),
('vi', 'global', 'switch_mobi_des', '0'),
('vi', 'global', 'upload_logo', ''),
('vi', 'global', 'upload_logo_pos', 'bottomRight'),
('vi', 'global', 'autologosize1', '50'),
('vi', 'global', 'autologosize2', '40'),
('vi', 'global', 'autologosize3', '30'),
('vi', 'global', 'autologomod', ''),
('vi', 'global', 'tinify_active', '0'),
('vi', 'global', 'tinify_api', ''),
('vi', 'global', 'name_show', '0'),
('vi', 'global', 'disable_site_content', 'Vì lý do kỹ thuật website tạm ngưng hoạt động. Thành thật xin lỗi các bạn vì sự bất tiện này!'),
('vi', 'global', 'opensearch_link', ''),
('vi', 'seotools', 'prcservice', ''),
('vi', 'about', 'auto_postcomm', '1'),
('vi', 'about', 'allowed_comm', '-1'),
('vi', 'about', 'view_comm', '6'),
('vi', 'about', 'setcomm', '4'),
('vi', 'about', 'activecomm', '0'),
('vi', 'about', 'emailcomm', '0'),
('vi', 'about', 'adminscomm', ''),
('vi', 'about', 'sortcomm', '0'),
('vi', 'about', 'captcha_area_comm', '1'),
('vi', 'about', 'perpagecomm', '5'),
('vi', 'about', 'timeoutcomm', '360'),
('vi', 'about', 'allowattachcomm', '0'),
('vi', 'about', 'alloweditorcomm', '0'),
('sys', 'site', 'zaloAppSecretKey', ''),
('sys', 'site', 'zaloAppID', ''),
('sys', 'site', 'zaloOfficialAccountID', ''),
('vi', 'news', 'indexfile', 'viewcat_main_right'),
('vi', 'news', 'mobile_indexfile', 'viewcat_page_new'),
('vi', 'news', 'per_page', '20'),
('vi', 'news', 'st_links', '10'),
('vi', 'news', 'homewidth', '100'),
('vi', 'news', 'homeheight', '150'),
('vi', 'news', 'blockwidth', '70'),
('vi', 'news', 'blockheight', '75'),
('vi', 'news', 'imagefull', '460'),
('vi', 'news', 'copyright', 'Chú ý: Việc đăng lại bài viết trên ở website hoặc các phương tiện truyền thông khác mà không ghi rõ nguồn http://nukeviet.vn là vi phạm bản quyền'),
('vi', 'news', 'showtooltip', '1'),
('vi', 'news', 'tooltip_position', 'bottom'),
('vi', 'news', 'tooltip_length', '150'),
('vi', 'news', 'showhometext', '1'),
('vi', 'news', 'timecheckstatus', '0'),
('vi', 'news', 'config_source', '0'),
('vi', 'news', 'show_no_image', ''),
('vi', 'news', 'allowed_rating', '1'),
('vi', 'news', 'allowed_rating_point', '1'),
('vi', 'news', 'facebookappid', ''),
('vi', 'news', 'socialbutton', 'facebook,twitter'),
('vi', 'news', 'alias_lower', '1'),
('vi', 'news', 'tags_alias', '0'),
('vi', 'news', 'auto_tags', '0'),
('vi', 'news', 'tags_remind', '1'),
('vi', 'news', 'keywords_tag', '1'),
('vi', 'news', 'copy_news', '0'),
('vi', 'news', 'structure_upload', 'Ym'),
('vi', 'news', 'imgposition', '2'),
('vi', 'news', 'htmlhometext', '0'),
('vi', 'news', 'order_articles', '0'),
('vi', 'news', 'identify_cat_change', '0'),
('vi', 'news', 'active_history', '0'),
('vi', 'news', 'elas_use', '0'),
('vi', 'news', 'elas_host', ''),
('vi', 'news', 'elas_port', '9200'),
('vi', 'news', 'elas_index', ''),
('vi', 'news', 'instant_articles_active', '0'),
('vi', 'news', 'instant_articles_template', 'default'),
('vi', 'news', 'instant_articles_httpauth', '0'),
('vi', 'news', 'instant_articles_username', ''),
('vi', 'news', 'instant_articles_password', ''),
('vi', 'news', 'instant_articles_livetime', '60'),
('vi', 'news', 'instant_articles_gettime', '120'),
('vi', 'news', 'instant_articles_auto', '1'),
('vi', 'news', 'auto_postcomm', '1'),
('vi', 'news', 'allowed_comm', '-1'),
('vi', 'news', 'view_comm', '6'),
('vi', 'news', 'setcomm', '4'),
('vi', 'news', 'activecomm', '1'),
('vi', 'news', 'emailcomm', '0'),
('vi', 'news', 'adminscomm', ''),
('vi', 'news', 'sortcomm', '0'),
('vi', 'news', 'captcha_area_comm', '1'),
('vi', 'news', 'perpagecomm', '5'),
('vi', 'news', 'timeoutcomm', '360'),
('vi', 'news', 'allowattachcomm', '0'),
('vi', 'news', 'alloweditorcomm', '0'),
('vi', 'news', 'frontend_edit_alias', '0'),
('vi', 'news', 'frontend_edit_layout', '1'),
('vi', 'news', 'captcha_type', 'captcha'),
('vi', 'news', 'report_active', '1'),
('vi', 'news', 'report_group', '4'),
('vi', 'news', 'report_limit', '2'),
('vi', 'contact', 'bodytext', 'Để không ngừng nâng cao chất lượng dịch vụ và đáp ứng tốt hơn nữa các yêu cầu của Quý khách, chúng tôi mong muốn nhận được các thông tin phản hồi. Nếu Quý khách có bất kỳ thắc mắc hoặc đóng góp nào, xin vui lòng liên hệ với chúng tôi theo thông tin dưới đây. Chúng tôi sẽ phản hồi lại Quý khách trong thời gian sớm nhất.'),
('vi', 'contact', 'sendcopymode', '0'),
('vi', 'contact', 'captcha_type', 'captcha'),
('vi', 'voting', 'difftimeout', '3600'),
('vi', 'voting', 'captcha_type', 'captcha'),
('sys', 'banners', 'captcha_type', 'captcha'),
('vi', 'page', 'auto_postcomm', '1'),
('vi', 'page', 'allowed_comm', '-1'),
('vi', 'page', 'view_comm', '6'),
('vi', 'page', 'setcomm', '4'),
('vi', 'page', 'activecomm', '0'),
('vi', 'page', 'emailcomm', '0'),
('vi', 'page', 'adminscomm', ''),
('vi', 'page', 'sortcomm', '0'),
('vi', 'page', 'captcha_area_comm', '1'),
('vi', 'page', 'perpagecomm', '5'),
('vi', 'page', 'timeoutcomm', '360'),
('vi', 'page', 'allowattachcomm', '0'),
('vi', 'page', 'alloweditorcomm', '0'),
('vi', 'comment', 'captcha_type', 'captcha'),
('vi', 'siteterms', 'auto_postcomm', '1'),
('vi', 'siteterms', 'allowed_comm', '-1'),
('vi', 'siteterms', 'view_comm', '6'),
('vi', 'siteterms', 'setcomm', '4'),
('vi', 'siteterms', 'activecomm', '0'),
('vi', 'siteterms', 'emailcomm', '0'),
('vi', 'siteterms', 'adminscomm', ''),
('vi', 'siteterms', 'sortcomm', '0'),
('vi', 'siteterms', 'captcha_area_comm', '1'),
('vi', 'siteterms', 'perpagecomm', '5'),
('vi', 'siteterms', 'timeoutcomm', '360'),
('vi', 'siteterms', 'allowattachcomm', '0'),
('vi', 'siteterms', 'alloweditorcomm', '0'),
('vi', 'freecontent', 'next_execute', '0'),
('sys', 'site', 'statistics_timezone', 'Asia/Ho_Chi_Minh'),
('sys', 'site', 'site_email', 'adminwmt@gmail.com'),
('sys', 'global', 'error_set_logs', '1'),
('sys', 'global', 'error_send_email', 'adminwmt@gmail.com'),
('sys', 'global', 'site_lang', 'vi'),
('sys', 'global', 'my_domains', 'linhcavali.com'),
('sys', 'global', 'cookie_prefix', 'nv4'),
('sys', 'global', 'session_prefix', 'nv4s_u5U160'),
('sys', 'global', 'site_timezone', 'byCountry'),
('sys', 'global', 'proxy_blocker', '0'),
('sys', 'global', 'str_referer_blocker', '0'),
('sys', 'global', 'lang_multi', '1'),
('sys', 'global', 'lang_geo', '0'),
('sys', 'global', 'ftp_server', 'localhost'),
('sys', 'global', 'ftp_port', '21'),
('sys', 'global', 'ftp_user_name', ''),
('sys', 'global', 'ftp_user_pass', '4zqat0Im6ngQzhQ4fK3FUQ,,'),
('sys', 'global', 'ftp_path', '/'),
('sys', 'global', 'ftp_check_login', '0'),
('vi', 'shops', 'image_size', '500x500'),
('vi', 'shops', 'home_data', 'all'),
('vi', 'shops', 'home_view', 'viewgrid'),
('vi', 'shops', 'per_page', '20'),
('vi', 'shops', 'per_row', '3'),
('vi', 'shops', 'money_unit', 'VND'),
('vi', 'shops', 'weight_unit', 'g'),
('vi', 'shops', 'post_auto_member', '0'),
('vi', 'shops', 'auto_check_order', '1'),
('vi', 'shops', 'format_order_id', 'S%06s'),
('vi', 'shops', 'format_code_id', 'S%06s'),
('vi', 'shops', 'facebookappid', ''),
('vi', 'shops', 'active_guest_order', '1'),
('vi', 'shops', 'active_showhomtext', '1'),
('vi', 'shops', 'active_order', '1'),
('vi', 'shops', 'active_order_popup', '1'),
('vi', 'shops', 'active_order_non_detail', '1'),
('vi', 'shops', 'active_price', '1'),
('vi', 'shops', 'active_order_number', '0'),
('vi', 'shops', 'order_day', '0'),
('vi', 'shops', 'order_nexttime', '0'),
('vi', 'shops', 'active_payment', '1'),
('vi', 'shops', 'groups_price', '3'),
('vi', 'shops', 'active_tooltip', '1'),
('vi', 'shops', 'timecheckstatus', '0'),
('vi', 'shops', 'show_product_code', '1'),
('vi', 'shops', 'show_compare', '0'),
('vi', 'shops', 'show_displays', '1'),
('vi', 'shops', 'use_shipping', '0'),
('vi', 'shops', 'use_coupons', '0'),
('vi', 'shops', 'active_wishlist', '1'),
('vi', 'shops', 'active_gift', '1'),
('vi', 'shops', 'active_warehouse', '1'),
('vi', 'shops', 'tags_alias', '0'),
('vi', 'shops', 'auto_tags', '1'),
('vi', 'shops', 'tags_remind', '0'),
('vi', 'shops', 'point_active', '0'),
('vi', 'shops', 'point_conversion', '0'),
('vi', 'shops', 'point_new_order', '0'),
('vi', 'shops', 'money_to_point', '0'),
('vi', 'shops', 'review_active', '1'),
('vi', 'shops', 'review_check', '1'),
('vi', 'shops', 'review_captcha', '1'),
('vi', 'shops', 'group_price', ''),
('vi', 'shops', 'groups_notify', '3'),
('vi', 'shops', 'template_active', '1'),
('vi', 'shops', 'download_active', '1'),
('vi', 'shops', 'download_groups', '6'),
('vi', 'shops', 'saleprice_active', '1'),
('vi', 'shops', 'sortdefault', '0'),
('vi', 'shops', 'alias_lower', '1'),
('vi', 'shops', 'auto_postcomm', '1'),
('vi', 'shops', 'allowed_comm', '-1'),
('vi', 'shops', 'view_comm', '6'),
('vi', 'shops', 'setcomm', '4'),
('vi', 'shops', 'activecomm', '1'),
('vi', 'shops', 'emailcomm', '0'),
('vi', 'shops', 'adminscomm', ''),
('vi', 'shops', 'sortcomm', '0'),
('vi', 'shops', 'captcha', '1'),
('vi', 'shops', 'allowattachcomm', '0'),
('vi', 'shops', 'alloweditorcomm', '0'),
('vi', 'shops', 'captcha_area_comm', '1'),
('vi', 'shops', 'captcha_type_comm', 'captcha'),
('vi', 'shops', 'captcha_type', 'captcha'),
('en', 'global', 'site_domain', ''),
('en', 'global', 'site_name', 'NukeViet CMS 4.x'),
('en', 'global', 'site_logo', ''),
('en', 'global', 'site_banner', ''),
('en', 'global', 'site_favicon', ''),
('en', 'global', 'site_description', 'Sharing success, connect passions'),
('en', 'global', 'site_keywords', ''),
('en', 'global', 'theme_type', 'r,d,m'),
('en', 'global', 'site_theme', 'default'),
('en', 'global', 'preview_theme', ''),
('en', 'global', 'user_allowed_theme', ''),
('en', 'global', 'mobile_theme', 'mobile_default'),
('en', 'global', 'site_home_module', 'news'),
('en', 'global', 'switch_mobi_des', '1'),
('en', 'global', 'upload_logo', ''),
('en', 'global', 'upload_logo_pos', 'bottomRight'),
('en', 'global', 'autologosize1', '50'),
('en', 'global', 'autologosize2', '40'),
('en', 'global', 'autologosize3', '30'),
('en', 'global', 'autologomod', ''),
('en', 'global', 'tinify_active', '0'),
('en', 'global', 'tinify_api', ''),
('en', 'global', 'name_show', '1'),
('en', 'global', 'disable_site_content', 'For technical reasons Web site temporary not available. we are very sorry for that inconvenience!'),
('en', 'global', 'opensearch_link', ''),
('en', 'about', 'auto_postcomm', '1'),
('en', 'about', 'allowed_comm', '-1'),
('en', 'about', 'view_comm', '6'),
('en', 'about', 'setcomm', '4'),
('en', 'about', 'activecomm', '0'),
('en', 'about', 'emailcomm', '0'),
('en', 'about', 'adminscomm', ''),
('en', 'about', 'sortcomm', '0'),
('en', 'about', 'captcha_area_comm', '1'),
('en', 'about', 'perpagecomm', '5'),
('en', 'about', 'timeoutcomm', '360'),
('en', 'about', 'allowattachcomm', '0'),
('en', 'about', 'alloweditorcomm', '0'),
('sys', 'global', 'check_zaloip_expired', '0'),
('en', 'news', 'indexfile', 'viewcat_main_right'),
('en', 'news', 'mobile_indexfile', 'viewcat_page_new'),
('en', 'news', 'per_page', '20'),
('en', 'news', 'st_links', '10'),
('en', 'news', 'homewidth', '100'),
('en', 'news', 'homeheight', '150'),
('en', 'news', 'blockwidth', '70'),
('en', 'news', 'blockheight', '75'),
('en', 'news', 'imagefull', '460'),
('en', 'news', 'copyright', 'Note: The above article reprinted at the website or other media sources not specify the source http://nukeviet.vn is copyright infringement'),
('en', 'news', 'showtooltip', '1'),
('en', 'news', 'tooltip_position', 'bottom'),
('en', 'news', 'tooltip_length', '150'),
('en', 'news', 'showhometext', '1'),
('en', 'news', 'timecheckstatus', '0'),
('en', 'news', 'config_source', '0'),
('en', 'news', 'show_no_image', ''),
('en', 'news', 'allowed_rating', '1'),
('en', 'news', 'allowed_rating_point', '1'),
('en', 'news', 'facebookappid', ''),
('en', 'news', 'socialbutton', 'facebook,twitter'),
('en', 'news', 'alias_lower', '1'),
('en', 'news', 'tags_alias', '0'),
('en', 'news', 'auto_tags', '0'),
('en', 'news', 'tags_remind', '1'),
('en', 'news', 'keywords_tag', '1'),
('en', 'news', 'copy_news', '0'),
('en', 'news', 'structure_upload', 'Ym'),
('en', 'news', 'imgposition', '2'),
('en', 'news', 'htmlhometext', '0'),
('en', 'news', 'order_articles', '0'),
('en', 'news', 'identify_cat_change', '0'),
('en', 'news', 'active_history', '0'),
('en', 'news', 'elas_use', '0'),
('en', 'news', 'elas_host', ''),
('en', 'news', 'elas_port', '9200'),
('en', 'news', 'elas_index', ''),
('en', 'news', 'instant_articles_active', '0'),
('en', 'news', 'instant_articles_template', 'default'),
('en', 'news', 'instant_articles_httpauth', '0'),
('en', 'news', 'instant_articles_username', ''),
('en', 'news', 'instant_articles_password', ''),
('en', 'news', 'instant_articles_livetime', '60'),
('en', 'news', 'instant_articles_gettime', '120'),
('en', 'news', 'instant_articles_auto', '1'),
('en', 'news', 'auto_postcomm', '1'),
('en', 'news', 'allowed_comm', '-1'),
('en', 'news', 'view_comm', '6'),
('en', 'news', 'setcomm', '4'),
('en', 'news', 'activecomm', '1'),
('en', 'news', 'emailcomm', '0'),
('en', 'news', 'adminscomm', ''),
('en', 'news', 'sortcomm', '0'),
('en', 'news', 'captcha_area_comm', '1'),
('en', 'news', 'perpagecomm', '5'),
('en', 'news', 'timeoutcomm', '360'),
('en', 'news', 'allowattachcomm', '0'),
('en', 'news', 'alloweditorcomm', '0'),
('en', 'news', 'frontend_edit_alias', '0'),
('en', 'news', 'frontend_edit_layout', '1'),
('en', 'news', 'captcha_type', 'captcha'),
('en', 'news', 'report_active', '1'),
('en', 'news', 'report_group', '4'),
('en', 'news', 'report_limit', '2'),
('en', 'contact', 'bodytext', ''),
('en', 'contact', 'sendcopymode', '0'),
('en', 'contact', 'captcha_type', 'captcha'),
('en', 'voting', 'difftimeout', '3600'),
('en', 'voting', 'captcha_type', 'captcha'),
('en', 'page', 'auto_postcomm', '1'),
('en', 'page', 'allowed_comm', '-1'),
('en', 'page', 'view_comm', '6'),
('en', 'page', 'setcomm', '4'),
('en', 'page', 'activecomm', '1'),
('en', 'page', 'emailcomm', '0'),
('en', 'page', 'adminscomm', ''),
('en', 'page', 'sortcomm', '0'),
('en', 'page', 'captcha_area_comm', '1'),
('en', 'page', 'perpagecomm', '5'),
('en', 'page', 'timeoutcomm', '360'),
('en', 'page', 'allowattachcomm', '0'),
('en', 'page', 'alloweditorcomm', '0'),
('en', 'comment', 'captcha_type', 'captcha'),
('en', 'siteterms', 'auto_postcomm', '1'),
('en', 'siteterms', 'allowed_comm', '-1'),
('en', 'siteterms', 'view_comm', '6'),
('en', 'siteterms', 'setcomm', '4'),
('en', 'siteterms', 'activecomm', '1'),
('en', 'siteterms', 'emailcomm', '0'),
('en', 'siteterms', 'adminscomm', ''),
('en', 'siteterms', 'sortcomm', '0'),
('en', 'siteterms', 'captcha_area_comm', '1'),
('en', 'siteterms', 'perpagecomm', '5'),
('en', 'siteterms', 'timeoutcomm', '360'),
('en', 'siteterms', 'allowattachcomm', '0'),
('en', 'siteterms', 'alloweditorcomm', '0'),
('en', 'freecontent', 'next_execute', '0');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_cookies`
--

CREATE TABLE IF NOT EXISTS `hn4_cookies` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `domain` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `expires` int(11) NOT NULL DEFAULT '0',
  `secure` tinyint(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `cookiename` (`name`,`domain`,`path`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_counter`
--

CREATE TABLE IF NOT EXISTS `hn4_counter` (
  `c_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_val` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_update` int(11) NOT NULL DEFAULT '0',
  `c_count` int(11) unsigned NOT NULL DEFAULT '0',
  `vi_count` int(11) unsigned NOT NULL DEFAULT '0',
  `en_count` int(11) DEFAULT '0',
  UNIQUE KEY `c_type` (`c_type`,`c_val`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_counter`
--

INSERT INTO `hn4_counter` (`c_type`, `c_val`, `last_update`, `c_count`, `vi_count`, `en_count`) VALUES
('c_time', 'start', 0, 0, 0, 0),
('c_time', 'last', 0, 1679058305, 0, 0),
('total', 'hits', 1679058305, 982, 982, 0),
('year', '2023', 1679058305, 982, 982, 0),
('year', '2024', 0, 0, 0, 0),
('year', '2025', 0, 0, 0, 0),
('year', '2026', 0, 0, 0, 0),
('year', '2027', 0, 0, 0, 0),
('year', '2028', 0, 0, 0, 0),
('year', '2029', 0, 0, 0, 0),
('year', '2030', 0, 0, 0, 0),
('year', '2031', 0, 0, 0, 0),
('month', 'Jan', 0, 0, 0, 0),
('month', 'Feb', 1677602364, 283, 283, 0),
('month', 'Mar', 1679058305, 699, 699, 0),
('month', 'Apr', 0, 0, 0, 0),
('month', 'May', 0, 0, 0, 0),
('month', 'Jun', 0, 0, 0, 0),
('month', 'Jul', 0, 0, 0, 0),
('month', 'Aug', 0, 0, 0, 0),
('month', 'Sep', 0, 0, 0, 0),
('month', 'Oct', 0, 0, 0, 0),
('month', 'Nov', 0, 0, 0, 0),
('month', 'Dec', 0, 0, 0, 0),
('day', '01', 1677683012, 74, 74, 0),
('day', '02', 1677775337, 25, 25, 0),
('day', '03', 1677861487, 35, 35, 0),
('day', '04', 1677948716, 40, 40, 0),
('day', '05', 1678035570, 50, 50, 0),
('day', '06', 1678121735, 38, 38, 0),
('day', '07', 1678205120, 32, 32, 0),
('day', '08', 1678287196, 36, 36, 0),
('day', '09', 1678376322, 42, 42, 0),
('day', '10', 1678460753, 47, 47, 0),
('day', '11', 1678550053, 28, 28, 0),
('day', '12', 1678628900, 36, 36, 0),
('day', '13', 1678723026, 31, 31, 0),
('day', '14', 1678812948, 27, 27, 0),
('day', '15', 1678895829, 115, 115, 0),
('day', '16', 1678985535, 28, 28, 0),
('day', '17', 1679058305, 15, 15, 0),
('day', '18', 1676738320, 0, 0, 0),
('day', '19', 1676813809, 0, 0, 0),
('day', '20', 1676910797, 0, 0, 0),
('day', '21', 1676962198, 0, 0, 0),
('day', '22', 1677077005, 0, 0, 0),
('day', '23', 1677149919, 0, 0, 0),
('day', '24', 1677245469, 0, 0, 0),
('day', '25', 1677340591, 0, 0, 0),
('day', '26', 1677425332, 0, 0, 0),
('day', '27', 1677514615, 0, 0, 0),
('day', '28', 1677602364, 0, 0, 0),
('day', '29', 0, 0, 0, 0),
('day', '30', 0, 0, 0, 0),
('day', '31', 0, 0, 0, 0),
('dayofweek', 'Sunday', 1678628900, 142, 142, 0),
('dayofweek', 'Monday', 1678723026, 127, 127, 0),
('dayofweek', 'Tuesday', 1678812948, 99, 99, 0),
('dayofweek', 'Wednesday', 1678895829, 238, 238, 0),
('dayofweek', 'Thursday', 1678985535, 105, 105, 0),
('dayofweek', 'Friday', 1679058305, 134, 134, 0),
('dayofweek', 'Saturday', 1678550053, 137, 137, 0),
('hour', '00', 1678901124, 0, 0, 0),
('hour', '01', 1678991124, 1, 1, 0),
('hour', '02', 1678996207, 2, 2, 0),
('hour', '03', 1678825552, 0, 0, 0),
('hour', '04', 1678915128, 0, 0, 0),
('hour', '05', 1678920438, 0, 0, 0),
('hour', '06', 1678924445, 0, 0, 0),
('hour', '07', 1679014793, 2, 2, 0),
('hour', '08', 1678844917, 0, 0, 0),
('hour', '09', 1678933641, 0, 0, 0),
('hour', '10', 1678851873, 0, 0, 0),
('hour', '11', 1678769641, 0, 0, 0),
('hour', '12', 1678942922, 0, 0, 0),
('hour', '13', 1679035454, 2, 2, 0),
('hour', '14', 1678693923, 0, 0, 0),
('hour', '15', 1679042123, 1, 1, 0),
('hour', '16', 1678960363, 0, 0, 0),
('hour', '17', 1678877394, 0, 0, 0),
('hour', '18', 1679054320, 5, 5, 0),
('hour', '19', 1678970017, 0, 0, 0),
('hour', '20', 1679058305, 2, 2, 0),
('hour', '21', 1678890969, 0, 0, 0),
('hour', '22', 1678980501, 0, 0, 0),
('hour', '23', 1678985535, 0, 0, 0),
('bot', 'googlebot', 1679052347, 66, 66, 0),
('bot', 'msnbot', 0, 0, 0, 0),
('bot', 'bingbot', 0, 0, 0, 0),
('bot', 'yahooslurp', 0, 0, 0, 0),
('bot', 'w3cvalidator', 0, 0, 0, 0),
('bot', 'coccocbot', 0, 0, 0, 0),
('browser', 'opera', 0, 0, 0, 0),
('browser', 'operamini', 0, 0, 0, 0),
('browser', 'webtv', 0, 0, 0, 0),
('browser', 'explorer', 1678502588, 5, 5, 0),
('browser', 'edge', 1678832479, 8, 8, 0),
('browser', 'pocket', 0, 0, 0, 0),
('browser', 'konqueror', 0, 0, 0, 0),
('browser', 'icab', 0, 0, 0, 0),
('browser', 'omniweb', 0, 0, 0, 0),
('browser', 'firebird', 0, 0, 0, 0),
('browser', 'firefox', 1678906189, 40, 40, 0),
('browser', 'iceweasel', 0, 0, 0, 0),
('browser', 'shiretoko', 0, 0, 0, 0),
('browser', 'mozilla', 1679034216, 36, 36, 0),
('browser', 'amaya', 0, 0, 0, 0),
('browser', 'lynx', 0, 0, 0, 0),
('browser', 'safari', 1678838195, 6, 6, 0),
('browser', 'iphone', 1678901124, 34, 34, 0),
('browser', 'ipod', 1678821963, 7, 7, 0),
('browser', 'ipad', 0, 0, 0, 0),
('browser', 'chrome', 1679058305, 688, 688, 0),
('browser', 'coccoc', 0, 0, 0, 0),
('browser', 'coccocbot', 0, 0, 0, 0),
('browser', 'android', 1678600793, 1, 1, 0),
('browser', 'googlebot', 1679052347, 66, 66, 0),
('browser', 'yahooslurp', 0, 0, 0, 0),
('browser', 'w3cvalidator', 0, 0, 0, 0),
('browser', 'blackberry', 0, 0, 0, 0),
('browser', 'icecat', 0, 0, 0, 0),
('browser', 'nokias60', 0, 0, 0, 0),
('browser', 'nokia', 0, 0, 0, 0),
('browser', 'msn', 0, 0, 0, 0),
('browser', 'msnbot', 0, 0, 0, 0),
('browser', 'bingbot', 0, 0, 0, 0),
('browser', 'netscape', 0, 0, 0, 0),
('browser', 'galeon', 0, 0, 0, 0),
('browser', 'netpositive', 0, 0, 0, 0),
('browser', 'phoenix', 0, 0, 0, 0),
('browser', 'Mobile', 0, 0, 0, 0),
('browser', 'bots', 1678890789, 56, 56, 0),
('browser', 'Unknown', 1678851873, 31, 31, 0),
('os', 'unknown', 1679054320, 272, 272, 0),
('os', 'win', 1678717543, 8, 8, 0),
('os', 'win10', 1679054081, 339, 339, 0),
('os', 'win8', 1678389970, 13, 13, 0),
('os', 'win7', 1678683071, 15, 15, 0),
('os', 'win2003', 0, 0, 0, 0),
('os', 'winvista', 1677553593, 2, 2, 0),
('os', 'wince', 0, 0, 0, 0),
('os', 'winxp', 1678502588, 6, 6, 0),
('os', 'win2000', 0, 0, 0, 0),
('os', 'apple', 1678849977, 76, 76, 0),
('os', 'linux', 1679058305, 59, 59, 0),
('os', 'os2', 0, 0, 0, 0),
('os', 'beos', 0, 0, 0, 0),
('os', 'iphone', 1678901124, 42, 42, 0),
('os', 'ipod', 1678821963, 7, 7, 0),
('os', 'ipad', 1678274775, 3, 3, 0),
('os', 'blackberry', 0, 0, 0, 0),
('os', 'nokia', 0, 0, 0, 0),
('os', 'freebsd', 0, 0, 0, 0),
('os', 'openbsd', 1676808487, 1, 1, 0),
('os', 'netbsd', 0, 0, 0, 0),
('os', 'sunos', 0, 0, 0, 0),
('os', 'opensolaris', 0, 0, 0, 0),
('os', 'android', 1678959033, 123, 123, 0),
('os', 'irix', 0, 0, 0, 0),
('os', 'palm', 0, 0, 0, 0),
('country', 'AD', 0, 0, 0, 0),
('country', 'AE', 0, 0, 0, 0),
('country', 'AF', 0, 0, 0, 0),
('country', 'AG', 0, 0, 0, 0),
('country', 'AI', 0, 0, 0, 0),
('country', 'AL', 0, 0, 0, 0),
('country', 'AM', 1677855015, 1, 1, 0),
('country', 'AN', 0, 0, 0, 0),
('country', 'AO', 0, 0, 0, 0),
('country', 'AQ', 0, 0, 0, 0),
('country', 'AR', 0, 0, 0, 0),
('country', 'AS', 0, 0, 0, 0),
('country', 'AT', 1676733832, 1, 1, 0),
('country', 'AU', 1677843773, 1, 1, 0),
('country', 'AW', 0, 0, 0, 0),
('country', 'AZ', 0, 0, 0, 0),
('country', 'BA', 0, 0, 0, 0),
('country', 'BB', 0, 0, 0, 0),
('country', 'BD', 1677319952, 1, 1, 0),
('country', 'BE', 1677132943, 2, 2, 0),
('country', 'BF', 0, 0, 0, 0),
('country', 'BG', 1678621052, 1, 1, 0),
('country', 'BH', 0, 0, 0, 0),
('country', 'BI', 0, 0, 0, 0),
('country', 'BJ', 0, 0, 0, 0),
('country', 'BM', 0, 0, 0, 0),
('country', 'BN', 0, 0, 0, 0),
('country', 'BO', 0, 0, 0, 0),
('country', 'BR', 1677638204, 2, 2, 0),
('country', 'BS', 0, 0, 0, 0),
('country', 'BT', 0, 0, 0, 0),
('country', 'BW', 0, 0, 0, 0),
('country', 'BY', 0, 0, 0, 0),
('country', 'BZ', 1677302512, 1, 1, 0),
('country', 'CA', 1678851873, 32, 32, 0),
('country', 'CD', 0, 0, 0, 0),
('country', 'CF', 0, 0, 0, 0),
('country', 'CG', 0, 0, 0, 0),
('country', 'CH', 0, 0, 0, 0),
('country', 'CI', 0, 0, 0, 0),
('country', 'CK', 0, 0, 0, 0),
('country', 'CL', 0, 0, 0, 0),
('country', 'CM', 0, 0, 0, 0),
('country', 'CN', 1678774308, 35, 35, 0),
('country', 'CO', 0, 0, 0, 0),
('country', 'CR', 0, 0, 0, 0),
('country', 'CS', 0, 0, 0, 0),
('country', 'CU', 0, 0, 0, 0),
('country', 'CV', 0, 0, 0, 0),
('country', 'CY', 0, 0, 0, 0),
('country', 'CZ', 1678920438, 5, 5, 0),
('country', 'DE', 1678991124, 10, 10, 0),
('country', 'DJ', 0, 0, 0, 0),
('country', 'DK', 0, 0, 0, 0),
('country', 'DM', 0, 0, 0, 0),
('country', 'DO', 0, 0, 0, 0),
('country', 'DZ', 0, 0, 0, 0),
('country', 'EC', 1678034777, 1, 1, 0),
('country', 'EE', 0, 0, 0, 0),
('country', 'EG', 0, 0, 0, 0),
('country', 'ER', 0, 0, 0, 0),
('country', 'ES', 1677494752, 1, 1, 0),
('country', 'ET', 0, 0, 0, 0),
('country', 'EU', 0, 0, 0, 0),
('country', 'FI', 0, 0, 0, 0),
('country', 'FJ', 0, 0, 0, 0),
('country', 'FK', 0, 0, 0, 0),
('country', 'FM', 0, 0, 0, 0),
('country', 'FO', 0, 0, 0, 0),
('country', 'FR', 1679034216, 22, 22, 0),
('country', 'GA', 0, 0, 0, 0),
('country', 'GB', 1677553593, 7, 7, 0),
('country', 'GD', 0, 0, 0, 0),
('country', 'GE', 0, 0, 0, 0),
('country', 'GF', 0, 0, 0, 0),
('country', 'GH', 0, 0, 0, 0),
('country', 'GI', 0, 0, 0, 0),
('country', 'GL', 0, 0, 0, 0),
('country', 'GM', 0, 0, 0, 0),
('country', 'GN', 0, 0, 0, 0),
('country', 'GP', 0, 0, 0, 0),
('country', 'GQ', 0, 0, 0, 0),
('country', 'GR', 1677212978, 6, 6, 0),
('country', 'GS', 0, 0, 0, 0),
('country', 'GT', 0, 0, 0, 0),
('country', 'GU', 0, 0, 0, 0),
('country', 'GW', 0, 0, 0, 0),
('country', 'GY', 0, 0, 0, 0),
('country', 'HK', 1678034779, 2, 2, 0),
('country', 'HN', 1678825140, 7, 7, 0),
('country', 'HR', 0, 0, 0, 0),
('country', 'HT', 0, 0, 0, 0),
('country', 'HU', 0, 0, 0, 0),
('country', 'ID', 0, 0, 0, 0),
('country', 'IE', 1678740593, 5, 5, 0),
('country', 'IL', 0, 0, 0, 0),
('country', 'IN', 1676625972, 1, 1, 0),
('country', 'IO', 0, 0, 0, 0),
('country', 'IQ', 0, 0, 0, 0),
('country', 'IR', 0, 0, 0, 0),
('country', 'IS', 0, 0, 0, 0),
('country', 'IT', 0, 0, 0, 0),
('country', 'JM', 0, 0, 0, 0),
('country', 'JO', 0, 0, 0, 0),
('country', 'JP', 1678768368, 2, 2, 0),
('country', 'KE', 0, 0, 0, 0),
('country', 'KG', 0, 0, 0, 0),
('country', 'KH', 0, 0, 0, 0),
('country', 'KI', 0, 0, 0, 0),
('country', 'KM', 0, 0, 0, 0),
('country', 'KN', 0, 0, 0, 0),
('country', 'KR', 1678407582, 3, 3, 0),
('country', 'KW', 0, 0, 0, 0),
('country', 'KY', 0, 0, 0, 0),
('country', 'KZ', 0, 0, 0, 0),
('country', 'LA', 0, 0, 0, 0),
('country', 'LB', 0, 0, 0, 0),
('country', 'LC', 0, 0, 0, 0),
('country', 'LI', 0, 0, 0, 0),
('country', 'LK', 0, 0, 0, 0),
('country', 'LR', 0, 0, 0, 0),
('country', 'LS', 0, 0, 0, 0),
('country', 'LT', 0, 0, 0, 0),
('country', 'LU', 0, 0, 0, 0),
('country', 'LV', 0, 0, 0, 0),
('country', 'LY', 0, 0, 0, 0),
('country', 'MA', 0, 0, 0, 0),
('country', 'MC', 0, 0, 0, 0),
('country', 'MD', 0, 0, 0, 0),
('country', 'MG', 0, 0, 0, 0),
('country', 'MH', 0, 0, 0, 0),
('country', 'MK', 0, 0, 0, 0),
('country', 'ML', 0, 0, 0, 0),
('country', 'MM', 0, 0, 0, 0),
('country', 'MN', 0, 0, 0, 0),
('country', 'MO', 0, 0, 0, 0),
('country', 'MP', 0, 0, 0, 0),
('country', 'MQ', 0, 0, 0, 0),
('country', 'MR', 0, 0, 0, 0),
('country', 'MT', 0, 0, 0, 0),
('country', 'MU', 0, 0, 0, 0),
('country', 'MV', 0, 0, 0, 0),
('country', 'MW', 0, 0, 0, 0),
('country', 'MX', 0, 0, 0, 0),
('country', 'MY', 0, 0, 0, 0),
('country', 'MZ', 0, 0, 0, 0),
('country', 'NA', 0, 0, 0, 0),
('country', 'NC', 0, 0, 0, 0),
('country', 'NE', 0, 0, 0, 0),
('country', 'NF', 0, 0, 0, 0),
('country', 'NG', 0, 0, 0, 0),
('country', 'NI', 0, 0, 0, 0),
('country', 'NL', 1678408082, 4, 4, 0),
('country', 'NO', 1677985905, 2, 2, 0),
('country', 'NP', 0, 0, 0, 0),
('country', 'NR', 0, 0, 0, 0),
('country', 'NU', 0, 0, 0, 0),
('country', 'NZ', 0, 0, 0, 0),
('country', 'OM', 0, 0, 0, 0),
('country', 'PA', 0, 0, 0, 0),
('country', 'PE', 0, 0, 0, 0),
('country', 'PF', 0, 0, 0, 0),
('country', 'PG', 0, 0, 0, 0),
('country', 'PH', 0, 0, 0, 0),
('country', 'PK', 0, 0, 0, 0),
('country', 'PL', 0, 0, 0, 0),
('country', 'PR', 0, 0, 0, 0),
('country', 'PS', 0, 0, 0, 0),
('country', 'PT', 0, 0, 0, 0),
('country', 'PW', 0, 0, 0, 0),
('country', 'PY', 0, 0, 0, 0),
('country', 'QA', 0, 0, 0, 0),
('country', 'RE', 0, 0, 0, 0),
('country', 'RO', 0, 0, 0, 0),
('country', 'RU', 1678709184, 6, 6, 0),
('country', 'RW', 0, 0, 0, 0),
('country', 'SA', 0, 0, 0, 0),
('country', 'SB', 0, 0, 0, 0),
('country', 'SC', 0, 0, 0, 0),
('country', 'SD', 0, 0, 0, 0),
('country', 'SE', 1678879759, 12, 12, 0),
('country', 'SG', 1678874501, 6, 6, 0),
('country', 'SI', 0, 0, 0, 0),
('country', 'SK', 0, 0, 0, 0),
('country', 'SL', 0, 0, 0, 0),
('country', 'SM', 0, 0, 0, 0),
('country', 'SN', 0, 0, 0, 0),
('country', 'SO', 0, 0, 0, 0),
('country', 'SR', 0, 0, 0, 0),
('country', 'ST', 0, 0, 0, 0),
('country', 'SV', 0, 0, 0, 0),
('country', 'SY', 0, 0, 0, 0),
('country', 'SZ', 0, 0, 0, 0),
('country', 'TD', 0, 0, 0, 0),
('country', 'TF', 0, 0, 0, 0),
('country', 'TG', 0, 0, 0, 0),
('country', 'TH', 0, 0, 0, 0),
('country', 'TJ', 0, 0, 0, 0),
('country', 'TK', 0, 0, 0, 0),
('country', 'TL', 0, 0, 0, 0),
('country', 'TM', 0, 0, 0, 0),
('country', 'TN', 0, 0, 0, 0),
('country', 'TO', 0, 0, 0, 0),
('country', 'TR', 0, 0, 0, 0),
('country', 'TT', 0, 0, 0, 0),
('country', 'TV', 0, 0, 0, 0),
('country', 'TW', 0, 0, 0, 0),
('country', 'TZ', 0, 0, 0, 0),
('country', 'UA', 1678876683, 14, 14, 0),
('country', 'UG', 0, 0, 0, 0),
('country', 'US', 1679052347, 445, 445, 0),
('country', 'UY', 0, 0, 0, 0),
('country', 'UZ', 0, 0, 0, 0),
('country', 'VA', 0, 0, 0, 0),
('country', 'VC', 0, 0, 0, 0),
('country', 'VE', 0, 0, 0, 0),
('country', 'VG', 0, 0, 0, 0),
('country', 'VI', 0, 0, 0, 0),
('country', 'VN', 1679058305, 337, 337, 0),
('country', 'VU', 0, 0, 0, 0),
('country', 'WS', 0, 0, 0, 0),
('country', 'YE', 0, 0, 0, 0),
('country', 'YT', 0, 0, 0, 0),
('country', 'YU', 0, 0, 0, 0),
('country', 'ZA', 1678405886, 1, 1, 0),
('country', 'ZM', 0, 0, 0, 0),
('country', 'ZW', 0, 0, 0, 0),
('country', 'ZZ', 1678452873, 6, 6, 0),
('country', 'unkown', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_cronjobs`
--

CREATE TABLE IF NOT EXISTS `hn4_cronjobs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `start_time` int(11) unsigned NOT NULL DEFAULT '0',
  `inter_val` int(11) unsigned NOT NULL DEFAULT '0',
  `inter_val_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: Lặp lại sau thời điểm bắt đầu thực tế, 1:lặp lại sau thời điểm bắt đầu trong CSDL',
  `run_file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `run_func` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_sys` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `last_time` int(11) unsigned NOT NULL DEFAULT '0',
  `last_result` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vi_cron_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `en_cron_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `is_sys` (`is_sys`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `hn4_cronjobs`
--

INSERT INTO `hn4_cronjobs` (`id`, `start_time`, `inter_val`, `inter_val_type`, `run_file`, `run_func`, `params`, `del`, `is_sys`, `act`, `last_time`, `last_result`, `vi_cron_name`, `en_cron_name`) VALUES
(1, 1675986735, 5, 0, 'online_expired_del.php', 'cron_online_expired_del', '', 0, 1, 1, 1679054081, 1, 'Xóa các dòng ghi trạng thái online đã cũ trong CSDL', 'Delete expired online status'),
(2, 1675986735, 1440, 0, 'dump_autobackup.php', 'cron_dump_autobackup', '', 0, 1, 1, 1679043034, 1, 'Tự động lưu CSDL', 'Automatic backup database'),
(3, 1675986735, 60, 0, 'temp_download_destroy.php', 'cron_auto_del_temp_download', '', 0, 1, 1, 1679052347, 1, 'Xóa các file tạm trong thư mục tmp', 'Empty temporary files'),
(4, 1675986735, 30, 0, 'ip_logs_destroy.php', 'cron_del_ip_logs', '', 0, 1, 1, 1679052347, 1, 'Xóa IP log files, Xóa các file nhật ký truy cập', 'Delete IP log files'),
(5, 1675986735, 1440, 0, 'error_log_destroy.php', 'cron_auto_del_error_log', '', 0, 1, 1, 1679043034, 1, 'Xóa các file error_log quá hạn', 'Delete expired error_log log files'),
(6, 1675986735, 360, 0, 'error_log_sendmail.php', 'cron_auto_sendmail_error_log', '', 0, 1, 0, 0, 0, 'Gửi email các thông báo lỗi cho admin', 'Send error logs to admin'),
(7, 1675986735, 60, 0, 'ref_expired_del.php', 'cron_ref_expired_del', '', 0, 1, 1, 1679052347, 1, 'Xóa các referer quá hạn', 'Delete expired referer'),
(8, 1675986735, 60, 0, 'check_version.php', 'cron_auto_check_version', '', 0, 1, 1, 1679052347, 1, 'Kiểm tra phiên bản NukeViet', 'Check NukeViet version'),
(9, 1675986735, 1440, 0, 'notification_autodel.php', 'cron_notification_autodel', '', 0, 1, 1, 1679043034, 1, 'Xóa thông báo cũ', 'Delete old notification'),
(10, 1675986735, 1440, 0, 'remove_expired_push.php', 'cron_remove_expired_push', '', 0, 1, 1, 1679043034, 1, 'Xóa thông báo đẩy quá hạn', 'Remove expired push-notifications'),
(11, 1675986735, 60, 0, 'apilogs_autodel.php', 'cron_apilogs_autodel', '', 0, 1, 1, 1679052347, 1, 'Xóa các API-log hết hạn', 'Remove expired API-logs');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_about`
--

CREATE TABLE IF NOT EXISTS `hn4_en_about` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imagealt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `socialbutton` tinyint(4) NOT NULL DEFAULT '0',
  `activecomm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot_post` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_en_about`
--

INSERT INTO `hn4_en_about` (`id`, `title`, `alias`, `image`, `imagealt`, `imageposition`, `description`, `bodytext`, `keywords`, `socialbutton`, `activecomm`, `layout_func`, `weight`, `admin_id`, `add_time`, `edit_time`, `status`, `hitstotal`, `hot_post`) VALUES
(1, 'Welcome to NukeViet 3.0', 'Welcome-to-NukeViet-3-0', '', '', 0, '', '<p> NukeViet developed by Vietnamese and for Vietnamese. It&#039;s the 1st opensource CMS in Vietnam. Next generation of NukeViet, version 3.0 coding ground up. Support newest web technology, include xHTML, CSS 3, XTemplate, jQuery, AJAX...<br /> <br /> NukeViet&#039;s has it own core libraries build in. So, it&#039;s doesn&#039;t depend on other exists frameworks. With basic knowledge of PHP and MySQL, you can easily using NukeViet for your purposes.<br /> <br /> NukeViet 3 core is simply but powerful. It support modules can be multiply. We called it abstract modules. It help users automatic crea-te many modules without any line of code from any exists module which support crea-te abstract modules.<br /> <br /> NukeViet 3 support automatic setup modules, blocks, themes at Admin Control Panel. It&#039;s also allow you to share your modules by packed it into packets.<br /> <br /> NukeViet 3 support multi languages in 2 types. Multi interface languages and multi database langguages. Had features support web master to build new languages. Many advance features still developing. Let use it, distribute it and feel about opensource.<br /> <br /> At last, NukeViet 3 is a thanksgiving gift from VINADES.,JSC to community for all of your supports. And we hoping we going to be a biggest opensource CMS not only in VietNam, but also in the world. :).<br /> <br /> If you had any feedbacks and ideas for NukeViet 3 close beta. Feel free to send email to admin@nukeviet.vn. All are welcome<br /> <br /> Best regard.</p>', '', 0, '4', '', 1, 1, 1277266815, 1277266815, 1, 0, 0),
(2, 'NukeViet&#039;s versioning schemes', 'NukeViet-s-versioning-schemes', '', '', 0, '', '<p> NukeViet using 2 versioning schemes:<br /> <br /> I. By numbers (technical purposes):<br /> Structure for numbers is:<br /> major.minor.revision<br /> <br /> 1.Major: Major up-date. Probably not backwards compatible with older version.<br /> 2.Minor: Minor change, may introduce new features, but backwards compatibility is mostly retained.<br /> 3.Revision: Minor bug fixes. Packed for testing or pre-release purposes... Closed beta, open beta, RC, Official release.<br /> <br /> II: By names (new version release management)<br /> Main milestones: Closed beta, Open beta, Release candidate, Official.<br /> 1. Closed beta: Limited testing.<br /> characteristics: New features testing. It may not include in official version if doesn&#039;t accord with community. Closed beta&#039;s name can contain unique numbers. Ex: Closed beta 1, closed beta 2,... Features of previous release may not include in it&#039;s next release. Time release is announced by development team. This milestone stop when system haven&#039;t any major changes.<br /> Purposes: Pre-release version to receive feedbacks and ideas from community. Bug fixes for release version.<br /> Release to: Programmers, expert users.<br /> Supports:<br /> &nbsp;&nbsp;&nbsp; Using: None.<br /> &nbsp;&nbsp;&nbsp; Testing: Documents, not include manual.<br /> Upgrade: None.<br /> <br /> 2. Open beta: Public testing.<br /> characteristics: Features testing, contain full features of official version. It&#039;s almost include in official version even if it doesn&#039;t accord with community. This milestone start after closed beta milestone closed and release weekly to fix bugs. Open beta&#039;s name can contain unique numbers. Ex: Open beta 1, open beta 2,... Next release include all features of it&#039;s previous release. Open beta milestone stop when system haven&#039;t any critical issue.<br /> Purposes: Bug fixed which not detect in closed beta.<br /> Release to: All users of nukeviet.vn forum.<br /> Supports:<br /> &nbsp;&nbsp;&nbsp; Using: Limited. Manual and forum supports.<br /> &nbsp;&nbsp;&nbsp; Testing: Full.<br /> Upgrade: None.<br /> <br /> 3. Release Candidate:<br /> characteristics: Most stable version and prepare for official release. Release candidate&#039;s name can contain unique numbers.<br /> Ex: RC 1, RC 2,... by released number.<br /> If detect cretical issue in this milestone. Another Release Candidate version can be release sooner than release time announced by development team.<br /> Purposes: Reduce bugs of using official version.<br /> Release to: All people.<br /> Supports: Full.<br /> Upgrade: Yes.<br /> <br /> 4. Official:<br /> characteristics: 1st stable release of new version. It only using 1 time. Next release using numbers. Release about 2 weeks after Release Candidate milestone stoped.<br /> Purposes: Stop testing and recommend users using new version.</p>', '', 0, '4', '', 2, 1, 1277267054, 1277693688, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_about_config`
--

CREATE TABLE IF NOT EXISTS `hn4_en_about_config` (
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_about_config`
--

INSERT INTO `hn4_en_about_config` (`config_name`, `config_value`) VALUES
('viewtype', '0'),
('facebookapi', ''),
('per_page', '20'),
('news_first', '0'),
('related_articles', '5'),
('copy_page', '0'),
('alias_lower', '1'),
('socialbutton', 'facebook,twitter');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_blocks_groups`
--

CREATE TABLE IF NOT EXISTS `hn4_en_blocks_groups` (
  `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dtime_type` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `dtime_details` text COLLATE utf8mb4_unicode_ci,
  `active` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `all_func` tinyint(4) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `config` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`bid`),
  KEY `theme` (`theme`),
  KEY `module` (`module`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=33 ;

--
-- Dumping data for table `hn4_en_blocks_groups`
--

INSERT INTO `hn4_en_blocks_groups` (`bid`, `theme`, `module`, `file_name`, `title`, `link`, `template`, `position`, `dtime_type`, `dtime_details`, `active`, `act`, `groups_view`, `all_func`, `weight`, `config`) VALUES
(1, 'default', 'news', 'module.block_newscenter.php', 'Breaking news', '', 'no_title', '[TOP]', 'regular', '[]', '1', 1, '6', 0, 1, 'a:10:{s:6:"numrow";i:6;s:11:"showtooltip";i:1;s:16:"tooltip_position";s:6:"bottom";s:14:"tooltip_length";s:3:"150";s:12:"length_title";i:0;s:15:"length_hometext";i:0;s:17:"length_othertitle";i:60;s:5:"width";i:500;s:6:"height";i:0;s:7:"nocatid";a:0:{}}'),
(2, 'default', 'banners', 'global.banners.php', 'Center Banner', '', 'no_title', '[TOP]', 'regular', '[]', '1', 1, '6', 0, 2, 'a:1:{s:12:"idplanbanner";i:1;}'),
(3, 'default', 'news', 'global.block_category.php', 'Category', '', 'no_title', '[LEFT]', 'regular', '[]', '1', 1, '6', 0, 1, 'a:2:{s:5:"catid";i:0;s:12:"title_length";i:0;}'),
(4, 'default', 'theme', 'global.module_menu.php', 'Module Menu', '', 'no_title', '[LEFT]', 'regular', '[]', '1', 1, '6', 0, 2, ''),
(5, 'default', 'banners', 'global.banners.php', 'Left Banner', '', 'no_title', '[LEFT]', 'regular', '[]', '1', 1, '6', 1, 3, 'a:1:{s:12:"idplanbanner";i:2;}'),
(6, 'default', 'statistics', 'global.counter.php', 'Statistics', '', 'primary', '[LEFT]', 'regular', '[]', '1', 1, '6', 1, 4, ''),
(7, 'default', 'about', 'global.about.php', 'About', '', 'border', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(8, 'default', 'banners', 'global.banners.php', 'Right Banner', '', 'no_title', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 2, 'a:1:{s:12:"idplanbanner";i:3;}'),
(9, 'default', 'voting', 'global.voting_random.php', 'Voting', '', 'primary', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 3, ''),
(10, 'default', 'news', 'global.block_tophits.php', 'Top Hits', '', 'primary', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 4, 'a:6:{s:10:"number_day";i:3650;s:6:"numrow";i:10;s:11:"showtooltip";i:1;s:16:"tooltip_position";s:6:"bottom";s:14:"tooltip_length";s:3:"150";s:7:"nocatid";a:2:{i:0;i:10;i:1;i:11;}}'),
(11, 'default', 'theme', 'global.copyright.php', 'Copyright', '', 'no_title', '[FOOTER_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:5:{s:12:"copyright_by";s:0:"";s:13:"copyright_url";s:0:"";s:9:"design_by";s:12:"VINADES.,JSC";s:10:"design_url";s:18:"http://vinades.vn/";s:13:"siteterms_url";s:39:"/index.php?language=en&amp;nv=siteterms";}'),
(12, 'default', 'contact', 'global.contact_form.php', 'Feedback', '', 'no_title', '[FOOTER_SITE]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(13, 'default', 'theme', 'global.QR_code.php', 'QR code', '', 'no_title', '[QR_CODE]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(14, 'default', 'statistics', 'global.counter_button.php', 'Online button', '', 'no_title', '[QR_CODE]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(15, 'default', 'push', 'global.push.php', 'Push-notification', '', 'no_title', '[PERSONALAREA]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(16, 'default', 'users', 'global.user_button.php', 'Member login', '', 'no_title', '[PERSONALAREA]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(17, 'default', 'theme', 'global.company_info.php', 'Managing company', '', 'simple', '[COMPANY_INFO]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:13:{s:12:"company_name";s:51:"Vietnam Open Source Development Joint Stock Company";s:15:"company_address";s:86:"Room 1706 – CT2 Nang Huong building, 583 Nguyen Trai street, Ha Dong, Hanoi, Vietnam";s:16:"company_sortname";s:12:"VINADES.,JSC";s:15:"company_regcode";s:0:"";s:16:"company_regplace";s:0:"";s:21:"company_licensenumber";s:0:"";s:22:"company_responsibility";s:0:"";s:15:"company_showmap";i:1;s:14:"company_mapurl";s:326:"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2634.116366996857!2d105.79399620326203!3d20.9844946314258!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac93055e2f2f%3A0x91f4b423089193dd!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gUGjDoXQgdHJp4buDbiBOZ3Xhu5NuIG3hu58gVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1558315703646!5m2!1svi!2s";s:13:"company_phone";s:58:"+84-24-85872007[+842485872007]|+84-904762534[+84904762534]";s:11:"company_fax";s:15:"+84-24-35500914";s:13:"company_email";s:18:"contact@vinades.vn";s:15:"company_website";s:17:"http://vinades.vn";}'),
(18, 'default', 'menu', 'global.bootstrap.php', 'Menu Site', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:6:"menuid";i:1;s:12:"title_length";i:0;}'),
(19, 'default', 'contact', 'global.contact_default.php', 'Contact Default', '', 'no_title', '[CONTACT_DEFAULT]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(20, 'default', 'theme', 'global.social.php', 'Social icon', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:3:{s:8:"facebook";s:32:"http://www.facebook.com/nukeviet";s:7:"youtube";s:37:"https://www.youtube.com/user/nukeviet";s:7:"twitter";s:28:"https://twitter.com/nukeviet";}'),
(21, 'default', 'theme', 'global.menu_footer.php', 'Main categories', '', 'simple', '[MENU_FOOTER]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:1:{s:14:"module_in_menu";a:8:{i:0;s:5:"about";i:1;s:4:"news";i:2;s:5:"users";i:3;s:7:"contact";i:4;s:6:"voting";i:5;s:7:"banners";i:6;s:4:"seek";i:7;s:5:"feeds";}}'),
(22, 'default', 'freecontent', 'global.free_content.php', 'Introduction', '', 'no_title', '[FEATURED_PRODUCT]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:7:"blockid";i:1;s:7:"numrows";i:2;}'),
(23, 'mobile_default', 'menu', 'global.metismenu.php', 'Menu Site', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:6:"menuid";i:1;s:12:"title_length";i:0;}'),
(24, 'mobile_default', 'push', 'global.push.php', 'Push-notification', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(25, 'mobile_default', 'users', 'global.user_button.php', 'Sign In', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 3, ''),
(26, 'mobile_default', 'contact', 'global.contact_default.php', 'Contact Default', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(27, 'mobile_default', 'contact', 'global.contact_form.php', 'Feedback', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(28, 'mobile_default', 'theme', 'global.social.php', 'Social icon', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 3, 'a:3:{s:8:"facebook";s:32:"http://www.facebook.com/nukeviet";s:7:"youtube";s:37:"https://www.youtube.com/user/nukeviet";s:7:"twitter";s:28:"https://twitter.com/nukeviet";}'),
(29, 'mobile_default', 'theme', 'global.QR_code.php', 'QR code', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 4, ''),
(30, 'mobile_default', 'theme', 'global.copyright.php', 'Copyright', '', 'no_title', '[FOOTER_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:5:{s:12:"copyright_by";s:0:"";s:13:"copyright_url";s:0:"";s:9:"design_by";s:12:"VINADES.,JSC";s:10:"design_url";s:18:"http://vinades.vn/";s:13:"siteterms_url";s:39:"/index.php?language=en&amp;nv=siteterms";}'),
(31, 'mobile_default', 'theme', 'global.menu_footer.php', 'Main categories', '', 'primary', '[MENU_FOOTER]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:1:{s:14:"module_in_menu";a:9:{i:0;s:5:"about";i:1;s:4:"news";i:2;s:5:"users";i:3;s:7:"contact";i:4;s:6:"voting";i:5;s:7:"banners";i:6;s:4:"seek";i:7;s:5:"feeds";i:8;s:9:"siteterms";}}'),
(32, 'mobile_default', 'theme', 'global.company_info.php', 'Managing company', '', 'primary', '[COMPANY_INFO]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:13:{s:12:"company_name";s:51:"Vietnam Open Source Development Joint Stock Company";s:15:"company_address";s:86:"Room 1706 – CT2 Nang Huong building, 583 Nguyen Trai street, Ha Dong, Hanoi, Vietnam";s:16:"company_sortname";s:12:"VINADES.,JSC";s:15:"company_regcode";s:0:"";s:16:"company_regplace";s:0:"";s:21:"company_licensenumber";s:0:"";s:22:"company_responsibility";s:0:"";s:15:"company_showmap";i:1;s:14:"company_mapurl";s:326:"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2634.116366996857!2d105.79399620326203!3d20.9844946314258!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac93055e2f2f%3A0x91f4b423089193dd!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gUGjDoXQgdHJp4buDbiBOZ3Xhu5NuIG3hu58gVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1558315703646!5m2!1svi!2s";s:13:"company_phone";s:58:"+84-24-85872007[+842485872007]|+84-904762534[+84904762534]";s:11:"company_fax";s:15:"+84-24-35500914";s:13:"company_email";s:18:"contact@vinades.vn";s:15:"company_website";s:17:"http://vinades.vn";}');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_blocks_weight`
--

CREATE TABLE IF NOT EXISTS `hn4_en_blocks_weight` (
  `bid` mediumint(8) NOT NULL DEFAULT '0',
  `func_id` mediumint(8) NOT NULL DEFAULT '0',
  `weight` mediumint(8) NOT NULL DEFAULT '0',
  UNIQUE KEY `bid` (`bid`,`func_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_blocks_weight`
--

INSERT INTO `hn4_en_blocks_weight` (`bid`, `func_id`, `weight`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(3, 10, 1),
(3, 11, 1),
(3, 12, 1),
(4, 20, 1),
(4, 21, 1),
(4, 22, 1),
(4, 23, 1),
(4, 24, 1),
(4, 25, 1),
(4, 26, 1),
(4, 27, 1),
(4, 28, 1),
(4, 29, 1),
(4, 30, 1),
(4, 35, 1),
(4, 36, 1),
(4, 37, 1),
(4, 38, 1),
(4, 39, 1),
(4, 40, 1),
(4, 41, 1),
(5, 1, 1),
(5, 2, 1),
(5, 3, 1),
(5, 4, 2),
(5, 5, 2),
(5, 6, 2),
(5, 7, 2),
(5, 8, 2),
(5, 9, 2),
(5, 10, 2),
(5, 11, 2),
(5, 12, 2),
(5, 13, 1),
(5, 14, 1),
(5, 15, 1),
(5, 16, 1),
(5, 17, 1),
(5, 18, 1),
(5, 19, 1),
(5, 20, 2),
(5, 21, 2),
(5, 22, 2),
(5, 23, 2),
(5, 24, 2),
(5, 25, 2),
(5, 26, 2),
(5, 27, 2),
(5, 28, 2),
(5, 29, 2),
(5, 30, 2),
(5, 31, 1),
(5, 32, 1),
(5, 33, 1),
(5, 34, 1),
(5, 35, 2),
(5, 36, 2),
(5, 37, 2),
(5, 38, 2),
(5, 39, 2),
(5, 40, 2),
(5, 41, 2),
(5, 42, 1),
(5, 43, 1),
(5, 44, 1),
(5, 45, 1),
(5, 46, 1),
(5, 47, 1),
(5, 48, 1),
(5, 49, 1),
(5, 50, 1),
(5, 51, 1),
(5, 52, 1),
(5, 53, 1),
(5, 54, 1),
(5, 55, 1),
(5, 56, 1),
(5, 57, 1),
(5, 58, 1),
(5, 59, 1),
(5, 60, 1),
(5, 61, 1),
(5, 62, 1),
(5, 63, 1),
(5, 64, 1),
(5, 65, 1),
(5, 66, 1),
(5, 67, 1),
(5, 68, 1),
(6, 1, 2),
(6, 2, 2),
(6, 3, 2),
(6, 4, 3),
(6, 5, 3),
(6, 6, 3),
(6, 7, 3),
(6, 8, 3),
(6, 9, 3),
(6, 10, 3),
(6, 11, 3),
(6, 12, 3),
(6, 13, 2),
(6, 14, 2),
(6, 15, 2),
(6, 16, 2),
(6, 17, 2),
(6, 18, 2),
(6, 19, 2),
(6, 20, 3),
(6, 21, 3),
(6, 22, 3),
(6, 23, 3),
(6, 24, 3),
(6, 25, 3),
(6, 26, 3),
(6, 27, 3),
(6, 28, 3),
(6, 29, 3),
(6, 30, 3),
(6, 31, 2),
(6, 32, 2),
(6, 33, 2),
(6, 34, 2),
(6, 35, 3),
(6, 36, 3),
(6, 37, 3),
(6, 38, 3),
(6, 39, 3),
(6, 40, 3),
(6, 41, 3),
(6, 42, 2),
(6, 43, 2),
(6, 44, 2),
(6, 45, 2),
(6, 46, 2),
(6, 47, 2),
(6, 48, 2),
(6, 49, 2),
(6, 50, 2),
(6, 51, 2),
(6, 52, 2),
(6, 53, 2),
(6, 54, 2),
(6, 55, 2),
(6, 56, 2),
(6, 57, 2),
(6, 58, 2),
(6, 59, 2),
(6, 60, 2),
(6, 61, 2),
(6, 62, 2),
(6, 63, 2),
(6, 64, 2),
(6, 65, 2),
(6, 66, 2),
(6, 67, 2),
(6, 68, 2),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 4, 1),
(7, 5, 1),
(7, 6, 1),
(7, 7, 1),
(7, 8, 1),
(7, 9, 1),
(7, 10, 1),
(7, 11, 1),
(7, 12, 1),
(7, 13, 1),
(7, 14, 1),
(7, 15, 1),
(7, 16, 1),
(7, 17, 1),
(7, 18, 1),
(7, 19, 1),
(7, 20, 1),
(7, 21, 1),
(7, 22, 1),
(7, 23, 1),
(7, 24, 1),
(7, 25, 1),
(7, 26, 1),
(7, 27, 1),
(7, 28, 1),
(7, 29, 1),
(7, 30, 1),
(7, 31, 1),
(7, 32, 1),
(7, 33, 1),
(7, 34, 1),
(7, 35, 1),
(7, 36, 1),
(7, 37, 1),
(7, 38, 1),
(7, 39, 1),
(7, 40, 1),
(7, 41, 1),
(7, 42, 1),
(7, 43, 1),
(7, 44, 1),
(7, 45, 1),
(7, 46, 1),
(7, 47, 1),
(7, 48, 1),
(7, 49, 1),
(7, 50, 1),
(7, 51, 1),
(7, 52, 1),
(7, 53, 1),
(7, 54, 1),
(7, 55, 1),
(7, 56, 1),
(7, 57, 1),
(7, 58, 1),
(7, 59, 1),
(7, 60, 1),
(7, 61, 1),
(7, 62, 1),
(7, 63, 1),
(7, 64, 1),
(7, 65, 1),
(7, 66, 1),
(7, 67, 1),
(7, 68, 1),
(8, 1, 2),
(8, 2, 2),
(8, 3, 2),
(8, 4, 2),
(8, 5, 2),
(8, 6, 2),
(8, 7, 2),
(8, 8, 2),
(8, 9, 2),
(8, 10, 2),
(8, 11, 2),
(8, 12, 2),
(8, 13, 2),
(8, 14, 2),
(8, 15, 2),
(8, 16, 2),
(8, 17, 2),
(8, 18, 2),
(8, 19, 2),
(8, 20, 2),
(8, 21, 2),
(8, 22, 2),
(8, 23, 2),
(8, 24, 2),
(8, 25, 2),
(8, 26, 2),
(8, 27, 2),
(8, 28, 2),
(8, 29, 2),
(8, 30, 2),
(8, 31, 2),
(8, 32, 2),
(8, 33, 2),
(8, 34, 2),
(8, 35, 2),
(8, 36, 2),
(8, 37, 2),
(8, 38, 2),
(8, 39, 2),
(8, 40, 2),
(8, 41, 2),
(8, 42, 2),
(8, 43, 2),
(8, 44, 2),
(8, 45, 2),
(8, 46, 2),
(8, 47, 2),
(8, 48, 2),
(8, 49, 2),
(8, 50, 2),
(8, 51, 2),
(8, 52, 2),
(8, 53, 2),
(8, 54, 2),
(8, 55, 2),
(8, 56, 2),
(8, 57, 2),
(8, 58, 2),
(8, 59, 2),
(8, 60, 2),
(8, 61, 2),
(8, 62, 2),
(8, 63, 2),
(8, 64, 2),
(8, 65, 2),
(8, 66, 2),
(8, 67, 2),
(8, 68, 2),
(9, 1, 3),
(9, 2, 3),
(9, 3, 3),
(9, 4, 3),
(9, 5, 3),
(9, 6, 3),
(9, 7, 3),
(9, 8, 3),
(9, 9, 3),
(9, 10, 3),
(9, 11, 3),
(9, 12, 3),
(9, 13, 3),
(9, 14, 3),
(9, 15, 3),
(9, 16, 3),
(9, 17, 3),
(9, 18, 3),
(9, 19, 3),
(9, 20, 3),
(9, 21, 3),
(9, 22, 3),
(9, 23, 3),
(9, 24, 3),
(9, 25, 3),
(9, 26, 3),
(9, 27, 3),
(9, 28, 3),
(9, 29, 3),
(9, 30, 3),
(9, 31, 3),
(9, 32, 3),
(9, 33, 3),
(9, 34, 3),
(9, 35, 3),
(9, 36, 3),
(9, 37, 3),
(9, 38, 3),
(9, 39, 3),
(9, 40, 3),
(9, 41, 3),
(9, 42, 3),
(9, 43, 3),
(9, 44, 3),
(9, 45, 3),
(9, 46, 3),
(9, 47, 3),
(9, 48, 3),
(9, 49, 3),
(9, 50, 3),
(9, 51, 3),
(9, 52, 3),
(9, 53, 3),
(9, 54, 3),
(9, 55, 3),
(9, 56, 3),
(9, 57, 3),
(9, 58, 3),
(9, 59, 3),
(9, 60, 3),
(9, 61, 3),
(9, 62, 3),
(9, 63, 3),
(9, 64, 3),
(9, 65, 3),
(9, 66, 3),
(9, 67, 3),
(9, 68, 3),
(10, 1, 4),
(10, 2, 4),
(10, 3, 4),
(10, 4, 4),
(10, 5, 4),
(10, 6, 4),
(10, 7, 4),
(10, 8, 4),
(10, 9, 4),
(10, 10, 4),
(10, 11, 4),
(10, 12, 4),
(10, 13, 4),
(10, 14, 4),
(10, 15, 4),
(10, 16, 4),
(10, 17, 4),
(10, 18, 4),
(10, 19, 4),
(10, 20, 4),
(10, 21, 4),
(10, 22, 4),
(10, 23, 4),
(10, 24, 4),
(10, 25, 4),
(10, 26, 4),
(10, 27, 4),
(10, 28, 4),
(10, 29, 4),
(10, 30, 4),
(10, 31, 4),
(10, 32, 4),
(10, 33, 4),
(10, 34, 4),
(10, 35, 4),
(10, 36, 4),
(10, 37, 4),
(10, 38, 4),
(10, 39, 4),
(10, 40, 4),
(10, 41, 4),
(10, 42, 4),
(10, 43, 4),
(10, 44, 4),
(10, 45, 4),
(10, 46, 4),
(10, 47, 4),
(10, 48, 4),
(10, 49, 4),
(10, 50, 4),
(10, 51, 4),
(10, 52, 4),
(10, 53, 4),
(10, 54, 4),
(10, 55, 4),
(10, 56, 4),
(10, 57, 4),
(10, 58, 4),
(10, 59, 4),
(10, 60, 4),
(10, 61, 4),
(10, 62, 4),
(10, 63, 4),
(10, 64, 4),
(10, 65, 4),
(10, 66, 4),
(10, 67, 4),
(10, 68, 4),
(11, 1, 1),
(11, 2, 1),
(11, 3, 1),
(11, 4, 1),
(11, 5, 1),
(11, 6, 1),
(11, 7, 1),
(11, 8, 1),
(11, 9, 1),
(11, 10, 1),
(11, 11, 1),
(11, 12, 1),
(11, 13, 1),
(11, 14, 1),
(11, 15, 1),
(11, 16, 1),
(11, 17, 1),
(11, 18, 1),
(11, 19, 1),
(11, 20, 1),
(11, 21, 1),
(11, 22, 1),
(11, 23, 1),
(11, 24, 1),
(11, 25, 1),
(11, 26, 1),
(11, 27, 1),
(11, 28, 1),
(11, 29, 1),
(11, 30, 1),
(11, 31, 1),
(11, 32, 1),
(11, 33, 1),
(11, 34, 1),
(11, 35, 1),
(11, 36, 1),
(11, 37, 1),
(11, 38, 1),
(11, 39, 1),
(11, 40, 1),
(11, 41, 1),
(11, 42, 1),
(11, 43, 1),
(11, 44, 1),
(11, 45, 1),
(11, 46, 1),
(11, 47, 1),
(11, 48, 1),
(11, 49, 1),
(11, 50, 1),
(11, 51, 1),
(11, 52, 1),
(11, 53, 1),
(11, 54, 1),
(11, 55, 1),
(11, 56, 1),
(11, 57, 1),
(11, 58, 1),
(11, 59, 1),
(11, 60, 1),
(11, 61, 1),
(11, 62, 1),
(11, 63, 1),
(11, 64, 1),
(11, 65, 1),
(11, 66, 1),
(11, 67, 1),
(11, 68, 1),
(12, 1, 2),
(12, 2, 2),
(12, 3, 2),
(12, 4, 2),
(12, 5, 2),
(12, 6, 2),
(12, 7, 2),
(12, 8, 2),
(12, 9, 2),
(12, 10, 2),
(12, 11, 2),
(12, 12, 2),
(12, 13, 2),
(12, 14, 2),
(12, 15, 2),
(12, 16, 2),
(12, 17, 2),
(12, 18, 2),
(12, 19, 2),
(12, 20, 2),
(12, 21, 2),
(12, 22, 2),
(12, 23, 2),
(12, 24, 2),
(12, 25, 2),
(12, 26, 2),
(12, 27, 2),
(12, 28, 2),
(12, 29, 2),
(12, 30, 2),
(12, 31, 2),
(12, 32, 2),
(12, 33, 2),
(12, 34, 2),
(12, 35, 2),
(12, 36, 2),
(12, 37, 2),
(12, 38, 2),
(12, 39, 2),
(12, 40, 2),
(12, 41, 2),
(12, 42, 2),
(12, 43, 2),
(12, 44, 2),
(12, 45, 2),
(12, 46, 2),
(12, 47, 2),
(12, 48, 2),
(12, 49, 2),
(12, 50, 2),
(12, 51, 2),
(12, 52, 2),
(12, 53, 2),
(12, 54, 2),
(12, 55, 2),
(12, 56, 2),
(12, 57, 2),
(12, 58, 2),
(12, 59, 2),
(12, 60, 2),
(12, 61, 2),
(12, 62, 2),
(12, 63, 2),
(12, 64, 2),
(12, 65, 2),
(12, 66, 2),
(12, 67, 2),
(12, 68, 2),
(13, 1, 1),
(13, 2, 1),
(13, 3, 1),
(13, 4, 1),
(13, 5, 1),
(13, 6, 1),
(13, 7, 1),
(13, 8, 1),
(13, 9, 1),
(13, 10, 1),
(13, 11, 1),
(13, 12, 1),
(13, 13, 1),
(13, 14, 1),
(13, 15, 1),
(13, 16, 1),
(13, 17, 1),
(13, 18, 1),
(13, 19, 1),
(13, 20, 1),
(13, 21, 1),
(13, 22, 1),
(13, 23, 1),
(13, 24, 1),
(13, 25, 1),
(13, 26, 1),
(13, 27, 1),
(13, 28, 1),
(13, 29, 1),
(13, 30, 1),
(13, 31, 1),
(13, 32, 1),
(13, 33, 1),
(13, 34, 1),
(13, 35, 1),
(13, 36, 1),
(13, 37, 1),
(13, 38, 1),
(13, 39, 1),
(13, 40, 1),
(13, 41, 1),
(13, 42, 1),
(13, 43, 1),
(13, 44, 1),
(13, 45, 1),
(13, 46, 1),
(13, 47, 1),
(13, 48, 1),
(13, 49, 1),
(13, 50, 1),
(13, 51, 1),
(13, 52, 1),
(13, 53, 1),
(13, 54, 1),
(13, 55, 1),
(13, 56, 1),
(13, 57, 1),
(13, 58, 1),
(13, 59, 1),
(13, 60, 1),
(13, 61, 1),
(13, 62, 1),
(13, 63, 1),
(13, 64, 1),
(13, 65, 1),
(13, 66, 1),
(13, 67, 1),
(13, 68, 1),
(14, 1, 2),
(14, 2, 2),
(14, 3, 2),
(14, 4, 2),
(14, 5, 2),
(14, 6, 2),
(14, 7, 2),
(14, 8, 2),
(14, 9, 2),
(14, 10, 2),
(14, 11, 2),
(14, 12, 2),
(14, 13, 2),
(14, 14, 2),
(14, 15, 2),
(14, 16, 2),
(14, 17, 2),
(14, 18, 2),
(14, 19, 2),
(14, 20, 2),
(14, 21, 2),
(14, 22, 2),
(14, 23, 2),
(14, 24, 2),
(14, 25, 2),
(14, 26, 2),
(14, 27, 2),
(14, 28, 2),
(14, 29, 2),
(14, 30, 2),
(14, 31, 2),
(14, 32, 2),
(14, 33, 2),
(14, 34, 2),
(14, 35, 2),
(14, 36, 2),
(14, 37, 2),
(14, 38, 2),
(14, 39, 2),
(14, 40, 2),
(14, 41, 2),
(14, 42, 2),
(14, 43, 2),
(14, 44, 2),
(14, 45, 2),
(14, 46, 2),
(14, 47, 2),
(14, 48, 2),
(14, 49, 2),
(14, 50, 2),
(14, 51, 2),
(14, 52, 2),
(14, 53, 2),
(14, 54, 2),
(14, 55, 2),
(14, 56, 2),
(14, 57, 2),
(14, 58, 2),
(14, 59, 2),
(14, 60, 2),
(14, 61, 2),
(14, 62, 2),
(14, 63, 2),
(14, 64, 2),
(14, 65, 2),
(14, 66, 2),
(14, 67, 2),
(14, 68, 2),
(15, 1, 1),
(15, 2, 1),
(15, 3, 1),
(15, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(15, 9, 1),
(15, 10, 1),
(15, 11, 1),
(15, 12, 1),
(15, 13, 1),
(15, 14, 1),
(15, 15, 1),
(15, 16, 1),
(15, 17, 1),
(15, 18, 1),
(15, 19, 1),
(15, 20, 1),
(15, 21, 1),
(15, 22, 1),
(15, 23, 1),
(15, 24, 1),
(15, 25, 1),
(15, 26, 1),
(15, 27, 1),
(15, 28, 1),
(15, 29, 1),
(15, 30, 1),
(15, 31, 1),
(15, 32, 1),
(15, 33, 1),
(15, 34, 1),
(15, 35, 1),
(15, 36, 1),
(15, 37, 1),
(15, 38, 1),
(15, 39, 1),
(15, 40, 1),
(15, 41, 1),
(15, 42, 1),
(15, 43, 1),
(15, 44, 1),
(15, 45, 1),
(15, 46, 1),
(15, 47, 1),
(15, 48, 1),
(15, 49, 1),
(15, 50, 1),
(15, 51, 1),
(15, 52, 1),
(15, 53, 1),
(15, 54, 1),
(15, 55, 1),
(15, 56, 1),
(15, 57, 1),
(15, 58, 1),
(15, 59, 1),
(15, 60, 1),
(15, 61, 1),
(15, 62, 1),
(15, 63, 1),
(15, 64, 1),
(15, 65, 1),
(15, 66, 1),
(15, 67, 1),
(15, 68, 1),
(16, 1, 2),
(16, 2, 2),
(16, 3, 2),
(16, 4, 2),
(16, 5, 2),
(16, 6, 2),
(16, 7, 2),
(16, 8, 2),
(16, 9, 2),
(16, 10, 2),
(16, 11, 2),
(16, 12, 2),
(16, 13, 2),
(16, 14, 2),
(16, 15, 2),
(16, 16, 2),
(16, 17, 2),
(16, 18, 2),
(16, 19, 2),
(16, 20, 2),
(16, 21, 2),
(16, 22, 2),
(16, 23, 2),
(16, 24, 2),
(16, 25, 2),
(16, 26, 2),
(16, 27, 2),
(16, 28, 2),
(16, 29, 2),
(16, 30, 2),
(16, 31, 2),
(16, 32, 2),
(16, 33, 2),
(16, 34, 2),
(16, 35, 2),
(16, 36, 2),
(16, 37, 2),
(16, 38, 2),
(16, 39, 2),
(16, 40, 2),
(16, 41, 2),
(16, 42, 2),
(16, 43, 2),
(16, 44, 2),
(16, 45, 2),
(16, 46, 2),
(16, 47, 2),
(16, 48, 2),
(16, 49, 2),
(16, 50, 2),
(16, 51, 2),
(16, 52, 2),
(16, 53, 2),
(16, 54, 2),
(16, 55, 2),
(16, 56, 2),
(16, 57, 2),
(16, 58, 2),
(16, 59, 2),
(16, 60, 2),
(16, 61, 2),
(16, 62, 2),
(16, 63, 2),
(16, 64, 2),
(16, 65, 2),
(16, 66, 2),
(16, 67, 2),
(16, 68, 2),
(17, 1, 1),
(17, 2, 1),
(17, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(17, 7, 1),
(17, 8, 1),
(17, 9, 1),
(17, 10, 1),
(17, 11, 1),
(17, 12, 1),
(17, 13, 1),
(17, 14, 1),
(17, 15, 1),
(17, 16, 1),
(17, 17, 1),
(17, 18, 1),
(17, 19, 1),
(17, 20, 1),
(17, 21, 1),
(17, 22, 1),
(17, 23, 1),
(17, 24, 1),
(17, 25, 1),
(17, 26, 1),
(17, 27, 1),
(17, 28, 1),
(17, 29, 1),
(17, 30, 1),
(17, 31, 1),
(17, 32, 1),
(17, 33, 1),
(17, 34, 1),
(17, 35, 1),
(17, 36, 1),
(17, 37, 1),
(17, 38, 1),
(17, 39, 1),
(17, 40, 1),
(17, 41, 1),
(17, 42, 1),
(17, 43, 1),
(17, 44, 1),
(17, 45, 1),
(17, 46, 1),
(17, 47, 1),
(17, 48, 1),
(17, 49, 1),
(17, 50, 1),
(17, 51, 1),
(17, 52, 1),
(17, 53, 1),
(17, 54, 1),
(17, 55, 1),
(17, 56, 1),
(17, 57, 1),
(17, 58, 1),
(17, 59, 1),
(17, 60, 1),
(17, 61, 1),
(17, 62, 1),
(17, 63, 1),
(17, 64, 1),
(17, 65, 1),
(17, 66, 1),
(17, 67, 1),
(17, 68, 1),
(18, 1, 1),
(18, 2, 1),
(18, 3, 1),
(18, 4, 1),
(18, 5, 1),
(18, 6, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(18, 10, 1),
(18, 11, 1),
(18, 12, 1),
(18, 13, 1),
(18, 14, 1),
(18, 15, 1),
(18, 16, 1),
(18, 17, 1),
(18, 18, 1),
(18, 19, 1),
(18, 20, 1),
(18, 21, 1),
(18, 22, 1),
(18, 23, 1),
(18, 24, 1),
(18, 25, 1),
(18, 26, 1),
(18, 27, 1),
(18, 28, 1),
(18, 29, 1),
(18, 30, 1),
(18, 31, 1),
(18, 32, 1),
(18, 33, 1),
(18, 34, 1),
(18, 35, 1),
(18, 36, 1),
(18, 37, 1),
(18, 38, 1),
(18, 39, 1),
(18, 40, 1),
(18, 41, 1),
(18, 42, 1),
(18, 43, 1),
(18, 44, 1),
(18, 45, 1),
(18, 46, 1),
(18, 47, 1),
(18, 48, 1),
(18, 49, 1),
(18, 50, 1),
(18, 51, 1),
(18, 52, 1),
(18, 53, 1),
(18, 54, 1),
(18, 55, 1),
(18, 56, 1),
(18, 57, 1),
(18, 58, 1),
(18, 59, 1),
(18, 60, 1),
(18, 61, 1),
(18, 62, 1),
(18, 63, 1),
(18, 64, 1),
(18, 65, 1),
(18, 66, 1),
(18, 67, 1),
(18, 68, 1),
(19, 1, 1),
(19, 2, 1),
(19, 3, 1),
(19, 4, 1),
(19, 5, 1),
(19, 6, 1),
(19, 7, 1),
(19, 8, 1),
(19, 9, 1),
(19, 10, 1),
(19, 11, 1),
(19, 12, 1),
(19, 13, 1),
(19, 14, 1),
(19, 15, 1),
(19, 16, 1),
(19, 17, 1),
(19, 18, 1),
(19, 19, 1),
(19, 20, 1),
(19, 21, 1),
(19, 22, 1),
(19, 23, 1),
(19, 24, 1),
(19, 25, 1),
(19, 26, 1),
(19, 27, 1),
(19, 28, 1),
(19, 29, 1),
(19, 30, 1),
(19, 31, 1),
(19, 32, 1),
(19, 33, 1),
(19, 34, 1),
(19, 35, 1),
(19, 36, 1),
(19, 37, 1),
(19, 38, 1),
(19, 39, 1),
(19, 40, 1),
(19, 41, 1),
(19, 42, 1),
(19, 43, 1),
(19, 44, 1),
(19, 45, 1),
(19, 46, 1),
(19, 47, 1),
(19, 48, 1),
(19, 49, 1),
(19, 50, 1),
(19, 51, 1),
(19, 52, 1),
(19, 53, 1),
(19, 54, 1),
(19, 55, 1),
(19, 56, 1),
(19, 57, 1),
(19, 58, 1),
(19, 59, 1),
(19, 60, 1),
(19, 61, 1),
(19, 62, 1),
(19, 63, 1),
(19, 64, 1),
(19, 65, 1),
(19, 66, 1),
(19, 67, 1),
(19, 68, 1),
(20, 1, 1),
(20, 2, 1),
(20, 3, 1),
(20, 4, 1),
(20, 5, 1),
(20, 6, 1),
(20, 7, 1),
(20, 8, 1),
(20, 9, 1),
(20, 10, 1),
(20, 11, 1),
(20, 12, 1),
(20, 13, 1),
(20, 14, 1),
(20, 15, 1),
(20, 16, 1),
(20, 17, 1),
(20, 18, 1),
(20, 19, 1),
(20, 20, 1),
(20, 21, 1),
(20, 22, 1),
(20, 23, 1),
(20, 24, 1),
(20, 25, 1),
(20, 26, 1),
(20, 27, 1),
(20, 28, 1),
(20, 29, 1),
(20, 30, 1),
(20, 31, 1),
(20, 32, 1),
(20, 33, 1),
(20, 34, 1),
(20, 35, 1),
(20, 36, 1),
(20, 37, 1),
(20, 38, 1),
(20, 39, 1),
(20, 40, 1),
(20, 41, 1),
(20, 42, 1),
(20, 43, 1),
(20, 44, 1),
(20, 45, 1),
(20, 46, 1),
(20, 47, 1),
(20, 48, 1),
(20, 49, 1),
(20, 50, 1),
(20, 51, 1),
(20, 52, 1),
(20, 53, 1),
(20, 54, 1),
(20, 55, 1),
(20, 56, 1),
(20, 57, 1),
(20, 58, 1),
(20, 59, 1),
(20, 60, 1),
(20, 61, 1),
(20, 62, 1),
(20, 63, 1),
(20, 64, 1),
(20, 65, 1),
(20, 66, 1),
(20, 67, 1),
(20, 68, 1),
(21, 1, 1),
(21, 2, 1),
(21, 3, 1),
(21, 4, 1),
(21, 5, 1),
(21, 6, 1),
(21, 7, 1),
(21, 8, 1),
(21, 9, 1),
(21, 10, 1),
(21, 11, 1),
(21, 12, 1),
(21, 13, 1),
(21, 14, 1),
(21, 15, 1),
(21, 16, 1),
(21, 17, 1),
(21, 18, 1),
(21, 19, 1),
(21, 20, 1),
(21, 21, 1),
(21, 22, 1),
(21, 23, 1),
(21, 24, 1),
(21, 25, 1),
(21, 26, 1),
(21, 27, 1),
(21, 28, 1),
(21, 29, 1),
(21, 30, 1),
(21, 31, 1),
(21, 32, 1),
(21, 33, 1),
(21, 34, 1),
(21, 35, 1),
(21, 36, 1),
(21, 37, 1),
(21, 38, 1),
(21, 39, 1),
(21, 40, 1),
(21, 41, 1),
(21, 42, 1),
(21, 43, 1),
(21, 44, 1),
(21, 45, 1),
(21, 46, 1),
(21, 47, 1),
(21, 48, 1),
(21, 49, 1),
(21, 50, 1),
(21, 51, 1),
(21, 52, 1),
(21, 53, 1),
(21, 54, 1),
(21, 55, 1),
(21, 56, 1),
(21, 57, 1),
(21, 58, 1),
(21, 59, 1),
(21, 60, 1),
(21, 61, 1),
(21, 62, 1),
(21, 63, 1),
(21, 64, 1),
(21, 65, 1),
(21, 66, 1),
(21, 67, 1),
(21, 68, 1),
(22, 1, 1),
(22, 2, 1),
(22, 3, 1),
(22, 4, 1),
(22, 5, 1),
(22, 6, 1),
(22, 7, 1),
(22, 8, 1),
(22, 9, 1),
(22, 10, 1),
(22, 11, 1),
(22, 12, 1),
(22, 13, 1),
(22, 14, 1),
(22, 15, 1),
(22, 16, 1),
(22, 17, 1),
(22, 18, 1),
(22, 19, 1),
(22, 20, 1),
(22, 21, 1),
(22, 22, 1),
(22, 23, 1),
(22, 24, 1),
(22, 25, 1),
(22, 26, 1),
(22, 27, 1),
(22, 28, 1),
(22, 29, 1),
(22, 30, 1),
(22, 31, 1),
(22, 32, 1),
(22, 33, 1),
(22, 34, 1),
(22, 35, 1),
(22, 36, 1),
(22, 37, 1),
(22, 38, 1),
(22, 39, 1),
(22, 40, 1),
(22, 41, 1),
(22, 42, 1),
(22, 43, 1),
(22, 44, 1),
(22, 45, 1),
(22, 46, 1),
(22, 47, 1),
(22, 48, 1),
(22, 49, 1),
(22, 50, 1),
(22, 51, 1),
(22, 52, 1),
(22, 53, 1),
(22, 54, 1),
(22, 55, 1),
(22, 56, 1),
(22, 57, 1),
(22, 58, 1),
(22, 59, 1),
(22, 60, 1),
(22, 61, 1),
(22, 62, 1),
(22, 63, 1),
(22, 64, 1),
(22, 65, 1),
(22, 66, 1),
(22, 67, 1),
(22, 68, 1),
(23, 1, 1),
(23, 2, 1),
(23, 3, 1),
(23, 4, 1),
(23, 5, 1),
(23, 6, 1),
(23, 7, 1),
(23, 8, 1),
(23, 9, 1),
(23, 10, 1),
(23, 11, 1),
(23, 12, 1),
(23, 13, 1),
(23, 14, 1),
(23, 15, 1),
(23, 16, 1),
(23, 17, 1),
(23, 18, 1),
(23, 19, 1),
(23, 20, 1),
(23, 21, 1),
(23, 22, 1),
(23, 23, 1),
(23, 24, 1),
(23, 25, 1),
(23, 26, 1),
(23, 27, 1),
(23, 28, 1),
(23, 29, 1),
(23, 30, 1),
(23, 31, 1),
(23, 32, 1),
(23, 33, 1),
(23, 34, 1),
(23, 35, 1),
(23, 36, 1),
(23, 37, 1),
(23, 38, 1),
(23, 39, 1),
(23, 40, 1),
(23, 41, 1),
(23, 42, 1),
(23, 43, 1),
(23, 44, 1),
(23, 45, 1),
(23, 46, 1),
(23, 47, 1),
(23, 48, 1),
(23, 49, 1),
(23, 50, 1),
(23, 51, 1),
(23, 52, 1),
(23, 53, 1),
(23, 54, 1),
(23, 55, 1),
(23, 56, 1),
(23, 57, 1),
(23, 58, 1),
(23, 59, 1),
(23, 60, 1),
(23, 61, 1),
(23, 62, 1),
(23, 63, 1),
(23, 64, 1),
(23, 65, 1),
(23, 66, 1),
(23, 67, 1),
(23, 68, 1),
(24, 1, 2),
(24, 2, 2),
(24, 3, 2),
(24, 4, 2),
(24, 5, 2),
(24, 6, 2),
(24, 7, 2),
(24, 8, 2),
(24, 9, 2),
(24, 10, 2),
(24, 11, 2),
(24, 12, 2),
(24, 13, 2),
(24, 14, 2),
(24, 15, 2),
(24, 16, 2),
(24, 17, 2),
(24, 18, 2),
(24, 19, 2),
(24, 20, 2),
(24, 21, 2),
(24, 22, 2),
(24, 23, 2),
(24, 24, 2),
(24, 25, 2),
(24, 26, 2),
(24, 27, 2),
(24, 28, 2),
(24, 29, 2),
(24, 30, 2),
(24, 31, 2),
(24, 32, 2),
(24, 33, 2),
(24, 34, 2),
(24, 35, 2),
(24, 36, 2),
(24, 37, 2),
(24, 38, 2),
(24, 39, 2),
(24, 40, 2),
(24, 41, 2),
(24, 42, 2),
(24, 43, 2),
(24, 44, 2),
(24, 45, 2),
(24, 46, 2),
(24, 47, 2),
(24, 48, 2),
(24, 49, 2),
(24, 50, 2),
(24, 51, 2),
(24, 52, 2),
(24, 53, 2),
(24, 54, 2),
(24, 55, 2),
(24, 56, 2),
(24, 57, 2),
(24, 58, 2),
(24, 59, 2),
(24, 60, 2),
(24, 61, 2),
(24, 62, 2),
(24, 63, 2),
(24, 64, 2),
(24, 65, 2),
(24, 66, 2),
(24, 67, 2),
(24, 68, 2),
(25, 1, 3),
(25, 2, 3),
(25, 3, 3),
(25, 4, 3),
(25, 5, 3),
(25, 6, 3),
(25, 7, 3),
(25, 8, 3),
(25, 9, 3),
(25, 10, 3),
(25, 11, 3),
(25, 12, 3),
(25, 13, 3),
(25, 14, 3),
(25, 15, 3),
(25, 16, 3),
(25, 17, 3),
(25, 18, 3),
(25, 19, 3),
(25, 20, 3),
(25, 21, 3),
(25, 22, 3),
(25, 23, 3),
(25, 24, 3),
(25, 25, 3),
(25, 26, 3),
(25, 27, 3),
(25, 28, 3),
(25, 29, 3),
(25, 30, 3),
(25, 31, 3),
(25, 32, 3),
(25, 33, 3),
(25, 34, 3),
(25, 35, 3),
(25, 36, 3),
(25, 37, 3),
(25, 38, 3),
(25, 39, 3),
(25, 40, 3),
(25, 41, 3),
(25, 42, 3),
(25, 43, 3),
(25, 44, 3),
(25, 45, 3),
(25, 46, 3),
(25, 47, 3),
(25, 48, 3),
(25, 49, 3),
(25, 50, 3),
(25, 51, 3),
(25, 52, 3),
(25, 53, 3),
(25, 54, 3),
(25, 55, 3),
(25, 56, 3),
(25, 57, 3),
(25, 58, 3),
(25, 59, 3),
(25, 60, 3),
(25, 61, 3),
(25, 62, 3),
(25, 63, 3),
(25, 64, 3),
(25, 65, 3),
(25, 66, 3),
(25, 67, 3),
(25, 68, 3),
(26, 1, 1),
(26, 2, 1),
(26, 3, 1),
(26, 4, 1),
(26, 5, 1),
(26, 6, 1),
(26, 7, 1),
(26, 8, 1),
(26, 9, 1),
(26, 10, 1),
(26, 11, 1),
(26, 12, 1),
(26, 13, 1),
(26, 14, 1),
(26, 15, 1),
(26, 16, 1),
(26, 17, 1),
(26, 18, 1),
(26, 19, 1),
(26, 20, 1),
(26, 21, 1),
(26, 22, 1),
(26, 23, 1),
(26, 24, 1),
(26, 25, 1),
(26, 26, 1),
(26, 27, 1),
(26, 28, 1),
(26, 29, 1),
(26, 30, 1),
(26, 31, 1),
(26, 32, 1),
(26, 33, 1),
(26, 34, 1),
(26, 35, 1),
(26, 36, 1),
(26, 37, 1),
(26, 38, 1),
(26, 39, 1),
(26, 40, 1),
(26, 41, 1),
(26, 42, 1),
(26, 43, 1),
(26, 44, 1),
(26, 45, 1),
(26, 46, 1),
(26, 47, 1),
(26, 48, 1),
(26, 49, 1),
(26, 50, 1),
(26, 51, 1),
(26, 52, 1),
(26, 53, 1),
(26, 54, 1),
(26, 55, 1),
(26, 56, 1),
(26, 57, 1),
(26, 58, 1),
(26, 59, 1),
(26, 60, 1),
(26, 61, 1),
(26, 62, 1),
(26, 63, 1),
(26, 64, 1),
(26, 65, 1),
(26, 66, 1),
(26, 67, 1),
(26, 68, 1),
(27, 1, 2),
(27, 2, 2),
(27, 3, 2),
(27, 4, 2),
(27, 5, 2),
(27, 6, 2),
(27, 7, 2),
(27, 8, 2),
(27, 9, 2),
(27, 10, 2),
(27, 11, 2),
(27, 12, 2),
(27, 13, 2),
(27, 14, 2),
(27, 15, 2),
(27, 16, 2),
(27, 17, 2),
(27, 18, 2),
(27, 19, 2),
(27, 20, 2),
(27, 21, 2),
(27, 22, 2),
(27, 23, 2),
(27, 24, 2),
(27, 25, 2),
(27, 26, 2),
(27, 27, 2),
(27, 28, 2),
(27, 29, 2),
(27, 30, 2),
(27, 31, 2),
(27, 32, 2),
(27, 33, 2),
(27, 34, 2),
(27, 35, 2),
(27, 36, 2),
(27, 37, 2),
(27, 38, 2),
(27, 39, 2),
(27, 40, 2),
(27, 41, 2),
(27, 42, 2),
(27, 43, 2),
(27, 44, 2),
(27, 45, 2),
(27, 46, 2),
(27, 47, 2),
(27, 48, 2),
(27, 49, 2),
(27, 50, 2),
(27, 51, 2),
(27, 52, 2),
(27, 53, 2),
(27, 54, 2),
(27, 55, 2),
(27, 56, 2),
(27, 57, 2),
(27, 58, 2),
(27, 59, 2),
(27, 60, 2),
(27, 61, 2),
(27, 62, 2),
(27, 63, 2),
(27, 64, 2),
(27, 65, 2),
(27, 66, 2),
(27, 67, 2),
(27, 68, 2),
(28, 1, 3),
(28, 2, 3),
(28, 3, 3),
(28, 4, 3),
(28, 5, 3),
(28, 6, 3),
(28, 7, 3),
(28, 8, 3),
(28, 9, 3),
(28, 10, 3),
(28, 11, 3),
(28, 12, 3),
(28, 13, 3),
(28, 14, 3),
(28, 15, 3),
(28, 16, 3),
(28, 17, 3),
(28, 18, 3),
(28, 19, 3),
(28, 20, 3),
(28, 21, 3),
(28, 22, 3),
(28, 23, 3),
(28, 24, 3),
(28, 25, 3),
(28, 26, 3),
(28, 27, 3),
(28, 28, 3),
(28, 29, 3),
(28, 30, 3),
(28, 31, 3),
(28, 32, 3),
(28, 33, 3),
(28, 34, 3),
(28, 35, 3),
(28, 36, 3),
(28, 37, 3),
(28, 38, 3),
(28, 39, 3),
(28, 40, 3),
(28, 41, 3),
(28, 42, 3),
(28, 43, 3),
(28, 44, 3),
(28, 45, 3),
(28, 46, 3),
(28, 47, 3),
(28, 48, 3),
(28, 49, 3),
(28, 50, 3),
(28, 51, 3),
(28, 52, 3),
(28, 53, 3),
(28, 54, 3),
(28, 55, 3),
(28, 56, 3),
(28, 57, 3),
(28, 58, 3),
(28, 59, 3),
(28, 60, 3),
(28, 61, 3),
(28, 62, 3),
(28, 63, 3),
(28, 64, 3),
(28, 65, 3),
(28, 66, 3),
(28, 67, 3),
(28, 68, 3),
(29, 1, 4),
(29, 2, 4),
(29, 3, 4),
(29, 4, 4),
(29, 5, 4),
(29, 6, 4),
(29, 7, 4),
(29, 8, 4),
(29, 9, 4),
(29, 10, 4),
(29, 11, 4),
(29, 12, 4),
(29, 13, 4),
(29, 14, 4),
(29, 15, 4),
(29, 16, 4),
(29, 17, 4),
(29, 18, 4),
(29, 19, 4),
(29, 20, 4),
(29, 21, 4),
(29, 22, 4),
(29, 23, 4),
(29, 24, 4),
(29, 25, 4),
(29, 26, 4),
(29, 27, 4),
(29, 28, 4),
(29, 29, 4),
(29, 30, 4),
(29, 31, 4),
(29, 32, 4),
(29, 33, 4),
(29, 34, 4),
(29, 35, 4),
(29, 36, 4),
(29, 37, 4),
(29, 38, 4),
(29, 39, 4),
(29, 40, 4),
(29, 41, 4),
(29, 42, 4),
(29, 43, 4),
(29, 44, 4),
(29, 45, 4),
(29, 46, 4),
(29, 47, 4),
(29, 48, 4),
(29, 49, 4),
(29, 50, 4),
(29, 51, 4),
(29, 52, 4),
(29, 53, 4),
(29, 54, 4),
(29, 55, 4),
(29, 56, 4),
(29, 57, 4),
(29, 58, 4),
(29, 59, 4),
(29, 60, 4),
(29, 61, 4),
(29, 62, 4),
(29, 63, 4),
(29, 64, 4),
(29, 65, 4),
(29, 66, 4),
(29, 67, 4),
(29, 68, 4),
(30, 1, 1),
(30, 2, 1),
(30, 3, 1),
(30, 4, 1),
(30, 5, 1),
(30, 6, 1),
(30, 7, 1),
(30, 8, 1),
(30, 9, 1),
(30, 10, 1),
(30, 11, 1),
(30, 12, 1),
(30, 13, 1),
(30, 14, 1),
(30, 15, 1),
(30, 16, 1),
(30, 17, 1),
(30, 18, 1),
(30, 19, 1),
(30, 20, 1),
(30, 21, 1),
(30, 22, 1),
(30, 23, 1),
(30, 24, 1),
(30, 25, 1),
(30, 26, 1),
(30, 27, 1),
(30, 28, 1),
(30, 29, 1),
(30, 30, 1),
(30, 31, 1),
(30, 32, 1),
(30, 33, 1),
(30, 34, 1),
(30, 35, 1),
(30, 36, 1),
(30, 37, 1),
(30, 38, 1),
(30, 39, 1),
(30, 40, 1),
(30, 41, 1),
(30, 42, 1),
(30, 43, 1),
(30, 44, 1),
(30, 45, 1),
(30, 46, 1),
(30, 47, 1),
(30, 48, 1),
(30, 49, 1),
(30, 50, 1),
(30, 51, 1),
(30, 52, 1),
(30, 53, 1),
(30, 54, 1),
(30, 55, 1),
(30, 56, 1),
(30, 57, 1),
(30, 58, 1),
(30, 59, 1),
(30, 60, 1),
(30, 61, 1),
(30, 62, 1),
(30, 63, 1),
(30, 64, 1),
(30, 65, 1),
(30, 66, 1),
(30, 67, 1),
(30, 68, 1),
(31, 1, 1),
(31, 2, 1),
(31, 3, 1),
(31, 4, 1),
(31, 5, 1),
(31, 6, 1),
(31, 7, 1),
(31, 8, 1),
(31, 9, 1),
(31, 10, 1),
(31, 11, 1),
(31, 12, 1),
(31, 13, 1),
(31, 14, 1),
(31, 15, 1),
(31, 16, 1),
(31, 17, 1),
(31, 18, 1),
(31, 19, 1),
(31, 20, 1),
(31, 21, 1),
(31, 22, 1),
(31, 23, 1),
(31, 24, 1),
(31, 25, 1),
(31, 26, 1),
(31, 27, 1),
(31, 28, 1),
(31, 29, 1),
(31, 30, 1),
(31, 31, 1),
(31, 32, 1),
(31, 33, 1),
(31, 34, 1),
(31, 35, 1),
(31, 36, 1),
(31, 37, 1),
(31, 38, 1),
(31, 39, 1),
(31, 40, 1),
(31, 41, 1),
(31, 42, 1),
(31, 43, 1),
(31, 44, 1),
(31, 45, 1),
(31, 46, 1),
(31, 47, 1),
(31, 48, 1),
(31, 49, 1),
(31, 50, 1),
(31, 51, 1),
(31, 52, 1),
(31, 53, 1),
(31, 54, 1),
(31, 55, 1),
(31, 56, 1),
(31, 57, 1),
(31, 58, 1),
(31, 59, 1),
(31, 60, 1),
(31, 61, 1),
(31, 62, 1),
(31, 63, 1),
(31, 64, 1),
(31, 65, 1),
(31, 66, 1),
(31, 67, 1),
(31, 68, 1),
(32, 1, 1),
(32, 2, 1),
(32, 3, 1),
(32, 4, 1),
(32, 5, 1),
(32, 6, 1),
(32, 7, 1),
(32, 8, 1),
(32, 9, 1),
(32, 10, 1),
(32, 11, 1),
(32, 12, 1),
(32, 13, 1),
(32, 14, 1),
(32, 15, 1),
(32, 16, 1),
(32, 17, 1),
(32, 18, 1),
(32, 19, 1),
(32, 20, 1),
(32, 21, 1),
(32, 22, 1),
(32, 23, 1),
(32, 24, 1),
(32, 25, 1),
(32, 26, 1),
(32, 27, 1),
(32, 28, 1),
(32, 29, 1),
(32, 30, 1),
(32, 31, 1),
(32, 32, 1),
(32, 33, 1),
(32, 34, 1),
(32, 35, 1),
(32, 36, 1),
(32, 37, 1),
(32, 38, 1),
(32, 39, 1),
(32, 40, 1),
(32, 41, 1),
(32, 42, 1),
(32, 43, 1),
(32, 44, 1),
(32, 45, 1),
(32, 46, 1),
(32, 47, 1),
(32, 48, 1),
(32, 49, 1),
(32, 50, 1),
(32, 51, 1),
(32, 52, 1),
(32, 53, 1),
(32, 54, 1),
(32, 55, 1),
(32, 56, 1),
(32, 57, 1),
(32, 58, 1),
(32, 59, 1),
(32, 60, 1),
(32, 61, 1),
(32, 62, 1),
(32, 63, 1),
(32, 64, 1),
(32, 65, 1),
(32, 66, 1),
(32, 67, 1),
(32, 68, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_comment`
--

CREATE TABLE IF NOT EXISTS `hn4_en_comment` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `likes` mediumint(9) NOT NULL DEFAULT '0',
  `dislikes` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `mod_id` (`module`,`area`,`id`),
  KEY `post_time` (`post_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_contact_department`
--

CREATE TABLE IF NOT EXISTS `hn4_en_contact_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cats` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admins` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(5) NOT NULL,
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`full_name`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_contact_reply`
--

CREATE TABLE IF NOT EXISTS `hn4_en_contact_reply` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reply_content` text COLLATE utf8mb4_unicode_ci,
  `reply_time` int(11) unsigned NOT NULL DEFAULT '0',
  `reply_aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_contact_send`
--

CREATE TABLE IF NOT EXISTS `hn4_en_contact_send` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` int(11) unsigned NOT NULL DEFAULT '0',
  `sender_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sender_ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_processed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `processed_by` int(11) unsigned NOT NULL DEFAULT '0',
  `processed_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sender_name` (`sender_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_contact_supporter`
--

CREATE TABLE IF NOT EXISTS `hn4_en_contact_supporter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `departmentid` smallint(5) unsigned NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `act` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `weight` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_freecontent_blocks`
--

CREATE TABLE IF NOT EXISTS `hn4_en_freecontent_blocks` (
  `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_freecontent_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_en_freecontent_rows` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '_blank|_self|_parent|_top',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: In-Active, 1: Active, 2: Expired',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_menu`
--

CREATE TABLE IF NOT EXISTS `hn4_en_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hn4_en_menu`
--

INSERT INTO `hn4_en_menu` (`id`, `title`) VALUES
(1, 'Top Menu');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_menu_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_en_menu_rows` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `parentid` mediumint(5) unsigned NOT NULL,
  `mid` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `lev` int(11) NOT NULL DEFAULT '0',
  `subitem` text COLLATE utf8mb4_unicode_ci,
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `op` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `target` tinyint(4) DEFAULT '0',
  `css` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `active_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`,`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `hn4_en_menu_rows`
--

INSERT INTO `hn4_en_menu_rows` (`id`, `parentid`, `mid`, `title`, `link`, `icon`, `image`, `note`, `weight`, `sort`, `lev`, `subitem`, `groups_view`, `module_name`, `op`, `target`, `css`, `active_type`, `status`) VALUES
(1, 0, 1, 'About', '/index.php?language=en&nv=about', '', '', '', 1, 1, 0, '', '6', 'about', '', 1, '', 1, 1),
(2, 0, 1, 'News', '/index.php?language=en&nv=news', '', '', '', 2, 2, 0, '', '6', 'news', '', 1, '', 1, 1),
(3, 0, 1, 'Users', '/index.php?language=en&nv=users', '', '', '', 3, 3, 0, '6,7,8,9,10,11', '6', 'users', '', 1, '', 1, 1),
(4, 0, 1, 'Voting', '/index.php?language=en&nv=voting', '', '', '', 4, 10, 0, '', '6', 'voting', '', 1, '', 1, 1),
(5, 0, 1, 'Contact', '/index.php?language=en&nv=contact', '', '', '', 5, 11, 0, '', '6', 'contact', '', 1, '', 1, 1),
(6, 3, 1, 'Login', '/index.php?language=en&nv=users&op=login', '', '', '', 1, 4, 1, '', '5', 'users', 'login', 1, '', 1, 1),
(7, 3, 1, 'Register', '/index.php?language=en&nv=users&op=register', '', '', '', 2, 5, 1, '', '5', 'users', 'register', 1, '', 1, 1),
(8, 3, 1, 'Password recovery', '/index.php?language=en&nv=users&op=lostpass', '', '', '', 3, 6, 1, '', '5', 'users', 'lostpass', 1, '', 1, 1),
(9, 3, 1, 'Account Settings', '/index.php?language=en&nv=users&op=editinfo', '', '', '', 4, 7, 1, '', '4,7', 'users', 'editinfo', 1, '', 1, 1),
(10, 3, 1, 'Members list', '/index.php?language=en&nv=users&op=memberlist', '', '', '', 5, 8, 1, '', '4,7', 'users', 'memberlist', 1, '', 1, 1),
(11, 3, 1, 'Logout', '/index.php?language=en&nv=users&op=logout', '', '', '', 6, 9, 1, '', '4,7', 'users', 'logout', 1, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_modfuncs`
--

CREATE TABLE IF NOT EXISTS `hn4_en_modfuncs` (
  `func_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `func_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `func_custom_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `func_site_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `in_module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_func` tinyint(4) NOT NULL DEFAULT '0',
  `in_submenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subweight` smallint(2) unsigned NOT NULL DEFAULT '1',
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`func_id`),
  UNIQUE KEY `func_name` (`func_name`,`in_module`),
  UNIQUE KEY `alias` (`alias`,`in_module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=69 ;

--
-- Dumping data for table `hn4_en_modfuncs`
--

INSERT INTO `hn4_en_modfuncs` (`func_id`, `func_name`, `alias`, `func_custom_name`, `func_site_title`, `description`, `in_module`, `show_func`, `in_submenu`, `subweight`, `setting`) VALUES
(1, 'main', 'main', 'Main', '', '', 'about', 1, 0, 1, ''),
(2, 'sitemap', 'sitemap', 'Sitemap', '', '', 'about', 0, 0, 0, ''),
(3, 'rss', 'rss', 'Rss', '', '', 'about', 0, 0, 0, ''),
(4, 'main', 'main', 'Main', '', '', 'news', 1, 0, 1, ''),
(5, 'viewcat', 'viewcat', 'Viewcat', '', '', 'news', 1, 0, 2, ''),
(6, 'topic', 'topic', 'Topic', '', '', 'news', 1, 0, 3, ''),
(7, 'content', 'content', 'Content', '', '', 'news', 1, 1, 4, ''),
(8, 'detail', 'detail', 'Detail', '', '', 'news', 1, 0, 5, ''),
(9, 'tag', 'tag', 'Tag', '', '', 'news', 1, 0, 6, ''),
(10, 'rss', 'rss', 'Rss', '', '', 'news', 1, 1, 7, ''),
(11, 'search', 'search', 'Search', '', '', 'news', 1, 1, 8, ''),
(12, 'groups', 'groups', 'Groups', '', '', 'news', 1, 0, 9, ''),
(13, 'author', 'author', 'Author', '', '', 'news', 1, 0, 10, ''),
(14, 'sitemap', 'sitemap', 'Sitemap', '', '', 'news', 0, 0, 0, ''),
(15, 'print', 'print', 'Print', '', '', 'news', 0, 0, 0, ''),
(16, 'rating', 'rating', 'Rating', '', '', 'news', 0, 0, 0, ''),
(17, 'savefile', 'savefile', 'Savefile', '', '', 'news', 0, 0, 0, ''),
(18, 'sendmail', 'sendmail', 'Sendmail', '', '', 'news', 0, 0, 0, ''),
(19, 'instant-rss', 'instant-rss', 'Instant Articles RSS', '', '', 'news', 0, 0, 0, ''),
(20, 'main', 'main', 'Main', '', '', 'users', 1, 0, 1, ''),
(21, 'login', 'login', 'Login', '', '', 'users', 1, 1, 2, ''),
(22, 'register', 'register', 'Register', '', '', 'users', 1, 1, 3, ''),
(23, 'lostpass', 'lostpass', 'Password recovery', '', '', 'users', 1, 1, 4, ''),
(24, 'active', 'active', 'Active account', '', '', 'users', 1, 0, 5, ''),
(25, 'lostactivelink', 'lostactivelink', 'Lostactivelink', '', '', 'users', 1, 0, 6, ''),
(26, 'editinfo', 'editinfo', 'Account Settings', '', '', 'users', 1, 1, 7, ''),
(27, 'memberlist', 'memberlist', 'Members list', '', '', 'users', 1, 1, 8, ''),
(28, 'groups', 'groups', 'Group management', '', '', 'users', 1, 1, 9, ''),
(29, 'avatar', 'avatar', 'Avatar', '', '', 'users', 1, 0, 10, ''),
(30, 'logout', 'logout', 'Logout', '', '', 'users', 1, 1, 11, ''),
(31, 'oauth', 'oauth', 'Oauth', '', '', 'users', 0, 0, 0, ''),
(32, 'main', 'main', 'Main', '', '', 'myapi', 1, 0, 1, ''),
(33, 'main', 'main', 'Main', '', '', 'push', 1, 0, 1, ''),
(34, 'main', 'main', 'Main', '', '', 'contact', 1, 0, 1, ''),
(35, 'main', 'main', 'Main', '', '', 'statistics', 1, 0, 1, ''),
(36, 'allreferers', 'allreferers', 'By referrers', '', '', 'statistics', 1, 1, 2, ''),
(37, 'allcountries', 'allcountries', 'By countries', '', '', 'statistics', 1, 1, 3, ''),
(38, 'allbrowsers', 'allbrowsers', 'By browsers ', '', '', 'statistics', 1, 1, 4, ''),
(39, 'allos', 'allos', 'By operating system', '', '', 'statistics', 1, 1, 5, ''),
(40, 'allbots', 'allbots', 'By search engines', '', '', 'statistics', 1, 1, 6, ''),
(41, 'referer', 'referer', 'By month', '', '', 'statistics', 1, 0, 7, ''),
(42, 'main', 'main', 'Main', '', '', 'voting', 1, 0, 1, ''),
(43, 'main', 'main', 'Main', '', '', 'banners', 1, 0, 1, ''),
(44, 'addads', 'addads', 'Addads', '', '', 'banners', 1, 0, 2, ''),
(45, 'clientinfo', 'clientinfo', 'Clientinfo', '', '', 'banners', 1, 0, 3, ''),
(46, 'stats', 'stats', 'Stats', '', '', 'banners', 1, 0, 4, ''),
(47, 'cledit', 'cledit', 'Cledit', '', '', 'banners', 0, 0, 0, ''),
(48, 'click', 'click', 'Click', '', '', 'banners', 0, 0, 0, ''),
(49, 'clinfo', 'clinfo', 'Clinfo', '', '', 'banners', 0, 0, 0, ''),
(50, 'logininfo', 'logininfo', 'Logininfo', '', '', 'banners', 0, 0, 0, ''),
(51, 'viewmap', 'viewmap', 'Viewmap', '', '', 'banners', 0, 0, 0, ''),
(52, 'main', 'main', 'Main', '', '', 'seek', 1, 0, 1, ''),
(53, 'opensearch', 'opensearch', 'Opensearch', '', '', 'seek', 0, 0, 0, ''),
(54, 'main', 'main', 'Main', '', '', 'feeds', 1, 0, 1, ''),
(55, 'main', 'main', 'Main', '', '', 'page', 1, 0, 1, ''),
(56, 'sitemap', 'sitemap', 'Sitemap', '', '', 'page', 0, 0, 0, ''),
(57, 'rss', 'rss', 'Rss', '', '', 'page', 0, 0, 0, ''),
(58, 'main', 'main', 'Main', '', '', 'comment', 1, 0, 1, ''),
(59, 'post', 'post', 'Post', '', '', 'comment', 1, 0, 2, ''),
(60, 'like', 'like', 'Like', '', '', 'comment', 1, 0, 3, ''),
(61, 'delete', 'delete', 'Delete', '', '', 'comment', 1, 0, 4, ''),
(62, 'down', 'down', 'Down', '', '', 'comment', 1, 0, 5, ''),
(63, 'main', 'main', 'Main', '', '', 'siteterms', 1, 0, 1, ''),
(64, 'rss', 'rss', 'Rss', '', '', 'siteterms', 1, 0, 2, ''),
(65, 'sitemap', 'sitemap', 'Sitemap', '', '', 'siteterms', 0, 0, 0, ''),
(66, 'main', 'main', 'Main', '', '', 'two-step-verification', 1, 0, 1, ''),
(67, 'confirm', 'confirm', 'Confirm', '', '', 'two-step-verification', 1, 0, 2, ''),
(68, 'setup', 'setup', 'Setup', '', '', 'two-step-verification', 1, 0, 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_modthemes`
--

CREATE TABLE IF NOT EXISTS `hn4_en_modthemes` (
  `func_id` mediumint(8) DEFAULT NULL,
  `layout` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `func_id` (`func_id`,`layout`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_modthemes`
--

INSERT INTO `hn4_en_modthemes` (`func_id`, `layout`, `theme`) VALUES
(0, 'left-main-right', 'default'),
(0, 'main', 'mobile_default'),
(1, 'left-main-right', 'default'),
(1, 'main', 'mobile_default'),
(4, 'left-main-right', 'default'),
(4, 'main', 'mobile_default'),
(5, 'left-main-right', 'default'),
(5, 'main', 'mobile_default'),
(6, 'left-main-right', 'default'),
(6, 'main', 'mobile_default'),
(7, 'left-main-right', 'default'),
(7, 'main', 'mobile_default'),
(8, 'left-main-right', 'default'),
(8, 'main', 'mobile_default'),
(9, 'left-main-right', 'default'),
(9, 'main', 'mobile_default'),
(10, 'left-main-right', 'default'),
(11, 'left-main-right', 'default'),
(11, 'main', 'mobile_default'),
(12, 'left-main-right', 'default'),
(12, 'main', 'mobile_default'),
(13, 'left-main-right', 'default'),
(13, 'main', 'mobile_default'),
(20, 'left-main', 'default'),
(20, 'main', 'mobile_default'),
(21, 'left-main', 'default'),
(21, 'main', 'mobile_default'),
(22, 'left-main', 'default'),
(22, 'main', 'mobile_default'),
(23, 'left-main', 'default'),
(23, 'main', 'mobile_default'),
(24, 'left-main', 'default'),
(24, 'main', 'mobile_default'),
(25, 'left-main', 'default'),
(25, 'main', 'mobile_default'),
(26, 'left-main', 'default'),
(26, 'main', 'mobile_default'),
(27, 'left-main', 'default'),
(27, 'main', 'mobile_default'),
(28, 'left-main', 'default'),
(28, 'main', 'mobile_default'),
(29, 'left-main', 'default'),
(30, 'left-main', 'default'),
(30, 'main', 'mobile_default'),
(32, 'main', 'default'),
(32, 'main', 'mobile_default'),
(33, 'left-main', 'default'),
(33, 'main', 'mobile_default'),
(34, 'left-main', 'default'),
(34, 'main', 'mobile_default'),
(35, 'left-main', 'default'),
(35, 'main', 'mobile_default'),
(36, 'left-main', 'default'),
(36, 'main', 'mobile_default'),
(37, 'left-main', 'default'),
(37, 'main', 'mobile_default'),
(38, 'left-main', 'default'),
(38, 'main', 'mobile_default'),
(39, 'left-main', 'default'),
(39, 'main', 'mobile_default'),
(40, 'left-main', 'default'),
(40, 'main', 'mobile_default'),
(41, 'left-main', 'default'),
(41, 'main', 'mobile_default'),
(42, 'left-main', 'default'),
(42, 'main', 'mobile_default'),
(43, 'left-main-right', 'default'),
(43, 'main', 'mobile_default'),
(44, 'left-main-right', 'default'),
(44, 'main', 'mobile_default'),
(45, 'left-main-right', 'default'),
(45, 'main', 'mobile_default'),
(46, 'left-main-right', 'default'),
(46, 'main', 'mobile_default'),
(52, 'left-main-right', 'default'),
(52, 'main', 'mobile_default'),
(54, 'left-main-right', 'default'),
(54, 'main', 'mobile_default'),
(55, 'left-main', 'default'),
(55, 'main', 'mobile_default'),
(58, 'left-main-right', 'default'),
(58, 'main', 'mobile_default'),
(59, 'left-main-right', 'default'),
(59, 'main', 'mobile_default'),
(60, 'left-main-right', 'default'),
(60, 'main', 'mobile_default'),
(61, 'left-main-right', 'default'),
(61, 'main', 'mobile_default'),
(63, 'left-main-right', 'default'),
(63, 'main', 'mobile_default'),
(64, 'left-main-right', 'default'),
(64, 'main', 'mobile_default'),
(66, 'left-main-right', 'default'),
(66, 'main', 'mobile_default'),
(67, 'left-main-right', 'default'),
(67, 'main', 'mobile_default'),
(68, 'left-main-right', 'default'),
(68, 'main', 'mobile_default');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_modules`
--

CREATE TABLE IF NOT EXISTS `hn4_en_modules` (
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_file` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module_data` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module_upload` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module_theme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `set_time` int(11) unsigned NOT NULL DEFAULT '0',
  `main_file` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_file` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admins` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rss` tinyint(4) NOT NULL DEFAULT '1',
  `sitemap` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_modules`
--

INSERT INTO `hn4_en_modules` (`title`, `module_file`, `module_data`, `module_upload`, `module_theme`, `custom_title`, `site_title`, `admin_title`, `set_time`, `main_file`, `admin_file`, `theme`, `mobile`, `description`, `keywords`, `groups_view`, `weight`, `act`, `admins`, `rss`, `sitemap`) VALUES
('about', 'page', 'about', 'about', 'page', 'About', '', '', 1677364656, 1, 1, '', '', '', '', '6', 1, 1, '', 1, 1),
('zalo', 'zalo', 'zalo', 'zalo', 'zalo', 'Zalo', '', 'Zalo', 1677364656, 0, 1, '', '', '', '', '3', 2, 1, '', 0, 0),
('news', 'news', 'news', 'news', 'news', 'News', '', '', 1677364656, 1, 1, '', '', '', '', '6', 3, 1, '', 1, 1),
('users', 'users', 'users', 'users', 'users', 'Users', '', 'Users', 1677364656, 1, 1, '', '', '', '', '6', 4, 1, '', 0, 1),
('myapi', 'myapi', 'myapi', 'myapi', 'myapi', 'My APIs', '', '', 1677364656, 1, 1, '', '', '', '', '6', 5, 1, '', 0, 0),
('push', 'push', 'push', 'push', 'push', 'Push-Notification', '', '', 1677364656, 1, 1, '', '', '', '', '4', 6, 1, '', 0, 0),
('contact', 'contact', 'contact', 'contact', 'contact', 'Contact', '', '', 1677364656, 1, 1, '', '', '', '', '6', 7, 1, '', 0, 1),
('statistics', 'statistics', 'statistics', 'statistics', 'statistics', 'Statistics', '', '', 1677364656, 1, 1, '', '', '', 'online, statistics', '6', 8, 1, '', 0, 1),
('voting', 'voting', 'voting', 'voting', 'voting', 'Voting', '', '', 1677364656, 1, 1, '', '', '', '', '6', 9, 1, '', 1, 1),
('banners', 'banners', 'banners', 'banners', 'banners', 'Banners', '', '', 1677364656, 1, 1, '', '', '', '', '6', 10, 1, '', 0, 1),
('seek', 'seek', 'seek', 'seek', 'seek', 'Search', '', '', 1677364656, 1, 0, '', '', '', '', '6', 11, 1, '', 0, 1),
('menu', 'menu', 'menu', 'menu', 'menu', 'Navigation Bar', '', '', 1677364656, 0, 1, '', '', '', '', '6', 12, 1, '', 0, 1),
('feeds', 'feeds', 'feeds', 'feeds', 'feeds', 'RSS-feeds', '', '', 1677364656, 1, 1, '', '', '', '', '6', 13, 1, '', 0, 1),
('page', 'page', 'page', 'page', 'page', 'Page', '', '', 1677364656, 1, 1, '', '', '', '', '6', 14, 1, '', 1, 0),
('comment', 'comment', 'comment', 'comment', 'comment', 'Comment', '', '', 1677364656, 0, 1, '', '', '', '', '6', 15, 1, '', 0, 1),
('siteterms', 'page', 'siteterms', 'siteterms', 'page', 'Terms & Conditions', '', '', 1677364656, 1, 1, '', '', '', '', '6', 16, 1, '', 1, 1),
('freecontent', 'freecontent', 'freecontent', 'freecontent', 'freecontent', 'Introduction', '', '', 1677364656, 0, 1, '', '', '', '', '6', 17, 1, '', 0, 1),
('two-step-verification', 'two-step-verification', 'two_step_verification', 'two_step_verification', 'two-step-verification', '2-Step Verification', '', '', 1677364656, 1, 0, '', '', '', '', '6', 18, 1, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_1`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hn4_en_news_1`
--

INSERT INTO `hn4_en_news_1` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,7,8', 0, 8, 'VINADES', 0, 1277689959, 1277690410, 1, 0, 1277689920, 0, 2, 'Invite to co-operate announcement', 'Invite-to-co-operate-announcement', 'VINADES.,JSC was founded in order to professionalize NukeViet opensource development and release. We also using NukeViet in our bussiness projects to make it continue developing. Include Advertisment, provide hosting services for NukeViet CMS development.', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_2`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_3`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_4`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hn4_en_news_4`
--

INSERT INTO `hn4_en_news_4` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(4, 4, '4', 0, 1, 'VOVNews&#x002F;VNA', 0, 1292959020, 1292959513, 1, 0, 1292959020, 0, 2, 'First open-source company starts operation', 'First-open-source-company-starts-operation', 'The Vietnam Open Source Development Joint Stock Company (VINADES.,JSC), the first firm operating in the field of open source in the country, made its debut on February 25.', 'nangly.jpg', '', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0),
(5, 4, '4', 0, 1, '', 0, 1292959490, 1292959664, 1, 0, 1292959440, 0, 2, 'NukeViet 3.0 - New CMS for News site', 'NukeViet-30-New-CMS-for-News-site', 'NukeViet 3.0 is a professional system: VINADES.,JSC founded to maintain and improve NukeViet 3.0 features. VINADES.,JSC co-operated with many professional hosting providers to test compatibility issues.', 'nukeviet-cms.jpg', '', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_5`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_6`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_7`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hn4_en_news_7`
--

INSERT INTO `hn4_en_news_7` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,7,8', 0, 8, 'VINADES', 0, 1277689959, 1277690410, 1, 0, 1277689920, 0, 2, 'Invite to co-operate announcement', 'Invite-to-co-operate-announcement', 'VINADES.,JSC was founded in order to professionalize NukeViet opensource development and release. We also using NukeViet in our bussiness projects to make it continue developing. Include Advertisment, provide hosting services for NukeViet CMS development.', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(3, 12, '12,7', 0, 8, '', 2, 1277691851, 1287160943, 1, 0, 1277691840, 0, 2, 'HTML 5 review', 'HTML-5-review', 'I have to say that my money used to be on XHTML 2.0 eventually winning the battle for the next great web standard. Either that, or the two titans would continue to battle it out for the forseable future, leading to an increasingly fragmented web.', '', '', 0, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_8`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_en_news_8`
--

INSERT INTO `hn4_en_news_8` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,7,8', 0, 8, 'VINADES', 0, 1277689959, 1277690410, 1, 0, 1277689920, 0, 2, 'Invite to co-operate announcement', 'Invite-to-co-operate-announcement', 'VINADES.,JSC was founded in order to professionalize NukeViet opensource development and release. We also using NukeViet in our bussiness projects to make it continue developing. Include Advertisment, provide hosting services for NukeViet CMS development.', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(2, 14, '14,8', 0, 8, '', 1, 1277691366, 1277691470, 1, 0, 1277691360, 0, 2, 'What does WWW mean?', 'What-does-WWW-mean', 'The World Wide Web, abbreviated as WWW and commonly known as the Web, is a system of interlinked hypertext&nbsp; documents accessed via the Internet.', '', '', 0, 1, '2', 1, 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_9`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_10`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_11`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_12`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hn4_en_news_12`
--

INSERT INTO `hn4_en_news_12` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(3, 12, '12,7', 0, 8, '', 2, 1277691851, 1287160943, 1, 0, 1277691840, 0, 2, 'HTML 5 review', 'HTML-5-review', 'I have to say that my money used to be on XHTML 2.0 eventually winning the battle for the next great web standard. Either that, or the two titans would continue to battle it out for the forseable future, leading to an increasingly fragmented web.', '', '', 0, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_13`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_14`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_en_news_14`
--

INSERT INTO `hn4_en_news_14` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(2, 14, '14,8', 0, 8, '', 1, 1277691366, 1277691470, 1, 0, 1277691360, 0, 2, 'What does WWW mean?', 'What-does-WWW-mean', 'The World Wide Web, abbreviated as WWW and commonly known as the Web, is a system of interlinked hypertext&nbsp; documents accessed via the Internet.', '', '', 0, 1, '2', 1, 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_admins`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_admins` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) NOT NULL DEFAULT '0',
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `add_content` tinyint(4) NOT NULL DEFAULT '0',
  `pub_content` tinyint(4) NOT NULL DEFAULT '0',
  `edit_content` tinyint(4) NOT NULL DEFAULT '0',
  `del_content` tinyint(4) NOT NULL DEFAULT '0',
  `app_content` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`,`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_author`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_author` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pseudonym` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `numnews` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_authorlist`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_authorlist` (
  `id` int(11) NOT NULL,
  `aid` mediumint(8) NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pseudonym` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id_aid` (`id`,`aid`),
  KEY `aid` (`aid`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_block`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_block` (
  `bid` smallint(5) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  UNIQUE KEY `bid` (`bid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_block_cat`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_block_cat` (
  `bid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `adddefault` tinyint(4) NOT NULL DEFAULT '0',
  `numbers` smallint(5) NOT NULL DEFAULT '10',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(5) NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_en_news_block_cat`
--

INSERT INTO `hn4_en_news_block_cat` (`bid`, `adddefault`, `numbers`, `title`, `alias`, `image`, `description`, `weight`, `keywords`, `add_time`, `edit_time`) VALUES
(1, 0, 4, 'Hot News', 'Hot-News', '', '', 1, '', 1279963759, 1279963759),
(2, 1, 4, 'Top News', 'Top-News', '', '', 2, '', 1279963766, 1279963766);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_cat`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_cat` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titlesite` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `descriptionhtml` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `viewdescription` tinyint(2) NOT NULL DEFAULT '0',
  `weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '0',
  `lev` smallint(5) NOT NULL DEFAULT '0',
  `viewcat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'viewcat_page_new',
  `numsubcat` smallint(5) NOT NULL DEFAULT '0',
  `subcatid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `numlinks` tinyint(2) unsigned NOT NULL DEFAULT '3',
  `newday` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `featured` int(11) NOT NULL DEFAULT '0',
  `ad_block_cat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `admins` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` smallint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`),
  UNIQUE KEY `alias` (`alias`),
  KEY `parentid` (`parentid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `hn4_en_news_cat`
--

INSERT INTO `hn4_en_news_cat` (`catid`, `parentid`, `title`, `titlesite`, `alias`, `description`, `descriptionhtml`, `image`, `viewdescription`, `weight`, `sort`, `lev`, `viewcat`, `numsubcat`, `subcatid`, `numlinks`, `newday`, `featured`, `ad_block_cat`, `keywords`, `admins`, `add_time`, `edit_time`, `groups_view`, `status`) VALUES
(1, 0, 'Co-operate', '', 'Co-operate', '', '', '', 0, 2, 5, 0, 'viewcat_page_new', 2, '2,3', 3, 2, 0, '', '', '', 1277689708, 1277689708, '6', 1),
(2, 1, 'Careers at NukeViet', '', 'Careers-at-NukeViet', '', '', '', 0, 1, 6, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690086, 1277690259, '6', 1),
(3, 1, 'Partners', '', 'Partners', '', '', '', 0, 2, 7, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690142, 1277690291, '6', 1),
(4, 0, 'NukeViet news', '', 'NukeViet-news', '', '', '', 0, 1, 1, 0, 'viewcat_page_new', 3, '5,6,7', 3, 2, 0, '', '', '', 1277690451, 1277690451, '6', 1),
(5, 4, 'Security issues', '', 'Security-issues', '', '', '', 0, 1, 2, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690497, 1277690564, '6', 1),
(6, 4, 'Release notes', '', 'Release-notes', '', '', '', 0, 2, 3, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690588, 1277690588, '6', 1),
(7, 4, 'Development team talk', '', 'Development-team-talk', '', '', '', 0, 3, 4, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690652, 1277690652, '6', 1),
(8, 0, 'NukeViet community', '', 'NukeViet-community', '', '', '', 0, 3, 8, 0, 'viewcat_page_new', 3, '9,10,11', 3, 2, 0, '', '', '', 1277690748, 1277690748, '6', 1),
(9, 8, 'Activities', '', 'Activities', '', '', '', 0, 1, 9, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690765, 1277690765, '6', 1),
(10, 8, 'Events', '', 'Events', '', '', '', 0, 2, 10, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690783, 1277690783, '6', 1),
(11, 8, 'Faces of week &#x3A;D', '', 'Faces-of-week-D', '', '', '', 0, 3, 11, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690821, 1277690821, '6', 1),
(12, 0, 'Lastest technologies', '', 'Lastest-technologies', '', '', '', 0, 4, 12, 0, 'viewcat_page_new', 2, '13,14', 3, 2, 0, '', '', '', 1277690888, 1277690888, '6', 1),
(13, 12, 'World wide web', '', 'World-wide-web', '', '', '', 0, 1, 13, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690934, 1277690934, '6', 1),
(14, 12, 'Around internet', '', 'Around-internet', '', '', '', 0, 2, 14, 1, 'viewcat_page_new', 0, '', 3, 2, 0, '', '', '', 1277690982, 1277690982, '6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_config_post`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_config_post` (
  `group_id` smallint(5) NOT NULL,
  `addcontent` tinyint(4) NOT NULL,
  `postcontent` tinyint(4) NOT NULL,
  `editcontent` tinyint(4) NOT NULL,
  `delcontent` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_detail`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_detail` (
  `id` int(11) unsigned NOT NULL,
  `titlesite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyhtml` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `voicedata` text COLLATE utf8mb4_unicode_ci COMMENT 'Data giọng đọc json',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourcetext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `files` text COLLATE utf8mb4_unicode_ci,
  `imgposition` tinyint(1) NOT NULL DEFAULT '1',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `copyright` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_send` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_print` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_save` tinyint(1) NOT NULL DEFAULT '0',
  `auto_nav` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_news_detail`
--

INSERT INTO `hn4_en_news_detail` (`id`, `titlesite`, `description`, `bodyhtml`, `voicedata`, `keywords`, `sourcetext`, `files`, `imgposition`, `layout_func`, `copyright`, `allowed_send`, `allowed_print`, `allowed_save`, `auto_nav`) VALUES
(1, '', '', '<p> <span style="color: black;"><span style="color: black;"><font size="2"><span style="font-family: verdana,sans-serif;">VIETNAM OPEN SOURCE DEVELOPMENT COMPANY (VINADES.,JSC)<br /> Head office: Room 1706 – CT2 Nang Huong building, 583 Nguyen Trai street, Hanoi, Vietnam.<br /> Mobile: (+84) 24 8587 2007<br /> Fax: (+84) 24 3550 0914<br /> Website: <a f8f55ee40942436149="true" href="http://www.vinades.vn/" target="_blank">www.vinades.vn</a> - <a f8f55ee40942436149="true" href="http://www.nukeviet.vn/" target="_blank">www.nukeviet.vn</a></span></font></span></span></p><div h4f82558737983="nukeviet.vn" style="display: inline; cursor: pointer; padding-right: 16px; width: 16px; height: 16px;"> <span style="color: black;"><span style="color: black;"><font size="2"><span style="font-family: verdana,sans-serif;">&nbsp;</span></font></span></span></div><br /><p> <span style="color: black;"><span style="color: black;"><font size="2"><span style="font-family: verdana,sans-serif;">Email: <a href="mailto:contact@vinades.vn" target="_blank">contact@vinades.vn</a><br /> <br /> <br /> Dear valued customers and partners,<br /> <br /> VINADES.,JSC was founded in order to professionalize NukeViet opensource development and release. We also using NukeViet in our bussiness projects to make it continue developing.<br /> <br /> NukeViet is a Content Management System (CMS). 1st general purpose CMS developed by Vietnamese community. It have so many pros. Ex: Biggest community in VietNam, pure Vietnamese, easy to use, easy to develop...<br /> <br /> NukeViet 3 is lastest version of NukeViet and it still developing but almost complete with many advantage features.<br /> <br /> With respects to invite hosting - domain providers, and all company that pay attension to NukeViet in bussiness co-operate.<br /> <br /> Co-operate types:<br /> <br /> 1. Website advertisement, banners exchange, links:<br /> a. Description:<br /> Website advertising &amp; communication channels.<br /> On each release version of NukeViet.<br /> b. Benefits:<br /> Broadcast to all end users on both side.<br /> Reduce advertisement cost.<br /> c. Warranties:<br /> Place advertisement banner of partners on both side.<br /> Open sub-forum at NukeViet.VN to support end users who using hosting services providing by partners.<br /> <br /> 2. Provide host packet for NukeViet development testing purpose:<br /> <br /> a. Description:<br /> Sign the contract and agreements.<br /> Partners provide all types of hosting packet for VINADES.,JSC. Each type at least 1 re-sale packet.<br /> VINADES.,JSC provide an certificate verify host providing by partner compartable with NukeViet.<br /> b. Benefits:<br /> Expand market.<br /> Reduce cost, improve bussiness value.<br /> c. Warranties:<br /> Partner provide free hosting packet for VINADES.,JSC to test NukeViet compatibility.<br /> VINADES.JSC annoucement tested result to community.<br /> <br /> 3. Support end users:<br /> a. Description:<br /> Co-operate to solve problem of end user.<br /> Partners send end user requires about NukeViet CMS to VINADES.,JSC. VINADES also send user requires about hosting services to partners.<br /> b. Benefits:<br /> Reduce cost, human resources to support end users.<br /> Support end user more effective.<br /> c. Warranties:<br /> Solve end user requires as soon as possible.<br /> <br /> 4. Other types:<br /> Besides, as a publisher of NukeViet CMS, we also place advertisements on software user interface, sample articles in each release version. With thousands of downloaded hits each release version, we believe that it is the most effective advertisement type to webmasters.<br /> If partners have any ideas about new co-operate types. You are welcome and feel free to send specifics to us. Our slogan is &quot;Co-operate for development&quot;.<br /> <br /> We look forward to co-operating with you.<br /> <br /> Sincerely,<br /> <br /> VINADES.,JSC</span></font></span></span></p>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(2, '', '', '<p> With a web browser, one can view web pages&nbsp; that may contain text, images, videos, and other multimedia&nbsp; and navigate between them by using hyperlinks. Using concepts from earlier hypertext systems, British engineer and computer scientist Sir Tim Berners-Lee, now the Director of the World Wide Web Consortium, wrote a proposal in March 1989 for what would eventually become the World Wide Web. He was later joined by Belgian computer scientist Robert Cailliau while both were working at CERN in Geneva, Switzerland. In 1990, they proposed using &quot;HyperText to link and access information of various kinds as a web of nodes in which the user can browse at will&quot;, and released that web in December.<br /> <br /> &quot;The World-Wide Web (W3) was developed to be a pool of human knowledge, which would allow collaborators in remote sites to share their ideas and all aspects of a common project.&quot;. If two projects are independently crea-ted, rather than have a central figure make the changes, the two bodies of information could form into one cohesive piece of work.</p><p> For more detail. See <a href="http://en.wikipedia.org/wiki/World_Wide_Web" target="_blank">Wikipedia</a></p>', NULL, '', '', NULL, 1, '', 0, 1, 1, 1, 0),
(3, '', '', '<p> But now that the W3C has admitted defeat, and abandoned <span class="caps">XHTML</span> 2.0, there’s now no getting away f-rom the fact that <span class="caps">HTML</span> 5 is the future. As such, I’ve now spent some time taking a look at this emerging standard, and hope you’ll endulge my ego by taking a glance over my thoughts on the matter.</p><p> Before I get started though, I have to say that I’m very impressed by what I’ve seen. It’s a good set of standards that are being cre-ated, and I hope that they will gradually be adopted over the next few years.</p><h2> New markup</h2><p> <span class="caps">HTML</span> 5 introduces some new markup elements to encourage better structure within documents. The most important of these is &lt;section&gt;, which is used to define a hierarchy within a document. Sections can be nested to define subsections, and each section can be broken up into &lt;header&gt; and &lt;footer&gt; areas.</p><p> The important thing about this addition is that it removes the previous dependancy on &lt;h1&gt;, &lt;h2&gt; and related tags to define structure. Within each &lt;section&gt;, the top level heading is always &lt;h1&gt;. You can use as many &lt;h1&gt; tags as you like within your content, so long as they are correctly nested within &lt;section&gt; tags.</p><p> There’s a plethora of other new tags, all of which seem pretty useful. The best thing about all of this, however, is that there’s no reason not to start using them right away. There’s a small piece of JavaScript that’s needed to make Internet Explorer behave, but aside f-rom that it’s all good. More details about this hack are available at <a href="http://www.diveintohtml5.org/">http://www.diveintohtml5.org</a></p><h2> Easier media embedding</h2><p> <span class="caps">HTML</span> 5 defines some new tags that will make it a lot easier to embed video and audio into pages. In the same way that images are embedded using &lt;img&gt; tags, so now can video and audio files be embedded using &lt;video&gt; and &lt;audio&gt;.</p><p> I don’t think than anyone is going to complain about these new features. They free us f-rom relying on third-party plugins, such as Adobe Flash, for such simple activities such as playing video.</p><p> Unfortunately, due to some annoying licensing conditions and a lack of support for the open-source Theora codec, actually using these tags at the moment requires that videos are encoded in two different formats. Even then, you’ll still need to still provide an Adobe Flash fallback for Internet Explorer.</p><p> You’ll need to be pretty devoted to <span class="caps">HTML</span> 5 to use these tags yet…</p><h2> Relaxed markup rules</h2><p> This is one thorny subject. You know how we’ve all been so good recently with our well-formed <span class="caps">XHTML</span>, quoting those attributes and closing those tags? Now there’s no need to, apparently…</p><p> On the surface, this seems like a big step backwards into the bad days of tag soup. However, if you dig deeper, the reasoning behind this decision goes something like this:</p><ol> <li> It’s unnacceptable to crash out an entire <span class="caps">HTML</span> page just because of a simple <span class="caps">XML</span> syntax error.</li> <li> This means that browsers cannot use an <span class="caps">XML</span> parser, and must instead use a HTML-aware fault-tolerant parser.</li> <li> For consistency, all browsers should handle any such “syntax errors” (such as unquoted attributes and unclosed tags), in the same way.</li> <li> If all browsers are behaving in the same way, then unquoted attributes and unclosed tags are not really syntax errors any more. In fact, by leaving them out of our pages, we can save a few bytes!</li></ol><p> This isn’t to say that you have to throw away those <span class="caps">XHTML</span> coding habits. It’s still all valid <span class="caps">HTML</span> 5. In fact, if you really want to be strict, you can set a different content-type header to enforce well-formed <span class="caps">XHTML</span>. But for most people, we’ll just carry on coding well-formed <span class="caps">HTML</span> with the odd typo, but no longer have to worry about clients screaming at us when the perfectly-rendered page doesn’t validate.</p><h2> So what now?</h2><p> The <span class="caps">HTML</span> 5 specification is getting pretty close to stable, so it’s now safe to use bits of this new standard in your code. How much you use is entirely a personal choice. However, we should all get used to the new markup over the next few years, because <span class="caps">HTML</span> 5 is assuredly here to stay.</p><p> Myself, I’ll be switching to the new doctype and using the new markup for document sections in my code. This step involves very little effort and does a good job of showing support for the new specification.</p><p> The new media tags are another matter. Until all platforms support a single video format, it’s simply not sustainable to be transcoding all videos into two filetypes. When this is coupled with having to provide a Flash fallback, it all seems like a pretty poor return on investment.</p><p> These features will no doubt become more useable over the next few years, as newer browser take the place of old. One day, hopefully, we’ll be able write clean, semantic pages without having to worry about backwards-compatibility.</p><p> Part of this progress relies on web developers using these new standards in our pages. By adopting new technology, we show our support for the standards it represents and place pressure on browser vendors to adhere to those standards. It’s a bit of effort in the short term, but in the long term it will pay dividends.</p>'', ''http://www.etianen.com/blog/developers/2010/2/html-5-review/', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(4, '', '', '<p> <span>The Hanoi-based company will further develop and popularise an open source content management system best known as NukeViet in the country. </span></p><p> <span>VINADES Chairman Nguyen Anh Tu said NukeViet is totally free and users can download the product at www.nukeviet.vn. </span></p><p> <span>NukeViet has been widely used across the country over the past five years. The system, built on PHP-Nuke and MySQL database, enables users to easily post and manage files on the Internet or Intranet.</span></p>', NULL, '', '', NULL, 0, '', 0, 1, 1, 1, 0),
(5, '', '', '<p> NukeViet also testing by many experienced webmasters to optimize system features. NukeViet&#039;s core team are programming enthusiasts. All of them want to make NukeViet become the best and most popular open source CMS.</p><p> <strong>NukeViet 3.0 is a powerful system:</strong><br /> Learn by experiences f-rom NukeViet 2.0, NukeViet 3.0 build ground up on latest web technologies, allow you easily cre-ate portal, online news express, social network, e commerce system.<br /> NukeViet 3.0 can process huge amount of data. It was used by many companies, corporation&#039;s website with millions of news entries with high traffic.<br /> <br /> <strong>NukeViet 3.0 is easy to use system:</strong><br /> NukeViet allow you easily to customize and instantly use without any line of code. As developers, NukeViet help you build your own modules rapidly.</p><h2> NukeViet 3.0 features:</h2><p> <strong>Technology bases:</strong><br /> NukeViet 3.0 using PHP 5 and MySQL 5 as main programming languages. XTemplate and jQuery for use Ajax f-rom system core.<br /> NukeViet 3.0 is fully validated with xHTML 1.0, CSS 2.1 and compatible with all major browsers.<br /> NukeViet 3.0 layout website using grid CSS framework like BluePrintCSS for design templates rapidly.<br /> <br /> NukeViet 3.0 has it own core libraries and it is platform independent. You can build your own modules with basic knowledge of PHP and MySQL.<br /> <br /> <strong>Module structure:</strong><br /> NukeViet 3.0 re-construct module structure. All module files packed into a particular folder. It&#039;s also define module block and module theme for layout modules in many ways.<br /> <br /> NukeViet 3.0 support modules can be multiply. We called it abstract modules. It help users automatic cre-ate many modules without any line of code f-rom any exists module which support cre-ate abstract modules.<br /> <br /> NukeViet 3.0 support automatic setup modules, blocks, themes f-rom Admin Control Panel. It&#039;s also allow you to share your modules by packed it into packets. NukeViet allow grant, deny access or even re-install, de-lete module.<br /> <br /> <strong>Multi language:</strong><br /> NukeViet 3 support multi languages in 2 types. Multi interface languages and multi database languages. It had features support administrators to build new languages. In NukeViet 3, admin language, user language, interface language, database language are separate for easily build multi languages systems.<br /> <br /> <strong>Right:</strong><br /> All manage features only access in admin area. NukeViet 3.0 allow grant access by module and language. It also allow cre-ate user groups and grant access modules by group.<br /> <br /> <strong>Themes:</strong><br /> NukeViet 3.0 support automatic install and uninstall themes. You can easily customize themes in module and module&#039;s functions. NukeViet store HTML, CSS code separately f-rom PHP code to help designers rapidly layout website.<br /> <br /> <strong>Customize website using blocks</strong><br /> A block can be a widget, advertisement pictures or any defined data. You can place block in many positions visually by drag and d-rop or argument it in Admin Control Panel.<br /> <br /> <strong>Securities:</strong><br /> NukeViet using security filters to filter data upload.<br /> Logging and control access f-rom many search engine as Google, Yahoo or any search engine.<br /> Anti spam using Captcha, anti flood data...<br /> NukeViet 3.0 has logging systems to log and track information about client to prevent attack.<br /> NukeViet 3.0 support automatic up-date to fix security issues or upgrade your website to latest version of NukeViet.<br /> <br /> <strong>Database:</strong><br /> You can backup database and download backup files to restore database to any point you restored your database.<br /> <br /> <strong>Control errors report</strong><br /> You can configure to display each type of error only one time. System then sent log files about this error to administrator via email.<br /> <br /> <strong>SEO:</strong><br /> Support SEO link<br /> Manage and customize website title<br /> Manage meta tag<br /> <br /> Support keywords for cre-ate statistic via search engine<br /> <br /> <strong>Prepared for integrate with third party application</strong><br /> NukeViet 3.0 has it own user database and many built-in methods to connect with many forum application. PHPBB or VBB can integrate and use with NukeViet 3.0 by single click.<br /> <br /> <strong>Distributed login</strong><br /> NukeViet support login by OpenID. Users can login to your website by accounts f-rom popular and well-known provider, such as Google, Yahoo or other OpenID providers. It help your website more accessible and reduce user&#039;s time to filling out registration forms.<br /> <br /> Download NukeViet 3.0: <a href="http://code.google.com/p/nuke-viet/downloads/list">http://code.google.com/p/nuke-viet/downloads/list</a><br /> Website: <a href="http://nukeviet.vn/">http://nukeviet.vn</a></p>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_logs`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_logs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sid` mediumint(8) NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Khóa loại log, tùy vào lập trình',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `set_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `log_key` (`log_key`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_report`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `newsid` int(11) unsigned NOT NULL DEFAULT '0',
  `md5content` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_ip` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_time` int(11) NOT NULL DEFAULT '0',
  `orig_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `repl_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsid_md5content_post_ip` (`newsid`,`md5content`,`post_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_rows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hn4_en_news_rows`
--

INSERT INTO `hn4_en_news_rows` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,7,8', 0, 8, 'VINADES', 0, 1277689959, 1277690410, 1, 0, 1277689920, 0, 2, 'Invite to co-operate announcement', 'Invite-to-co-operate-announcement', 'VINADES.,JSC was founded in order to professionalize NukeViet opensource development and release. We also using NukeViet in our bussiness projects to make it continue developing. Include Advertisment, provide hosting services for NukeViet CMS development.', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(2, 14, '14,8', 0, 8, '', 1, 1277691366, 1277691470, 1, 0, 1277691360, 0, 2, 'What does WWW mean?', 'What-does-WWW-mean', 'The World Wide Web, abbreviated as WWW and commonly known as the Web, is a system of interlinked hypertext&nbsp; documents accessed via the Internet.', '', '', 0, 1, '2', 1, 0, 0, 0, 0, 0, 0, '', 0),
(3, 12, '12,7', 0, 8, '', 2, 1277691851, 1287160943, 1, 0, 1277691840, 0, 2, 'HTML 5 review', 'HTML-5-review', 'I have to say that my money used to be on XHTML 2.0 eventually winning the battle for the next great web standard. Either that, or the two titans would continue to battle it out for the forseable future, leading to an increasingly fragmented web.', '', '', 0, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(4, 4, '4', 0, 1, 'VOVNews&#x002F;VNA', 0, 1292959020, 1292959513, 1, 0, 1292959020, 0, 2, 'First open-source company starts operation', 'First-open-source-company-starts-operation', 'The Vietnam Open Source Development Joint Stock Company (VINADES.,JSC), the first firm operating in the field of open source in the country, made its debut on February 25.', 'nangly.jpg', '', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0),
(5, 4, '4', 0, 1, '', 0, 1292959490, 1292959664, 1, 0, 1292959440, 0, 2, 'NukeViet 3.0 - New CMS for News site', 'NukeViet-30-New-CMS-for-News-site', 'NukeViet 3.0 is a professional system: VINADES.,JSC founded to maintain and improve NukeViet 3.0 features. VINADES.,JSC co-operated with many professional hosting providers to test compatibility issues.', 'nukeviet-cms.jpg', '', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_row_histories`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_row_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `new_id` int(11) unsigned NOT NULL DEFAULT '0',
  `historytime` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ID người đăng',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sourceid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  `titlesite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyhtml` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `voicedata` text COLLATE utf8mb4_unicode_ci COMMENT 'Data giọng đọc json',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourcetext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `files` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `internal_authors` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `imgposition` tinyint(1) NOT NULL DEFAULT '1',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `copyright` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_send` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_print` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_save` tinyint(1) NOT NULL DEFAULT '0',
  `auto_nav` tinyint(1) NOT NULL DEFAULT '0',
  `changed_fields` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Các field thay đổi',
  PRIMARY KEY (`id`),
  KEY `new_id` (`new_id`),
  KEY `historytime` (`historytime`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Lịch sử bài viết' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_sources`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_sources` (
  `sourceid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL,
  `edit_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`sourceid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_en_news_sources`
--

INSERT INTO `hn4_en_news_sources` (`sourceid`, `title`, `link`, `logo`, `weight`, `add_time`, `edit_time`) VALUES
(1, 'Wikipedia', 'http://www.wikipedia.org', '', 1, 1277691366, 1277691366),
(2, 'Enlightened Website Development', 'http://www.etianen.com', '', 2, 1277691851, 1277691851);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_tags`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_tags` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `numnews` mediumint(8) NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hn4_en_news_tags`
--

INSERT INTO `hn4_en_news_tags` (`tid`, `numnews`, `title`, `alias`, `image`, `description`, `keywords`) VALUES
(1, 0, 'VINADES', 'vinades', '', '', 'vinades'),
(2, 0, 'Web', 'web', '', '', 'Web'),
(3, 0, 'HTML5', 'html5', '', '', 'html5'),
(4, 0, 'Nguyen Anh Tu', 'nguyen-anh-tu', '', '', 'nguyen anh tu'),
(5, 0, 'NukeViet', 'nukeviet', '', '', 'nukeviet');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_tags_id`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_tags_id` (
  `id` int(11) NOT NULL,
  `tid` mediumint(9) NOT NULL,
  `keyword` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id_tid` (`id`,`tid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_news_tags_id`
--

INSERT INTO `hn4_en_news_tags_id` (`id`, `tid`, `keyword`) VALUES
(1, 1, 'vinades'),
(2, 2, 'web'),
(3, 3, 'html5'),
(4, 1, 'vinades'),
(4, 4, 'nguyen anh tu'),
(5, 5, 'nukeviet'),
(5, 1, 'vinades');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_tmp`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_tmp` (
  `id` mediumint(8) unsigned NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `time_edit` int(11) NOT NULL,
  `time_late` int(11) NOT NULL,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_topics`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_topics` (
  `topicid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(5) NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topicid`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_news_voices`
--

CREATE TABLE IF NOT EXISTS `hn4_en_news_voices` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `voice_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Khóa dùng trong Api sau này',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0: Dừng, 1: Hoạt động',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `weight` (`weight`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_page`
--

CREATE TABLE IF NOT EXISTS `hn4_en_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imagealt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `socialbutton` tinyint(4) NOT NULL DEFAULT '0',
  `activecomm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot_post` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_page_config`
--

CREATE TABLE IF NOT EXISTS `hn4_en_page_config` (
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_page_config`
--

INSERT INTO `hn4_en_page_config` (`config_name`, `config_value`) VALUES
('viewtype', '0'),
('facebookapi', ''),
('per_page', '20'),
('news_first', '0'),
('related_articles', '5'),
('copy_page', '0'),
('alias_lower', '1'),
('socialbutton', 'facebook,twitter');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_referer_stats`
--

CREATE TABLE IF NOT EXISTS `hn4_en_referer_stats` (
  `host` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `month01` int(11) NOT NULL DEFAULT '0',
  `month02` int(11) NOT NULL DEFAULT '0',
  `month03` int(11) NOT NULL DEFAULT '0',
  `month04` int(11) NOT NULL DEFAULT '0',
  `month05` int(11) NOT NULL DEFAULT '0',
  `month06` int(11) NOT NULL DEFAULT '0',
  `month07` int(11) NOT NULL DEFAULT '0',
  `month08` int(11) NOT NULL DEFAULT '0',
  `month09` int(11) NOT NULL DEFAULT '0',
  `month10` int(11) NOT NULL DEFAULT '0',
  `month11` int(11) NOT NULL DEFAULT '0',
  `month12` int(11) NOT NULL DEFAULT '0',
  `last_update` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `host` (`host`),
  KEY `total` (`total`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_searchkeys`
--

CREATE TABLE IF NOT EXISTS `hn4_en_searchkeys` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skey` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `search_engine` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `id` (`id`),
  KEY `skey` (`skey`),
  KEY `search_engine` (`search_engine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_siteterms`
--

CREATE TABLE IF NOT EXISTS `hn4_en_siteterms` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imagealt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `socialbutton` tinyint(4) NOT NULL DEFAULT '0',
  `activecomm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot_post` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_siteterms_config`
--

CREATE TABLE IF NOT EXISTS `hn4_en_siteterms_config` (
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_en_siteterms_config`
--

INSERT INTO `hn4_en_siteterms_config` (`config_name`, `config_value`) VALUES
('viewtype', '0'),
('facebookapi', ''),
('per_page', '20'),
('news_first', '0'),
('related_articles', '5'),
('copy_page', '0'),
('alias_lower', '1'),
('socialbutton', 'facebook,twitter');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_voting`
--

CREATE TABLE IF NOT EXISTS `hn4_en_voting` (
  `vid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `acceptcm` int(2) NOT NULL DEFAULT '1',
  `active_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `publ_time` int(11) unsigned NOT NULL DEFAULT '0',
  `exp_time` int(11) unsigned NOT NULL DEFAULT '0',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_one` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 cho phép vote nhiều lần 1 cho phép vote 1 lần',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `question` (`question`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_voting_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_en_voting_rows` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vid` smallint(5) unsigned NOT NULL,
  `title` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `hitstotal` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vid` (`vid`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_en_voting_voted`
--

CREATE TABLE IF NOT EXISTS `hn4_en_voting_voted` (
  `vid` smallint(5) unsigned NOT NULL,
  `voted` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_extension_files`
--

CREATE TABLE IF NOT EXISTS `hn4_extension_files` (
  `idfile` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `title` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lastmodified` int(11) unsigned NOT NULL DEFAULT '0',
  `duplicate` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idfile`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_ips`
--

CREATE TABLE IF NOT EXISTS `hn4_ips` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mask` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `area` tinyint(3) NOT NULL,
  `begintime` int(11) DEFAULT NULL,
  `endtime` int(11) DEFAULT NULL,
  `notice` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_language`
--

CREATE TABLE IF NOT EXISTS `hn4_language` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `idfile` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `langtype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lang_module',
  `lang_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filelang` (`idfile`,`lang_key`,`langtype`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_language_file`
--

CREATE TABLE IF NOT EXISTS `hn4_language_file` (
  `idfile` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_file` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `langtype` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'lang_module',
  PRIMARY KEY (`idfile`),
  UNIQUE KEY `module` (`module`,`admin_file`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_logs`
--

CREATE TABLE IF NOT EXISTS `hn4_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_acess` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `userid` mediumint(8) unsigned NOT NULL,
  `log_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=275 ;

--
-- Dumping data for table `hn4_logs`
--

INSERT INTO `hn4_logs` (`id`, `lang`, `module_name`, `name_key`, `note_action`, `link_acess`, `userid`, `log_time`) VALUES
(1, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1675986866),
(2, 'vi', 'themes', 'Thiết lập giao diện theme: "licavali"', '', '', 1, 1675988266),
(3, 'vi', 'themes', 'Kích hoạt theme: "licavali"', '', '', 1, 1675988272),
(4, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1676114505),
(5, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":0,"crossadmin_restrict":1,"crosssite_valid_domains":"","crossadmin_valid_domains":"","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":0}', '', 1, 1676114540),
(6, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:171.247.155.49', '', 0, 1676117426),
(7, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:113.22.30.154', '', 0, 1676326363),
(8, 'vi', 'login', '[honguyen] Đăng nhập Thất bại', ' Client IP:171.247.155.49', '', 0, 1676735988),
(9, 'vi', 'login', '[honguyen] Đăng nhập Thất bại', ' Client IP:171.247.155.49', '', 0, 1676736017),
(10, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1676736145),
(11, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":0,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\"]","crossadmin_valid_domains":"","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":0}', '', 1, 1676736198),
(12, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":0,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"https:\\\\\\/\\\\\\/shop.mango.com\\"]","crossadmin_valid_domains":"","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":0}', '', 1, 1676736265),
(13, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":0,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"https:\\\\\\/\\\\\\/shop.mango.com\\"]","crossadmin_valid_domains":"[\\"https:\\\\\\/\\\\\\/shop.mango.com\\"]","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":0}', '', 1, 1676736315),
(14, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":1,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"https:\\\\\\/\\\\\\/shop.mango.com\\"]","crossadmin_valid_domains":"[\\"https:\\\\\\/\\\\\\/shop.mango.com\\"]","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":0}', '', 1, 1676736407),
(15, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":1,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\"]","crossadmin_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\"]","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":1}', '', 1, 1676736472),
(16, 'vi', 'menu', 'Add menu-block', 'Menu-block id: 2', '', 1, 1676737403),
(17, 'vi', 'menu', 'Add row menu', 'Row menu id: 23 of Menu id: 2', '', 1, 1676737458),
(18, 'vi', 'menu', 'Add row menu', 'Row menu id: 24 of Menu id: 2', '', 1, 1676737516),
(19, 'vi', 'menu', 'Add row menu', 'Row menu id: 25 of Menu id: 2', '', 1, 1676737526),
(20, 'vi', 'themes', 'Thêm block', 'Name : global metismenu', '', 1, 1676737581),
(21, 'vi', 'themes', 'Sửa block', 'Name : global metismenu', '', 1, 1676737603),
(22, 'vi', 'menu', 'Add row menu', 'Row menu id: 26 of Menu id: 2', '', 1, 1676743019),
(23, 'vi', 'themes', 'Sửa block', 'Name : global metismenu', '', 1, 1676743141),
(24, 'vi', 'themes', 'Sửa block', 'Name : global metismenu', '', 1, 1676743245),
(25, 'vi', 'menu', 'Add row menu', 'Row menu id: 27 of Menu id: 2', '', 1, 1676745537),
(26, 'vi', 'upload', 'Upload file', 'uploads/menu/woman.jpeg', '', 1, 1676745790),
(27, 'vi', 'menu', 'Edit row menu', 'Row menu id: 23', '', 1, 1676745797),
(28, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1676746172),
(29, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1676747443),
(30, 'vi', 'menu', 'Edit row menu', 'Row menu id: 23', '', 1, 1676747473),
(31, 'vi', 'menu', 'Edit row menu', 'Row menu id: 24', '', 1, 1676747485),
(32, 'vi', 'menu', 'Edit row menu', 'Row menu id: 23', '', 1, 1676748427),
(33, 'vi', 'upload', 'Công cụ ảnh', 'uploads/logo_26_30.jpg', '', 1, 1676748996),
(34, 'vi', 'upload', 'Upload file', 'uploads/bags.jpg', '', 1, 1676749829),
(35, 'vi', 'upload', 'Upload file', 'uploads/the-trench.jpg', '', 1, 1676750084),
(36, 'vi', 'upload', 'Upload file', 'uploads/denim.jpg', '', 1, 1676750273),
(37, 'vi', 'upload', 'Upload file', 'uploads/office.jpg', '', 1, 1676750395),
(38, 'vi', 'upload', 'Upload file', 'uploads/selection.jpg', '', 1, 1676750523),
(39, 'vi', 'upload', 'Upload file', 'uploads/special.jpg', '', 1, 1676750807),
(40, 'vi', 'upload', 'Upload file', 'uploads/selection2.jpg', '', 1, 1676751143),
(41, 'vi', 'upload', 'Upload file', 'uploads/vest.jpg', '', 1, 1676751371),
(42, 'vi', 'upload', 'Upload file', 'uploads/dress.jpg', '', 1, 1676751521),
(43, 'vi', 'upload', 'Upload file', 'uploads/shoe.jpg', '', 1, 1676751647),
(44, 'vi', 'upload', 'Upload file', 'uploads/car.jpg', '', 1, 1676751728),
(45, 'vi', 'upload', 'Upload file', 'uploads/bags2.jpg', '', 1, 1676751813),
(46, 'vi', 'upload', 'Upload file', 'uploads/bags4.jpg', '', 1, 1676751814),
(47, 'vi', 'upload', 'Upload file', 'uploads/mom.jpg', '', 1, 1676751981),
(48, 'vi', 'upload', 'Upload file', 'uploads/kids.jpg', '', 1, 1676752142),
(49, 'vi', 'menu', 'Edit row menu', 'Row menu id: 23', '', 1, 1676752504),
(50, 'vi', 'menu', 'Edit row menu', 'Row menu id: 24', '', 1, 1676752518),
(51, 'vi', 'menu', 'Edit row menu', 'Row menu id: 25', '', 1, 1676752531),
(52, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:113.22.30.154', '', 0, 1676756611),
(53, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:113.22.30.154', '', 0, 1676768866),
(54, 'vi', 'menu', 'Edit row menu', 'Row menu id: 23', '', 1, 1676768885),
(55, 'vi', 'menu', 'Edit row menu', 'Row menu id: 24', '', 1, 1676768898),
(56, 'vi', 'menu', 'Edit row menu', 'Row menu id: 25', '', 1, 1676768916),
(57, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1676811352),
(58, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1676812028),
(59, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:14.187.157.124', '', 0, 1676815654),
(60, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1676856254),
(61, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1676856263),
(62, 'vi', 'login', '[nvholding] Đăng nhập Thất bại', ' Client IP:14.187.157.124', '', 0, 1677353346),
(63, 'vi', 'login', '[honguyen] Đăng nhập Thất bại', ' Client IP:14.187.157.124', '', 0, 1677353352),
(64, 'vi', 'login', '[nvholding] Đăng nhập Thất bại', ' Client IP:14.187.157.124', '', 0, 1677353361),
(65, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1677353371),
(66, 'vi', 'modules', 'Thiết lập module mới shops', '', '', 1, 1677353388),
(67, 'vi', 'modules', 'Sửa module &ldquo;shops&rdquo;', '', '', 1, 1677353498),
(68, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:14.187.157.124', '', 0, 1677355282),
(69, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1677355517),
(70, 'vi', 'menu', 'Edit row menu', 'Row menu id: 23', '', 1, 1677355580),
(71, 'vi', 'menu', 'Edit row menu', 'Row menu id: 24', '', 1, 1677355607),
(72, 'vi', 'menu', 'Edit row menu', 'Row menu id: 25', '', 1, 1677355627),
(73, 'vi', 'shops', 'log_edit_catalog', 'id 2', '', 1, 1677355937),
(74, 'vi', 'shops', 'log_edit_catalog', 'id 3', '', 1, 1677355954),
(75, 'vi', 'shops', 'log_edit_catalog', 'id 4', '', 1, 1677355979),
(76, 'vi', 'shops', 'log_del_catalog', 'id 22', '', 1, 1677356033),
(77, 'vi', 'shops', 'log_del_catalog', 'id 21', '', 1, 1677356036),
(78, 'vi', 'shops', 'log_del_catalog', 'id 20', '', 1, 1677356038),
(79, 'vi', 'shops', 'log_del_catalog', 'id 19', '', 1, 1677356040),
(80, 'vi', 'shops', 'log_del_catalog', 'id 18', '', 1, 1677356043),
(81, 'vi', 'shops', 'log_del_catalog', 'id 12', '', 1, 1677356050),
(82, 'vi', 'shops', 'log_del_catalog', 'id 5', '', 1, 1677356091),
(83, 'vi', 'shops', 'log_del_catalog', 'id 16', '', 1, 1677356097),
(84, 'vi', 'shops', 'log_del_catalog', 'id 14', '', 1, 1677356109),
(85, 'vi', 'shops', 'log_del_catalog', 'id 8', '', 1, 1677356150),
(86, 'vi', 'shops', 'log_del_catalog', 'id 9', '', 1, 1677356153),
(87, 'vi', 'shops', 'Cấu hình module', 'Setting', '', 1, 1677356592),
(88, 'vi', 'menu', 'Edit row menu', 'Row menu id: 24', '', 1, 1677359916),
(89, 'vi', 'menu', 'Edit row menu', 'Row menu id: 25', '', 1, 1677359926),
(90, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:14.187.157.124', '', 0, 1677362122),
(91, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1677364583),
(92, 'vi', 'language', 'Cài đặt mới Ngôn ngữ data', ' langkey : en', '', 1, 1677364656),
(93, 'vi', 'themes', 'Thiết lập layout theme: "licavali"', '', '', 1, 1677364812),
(94, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1677364979),
(95, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/denim.jpg', '', 1, 1677367894),
(96, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/dress.jpg', '', 1, 1677367894),
(97, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/kids.jpg', '', 1, 1677367895),
(98, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/mom.jpg', '', 1, 1677367895),
(99, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/office.jpg', '', 1, 1677367895),
(100, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/selection.jpg', '', 1, 1677367897),
(101, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/selection2.jpg', '', 1, 1677367897),
(102, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/special.jpg', '', 1, 1677367898),
(103, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/the-trench.jpg', '', 1, 1677367898),
(104, 'vi', 'upload', 'Upload file', 'uploads/shops/2015_05/vest.jpg', '', 1, 1677367898),
(105, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677367910),
(106, 'vi', 'shops', 'Edit A Product', 'ID: 7', '', 1, 1677367926),
(107, 'vi', 'shops', 'Edit A Product', 'ID: 6', '', 1, 1677367975),
(108, 'vi', 'shops', 'Edit A Product', 'ID: 5', '', 1, 1677367999),
(109, 'vi', 'shops', 'Edit A Product', 'ID: 2', '', 1, 1677368015),
(110, 'vi', 'shops', 'Edit A Product', 'ID: 3', '', 1, 1677368036),
(111, 'vi', 'shops', 'Edit A Product', 'ID: 4', '', 1, 1677368063),
(112, 'vi', 'shops', 'Edit A Product', 'ID: 1', '', 1, 1677368096),
(113, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677368927),
(114, 'vi', 'shops', 'Edit A Product', 'ID: 7', '', 1, 1677368935),
(115, 'vi', 'shops', 'Edit A Product', 'ID: 6', '', 1, 1677368942),
(116, 'vi', 'shops', 'Edit A Product', 'ID: 5', '', 1, 1677368949),
(117, 'vi', 'shops', 'Edit A Product', 'ID: 4', '', 1, 1677368956),
(118, 'vi', 'shops', 'Edit A Product', 'ID: 3', '', 1, 1677368963),
(119, 'vi', 'shops', 'Edit A Product', 'ID: 2', '', 1, 1677368969),
(120, 'vi', 'shops', 'Edit A Product', 'ID: 1', '', 1, 1677368976),
(121, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:14.187.157.124', '', 0, 1677373041),
(122, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1677437347),
(123, 'vi', 'shops', 'log_edit_catalog', 'id 2', '', 1, 1677439856),
(124, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677440212),
(125, 'vi', 'shops', 'log_edit_catalog', 'id 2', '', 1, 1677440385),
(126, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677440415),
(127, 'vi', 'shops', 'log_edit_catalog', 'id 2', '', 1, 1677440820),
(128, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677440895),
(129, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677444225),
(130, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677444291),
(131, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1677444721),
(132, 'vi', 'login', '[nvholding] Đăng nhập Thất bại', ' Client IP:14.224.169.100', '', 0, 1677582806),
(133, 'vi', 'login', '[nvholding] Đăng nhập Thất bại', ' Client IP:14.224.169.100', '', 0, 1677582809),
(134, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.224.169.100', '', 0, 1677582829),
(135, 'vi', 'shops', 'log_add_catalog', 'id 23', '', 1, 1677582871),
(136, 'vi', 'shops', 'log_add_catalog', 'id 24', '', 1, 1677582882),
(137, 'vi', 'shops', 'log_add_catalog', 'id 25', '', 1, 1677582921),
(138, 'vi', 'shops', 'log_edit_catalog', 'id 25', '', 1, 1677582971),
(139, 'vi', 'shops', 'log_add_catalog', 'id 26', '', 1, 1677583022),
(140, 'vi', 'shops', 'log_add_catalog', 'id 27', '', 1, 1677583045),
(141, 'vi', 'shops', 'log_edit_catalog', 'id 27', '', 1, 1677583055),
(142, 'vi', 'shops', 'log_add_catalog', 'id 28', '', 1, 1677583089),
(143, 'vi', 'shops', 'log_add_catalog', 'id 29', '', 1, 1677583108),
(144, 'vi', 'shops', 'log_add_catalog', 'id 30', '', 1, 1677583116),
(145, 'vi', 'shops', 'log_add_catalog', 'id 31', '', 1, 1677583126),
(146, 'vi', 'shops', 'log_add_catalog', 'id 32', '', 1, 1677583180),
(147, 'vi', 'shops', 'log_add_catalog', 'id 33', '', 1, 1677583189),
(148, 'vi', 'shops', 'log_add_catalog', 'id 34', '', 1, 1677583204),
(149, 'vi', 'shops', 'log_add_catalog', 'id 35', '', 1, 1677583212),
(150, 'vi', 'shops', 'log_add_catalog', 'id 36', '', 1, 1677583234),
(151, 'vi', 'shops', 'log_add_catalog', 'id 37', '', 1, 1677583242),
(152, 'vi', 'shops', 'log_add_catalog', 'id 38', '', 1, 1677583265),
(153, 'vi', 'shops', 'log_add_catalog', 'id 39', '', 1, 1677583319),
(154, 'vi', 'shops', 'log_add_catalog', 'id 40', '', 1, 1677583334),
(155, 'vi', 'shops', 'log_add_catalog', 'id 41', '', 1, 1677583343),
(156, 'vi', 'shops', 'log_add_catalog', 'id 42', '', 1, 1677583372),
(157, 'vi', 'menu', 'Add row menu', 'Row menu id: 28 of Menu id: 2', '', 1, 1677583430),
(158, 'vi', 'menu', 'Edit row menu', 'Row menu id: 28', '', 1, 1677583439),
(159, 'vi', 'menu', 'Del row menu', 'Row menu id: 26 of Menu-block id: 2', '', 1, 1677583466),
(160, 'vi', 'menu', 'Add row menu', 'Row menu id: 29 of Menu id: 2', '', 1, 1677583484),
(161, 'vi', 'menu', 'Add row menu', 'Row menu id: 30 of Menu id: 2', '', 1, 1677583499),
(162, 'vi', 'menu', 'Add row menu', 'Row menu id: 31 of Menu id: 2', '', 1, 1677583514),
(163, 'vi', 'menu', 'Add row menu', 'Row menu id: 32 of Menu id: 2', '', 1, 1677583532),
(164, 'vi', 'menu', 'Add row menu', 'Row menu id: 33 of Menu id: 2', '', 1, 1677583544),
(165, 'vi', 'menu', 'Add row menu', 'Row menu id: 34 of Menu id: 2', '', 1, 1677583562),
(166, 'vi', 'menu', 'Add row menu', 'Row menu id: 35 of Menu id: 2', '', 1, 1677583601),
(167, 'vi', 'menu', 'Add row menu', 'Row menu id: 36 of Menu id: 2', '', 1, 1677583618),
(168, 'vi', 'menu', 'Add row menu', 'Row menu id: 37 of Menu id: 2', '', 1, 1677583643),
(169, 'vi', 'menu', 'Add row menu', 'Row menu id: 38 of Menu id: 2', '', 1, 1677583661),
(170, 'vi', 'menu', 'Add row menu', 'Row menu id: 39 of Menu id: 2', '', 1, 1677583678),
(171, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.224.169.100', '', 0, 1677603486),
(172, 'vi', 'menu', 'Add row menu', 'Row menu id: 40 of Menu id: 2', '', 1, 1677603520),
(173, 'vi', 'menu', 'Add row menu', 'Row menu id: 41 of Menu id: 2', '', 1, 1677603536),
(174, 'vi', 'upload', 'Upload file', 'uploads/linh-cavali.jpg', '', 1, 1677611114),
(175, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1677932376),
(176, 'vi', 'login', '[honguyen] Đăng nhập Thất bại', ' Client IP:171.247.155.49', '', 0, 1677941706),
(177, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1677941713),
(178, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1677961229),
(179, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:14.187.157.124', '', 0, 1677969492),
(180, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1677969498),
(181, 'vi', 'shops', 'Sửa nhóm sản phẩm', 'Thương hiệu', '', 1, 1677971398),
(182, 'vi', 'shops', 'log_add_group', 'id 58', '', 1, 1677972676),
(183, 'vi', 'shops', 'log_add_group', 'id 59', '', 1, 1677972688),
(184, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:1.52.129.197', '', 0, 1678043923),
(185, 'vi', 'themes', 'Thêm block', 'Name : global user button', '', 1, 1678043973),
(186, 'vi', 'themes', 'Sửa block', 'Name : global user button', '', 1, 1678044011),
(187, 'vi', 'themes', 'Thêm block', 'Name : global block cart', '', 1, 1678044158),
(188, 'vi', 'themes', 'Sửa block', 'Name : global user button', '', 1, 1678044338),
(189, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:1.52.129.197', '', 0, 1678062777),
(190, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678062784),
(191, 'vi', 'shops', 'Xóa nhóm và các sản phẩm', 'aaaaaaa', '', 1, 1678062792),
(192, 'vi', 'shops', 'Xóa nhóm và các sản phẩm', 'aaa', '', 1, 1678062814),
(193, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678063214),
(194, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678063361),
(195, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678126644),
(196, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678126649),
(197, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:171.247.155.49', '', 0, 1678128452),
(198, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:1.52.129.197', '', 0, 1678142317),
(199, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678280416),
(200, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678280421),
(201, 'vi', 'modules', 'Sửa module &ldquo;shops&rdquo;', '', '', 1, 1678283072),
(202, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:171.247.155.49', '', 0, 1678284903),
(203, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678286090),
(204, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:171.247.155.49', '', 0, 1678287903),
(205, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678363687),
(206, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678363697),
(207, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678363897),
(208, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678363908),
(209, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678365180),
(210, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678365190),
(211, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:113.161.46.160', '', 0, 1678382866),
(212, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:1.52.129.197', '', 0, 1678401845),
(213, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":1,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/www.acfc.com.vn\\"]","crossadmin_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/www.acfc.com.vn\\"]","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":1}', '', 1, 1678403058),
(214, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678403316),
(215, 'vi', 'settings', 'LOG_CHANGE_CORS_SETTING', '{"crosssite_restrict":1,"crossadmin_restrict":1,"crosssite_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/www.acfc.com.vn\\",\\"http:\\\\\\/\\\\\\/www.acfc.com.vn\\"]","crossadmin_valid_domains":"[\\"http:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/shop.mango.com\\",\\"https:\\\\\\/\\\\\\/www.acfc.com.vn\\",\\"http:\\\\\\/\\\\\\/www.acfc.com.vn\\"]","crosssite_valid_ips":"","crossadmin_valid_ips":"","ip_allow_null_origin":"","crosssite_allowed_variables":"","allow_null_origin":1}', '', 1, 1678403583),
(216, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678407677),
(217, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678407693),
(218, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678409288),
(219, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678409298),
(220, 'vi', 'login', '[cnlinhcavali] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678442330),
(221, 'vi', 'login', '[linhcavali] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678442345),
(222, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678446727),
(223, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678446743),
(224, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678455242),
(225, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678455256),
(226, 'vi', 'login', '[cnlinhcavali] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678518822),
(227, 'vi', 'login', '[linhcavali] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678518833),
(228, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678523182),
(229, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678523192),
(230, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678539197),
(231, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678562204),
(232, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:58.186.109.39', '', 0, 1678579207),
(233, 'vi', 'shops', 'Edit A Product', 'ID: 8', '', 1, 1678579390),
(234, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678585342),
(235, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678585352),
(236, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678595549),
(237, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.76', '', 0, 1678595559),
(238, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678631417),
(239, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678631426),
(240, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678644831),
(241, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678644845),
(242, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678677452),
(243, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678677462),
(244, 'vi', 'login', '[cnadmin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678686067),
(245, 'vi', 'login', '[admin] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678686082),
(246, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678724130),
(247, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678724140),
(248, 'vi', 'login', '[cnlinhcavali] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678726987),
(249, 'vi', 'login', '[linhcavali] Đăng nhập Thất bại', ' Client IP:5.188.62.21', '', 0, 1678726999),
(250, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678771055),
(251, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678771064),
(252, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678817462),
(253, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678817473),
(254, 'vi', 'login', '[honguyen] Đăng nhập Thất bại', ' Client IP:171.247.155.49', '', 0, 1678819725),
(255, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678819733),
(256, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678819741),
(257, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678835326),
(258, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678835334),
(259, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678863893),
(260, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678863903),
(261, 'vi', 'login', '[nvholding] Đăng nhập Thất bại', ' Client IP:171.247.155.49', '', 0, 1678889305),
(262, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678889316),
(263, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678889328),
(264, 'vi', 'login', '[nvholding] Thoát khỏi tài khoản quản trị', ' Client IP:171.247.155.49', '', 0, 1678891141),
(265, 'vi', 'login', '[nvholding] Đăng nhập', ' Client IP:171.247.155.49', '', 0, 1678893014),
(266, 'vi', 'webtools', 'Dọn dẹp hệ thống', 'clearcache, clearfiletemp, clearerrorlogs, clearip_logs', '', 1, 1678893020),
(267, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678908955),
(268, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678908964),
(269, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678956426),
(270, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678956436),
(271, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678996127),
(272, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1678996137),
(273, 'vi', 'login', '[cnAdmin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1679043038),
(274, 'vi', 'login', '[Admin] Đăng nhập Thất bại', ' Client IP:5.188.62.140', '', 0, 1679043048);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_notification`
--

CREATE TABLE IF NOT EXISTS `hn4_notification` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `admin_view_allowed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Cấp quản trị được xem: 0,1,2',
  `logic_mode` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: Cấp trên xem được cấp dưới, 1: chỉ cấp hoặc người được chỉ định',
  `send_to` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Danh sách id người nhận, phân cách bởi dấu phảy',
  `send_from` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `area` tinyint(1) unsigned NOT NULL,
  `language` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `obid` int(11) unsigned NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` int(11) unsigned NOT NULL,
  `view` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `send_to` (`send_to`),
  KEY `admin_view_allowed` (`admin_view_allowed`),
  KEY `logic_mode` (`logic_mode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_plugins`
--

CREATE TABLE IF NOT EXISTS `hn4_plugins` (
  `pid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_lang` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `plugin_file` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_area` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `plugin_module_file` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook_module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` tinyint(4) NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `plugin` (`plugin_lang`,`plugin_file`,`plugin_area`,`plugin_module_name`,`hook_module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1001 ;

--
-- Dumping data for table `hn4_plugins`
--

INSERT INTO `hn4_plugins` (`pid`, `plugin_lang`, `plugin_file`, `plugin_area`, `plugin_module_name`, `plugin_module_file`, `hook_module`, `weight`) VALUES
(1, 'all', 'qrcode.php', 'get_qr_code', '', '', '', 1),
(2, 'all', 'cdn_js_css_image.php', 'change_site_buffer', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_push`
--

CREATE TABLE IF NOT EXISTS `hn4_push` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `receiver_grs` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `receiver_ids` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sender_role` enum('system','group','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'system',
  `sender_group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender_admin` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `exp_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_push_status`
--

CREATE TABLE IF NOT EXISTS `hn4_push_status` (
  `pid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `shown_time` int(11) unsigned NOT NULL DEFAULT '0',
  `viewed_time` int(11) unsigned NOT NULL DEFAULT '0',
  `favorite_time` int(11) unsigned NOT NULL DEFAULT '0',
  `hidden_time` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `pid_userid` (`pid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_sessions`
--

CREATE TABLE IF NOT EXISTS `hn4_sessions` (
  `session_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `onl_time` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `session_id` (`session_id`),
  KEY `onl_time` (`onl_time`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_sessions`
--

INSERT INTO `hn4_sessions` (`session_id`, `userid`, `username`, `onl_time`) VALUES
('dbbsesack5l4b60ahstg2aofo0', 0, 'bot:Chrome', 1679054320),
('jjafdc6eb0a4njfa12f2b2pr76', 0, 'guest', 1679058305),
('0qken449vb9lij1ov8r7jf1q96', 0, 'guest', 1679058122),
('2255i41527sv4p9nu42srp8ml0', 0, 'guest', 1679054084);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_setup_extensions`
--

CREATE TABLE IF NOT EXISTS `hn4_setup_extensions` (
  `id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'other',
  `title` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_sys` tinyint(1) NOT NULL DEFAULT '0',
  `is_virtual` tinyint(1) NOT NULL DEFAULT '0',
  `basename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table_prefix` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `author` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  UNIQUE KEY `title` (`type`,`title`),
  KEY `id` (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_setup_extensions`
--

INSERT INTO `hn4_setup_extensions` (`id`, `type`, `title`, `is_sys`, `is_virtual`, `basename`, `table_prefix`, `version`, `addtime`, `author`, `note`) VALUES
(0, 'module', 'about', 0, 0, 'page', 'about', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(0, 'module', 'siteterms', 0, 0, 'page', 'siteterms', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(19, 'module', 'banners', 1, 0, 'banners', 'banners', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(0, 'module', 'zalo', 1, 0, 'zalo', 'zalo', '4.6.00 1637048941', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(20, 'module', 'contact', 0, 1, 'contact', 'contact', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(1, 'module', 'news', 0, 1, 'news', 'news', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(21, 'module', 'voting', 0, 0, 'voting', 'voting', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(0, 'module', 'shops', 0, 1, 'shops', 'shops', '4.5.02 1664006400', 1677353379, 'VINADES <contact@vinades.vn>', ''),
(284, 'module', 'seek', 1, 0, 'seek', 'seek', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(24, 'module', 'users', 1, 1, 'users', 'users', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(27, 'module', 'statistics', 0, 0, 'statistics', 'statistics', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(29, 'module', 'menu', 0, 0, 'menu', 'menu', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(283, 'module', 'feeds', 1, 0, 'feeds', 'feeds', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(282, 'module', 'page', 1, 1, 'page', 'page', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(281, 'module', 'comment', 1, 0, 'comment', 'comment', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(312, 'module', 'freecontent', 0, 1, 'freecontent', 'freecontent', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(327, 'module', 'two-step-verification', 1, 0, 'two-step-verification', 'two_step_verification', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(307, 'theme', 'default', 0, 0, 'default', 'default', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(311, 'theme', 'mobile_default', 0, 0, 'mobile_default', 'mobile_default', '4.5.00 1626512400', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(22, 'module', 'push', 1, 0, 'push', 'push', '4.6.00 1666092814', 1675986735, 'VINADES <contact@vinades.vn>', ''),
(22, 'module', 'myapi', 1, 0, 'myapi', 'myapi', '4.6.00 1666092814', 1675986735, 'VINADES <contact@vinades.vn>', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_setup_language`
--

CREATE TABLE IF NOT EXISTS `hn4_setup_language` (
  `lang` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setup` tinyint(1) NOT NULL DEFAULT '0',
  `weight` smallint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_setup_language`
--

INSERT INTO `hn4_setup_language` (`lang`, `setup`, `weight`) VALUES
('vi', 1, 1),
('en', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_block`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_block` (
  `bid` int(11) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  UNIQUE KEY `bid` (`bid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_shops_block`
--

INSERT INTO `hn4_shops_block` (`bid`, `id`, `weight`) VALUES
(1, 11, 5),
(1, 10, 4),
(1, 9, 3),
(1, 6, 0),
(1, 5, 0),
(2, 4, 0),
(2, 3, 0),
(2, 2, 0),
(2, 1, 0),
(1, 8, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_block_cat`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_block_cat` (
  `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `adddefault` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_bodytext` text COLLATE utf8mb4_unicode_ci,
  `vi_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_tag_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_tag_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bid`),
  UNIQUE KEY `vi_alias` (`vi_alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hn4_shops_block_cat`
--

INSERT INTO `hn4_shops_block_cat` (`bid`, `adddefault`, `image`, `weight`, `add_time`, `edit_time`, `vi_title`, `vi_alias`, `vi_description`, `vi_bodytext`, `vi_keywords`, `vi_tag_title`, `vi_tag_description`) VALUES
(1, 1, '', 1, 1433298294, 1677354743, 'Linh Cavali Fashion', 'linh-cavali-fashion', '', '', '', '', ''),
(2, 0, '', 2, 1433298325, 1677354722, 'Bag &amp; Shoe', 'bag-shoe', '', '', '', '', ''),
(3, 0, '', 3, 1677354758, 1677354758, 'Accessories', 'Accessories', '', '', 'accessories', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_carrier`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_carrier` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_carrier_config`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_carrier_config` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_carrier_config_items`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_carrier_config_items` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `cid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` smallint(4) unsigned NOT NULL,
  `add_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_carrier_config_location`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_carrier_config_location` (
  `cid` tinyint(3) unsigned NOT NULL,
  `iid` smallint(4) unsigned NOT NULL,
  `lid` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `cid` (`cid`,`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_carrier_config_weight`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_carrier_config_weight` (
  `iid` smallint(4) unsigned NOT NULL,
  `weight` double unsigned NOT NULL,
  `weight_unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `carrier_price_unit` char(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_catalogs`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_catalogs` (
  `catid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) NOT NULL DEFAULT '0',
  `lev` smallint(4) NOT NULL DEFAULT '0',
  `viewcat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'viewcat_page_new',
  `numsubcat` int(11) NOT NULL DEFAULT '0',
  `subcatid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `numlinks` tinyint(2) unsigned NOT NULL DEFAULT '3',
  `newday` tinyint(4) NOT NULL DEFAULT '3',
  `typeprice` tinyint(4) NOT NULL DEFAULT '2',
  `form` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_price` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `viewdescriptionhtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admins` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `groups_view` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cat_allow_point` tinyint(1) NOT NULL DEFAULT '0',
  `cat_number_point` tinyint(4) NOT NULL DEFAULT '0',
  `cat_number_product` tinyint(4) NOT NULL DEFAULT '0',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_title_custom` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_descriptionhtml` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_tag_description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`catid`),
  UNIQUE KEY `vi_alias` (`vi_alias`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `hn4_shops_catalogs`
--

INSERT INTO `hn4_shops_catalogs` (`catid`, `parentid`, `image`, `weight`, `sort`, `lev`, `viewcat`, `numsubcat`, `subcatid`, `inhome`, `numlinks`, `newday`, `typeprice`, `form`, `group_price`, `viewdescriptionhtml`, `admins`, `add_time`, `edit_time`, `groups_view`, `cat_allow_point`, `cat_number_point`, `cat_number_product`, `vi_title`, `vi_title_custom`, `vi_alias`, `vi_description`, `vi_descriptionhtml`, `vi_keywords`, `vi_tag_description`) VALUES
(2, 0, '', 1, 1, 0, 'viewlist', 11, '23,24,25,26,27,28,29,30,31,32,33', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1432362728, 1677440820, '6', 0, 0, 0, 'Linh Cavali Fashion', 'Váy', 'linh-cavali-fashion', '', '', 'váy, vay', ''),
(3, 0, '', 2, 22, 0, 'viewlist', 0, '', 1, 4, 7, 1, '', '', 0, '', 1432362789, 1677355954, '6', 0, 0, 0, 'Bags &amp; Shoe', 'Giày dép', 'bags-shoe', '', '', 'giay, dep, giày, dép', ''),
(4, 0, '', 3, 23, 0, 'viewlist', 0, '', 1, 4, 7, 1, '', '', 0, '', 1432362835, 1677355979, '6', 0, 0, 0, 'Accessories', 'Áo', 'accessories', '', '', 'áo, ao', ''),
(42, 33, '', 3, 21, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583372, 1677583372, '6', 0, 0, 0, 'Quần short', '', 'quan-short', '', '', '', ''),
(41, 33, '', 2, 20, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583343, 1677583343, '6', 0, 0, 0, 'Quần dài', '', 'quan-dai', '', '', '', ''),
(40, 33, '', 1, 19, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583334, 1677583334, '6', 0, 0, 0, 'Quần Jean', '', 'quan-jean', '', '', '', ''),
(39, 32, '', 6, 17, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583319, 1677583319, '6', 0, 0, 0, 'Áo Hoodie - Sweater', '', 'ao-hoodie-sweater', '', '', '', ''),
(23, 2, '', 1, 2, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677582871, 1677582871, '6', 0, 0, 0, 'Đầm', '', 'dam', '', '', '', ''),
(24, 2, '', 2, 3, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677582882, 1677582882, '6', 0, 0, 0, 'Chân váy', '', 'Chan-vay', '', '', '', ''),
(25, 2, '', 3, 4, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677582921, 1677582971, '6', 0, 0, 0, 'Áo khoác', '', 'ao-khoac', '', '', '', ''),
(26, 2, '', 4, 5, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583022, 1677583022, '6', 0, 0, 0, 'Jumpsuit &amp; Playsuit', '', 'jumpsuit-playsuit', '', '', '', ''),
(27, 2, '', 5, 6, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583045, 1677583055, '6', 0, 0, 0, 'Đồ bơi', '', 'Do-boi', '', '', '', ''),
(28, 2, '', 6, 7, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583089, 1677583089, '6', 0, 0, 0, 'Đồ thể thao', '', 'do-the-thao', '', '', '', ''),
(29, 2, '', 7, 8, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583108, 1677583108, '6', 0, 0, 0, 'Đồ ngủ', '', 'do-ngu', '', '', '', ''),
(30, 2, '', 8, 9, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583116, 1677583116, '6', 0, 0, 0, 'Đồ lót', '', 'do-lot', '', '', '', ''),
(31, 2, '', 9, 10, 1, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583126, 1677583126, '6', 0, 0, 0, 'Đồ Vest', '', 'Do-Vest', '', '', '', ''),
(32, 2, '', 10, 11, 1, 'viewlist', 6, '34,35,36,37,38,39', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583180, 1677583180, '6', 0, 0, 0, 'Áo nữ', '', 'ao-nu', '', '', '', ''),
(33, 2, '', 11, 18, 1, 'viewlist', 3, '40,41,42', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583189, 1677583189, '6', 0, 0, 0, 'Quẩn nữ', '', 'Quan-nu', '', '', '', ''),
(34, 32, '', 1, 12, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583204, 1677583204, '6', 0, 0, 0, 'Áo sơ mi', '', 'Ao-so-mi', '', '', '', ''),
(35, 32, '', 2, 13, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583212, 1677583212, '6', 0, 0, 0, 'Áo polo', '', 'ao-polo', '', '', '', ''),
(36, 32, '', 3, 14, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583234, 1677583234, '6', 0, 0, 0, 'Áo thun', '', 'Ao-thun', '', '', '', ''),
(37, 32, '', 4, 15, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583242, 1677583242, '6', 0, 0, 0, 'Áo kiểu', '', 'ao-kieu', '', '', '', ''),
(38, 32, '', 5, 16, 2, 'viewlist', 0, '', 1, 4, 7, 1, 'thuong_hieu', '', 0, '', 1677583265, 1677583265, '6', 0, 0, 0, 'Áo dây - Áo ba lỗ', '', 'Ao-day-Ao-ba-lo', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_coupons`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_coupons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'p',
  `discount` double NOT NULL DEFAULT '0',
  `total_amount` double NOT NULL DEFAULT '0',
  `date_start` int(11) unsigned NOT NULL DEFAULT '0',
  `date_end` int(11) unsigned NOT NULL DEFAULT '0',
  `uses_per_coupon` int(11) unsigned NOT NULL DEFAULT '0',
  `uses_per_coupon_count` int(11) NOT NULL DEFAULT '0',
  `date_added` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_coupons_history`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_coupons_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `date_added` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_coupons_product`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_coupons_product` (
  `cid` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  UNIQUE KEY `cid` (`cid`,`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_discounts`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_discounts` (
  `did` smallint(6) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` smallint(6) NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `begin_time` int(11) unsigned NOT NULL DEFAULT '0',
  `end_time` int(11) unsigned NOT NULL DEFAULT '0',
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`),
  KEY `begin_time` (`begin_time`,`end_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_field`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_field` (
  `fid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `field` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `listtemplate` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tab` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  `field_type` enum('number','date','textbox','textarea','editor','select','radio','checkbox','multiselect') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'textbox',
  `field_choices` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql_choices` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_type` enum('none','alphanumeric','email','url','regex','callback') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `match_regex` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `func_callback` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` bigint(20) unsigned NOT NULL DEFAULT '0',
  `class` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `field` (`field`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hn4_shops_field`
--

INSERT INTO `hn4_shops_field` (`fid`, `field`, `listtemplate`, `tab`, `weight`, `field_type`, `field_choices`, `sql_choices`, `match_type`, `match_regex`, `func_callback`, `min_length`, `max_length`, `class`, `language`, `default_value`) VALUES
(4, 'brand', '1', 'a:1:{i:1;a:1:{i:0;s:9:"introduce";}}', 1, 'select', 'a:2:{s:5:"Mango";s:5:"MANGO";s:3:"gap";s:3:"GAP";}', '', 'none', '', '', 0, 255, '', 'a:1:{s:2:"vi";a:2:{i:0;s:15:"Thương Hiệu";i:1;s:0:"";}}', '1');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_field_value_vi`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_field_value_vi` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `rows_id` int(11) unsigned NOT NULL,
  `field_id` mediumint(8) NOT NULL,
  `field_value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rows_id` (`rows_id`,`field_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hn4_shops_field_value_vi`
--

INSERT INTO `hn4_shops_field_value_vi` (`id`, `rows_id`, `field_id`, `field_value`) VALUES
(1, 8, 1, 'MANGO'),
(2, 8, 2, '1'),
(3, 8, 3, '2'),
(4, 8, 4, 'gap');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_files`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_files` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `path` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filesize` int(11) unsigned NOT NULL DEFAULT '0',
  `extension` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `download_groups` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '-1',
  `status` tinyint(1) unsigned DEFAULT '1',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_files_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_files_rows` (
  `id_rows` int(11) unsigned NOT NULL,
  `id_files` mediumint(8) unsigned NOT NULL,
  `download_hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `id_files` (`id_files`,`id_rows`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_group`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_group` (
  `groupid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `image` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) NOT NULL DEFAULT '0',
  `lev` smallint(4) NOT NULL DEFAULT '0',
  `viewgroup` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'viewgrid',
  `numsubgroup` int(11) NOT NULL DEFAULT '0',
  `subgroupid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `indetail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `numpro` int(11) unsigned NOT NULL DEFAULT '0',
  `in_order` tinyint(2) NOT NULL DEFAULT '0',
  `is_require` tinyint(1) NOT NULL DEFAULT '0',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`groupid`),
  UNIQUE KEY `vi_alias` (`vi_alias`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=60 ;

--
-- Dumping data for table `hn4_shops_group`
--

INSERT INTO `hn4_shops_group` (`groupid`, `parentid`, `image`, `weight`, `sort`, `lev`, `viewgroup`, `numsubgroup`, `subgroupid`, `inhome`, `indetail`, `add_time`, `edit_time`, `numpro`, `in_order`, `is_require`, `vi_title`, `vi_alias`, `vi_description`, `vi_keywords`) VALUES
(1, 0, '', 1, 1, 0, 'viewlist', 6, '6,7,8,9,10,11', 1, 0, 1432623061, 1677971398, 0, 1, 0, 'Thương hiệu', 'Thuong-hieu', '', ''),
(2, 0, '', 2, 8, 0, 'viewlist', 12, '12,13,15,16,17,18,19,20,21,22,23,24', 1, 0, 1432623083, 1432623083, 0, 1, 0, 'Màu sắc', 'Mau-sac', '', ''),
(3, 0, '', 3, 21, 0, 'viewlist', 15, '25,26,27,28,29,30,31,32,33,34,35,36,37,38,39', 1, 0, 1432623101, 1432623101, 0, 1, 0, 'Kích thước', 'Kich-thuoc', '', ''),
(4, 0, '', 4, 37, 0, 'viewlist', 8, '40,41,42,43,44,45,46,47', 1, 0, 1432623118, 1432623118, 0, 1, 0, 'Chất liệu', 'Chat-lieu', '', ''),
(5, 0, '', 5, 46, 0, 'viewlist', 10, '48,49,50,51,52,53,54,55,56,57', 1, 0, 1432623133, 1432623133, 0, 1, 0, 'Xuất xứ', 'Xuat-xu', '', ''),
(6, 1, '', 1, 2, 1, 'viewgrid', 0, '', 1, 0, 1432626862, 1432626862, 0, 1, 0, 'Việt Tiến', 'Viet-Tien', '', ''),
(7, 1, '', 2, 3, 1, 'viewgrid', 0, '', 1, 0, 1432626882, 1432626882, 3, 1, 0, 'ZARA', 'ZARA', '', ''),
(8, 1, '', 3, 4, 1, 'viewgrid', 0, '', 1, 0, 1432626899, 1432626899, 0, 1, 0, 'MATTANA', 'MATTANA', '', ''),
(9, 1, '', 4, 5, 1, 'viewgrid', 0, '', 1, 0, 1432627013, 1432627013, 0, 1, 0, 'KELVIN', 'KELVIN', '', ''),
(10, 1, '', 5, 6, 1, 'viewgrid', 0, '', 1, 0, 1432627027, 1432627027, 0, 1, 0, 'THÁI TUẤN', 'THAI-TUAN', '', ''),
(11, 1, '', 6, 7, 1, 'viewgrid', 0, '', 1, 0, 1432627053, 1432627053, 0, 1, 0, 'VICTORIA SECRECT', 'VICTORIA-SECRECT', '', ''),
(12, 2, '', 1, 9, 1, 'viewgrid', 0, '', 1, 0, 1432627064, 1432627064, 1, 1, 0, 'ĐỎ', 'DO', '', ''),
(13, 2, '', 2, 10, 1, 'viewgrid', 0, '', 1, 0, 1432627070, 1432627070, 0, 1, 0, 'VÀNG', 'VANG', '', ''),
(16, 2, '', 4, 12, 1, 'viewgrid', 0, '', 1, 0, 1432627102, 1432627102, 1, 1, 0, 'HỒNG PHẤN', 'HONG-PHAN', '', ''),
(15, 2, '', 3, 11, 1, 'viewgrid', 0, '', 1, 0, 1432627095, 1432627095, 1, 1, 0, 'XANH NGỌC', 'XANH-NGOC', '', ''),
(17, 2, '', 5, 13, 1, 'viewgrid', 0, '', 1, 0, 1432627107, 1432627107, 0, 1, 0, 'XANH RÊU', 'XANH-REU', '', ''),
(18, 2, '', 6, 14, 1, 'viewgrid', 0, '', 1, 0, 1432627112, 1432627112, 0, 1, 0, 'TÍM', 'TIM', '', ''),
(19, 2, '', 7, 15, 1, 'viewgrid', 0, '', 1, 0, 1432627123, 1432627123, 0, 1, 0, 'XÁM', 'XAM', '', ''),
(20, 2, '', 8, 16, 1, 'viewgrid', 0, '', 1, 0, 1432627135, 1432627135, 0, 1, 0, 'XANH NƯỚC BIỂN', 'XANH-NUOC-BIEN', '', ''),
(21, 2, '', 9, 17, 1, 'viewgrid', 0, '', 1, 0, 1432627148, 1432627148, 0, 1, 0, 'CAM', 'CAM', '', ''),
(22, 2, '', 10, 18, 1, 'viewgrid', 0, '', 1, 0, 1432627153, 1432627153, 0, 1, 0, 'BẠC', 'BAC', '', ''),
(23, 2, '', 11, 19, 1, 'viewgrid', 0, '', 1, 0, 1432627160, 1432627160, 0, 1, 0, 'MÀU DA', 'MAU-DA', '', ''),
(24, 2, '', 12, 20, 1, 'viewgrid', 0, '', 1, 0, 1432627182, 1432627182, 2, 1, 0, 'ĐEN', 'DEN', '', ''),
(25, 3, '', 1, 22, 1, 'viewgrid', 0, '', 1, 0, 1432627201, 1432627201, 1, 1, 0, 'F', 'F', '', ''),
(26, 3, '', 2, 23, 1, 'viewgrid', 0, '', 1, 0, 1432627210, 1432627210, 0, 1, 0, 'L', 'L', '', ''),
(27, 3, '', 3, 24, 1, 'viewgrid', 0, '', 1, 0, 1432627215, 1432627215, 1, 1, 0, 'M', 'M', '', ''),
(28, 3, '', 4, 25, 1, 'viewgrid', 0, '', 1, 0, 1432627219, 1432627219, 0, 1, 0, 'S', 'S', '', ''),
(29, 3, '', 5, 26, 1, 'viewgrid', 0, '', 1, 0, 1432627223, 1432627223, 0, 1, 0, 'XL', 'XL', '', ''),
(30, 3, '', 6, 27, 1, 'viewgrid', 0, '', 1, 0, 1432627241, 1432627241, 0, 1, 0, 'XXL', 'XXL', '', ''),
(31, 3, '', 7, 28, 1, 'viewgrid', 0, '', 1, 0, 1432627250, 1432627250, 0, 1, 0, 'XXXL', 'XXXL', '', ''),
(32, 3, '', 8, 29, 1, 'viewgrid', 0, '', 1, 0, 1432627259, 1432627259, 2, 1, 0, '35', '35', '', ''),
(33, 3, '', 9, 30, 1, 'viewgrid', 0, '', 1, 0, 1432627264, 1432627264, 2, 1, 0, '36', '36', '', ''),
(34, 3, '', 10, 31, 1, 'viewgrid', 0, '', 1, 0, 1432627269, 1432627269, 2, 1, 0, '37', '37', '', ''),
(35, 3, '', 11, 32, 1, 'viewgrid', 0, '', 1, 0, 1432627274, 1432627274, 3, 1, 0, '38', '38', '', ''),
(36, 3, '', 12, 33, 1, 'viewgrid', 0, '', 1, 0, 1432627279, 1432627279, 0, 1, 0, '39', '39', '', ''),
(37, 3, '', 13, 34, 1, 'viewgrid', 0, '', 1, 0, 1432627284, 1432627284, 0, 1, 0, '40', '40', '', ''),
(38, 3, '', 14, 35, 1, 'viewgrid', 0, '', 1, 0, 1432627291, 1432627291, 0, 1, 0, '41', '41', '', ''),
(39, 3, '', 15, 36, 1, 'viewgrid', 0, '', 1, 0, 1432627296, 1432627296, 0, 1, 0, '42', '42', '', ''),
(40, 4, '', 1, 38, 1, 'viewgrid', 0, '', 1, 0, 1432627339, 1432627339, 0, 1, 0, 'COTTON', 'COTTON', '', ''),
(41, 4, '', 2, 39, 1, 'viewgrid', 0, '', 1, 0, 1432627346, 1432627346, 0, 1, 0, 'DẠ', 'DA', '', ''),
(42, 4, '', 3, 40, 1, 'viewgrid', 0, '', 1, 0, 1432627364, 1432627364, 0, 1, 0, 'JEANS', 'JEANS', '', ''),
(43, 4, '', 4, 41, 1, 'viewgrid', 0, '', 1, 0, 1432627369, 1432627369, 0, 1, 0, 'BÒ', 'BO', '', ''),
(44, 4, '', 5, 42, 1, 'viewgrid', 0, '', 1, 0, 1432627378, 1432627378, 0, 1, 0, 'LANH', 'LANH', '', ''),
(45, 4, '', 6, 43, 1, 'viewgrid', 0, '', 1, 0, 1432627385, 1432627385, 0, 1, 0, 'TƠ TẰM', 'TO-TAM', '', ''),
(46, 4, '', 7, 44, 1, 'viewgrid', 0, '', 1, 0, 1432627399, 1432627399, 0, 1, 0, 'THUN', 'THUN', '', ''),
(47, 4, '', 8, 45, 1, 'viewgrid', 0, '', 1, 0, 1432627407, 1432627407, 0, 1, 0, 'LỤA', 'LUA', '', ''),
(48, 5, '', 1, 47, 1, 'viewgrid', 0, '', 1, 0, 1432627418, 1432627418, 0, 1, 0, 'VIỆT NAM', 'VIET-NAM', '', ''),
(49, 5, '', 2, 48, 1, 'viewgrid', 0, '', 1, 0, 1432627425, 1432627425, 0, 1, 0, 'HÀN QUỐC', 'HAN-QUOC', '', ''),
(50, 5, '', 3, 49, 1, 'viewgrid', 0, '', 1, 0, 1432627519, 1432627519, 0, 1, 0, 'ĐỨC', 'DUC', '', ''),
(51, 5, '', 4, 50, 1, 'viewgrid', 0, '', 1, 0, 1432627528, 1432627528, 1, 1, 0, 'NHẬT BẢN', 'NHAT-BAN', '', ''),
(52, 5, '', 5, 51, 1, 'viewgrid', 0, '', 1, 0, 1432627541, 1432627541, 0, 1, 0, 'THÁI LAN', 'THAI-LAN', '', ''),
(53, 5, '', 6, 52, 1, 'viewgrid', 0, '', 1, 0, 1432627553, 1432627553, 1, 1, 0, 'HONGKONG', 'HONGKONG', '', ''),
(54, 5, '', 7, 53, 1, 'viewgrid', 0, '', 1, 0, 1432627565, 1432627565, 0, 1, 0, 'TRUNG QUỐC', 'TRUNG-QUOC', '', ''),
(55, 5, '', 8, 54, 1, 'viewgrid', 0, '', 1, 0, 1432627573, 1432627573, 0, 1, 0, 'PHÁP', 'PHAP', '', ''),
(56, 5, '', 9, 55, 1, 'viewgrid', 0, '', 1, 0, 1432627579, 1432627579, 0, 1, 0, 'ANH', 'ANH', '', ''),
(57, 5, '', 10, 56, 1, 'viewgrid', 0, '', 1, 0, 1432627617, 1432627617, 0, 1, 0, 'AUSTRALIA', 'AUSTRALIA', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_group_cateid`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_group_cateid` (
  `groupid` mediumint(8) unsigned NOT NULL,
  `cateid` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `groupid` (`groupid`,`cateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_shops_group_cateid`
--

INSERT INTO `hn4_shops_group_cateid` (`groupid`, `cateid`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(5, 2),
(5, 3),
(5, 4),
(5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_group_items`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_group_items` (
  `pro_id` int(11) unsigned NOT NULL DEFAULT '0',
  `group_id` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pro_id`,`group_id`),
  KEY `pro_id` (`pro_id`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_shops_group_items`
--

INSERT INTO `hn4_shops_group_items` (`pro_id`, `group_id`) VALUES
(8, 12),
(8, 15),
(8, 25),
(8, 27),
(9, 7),
(9, 24),
(9, 32),
(9, 33),
(9, 34),
(9, 35),
(9, 53),
(10, 7),
(10, 16),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 51),
(11, 7),
(11, 24),
(11, 35);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_group_quantity`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_group_quantity` (
  `pro_id` int(11) unsigned NOT NULL DEFAULT '0',
  `listgroup` varchar(247) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) unsigned NOT NULL,
  UNIQUE KEY `pro_id` (`pro_id`,`listgroup`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_shops_group_quantity`
--

INSERT INTO `hn4_shops_group_quantity` (`pro_id`, `listgroup`, `quantity`) VALUES
(11, '7,24,35', 20),
(10, '7,16,33,51', 10),
(9, '7,24,35,53', 10),
(8, '12', 12),
(8, '12,25', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_location`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_location` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` smallint(4) unsigned NOT NULL DEFAULT '0',
  `sort` mediumint(8) NOT NULL DEFAULT '0',
  `lev` smallint(4) NOT NULL DEFAULT '0',
  `numsub` int(11) NOT NULL DEFAULT '0',
  `subid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_money_vi`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_money_vi` (
  `id` mediumint(11) NOT NULL,
  `code` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `exchange` double NOT NULL DEFAULT '0',
  `round` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_format` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',||.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_shops_money_vi`
--

INSERT INTO `hn4_shops_money_vi` (`id`, `code`, `currency`, `symbol`, `exchange`, `round`, `number_format`) VALUES
(840, 'USD', 'US Dollar', '$', 21000, '0.01', ',||.'),
(704, 'VND', 'Vietnam Dong', 'đ', 1, '100', ',||.');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_orders`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_orders` (
  `order_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `order_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(11) unsigned NOT NULL DEFAULT '0',
  `shop_id` int(11) unsigned NOT NULL DEFAULT '0',
  `who_is` int(2) unsigned NOT NULL DEFAULT '0',
  `unit_total` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_total` double unsigned NOT NULL DEFAULT '0',
  `order_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `postip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_view` tinyint(2) NOT NULL DEFAULT '0',
  `transaction_status` tinyint(4) NOT NULL,
  `transaction_id` int(11) NOT NULL DEFAULT '0',
  `transaction_count` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `order_code` (`order_code`),
  KEY `user_id` (`user_id`),
  KEY `order_time` (`order_time`),
  KEY `shop_id` (`shop_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_orders_id`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_orders_id` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `listgroupid` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `proid` mediumint(9) NOT NULL,
  `num` mediumint(9) NOT NULL,
  `price` double NOT NULL DEFAULT '0',
  `discount_id` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderid` (`order_id`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_orders_id_group`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_orders_id_group` (
  `order_i` int(11) NOT NULL,
  `group_id` mediumint(8) NOT NULL,
  UNIQUE KEY `orderid` (`order_i`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_orders_shipping`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_orders_shipping` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) unsigned NOT NULL,
  `ship_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_phone` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_location_id` mediumint(8) unsigned NOT NULL,
  `ship_address_extend` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_shops_id` tinyint(3) unsigned NOT NULL,
  `ship_carrier_id` tinyint(3) unsigned NOT NULL,
  `weight` double NOT NULL DEFAULT '0',
  `weight_unit` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ship_price` double NOT NULL DEFAULT '0',
  `ship_price_unit` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `add_time` int(11) unsigned NOT NULL,
  `edit_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_point`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_point` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `point_total` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_point_history`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_point_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `point` int(11) NOT NULL DEFAULT '0',
  `time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_point_queue`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_point_queue` (
  `order_id` int(11) NOT NULL,
  `point` mediumint(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_review`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_review` (
  `review_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `sender` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(1) NOT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`review_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_rows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listcatid` int(11) NOT NULL DEFAULT '0',
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `product_code` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `product_number` int(11) NOT NULL DEFAULT '0',
  `product_price` double NOT NULL DEFAULT '0',
  `price_config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `saleprice` double NOT NULL DEFAULT '0',
  `money_unit` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_unit` smallint(4) NOT NULL,
  `product_weight` double NOT NULL DEFAULT '0',
  `weight_unit` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `discount_id` smallint(6) NOT NULL DEFAULT '0',
  `homeimgfile` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `homeimgalt` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `otherimage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `imgposition` tinyint(1) NOT NULL DEFAULT '1',
  `copyright` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `gift_from` int(11) unsigned NOT NULL DEFAULT '0',
  `gift_to` int(11) unsigned NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ratingdetail` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `allowed_send` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_print` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_save` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitslm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num_sell` mediumint(8) NOT NULL DEFAULT '0',
  `showprice` tinyint(2) NOT NULL DEFAULT '0',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_bodytext` mediumtext COLLATE utf8mb4_unicode_ci,
  `vi_gift_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `vi_tag_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_tag_description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `vi_alias` (`vi_alias`),
  KEY `listcatid` (`listcatid`),
  KEY `user_id` (`user_id`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `hn4_shops_rows`
--

INSERT INTO `hn4_shops_rows` (`id`, `listcatid`, `user_id`, `addtime`, `edittime`, `status`, `publtime`, `exptime`, `archive`, `product_code`, `product_number`, `product_price`, `price_config`, `saleprice`, `money_unit`, `product_unit`, `product_weight`, `weight_unit`, `discount_id`, `homeimgfile`, `homeimgthumb`, `homeimgalt`, `otherimage`, `imgposition`, `copyright`, `gift_from`, `gift_to`, `inhome`, `allowed_comm`, `allowed_rating`, `ratingdetail`, `allowed_send`, `allowed_print`, `allowed_save`, `hitstotal`, `hitscm`, `hitslm`, `num_sell`, `showprice`, `vi_title`, `vi_alias`, `vi_hometext`, `vi_bodytext`, `vi_gift_content`, `vi_address`, `vi_tag_title`, `vi_tag_description`) VALUES
(1, 2, 1, 1432363521, 1677368976, 1, 1432363521, 0, 2, 'V01', 19, 100000, '', 0, 'VND', 1, 20, 'g', 0, '2015_05/kids.jpg', 2, 'Váy Maxi sang trọng', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 12, 0, 0, 1, 1, 'Đầm Maxi sang trọng', 'Dam-Maxi-sang-trong', 'Đầm maxi thời trang', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(2, 2, 1, 1432365534, 1677368969, 1, 1432365534, 0, 2, 'V02', 50, 100000, '', 0, 'VND', 1, 250, 'g', 0, '2015_05/dress.jpg', 2, '', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 2, 0, 0, 0, 1, 'Đầm maxi họa tiết', 'Dam-maxi-hoa-tiet', 'đầm maxi sang trọng', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(3, 2, 1, 1432366714, 1677368963, 1, 1432366714, 0, 2, 'V03', 14, 50000, '', 0, 'VND', 1, 250, 'g', 0, '2015_05/office.jpg', 2, 'Chân Váy Công Sở', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 6, 0, 0, 1, 1, 'Chân Váy Công Sở', 'Chan-Vay-Cong-So', 'chân váy công sở', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(4, 2, 1, 1432367089, 1677368956, 1, 1432367089, 0, 2, 'S000004', 17, 50000, '', 0, 'VND', 1, 300, 'g', 0, '2015_05/selection.jpg', 2, 'chân váy caro', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 5, 0, 0, 3, 1, 'Chân váy caro', 'Chan-vay-caro', 'chân váy caro', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(5, 2, 1, 1432367366, 1677368949, 1, 1432367366, 0, 2, 'S000005', 30, 5000000, '', 0, 'VND', 1, 220, 'g', 0, '2015_05/mom.jpg', 2, 'áo somi lụa đẹp', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 2, 0, 0, 0, 1, 'Áo sơmi lụa', 'Ao-somi-lua', 'áo somi lụa đẹp', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(6, 2, 1, 1432367846, 1677368942, 1, 1432367846, 0, 2, 'S000006', 15, 1000000, '', 0, 'VND', 1, 300, 'g', 0, '2015_05/vest.jpg', 2, '', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 10, 0, 0, 0, 1, 'Áo sơ mi voan phối tay ren', 'Ao-so-mi-voan-phoi-tay-ren', '<h1><span style="font-size:14px">Áo sơ mi voan</span></h1>', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(8, 2, 1, 1432605984, 1678579390, 1, 1432605984, 0, 2, 'S000008', 28, 120000, '', 0, 'VND', 1, 200, 'g', 0, '2015_05/selection2.jpg', 1, 'áo thun nữ', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 9, 0, 0, 0, 1, 'áo thun nữ họa tiết độc đáo', 'ao-thun-nu-hoa-tiet-doc-dao', 'áo thun nữ họa tiết độc đáo', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(9, 3, 1, 1432606317, 1432629809, 1, 1432606317, 0, 2, 'S000009', 10, 100000, '', 0, 'VND', 1, 500, 'g', 1, '2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg', 1, 'Giày da nữ gót vuông', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 3, 0, 0, 0, 1, 'Giày da nữ gót vuông', 'Giay-da-nu-got-vuong', 'Giày da nữ gót vuông', 'Sản phẩm thời trang<br  /> <div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div> ', '', '', '', ''),
(10, 3, 1, 1432606522, 1432629789, 1, 1432606522, 0, 2, 'S000010', 10, 100000, '', 0, 'VND', 2, 350, 'g', 2, '2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg', 1, 'Giày cao gót mũi nhọn màu hồng', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 6, 0, 0, 0, 1, 'Giày cao gót mũi nhọn màu hồng be quý phái', 'Giay-cao-got-mui-nhon-mau-hong-be-quy-phai', 'Giày cao gót mũi nhọn màu hồng be quý phái', 'Sản phẩm thời trang<br  /> <div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div> ', '', '', '', ''),
(7, 2, 1, 1432369124, 1677368935, 1, 1432369124, 0, 2, 'S000007', 50, 120000, '', 0, 'VND', 1, 150, 'g', 0, '2015_05/the-trench.jpg', 2, '', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 19, 0, 0, 0, 1, 'áo thun nữ', 'ao-thun-nu', 'áo thun nữ', 'Sản phẩm thời trang<br />&nbsp;<div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div>', '', '', '', ''),
(11, 3, 1, 1432607113, 1435376866, 1, 1432607113, 0, 2, 'S000011', 20, 100000, '', 0, 'VND', 2, 250, 'g', 0, '2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg', 1, 'GIÀY BÚP BÊ NGÔI SAO NHẬP KHẨU', '', 0, 0, 0, 0, 1, 4, 1, '0', 1, 1, 1, 5, 0, 0, 0, 1, 'GIÀY BÚP BÊ NGÔI SAO NHẬP KHẨU', 'GIAY-BUP-BE-NGOI-SAO-NHAP-KHAU', 'GIÀY BÚP BÊ NGÔI SAO NHẬP KHẨU', 'Sản phẩm thời trang<br  /> <div style="text-align:center"><img alt="giay bup be ngoi sao nhap khau" height="800" src="/uploads/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg" width="800" /></div> ', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_shops`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_shops` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL,
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_shops_carrier`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_shops_carrier` (
  `shops_id` tinyint(3) unsigned NOT NULL,
  `carrier_id` tinyint(3) unsigned NOT NULL,
  `config_id` tinyint(3) unsigned NOT NULL,
  UNIQUE KEY `shops_id` (`shops_id`,`carrier_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_tabs`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_tabs` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hn4_shops_tabs`
--

INSERT INTO `hn4_shops_tabs` (`id`, `icon`, `content`, `weight`, `active`, `vi_title`) VALUES
(1, '', 'content_detail', 1, 1, 'Chi tiết sản phẩm'),
(2, '', 'content_comments', 2, 1, 'Bình luận'),
(3, '', 'content_rate', 3, 1, 'Đánh giá');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_tags_id_vi`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_tags_id_vi` (
  `id` int(11) NOT NULL,
  `tid` mediumint(9) NOT NULL,
  `keyword` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `sid` (`id`,`tid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_shops_tags_id_vi`
--

INSERT INTO `hn4_shops_tags_id_vi` (`id`, `tid`, `keyword`) VALUES
(1, 1, 'thời trang'),
(1, 2, 'sang trọng'),
(1, 3, 'phù hợp'),
(1, 4, 'đi chơi'),
(6, 5, 'áo sơ mi'),
(10, 6, 'mũi nhọn'),
(11, 7, 'búp bê');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_tags_vi`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_tags_vi` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `numpro` mediumint(8) NOT NULL DEFAULT '0',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` text COLLATE utf8mb4_unicode_ci,
  `keywords` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hn4_shops_tags_vi`
--

INSERT INTO `hn4_shops_tags_vi` (`tid`, `numpro`, `alias`, `image`, `description`, `bodytext`, `keywords`) VALUES
(1, 1, 'thời-trang', '', '', '', 'thời trang'),
(2, 1, 'sang-trọng', '', '', '', 'sang trọng'),
(3, 1, 'phù-hợp', '', '', '', 'phù hợp'),
(4, 1, 'đi-chơi', '', '', '', 'đi chơi'),
(5, 1, 'áo-sơ-mi', '', '', '', 'áo sơ mi'),
(6, 1, 'mũi-nhọn', '', '', '', 'mũi nhọn'),
(7, 1, 'búp-bê', '', '', '', 'búp bê');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_template`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_template` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` mediumint(8) unsigned NOT NULL DEFAULT '1',
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_shops_template`
--

INSERT INTO `hn4_shops_template` (`id`, `status`, `alias`, `weight`, `vi_title`) VALUES
(1, 1, 'thuong-hieu', 1, 'Thương Hiệu');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_transaction`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_transaction` (
  `transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_time` int(11) NOT NULL DEFAULT '0',
  `transaction_status` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `payment` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_id` varchar(22) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `payment_time` int(11) NOT NULL DEFAULT '0',
  `payment_amount` double NOT NULL DEFAULT '0',
  `payment_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `order_id` (`order_id`),
  KEY `payment_id` (`payment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_units`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vi_title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `vi_note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_shops_units`
--

INSERT INTO `hn4_shops_units` (`id`, `vi_title`, `vi_note`) VALUES
(1, 'cái', ''),
(2, 'đôi', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_warehouse`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_warehouse` (
  `wid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hn4_shops_warehouse`
--

INSERT INTO `hn4_shops_warehouse` (`wid`, `title`, `note`, `user_id`, `addtime`) VALUES
(1, 'Nhập kho ngày 23/05/2015', '', 1, 1432364016),
(2, 'Nhập kho ngày 23/05/2015', '', 1, 1432365552),
(3, 'Nhập kho ngày 23/05/2015', '', 1, 1432366753),
(4, 'Nhập kho ngày 23/05/2015', '', 1, 1432367106),
(5, 'Nhập kho ngày 23/05/2015', '', 1, 1432367387),
(6, 'Nhập kho ngày 23/05/2015', '', 1, 1432367857),
(7, 'Nhập kho ngày 23/05/2015', '', 1, 1432369139),
(8, 'Nhập kho ngày 26/05/2015', '', 1, 1432608794),
(9, 'Nhập kho ngày 26/05/2015', '', 1, 1432608805),
(10, 'Nhập kho ngày 26/05/2015', '', 1, 1432608819),
(11, 'Nhập kho ngày 26/05/2015', '', 1, 1432608835),
(12, 'Nhập kho ngày 12/03/2023', '', 1, 1678579286),
(13, 'Nhập kho ngày 12/03/2023', '', 1, 1678580432);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_warehouse_logs`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_warehouse_logs` (
  `logid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `wid` int(11) unsigned NOT NULL DEFAULT '0',
  `pro_id` int(11) unsigned NOT NULL DEFAULT '0',
  `quantity` int(11) unsigned NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `money_unit` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`logid`),
  KEY `wid` (`wid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hn4_shops_warehouse_logs`
--

INSERT INTO `hn4_shops_warehouse_logs` (`logid`, `wid`, `pro_id`, `quantity`, `price`, `money_unit`) VALUES
(1, 1, 1, 20, 150000, 'VND'),
(2, 2, 2, 50, 250000, 'VND'),
(3, 3, 3, 15, 70000, 'VND'),
(4, 4, 4, 20, 120000, 'VND'),
(5, 5, 5, 30, 120000, 'VND'),
(6, 6, 6, 15, 180000, 'VND'),
(7, 7, 7, 50, 50000, 'VND'),
(8, 8, 11, 20, 80000, 'VND'),
(9, 9, 10, 10, 90000, 'VND'),
(10, 10, 9, 10, 95000, 'VND'),
(11, 11, 8, 15, 50000, 'VND'),
(12, 12, 8, 12, 0, 'VND'),
(13, 13, 8, 1, 0, 'VND');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_warehouse_logs_group`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_warehouse_logs_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `logid` int(11) unsigned NOT NULL DEFAULT '0',
  `listgroup` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) unsigned NOT NULL DEFAULT '0',
  `price` double NOT NULL DEFAULT '0',
  `money_unit` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `logid` (`logid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hn4_shops_warehouse_logs_group`
--

INSERT INTO `hn4_shops_warehouse_logs_group` (`id`, `logid`, `listgroup`, `quantity`, `price`, `money_unit`) VALUES
(8, 8, '7,24,35', 20, 80000, 'VND'),
(9, 9, '7,16,33,51', 10, 90000, 'VND'),
(10, 10, '7,24,35,53', 10, 95000, 'VND'),
(11, 12, '12', 12, 0, 'VND'),
(12, 13, '12,25', 1, 0, 'VND');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_weight_vi`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_weight_vi` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `code` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `exchange` double NOT NULL DEFAULT '0',
  `round` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_shops_weight_vi`
--

INSERT INTO `hn4_shops_weight_vi` (`id`, `code`, `title`, `exchange`, `round`) VALUES
(1, 'g', 'Gram', 1, '0.1'),
(2, 'kg', 'Kilogam', 1000, '0.1');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_shops_wishlist`
--

CREATE TABLE IF NOT EXISTS `hn4_shops_wishlist` (
  `wid` smallint(6) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `listid` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`wid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_upload_dir`
--

CREATE TABLE IF NOT EXISTS `hn4_upload_dir` (
  `did` mediumint(8) NOT NULL AUTO_INCREMENT,
  `dirname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  `thumb_type` tinyint(4) NOT NULL DEFAULT '0',
  `thumb_width` smallint(6) NOT NULL DEFAULT '0',
  `thumb_height` smallint(6) NOT NULL DEFAULT '0',
  `thumb_quality` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`did`),
  UNIQUE KEY `name` (`dirname`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=28 ;

--
-- Dumping data for table `hn4_upload_dir`
--

INSERT INTO `hn4_upload_dir` (`did`, `dirname`, `time`, `thumb_type`, `thumb_width`, `thumb_height`, `thumb_quality`) VALUES
(0, '', 0, 3, 546, 726, 99),
(1, 'uploads', 1677611050, 0, 0, 0, 0),
(2, 'uploads/about', 0, 0, 0, 0, 0),
(3, 'uploads/push-notification', 0, 0, 0, 0, 0),
(4, 'uploads/contact', 0, 0, 0, 0, 0),
(5, 'uploads/comment', 0, 0, 0, 0, 0),
(6, 'uploads/feeds', 0, 0, 0, 0, 0),
(7, 'uploads/menu', 1676745633, 0, 0, 0, 0),
(8, 'uploads/page', 0, 0, 0, 0, 0),
(9, 'uploads/push', 0, 0, 0, 0, 0),
(10, 'uploads/users', 0, 0, 0, 0, 0),
(11, 'uploads/users/groups', 0, 0, 0, 0, 0),
(12, 'uploads/banners', 0, 0, 0, 0, 0),
(13, 'uploads/banners/files', 0, 0, 0, 0, 0),
(14, 'uploads/news', 0, 0, 0, 0, 0),
(15, 'uploads/news/temp_pic', 0, 0, 0, 0, 0),
(16, 'uploads/news/source', 0, 0, 0, 0, 0),
(17, 'uploads/news/topics', 0, 0, 0, 0, 0),
(18, 'uploads/zalo', 0, 0, 0, 0, 0),
(19, 'uploads/zalo/image', 0, 0, 0, 0, 0),
(20, 'uploads/zalo/image/202111', 0, 0, 0, 0, 0),
(21, 'uploads/siteterms', 0, 0, 0, 0, 0),
(22, 'uploads/freecontent', 0, 0, 0, 0, 0),
(23, 'uploads/shops/temp_pic', 0, 0, 0, 0, 0),
(24, 'uploads/shops/2023_02', 0, 0, 0, 0, 0),
(25, 'uploads/shops/files', 0, 0, 0, 0, 0),
(26, 'uploads/shops', 0, 0, 0, 0, 0),
(27, 'uploads/shops/2015_05', 1677369131, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_upload_file`
--

CREATE TABLE IF NOT EXISTS `hn4_upload_file` (
  `name` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ext` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `filesize` double NOT NULL DEFAULT '0',
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `srcwidth` int(11) NOT NULL DEFAULT '0',
  `srcheight` int(11) NOT NULL DEFAULT '0',
  `sizes` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mtime` int(11) NOT NULL DEFAULT '0',
  `did` int(11) NOT NULL DEFAULT '0',
  `title` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `did` (`did`,`title`),
  KEY `userid` (`userid`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_upload_file`
--

INSERT INTO `hn4_upload_file` (`name`, `ext`, `type`, `filesize`, `src`, `srcwidth`, `srcheight`, `sizes`, `userid`, `mtime`, `did`, `title`, `alt`) VALUES
('woman.jpeg', 'jpeg', 'image', 33438, 'assets/menu/woman.jpeg', 80, 64, '621|498', 1, 1676745790, 7, 'woman.jpeg', 'woman'),
('backdrop-g...jpg', 'jpg', 'image', 112049, 'assets/backdrop-gg-2022-web.jpg', 80, 36, '807|361', 1, 1675986330, 1, 'backdrop-gg-2022-web.jpg', 'backdrop gg 2022 web'),
('logo.jpg', 'jpg', 'image', 226237, 'assets/logo.jpg', 70, 80, '2582|2958', 1, 1676748909, 1, 'logo.jpg', 'logo'),
('logo_26_30.jpg', 'jpg', 'image', 1156, 'assets/logo_26_30.jpg', 26, 29, '26|29', 1, 1676748997, 1, 'logo_26_30.jpg', ''),
('bags.jpg', 'jpg', 'image', 37817, 'assets/bags.jpg', 57, 80, '417|588', 1, 1676749829, 1, 'bags.jpg', 'bags'),
('the-trench.jpg', 'jpg', 'image', 54068, 'assets/the-trench.jpg', 65, 80, '778|960', 1, 1676750084, 1, 'the-trench.jpg', 'the trench'),
('denim.jpg', 'jpg', 'image', 76503, 'assets/denim.jpg', 70, 80, '942|1080', 1, 1676750273, 1, 'denim.jpg', 'denim'),
('office.jpg', 'jpg', 'image', 351065, 'assets/office.jpg', 66, 80, '1240|1500', 1, 1676750396, 1, 'office.jpg', 'office'),
('selection.jpg', 'jpg', 'image', 183420, 'assets/selection.jpg', 54, 80, '1001|1500', 1, 1676750523, 1, 'selection.jpg', 'selection'),
('special.jpg', 'jpg', 'image', 54207, 'assets/special.jpg', 79, 80, '950|960', 1, 1676750807, 1, 'special.jpg', 'special'),
('special-94...jpg', 'jpg', 'image', 100172, 'assets/special-949x480.jpg', 80, 41, '949|480', 0, 1676750837, 1, 'special-949x480.jpg', 'special 949x480'),
('selection2.jpg', 'jpg', 'image', 333004, 'assets/selection2.jpg', 80, 52, '858|553', 1, 1676751164, 1, 'selection2.jpg', 'selection2'),
('vest.jpg', 'jpg', 'image', 21751, 'assets/vest.jpg', 58, 80, '694|960', 1, 1676751372, 1, 'vest.jpg', 'vest'),
('dress.jpg', 'jpg', 'image', 73902, 'assets/dress.jpg', 63, 80, '756|960', 1, 1676751521, 1, 'dress.jpg', 'dress'),
('shoe.jpg', 'jpg', 'image', 52079, 'assets/shoe.jpg', 80, 70, '960|846', 1, 1676751647, 1, 'shoe.jpg', 'shoe'),
('car.jpg', 'jpg', 'image', 77414, 'assets/car.jpg', 58, 80, '692|960', 1, 1676751728, 1, 'car.jpg', 'car'),
('bags2.jpg', 'jpg', 'image', 78135, 'assets/bags2.jpg', 70, 80, '842|960', 1, 1676751813, 1, 'bags2.jpg', 'bags2'),
('bags4.jpg', 'jpg', 'image', 49188, 'assets/bags4.jpg', 80, 59, '960|708', 1, 1676751814, 1, 'bags4.jpg', 'bags4'),
('mom.jpg', 'jpg', 'image', 88975, 'assets/mom.jpg', 65, 80, '868|1080', 1, 1676751981, 1, 'mom.jpg', 'mom'),
('kids.jpg', 'jpg', 'image', 100716, 'assets/kids.jpg', 72, 80, '1284|1422', 1, 1676752142, 1, 'kids.jpg', 'kids'),
('giay-bup-b...jpg', 'jpg', 'image', 131547, 'assets/shops/2015_05/giay-bup-be-ngoi-sao-nhap-khau.jpg', 80, 80, '800|800', 1, 1677353327, 27, 'giay-bup-be-ngoi-sao-nhap-khau.jpg', 'giay bup be ngoi sao nhap khau'),
('denim.jpg', 'jpg', 'image', 76503, 'assets/shops/2015_05/denim.jpg', 70, 80, '942|1080', 1, 1677367894, 27, 'denim.jpg', 'denim'),
('dress.jpg', 'jpg', 'image', 73902, 'assets/shops/2015_05/dress.jpg', 63, 80, '756|960', 1, 1677367894, 27, 'dress.jpg', 'dress'),
('kids.jpg', 'jpg', 'image', 100716, 'assets/shops/2015_05/kids.jpg', 72, 80, '1284|1422', 1, 1677367895, 27, 'kids.jpg', 'kids'),
('mom.jpg', 'jpg', 'image', 88975, 'assets/shops/2015_05/mom.jpg', 65, 80, '868|1080', 1, 1677367895, 27, 'mom.jpg', 'mom'),
('office.jpg', 'jpg', 'image', 351065, 'assets/shops/2015_05/office.jpg', 66, 80, '1240|1500', 1, 1677367896, 27, 'office.jpg', 'office'),
('selection.jpg', 'jpg', 'image', 183420, 'assets/shops/2015_05/selection.jpg', 53, 80, '1001|1500', 1, 1677367897, 27, 'selection.jpg', 'selection'),
('selection2.jpg', 'jpg', 'image', 118291, 'assets/shops/2015_05/selection2.jpg', 73, 80, '860|945', 1, 1677367898, 27, 'selection2.jpg', 'selection2'),
('special.jpg', 'jpg', 'image', 54207, 'assets/shops/2015_05/special.jpg', 79, 80, '950|960', 1, 1677367898, 27, 'special.jpg', 'special'),
('the-trench.jpg', 'jpg', 'image', 54068, 'assets/shops/2015_05/the-trench.jpg', 65, 80, '778|960', 1, 1677367898, 27, 'the-trench.jpg', 'the trench'),
('vest.jpg', 'jpg', 'image', 21751, 'assets/shops/2015_05/vest.jpg', 58, 80, '694|960', 1, 1677367898, 27, 'vest.jpg', 'vest'),
('linh-cavali.jpg', 'jpg', 'image', 426616, 'assets/linh-cavali.jpg', 80, 80, '1500|1500', 1, 1677611115, 1, 'linh-cavali.jpg', 'linh cavali');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users`
--

CREATE TABLE IF NOT EXISTS `hn4_users` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5username` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `birthday` int(11) NOT NULL,
  `sig` text COLLATE utf8mb4_unicode_ci,
  `regdate` int(11) NOT NULL DEFAULT '0',
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `passlostkey` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `view_mail` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remember` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `in_groups` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `active2step` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `secretkey` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checknum` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0',
  `last_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_agent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_openid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `last_update` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Thời điểm cập nhật thông tin lần cuối',
  `idsite` int(11) NOT NULL DEFAULT '0',
  `safemode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `safekey` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `pass_creation_time` int(11) NOT NULL DEFAULT '0',
  `pass_reset_request` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Yêu cầu thay đổi mật khẩu: 0: không; 1: Bắt buộc; 2: Khuyến khích',
  `email_verification_time` int(11) NOT NULL DEFAULT '-1' COMMENT '-3: Tài khoản sys, -2: Admin kích hoạt, -1 không cần kích hoạt, 0: Chưa xác minh, > 0 thời gian xác minh',
  `active_obj` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'SYSTEM' COMMENT 'SYSTEM, EMAIL, OAUTH:xxxx, quản trị kích hoạt thì lưu userid',
  `language` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Ngôn ngữ giao diện',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `md5username` (`md5username`),
  UNIQUE KEY `email` (`email`),
  KEY `idsite` (`idsite`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hn4_users`
--

INSERT INTO `hn4_users` (`userid`, `group_id`, `username`, `md5username`, `password`, `email`, `first_name`, `last_name`, `gender`, `photo`, `birthday`, `sig`, `regdate`, `question`, `answer`, `passlostkey`, `view_mail`, `remember`, `in_groups`, `active`, `active2step`, `secretkey`, `checknum`, `last_login`, `last_ip`, `last_agent`, `last_openid`, `last_update`, `idsite`, `safemode`, `safekey`, `pass_creation_time`, `pass_reset_request`, `email_verification_time`, `active_obj`, `language`) VALUES
(1, 1, 'admin', '175ab9a4d2aa0707aa4bf50aa6cb3529', 'ss', 'adminwmt@gmail.com', 'nvholding', '', '', '', 0, '', 1675986842, 'admin site?', 'webvang.vn', '', 0, 1, '1,4', 1, 0, '', '', 1675986842, '', '', '', 0, 0, 0, '', 1675986842, 0, -3, 'SYSTEM', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_backupcodes`
--

CREATE TABLE IF NOT EXISTS `hn4_users_backupcodes` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_used` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `time_used` int(11) unsigned NOT NULL DEFAULT '0',
  `time_creat` int(11) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`,`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_config`
--

CREATE TABLE IF NOT EXISTS `hn4_users_config` (
  `config` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`config`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_users_config`
--

INSERT INTO `hn4_users_config` (`config`, `content`, `edit_time`) VALUES
('access_admin', 'a:8:{s:15:"access_viewlist";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:12:"access_addus";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:14:"access_waiting";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:17:"access_editcensor";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:13:"access_editus";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:12:"access_delus";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:13:"access_passus";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}s:13:"access_groups";a:3:{i:1;b:1;i:2;b:1;i:3;b:1;}}', 1352873462),
('password_simple', '000000|1234|2000|12345|111111|123123|123456|11223344|654321|696969|1234567|12345678|87654321|123456789|23456789|1234567890|66666666|68686868|66668888|88888888|99999999|999999999|1234569|12345679|aaaaaa|abc123|abc123@|abc@123|admin123|admin123@|admin@123|nuke123|nuke123@|nuke@123|adobe1|adobe123|azerty|baseball|dragon|football|harley|iloveyou|jennifer|jordan|letmein|macromedia|master|michael|monkey|mustang|password|photoshop|pussy|qwerty|shadow|superman|hoilamgi|khongbiet|khongco|khongcopass', 1675986735),
('deny_email', 'yoursite.com|mysite.com|localhost|xxx', 1675986735),
('deny_name', 'anonimo|anonymous|god|linux|nobody|operator|root', 1675986735),
('avatar_width', '80', 1675986735),
('avatar_height', '80', 1675986735),
('active_group_newusers', '0', 1675986735),
('active_editinfo_censor', '0', 1675986735),
('active_user_logs', '1', 1675986735),
('min_old_user', '16', 1675986735),
('register_active_time', '86400', 1675986735),
('auto_assign_oauthuser', '0', 1675986735),
('admin_email', '0', 1675986735),
('siteterms_vi', '<p> Để đăng ký Tài khoản người dùng, bạn phải cam kết đồng ý với các điều khoản dưới đây. Chúng tôi có thể thay đổi lại những điều khoản này vào bất cứ lúc nào và chúng tôi sẽ cố gắng thông báo đến bạn kịp thời.<br /> <br /> Bạn cam kết không gửi bất cứ bài viết có nội dung lừa đảo, thô tục, thiếu văn hoá; vu khống, khiêu khích, đe doạ người khác; liên quan đến các vấn đề tình dục hay bất cứ nội dung nào vi phạm luật pháp của quốc gia mà bạn đang sống, luật pháp của quốc gia nơi đặt máy chủ của website này hay luật pháp quốc tế. Nếu vẫn cố tình vi phạm, ngay lập tức bạn sẽ bị cấm tham gia vào website. Địa chỉ IP của tất cả các bài viết đều được ghi nhận lại để bảo vệ các điều khoản cam kết này trong trường hợp bạn không tuân thủ.<br /> <br /> Bạn đồng ý rằng website có quyền gỡ bỏ, sửa, di chuyển hoặc khoá bất kỳ bài viết nào trong website vào bất cứ lúc nào tuỳ theo nhu cầu công việc.<br /> <br />Đăng ký Tài khoản người dùng của chúng tôi, bạn cũng phải đồng ý rằng, bất kỳ thông tin cá nhân nào mà bạn cung cấp đều được lưu trữ trong cơ sở dữ liệu của hệ thống. Mặc dù những thông tin này sẽ không được cung cấp cho bất kỳ người thứ ba nào khác mà không được sự đồng ý của bạn, chúng tôi không chịu trách nhiệm về việc những thông tin cá nhân này của bạn bị lộ ra bên ngoài từ những kẻ phá hoại có ý đồ xấu tấn công vào cơ sở dữ liệu của hệ thống.</p>', 1274757129),
('siteterms_en', '<p style="text-align:center;"> <strong>Website usage terms and conditions – sample template</strong></p><p> Welcome to our website. If you continue to browse and use this website you are agreeing to comply with and be bound by the following terms and conditions of use, which together with our privacy policy govern [business name]’s relationship with you in relation to this website.<br /> The term ‘[business name]’ or ‘us’ or ‘we’ refers to the owner of the website whose registered office is [address]. Our company registration number is [company registration number and place of registration]. The term ‘you’ refers to the user or viewer of our website.<br /> The use of this website is subject to the following terms of use:<br /> • The content of the pages of this website is for your general information and use only. It is subject to change without notice.<br /> • Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may contain inaccuracies or errors and we expressly exclude liability for any such inaccuracies or errors to the fullest extent permitted by law.<br /> • Your use of any information or materials on this website is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, services or information available through this website meet your specific requirements.<br /> • This website contains material which is owned by or licensed to us. This material includes, but is not limited to, the design, layout, look, appearance and graphics. Reproduction is prohibited other than in accordance with the copyright notice, which forms part of these terms and conditions.<br /> • All trademarks reproduced in this website, which are not the property of, or licensed to the operator, are acknowledged on the website.<br /> • Unauthorised use of this website may give rise to a claim for damages and/or be a criminal offence.<br /> • fr0m time to time this website may also include links to other websites. These links are provided for your convenience to provide further information. They do not signify that we endorse the website(s). We have no responsibility for the content of the linked website(s).<br /> • You may not crea-te a link to this website fr0m another website or document without [business name]’s prior written consent.<br /> • Your use of this website and any dispute arising out of such use of the website is subject to the laws of England, Scotland and Wales.</p>', 1274757617);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_edit`
--

CREATE TABLE IF NOT EXISTS `hn4_users_edit` (
  `userid` mediumint(8) unsigned NOT NULL,
  `lastedit` int(11) unsigned NOT NULL DEFAULT '0',
  `info_basic` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `info_custom` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_field`
--

CREATE TABLE IF NOT EXISTS `hn4_users_field` (
  `fid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `field` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(10) unsigned NOT NULL DEFAULT '1',
  `field_type` enum('number','date','textbox','textarea','editor','select','radio','checkbox','multiselect') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'textbox',
  `field_choices` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sql_choices` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `match_type` enum('none','alphanumeric','unicodename','email','url','regex','callback') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `match_regex` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `func_callback` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `min_length` int(11) NOT NULL DEFAULT '0',
  `max_length` bigint(20) unsigned NOT NULL DEFAULT '0',
  `for_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `show_register` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `user_editable` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `show_profile` tinyint(4) NOT NULL DEFAULT '1',
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_system` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `field` (`field`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hn4_users_field`
--

INSERT INTO `hn4_users_field` (`fid`, `field`, `weight`, `field_type`, `field_choices`, `sql_choices`, `match_type`, `match_regex`, `func_callback`, `min_length`, `max_length`, `for_admin`, `required`, `show_register`, `user_editable`, `show_profile`, `class`, `language`, `default_value`, `is_system`) VALUES
(1, 'first_name', 1, 'textbox', '', '', 'none', '', '', 0, 100, 0, 1, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:4:"Tên";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:10:"First name";i:1;s:0:"";}}', '', 1),
(2, 'last_name', 2, 'textbox', '', '', 'none', '', '', 0, 100, 0, 0, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:20:"Họ và tên đệm";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:9:"Last name";i:1;s:0:"";}}', '', 1),
(3, 'gender', 3, 'select', 'a:3:{s:1:"N";s:0:"";s:1:"M";s:0:"";s:1:"F";s:0:"";}', '', 'none', '', '', 0, 1, 0, 0, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:12:"Giới tính";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:6:"Gender";i:1;s:0:"";}}', '2', 1),
(4, 'birthday', 4, 'date', 'a:1:{s:12:"current_date";i:0;}', '', 'none', '', '', 0, 0, 0, 1, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:10:"Ngày sinh";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:8:"Birthday";i:1;s:0:"";}}', '0', 1),
(5, 'sig', 5, 'textarea', '', '', 'none', '', '', 0, 1000, 0, 0, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:9:"Chữ ký";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:9:"Signature";i:1;s:0:"";}}', '', 1),
(6, 'question', 6, 'textbox', '', '', 'none', '', '', 3, 255, 0, 1, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:22:"Câu hỏi bảo mật";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:17:"Security Question";i:1;s:0:"";}}', '', 1),
(7, 'answer', 7, 'textbox', '', '', 'none', '', '', 3, 255, 0, 1, 1, 1, 1, 'input', 'a:2:{s:2:"vi";a:2:{i:0;s:11:"Trả lời";i:1;s:0:"";}s:2:"en";a:2:{i:0;s:6:"Answer";i:1;s:0:"";}}', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_groups`
--

CREATE TABLE IF NOT EXISTS `hn4_users_groups` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `group_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0:Sys, 1:approval, 2:public',
  `group_color` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `require_2step_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `require_2step_site` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL,
  `exp_time` int(11) NOT NULL,
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `act` tinyint(1) unsigned NOT NULL,
  `idsite` int(11) unsigned NOT NULL DEFAULT '0',
  `numbers` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `siteus` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `config` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `kalias` (`alias`,`idsite`),
  KEY `exp_time` (`exp_time`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hn4_users_groups`
--

INSERT INTO `hn4_users_groups` (`group_id`, `alias`, `email`, `group_type`, `group_color`, `group_avatar`, `require_2step_admin`, `require_2step_site`, `is_default`, `add_time`, `exp_time`, `weight`, `act`, `idsite`, `numbers`, `siteus`, `config`) VALUES
(1, 'Super-Admin', '', 0, '', '', 0, 0, 0, 1675986735, 0, 1, 1, 0, 1, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(2, 'General-Admin', '', 0, '', '', 0, 0, 0, 1675986735, 0, 2, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(3, 'Module-Admin', '', 0, '', '', 0, 0, 0, 1675986735, 0, 3, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(4, 'Users', '', 0, '', '', 0, 0, 0, 1675986735, 0, 4, 1, 0, 1, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(7, 'New-Users', '', 0, '', '', 0, 0, 0, 1675986735, 0, 5, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(5, 'Guest', '', 0, '', '', 0, 0, 0, 1675986735, 0, 6, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(6, 'All', '', 0, '', '', 0, 0, 0, 1675986735, 0, 7, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(10, 'NukeViet-Fans', '', 2, '', '', 0, 0, 1, 1675986735, 0, 8, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(11, 'NukeViet-Admins', '', 2, '', '', 0, 0, 0, 1675986735, 0, 9, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}'),
(12, 'NukeViet-Programmers', '', 1, '', '', 0, 0, 0, 1675986735, 0, 10, 1, 0, 0, 0, 'a:7:{s:17:"access_groups_add";i:1;s:17:"access_groups_del";i:1;s:12:"access_addus";i:0;s:14:"access_waiting";i:0;s:13:"access_editus";i:0;s:12:"access_delus";i:0;s:13:"access_passus";i:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_groups_detail`
--

CREATE TABLE IF NOT EXISTS `hn4_users_groups_detail` (
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `lang` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `group_id_lang` (`lang`,`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_users_groups_detail`
--

INSERT INTO `hn4_users_groups_detail` (`group_id`, `lang`, `title`, `description`, `content`) VALUES
(1, 'vi', 'Super Admin', '', ''),
(2, 'vi', 'General Admin', '', ''),
(3, 'vi', 'Module Admin', '', ''),
(4, 'vi', 'Users', '', ''),
(7, 'vi', 'New Users', '', ''),
(5, 'vi', 'Guest', '', ''),
(6, 'vi', 'All', '', ''),
(10, 'vi', 'Người hâm mộ', 'Nhóm những người hâm mộ hệ thống NukeViet', ''),
(11, 'vi', 'Người quản lý', 'Nhóm những người quản lý website xây dựng bằng hệ thống NukeViet', ''),
(12, 'vi', 'Lập trình viên', 'Nhóm Lập trình viên hệ thống NukeViet', ''),
(1, 'en', 'Super Admin', '', ''),
(2, 'en', 'General Admin', '', ''),
(3, 'en', 'Module Admin', '', ''),
(4, 'en', 'Users', '', ''),
(7, 'en', 'New Users', '', ''),
(5, 'en', 'Guest', '', ''),
(6, 'en', 'All', '', ''),
(10, 'en', 'NukeViet-Fans', 'NukeViet System Fans Group', ''),
(11, 'en', 'NukeViet-Admins', 'Group of administrators for sites built by the NukeViet system', ''),
(12, 'en', 'NukeViet-Programmers', 'NukeViet System Programmers Group', '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_groups_users`
--

CREATE TABLE IF NOT EXISTS `hn4_users_groups_users` (
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `is_leader` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `approved` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_requested` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Thời gian yêu cầu tham gia',
  `time_approved` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Thời gian duyệt yêu cầu tham gia',
  PRIMARY KEY (`group_id`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_users_groups_users`
--

INSERT INTO `hn4_users_groups_users` (`group_id`, `userid`, `is_leader`, `approved`, `data`, `time_requested`, `time_approved`) VALUES
(1, 1, 1, 1, '0', 1675986842, 1675986842);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_info`
--

CREATE TABLE IF NOT EXISTS `hn4_users_info` (
  `userid` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_users_info`
--

INSERT INTO `hn4_users_info` (`userid`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_login`
--

CREATE TABLE IF NOT EXISTS `hn4_users_login` (
  `userid` mediumint(8) unsigned NOT NULL,
  `clid` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logtime` int(11) unsigned NOT NULL,
  `mode` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `openid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `userid` (`userid`,`clid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_oldpass`
--

CREATE TABLE IF NOT EXISTS `hn4_users_oldpass` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pass_creation_time` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `pass_creation_time` (`userid`,`pass_creation_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_openid`
--

CREATE TABLE IF NOT EXISTS `hn4_users_openid` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `openid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `opid` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `opid` (`openid`,`opid`),
  KEY `userid` (`userid`),
  KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_question`
--

CREATE TABLE IF NOT EXISTS `hn4_users_question` (
  `qid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(240) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `lang` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `weight` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`),
  UNIQUE KEY `title` (`title`,`lang`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=17 ;

--
-- Dumping data for table `hn4_users_question`
--

INSERT INTO `hn4_users_question` (`qid`, `title`, `lang`, `weight`, `add_time`, `edit_time`) VALUES
(1, 'Bạn thích môn thể thao nào nhất', 'vi', 1, 1274840238, 1274840238),
(2, 'Món ăn mà bạn yêu thích', 'vi', 2, 1274840250, 1274840250),
(3, 'Thần tượng điện ảnh của bạn', 'vi', 3, 1274840257, 1274840257),
(4, 'Bạn thích nhạc sỹ nào nhất', 'vi', 4, 1274840264, 1274840264),
(5, 'Quê ngoại của bạn ở đâu', 'vi', 5, 1274840270, 1274840270),
(6, 'Tên cuốn sách &quot;gối đầu giường&quot;', 'vi', 6, 1274840278, 1274840278),
(7, 'Ngày lễ mà bạn luôn mong đợi', 'vi', 7, 1274840285, 1274840285),
(8, 'What is the first name of your favorite uncle?', 'en', 1, 1274841115, 1274841115),
(9, 'whe-re did you meet your spouse', 'en', 2, 1274841123, 1274841123),
(10, 'What is your oldest cousin&#039;s name?', 'en', 3, 1274841131, 1274841131),
(11, 'What is your youngest child&#039;s username?', 'en', 4, 1274841142, 1274841142),
(12, 'What is your oldest child&#039;s username?', 'en', 5, 1274841150, 1274841150),
(13, 'What is the first name of your oldest niece?', 'en', 6, 1274841158, 1274841158),
(14, 'What is the first name of your oldest nephew?', 'en', 7, 1274841167, 1274841167),
(15, 'What is the first name of your favorite aunt?', 'en', 8, 1274841175, 1274841175),
(16, 'whe-re did you spend your honeymoon?', 'en', 9, 1274841183, 1274841183);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_users_reg`
--

CREATE TABLE IF NOT EXISTS `hn4_users_reg` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5username` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `gender` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `birthday` int(11) NOT NULL,
  `sig` text COLLATE utf8mb4_unicode_ci,
  `regdate` int(11) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checknum` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `users_info` text COLLATE utf8mb4_unicode_ci,
  `openid_info` text COLLATE utf8mb4_unicode_ci,
  `idsite` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `login` (`username`),
  UNIQUE KEY `md5username` (`md5username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_about`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_about` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imagealt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `socialbutton` tinyint(4) NOT NULL DEFAULT '0',
  `activecomm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot_post` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=9 ;

--
-- Dumping data for table `hn4_vi_about`
--

INSERT INTO `hn4_vi_about` (`id`, `title`, `alias`, `image`, `imagealt`, `imageposition`, `description`, `bodytext`, `keywords`, `socialbutton`, `activecomm`, `layout_func`, `weight`, `admin_id`, `add_time`, `edit_time`, `status`, `hitstotal`, `hot_post`) VALUES
(1, 'Giới thiệu về NukeViet', 'gioi-thieu-ve-nukeviet', '', '', 0, '', '<h2><span style="font-size:20px;"><strong>Giới thiệu khái quát</strong></span></h2>  <p>NukeViet là một ứng dụng trên nền web có thể sử dụng vào nhiều mục đích khác nhau. Phiên bản đang được phát hành theo giấy phép phần mềm tự do nguồn mở có tên gọi đầy đủ là <a href="/about/Gioi-thieu-ve-NukeViet-CMS.html"><b>NukeViet CMS</b></a> gồm 2 phần chính là phần nhân (core) của hệ thống NukeViet và nhóm chức năng quản trị nội dung của CMS thường được sử dụng để xây dựng các website tin tức do đó người dùng thường nghĩ rằng NukeViet mạnh về hệ thống tin tức. Tuy nhiên, đội ngũ phát triển NukeViet đã phát triển nhiều hệ thống khác nhau cho NukeViet, nổi bật nhất là:</p>  <ul> 	<li>NukeViet Portal: Cổng thông tin hai chiều dùng cho doanh nghiệp.</li> 	<li><a href="http://edu.nukeviet.vn" target="_blank">NukeViet Edu Gate</a>: Cổng thông tin tích hợp nhiều website, sử dụng cho phòng giáo dục, sở giáo dục.</li> 	<li><a href="http://toasoandientu.vn" target="_blank">NukeViet Tòa Soạn Điện Tử</a>: Sử dụng cho các tòa soạn báo điện tử, trang tin điện tử.</li> </ul> Theo định hướng phát triển của NukeViet, ngoài NukeViet CMS đã được phát hành theo giấy phép tự do nguồn mở trong nhiều năm qua, NukeViet sẽ có thêm 2 nhóm ứng dụng nữa là:  <ul> 	<li>NukeViet Blog: Dành cho các website và người dùng tạo các trang nhật ký cá nhân.</li> 	<li>NukeViet Shop: dành cho các website thương mại điện tử với hoạt động chính là bán hàng trực tuyến, hiện đã có thể sử dụng bằng cách cài bổ sung <a href="https://github.com/nukeviet/module-shops" target="_blank">module Shop</a> lên NukeViet CMS.</li> </ul> &nbsp;  <h2><span style="font-size:20px;"><strong>Video giới thiệu</strong></span></h2> <span style="font-size:14px;">Video clip &quot;Giới thiệu mã nguồn mở NukeViet&quot; trong bản tin Tiêu điểm của chương trình Xã hội thông tin<br  /> (Đài truyền hình kỹ thuật số VTC) phát sóng lúc 20h chủ nhật, ngày 05-09-2010 trên VTC1</span>  <div style="text-align: center;"> <div style="text-align: center;"> <div class="youtube-embed-wrapper" style="position:relative;padding-bottom:56.25%;padding-top:30px;height:0;overflow:hidden;"><iframe allowfullscreen="" height="480" src="//www.youtube.com/embed/Cxp1kCyVhqY?rel=0&amp;autoplay=1" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;" width="640"></iframe></div> <br  /> <span style="font-size:12px;"><em>Video clip &quot;Giới thiệu mã nguồn mở NukeViet&quot;</em></span></div> </div>  <h2><br  /> <span style="font-size:20px;"><strong><span class="mw-headline" id=".E1.BB.A8ng_d.E1.BB.A5ng">Lịch sử phát triển</span></strong></span></h2> NukeViet ra đời từ năm 2004, bắt đầu từ việc sử dụng sản phẩm PHP-Nuke để làm cho website cá nhân, anh Nguyễn Anh Tú - một lưu học sinh người Việt tại Nga - đã cùng cộng đồng Việt hóa, cải tiến theo nhu cầu sử dụng của người Việt. Được sự đón nhận của đông đảo người sử dụng, NukeViet đã liên tục được phát triển và trở thành một ứng dụng thuần Việt. Cho đến phiên bản 3.0, NukeViet đã được phát triển thành một ứng dụng khác biệt hoàn toàn, và không chỉ là một CMS, NukeViet được định hướng để trở thành phần mềm đa chức năng trên nền web.<br  /> <br  /> Kể từ năm 2010, NukeViet đã phát triển theo mô hình chuyên nghiệp, đội ngũ quản trị đã thành lập doanh nghiệp chuyên quản và đạt được những tiến bộ vượt bậc. NukeViet đã trở thành hệ quản trị nội dung nguồn mở duy nhất của Việt Nam được Bộ GD&amp;ĐT khuyến khích sử dụng trong giáo dục (thông tư 08/2010/TT-BGDĐT). Tiếp đó, NukeViet CMS đã được trao giải Nhân Tài Đất Việt 2011 và trở thành phần mềm nguồn mở đầu tiên đạt giải thưởng cao quý này. <h2><br  /> <span style="font-size:20px;"><strong><span class="mw-headline" id="Di.E1.BB.85n_.C4.91.C3.A0n_NukeViet.vn">Diễn đàn NukeViet.vn</span></strong></span></h2>  <p>Diễn đàn NukeViet hoạt động trên website: <a href="http://nukeviet.vn">http://nukeviet.vn</a>, đây là kênh chính thức và hữu hiệu cho các bạn đam mê về NukeViet có thể chia sẻ các kiến thức về NukeViet với nhau. Tính đến tháng 12 năm 2015 diễn đàn đã có trên 34.500 thành viên tham gia, bao gồm học sinh, sinh viên &amp; nhiều thành phần khác thuộc giới trí thức ở trong và ngoài nước.</p>  <p>Là một diễn đàn của các nhà quản lý website, rất nhiều thành viên trong diễn đàn NukeViet là cán bộ, lãnh đạo từ đủ mọi lĩnh vực: công nghệ thông tin, xây dựng, văn hóa - xã hội, thể thao, dịch vụ - du lịch... từ cử nhân, bác sĩ, kỹ sư cho đến bộ đội, công an..</p>  <h2><br  /> <span style="font-size:20px;"><span class="mw-headline" id="Th.C3.A0nh_t.C3.ADch_.26_gi.E1.BA.A3i_th.C6.B0.E1.BB.9Fng"><strong>Thành tích &amp; giải thưởng</strong></span></span></h2>  <h3><span style="font-size:14px;"><em><strong><span class="mw-headline" id="Khen_th.C6.B0.E1.BB.9Fng_.26_Th.C3.A0nh_t.C3.ADch">Khen thưởng &amp; Thành tích</span></strong></em></span></h3>  <ul> 	<li>Giải Ba Nhân tài Đất Việt 2011 ở Lĩnh vực Công nghệ thông tin/Sản phẩm đã ứng dụng rộng rãi (không có giải nhất, nhì).</li> 	<li>Bằng khen của Hội Tin học Việt Nam vì những đóng góp xuất sắc cho sự phát triển của cộng đồng nguồn mở tại Việt Nam.</li> </ul> <span style="font-size:14px;"><em><strong><span class="mw-headline" id=".C4.90.C6.B0.E1.BB.A3c_B.E1.BB.99_gi.C3.A1o_d.E1.BB.A5c_.26_.C4.90.C3.A0o_t.E1.BA.A1o_.E1.BB.A7ng_h.E1.BB.99">Được Bộ giáo dục &amp; Đào tạo ủng hộ</span></strong></em></span>  <p>NukeViet CMS là hệ quản trị nội dung nguồn mở duy nhất của Việt Nam nằm trong danh mục các sản phẩm phần mềm nguồn mở được khuyến khích sử dụng trong thông tư số 08/2010/TT-BGDĐT do Bộ GD&amp;ĐT ban hành ngày 01-03-2010 quy định về sử dụng phần mềm tự do mã nguồn mở trong các cơ sở giáo dục). Trong bài thuyết trình &quot;Hiện trạng triển khai nội dung thông tư 08/2010/TT-BGDĐT về sử dụng PMNM trong các cơ sở giáo dục và định hướng cho thời gian tới&quot;<sup> </sup>tại Hội thảo phần mềm nguồn mở trong các cơ quan, tổ chức nhà nước năm 2012, Cục trưởng cục CNTT Quách Tuấn Ngọc cho biết: &quot;NukeViet có thể thay thế SharePoint server&quot;, &quot;NukeViet được nhiều cơ sở giáo dục thích dùng&quot;<sup> </sup>NukeViet được Bộ GD&amp;ĐT đưa vào văn bản hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016. Trong văn bản số 4983/BGDĐT-CNTT của Bộ Giáo dục và Đào tạo (Bộ GDĐT) hướng dẫn việc triển khai nhiệm vụ công nghệ thông tin (CNTT) cho năm học 2015 - 2016 có những nội dung như sau liên quan đến NukeViet:</p>  <ul> 	<li>Nhiệm vụ số &quot;5. Công tác bồi dưỡng ứng dụng CNTT cho giáo viên và cán bộ quản lý giáo dục&quot;, mục &quot;5.1 Một số nội dung cần bồi dưỡng&quot; có ghi &quot;Tập huấn sử dụng phần mềm nguồn mở NukeViet.&quot;</li> 	<li>Nhiệm vụ số &quot; 10. Khai thác, sử dụng và dạy học bằng phần mềm nguồn mở&quot; có ghi: &quot;Khai thác và áp dụng phần mềm nguồn mở NukeViet trong giáo dục.&quot;</li> 	<li>Phụ lục văn bản, có trong nội dung &quot;Khuyến cáo khi sử dụng các hệ thống CNTT&quot;, hạng mục số 3 ghi rõ &quot;Không nên làm website mã nguồn đóng&quot; và &quot;Nên làm NukeViet: phần mềm nguồn mở&quot;.</li> </ul>  <h3><span style="font-size:14px;"><em><strong><span class="mw-headline" id=".C4.90.C6.B0.E1.BB.A3c_.C6.B0u_ti.C3.AAn_mua_s.E1.BA.AFm_s.E1.BB.AD_d.E1.BB.A5ng_trong_ch.C3.ADnh_ph.E1.BB.A7">Được ưu tiên mua sắm sử dụng trong chính phủ</span></strong></em></span></h3>  <p>NukeViet CMS là hệ quản trị nội dung nguồn mở được quy định ưu tiên mua sắm, sử dụng trong các cơ quan, tổ chức nhà nước Việt Nam theo thông tư 20/2014/TT-BTTTT ký ngày 05/12/2014 và có hiệu lực từ ngày 20/1/2015 quy định về các sản phẩm phần mềm nguồn mở được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước</p>  <h2><br  /> <span style="font-size:20px;"><span class="mw-headline" id="T.C3.ADnh_n.C4.83ng"><strong>Tính năng</strong></span></span></h2>  <h3><span style="font-size:14px;"><strong>NukeViet CMS 3.0 bản gốc có các module cơ bản là:</strong></span></h3>  <ul> 	<li>Quản lý Tin tức (<i>News</i>: Tạo bản tin chủ đề đa cấp, phân quyền theo chủ đề, hẹn giờ đăng tin, tạo bản in, bản tải về, thảo luận bản tin),</li> 	<li>Giới thiệu (<i>About</i>),</li> 	<li>Quản lý quảng cáo thương mại (banners),</li> 	<li>Quản lý người dùng (<i>users</i>),</li> 	<li>Liên hệ qua site (<i>Contact</i>),</li> 	<li>Cấp tin RSS (<i>RSS feeds</i>) và thu thập tin RSS (&quot;RSS reader&quot;),</li> 	<li>Bình chọn (thăm dò ý kiến - <i>Voting</i>),</li> 	<li>Thư viện file (<i>Download</i>),</li> 	<li>Thư viện Web (<i>Weblinks</i>),</li> 	<li>Hỏi nhanh đáp gọn(<i>Faq</i>),</li> 	<li>Thống kê truy cập (<i>statistics</i>),</li> 	<li>Tìm kiếm trong site (<i>Search</i>),</li> 	<li>Bán hàng trực tuyến (<i>Shop</i>) (có từ NukeViet 3.1)...</li> </ul>  <h3><span style="font-size:14px;"><strong>Tính năng hệ thống:</strong></span></h3>  <ul> 	<li>Cài đặt, nâng cấp và đóng gói tự động.</li> 	<li>Hỗ trợ đa ngôn ngữ giao diện và đa ngôn ngữ Cơ sở dữ liệu 100%, cho phép người sử dụng tự xây dựng ngôn ngữ mới.</li> 	<li>Thay đổi &amp; tùy biến giao diện nhiều cấp độ, cho phép người sử dụng có thể cài thêm giao diện mới hoặc tùy biến giao diện trên site theo ý thích. Người sử dụng có thể tùy biến bố cục giao diện theo layout, theo block ở các khu vực khác nhau của website.</li> 	<li>Quản lý module với khả năng xử lý đa nhân module (ảo hóa module).</li> 	<li>Cho phép phân nhóm thành viên và phân quyền người quản trị theo nhiều cấp độ khác nhau.</li> 	<li>Hỗ trợ tối ưu hóa cho các công cụ tìm kiếm (SEO): Rewrite, tạo Sitemap, Ping sitemap, chẩn đoán site, phân tích từ khóa, tạo keyword, quản lý máy chủ tìm kiếm (Bot)...</li> 	<li>Quản lý và sao lưu cơ sở dữ liệu.</li> 	<li>Cấu hình tùy biến, tường lửa đa cấp, xử lý tiến trình tự động...</li> 	<li>Hỗ trợ thiết bị di động (mobile), cho phép thay đổi giao diện tương thích (từ phiên bản 3.3)</li> 	<li>...</li> </ul>  <h2><span style="font-size:20px;"><strong><span class="mw-headline" id=".E1.BB.A8ng_d.E1.BB.A5ng">Ứng dụng</span></strong></span></h2>  <p>NukeViet được sử dụng ở nhiều website, từ những website cá nhân cho tới những hệ thống website doanh nghiệp, nó cung cấp nhiều dịch vụ và ứng dụng nhờ khả năng tăng cường tính năng bằng cách cài thêm các module, block... Trước đây, NukeViet chủ yếu được sử dụng làm trang tin tức nhờ module News tích hợp sẵn trong NukeViet được viết rất công phu, nó lại đặc biệt phù hợp với yêu cầu và đặc điểm sử dụng cho hệ thống tin tức. Kể từ phiên bản NukeViet 3, đội ngũ phát triển NukeViet đã định nghĩa lại NukeViet, theo đó, NukeViet được coi như phần mềm trực tuyến mà chức năng CMS chỉ là một module của NukeViet. NukeViet có thể dễ dàng cài đặt, dễ dàng quản lý kể cả với những người mới sử dụng do đó thường được những đối tượng người dùng không chuyên ưa thích.<br  /> <br  /> NukeViet có mã nguồn mở do đó việc sử dụng NukeViet là hoàn toàn miễn phí cho tất cả mọi người trên thế giới. Từ bản 2.0 trở về trước, đối tượng người dùng chủ yếu của NukeViet là người Việt vì những đặc điểm của bản thân mã nguồn (có nguồn gốc từ PHP-Nuke) và vì chính sách của nhóm phát triển là: &quot;hệ thống Portal dành cho người Việt&quot;. Kể từ phiên bản 3.0, đội ngũ phát triển NukeViet định hướng đưa NukeViet ra cộng đồng quốc tế.</p>  <ul> 	<li>Các cổng thông tin điện tử</li> 	<li>Các tập đoàn kinh tế</li> 	<li>Giải trí trực tuyến, văn hóa, nghệ thuật.</li> 	<li>Báo điện tử, tạp chí điện tử</li> 	<li>Website của các doanh nghiệp vừa và nhỏ</li> 	<li>Website của các cơ quan, tổ chức chính phủ</li> 	<li>Website giáo dục, trường học</li> 	<li>Website của gia đình, cá nhân, nhóm sở thích...</li> </ul>  <p><br  /> Ngoài các ứng dụng website ở trên, thực tế NukeViet đã được ứng dụng làm rất nhiều phần mềm khác như: Phần mềm quản lý kho hàng, phần mềm bán hàng, phần mềm quản lý quán BI-A trợ giúp bật tắt điện đèn bàn bóng, phần mềm tòa soạn điện tử, phần mềm quản lý hồ sơ, quản lý nhân sự trực tuyến, phần mềm tra cứu điểm thi hỗ trợ SMS...</p>', '', 0, '4', '', 1, 1, 1675986735, 1675986735, 1, 1, 0),
(2, 'Giới thiệu về NukeViet CMS', 'gioi-thieu-ve-nukeviet-cms', '', '', 0, '', '<p>CMS là gì?<br  /> CMS là từ viết tắt từ Content Management System. Theo wikipedia</p>  <blockquote> <p><strong>Định nghĩa.</strong><br  /> Hệ quản trị nội dung, cũng được gọi là hệ thống quản lý nội dung hay CMS (từ Content Management System của tiếng Anh) là phần mềm để tổ chức và tạo môi trường cộng tác thuận lợi nhằm mục đích xây dựng một hệ thống tài liệu và các loại nội dung khác một cách thống nhất. Mới đây thuật ngữ này liên kết với chương trình quản lý nội dung của website. Quản lý nội dung web (web content management) cũng đồng nghĩa như vậy.<br  /> <br  /> <span class="mw-headline" id="Ch.E1.BB.A9c_n.C4.83ng"><strong>Chức năng</strong>.</span><br  /> Quản trị những nội dung tài liệu điện tử (bao gồm những tài liệu, văn bản số và đã được số hoá) của tổ chức. Những chức năng bao gồm:</p>  <ul> 	<li>Tạo lập nội dung;</li> 	<li>Lưu trữ nội dung;</li> 	<li>Chỉnh sửa nội dung;</li> 	<li>Chuyển tải nội dung;</li> 	<li>Chia sẻ nội dung;</li> 	<li>Tìm kiếm nội dung;</li> 	<li>Phân quyền người dùng và nội dung...</li> </ul>  <p><strong>Đặc điểm.</strong><br  /> Các đặc điểm cơ bản của CMS bao gồm:</p>  <ul> 	<li>Phê chuẩn việc tạo hoặc thay đổi nội dung trực tuyến</li> 	<li>Chế độ Soạn thảo &quot;Nhìn là biết&quot; WYSIWYG</li> 	<li>Quản lý người dùng</li> 	<li>Tìm kiếm và lập chỉ mục</li> 	<li>Lưu trữ</li> 	<li>Tùy biến giao diện</li> 	<li>Quản lý ảnh và các liên kết (URL)</li> </ul> </blockquote>  <p><br  /> NukeViet CMS là một <strong>hệ quản trị nội dung</strong> (<em>Content Management System - CMS</em>) cho phép bạn quản lý các cổng thông tin điện tử trên Internet. Nói đơn giản, NukeViet giống như một phần mềm giúp bạn<strong> xây dựng</strong> và <strong>vận hành</strong> các trang web của mình một cách dễ dàng nhất.</p>  <p>NukeViet CMS là một phần mềm <strong>mã nguồn mở</strong>, do đó việc sử dụng <strong>hoàn toàn miễn phí</strong>, bạn có thể tải NukeViet CMS về bất cứ lúc nào tại website chính thức của NukeViet là <strong><a href="http://nukeviet.vn">nukeviet.vn</a></strong>. Bạn có thể cài NukeViet lên hosting để sử dụng hoặc cũng có thể thử nghiệm bằng cách cài ngay lên máy tính cá nhân.</p>  <p>NukeViet cho phép xây dựng một website động, đa chức năng, hiện đại một cách nhanh chóng mà người vận hành nó thậm chí <strong>không cần phải biết một tí gì về lập trình</strong> bởi tất cả các tác vụ quản lý phức tạp đều được tự động hóa ở mức cao. NukeViet đặc biệt dễ dàng sử dụng vì hoàn toàn bằng tiếng Việt và được thiết kế phù hợp nhất với thói quen sử dụng mạng của <strong>người Việt Nam</strong>.</p>  <p>Bằng việc sử dụng các công nghệ web mới nhất hiện nay, thiết kế hệ thống uyển chuyển và sở hữu những tính năng độc đáo, NukeViet sẽ giúp bạn triển khai các ứng dụng web từ nhỏ đến lớn một cách nhanh chóng và tiết kiệm: từ các website cá nhân cho tới các cổng thông tin điện tử; từ các gian hàng trực tuyến cho tới các mạng xã hội...</p> NukeViet là CMS <strong>mã nguồn mở đầu tiên của Việt Nam</strong> có quá trình phát triển lâu dài nhất, có lượng người sử dụng đông nhất. Hiện NukeViet cũng là một trong những mã nguồn mở chuyên nghiệp đầu tiên của Việt Nam, cơ quan chủ quản của NukeViet là <a href="http://vinades.vn" target="_blank">VINADES.,JSC</a> - đơn vị chịu trách nhiệm phát triển NukeViet và triển khai NukeViet thành các ứng dụng cụ thể cho doanh nghiệp.', '', 0, '4', '', 2, 1, 1675986735, 1675986735, 1, 3, 0),
(3, 'Logo và tên gọi NukeViet', 'logo-va-ten-goi-nukeviet', '', '', 0, '', '<p><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;"><strong>Tên gọi:</strong></span></span><br  /> <strong>NukeViet </strong>phát âm là <strong>&#91;Nu-Ke-Việt</strong>&#93;, đây là cách đọc riêng, không phải là cách phát âm chuẩn của tiếng Anh.<br  /> <br  /> <strong>Ý nghĩa:</strong><br  /> NukeViet là từ ghép từ chữ <strong>Nuke </strong>và <strong>Việt Nam</strong>.<br  /> <br  /> Sở dĩ có tên gọi này là vì phiên bản 1.0 và 2.0 của NukeViet được phát triển từ mã nguồn mở<strong> PHP-Nuke</strong>.</p>  <p>Mặc dù từ phiên bản 3.0, NukeViet được viết mới hoàn toàn và trong quá trình phát triển của mình, nhiều cái tên đã được đưa ra để thay thế nhưng cuối cùng cái tên NukeViet đã được giữ lại để nhớ rằng <strong>NukeViet </strong>được khởi đầu từ <strong>PHP-Nuke</strong> và để cảm ơn <strong>Franscisco Burzi</strong> - Tác giả PHP-Nuke - vì chính ông là nhân tố để có một cộng đồng mã nguồn mở NukeViet với hàng chục ngàn người dùng như hiện nay.</p>  <p><strong>Nuke</strong> trong tiếng Anh (từ lóng) có nghĩa là &quot;<strong>vũ khí hạt nhân</strong>&quot; (nuclear weapons). Xem: <a href="http://vi.wiktionary.org/wiki/nuke" target="_blank">http://vi.wiktionary.org/wiki/nuke</a></p>  <p>Đội ngũ phát triển cũng hy vọng rằng <strong>NukeViet </strong>sẽ phát triển bùng nổ như đúng tên gọi của nó.</p>  <p><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;"><strong>Logo NukeViet 3.0:</strong></span></span><br  /> Sau thời gian dài lựa chọn từ hàng chục mẫu thiết kế của thành viên diễn đàn NukeViet.VN và các nhà thiết kế đồ họa chuyên nghiệp... logo chính thức của NukeViet 3.0 đã được Ban Quản Trị chọn lựa đúng trước ngày Offline phát hành bản NukeViet 3.0 một ngày.<br  /> <br  /> Logo NukeViet 3.0 được lấy hình tượng từ Biển, Đêm, và Ánh Trăng trong khung hình giọt nước:</p>  <p style="text-align:center"><img alt="w" height="143" src="/uploads/about/w.png" style="width: 288px; height: 143px; border-width: 0px; border-style: solid;" width="288" /></p>  <p>Dưới nền trắng, cả logo nhìn như cảnh biển đêm huyền ảo, tĩnh mịch với mặt nước biển, bầu trời, thuyền buồm và ánh trăng. Đây là những hình ảnh biểu tượng cho sự thanh bình mà bất cứ ai cũng mong ước được thấy khi ngắm biển về đêm.<br  /> <br  /> Màu xanh thẫm là màu hòa quyện của của mặt biển, bầu trời về đêm, màu này cũng gần với màu xanh tượng trưng cho hòa bình.<br  /> Hai vệt khuyết chính là ánh trăng sáng màu bạc phản chiếu lên giọt nước.<br  /> <br  /> Giọt nước còn là biểu tượng cho sự sống, cho khát khao bất diệt của vạn vật trên trái đất này.<br  /> <br  /> <strong>Thông số chuẩn của màu logo:</strong><br  /> -&nbsp;&nbsp;&nbsp; Màu xanh: C80, M60, Y0, K0<br  /> <br  /> <strong>Tác giả mẫu thiết kế:</strong> Lê Thanh Xuân, chuyên viên thiết kế đồ họa của VINADES.,JSC</p>  <p><span style="color: rgb(255, 0, 0);"><span style="font-size: 14px;"><strong>Slogan NukeViet 3.0:</strong></span></span> “Chia sẻ thành công, kết nối đam mê”, Tiếng Anh: “Sharing success, connect passions”</p>  <p>Slogan này của tác giả HoaiNamDr, đây là slogan đã đoạt giải trong cuộc thi sáng tác slogan trên diễn đàn NukeViet.VN</p>  <div style="text-align:center"><img alt="nukevietcms 180x84" height="84" src="/uploads/about/nukevietcms-180x84.png" width="180" /></div>  <p style="text-align: center;">Mẫu phối Logo, slogan và tên NukeViet CMS (180x84px)<br  /> Tải về mẫu kích thước lớn <a href="/uploads/about/nukevietcms.png">logo-nukeviet-cms.png</a> (1500x700px)</p>  <div style="text-align:center"><img alt="nukevietcms mu noel 180x84" height="84" src="/uploads/about/nukevietcms_mu_noel_180x84.png" width="180" /></div>  <p style="text-align: center;">Mẫu phối Logo, slogan và tên NukeViet CMS với chiếc mũ ông già Noel (184x84px)<br  /> &nbsp;</p>  <div style="text-align:center"><img alt="logo nukeviet3 flag 180x75" height="75" src="/uploads/about/logo-nukeviet3-flag-180x75.png" width="180" /></div>  <p style="text-align: center;">Mẫu phối Logo, slogan và tên NukeViet CMS cắm cờ Việt Nam (180x75px)<br  /> &nbsp;</p>  <div style="text-align:center"><img alt="nukevietcms laco 180x57" height="57" src="/uploads/about/nukevietcms_laco_180x57.png" width="180" /></div>  <p style="text-align: center;">Mẫu phối Logo, slogan và tên NukeViet CMS với chiếc ruy băng cờ Việt Nam (180x57px)</p>  <div style="text-align:center"><img alt="nukevietvn 180x84" height="84" src="/uploads/about/nukevietvn_180x84.png" width="180" /></div>  <p style="text-align: center;">Mẫu phối Logo, slogan và tên NukeViet.VN (180x84px)<br  /> Tải về mẫu kích thước lớn <a href="/uploads/about/nukevietvn.png">logo-nukeviet-big.png</a> (1500x700px)</p>  <p><br  /> <strong>Tải về file đồ họa gốc:</strong><br  /> - <a href="http://nukeviet.vn/vi/download/Tai-lieu/NukeViet-logo/">NukeViet logo</a> - hình ảnh gốc có độ phân giải cao, bao gồm cả font chữ, có thể sử dụng cho in ấn sticker, in logo lên áo hoặc in Backdrop, Standy khổ lớn.</p>', '', 0, '4', '', 3, 1, 1675986735, 1675986735, 1, 3, 0);
INSERT INTO `hn4_vi_about` (`id`, `title`, `alias`, `image`, `imagealt`, `imageposition`, `description`, `bodytext`, `keywords`, `socialbutton`, `activecomm`, `layout_func`, `weight`, `admin_id`, `add_time`, `edit_time`, `status`, `hitstotal`, `hot_post`) VALUES
(4, 'Giấy phép sử dụng NukeViet', 'giay-phep-su-dung-nukeviet', '', '', 0, 'Giấy phép công cộng GNU (tiếng Anh: GNU General Public License, viết tắt GNU GPL hay chỉ GPL) là giấy phép phần mềm tự do được sử dụng để phân phối mã nguồn mở NukeViet.', '<p><strong>Bản dịch tiếng Việt của Giấy phép Công cộng GNU</strong></p>\r\n\r\n<p>Người dịch&nbsp;<a href="mailto:dangtuan@vietkey.net">Đặng Minh Tuấn &lt;dangtuan@vietkey.net&gt;</a></p>\r\n\r\n<p>Đây là bản dịch tiếng Việt không chính thức của Giấy phép Công cộng GNU. Bản dịch này không phải do Tổ chức Phần mềm Tự do ấn hành, và nó không quy định về mặt pháp lý các điều khoản cho các phần mềm sử dụng giấy phép GNU GPL -- chỉ có bản tiếng Anh gốc của GNU GPL mới có tính pháp lý. Tuy nhiên, chúng tôi hy vọng rằng bản dịch này sẽ giúp cho những người nói tiếng Việt hiểu rõ hơn về GNU GPL.</p>\r\n\r\n<p>This is an unofficial translation of the GNU General Public License into Vietnamese. It was not published by the Free Software Foundation, and does not legally state the distribution terms for software that uses the GNU GPL--only the original English text of the GNU GPL does that. However, we hope that this translation will help Vietnamese speakers understand the GNU GPL better.</p>\r\n\r\n<hr  />\r\n<h3>GIẤY PHÉP CÔNG CỘNG GNU (GPL)</h3>\r\nGiấy phép công cộng GNU<br />\r\nPhiên bản 2, tháng 6/1991<br />\r\nCopyright (C) 1989, 1991 Free Software Foundation, Inc. &nbsp;<br />\r\n59 Temple Place - Suite 330, Boston, MA&nbsp; 02111-1307, USA\r\n<p>Mọi người đều được phép sao chép và lưu hành bản sao nguyên bản nhưng không được phép thay đổi nội dung của giấy phép này.<br />\r\n<br />\r\n<strong>Lời nói đầu</strong><br />\r\n<br />\r\nGiấy phép sử dụng của hầu hết các phần mềm đều được đưa ra nhằm hạn chế bạn tự do chia sẻ và thay đổi nó. Ngược lại, Giấy phép Công cộng của GNU có mục đích đảm bảo cho bạn có thể tự do chia sẻ và thay đổi phần mềm tự do - tức là đảm bảo rằng phần mềm đó là tự do đối với mọi người sử dụng. Giấy phép Công cộng này áp dụng cho hầu hết các phần mềm của Tổ chức Phần mềm Tự do và cho tất cả các chương trình khác mà tác giả cho phép sử dụng. (Đối với một số phần mềm khác của Tổ chức Phần Mềm Tự do, áp dụng Giấy phép Công cộng Hạn chế của GNU thay cho giấy phép công cộng). Bạn cũng có thể áp dụng nó cho các chương trình của mình.<br />\r\n<br />\r\nKhi nói đến phần mềm tự do, chúng ta nói đến sự tự do sử dụng chứ không quan tâm về giá cả. Giấy phép Công cộng của chúng tôi được thiết kế để đảm bảo rằng bạn hoàn toàn tự do cung cấp các bản sao của phần mềm tự do (cũng như kinh doanh dịch vụ này nếu bạn muốn), rằng bạn có thể nhận được mã nguồn nếu bạn có yêu cầu, rằng bạn có thể thay đổi phần mềm hoặc sử dụng các thành phần của phần mềm đó cho những chương trình tự do mới; và rằng bạn biết chắc là bạn có thể làm được những điều này.<br />\r\n<br />\r\nĐể bảo vệ bản quyền của bạn, chúng tôi cần đưa ra những hạn chế để ngăn chặn những ai chối bỏ quyền của bạn, hoặc yêu cầu bạn chối bỏ quyền của mình. Những hạn chế này cũng có nghĩa là những trách nhiệm nhất định của bạn khi cung cấp các bản sao phần mềm hoặc khi chỉnh sửa phần mềm đó.<br />\r\n<br />\r\nVí dụ, nếu bạn cung cấp các bản sao của một chương trình, dù miễn phí hay không, bạn phải cho người nhận tất cả các quyền mà bạn có. Bạn cũng phải đảm bảo rằng họ cũng nhận được hoặc tiếp cận được mã nguồn. Và bạn phải thông báo những điều khoản này cho họ để họ biết rõ về quyền của mình.<br />\r\n<br />\r\nChúng tôi bảo vệ quyền của bạn với hai bước: (1) bảo vệ bản quyền phần mềm, và (2) cung cấp giấy phép này để bạn có thể sao chép, lưu hành và/hoặc chỉnh sửa phần mềm một cách hợp pháp.<br />\r\n<br />\r\nNgoài ra, để bảo vệ các tác giả cũng như để bảo vệ chính mình, chúng tôi muốn chắc chắn rằng tất cả mọi người đều hiểu rõ rằng không hề có bảo hành đối với phần mềm tự do này. Nếu phần mềm được chỉnh sửa thay đổi bởi một người khác và sau đó lưu hành, thì chúng tôi muốn những người sử dụng biết rằng phiên bản họ đang có không phải là bản gốc, do đó tất cả những trục trặc do những người khác gây ra hoàn toàn không ảnh hưởng tới uy tín của tác giả ban đầu.<br />\r\n<br />\r\nCuối cùng, bất kỳ một chương trình tự do nào cũng đều thường xuyên có nguy cơ bị đe doạ về giấy phép bản quyền. Chúng tôi muốn tránh nguy cơ khi những người cung cấp lại một chương trình tự do có thể có được giấy phép bản quyền cho bản thân họ, từ đó trở thành độc quyền đối với chương trình đó. Để ngăn ngừa trường hợp này, chúng tôi đã nêu rõ rằng mỗi giấy phép bản quyền hoặc phải được cấp cho tất cả mọi người sử dụng một cách tự do hoặc hoàn toàn không cấp phép.<br />\r\n<br />\r\nDưới đây là những điều khoản và điều kiện rõ ràng đối với việc sao chép, lưu hành và chỉnh sửa.<br />\r\n<br />\r\n<strong>Những điều khoản và điều kiện đối với việc sao chép, lưu hành và chỉnh sửa</strong><br />\r\n<br />\r\n<strong>0.</strong>&nbsp;Giấy phép này áp dụng cho bất kỳ một chương trình hay sản phẩm nào mà người giữ bản quyền công bố rằng nó có thể được cung cấp trong khuôn khổ những điều khoản của Giấy phép Công cộng này. Từ “Chương trình” dưới đây có nghĩa là tất cả các chương trình hay sản phẩm như vậy, và “sản phẩm dựa trên Chương trình” có nghĩa là Chương trình hoặc bất kỳ một sản phẩm nào bắt nguồn từ chương trình đó tuân theo luật bản quyền, nghĩa là một sản phẩm dựa trên Chương trình hoặc một phần của nó, đúng nguyên bản hoặc có một số chỉnh sửa và/hoặc được dịch ra một ngôn ngữ khác. (Dưới đây, việc dịch cũng được hiểu trong khái niệm “chỉnh sửa”). Mỗi người được cấp phép được gọi là “bạn”.<br />\r\n<br />\r\nTrong Giấy phép này không đề cập tới các hoạt động khác ngoài việc sao chép, lưu hành và chỉnh sửa; chúng nằm ngoài phạm vi của giấy phép này. Hành động chạy chương trình không bị hạn chế, và những kết quả từ việc chạy chương trình chỉ được đề cập tới nếu nội dung của nó tạo thành một sản phẩm dựa trên chương trình (độc lập với việc chạy chương trình). Điều này đúng hay không là phụ thuộc vào Chương trình.<br />\r\n<br />\r\n<strong>1.</strong>&nbsp;Bạn có thể sao chép và lưu hành những phiên bản nguyên bản của mã nguồn Chương trình đúng như khi bạn nhận được, qua bất kỳ phương tiện phân phối nào, với điều kiện trên mỗi bản sao bạn đều kèm theo một ghi chú bản quyền rõ ràng và từ chối bảo hành; giữ nguyên tất cả các ghi chú về Giấy phép và về việc không có bất kỳ một sự bảo hành nào; và cùng với Chương trình bạn cung cấp cho người sử dụng một bản sao của Giấy phép này.<br />\r\n<br />\r\nBạn có thể tính phí cho việc chuyển giao bản sao, và tuỳ theo quyết định của mình bạn có thể cung cấp bảo hành để đổi lại với chi phí mà bạn đã tính.<br />\r\n<br />\r\n<strong>2.</strong>&nbsp;Bạn có thể chỉnh sửa bản sao của bạn hoặc các bản sao của Chương trình hoặc của bất kỳ phần nào của nó, từ đó hình thành một sản phẩm dựa trên Chương trình, và sao chép cũng như lưu hành sản phẩm đó hoặc những chỉnh sửa đó theo điều khoản trong Mục 1 ở trên, với điều kiện bạn đáp ứng được những điều kiện dưới đây:<br />\r\n•&nbsp;&nbsp; &nbsp;a) Bạn phải có ghi chú rõ ràng trong những tập tin đã chỉnh sửa là bạn đã chỉnh sửa nó, và ngày tháng của bất kỳ một thay đổi nào.<br />\r\n•&nbsp;&nbsp; &nbsp;b) Bạn phải cấp phép miễn phí cho tất cả các bên thứ ba đối với các sản phẩm bạn cung cấp hoặc phát hành, bao gồm Chương trình nguyên bản, từng phần của nó hay các sản phẩm dựa trên Chương trình hay dựa trên từng phần của Chương trình, theo những điều khoản của Giấy phép này.<br />\r\n•&nbsp;&nbsp; &nbsp;c) Nếu chương trình đã chỉnh sửa thường đọc lệnh tương tác trong khi chạy, bạn phải thực hiện sao cho khi bắt đầu chạy để sử dụng tương tác theo cách thông thường nhất phải có một thông báo bao gồm bản quyền và thông báo về việc không có bảo hành (hoặc thông báo bạn là người cung cấp bảo hành), và rằng người sử dụng có thể cung cấp lại Chương trình theo những điều kiện này, và thông báo để người sử dụng có thể xem bản sao của Giấy phép này. (Ngoại lệ: nếu bản thân Chương trình là tương tác nhưng không có một thông báo nào như trên, thì sản phẩm của bạn dựa trên Chương trình đó cũng không bắt buộc phải có thông báo như vậy).<br />\r\n<br />\r\nNhững yêu cầu trên áp dụng cho toàn bộ các sản phẩm chỉnh sửa. Nếu có những phần của sản phẩm rõ ràng không bắt nguồn từ Chương trình, và có thể được xem là độc lập và riêng biệt, thì Giấy phép này và các điều khoản của nó sẽ không áp dụng cho những phần đó khi bạn cung cấp chúng như những sản phẩm riêng biệt. Nhưng khi bạn cung cấp những phần đó như những phần nhỏ trong cả một sản phẩm dựa trên Chương trình, thì việc cung cấp này phải tuân theo những điều khoản của Giấy phép này, cho phép những người được cấp phép có quyền đối với toàn bộ sản phẩm, cũng như đối với từng phần trong đó, bất kể ai đã viết nó.<br />\r\n<br />\r\nNhư vậy, điều khoản này không nhằm mục đích xác nhận quyền hoặc tranh giành quyền của bạn đối với những sản phẩm hoàn toàn do bạn viết; mà mục đích của nó là nhằm thi hành quyền kiểm soát đối với việc cung cấp những sản phẩm bắt nguồn hoặc tổng hợp dựa trên Chương trình.<br />\r\n<br />\r\nNgoài ra, việc kết hợp thuần tuý Chương trình (hoặc một sản phẩm dựa trên Chương trình) với một sản phẩm không dựa trên Chương trình với mục đích lưu trữ hoặc quảng bá không đưa sản phẩm đó vào trong phạm vi áp dụng của Giấy phép này.<br />\r\n<br />\r\n<strong>3.</strong>&nbsp;Bạn có thể sao chép và cung cấp Chương trình (hoặc một sản phẩm dựa trên Chương trình, nêu trong Mục 2) dưới hình thức mã đã biên dịch hoặc dạng có thể thực thi được trong khuôn khổ các điều khoản nêu trong Mục 1 và 2 ở trên, nếu như bạn:<br />\r\n•&nbsp;&nbsp; &nbsp;a) Kèm theo đó một bản mã nguồn dạng đầy đủ có thể biên dịch được theo các điều khoản trong Mục 1 và 2 nêu trên trong một môi trường trao đổi phần mềm thông thường; hoặc,<br />\r\n•&nbsp;&nbsp; &nbsp;b) Kèm theo đó một đề nghị có hạn trong ít nhất 3 năm, theo đó cung cấp cho bất kỳ một bên thứ ba nào một bản sao đầy đủ của mã nguồn tương ứng, và phải được cung cấp với giá chi phí không cao hơn giá chi phí vật lý của việc cung cấp theo các điều khoản trong Mục 1 và 2 nêu trên trong một môi trường trao đổi phần mềm thông thường; hoặc<br />\r\n•&nbsp;&nbsp; &nbsp;c) Kèm theo đó thông tin bạn đã nhận được để đề nghị cung cấp mã nguồn tương ứng. (Phương án này chỉ được phép đối với việc cung cấp phi thương mại và chỉ với điều kiện nếu bạn nhận được Chương trình dưới hình thức mã đã biên dịch hoặc dạng có thể thực thi được cùng với lời đề nghị như vậy, theo phần b trong điều khoản nêu trên).<br />\r\n<br />\r\nMã nguồn của một sản phẩm là một dạng ưu tiên của sản phẩm dành cho việc chỉnh sửa nó. Với một sản phẩm có thể thi hành, mã nguồn hoàn chỉnh có nghĩa là tất cả các mã nguồn cho các môđun trong sản phẩm đó, cộng với tất cả các tệp tin định nghĩa giao diện đi kèm với nó, cộng với các hướng dẫn dùng để kiểm soát việc biên dịch và cài đặt các tệp thi hành. Tuy nhiên, một ngoại lệ đặc biệt là mã nguồn không cần chứa bất kỳ một thứ gì mà bình thường được cung cấp (từ nguồn khác hoặc hình thức nhị phân) cùng với những thành phần chính (chương trình biên dịch, nhân, và những phần tương tự) của hệ điều hành mà các chương trình chạy trong đó, trừ khi bản thân thành phần đó lại đi kèm với một tệp thi hành.<br />\r\n<br />\r\nNếu việc cung cấp lưu hành mã đã biên dịch hoặc tập tin thi hành được thực hiện qua việc cho phép tiếp cận và sao chép từ một địa điểm được chỉ định, thì việc cho phép tiếp cận tương đương tới việc sao chép mã nguồn từ cùng địa điểm cũng được tính như việc cung cấp mã nguồn, mặc dù thậm chí các bên thứ ba không bị buộc phải sao chép mã nguồn cùng với mã đã biên dịch.<br />\r\n<br />\r\n<strong>4.</strong>&nbsp;Bạn không được phép sao chép, chỉnh sửa, cấp phép hoặc cung cấp Chương trình trừ phi phải tuân thủ một cách chính xác các điều khoản trong Giấy phép. Bất kỳ ý định sao chép, chỉnh sửa, cấp phép hoặc cung cấp Chương trình theo cách khác đều làm mất hiệu lực và tự động huỷ bỏ quyền của bạn trong khuôn khổ Giấy phép này. Tuy nhiên, các bên đã nhận được bản sao hoặc quyền từ bạn với Giấy phép này sẽ không bị huỷ bỏ giấy phép nếu các bên đó vẫn tuân thủ đầy đủ các điều khoản của giấy phép.<br />\r\n<br />\r\n<strong>5.</strong>&nbsp;Bạn không bắt buộc phải chấp nhận Giấy phép này khi bạn chưa ký vào đó. Tuy nhiên, không có gì khác đảm bảo cho bạn được phép chỉnh sửa hoặc cung cấp Chương trình hoặc các sản phẩm bắt nguồn từ Chương trình. Những hành động này bị luật pháp nghiêm cấm nếu bạn không chấp nhận Giấy phép này. Do vậy, bằng việc chỉnh sửa hoặc cung cấp Chương trình (hoặc bất kỳ một sản phẩm nào dựa trên Chương trình), bạn đã thể hiện sự chấp thuận đối với Giấy phép này, cùng với tất cả các điều khoản và điều kiện đối với việc sao chép, cung cấp hoặc chỉnh sửa Chương trình hoặc các sản phẩm dựa trên nó.<br />\r\n<br />\r\n<strong>6.</strong> Mỗi khi bạn cung cấp lại Chương trình (hoặc bất kỳ một sản phẩm nào dựa trên Chương trình), người nhận sẽ tự động nhận được giấy phép từ người cấp phép đầu tiên cho phép sao chép, cung cấp và chỉnh sửa Chương trình theo các điều khoản và điều kiện này. Bạn không thể áp đặt bất cứ hạn chế nào khác đối với việc thực hiện quyền của người nhận đã được cấp phép từ thời điểm đó. Bạn cũng không phải chịu trách nhiệm bắt buộc các bên thứ ba tuân thủ theo Giấy phép này.<br />\r\n<br />\r\n<strong>7.</strong>&nbsp;Nếu như, theo quyết định của toà án hoặc với những bằng chứng về việc vi phạm bản quyền hoặc vì bất kỳ lý do nào khác (không giới hạn trong các vấn đề về bản quyền), mà bạn phải tuân theo các điều kiện (nêu ra trong lệnh của toà án, biên bản thoả thuận hoặc ở nơi khác) trái với các điều kiện của Giấy phép này, thì chúng cũng không thể miễn cho bạn khỏi những điều kiện của Giấy phép này. Nếu bạn không thể đồng thời thực hiện các nghĩa vụ của mình trong khuôn khổ Giấy phép này và các nghĩa vụ thích đáng khác, thì hậu quả là bạn hoàn toàn không được cung cấp Chương trình. Ví dụ, nếu trong giấy phép bản quyền không cho phép những người nhận được bản sao trực tiếp hoặc gián tiếp qua bạn có thể cung cấp lại Chương trình thì trong trường hợp này cách duy nhất bạn có thể thoả mãn cả hai điều kiện là hoàn toàn không cung cấp Chương trình.<br />\r\n<br />\r\nNếu bất kỳ một phần nào trong điều khoản này không có hiệu lực hoặc không thể thi hành trong một hoàn cảnh cụ thể, thì sẽ cân đối áp dụng các điều khoản, và toàn bộ điều khoản sẽ được áp dụng trong những hoàn cảnh khác.<br />\r\n<br />\r\nMục đích của điều khoản này không nhằm buộc bạn phải vi phạm bất kỳ một bản quyền nào hoặc các quyền sở hữu khác hoặc tranh luận về giá trị hiệu lực của bất kỳ quyền hạn nào như vậy; mục đích duy nhất của điều khoản này là nhằm bảo vệ sự toàn vẹn của hệ thống cung cấp phần mềm tự do đang được thực hiện với giấy phép công cộng. Nhiều người đã đóng góp rất nhiều vào sự đa dạng của các phần mềm tự do được cung cấp thông qua hệ thống này với sự tin tưởng rằng hệ thống được sử dụng một cách thống nhất; tác giả/người cung cấp có quyền quyết định rằng họ có mong muốn cung cấp phần mềm thông qua hệ thống nào khác hay không, và người được cấp phép không thể có ảnh hưởng tới sự lựa chọn này.<br />\r\n<br />\r\nĐiều khoản này nhằm làm rõ những hệ quả của các phần còn lại của Giấy phép này.<br />\r\n<br />\r\n<strong>8.</strong>&nbsp;Nếu việc cung cấp và/hoặc sử dụng Chương trình bị cấm ở một số nước nhất định bởi quy định về bản quyền, người giữ bản quyền gốc đã đưa Chương trình vào dưới Giấy phép này có thể bổ sung một điều khoản hạn chế việc cung cấp ở những nước đó, nghĩa là việc cung cấp chỉ được phép ở các nước không bị liệt kê trong danh sách hạn chế. Trong trường hợp này, Giấy phép đưa vào những hạn chế được ghi trong nội dung của nó.<br />\r\n<br />\r\n<strong>9.&nbsp;</strong>Tổ chức Phần mềm Tự do có thể theo thời gian công bố những phiên bản chỉnh sửa và/hoặc phiên bản mới của Giấy phép Công cộng. Những phiên bản đó sẽ đồng nhất với tinh thần của phiên bản hiện này, nhưng có thể khác ở một số chi tiết nhằm giải quyết những vấn đề hay những lo ngại mới.<br />\r\n<br />\r\nMỗi phiên bản sẽ có một mã số phiên bản riêng. Nếu Chương trình và &quot;bất kỳ một phiên bản nào sau đó&quot; có áp dụng một phiên bản Giấy phép cụ thể, bạn có quyền lựa chọn tuân theo những điều khoản và điều kiện của phiên bản giấy phép đó hoặc của bất kỳ một phiên bản nào sau đó do Tổ chức Phần mềm Tự do công bố. Nếu Chương trình không nêu cụ thể mã số phiên bản giấy phép, bạn có thể lựa chọn bất kỳ một phiên bản nào đã từng được công bố bởi Tổ chức Phần mềm Tự do.<br />\r\n<br />\r\n<strong>10.</strong>&nbsp;Nếu bạn muốn kết hợp các phần của Chương trình vào các chương trình tự do khác mà điều kiện cung cấp khác với chương trình này, hãy viết cho tác giả để được phép. Đối với các phần mềm được cấp bản quyền bởi Tổ chức Phầm mềm Tự do, hãy đề xuất với tổ chức này; đôi khi chúng tôi cũng có những ngoại lệ. Quyết định của chúng tôi sẽ dựa trên hai mục tiêu là bảo hộ tình trạng tự do của tất cả các sản phẩm bắt nguồn từ phần mềm tự do của chúng tôi, và thúc đẩy việc chia sẻ và tái sử dụng phần mềm nói chung.<br />\r\n<br />\r\n<strong>KHÔNG BẢO HÀNH</strong><br />\r\nDO CHƯƠNG TRÌNH ĐƯỢC CẤP PHÉP MIỄN PHÍ NÊN KHÔNG CÓ MỘT CHẾ ĐỘ BẢO HÀNH NÀO TRONG MỨC ĐỘ CHO PHÉP CỦA LUẬT PHÁP. TRỪ KHI ĐƯỢC CÔNG BỐ KHÁC ĐI BẰNG VĂN BẢN, NHỮNG NGƯỜI GIỮ BẢN QUYỀN VÀ/HOẶC CÁC BÊN CUNG CẤP CHƯƠNG TRÌNH NGUYÊN BẢN SẼ KHÔNG BẢO HÀNH DƯỚI BẤT KỲ HÌNH THỨC NÀO, BAO GỒM NHƯNG KHÔNG GIỚI HẠN TRONG CÁC HÌNH THỨC BẢO HÀNH ĐỐI VỚI TÍNH THƯƠNG MẠI CŨNG NHƯ TÍNH THÍCH HỢP CHO MỘT MỤC ĐÍCH CỤ THỂ. BẠN LÀ NGƯỜI CHỊU TOÀN BỘ RỦI RO VỀ CHẤT LƯỢNG CŨNG NHƯ VIỆC VẬN HÀNH CHƯƠNG TRÌNH. TRONG TRƯỜNG HỢP CHƯƠNG TRÌNH CÓ KHIẾM KHUYẾT, BẠN PHẢI CHỊU TOÀN BỘ CHI PHÍ CHO NHỮNG DỊCH VỤ SỬA CHỮA CẦN THIẾT.<br />\r\n<br />\r\nTRONG TẤT CẢ CÁC TRƯỜNG HỢP TRỪ KHI CÓ YÊU CẦU CỦA LUẬT PHÁP HOẶC CÓ THOẢ THUẬN BẰNG VĂN BẢN, NHỮNG NGƯỜI CÓ BẢN QUYỀN HOẶC BẤT KỲ MỘT BÊN NÀO CHỈNH SỬA VÀ/HOẶC CUNG CẤP LẠI CHƯƠNG TRÌNH TRONG CÁC ĐIỀU KIỆN NHƯ ĐÃ NÊU TRÊN ĐỀU KHÔNG CÓ TRÁCH NHIỆM VỚI BẠN VỀ CÁC LỖI HỎNG HÓC, BAO GỒM CÁC LỖI CHUNG HAY ĐẶC BIỆT, NGẪU NHIÊN HAY TẤT YẾU NẢY SINH DO VIỆC SỬ DỤNG HOẶC KHÔNG SỬ DỤNG ĐƯỢC CHƯƠNG TRÌNH (BAO GỒM NHƯNG KHÔNG GIỚI HẠN TRONG VIỆC MẤT DỮ LIỆU, DỮ LIỆU THIẾU CHÍNH XÁC HOẶC CHƯƠNG TRÌNH KHÔNG VẬN HÀNH ĐƯỢC VỚI CÁC CHƯƠNG TRÌNH KHÁC), THẬM CHÍ CẢ KHI NGƯỜI CÓ BẢN QUYỀN VÀ CÁC BÊN KHÁC ĐÃ ĐƯỢC THÔNG BÁO VỀ KHẢ NĂNG XẢY RA NHỮNG THIỆT HẠI ĐÓ.<br />\r\n<br />\r\n<strong>KẾT THÚC CÁC ĐIỀU KIỆN VÀ ĐIỀU KHOẢN.</strong></p>\r\n\r\n<p><strong>Áp dụng những điều khoản trên như thế nào đối với chương trình của bạn</strong><br />\r\n<br />\r\nNếu bạn xây dựng một chương trình mới, và bạn muốn cung cấp một cách tối đa cho công chúng sử dụng, thì biện pháp tốt nhất để đạt được điều này là phát triển chương trình đó thành phần mềm tự do để ai cũng có thể cung cấp lại và thay đổi theo những điều khoản như trên.<br />\r\n<br />\r\nĐể làm được việc này, hãy đính kèm những thông báo như sau cùng với chương trình của mình. An toàn nhất là đính kèm chúng trong phần đầu của tập tin mã nguồn để thông báo một cách hiệu quả nhất về việc không có bảo hành; và mỗi tệp tin đều phải có ít nhất một dòng về “bản quyền” và trỏ đến toàn bộ thông báo.</p>\r\n\r\n<blockquote>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; <strong>Một dòng đề tên chương trình và nội dung của nó.<br />\r\n&nbsp; &nbsp; &nbsp; &nbsp; Bản quyền (C) năm,&nbsp; tên tác giả.</strong><br />\r\n<br />\r\nChương trình này là phần mềm tự do, bạn có thể cung cấp lại và/hoặc chỉnh sửa nó theo những điều khoản của Giấy phép Công cộng của GNU do Tổ chức Phần mềm Tự do công bố; phiên bản 2 của Giấy phép, hoặc bất kỳ một phiên bản sau đó (tuỳ sự lựa chọn của bạn).<br />\r\n<br />\r\nChương trình này được cung cấp với hy vọng nó sẽ hữu ích, tuy nhiên KHÔNG CÓ BẤT KỲ MỘT BẢO HÀNH NÀO; thậm chí kể cả bảo hành về KHẢ NĂNG THƯƠNG MẠI hoặc TÍNH THÍCH HỢP CHO MỘT MỤC ĐÍCH CỤ THỂ. Xin xem Giấy phép Công cộng của GNU để biết thêm chi tiết.<br />\r\n<br />\r\nBạn phải nhận được một bản sao của Giấy phép Công cộng của GNU kèm theo chương trình này; nếu bạn chưa nhận được, xin gửi thư về Tổ chức Phần mềm Tự do, 59 Temple Place - Suite 330, Boston, MA&nbsp; 02111-1307, USA.<br />\r\n<br />\r\nXin hãy bổ sung thông tin về địa chỉ liên lạc của bạn (thư điện tử và bưu điện).</p>\r\n</blockquote>\r\n\r\n<p>Nếu chương trình chạy tương tác, hãy đưa một thông báo ngắn khi bắt đầu chạy chương trình như sau:</p>\r\n\r\n<blockquote>\r\n<p>Gnomovision phiên bản 69, Copyright (C) năm, tên tác giả.<br />\r\n<br />\r\nGnomovision HOÀN TOÀN KHÔNG CÓ BẢO HÀNH; để xem chi tiết hãy gõ `show w&#039;.&nbsp; Đây là một phần mềm miễn phí, bạn có thể cung cấp lại với những điều kiện nhất định, gõ ‘show c’ để xem chi tiết.<br />\r\nGiả thiết lệnh `show w&#039; và `show c&#039; cho xem những phần tương ứng trong Giấy phép Công cộng. Tất nhiên những lệnh mà bạn dùng có thể khác với ‘show w&#039; và `show c&#039;; những lệnh này có thể là nhấn chuột hoặc lệnh trong thanh công cụ - tuỳ theo chương trình của bạn.</p>\r\n</blockquote>\r\n\r\n<p>Bạn cũng cần phải lấy chữ ký của người phụ trách (nếu bạn là người lập trình) hoặc của trường học (nếu có) xác nhận từ chối bản quyền đối với chương trình. Sau đây là ví dụ:</p>\r\n\r\n<blockquote>\r\n<p>Yoyodyne, Inc., tại đây từ chối tất cả các quyền lợi bản quyền đối với chương trình `Gnomovision&#039; viết bởi James Hacker.<br />\r\n<br />\r\nchữ ký của Ty Coon, 1 April 1989<br />\r\nTy Coon, Phó Tổng Giám đốc.</p>\r\n</blockquote>\r\n\r\n<p>Giấy phép Công cộng này không cho phép đưa chương trình của bạn vào trong các chương trình độc quyền. Nếu chương trình của bạn là một thư viện thủ tục phụ, bạn có thể thấy nó hữu ích hơn nếu cho thư viện liên kết với các ứng dụng độc quyền. Nếu đây là việc bạn muốn làm, hãy sử dụng Giấy phép Công cộng Hạn chế của GNU thay cho Giấy phép này.</p>\r\n\r\n<hr  />\r\n<p><strong>Bản gốc của giấy phép bằng tiếng Anh có tại các địa chỉ sau:</strong></p>\r\n\r\n<ol>\r\n	<li>GNU General Public License, version 1, February 1989:&nbsp;<a href="http://www.gnu.org/licenses/old-licenses/gpl-1.0.txt" target="_blank">http://www.gnu.org/licenses/old-licenses/gpl-1.0.txt</a></li>\r\n	<li>GNU General Public License, version 2, June 1991:&nbsp;<a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html" target="_blank">http://www.gnu.org/licenses/old-licenses/gpl-2.0.html</a></li>\r\n	<li>GNU General Public License, version 3, 29 June 2007:&nbsp;<a href="http://www.gnu.org/licenses/gpl-3.0.txt" target="_blank">http://www.gnu.org/licenses/gpl-3.0.txt</a></li>\r\n</ol>\r\n\r\n<p><strong>Tài liệu tham khảo:</strong></p>\r\n\r\n<ol>\r\n	<li>Bản dịch tiếng Việt của Giấy phép Công cộng GNU tại OpenOffice.org:&nbsp;<br />\r\n	<a href="http://vi.openoffice.org/gplv.html" target="_blank">http://vi.openoffice.org/gplv.html</a></li>\r\n	<li>GPL tại&nbsp;Văn thư lưu trữ mở Wikisource:&nbsp;<a href="http://vi.wikisource.org/wiki/GPL" target="_blank">http://vi.wikisource.org/wiki/GPL</a></li>\r\n</ol>\r\n\r\n<p><strong>Xem thêm:</strong></p>\r\n\r\n<ol>\r\n	<li>LGPL tại&nbsp;Văn thư lưu trữ mở Wikisource:&nbsp;<a href="http://vi.wikisource.org/wiki/LGPL" target="_blank">http://vi.wikisource.org/wiki/LGPL</a></li>\r\n	<li>Giấy phép Công cộng GNU - WikiPedia:&nbsp;<br />\r\n	<a href="http://vi.wikipedia.org/wiki/Gi%E1%BA%A5y_ph%C3%A9p_C%C3%B4ng_c%E1%BB%99ng_GNU" target="_blank">http://vi.wikipedia.org/wiki/Giấy_phép_Công_cộng_GNU</a></li>\r\n	<li>Thảo luận giấy phép GNU GPL - HVA:<br />\r\n	&nbsp;<a href="http://www.hvaonline.net/hvaonline/posts/list/7120.hva" target="_blank">http://www.hvaonline.net/hvaonline/posts/list/7120.hva</a></li>\r\n	<li>Thảo luận tại diễn đàn:&nbsp;<a href="http://nukeviet.vn/phpbb/viewtopic.php?f=83&amp;t=1591" target="_blank">http://nukeviet.vn/phpbb/viewtopic.php?f=83&amp;t=1591</a></li>\r\n</ol>', 'giấy phép,công cộng,tiếng anh,gnu general,public license,gnu gpl,phần mềm,là tự,sử dụng,mã nguồn,bản dịch,tiếng việt,của gnu,đây là,này không,do tổ,chức tự,hành và,các điều,cho các,có bản,tuy nhiên,chúng tôi,cho những,phiên bản,mọi người,được phép,sao chép,lưu hành,bản sao,nguyên bản,nhưng không,và thay,nội dung,của này,hạn chế,tự do,chia sẻ,nukeviet,portal,mysql,php,cms,mã nguồn mở,thiết kế website', 0, '4', '', 4, 1, 1675986735, 1675986735, 1, 3, 0);
INSERT INTO `hn4_vi_about` (`id`, `title`, `alias`, `image`, `imagealt`, `imageposition`, `description`, `bodytext`, `keywords`, `socialbutton`, `activecomm`, `layout_func`, `weight`, `admin_id`, `add_time`, `edit_time`, `status`, `hitstotal`, `hot_post`) VALUES
(5, 'Những tính năng của NukeViet CMS 4.0', 'nhung-tinh-nang-cua-nukeviet-cms-4-0', '', '', 0, '', '<p><span style="font-size: 150%; line-height: 116%;"><span style="font-weight: bold;">Giới thiệu chung</span></span><br  /> <span style="font-weight: bold;">Mã nguồn mở NukeViet là sản phẩm của sự làm việc chuyên nghiệp: </span><br  /> Để xây dựng lên NukeViet 4, đội ngũ phát triển đã thành lập công ty VINADES.,JSC. Trong quá trình phát triển NukeViet 4, VINADES.,JSC đã hợp tác với nhiều đơn vị cung cấp hosting trong và ngoài nước để thử nghiệm host, đảm bảo tương thích với đa số các hosting chuyên nghiệp.<br  /> NukeViet 4 cũng được vận hành thử nghiệm, góp ý bởi nhiều webmaster có kinh nghiệm quản trị ở nhiều hệ thống khác nhau nhằm tối ưu các tính năng hệ thống cho người sử dụng.<br  /> NukeViet 4 được lập trình bởi các lập trình viên mà kinh nghiệm và tên tuổi của họ đã được xác lập cùng với tên tuổi của bộ mã nguồn mở tạo web đầu tiên của Việt Nam.<br  /> <br  /> <span style="font-weight: bold;">NukeViet 4 là một hệ thống mạnh:</span><br  /> Rút kinh nghiệm từ chính NukeViet 2, NukeViet 3, NukeViet 4 được viết mới hoàn toàn trên nền tảng kỹ thuật tiên tiến nhất hiện nay cho phép xây dựng các nền tảng ứng dụng trực tuyến lớn như Các cổng thông tin điện tử, các tòa soạn báo điện tử, các mạng xã hội và các hệ thống thương mại trực tuyến.<br  /> NukeViet 4 đã được thử nghiệm vận hành với dữ liệu lớn lên tới hàng triệu bản tin. Trên thực tế, NukeViet 4 cũng đã triển khai thành công cho các hiệp hội, doanh nghiệp có lượng truy cập rất lớn.<br  /> <br  /> <span style="font-weight: bold;">NukeViet 4 thích hợp cho mọi đối tượng:</span><br  /> NukeViet lấy người sử dụng làm trọng tâm, những tính năng của NukeViet tạo nên chuẩn mực trong việc sử dụng và quản trị. Vì thế, NukeViet 4 tốt cho cả người sử dụng lẫn người phát triển.<br  /> Với người sử dụng, NukeViet 4 cho phép tùy biến dễ dàng và sử dụng ngay mà không cần can thiệp vào hệ thống.<br  /> Với người phát triển, sử dụng NukeViet cho phép nhanh chóng xây dựng các nền tảng khác nhau nhờ việc viết thêm các module cho hệ thống thay vì phải tự mình viết cả một hệ thống.</p>  <p><span style="font-size: 150%; line-height: 116%;"><span style="font-weight: bold;">Các tính năng của NukeViet 4</span></span></p> <span style="font-weight: bold;">Nền tảng công nghệ</span>  <ul> 	<li><span id="cke_bm_178S" style="display: none;">&nbsp;</span>NukeViet CMS 4 lập trình trên PHP 5.4 và MySQL 5, Sử dụng PDO để kết nối với MySQL (Sẵn sàng kết nối với các CSDL khác) cho phép vận dụng tối đa sức mạnh của công nghệ mới.</li> 	<li>Sử dụng Composer để quản lý các thư viện PHP được cài vào hệ thống.</li> 	<li>Từng bước áp dụng các tiêu chuẩn viết code PHP theo khuyến nghị của http://www.php-fig.org/psr/</li> 	<li>Ứng dụng Xtemplate và jQuery cho phép vận dụng Ajax uyển chuyển từ trong nhân hệ thống.</li> 	<li>Giai diện trong NukeViet 4 được làm mới, tương thích với nhiều màn hình hơn, Sử dụng thư viện bootstrap để việc phát triển giao diện thống nhất và dễ dàng hơn.</li> 	<li>Tận dụng các thành tựu mã nguồn mở có sẵn nhưng NukeViet 4 vẫn đảm bảo rằng từng dòng code là được code tay. Điều này có nghĩa là NukeViet 4 hoàn toàn không lệ thuộc vào bất cứ framework nào trong quá trình phát triển của mình; Bạn hoàn toàn có thể đọc hiểu để tự lập trình trên NukeViet 4 nếu bạn biết PHP và MySQL (đồng nghĩa với việc NukeViet 4 hoàn toàn mở và dễ nghiên cứu cho bất cứ ai muốn tìm hiểu về code của NukeViet).<span id="cke_bm_178E" style="display: none;">&nbsp;</span></li> </ul>  <ul id="docs-internal-guid-7ec786f5-1ade-f016-4c9b-c9a8e36cc922"> </ul>  <p><span style="font-weight: bold;">Kiến trúc Module</span></p>  <ul> 	<li>NukeViet CMS 4 tái cấu trúc lại module, theo đó, toàn bộ tệp tin của mỗi module được gói gọn trong một thư mục riêng nhằm đơn giản trong việc quản lý và đóng gói ứng dụng. Kiến trúc module này tạo ra khái niệm block của module và theme của module giúp đa dạng hóa việc trình bày module.</li> 	<li>Hệ thống NukeViet 4 hỗ trợ công nghệ đa nhân module. Chúng tôi gọi đó là công nghệ ảo hóa module. Công nghệ này cho phép người sử dụng có thể khởi tạo hàng ngàn module một cách tự động mà không cần động đến một dòng code. Các module được sinh ra từ công nghệ này gọi là module ảo. Module ảo là module được nhân bản từ một module bất kỳ của hệ thống nukeviet nếu module đó cho phép tạo module ảo.</li> 	<li>NukeViet 4 cũng hỗ trợ việc cài đặt từ động 100% các module kèm theo block, theme từ Admin Control Panel, người sử dụng có thể cài module mà không cần làm bất cứ thao tác phức tạp nào. NukeViet 4 còn cho phép bạn đóng gói module để chia sẻ cho người khác.</li> 	<li>Hệ thống cho phép quản lý module từ trong Admin Control Panel, quản trị cấp cao có thể phân quyền truy cập cũng như tạm ngưng hoạt động hay thậm chí cài lại hoặc xóa module tùy theo nhu cầu sử dụng.</li> </ul>  <p><br  /> <span style="font-weight: bold;">Đa ngôn ngữ</span></p>  <ul> 	<li>NukeViet 4 đa ngôn ngữ 100% với 2 loại: đa ngôn ngữ giao diện và đa ngôn ngữ xử lý dữ liệu (database).</li> 	<li>NukeViet 4 có tính năng cho phép người quản trị tự xây dựng ngôn ngữ mới cho site. Cho phép đóng gói file ngôn ngữ để chia sẻ cho cộng đồng...</li> 	<li>NukeViet cũng có trung tâm dịch thuật riêng dành cho việc chung tay góp sức xây dựng những ngôn ngữ mới tại địa chỉ: <a href="http://translate.nukeviet.vn" target="_blank">http://translate.nukeviet.vn</a></li> 	<li>NukeViet 4 tách bạch ngôn ngữ quản trị và ngôn ngữ người dùng, ngôn ngữ giao diện và ngôn ngữ database giúp dễ dàng xây dựng và quản lý các hệ thống đa ngôn ngữ.</li> 	<li>NukeViet 4 còn có khả năng tự động nhận diện và chuyển ngôn ngữ phù hợp cho người sử dụng.</li> 	<li>NukeViet 4 còn có sẵn 3 ngôn ngữ mặc định là Việt, Anh và Pháp.</li> </ul>  <p><span style="font-weight: bold;">Phân quyền</span><strong> cấp độ hệ thống</strong><br  /> NukeViet 4 tách biệt 2 khu vực: Khu vực quản trị và Khu vực người dùng. Toàn bộ các tính năng quản lý nằm trong khu vực quản trị nhằm đảm bảo việc phân quyền được thực hiện chính xác và an toàn nhất.<br  /> <br  /> <span style="font-weight: bold;">Phân quyền Quản trị</span><br  /> NukeViet 4 phân quyền theo module và theo ngôn ngữ, do đó dễ dàng xác lập quyền quản trị cho các hệ thống lớn, nhiều người quản trị cùng làm việc.<br  /> <br  /> <span style="font-weight: bold;">Phân quyền thành viên</span><br  /> NukeViet 4 cho phép quản lý và phân nhóm người sử dụng thành các nhóm khác nhau để dễ dàng phân quyền người sử dụng theo từng module cụ thể.<br  /> <br  /> <strong>Phân quyền cấp độ module</strong><br  /> Ở cấp module, tùy chức năng module được thiết kế mà nó có thể được phân quyền theo các cơ chế khác nhau, việc này đặc biệt linh hoạt khi xây dựng các hệ thống lớn. Với module News tích hợp trong hệ thống được trang bị việc phân quyền tới từng chuyên mục.<br  /> <br  /> <span style="font-weight: bold;">Đa giao diện</span></p>  <ul> 	<li>Cài đặt: NukeViet 4 hỗ trợ cài đặt và gỡ bỏ giao diện hoàn toàn tự động. Hơn thế nữa, bạn có thể đóng gói giao diện để chia sẻ cho website khác một cách dễ dàng.</li> 	<li>NukeViet hỗ trợ giao diện theo ngôn ngữ, giao diện theo module, định nghĩa giao diện mobile (NukeViet 4) và giao diện PC tùy theo ý người quản trị.</li> 	<li>NukeViet hỗ trợ hệ thống đa giao diện cực kỳ uyển chuyển cho cả người sử dụng lẫn người lập trình. Với NukeViet 4, người sử dụng có thể tùy biến một cách dễ dàng: gán giao diện theo module, thiết lập bố cục giao diện cho từng tính năng của module.</li> 	<li>Với người thiết kế giao diện: có thể tùy ý thiết kế không giới hạn bố cục giao diện. Giao diện đã được tách bạch phần HTML và CSS khỏi PHP vì vậy người thiết kế tùy trình độ mà có thể can thiệp vào các lớp giao diện để chỉnh sửa hoặc thiết kế giao diện mới một cách dễ dàng.</li> </ul>  <p><strong>Hỗ trợ truy cập từ điện thoại, máy tính bảng.</strong><br  /> Từ bản NukeViet 4, NukeViet có thể tự động nhận diện thiết bị di động để chuyển giao diện và chế độ tương tác phù hợp. Ngoài ra NukeViet 4 còn có giao diện tùy biến, để có thể hiển thị tốt trên các màn hình khác nhau.<br  /> <br  /> <span style="font-weight: bold;">Tùy biến site bằng Block</span><br  /> NukeViet cho phép đa dạng hóa bố cục và chức năng cho website nhờ các khối (block) khác nhau trên website. Các khối này có thể là các ứng dụng, các khối quảng cáo hoặc dữ liệu bất kỳ nào được người sử dụng định nghĩa. Block của NukeViet 4 cũng phân theo 2 cấp: Block của hệ thống và block cho từng module.<br  /> Người sử dụng có thể tùy ý bố trí vị trí block ở các vị trí khác nhau: toàn bộ website, theo từng module và thậm chí là từng tính năng của module. Block có thể có các giao diện khác nhau theo theme. Có thể hẹn giờ bật/tắt cũng như phân quyền cho từng đối tượng người truy cập.<br  /> Việc bố trí block có thể thực hiện trong Admin Control Panel hoặc kéo thả trực quan ngay tại giao diện người dùng.<br  /> <br  /> <span style="font-weight: bold;">An ninh, bảo mật</span><br  /> NukeViet 4 được thiết kế để nhận biết và chống các truy cập bất hợp pháp vào hệ thống cũng như gửi các dữ liệu có hại lên hệ thống.</p>  <ul> 	<li>Sau khi các chuyên giả bảo mật của HP gửi đánh giá, chúng tôi đã tối ưu NukeViet 4.0 để hệ thống an toàn hơn.</li> 	<li>Mã hóa các mật khẩu lưu trữ trong hệ thống: Các mật khẩu như FTP, SMTP,... đã được mã hóa, bảo mật thông tin người dùng.<br  /> 	Tường lửa Admin bảo vệ khu vực bằng mật khẩu và IP.</li> 	<li>Bộ lọc IP cấm và bộ lọc file cấm giúp ngăn ngừa các nguy cơ biết trước.</li> 	<li>Dữ liệu gửi qua hệ thống được kiểm duyệt bằng bộ lọc an ninh kép nhằm ngăn chặn các dữ liệu có khả năng tấn công vào hệ thống.</li> 	<li>NukeViet có khả năng ngăn chặn, theo dõi và kiểm soát truy cập vào hệ thống của tất cả các máy chủ tìm kiếm như yahoo và google hay bất cứ máy chủ tìm kiếm nào khác.</li> 	<li>Hệ thống có khả năng chống Spam bằng Captcha, chống lụt dữ liệu bằng nhiều hình thức như giới hạn thời gian gửi dữ liệu (sử dụng các công thức kép)...</li> 	<li>Hệ thống cho phép theo dõi, ghi nhận các thông số của máy tính truy cập đến site như: Hệ điều hành, Trình duyệt, quốc gia, các liên kết đến site (referer) để từ đó có thể kịp thời ngăn ngừa các nguy cơ tấn công bằng các hình thức như: kiểm tra và chặn các máy tình dùng proxy, chặn IP truy cập...</li> 	<li>hật ký hệ thống sẽ ghi nhận truy cập và thao tác tới cơ sở dữ liệu &amp; tệp tin, giúp người quản trị cũng như các thành viên dễ dàng phát hiện ra những đăng nhập bất hợp pháp từ lần đăng nhập trước đó.</li> 	<li>Hệ thống có thể phát hiện các bản nâng cấp mới của phần mềm để nhắc nhở người sử dụng nâng cấp và sửa chữa các lỗi (nếu có)</li> </ul>  <p><span style="font-weight: bold;">Quản lý CSDL</span></p>  <ul> 	<li>NukeViet 4 cho phép quản lý CSDL, người sử dụng có thể tối ưu, sao lưu trên máy chủ và tải dữ liệu về để phục vụ cho công tác phục hồi nếu xảy ra sự cố.</li> 	<li>Hỗ trợ mô hình CSDL theo mô hình master/slave để phân tải CSDL.</li> </ul>  <p><span style="font-weight: bold;">Kiểm soát lỗi tự động và báo lỗi thông minh</span></p>  <ul> 	<li>NukeViet 4 có hệ thống kiểm soát lỗi tự động và báo lỗi cho người dùng.</li> 	<li>Các lỗi (nếu có) sẽ được hệ thống kiểm soát có chủ đích, nó chỉ hiển thị lên màn hình người sử dụng ở lần đầu nó xuất hiện, sau đó hệ thống ghi nhận và báo về cho người quản trị qua email.</li> 	<li>Quản trị có thể cấu hình việc bật tắt việc có ghi nhận lỗi hay không.</li> </ul>  <p><span style="font-weight: bold;">Tối ưu hóa cho công cụ tìm kiếm (SEO)</span></p>  <ul> 	<li>Loại bỏ tên module khỏi URL khi không dùng đa ngôn ngữ.</li> 	<li>Cho phép đổi đường dẫn module</li> 	<li>Thêm chức năng xác thực Google+ (Bản quyền tác giả)</li> 	<li>Thêm chức năng ping đến các công cụ tìm kiếm: Submit url mới đến google để việc hiển thị bài viết mới lên kết quả tìm kiếm nhanh chóng hơn.</li> 	<li>Hỗ trợ Meta OG của facebook</li> 	<li>Hỗ trợ chèn Meta GEO qua Cấu hình Meta-Tags<br  /> 	Hỗ trợ SEO link.</li> 	<li>Quản lý và tùy biến tiêu đề site, description</li> 	<li>Hỗ trợ quản lý các thẻ meta như: keywords, description</li> 	<li>Hỗ trợ sử dụng keywords để phát sinh trang thống kê một cách tự động nhờ công cụ tìm kiếm.</li> 	<li>Hỗ trợ quản lý máy chủ tìm kiếm.</li> 	<li>Hỗ trợ quản lý cấu hình robots.txt</li> 	<li>Hỗ trợ chuẩn đoán site (site Diagnostic).</li> </ul>  <p><span style="font-weight: bold;">Sẵn sàng cho việc tích hợp các ứng dụng của bên thứ 3</span><br  /> NukeViet 3.4 sử dụng Cơ sở dữ liệu thành viên độc lập và xây dựng sẵn các phương thức kết nối với các ứng dụng Forum. Cơ sở dữ liệu thành viên độc lập giúp việc quản lý thành viên được chủ động, khi có nhu cầu kết nối hoặc trao quyền quản lý cho các ứng dụng từ bên thứ 3, NukeViet 3.4 vẫn hoàn toàn chủ động với dữ liệu thành viên của mình. Với NukeViet 3.4, các kết nối trực tiếp dành cho Forum như PHPBB hay VBB đều sẵn sàng.<br  /> <br  /> <span style="font-weight: bold;">Hỗ trợ Đăng nhập phân tán</span><br  /> NukeViet hỗ trợ thư viện OAuth , cho phép người truy cập có thể đăng nhập phân tán từ các hệ thống như FaceBook và Google hay các hệ thống OpenID khác giúp các website mới xây dựng có cơ hội thu hút lượng người sử dụng khổng lồ từ các hệ thống lớn.<br  /> Trong mọi trường hợp, hệ thống cho phép admin kiểm duyệt việc login OAuth. Tùy nhu cầu sử dụng mà có thể thiết đặt mức độ login cao nhất (tự động) tới mức độ vẫn phải đăng ký thành viên (bớt bước kích hoạt qua email). Người sử dụng cũng có thể quản lý nhiều tài khoản OAuth để từ đó có thể đăng nhập bằng tài khoản bất kỳ (nếu hệ thống cho phép).</p>  <p><strong>Trình soạn thảo tích hợp sẵn:</strong></p>  <p>Tại những vị trí phù hợp, NukeViet tích hợp sẵn trình soạn thảo CKeditor giúp người sử dụng dễ dàng biên tập nội dung trên giao diện trực quan và thân thiện như làm việc với phần mềm Microsoft Word hay OpenOffice. Hiện tại NukeViet 4 cũng đã mở sẵn để tích hợp các trình soạn thảo khác.</p>  <p><span style="font-weight: bold;">Các tiện ích khác</span><br  /> Hệ thống cho phép gửi mail bằng các phương thức: SMTP, Linux Mail, PHPmail.<br  /> Cho phép sử dụng phương thức FTP để ghi file nếu máy chủ không cho phép làm điều đó bằng PHP<br  /> Cho phép xây dựng và quản lý các tác vụ xử lý tự động như tự động sao lưu CSDL, tự động xóa các dữ liệu cũ hoặc gửi báo lỗi tới người quản trị...<br  /> Cung cấp đầy đủ các thông tin về hệ thống giúp nhà phát triển dễ dàng sử dụng các thông tin này phục vụ cho việc lập trình, kiểm tra và báo lỗi hệ thống.<br  /> <br  /> <span style="font-size: 150%; line-height: 116%;"><span style="font-weight: bold;">Các module tích hợp sẵn trong NukeViet CMS 4:</span></span><br  /> <span style="font-weight: bold;">Quản lý Upload</span></p>  <ul> 	<li>Upload file từ máy tính hoặc một địa chỉ bất kỳ trên mạng.</li> 	<li>Quản lý: Di chuyển, đổi tên, sửa, xóa, tạo hình thu nhỏ...</li> 	<li>Hỗ trợ tìm kiểm các file và mô tả các file được upload lên trong khu vực quản trị.</li> </ul>  <p><span style="font-weight: bold;">Quản trị và xuất bản Tin tức:</span> (cho phép tạo module ảo)<br  /> Hệ thống tin tức của NukeViet là hệ thống quản trị tin tức chuyên nghiệp đặc biệt phù hợp với các website tin tức. Nó cho phép xử lý nhiều tác vụ nền thông minh mà không cần người sử dụng can thiệp nhằm tối ưu cho hệ thống tin tức, Ví dụ: tạo hình thu nhỏ, tự động chia thư mục và sắp xếp hình vào các thư mục theo thời gian...</p>  <ul> 	<li>Quản lý chủ đề đa cấp trong đó bản tin có thể nằm ở 1 hoặc nhiều chủ đề không phụ thuộc quan hệ cha con giữa các chủ đề.</li> 	<li>Phân quyền cho người quản lý module, đến từng chủ đề</li> 	<li>Quản lý nhóm tin liên quan (phân luồn tin theo dòng đơn)</li> 	<li>Quản lý block tin (nhóm tin đa luồng)</li> 	<li>Quản lý Tags</li> 	<li>Quản lý nguồn tin</li> 	<li>Tùy chỉnh bố cục trang tin.</li> 	<li>Gửi bài viết, hẹn giờ đăng và nhiều tùy chỉnh khác: cho phép gửi bản tin, in, lưu bản tin.</li> 	<li>Cấp tin RSS</li> 	<li>Công cụ tương tác với mạng xã&nbsp; hội.</li> </ul>  <p><span style="font-weight: bold;">Module Page:</span></p>  <ul> 	<li>Module này thích hợp làm các bài viết không cần quản lý chủ đề, như các module ảo: giới thiệu, nội quy site ...</li> 	<li>Hỗ trợ SEO: Ảnh minh họa, chú thích ảnh minh họa, mô tả, từ khóa cho bài viết, hiển thị các công cụ tương tác với các mạng xã hội.</li> 	<li>Hỗ trợ RSS</li> 	<li>Cấu hình phương án hiển thị các bài viết trên trang chính.</li> </ul>  <p><span style="font-weight: bold;">Quản lý thành viên:</span></p>  <ul> 	<li>Quản lý việc đăng nhập, đăng ký.</li> 	<li>Quản lý phương thức đăng nhập: Qua openid hoặc đăng nhập trực tiếp.</li> 	<li>Quản lý câu hỏi bảo mật.</li> 	<li>Quản lý nội quy.</li> 	<li>Quản lý thông tin thành viên.</li> 	<li>Cho phép đăng nhập 1 lần tài khoản người dùng NukeViet với Alfresco, Zimbra, Moodle, Koha thông qua CAS.</li> 	<li>Chức năng tùy biến trường dữ liệu thành viên</li> 	<li>Chức năng phân quyền sử dụng module users</li> 	<li>Cấu hình Số ký tự username, độ phức tạp mật khẩu, tạo mật khảu ngẫu nhiên,....</li> 	<li>Cho phép sử dụng tên truy cập, hoặc email để đăng nhập</li> </ul>  <p><span style="font-weight: bold;">Quản lý liên hệ gửi đến website</span></p>  <ul> 	<li>Quản lý thông tin liên hệ trên site.</li> 	<li>Quản lý các bộ phận tiếp nhận liên hệ.</li> 	<li>Quản lý và trả lời các thư gửi tới. Admin có thể trả lời khách nhiều lần, hệ thống lưu lại lịch sử trao đổi đó.</li> 	<li>Hệ thống nhận thông báo: đây là một tiện ích nhỏ, song nó rất hữu dụng để admin tương tác với hệ thống một cách nhanh chóng. Admin có thể nhận thông báo từ hệ thống (hoặc từ module) khi có sự kiện nào đó. Ví dụ: Khi có khách gửi liên hệ (qua module contact) đến thì hệ thống xuất hiện biểu tượng thông báo “Có liên hệ mới” ở góc phải, Admin sẽ nhận được ngay lập tức thông báo khi người dùng đang ở Admin control panel (ACP).</li> </ul>  <p><span style="font-weight: bold;">Quản lý thăm dò ý kiến:</span></p>  <ul> 	<li>Tạo các thăm dò ý kiến</li> </ul>  <p><span style="font-weight: bold;">Quản lý quảng cáo chuyên nghiệp:</span></p>  <ul> 	<li>Quản lý khách hàng.</li> 	<li>Quản lý các khu vực quảng cáo</li> 	<li>Quản lý các nội dung quảng cáo.</li> 	<li>Kết hợp với việc quản lý block. Các quản cáo có thể đặt vào các khu vực khác nhau, dễ dàng thay đổi theo nhu cầu của người dùng.</li> </ul>  <p><span style="font-weight: bold;">Thống kê:</span> Thống kê theo năm, tháng, ngày, tuần, giờ.</p>  <ul> 	<li>Theo liên kết đến site</li> 	<li>Theo quốc gia</li> 	<li>Theo trình duyệt</li> 	<li>Theo hệ điều hành</li> 	<li>Máy chủ tìm kiếm</li> </ul>  <p><span style="font-weight: bold;">Tìm kiếm</span></p>  <ul> 	<li>Tìm kiếm chung toàn hệ thống</li> 	<li>Tìm kiếm nâng cao từng khu vực</li> </ul>  <div><strong>Module menu:</strong></div>  <ul> 	<li>Module này cung cấp để quản lý các menu tùy biên, có thể lấy liên kết từ nhiều mục khác nhau.</li> 	<li>Phương án quản lý menu được thay đổi hướng tới việc quản lý menu nhanh chóng, tiện lợi nhất cho admin.</li> 	<li>Admin có thể nạp nhanh menu theo các tùy chọn mà hệ thống cung cấp.</li> 	<li>Mẫu menu cũng được thay đổi, đa dạng và hiển thị tốt với các giao diện hiện đại.</li> </ul>  <p><strong>Quản lý Bình luận</strong></p>  <ul> 	<li>Các bình luận của các module sẽ được tích hợp quản lý tập trung để cấu hình, phân quyền.</li> 	<li>Khi xây dựng mới module, Chỉ cần nhúng 1 đoạn mã vào. Tránh phải việc copy mã code gây khó khăn cho bảo trì.</li> </ul>  <p><br  /> Trên đây là các tính năng chính của bộ nhân hệ thống NukeViet 4, để xem đầy đủ hơn các tính năng <strong><a href="http://wiki.nukeviet.vn/nukeviet4:feature">click vào đây</a></strong>. Với NukeViet, việc mở rộng thêm các tính năng là không hạn chế, đơn giản là cài thêm các module tương ứng hoặc xây dựng thêm các module đó cho NukeViet.</p>', '', 0, '4', '', 5, 1, 1675986735, 1675986735, 1, 4, 0),
(6, 'Yêu cầu sử dụng NukeViet 4', 'Yeu-cau-su-dung-NukeViet-4', '', '', 0, '', '<h2 class="sectionedit2" id="moi_truong_may_chủ">1. Môi trường máy chủ</h2>  <div class="level2"> <p><strong>Yêu cầu bắt buộc</strong></p>  <ul> 	<li class="level1"> 	<div class="li">Hệ điều hành: Unix (Linux, Ubuntu, Fedora …) hoặc Windows</div> 	</li> 	<li class="level1"> 	<div class="li">PHP: PHP 5.4 hoặc phiên bản mới nhất.</div> 	</li> 	<li class="level1"> 	<div class="li">MySQL: MySQL 5.5 hoặc phiên bản mới nhất</div> 	</li> </ul>  <p><strong>Tùy chọn bổ sung</strong></p>  <ul> 	<li class="level1"> 	<div class="li">Máy chủ Apache cần hỗ trợ mod mod_rewrite.</div> 	</li> 	<li class="level1"> 	<div class="li">Máy chủ Nginx cấu hình các thông số rewite.</div> 	</li> 	<li class="level1"> 	<div class="li">Máy chủ IIS 7.0 hoặc IIS 7.5 cần cài thêm module rewrite</div> 	</li> 	<li class="level1"> 	<div class="li">Môi trường PHP mở rộng: Các thư viện PHP cần có: file_uploads, session, mbstring, curl, gd2, zlib, soap, php_zip.</div> 	</li> </ul>  <p><em class="u"><strong>Ghi chú:</strong></em></p>  <ul> 	<li class="level1"> 	<div class="li">Những yêu cầu trên không có nghĩa là NukeViet 4 không làm việc trên các hệ thống khác, điều quan trọng là cần thiết lập môi trường làm việc phù hợp.</div> 	</li> 	<li class="level1"> 	<div class="li">Với những website sử dụng hosting, NukeViet 4 làm việc tốt nhất trên các hosting Linux cài sẵn Apache 2.2, PHP 5, MySQL 5, DirectAdmin hoặc Cpanel.</div> 	</li> 	<li class="level1"> 	<div class="li">Với các website cần chịu tải cao, nên sử dụng Nginx, PHP7 (php-fpm). Tham khảo thêm mô hình <a class="urlextern" href="http://wiki.nukeviet.vn/web_server:cai-dat-server-chi-tai-cao" rel="nofollow" target="_blank" title="http://wiki.nukeviet.vn/web_server:cai-dat-server-chi-tai-cao">http://wiki.nukeviet.vn/web_server:cai-dat-server-chi-tai-cao</a></div> 	</li> </ul> </div>  <div class="secedit editbutton_section editbutton_2">  <div class="no">&nbsp;</div>  </div>  <h2 class="sectionedit3" id="may_tinh_nguời_truy_cập">2. Máy tính người truy cập</h2>  <div class="level2"> <p>NukeViet 4 cho kết quả là chuẩn HTML5 và CSS 3, đây là định dạng chuẩn mà hầu hết các trình duyệt hiện nay đang hỗ trợ. Chính vì vậy các website làm trên nền NukeViet 4 có thể truy cập tốt trên các phiên bản mới nhất của trình duyệt FireFox, Internet Explorer 9, Google Chrome … Máy tính người truy cập chỉ cần cài một trong các trình duyệt này là có thể tương tác với NukeViet thông qua internet hoặc intranet.</p> </div>', '', 0, '4', '', 6, 1, 1675986735, 1675986735, 1, 4, 0),
(7, 'Giới thiệu về Công ty cổ phần phát triển nguồn mở Việt Nam', 'gioi-thieu-ve-cong-ty-co-phan-phat-trien-nguon-mo-viet-nam', '', '', 0, '', '<p><strong>Công ty cổ phần phát triển nguồn mở Việt Nam</strong> (VINADES.,JSC) là công ty mã nguồn mở đầu tiên của Việt Nam sở hữu riêng một mã nguồn mở nổi tiếng và đang được sử dụng ở hàng ngàn website lớn nhỏ trong mọi lĩnh vực. Wbsite đang hoạt động chính thức: <a href="http://vinades.vn/">http://vinades.vn/</a><br  /> <br  /> Ra đời từ hoạt động của tổ chức nguồn mở NukeViet (từ năm 2004) và chính thức được thành lập đầu 2010 tại Hà Nội, khi đó báo chí đã gọi VINADES.,JSC là <em><strong>&quot;Công ty mã nguồn mở đầu tiên tại Việt Nam&quot;</strong></em>.<br  /> <br  /> Ngay sau khi thành lập, VINADES.,JSC đã thành công trong việc xây dựng <strong><a href="http://nukeviet.vn/" target="_blank">NukeViet</a></strong> thành một <a href="http://nukeviet.vn/" target="_blank">mã nguồn mở</a> thuần Việt. Với khả năng mạnh mẽ, cùng các ưu điểm vượt trội về công nghệ, độ an toàn và bảo mật, NukeViet đã được hàng ngàn website lựa chọn sử dụng trong năm qua. Ngay khi ra mắt phiên bản mới năm 2010, NukeViet đã tạo nên hiệu ứng truyền thông chưa từng có trong lịch sử mã nguồn mở Việt Nam. Tiếp đó, năm 2011 Mã nguồn mở NukeViet đã giành giải thưởng Nhân tài đất Việt cho sản phẩm Công nghệ thông tin đã được ứng dụng rộng rãi.</p>  <div style="text-align: center;"> <div class="youtube-embed-wrapper" style="position:relative;padding-bottom:56.25%;padding-top:30px;height:0;overflow:hidden;"><iframe allowfullscreen="" height="480" src="//www.youtube.com/embed/ZOhu2bLE-eA?rel=0&amp;autoplay=1" style="position: absolute;top: 0;left: 0;width: 100%;height: 100%;" width="640"></iframe></div> <br  /> <span style="font-size:12px;"><strong>Video clip trao giải Nhân tài đất Việt 2011.</strong><br  /> Sản phẩm &quot;Mã nguồn mở NukeViet&quot; đã nhận giải cao nhất (Giải ba, không có giải nhất, giải nhì) của Giải thưởng Nhân Tài Đất Việt 2011 ở lĩnh vực Công nghệ thông tin - Sản phẩm đã có ứng dụng rộng rãi.</span></div>  <p><br  /> Tự chuyên nghiệp hóa mình, thoát khỏi mô hình phát triển tự phát, công ty đã nỗ lực vươn mình ra thế giới và đang phấn đấu trở thành một trong những hiện tượng của thời &quot;dotcom&quot; ở Việt Nam.<br  /> <br  /> Để phục vụ hoạt động của công ty, công ty liên tục mở rộng và tuyển thêm nhân sự ở các vị trí: Lập trình viên, chuyên viên đồ họa, nhân viên kinh doanh... Hãy liên hệ ngay để gia nhập VINADES.,JSC và cùng chúng tôi trở thành một công ty phát triển nguồn mở thành công nhất Việt Nam.</p>  <p>Nếu bạn có nhu cầu triển khai các hệ thống <strong><a href="http://toasoandientu.vn" target="_blank">Tòa Soạn Điện Tử</a></strong>, <strong><a href="http://webnhanh.vn" target="_blank">phần mềm trực tuyến</a></strong>, <strong><a href="http://vinades.vn" target="_blank">thiết kế website</a></strong> theo yêu cầu hoặc dịch vụ có liên quan, hãy liên hệ công ty chuyên quản NukeViet theo thông tin dưới đây:</p>  <p><strong><span style="font-family: Tahoma; color: rgb(255, 69, 0); font-size: 14px;">CÔNG TY CỔ PHẦN PHÁT TRIỂN NGUỒN MỞ VIỆT NAM</span></strong><br  /> <strong>VIET NAM OPEN SOURCE DEVELOPMENT JOINT STOCK COMPANY</strong> (<strong>VINADES.,JSC</strong>)<br  /> Website: <a href="http://vinades.vn/">http://vinades.vn</a> | <a href="http://nukeviet.vn/">http://nukeviet.vn</a> | <a href="http://webnhanh.vn/">http://webnhanh.vn</a><br  /> Trụ sở: Phòng 2004 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.<br  /> - Tel: +84-4-85872007<br  /> - Fax: +84-4-35500914<br  /> - Email: <a href="mailto:contact@vinades.vn">contact@vinades.vn</a></p>', 'giới thiệu,công ty,cổ phần,phát triển', 0, '4', '', 7, 1, 1675986735, 1675986735, 1, 4, 0),
(8, 'Ủng hộ, hỗ trợ và tham gia phát triển NukeViet', 'ung-ho-ho-tro-va-tham-gia-phat-trien-nukeviet', '', '', 0, 'Nếu bạn yêu thích NukeViet, bạn có thể ủng hộ và hỗ trợ NukeViet bằng nhiều cách', '<h2>1. Ủng hộ bằng tiền mặt vào Quỹ tài trợ NukeViet</h2>\r\nQua tài khoản Paypal:\r\n\r\n<p style="text-align:center"><a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&amp;hosted_button_id=5LUSNE2SV5RR2" target="_blank"><img alt="" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" /></a></p>\r\nChuyển khoản ngân hàng trực tiếp:\r\n\r\n<ul>\r\n	<li>Người đứng tên tài khoản:&nbsp;NGUYEN THE HUNG</li>\r\n	<li>Số tài khoản:&nbsp;0031000792053</li>\r\n	<li>Loại tài khoản: VND (Việt Nam Đồng)</li>\r\n	<li>Ngân hàng Vietcombank chi nhánh Hải Phòng.</li>\r\n	<li>Website:&nbsp;<a href="http://www.vietcombank.com.vn/">http://www.vietcombank.com.vn</a></li>\r\n</ul>\r\n\r\n<div class="alert alert-info">Lưu ý: Đây là tài khoản hợp lệ duy nhất mà NukeViet.VN sử dụng cho&nbsp;Quỹ tài trợ NukeViet.</div>\r\nThảo luận tại đây:&nbsp;<a href="http://forum.nukeviet.vn/viewtopic.php?f=3&amp;t=3592" target="_blank">http://forum.nukeviet.vn/viewtopic.php?f=3&amp;t=3592</a>\r\n\r\n<h2>2. Ủng hộ bằng cách sử dụng và phổ biến NukeViet đến nhiều người hơn</h2>\r\nCách đơn giản nhất để ủng hộ NukeViet phát triển là sử dụng NukeViet và giúp NukeViet phổ biến đến nhiều người hơn (ví dụ như giữ lại dòng chữ &quot;Powered by&nbsp;<a href="http://nukeviet.vn/" target="_blank">NukeViet</a>&quot; hoặc &quot;Sử dụng&nbsp;<a href="http://nukeviet.vn/" target="_blank">NukeViet</a>&quot; trên website của bạn, viết bài giới thiệu NukeViet đến mọi người).<br />\r\nNếu bạn có thời gian, bạn có thể tham gia&nbsp;<a href="http://forum.nukeviet.vn/" target="_blank">diễn đàn NukeViet</a>&nbsp;thường xuyên và giúp đỡ những người mới sử dụng NukeViet.\r\n\r\n<h2>3. Ủng hộ bằng cách tham gia phát triển NukeViet</h2>\r\n\r\n<h3>3.1. Phát triển module, giao diện cho NukeViet</h3>\r\nNếu bạn biết code, hãy tham gia viết module, block, theme cho NukeViet và đưa lên&nbsp;<a href="http://nukeviet.vn/vi/store/" target="_blank">NukeViet Store</a>&nbsp;để cung cấp cho cộng đồng. Bạn cũng có thể tham gia đội ngũ phát triển NukeViet.\r\n\r\n<h3>3.2. Tham gia phát triển nhân hệ thống</h3>\r\nToàn bộ code nhân hệ thống NukeViet đã được đưa lên GitHub.com (truy cập tắt:&nbsp;<a href="http://code.nukeviet.vn/" target="_blank">http://code.nukeviet.vn</a>), dù bạn là ai, cá nhân hay doanh nghiệp chỉ cần có một tài khoản tại GitHub và học cách sử dụng&nbsp;<a href="#git">git&nbsp;(1)</a>&nbsp;là bạn có thể tham gia phát triển code NukeViet. Tìm hiểu thêm về việc tham gia phát triển code nhân hệ thống NukeViet tại đây:&nbsp;<a href="http://wiki.nukeviet.vn/programming:github_rule" target="_blank">http://wiki.nukeviet.vn/programming:github_rule</a>\r\n\r\n<h3>3.3. Tham gia dịch thuật</h3>\r\nNếu bạn biết ngoại ngữ, hãy đăng ký tham gia đội ngũ dịch thuật tình nguyện tại&nbsp;<a href="http://translate.nukeviet.vn/" target="_blank">NukeViet Stranslate System</a>&nbsp;để dịch thuật NukeViet sang các ngôn ngữ khác, quảng bá NukeViet ra với thế giới.\r\n\r\n<h3>3.4. Tham gia viết tài liệu hướng dẫn sử dụng</h3>\r\nNếu bạn không biết code, không biết ngoại ngữ, bạn vẫn có thể tham gia đóng góp cho NukeViet bằng cách biên soạn tài liệu hướng dẫn người dùng NukeViet tại thư viện tài liệu mở của NukeViet ở địa chỉ&nbsp;<a href="http://wiki.nukeviet.vn/" target="_blank">http://wiki.nukeviet.vn</a>\r\n\r\n<hr  /> <a id="git" name="git">(1)</a>: Tìm hiểu về git:&nbsp;<a href="http://wiki.nukeviet.vn/programming:vcs:git" target="_blank">http://wiki.nukeviet.vn/programming:vcs:git</a>', 'ủng hộ,hỗ trợ,tham gia,phát triển', 0, '4', '', 8, 1, 1675986735, 1675986735, 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_about_config`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_about_config` (
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_about_config`
--

INSERT INTO `hn4_vi_about_config` (`config_name`, `config_value`) VALUES
('viewtype', '0'),
('facebookapi', ''),
('per_page', '20'),
('news_first', '0'),
('related_articles', '5'),
('copy_page', '0'),
('alias_lower', '1'),
('socialbutton', 'facebook,twitter');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_blocks_groups`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_blocks_groups` (
  `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `theme` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dtime_type` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'regular',
  `dtime_details` text COLLATE utf8mb4_unicode_ci,
  `active` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `all_func` tinyint(4) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `config` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`bid`),
  KEY `theme` (`theme`),
  KEY `module` (`module`),
  KEY `position` (`position`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=37 ;

--
-- Dumping data for table `hn4_vi_blocks_groups`
--

INSERT INTO `hn4_vi_blocks_groups` (`bid`, `theme`, `module`, `file_name`, `title`, `link`, `template`, `position`, `dtime_type`, `dtime_details`, `active`, `act`, `groups_view`, `all_func`, `weight`, `config`) VALUES
(1, 'default', 'news', 'module.block_newscenter.php', 'Tin mới nhất', '', 'no_title', '[TOP]', 'regular', '[]', '1', 1, '6', 0, 1, 'a:10:{s:6:"numrow";i:6;s:11:"showtooltip";i:1;s:16:"tooltip_position";s:6:"bottom";s:14:"tooltip_length";s:3:"150";s:12:"length_title";i:0;s:15:"length_hometext";i:0;s:17:"length_othertitle";i:60;s:5:"width";i:500;s:6:"height";i:0;s:7:"nocatid";a:0:{}}'),
(3, 'default', 'news', 'global.block_category.php', 'Chủ đề', '', 'no_title', '[LEFT]', 'regular', '[]', '1', 1, '6', 0, 1, 'a:2:{s:5:"catid";i:0;s:12:"title_length";i:0;}'),
(4, 'default', 'theme', 'global.module_menu.php', 'Module Menu', '', 'no_title', '[LEFT]', 'regular', '[]', '1', 1, '6', 0, 2, ''),
(36, 'licavali', 'shops', 'global.block_cart.php', 'global block cart', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(6, 'default', 'statistics', 'global.counter.php', 'Thống kê', '', 'primary', '[LEFT]', 'regular', '[]', '1', 1, '6', 1, 4, ''),
(7, 'default', 'about', 'global.about.php', 'Giới thiệu', '', 'border', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(35, 'licavali', 'users', 'global.user_button.php', 'global user button', '', 'no_title', '[PERSONALAREA]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(9, 'default', 'voting', 'global.voting_random.php', 'Thăm dò ý kiến', '', 'primary', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 3, ''),
(10, 'default', 'news', 'global.block_tophits.php', 'Tin xem nhiều', '', 'primary', '[RIGHT]', 'regular', '[]', '1', 1, '6', 1, 4, 'a:6:{s:10:"number_day";i:3650;s:6:"numrow";i:10;s:11:"showtooltip";i:1;s:16:"tooltip_position";s:6:"bottom";s:14:"tooltip_length";s:3:"150";s:7:"nocatid";a:2:{i:0;i:10;i:1;i:11;}}'),
(11, 'default', 'theme', 'global.copyright.php', 'Copyright', '', 'no_title', '[FOOTER_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:5:{s:12:"copyright_by";s:0:"";s:13:"copyright_url";s:0:"";s:9:"design_by";s:12:"VINADES.,JSC";s:10:"design_url";s:18:"http://vinades.vn/";s:13:"siteterms_url";s:39:"/index.php?language=vi&amp;nv=siteterms";}'),
(12, 'default', 'contact', 'global.contact_form.php', 'Feedback', '', 'no_title', '[FOOTER_SITE]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(13, 'default', 'theme', 'global.QR_code.php', 'QR code', '', 'no_title', '[QR_CODE]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(14, 'default', 'statistics', 'global.counter_button.php', 'Online button', '', 'no_title', '[QR_CODE]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(15, 'default', 'push', 'global.push.php', 'Thông báo đẩy', '', 'no_title', '[PERSONALAREA]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(16, 'default', 'users', 'global.user_button.php', 'Đăng nhập người dùng', '', 'no_title', '[PERSONALAREA]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(17, 'default', 'theme', 'global.company_info.php', 'Công ty chủ quản', '', 'simple', '[COMPANY_INFO]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:13:{s:12:"company_name";s:58:"Công ty cổ phần phát triển nguồn mở Việt Nam";s:15:"company_address";s:72:"Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội";s:16:"company_sortname";s:12:"VINADES.,JSC";s:15:"company_regcode";s:0:"";s:16:"company_regplace";s:0:"";s:21:"company_licensenumber";s:0:"";s:22:"company_responsibility";s:0:"";s:15:"company_showmap";i:1;s:14:"company_mapurl";s:326:"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2634.116366996857!2d105.79399620326203!3d20.9844946314258!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac93055e2f2f%3A0x91f4b423089193dd!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gUGjDoXQgdHJp4buDbiBOZ3Xhu5NuIG3hu58gVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1558315703646!5m2!1svi!2s";s:13:"company_phone";s:58:"+84-24-85872007[+842485872007]|+84-904762534[+84904762534]";s:11:"company_fax";s:15:"+84-24-35500914";s:13:"company_email";s:18:"contact@vinades.vn";s:15:"company_website";s:17:"http://vinades.vn";}'),
(18, 'default', 'menu', 'global.bootstrap.php', 'Menu Site', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:6:"menuid";i:1;s:12:"title_length";i:0;}'),
(19, 'default', 'contact', 'global.contact_default.php', 'Contact Default', '', 'no_title', '[CONTACT_DEFAULT]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(20, 'default', 'theme', 'global.social.php', 'Social icon', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:3:{s:8:"facebook";s:32:"http://www.facebook.com/nukeviet";s:7:"youtube";s:37:"https://www.youtube.com/user/nukeviet";s:7:"twitter";s:28:"https://twitter.com/nukeviet";}'),
(21, 'default', 'theme', 'global.menu_footer.php', 'Các chuyên mục chính', '', 'simple', '[MENU_FOOTER]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:1:{s:14:"module_in_menu";a:8:{i:0;s:5:"about";i:1;s:4:"news";i:2;s:5:"users";i:3;s:7:"contact";i:4;s:6:"voting";i:5;s:7:"banners";i:6;s:4:"seek";i:7;s:5:"feeds";}}'),
(22, 'default', 'freecontent', 'global.free_content.php', 'Sản phẩm', '', 'no_title', '[FEATURED_PRODUCT]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:7:"blockid";i:1;s:7:"numrows";i:2;}'),
(23, 'mobile_default', 'menu', 'global.metismenu.php', 'Menu Site', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:6:"menuid";i:1;s:12:"title_length";i:0;}'),
(24, 'mobile_default', 'push', 'global.push.php', 'Thông báo đẩy', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(25, 'mobile_default', 'users', 'global.user_button.php', 'Sign In', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 3, ''),
(26, 'mobile_default', 'contact', 'global.contact_default.php', 'Contact Default', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 1, ''),
(27, 'mobile_default', 'contact', 'global.contact_form.php', 'Feedback', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 2, ''),
(28, 'mobile_default', 'theme', 'global.social.php', 'Social icon', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 3, 'a:3:{s:8:"facebook";s:32:"http://www.facebook.com/nukeviet";s:7:"youtube";s:37:"https://www.youtube.com/user/nukeviet";s:7:"twitter";s:28:"https://twitter.com/nukeviet";}'),
(29, 'mobile_default', 'theme', 'global.QR_code.php', 'QR code', '', 'no_title', '[SOCIAL_ICONS]', 'regular', '[]', '1', 1, '6', 1, 4, ''),
(30, 'mobile_default', 'theme', 'global.copyright.php', 'Copyright', '', 'no_title', '[FOOTER_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:5:{s:12:"copyright_by";s:0:"";s:13:"copyright_url";s:0:"";s:9:"design_by";s:12:"VINADES.,JSC";s:10:"design_url";s:18:"http://vinades.vn/";s:13:"siteterms_url";s:39:"/index.php?language=vi&amp;nv=siteterms";}'),
(31, 'mobile_default', 'theme', 'global.menu_footer.php', 'Các chuyên mục chính', '', 'primary', '[MENU_FOOTER]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:1:{s:14:"module_in_menu";a:9:{i:0;s:5:"about";i:1;s:4:"news";i:2;s:5:"users";i:3;s:7:"contact";i:4;s:6:"voting";i:5;s:7:"banners";i:6;s:4:"seek";i:7;s:5:"feeds";i:8;s:9:"siteterms";}}'),
(32, 'mobile_default', 'theme', 'global.company_info.php', 'Công ty chủ quản', '', 'primary', '[COMPANY_INFO]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:13:{s:12:"company_name";s:58:"Công ty cổ phần phát triển nguồn mở Việt Nam";s:15:"company_address";s:72:"Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội";s:16:"company_sortname";s:12:"VINADES.,JSC";s:15:"company_regcode";s:0:"";s:16:"company_regplace";s:0:"";s:21:"company_licensenumber";s:0:"";s:22:"company_responsibility";s:0:"";s:15:"company_showmap";i:1;s:14:"company_mapurl";s:326:"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2634.116366996857!2d105.79399620326203!3d20.9844946314258!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ac93055e2f2f%3A0x91f4b423089193dd!2zQ8O0bmcgdHkgQ-G7lSBwaOG6p24gUGjDoXQgdHJp4buDbiBOZ3Xhu5NuIG3hu58gVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1558315703646!5m2!1svi!2s";s:13:"company_phone";s:58:"+84-24-85872007[+842485872007]|+84-904762534[+84904762534]";s:11:"company_fax";s:15:"+84-24-35500914";s:13:"company_email";s:18:"contact@vinades.vn";s:15:"company_website";s:17:"http://vinades.vn";}'),
(34, 'licavali', 'menu', 'global.metismenu.php', 'global metismenu', '', 'no_title', '[MENU_SITE]', 'regular', '[]', '1', 1, '6', 1, 1, 'a:2:{s:6:"menuid";i:2;s:12:"title_length";i:0;}');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_blocks_weight`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_blocks_weight` (
  `bid` mediumint(8) NOT NULL DEFAULT '0',
  `func_id` mediumint(8) NOT NULL DEFAULT '0',
  `weight` mediumint(8) NOT NULL DEFAULT '0',
  UNIQUE KEY `bid` (`bid`,`func_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_blocks_weight`
--

INSERT INTO `hn4_vi_blocks_weight` (`bid`, `func_id`, `weight`) VALUES
(1, 4, 1),
(3, 4, 1),
(3, 5, 1),
(3, 6, 1),
(3, 7, 1),
(3, 8, 1),
(3, 9, 1),
(3, 10, 1),
(3, 11, 1),
(3, 12, 1),
(4, 20, 1),
(4, 21, 1),
(4, 22, 1),
(4, 23, 1),
(4, 24, 1),
(4, 25, 1),
(4, 26, 1),
(4, 27, 1),
(4, 28, 1),
(4, 29, 1),
(4, 30, 1),
(4, 35, 1),
(4, 36, 1),
(4, 37, 1),
(4, 38, 1),
(4, 39, 1),
(4, 40, 1),
(4, 41, 1),
(36, 69, 1),
(36, 70, 1),
(36, 76, 1),
(36, 93, 1),
(36, 83, 1),
(36, 95, 1),
(36, 97, 1),
(36, 73, 1),
(36, 90, 1),
(36, 77, 1),
(36, 78, 1),
(36, 82, 1),
(36, 81, 1),
(36, 71, 1),
(36, 89, 1),
(36, 75, 1),
(36, 96, 1),
(36, 80, 1),
(36, 68, 1),
(36, 67, 1),
(36, 66, 1),
(36, 64, 1),
(36, 63, 1),
(36, 62, 1),
(36, 61, 1),
(36, 60, 1),
(36, 59, 1),
(36, 58, 1),
(36, 55, 1),
(36, 54, 1),
(36, 52, 1),
(36, 46, 1),
(6, 1, 2),
(6, 2, 2),
(6, 3, 2),
(6, 4, 3),
(6, 5, 3),
(6, 6, 3),
(6, 7, 3),
(6, 8, 3),
(6, 9, 3),
(6, 10, 3),
(6, 11, 3),
(6, 12, 3),
(6, 13, 2),
(6, 14, 2),
(6, 15, 2),
(6, 16, 2),
(6, 17, 2),
(6, 18, 2),
(6, 19, 2),
(6, 20, 3),
(6, 21, 3),
(6, 22, 3),
(6, 23, 3),
(6, 24, 3),
(6, 25, 3),
(6, 26, 3),
(6, 27, 3),
(6, 28, 3),
(6, 29, 3),
(6, 30, 3),
(6, 31, 2),
(6, 32, 2),
(6, 33, 2),
(6, 34, 2),
(6, 35, 3),
(6, 36, 3),
(6, 37, 3),
(6, 38, 3),
(6, 39, 3),
(6, 40, 3),
(6, 41, 3),
(6, 42, 2),
(6, 43, 2),
(6, 44, 2),
(6, 45, 2),
(6, 46, 2),
(6, 47, 2),
(6, 48, 2),
(6, 49, 2),
(6, 50, 2),
(6, 51, 2),
(6, 52, 2),
(6, 53, 2),
(6, 54, 2),
(6, 55, 2),
(6, 56, 2),
(6, 57, 2),
(6, 58, 2),
(6, 59, 2),
(6, 60, 2),
(6, 61, 2),
(6, 62, 2),
(6, 63, 2),
(6, 64, 2),
(6, 65, 2),
(6, 66, 2),
(6, 67, 2),
(6, 68, 2),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 4, 1),
(7, 5, 1),
(7, 6, 1),
(7, 7, 1),
(7, 8, 1),
(7, 9, 1),
(7, 10, 1),
(7, 11, 1),
(7, 12, 1),
(7, 13, 1),
(7, 14, 1),
(7, 15, 1),
(7, 16, 1),
(7, 17, 1),
(7, 18, 1),
(7, 19, 1),
(7, 20, 1),
(7, 21, 1),
(7, 22, 1),
(7, 23, 1),
(7, 24, 1),
(7, 25, 1),
(7, 26, 1),
(7, 27, 1),
(7, 28, 1),
(7, 29, 1),
(7, 30, 1),
(7, 31, 1),
(7, 32, 1),
(7, 33, 1),
(7, 34, 1),
(7, 35, 1),
(7, 36, 1),
(7, 37, 1),
(7, 38, 1),
(7, 39, 1),
(7, 40, 1),
(7, 41, 1),
(7, 42, 1),
(7, 43, 1),
(7, 44, 1),
(7, 45, 1),
(7, 46, 1),
(7, 47, 1),
(7, 48, 1),
(7, 49, 1),
(7, 50, 1),
(7, 51, 1),
(7, 52, 1),
(7, 53, 1),
(7, 54, 1),
(7, 55, 1),
(7, 56, 1),
(7, 57, 1),
(7, 58, 1),
(7, 59, 1),
(7, 60, 1),
(7, 61, 1),
(7, 62, 1),
(7, 63, 1),
(7, 64, 1),
(7, 65, 1),
(7, 66, 1),
(7, 67, 1),
(7, 68, 1),
(36, 26, 1),
(36, 25, 1),
(36, 24, 1),
(36, 23, 1),
(36, 22, 1),
(36, 21, 1),
(36, 20, 1),
(36, 13, 1),
(36, 12, 1),
(36, 11, 1),
(36, 10, 1),
(36, 9, 1),
(36, 8, 1),
(36, 7, 1),
(36, 6, 1),
(36, 5, 1),
(36, 4, 1),
(36, 1, 1),
(35, 69, 1),
(35, 70, 1),
(35, 76, 1),
(35, 93, 1),
(35, 83, 1),
(35, 95, 1),
(35, 97, 1),
(35, 73, 1),
(35, 90, 1),
(35, 77, 1),
(35, 78, 1),
(35, 82, 1),
(35, 81, 1),
(35, 71, 1),
(35, 89, 1),
(35, 75, 1),
(35, 96, 1),
(35, 80, 1),
(35, 68, 1),
(35, 67, 1),
(35, 66, 1),
(35, 64, 1),
(35, 63, 1),
(35, 62, 1),
(35, 61, 1),
(35, 60, 1),
(35, 59, 1),
(35, 58, 1),
(35, 55, 1),
(35, 54, 1),
(35, 52, 1),
(35, 46, 1),
(35, 45, 1),
(35, 44, 1),
(35, 43, 1),
(35, 42, 1),
(35, 41, 1),
(35, 40, 1),
(35, 39, 1),
(35, 38, 1),
(35, 37, 1),
(35, 36, 1),
(35, 35, 1),
(35, 34, 1),
(35, 33, 1),
(35, 32, 1),
(35, 30, 1),
(35, 29, 1),
(35, 28, 1),
(35, 27, 1),
(9, 1, 3),
(9, 2, 3),
(9, 3, 3),
(9, 4, 3),
(9, 5, 3),
(9, 6, 3),
(9, 7, 3),
(9, 8, 3),
(9, 9, 3),
(9, 10, 3),
(9, 11, 3),
(9, 12, 3),
(9, 13, 3),
(9, 14, 3),
(9, 15, 3),
(9, 16, 3),
(9, 17, 3),
(9, 18, 3),
(9, 19, 3),
(9, 20, 3),
(9, 21, 3),
(9, 22, 3),
(9, 23, 3),
(9, 24, 3),
(9, 25, 3),
(9, 26, 3),
(9, 27, 3),
(9, 28, 3),
(9, 29, 3),
(9, 30, 3),
(9, 31, 3),
(9, 32, 3),
(9, 33, 3),
(9, 34, 3),
(9, 35, 3),
(9, 36, 3),
(9, 37, 3),
(9, 38, 3),
(9, 39, 3),
(9, 40, 3),
(9, 41, 3),
(9, 42, 3),
(9, 43, 3),
(9, 44, 3),
(9, 45, 3),
(9, 46, 3),
(9, 47, 3),
(9, 48, 3),
(9, 49, 3),
(9, 50, 3),
(9, 51, 3),
(9, 52, 3),
(9, 53, 3),
(9, 54, 3),
(9, 55, 3),
(9, 56, 3),
(9, 57, 3),
(9, 58, 3),
(9, 59, 3),
(9, 60, 3),
(9, 61, 3),
(9, 62, 3),
(9, 63, 3),
(9, 64, 3),
(9, 65, 3),
(9, 66, 3),
(9, 67, 3),
(9, 68, 3),
(10, 1, 4),
(10, 2, 4),
(10, 3, 4),
(10, 4, 4),
(10, 5, 4),
(10, 6, 4),
(10, 7, 4),
(10, 8, 4),
(10, 9, 4),
(10, 10, 4),
(10, 11, 4),
(10, 12, 4),
(10, 13, 4),
(10, 14, 4),
(10, 15, 4),
(10, 16, 4),
(10, 17, 4),
(10, 18, 4),
(10, 19, 4),
(10, 20, 4),
(10, 21, 4),
(10, 22, 4),
(10, 23, 4),
(10, 24, 4),
(10, 25, 4),
(10, 26, 4),
(10, 27, 4),
(10, 28, 4),
(10, 29, 4),
(10, 30, 4),
(10, 31, 4),
(10, 32, 4),
(10, 33, 4),
(10, 34, 4),
(10, 35, 4),
(10, 36, 4),
(10, 37, 4),
(10, 38, 4),
(10, 39, 4),
(10, 40, 4),
(10, 41, 4),
(10, 42, 4),
(10, 43, 4),
(10, 44, 4),
(10, 45, 4),
(10, 46, 4),
(10, 47, 4),
(10, 48, 4),
(10, 49, 4),
(10, 50, 4),
(10, 51, 4),
(10, 52, 4),
(10, 53, 4),
(10, 54, 4),
(10, 55, 4),
(10, 56, 4),
(10, 57, 4),
(10, 58, 4),
(10, 59, 4),
(10, 60, 4),
(10, 61, 4),
(10, 62, 4),
(10, 63, 4),
(10, 64, 4),
(10, 65, 4),
(10, 66, 4),
(10, 67, 4),
(10, 68, 4),
(11, 1, 1),
(11, 2, 1),
(11, 3, 1),
(11, 4, 1),
(11, 5, 1),
(11, 6, 1),
(11, 7, 1),
(11, 8, 1),
(11, 9, 1),
(11, 10, 1),
(11, 11, 1),
(11, 12, 1),
(11, 13, 1),
(11, 14, 1),
(11, 15, 1),
(11, 16, 1),
(11, 17, 1),
(11, 18, 1),
(11, 19, 1),
(11, 20, 1),
(11, 21, 1),
(11, 22, 1),
(11, 23, 1),
(11, 24, 1),
(11, 25, 1),
(11, 26, 1),
(11, 27, 1),
(11, 28, 1),
(11, 29, 1),
(11, 30, 1),
(11, 31, 1),
(11, 32, 1),
(11, 33, 1),
(11, 34, 1),
(11, 35, 1),
(11, 36, 1),
(11, 37, 1),
(11, 38, 1),
(11, 39, 1),
(11, 40, 1),
(11, 41, 1),
(11, 42, 1),
(11, 43, 1),
(11, 44, 1),
(11, 45, 1),
(11, 46, 1),
(11, 47, 1),
(11, 48, 1),
(11, 49, 1),
(11, 50, 1),
(11, 51, 1),
(11, 52, 1),
(11, 53, 1),
(11, 54, 1),
(11, 55, 1),
(11, 56, 1),
(11, 57, 1),
(11, 58, 1),
(11, 59, 1),
(11, 60, 1),
(11, 61, 1),
(11, 62, 1),
(11, 63, 1),
(11, 64, 1),
(11, 65, 1),
(11, 66, 1),
(11, 67, 1),
(11, 68, 1),
(12, 1, 2),
(12, 2, 2),
(12, 3, 2),
(12, 4, 2),
(12, 5, 2),
(12, 6, 2),
(12, 7, 2),
(12, 8, 2),
(12, 9, 2),
(12, 10, 2),
(12, 11, 2),
(12, 12, 2),
(12, 13, 2),
(12, 14, 2),
(12, 15, 2),
(12, 16, 2),
(12, 17, 2),
(12, 18, 2),
(12, 19, 2),
(12, 20, 2),
(12, 21, 2),
(12, 22, 2),
(12, 23, 2),
(12, 24, 2),
(12, 25, 2),
(12, 26, 2),
(12, 27, 2),
(12, 28, 2),
(12, 29, 2),
(12, 30, 2),
(12, 31, 2),
(12, 32, 2),
(12, 33, 2),
(12, 34, 2),
(12, 35, 2),
(12, 36, 2),
(12, 37, 2),
(12, 38, 2),
(12, 39, 2),
(12, 40, 2),
(12, 41, 2),
(12, 42, 2),
(12, 43, 2),
(12, 44, 2),
(12, 45, 2),
(12, 46, 2),
(12, 47, 2),
(12, 48, 2),
(12, 49, 2),
(12, 50, 2),
(12, 51, 2),
(12, 52, 2),
(12, 53, 2),
(12, 54, 2),
(12, 55, 2),
(12, 56, 2),
(12, 57, 2),
(12, 58, 2),
(12, 59, 2),
(12, 60, 2),
(12, 61, 2),
(12, 62, 2),
(12, 63, 2),
(12, 64, 2),
(12, 65, 2),
(12, 66, 2),
(12, 67, 2),
(12, 68, 2),
(13, 1, 1),
(13, 2, 1),
(13, 3, 1),
(13, 4, 1),
(13, 5, 1),
(13, 6, 1),
(13, 7, 1),
(13, 8, 1),
(13, 9, 1),
(13, 10, 1),
(13, 11, 1),
(13, 12, 1),
(13, 13, 1),
(13, 14, 1),
(13, 15, 1),
(13, 16, 1),
(13, 17, 1),
(13, 18, 1),
(13, 19, 1),
(13, 20, 1),
(13, 21, 1),
(13, 22, 1),
(13, 23, 1),
(13, 24, 1),
(13, 25, 1),
(13, 26, 1),
(13, 27, 1),
(13, 28, 1),
(13, 29, 1),
(13, 30, 1),
(13, 31, 1),
(13, 32, 1),
(13, 33, 1),
(13, 34, 1),
(13, 35, 1),
(13, 36, 1),
(13, 37, 1),
(13, 38, 1),
(13, 39, 1),
(13, 40, 1),
(13, 41, 1),
(13, 42, 1),
(13, 43, 1),
(13, 44, 1),
(13, 45, 1),
(13, 46, 1),
(13, 47, 1),
(13, 48, 1),
(13, 49, 1),
(13, 50, 1),
(13, 51, 1),
(13, 52, 1),
(13, 53, 1),
(13, 54, 1),
(13, 55, 1),
(13, 56, 1),
(13, 57, 1),
(13, 58, 1),
(13, 59, 1),
(13, 60, 1),
(13, 61, 1),
(13, 62, 1),
(13, 63, 1),
(13, 64, 1),
(13, 65, 1),
(13, 66, 1),
(13, 67, 1),
(13, 68, 1),
(14, 1, 2),
(14, 2, 2),
(14, 3, 2),
(14, 4, 2),
(14, 5, 2),
(14, 6, 2),
(14, 7, 2),
(14, 8, 2),
(14, 9, 2),
(14, 10, 2),
(14, 11, 2),
(14, 12, 2),
(14, 13, 2),
(14, 14, 2),
(14, 15, 2),
(14, 16, 2),
(14, 17, 2),
(14, 18, 2),
(14, 19, 2),
(14, 20, 2),
(14, 21, 2),
(14, 22, 2),
(14, 23, 2),
(14, 24, 2),
(14, 25, 2),
(14, 26, 2),
(14, 27, 2),
(14, 28, 2),
(14, 29, 2),
(14, 30, 2),
(14, 31, 2),
(14, 32, 2),
(14, 33, 2),
(14, 34, 2),
(14, 35, 2),
(14, 36, 2),
(14, 37, 2),
(14, 38, 2),
(14, 39, 2),
(14, 40, 2),
(14, 41, 2),
(14, 42, 2),
(14, 43, 2),
(14, 44, 2),
(14, 45, 2),
(14, 46, 2),
(14, 47, 2),
(14, 48, 2),
(14, 49, 2),
(14, 50, 2),
(14, 51, 2),
(14, 52, 2),
(14, 53, 2),
(14, 54, 2),
(14, 55, 2),
(14, 56, 2),
(14, 57, 2),
(14, 58, 2),
(14, 59, 2),
(14, 60, 2),
(14, 61, 2),
(14, 62, 2),
(14, 63, 2),
(14, 64, 2),
(14, 65, 2),
(14, 66, 2),
(14, 67, 2),
(14, 68, 2),
(15, 1, 1),
(15, 2, 1),
(15, 3, 1),
(15, 4, 1),
(15, 5, 1),
(15, 6, 1),
(15, 7, 1),
(15, 8, 1),
(15, 9, 1),
(15, 10, 1),
(15, 11, 1),
(15, 12, 1),
(15, 13, 1),
(15, 14, 1),
(15, 15, 1),
(15, 16, 1),
(15, 17, 1),
(15, 18, 1),
(15, 19, 1),
(15, 20, 1),
(15, 21, 1),
(15, 22, 1),
(15, 23, 1),
(15, 24, 1),
(15, 25, 1),
(15, 26, 1),
(15, 27, 1),
(15, 28, 1),
(15, 29, 1),
(15, 30, 1),
(15, 31, 1),
(15, 32, 1),
(15, 33, 1),
(15, 34, 1),
(15, 35, 1),
(15, 36, 1),
(15, 37, 1),
(15, 38, 1),
(15, 39, 1),
(15, 40, 1),
(15, 41, 1),
(15, 42, 1),
(15, 43, 1),
(15, 44, 1),
(15, 45, 1),
(15, 46, 1),
(15, 47, 1),
(15, 48, 1),
(15, 49, 1),
(15, 50, 1),
(15, 51, 1),
(15, 52, 1),
(15, 53, 1),
(15, 54, 1),
(15, 55, 1),
(15, 56, 1),
(15, 57, 1),
(15, 58, 1),
(15, 59, 1),
(15, 60, 1),
(15, 61, 1),
(15, 62, 1),
(15, 63, 1),
(15, 64, 1),
(15, 65, 1),
(15, 66, 1),
(15, 67, 1),
(15, 68, 1),
(16, 1, 2),
(16, 2, 2),
(16, 3, 2),
(16, 4, 2),
(16, 5, 2),
(16, 6, 2),
(16, 7, 2),
(16, 8, 2),
(16, 9, 2),
(16, 10, 2),
(16, 11, 2),
(16, 12, 2),
(16, 13, 2),
(16, 14, 2),
(16, 15, 2),
(16, 16, 2),
(16, 17, 2),
(16, 18, 2),
(16, 19, 2),
(16, 20, 2),
(16, 21, 2),
(16, 22, 2),
(16, 23, 2),
(16, 24, 2),
(16, 25, 2),
(16, 26, 2),
(16, 27, 2),
(16, 28, 2),
(16, 29, 2),
(16, 30, 2),
(16, 31, 2),
(16, 32, 2),
(16, 33, 2),
(16, 34, 2),
(16, 35, 2),
(16, 36, 2),
(16, 37, 2),
(16, 38, 2),
(16, 39, 2),
(16, 40, 2),
(16, 41, 2),
(16, 42, 2),
(16, 43, 2),
(16, 44, 2),
(16, 45, 2),
(16, 46, 2),
(16, 47, 2),
(16, 48, 2),
(16, 49, 2),
(16, 50, 2),
(16, 51, 2),
(16, 52, 2),
(16, 53, 2),
(16, 54, 2),
(16, 55, 2),
(16, 56, 2),
(16, 57, 2),
(16, 58, 2),
(16, 59, 2),
(16, 60, 2),
(16, 61, 2),
(16, 62, 2),
(16, 63, 2),
(16, 64, 2),
(16, 65, 2),
(16, 66, 2),
(16, 67, 2),
(16, 68, 2),
(17, 1, 1),
(17, 2, 1),
(17, 3, 1),
(17, 4, 1),
(17, 5, 1),
(17, 6, 1),
(17, 7, 1),
(17, 8, 1),
(17, 9, 1),
(17, 10, 1),
(17, 11, 1),
(17, 12, 1),
(17, 13, 1),
(17, 14, 1),
(17, 15, 1),
(17, 16, 1),
(17, 17, 1),
(17, 18, 1),
(17, 19, 1),
(17, 20, 1),
(17, 21, 1),
(17, 22, 1),
(17, 23, 1),
(17, 24, 1),
(17, 25, 1),
(17, 26, 1),
(17, 27, 1),
(17, 28, 1),
(17, 29, 1),
(17, 30, 1),
(17, 31, 1),
(17, 32, 1),
(17, 33, 1),
(17, 34, 1),
(17, 35, 1),
(17, 36, 1),
(17, 37, 1),
(17, 38, 1),
(17, 39, 1),
(17, 40, 1),
(17, 41, 1),
(17, 42, 1),
(17, 43, 1),
(17, 44, 1),
(17, 45, 1),
(17, 46, 1),
(17, 47, 1),
(17, 48, 1),
(17, 49, 1),
(17, 50, 1),
(17, 51, 1),
(17, 52, 1),
(17, 53, 1),
(17, 54, 1),
(17, 55, 1),
(17, 56, 1),
(17, 57, 1),
(17, 58, 1),
(17, 59, 1),
(17, 60, 1),
(17, 61, 1),
(17, 62, 1),
(17, 63, 1),
(17, 64, 1),
(17, 65, 1),
(17, 66, 1),
(17, 67, 1),
(17, 68, 1),
(18, 1, 1),
(18, 2, 1),
(18, 3, 1),
(18, 4, 1),
(18, 5, 1),
(18, 6, 1),
(18, 7, 1),
(18, 8, 1),
(18, 9, 1),
(18, 10, 1),
(18, 11, 1),
(18, 12, 1),
(18, 13, 1),
(18, 14, 1),
(18, 15, 1),
(18, 16, 1),
(18, 17, 1),
(18, 18, 1),
(18, 19, 1),
(18, 20, 1),
(18, 21, 1),
(18, 22, 1),
(18, 23, 1),
(18, 24, 1),
(18, 25, 1),
(18, 26, 1),
(18, 27, 1),
(18, 28, 1),
(18, 29, 1),
(18, 30, 1),
(18, 31, 1),
(18, 32, 1),
(18, 33, 1),
(18, 34, 1),
(18, 35, 1),
(18, 36, 1),
(18, 37, 1),
(18, 38, 1),
(18, 39, 1),
(18, 40, 1),
(18, 41, 1),
(18, 42, 1),
(18, 43, 1),
(18, 44, 1),
(18, 45, 1),
(18, 46, 1),
(18, 47, 1),
(18, 48, 1),
(18, 49, 1),
(18, 50, 1),
(18, 51, 1),
(18, 52, 1),
(18, 53, 1),
(18, 54, 1),
(18, 55, 1),
(18, 56, 1),
(18, 57, 1),
(18, 58, 1),
(18, 59, 1),
(18, 60, 1),
(18, 61, 1),
(18, 62, 1),
(18, 63, 1),
(18, 64, 1),
(18, 65, 1),
(18, 66, 1),
(18, 67, 1),
(18, 68, 1),
(19, 1, 1),
(19, 2, 1),
(19, 3, 1),
(19, 4, 1),
(19, 5, 1),
(19, 6, 1),
(19, 7, 1),
(19, 8, 1),
(19, 9, 1),
(19, 10, 1),
(19, 11, 1),
(19, 12, 1),
(19, 13, 1),
(19, 14, 1),
(19, 15, 1),
(19, 16, 1),
(19, 17, 1),
(19, 18, 1),
(19, 19, 1),
(19, 20, 1),
(19, 21, 1),
(19, 22, 1),
(19, 23, 1),
(19, 24, 1),
(19, 25, 1),
(19, 26, 1),
(19, 27, 1),
(19, 28, 1),
(19, 29, 1),
(19, 30, 1),
(19, 31, 1),
(19, 32, 1),
(19, 33, 1),
(19, 34, 1),
(19, 35, 1),
(19, 36, 1),
(19, 37, 1),
(19, 38, 1),
(19, 39, 1),
(19, 40, 1),
(19, 41, 1),
(19, 42, 1),
(19, 43, 1),
(19, 44, 1),
(19, 45, 1),
(19, 46, 1),
(19, 47, 1),
(19, 48, 1),
(19, 49, 1),
(19, 50, 1),
(19, 51, 1),
(19, 52, 1),
(19, 53, 1),
(19, 54, 1),
(19, 55, 1),
(19, 56, 1),
(19, 57, 1),
(19, 58, 1),
(19, 59, 1),
(19, 60, 1),
(19, 61, 1),
(19, 62, 1),
(19, 63, 1),
(19, 64, 1),
(19, 65, 1),
(19, 66, 1),
(19, 67, 1),
(19, 68, 1),
(20, 1, 1),
(20, 2, 1),
(20, 3, 1),
(20, 4, 1),
(20, 5, 1),
(20, 6, 1),
(20, 7, 1),
(20, 8, 1),
(20, 9, 1),
(20, 10, 1),
(20, 11, 1),
(20, 12, 1),
(20, 13, 1),
(20, 14, 1),
(20, 15, 1),
(20, 16, 1),
(20, 17, 1),
(20, 18, 1),
(20, 19, 1),
(20, 20, 1),
(20, 21, 1),
(20, 22, 1),
(20, 23, 1),
(20, 24, 1),
(20, 25, 1),
(20, 26, 1),
(20, 27, 1),
(20, 28, 1),
(20, 29, 1),
(20, 30, 1),
(20, 31, 1),
(20, 32, 1),
(20, 33, 1),
(20, 34, 1),
(20, 35, 1),
(20, 36, 1),
(20, 37, 1),
(20, 38, 1),
(20, 39, 1),
(20, 40, 1),
(20, 41, 1),
(20, 42, 1),
(20, 43, 1),
(20, 44, 1),
(20, 45, 1),
(20, 46, 1),
(20, 47, 1),
(20, 48, 1),
(20, 49, 1),
(20, 50, 1),
(20, 51, 1),
(20, 52, 1),
(20, 53, 1),
(20, 54, 1),
(20, 55, 1),
(20, 56, 1),
(20, 57, 1),
(20, 58, 1),
(20, 59, 1),
(20, 60, 1),
(20, 61, 1),
(20, 62, 1),
(20, 63, 1),
(20, 64, 1),
(20, 65, 1),
(20, 66, 1),
(20, 67, 1),
(20, 68, 1),
(21, 1, 1),
(21, 2, 1),
(21, 3, 1),
(21, 4, 1),
(21, 5, 1),
(21, 6, 1),
(21, 7, 1),
(21, 8, 1),
(21, 9, 1),
(21, 10, 1),
(21, 11, 1),
(21, 12, 1),
(21, 13, 1),
(21, 14, 1),
(21, 15, 1),
(21, 16, 1),
(21, 17, 1),
(21, 18, 1),
(21, 19, 1),
(21, 20, 1),
(21, 21, 1),
(21, 22, 1),
(21, 23, 1),
(21, 24, 1),
(21, 25, 1),
(21, 26, 1),
(21, 27, 1),
(21, 28, 1),
(21, 29, 1),
(21, 30, 1),
(21, 31, 1),
(21, 32, 1),
(21, 33, 1),
(21, 34, 1),
(21, 35, 1),
(21, 36, 1),
(21, 37, 1),
(21, 38, 1),
(21, 39, 1),
(21, 40, 1),
(21, 41, 1),
(21, 42, 1),
(21, 43, 1),
(21, 44, 1),
(21, 45, 1),
(21, 46, 1),
(21, 47, 1),
(21, 48, 1),
(21, 49, 1),
(21, 50, 1),
(21, 51, 1),
(21, 52, 1),
(21, 53, 1),
(21, 54, 1),
(21, 55, 1),
(21, 56, 1),
(21, 57, 1),
(21, 58, 1),
(21, 59, 1),
(21, 60, 1),
(21, 61, 1),
(21, 62, 1),
(21, 63, 1),
(21, 64, 1),
(21, 65, 1),
(21, 66, 1),
(21, 67, 1),
(21, 68, 1),
(22, 1, 1),
(22, 2, 1),
(22, 3, 1),
(22, 4, 1),
(22, 5, 1),
(22, 6, 1),
(22, 7, 1),
(22, 8, 1),
(22, 9, 1),
(22, 10, 1),
(22, 11, 1),
(22, 12, 1),
(22, 13, 1),
(22, 14, 1),
(22, 15, 1),
(22, 16, 1),
(22, 17, 1),
(22, 18, 1),
(22, 19, 1),
(22, 20, 1),
(22, 21, 1),
(22, 22, 1),
(22, 23, 1),
(22, 24, 1),
(22, 25, 1),
(22, 26, 1),
(22, 27, 1),
(22, 28, 1),
(22, 29, 1),
(22, 30, 1),
(22, 31, 1),
(22, 32, 1),
(22, 33, 1),
(22, 34, 1),
(22, 35, 1),
(22, 36, 1),
(22, 37, 1),
(22, 38, 1),
(22, 39, 1),
(22, 40, 1),
(22, 41, 1),
(22, 42, 1),
(22, 43, 1),
(22, 44, 1),
(22, 45, 1),
(22, 46, 1),
(22, 47, 1),
(22, 48, 1),
(22, 49, 1),
(22, 50, 1),
(22, 51, 1),
(22, 52, 1),
(22, 53, 1),
(22, 54, 1),
(22, 55, 1),
(22, 56, 1),
(22, 57, 1),
(22, 58, 1),
(22, 59, 1),
(22, 60, 1),
(22, 61, 1),
(22, 62, 1),
(22, 63, 1),
(22, 64, 1),
(22, 65, 1),
(22, 66, 1),
(22, 67, 1),
(22, 68, 1),
(23, 1, 1),
(23, 2, 1),
(23, 3, 1),
(23, 4, 1),
(23, 5, 1),
(23, 6, 1),
(23, 7, 1),
(23, 8, 1),
(23, 9, 1),
(23, 10, 1),
(23, 11, 1),
(23, 12, 1),
(23, 13, 1),
(23, 14, 1),
(23, 15, 1),
(23, 16, 1),
(23, 17, 1),
(23, 18, 1),
(23, 19, 1),
(23, 20, 1),
(23, 21, 1),
(23, 22, 1),
(23, 23, 1),
(23, 24, 1),
(23, 25, 1),
(23, 26, 1),
(23, 27, 1),
(23, 28, 1),
(23, 29, 1),
(23, 30, 1),
(23, 31, 1),
(23, 32, 1),
(23, 33, 1),
(23, 34, 1),
(23, 35, 1),
(23, 36, 1),
(23, 37, 1),
(23, 38, 1),
(23, 39, 1),
(23, 40, 1),
(23, 41, 1),
(23, 42, 1),
(23, 43, 1),
(23, 44, 1),
(23, 45, 1),
(23, 46, 1),
(23, 47, 1),
(23, 48, 1),
(23, 49, 1),
(23, 50, 1),
(23, 51, 1),
(23, 52, 1),
(23, 53, 1),
(23, 54, 1),
(23, 55, 1),
(23, 56, 1),
(23, 57, 1),
(23, 58, 1),
(23, 59, 1),
(23, 60, 1),
(23, 61, 1),
(23, 62, 1),
(23, 63, 1),
(23, 64, 1),
(23, 65, 1),
(23, 66, 1),
(23, 67, 1),
(23, 68, 1),
(24, 1, 2),
(24, 2, 2),
(24, 3, 2),
(24, 4, 2),
(24, 5, 2),
(24, 6, 2),
(24, 7, 2),
(24, 8, 2),
(24, 9, 2),
(24, 10, 2),
(24, 11, 2),
(24, 12, 2),
(24, 13, 2),
(24, 14, 2),
(24, 15, 2),
(24, 16, 2),
(24, 17, 2),
(24, 18, 2),
(24, 19, 2),
(24, 20, 2),
(24, 21, 2),
(24, 22, 2),
(24, 23, 2),
(24, 24, 2),
(24, 25, 2),
(24, 26, 2),
(24, 27, 2),
(24, 28, 2),
(24, 29, 2),
(24, 30, 2),
(24, 31, 2),
(24, 32, 2),
(24, 33, 2),
(24, 34, 2),
(24, 35, 2),
(24, 36, 2),
(24, 37, 2),
(24, 38, 2),
(24, 39, 2),
(24, 40, 2),
(24, 41, 2),
(24, 42, 2),
(24, 43, 2),
(24, 44, 2),
(24, 45, 2),
(24, 46, 2),
(24, 47, 2),
(24, 48, 2),
(24, 49, 2),
(24, 50, 2),
(24, 51, 2),
(24, 52, 2),
(24, 53, 2),
(24, 54, 2),
(24, 55, 2),
(24, 56, 2),
(24, 57, 2),
(24, 58, 2),
(24, 59, 2),
(24, 60, 2),
(24, 61, 2),
(24, 62, 2),
(24, 63, 2),
(24, 64, 2),
(24, 65, 2),
(24, 66, 2),
(24, 67, 2),
(24, 68, 2),
(25, 1, 3),
(25, 2, 3),
(25, 3, 3),
(25, 4, 3),
(25, 5, 3),
(25, 6, 3),
(25, 7, 3),
(25, 8, 3),
(25, 9, 3),
(25, 10, 3),
(25, 11, 3),
(25, 12, 3),
(25, 13, 3),
(25, 14, 3),
(25, 15, 3),
(25, 16, 3),
(25, 17, 3),
(25, 18, 3),
(25, 19, 3),
(25, 20, 3),
(25, 21, 3),
(25, 22, 3),
(25, 23, 3),
(25, 24, 3),
(25, 25, 3),
(25, 26, 3),
(25, 27, 3),
(25, 28, 3),
(25, 29, 3),
(25, 30, 3),
(25, 31, 3),
(25, 32, 3),
(25, 33, 3),
(25, 34, 3),
(25, 35, 3),
(25, 36, 3),
(25, 37, 3),
(25, 38, 3),
(25, 39, 3),
(25, 40, 3),
(25, 41, 3),
(25, 42, 3),
(25, 43, 3),
(25, 44, 3),
(25, 45, 3),
(25, 46, 3),
(25, 47, 3),
(25, 48, 3),
(25, 49, 3),
(25, 50, 3),
(25, 51, 3),
(25, 52, 3),
(25, 53, 3),
(25, 54, 3),
(25, 55, 3),
(25, 56, 3),
(25, 57, 3),
(25, 58, 3),
(25, 59, 3),
(25, 60, 3),
(25, 61, 3),
(25, 62, 3),
(25, 63, 3),
(25, 64, 3),
(25, 65, 3),
(25, 66, 3),
(25, 67, 3),
(25, 68, 3),
(26, 1, 1),
(26, 2, 1),
(26, 3, 1),
(26, 4, 1),
(26, 5, 1),
(26, 6, 1),
(26, 7, 1),
(26, 8, 1),
(26, 9, 1),
(26, 10, 1),
(26, 11, 1),
(26, 12, 1),
(26, 13, 1),
(26, 14, 1),
(26, 15, 1),
(26, 16, 1),
(26, 17, 1),
(26, 18, 1),
(26, 19, 1),
(26, 20, 1),
(26, 21, 1),
(26, 22, 1),
(26, 23, 1),
(26, 24, 1),
(26, 25, 1),
(26, 26, 1),
(26, 27, 1),
(26, 28, 1),
(26, 29, 1),
(26, 30, 1),
(26, 31, 1),
(26, 32, 1),
(26, 33, 1),
(26, 34, 1),
(26, 35, 1),
(26, 36, 1),
(26, 37, 1),
(26, 38, 1),
(26, 39, 1),
(26, 40, 1),
(26, 41, 1),
(26, 42, 1),
(26, 43, 1),
(26, 44, 1),
(26, 45, 1),
(26, 46, 1),
(26, 47, 1),
(26, 48, 1),
(26, 49, 1),
(26, 50, 1),
(26, 51, 1),
(26, 52, 1),
(26, 53, 1),
(26, 54, 1),
(26, 55, 1),
(26, 56, 1),
(26, 57, 1),
(26, 58, 1),
(26, 59, 1),
(26, 60, 1),
(26, 61, 1),
(26, 62, 1),
(26, 63, 1),
(26, 64, 1),
(26, 65, 1),
(26, 66, 1),
(26, 67, 1),
(26, 68, 1),
(27, 1, 2),
(27, 2, 2),
(27, 3, 2),
(27, 4, 2),
(27, 5, 2),
(27, 6, 2),
(27, 7, 2),
(27, 8, 2),
(27, 9, 2),
(27, 10, 2),
(27, 11, 2),
(27, 12, 2),
(27, 13, 2),
(27, 14, 2),
(27, 15, 2),
(27, 16, 2),
(27, 17, 2),
(27, 18, 2),
(27, 19, 2),
(27, 20, 2),
(27, 21, 2),
(27, 22, 2),
(27, 23, 2),
(27, 24, 2),
(27, 25, 2),
(27, 26, 2),
(27, 27, 2),
(27, 28, 2),
(27, 29, 2),
(27, 30, 2),
(27, 31, 2),
(27, 32, 2),
(27, 33, 2),
(27, 34, 2),
(27, 35, 2),
(27, 36, 2),
(27, 37, 2),
(27, 38, 2),
(27, 39, 2),
(27, 40, 2),
(27, 41, 2),
(27, 42, 2),
(27, 43, 2),
(27, 44, 2),
(27, 45, 2),
(27, 46, 2),
(27, 47, 2),
(27, 48, 2),
(27, 49, 2),
(27, 50, 2),
(27, 51, 2),
(27, 52, 2),
(27, 53, 2),
(27, 54, 2),
(27, 55, 2),
(27, 56, 2),
(27, 57, 2),
(27, 58, 2),
(27, 59, 2),
(27, 60, 2),
(27, 61, 2),
(27, 62, 2),
(27, 63, 2),
(27, 64, 2),
(27, 65, 2),
(27, 66, 2),
(27, 67, 2),
(27, 68, 2),
(28, 1, 3),
(28, 2, 3),
(28, 3, 3),
(28, 4, 3),
(28, 5, 3),
(28, 6, 3),
(28, 7, 3),
(28, 8, 3),
(28, 9, 3),
(28, 10, 3),
(28, 11, 3),
(28, 12, 3),
(28, 13, 3),
(28, 14, 3),
(28, 15, 3),
(28, 16, 3),
(28, 17, 3),
(28, 18, 3),
(28, 19, 3),
(28, 20, 3),
(28, 21, 3),
(28, 22, 3),
(28, 23, 3),
(28, 24, 3),
(28, 25, 3),
(28, 26, 3),
(28, 27, 3),
(28, 28, 3),
(28, 29, 3),
(28, 30, 3),
(28, 31, 3),
(28, 32, 3),
(28, 33, 3),
(28, 34, 3),
(28, 35, 3),
(28, 36, 3),
(28, 37, 3),
(28, 38, 3),
(28, 39, 3),
(28, 40, 3),
(28, 41, 3),
(28, 42, 3),
(28, 43, 3),
(28, 44, 3),
(28, 45, 3),
(28, 46, 3),
(28, 47, 3),
(28, 48, 3),
(28, 49, 3),
(28, 50, 3),
(28, 51, 3),
(28, 52, 3),
(28, 53, 3),
(28, 54, 3),
(28, 55, 3),
(28, 56, 3),
(28, 57, 3),
(28, 58, 3),
(28, 59, 3),
(28, 60, 3),
(28, 61, 3),
(28, 62, 3),
(28, 63, 3),
(28, 64, 3),
(28, 65, 3),
(28, 66, 3),
(28, 67, 3),
(28, 68, 3),
(29, 1, 4),
(29, 2, 4),
(29, 3, 4),
(29, 4, 4),
(29, 5, 4),
(29, 6, 4),
(29, 7, 4),
(29, 8, 4),
(29, 9, 4),
(29, 10, 4),
(29, 11, 4),
(29, 12, 4),
(29, 13, 4),
(29, 14, 4),
(29, 15, 4),
(29, 16, 4),
(29, 17, 4),
(29, 18, 4),
(29, 19, 4),
(29, 20, 4),
(29, 21, 4),
(29, 22, 4),
(29, 23, 4),
(29, 24, 4),
(29, 25, 4),
(29, 26, 4),
(29, 27, 4),
(29, 28, 4),
(29, 29, 4),
(29, 30, 4),
(29, 31, 4),
(29, 32, 4),
(29, 33, 4),
(29, 34, 4),
(29, 35, 4),
(29, 36, 4),
(29, 37, 4),
(29, 38, 4),
(29, 39, 4),
(29, 40, 4),
(29, 41, 4),
(29, 42, 4),
(29, 43, 4),
(29, 44, 4),
(29, 45, 4),
(29, 46, 4),
(29, 47, 4),
(29, 48, 4),
(29, 49, 4),
(29, 50, 4),
(29, 51, 4),
(29, 52, 4),
(29, 53, 4),
(29, 54, 4),
(29, 55, 4),
(29, 56, 4),
(29, 57, 4),
(29, 58, 4),
(29, 59, 4),
(29, 60, 4),
(29, 61, 4),
(29, 62, 4),
(29, 63, 4),
(29, 64, 4),
(29, 65, 4),
(29, 66, 4),
(29, 67, 4),
(29, 68, 4),
(30, 1, 1),
(30, 2, 1),
(30, 3, 1),
(30, 4, 1),
(30, 5, 1),
(30, 6, 1),
(30, 7, 1),
(30, 8, 1),
(30, 9, 1),
(30, 10, 1),
(30, 11, 1),
(30, 12, 1),
(30, 13, 1),
(30, 14, 1),
(30, 15, 1),
(30, 16, 1),
(30, 17, 1),
(30, 18, 1),
(30, 19, 1),
(30, 20, 1),
(30, 21, 1),
(30, 22, 1),
(30, 23, 1),
(30, 24, 1),
(30, 25, 1),
(30, 26, 1),
(30, 27, 1),
(30, 28, 1),
(30, 29, 1),
(30, 30, 1),
(30, 31, 1),
(30, 32, 1),
(30, 33, 1),
(30, 34, 1),
(30, 35, 1),
(30, 36, 1),
(30, 37, 1),
(30, 38, 1),
(30, 39, 1),
(30, 40, 1),
(30, 41, 1),
(30, 42, 1),
(30, 43, 1),
(30, 44, 1),
(30, 45, 1),
(30, 46, 1),
(30, 47, 1),
(30, 48, 1),
(30, 49, 1),
(30, 50, 1),
(30, 51, 1),
(30, 52, 1),
(30, 53, 1),
(30, 54, 1),
(30, 55, 1),
(30, 56, 1),
(30, 57, 1),
(30, 58, 1),
(30, 59, 1),
(30, 60, 1),
(30, 61, 1),
(30, 62, 1),
(30, 63, 1),
(30, 64, 1),
(30, 65, 1),
(30, 66, 1),
(30, 67, 1),
(30, 68, 1),
(31, 1, 1),
(31, 2, 1),
(31, 3, 1),
(31, 4, 1),
(31, 5, 1),
(31, 6, 1),
(31, 7, 1),
(31, 8, 1),
(31, 9, 1),
(31, 10, 1),
(31, 11, 1),
(31, 12, 1),
(31, 13, 1),
(31, 14, 1),
(31, 15, 1),
(31, 16, 1),
(31, 17, 1),
(31, 18, 1),
(31, 19, 1),
(31, 20, 1),
(31, 21, 1),
(31, 22, 1),
(31, 23, 1),
(31, 24, 1),
(31, 25, 1),
(31, 26, 1),
(31, 27, 1),
(31, 28, 1),
(31, 29, 1),
(31, 30, 1),
(31, 31, 1),
(31, 32, 1),
(31, 33, 1),
(31, 34, 1),
(31, 35, 1),
(31, 36, 1),
(31, 37, 1),
(31, 38, 1),
(31, 39, 1),
(31, 40, 1),
(31, 41, 1),
(31, 42, 1),
(31, 43, 1),
(31, 44, 1),
(31, 45, 1),
(31, 46, 1),
(31, 47, 1),
(31, 48, 1),
(31, 49, 1),
(31, 50, 1),
(31, 51, 1),
(31, 52, 1),
(31, 53, 1),
(31, 54, 1),
(31, 55, 1),
(31, 56, 1),
(31, 57, 1),
(31, 58, 1),
(31, 59, 1),
(31, 60, 1),
(31, 61, 1),
(31, 62, 1),
(31, 63, 1),
(31, 64, 1),
(31, 65, 1),
(31, 66, 1),
(31, 67, 1),
(31, 68, 1),
(32, 1, 1),
(32, 2, 1),
(32, 3, 1),
(32, 4, 1),
(32, 5, 1),
(32, 6, 1),
(32, 7, 1),
(32, 8, 1),
(32, 9, 1),
(32, 10, 1),
(32, 11, 1),
(32, 12, 1),
(32, 13, 1),
(32, 14, 1),
(32, 15, 1),
(32, 16, 1),
(32, 17, 1),
(32, 18, 1),
(32, 19, 1),
(32, 20, 1),
(32, 21, 1),
(32, 22, 1),
(32, 23, 1),
(32, 24, 1),
(32, 25, 1),
(32, 26, 1),
(32, 27, 1),
(32, 28, 1),
(32, 29, 1),
(32, 30, 1),
(32, 31, 1),
(32, 32, 1),
(32, 33, 1),
(32, 34, 1),
(32, 35, 1),
(32, 36, 1),
(32, 37, 1),
(32, 38, 1),
(32, 39, 1),
(32, 40, 1),
(32, 41, 1),
(32, 42, 1),
(32, 43, 1),
(32, 44, 1),
(32, 45, 1),
(32, 46, 1),
(32, 47, 1),
(32, 48, 1),
(32, 49, 1),
(32, 50, 1),
(32, 51, 1),
(32, 52, 1),
(32, 53, 1),
(32, 54, 1),
(32, 55, 1),
(32, 56, 1),
(32, 57, 1),
(32, 58, 1),
(32, 59, 1),
(32, 60, 1),
(32, 61, 1),
(32, 62, 1),
(32, 63, 1),
(32, 64, 1),
(32, 65, 1),
(32, 66, 1),
(32, 67, 1),
(32, 68, 1),
(34, 1, 1),
(34, 4, 1),
(34, 5, 1),
(34, 6, 1),
(34, 7, 1),
(34, 8, 1),
(34, 9, 1),
(34, 10, 1),
(34, 11, 1),
(34, 12, 1),
(34, 13, 1),
(34, 20, 1),
(34, 21, 1),
(34, 22, 1),
(34, 23, 1),
(34, 24, 1),
(34, 25, 1),
(34, 26, 1),
(34, 27, 1),
(34, 28, 1),
(34, 29, 1),
(34, 30, 1),
(34, 32, 1),
(34, 33, 1),
(34, 34, 1),
(34, 35, 1),
(34, 36, 1),
(34, 37, 1),
(34, 38, 1),
(34, 39, 1),
(34, 40, 1),
(34, 41, 1),
(34, 42, 1),
(34, 43, 1),
(34, 44, 1),
(34, 45, 1),
(34, 46, 1),
(34, 52, 1),
(34, 54, 1),
(34, 55, 1),
(34, 58, 1),
(34, 59, 1),
(34, 60, 1),
(34, 61, 1),
(34, 62, 1),
(34, 63, 1),
(34, 64, 1),
(34, 66, 1),
(34, 67, 1),
(34, 68, 1),
(17, 80, 1),
(17, 96, 1),
(17, 75, 1),
(17, 89, 1),
(17, 71, 1),
(17, 81, 1),
(17, 82, 1),
(17, 78, 1),
(17, 77, 1),
(17, 90, 1),
(17, 73, 1),
(17, 97, 1),
(17, 95, 1),
(17, 83, 1),
(17, 93, 1),
(17, 76, 1),
(17, 70, 1),
(17, 69, 1),
(19, 80, 1),
(19, 96, 1),
(19, 75, 1),
(19, 89, 1),
(19, 71, 1),
(19, 81, 1),
(19, 82, 1),
(19, 78, 1),
(19, 77, 1),
(19, 90, 1),
(19, 73, 1),
(19, 97, 1),
(19, 95, 1),
(19, 83, 1),
(19, 93, 1),
(19, 76, 1),
(19, 70, 1),
(19, 69, 1),
(22, 80, 1),
(22, 96, 1),
(22, 75, 1),
(22, 89, 1),
(22, 71, 1),
(22, 81, 1),
(22, 82, 1),
(22, 78, 1),
(22, 77, 1),
(22, 90, 1),
(22, 73, 1),
(22, 97, 1),
(22, 95, 1),
(22, 83, 1),
(22, 93, 1),
(22, 76, 1),
(22, 70, 1),
(22, 69, 1),
(11, 80, 1),
(11, 96, 1),
(11, 75, 1),
(11, 89, 1),
(11, 71, 1),
(11, 81, 1),
(11, 82, 1),
(11, 78, 1),
(11, 77, 1),
(11, 90, 1),
(11, 73, 1),
(11, 97, 1),
(11, 95, 1),
(11, 83, 1),
(11, 93, 1),
(11, 76, 1),
(11, 70, 1),
(11, 69, 1),
(12, 80, 2),
(12, 96, 2),
(12, 75, 2),
(12, 89, 2),
(12, 71, 2),
(12, 81, 2),
(12, 82, 2),
(12, 78, 2),
(12, 77, 2),
(12, 90, 2),
(12, 73, 2),
(12, 97, 2),
(12, 95, 2),
(12, 83, 2),
(12, 93, 2),
(12, 76, 2),
(12, 70, 2),
(12, 69, 2),
(36, 37, 1),
(36, 28, 1),
(36, 41, 1),
(36, 33, 1),
(36, 43, 1),
(36, 36, 1),
(36, 35, 1),
(36, 38, 1),
(36, 39, 1),
(36, 32, 1),
(36, 42, 1),
(36, 27, 1),
(36, 29, 1),
(36, 34, 1),
(36, 30, 1),
(36, 40, 1),
(36, 44, 1),
(36, 45, 1),
(6, 80, 2),
(6, 96, 2),
(6, 75, 2),
(6, 89, 2),
(6, 71, 2),
(6, 81, 2),
(6, 82, 2),
(6, 78, 2),
(6, 77, 2),
(6, 90, 2),
(6, 73, 2),
(6, 97, 2),
(6, 95, 2),
(6, 83, 2),
(6, 93, 2),
(6, 76, 2),
(6, 70, 2),
(6, 69, 2),
(21, 80, 1),
(21, 96, 1),
(21, 75, 1),
(21, 89, 1),
(21, 71, 1),
(21, 81, 1),
(21, 82, 1),
(21, 78, 1),
(21, 77, 1),
(21, 90, 1),
(21, 73, 1),
(21, 97, 1),
(21, 95, 1),
(21, 83, 1),
(21, 93, 1),
(21, 76, 1),
(21, 70, 1),
(21, 69, 1),
(18, 80, 1),
(18, 96, 1),
(18, 75, 1),
(18, 89, 1),
(18, 71, 1),
(18, 81, 1),
(18, 82, 1),
(18, 78, 1),
(18, 77, 1),
(18, 90, 1),
(18, 73, 1),
(18, 97, 1),
(18, 95, 1),
(18, 83, 1),
(18, 93, 1),
(18, 76, 1),
(18, 70, 1),
(18, 69, 1),
(15, 80, 1),
(15, 96, 1),
(15, 75, 1),
(15, 89, 1),
(15, 71, 1),
(15, 81, 1),
(15, 82, 1),
(15, 78, 1),
(15, 77, 1),
(15, 90, 1),
(15, 73, 1),
(15, 97, 1),
(15, 95, 1),
(15, 83, 1),
(15, 93, 1),
(15, 76, 1),
(15, 70, 1),
(15, 69, 1),
(16, 80, 2),
(16, 96, 2),
(16, 75, 2),
(16, 89, 2),
(16, 71, 2),
(16, 81, 2),
(16, 82, 2),
(16, 78, 2),
(16, 77, 2),
(16, 90, 2),
(16, 73, 2),
(16, 97, 2),
(16, 95, 2),
(16, 83, 2),
(16, 93, 2),
(16, 76, 2),
(16, 70, 2),
(16, 69, 2),
(13, 80, 1),
(13, 96, 1),
(13, 75, 1),
(13, 89, 1),
(13, 71, 1),
(13, 81, 1),
(13, 82, 1),
(13, 78, 1),
(13, 77, 1),
(13, 90, 1),
(13, 73, 1),
(13, 97, 1),
(13, 95, 1),
(13, 83, 1),
(13, 93, 1),
(13, 76, 1),
(13, 70, 1),
(13, 69, 1),
(14, 80, 2),
(14, 96, 2),
(14, 75, 2),
(14, 89, 2),
(14, 71, 2),
(14, 81, 2),
(14, 82, 2),
(14, 78, 2),
(14, 77, 2),
(14, 90, 2),
(14, 73, 2),
(14, 97, 2),
(14, 95, 2),
(14, 83, 2),
(14, 93, 2),
(14, 76, 2),
(14, 70, 2),
(14, 69, 2),
(7, 80, 1),
(7, 96, 1),
(7, 75, 1),
(7, 89, 1),
(7, 71, 1),
(7, 81, 1),
(7, 82, 1),
(7, 78, 1),
(7, 77, 1),
(7, 90, 1),
(7, 73, 1),
(7, 97, 1),
(7, 95, 1),
(7, 83, 1),
(7, 93, 1),
(7, 76, 1),
(7, 70, 1),
(7, 69, 1),
(35, 12, 1),
(35, 4, 1),
(35, 22, 1),
(35, 8, 1),
(35, 24, 1),
(35, 11, 1),
(35, 10, 1),
(35, 13, 1),
(35, 20, 1),
(35, 7, 1),
(35, 23, 1),
(35, 1, 1),
(35, 5, 1),
(35, 9, 1),
(35, 6, 1),
(35, 21, 1),
(35, 25, 1),
(35, 26, 1),
(9, 80, 3),
(9, 96, 3),
(9, 75, 3),
(9, 89, 3),
(9, 71, 3),
(9, 81, 3),
(9, 82, 3),
(9, 78, 3),
(9, 77, 3),
(9, 90, 3),
(9, 73, 3),
(9, 97, 3),
(9, 95, 3),
(9, 83, 3),
(9, 93, 3),
(9, 76, 3),
(9, 70, 3),
(9, 69, 3),
(10, 80, 4),
(10, 96, 4),
(10, 75, 4),
(10, 89, 4),
(10, 71, 4),
(10, 81, 4),
(10, 82, 4),
(10, 78, 4),
(10, 77, 4),
(10, 90, 4),
(10, 73, 4),
(10, 97, 4),
(10, 95, 4),
(10, 83, 4),
(10, 93, 4),
(10, 76, 4),
(10, 70, 4),
(10, 69, 4),
(20, 80, 1),
(20, 96, 1),
(20, 75, 1),
(20, 89, 1),
(20, 71, 1),
(20, 81, 1),
(20, 82, 1),
(20, 78, 1),
(20, 77, 1),
(20, 90, 1),
(20, 73, 1),
(20, 97, 1),
(20, 95, 1),
(20, 83, 1),
(20, 93, 1),
(20, 76, 1),
(20, 70, 1),
(20, 69, 1),
(34, 80, 1),
(34, 96, 1),
(34, 75, 1),
(34, 89, 1),
(34, 71, 1),
(34, 81, 1),
(34, 82, 1),
(34, 78, 1),
(34, 77, 1),
(34, 90, 1),
(34, 73, 1),
(34, 97, 1),
(34, 95, 1),
(34, 83, 1),
(34, 93, 1),
(34, 76, 1),
(34, 70, 1),
(34, 69, 1),
(32, 80, 1),
(32, 96, 1),
(32, 75, 1),
(32, 89, 1),
(32, 71, 1),
(32, 81, 1),
(32, 82, 1),
(32, 78, 1),
(32, 77, 1),
(32, 90, 1),
(32, 73, 1),
(32, 97, 1),
(32, 95, 1),
(32, 83, 1),
(32, 93, 1),
(32, 76, 1),
(32, 70, 1),
(32, 69, 1),
(30, 80, 1),
(30, 96, 1),
(30, 75, 1),
(30, 89, 1),
(30, 71, 1),
(30, 81, 1),
(30, 82, 1),
(30, 78, 1),
(30, 77, 1),
(30, 90, 1),
(30, 73, 1),
(30, 97, 1),
(30, 95, 1),
(30, 83, 1),
(30, 93, 1),
(30, 76, 1),
(30, 70, 1),
(30, 69, 1),
(31, 80, 1),
(31, 96, 1),
(31, 75, 1),
(31, 89, 1),
(31, 71, 1),
(31, 81, 1),
(31, 82, 1),
(31, 78, 1),
(31, 77, 1),
(31, 90, 1),
(31, 73, 1),
(31, 97, 1),
(31, 95, 1),
(31, 83, 1),
(31, 93, 1),
(31, 76, 1),
(31, 70, 1),
(31, 69, 1),
(23, 80, 1),
(23, 96, 1),
(23, 75, 1),
(23, 89, 1),
(23, 71, 1),
(23, 81, 1),
(23, 82, 1),
(23, 78, 1),
(23, 77, 1),
(23, 90, 1),
(23, 73, 1),
(23, 97, 1),
(23, 95, 1),
(23, 83, 1),
(23, 93, 1),
(23, 76, 1),
(23, 70, 1),
(23, 69, 1),
(24, 80, 2),
(24, 96, 2),
(24, 75, 2),
(24, 89, 2),
(24, 71, 2),
(24, 81, 2),
(24, 82, 2),
(24, 78, 2),
(24, 77, 2),
(24, 90, 2),
(24, 73, 2),
(24, 97, 2),
(24, 95, 2),
(24, 83, 2),
(24, 93, 2),
(24, 76, 2),
(24, 70, 2),
(24, 69, 2),
(25, 80, 3),
(25, 96, 3),
(25, 75, 3),
(25, 89, 3),
(25, 71, 3),
(25, 81, 3),
(25, 82, 3),
(25, 78, 3),
(25, 77, 3),
(25, 90, 3),
(25, 73, 3),
(25, 97, 3),
(25, 95, 3),
(25, 83, 3),
(25, 93, 3),
(25, 76, 3),
(25, 70, 3),
(25, 69, 3),
(26, 80, 1),
(26, 96, 1),
(26, 75, 1),
(26, 89, 1),
(26, 71, 1),
(26, 81, 1),
(26, 82, 1),
(26, 78, 1),
(26, 77, 1),
(26, 90, 1),
(26, 73, 1),
(26, 97, 1),
(26, 95, 1),
(26, 83, 1),
(26, 93, 1),
(26, 76, 1),
(26, 70, 1),
(26, 69, 1),
(27, 80, 2),
(27, 96, 2),
(27, 75, 2),
(27, 89, 2),
(27, 71, 2),
(27, 81, 2),
(27, 82, 2),
(27, 78, 2),
(27, 77, 2),
(27, 90, 2),
(27, 73, 2),
(27, 97, 2),
(27, 95, 2),
(27, 83, 2),
(27, 93, 2),
(27, 76, 2),
(27, 70, 2),
(27, 69, 2),
(28, 80, 3),
(28, 96, 3),
(28, 75, 3),
(28, 89, 3),
(28, 71, 3),
(28, 81, 3),
(28, 82, 3),
(28, 78, 3),
(28, 77, 3),
(28, 90, 3),
(28, 73, 3),
(28, 97, 3),
(28, 95, 3),
(28, 83, 3),
(28, 93, 3),
(28, 76, 3),
(28, 70, 3),
(28, 69, 3),
(29, 80, 4),
(29, 96, 4),
(29, 75, 4),
(29, 89, 4),
(29, 71, 4),
(29, 81, 4),
(29, 82, 4),
(29, 78, 4),
(29, 77, 4),
(29, 90, 4),
(29, 73, 4),
(29, 97, 4),
(29, 95, 4),
(29, 83, 4),
(29, 93, 4),
(29, 76, 4),
(29, 70, 4),
(29, 69, 4);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_comment`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_comment` (
  `cid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attach` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_time` int(11) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `post_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `likes` mediumint(9) NOT NULL DEFAULT '0',
  `dislikes` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `mod_id` (`module`,`area`,`id`),
  KEY `post_time` (`post_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_contact_department`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_contact_department` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cats` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `admins` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(5) NOT NULL,
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `full_name` (`full_name`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_vi_contact_department`
--

INSERT INTO `hn4_vi_contact_department` (`id`, `full_name`, `alias`, `image`, `phone`, `fax`, `email`, `address`, `note`, `others`, `cats`, `admins`, `act`, `weight`, `is_default`) VALUES
(1, 'Phòng Chăm sóc khách hàng', 'Cham-soc-khach-hang', '', '(08) 38.000.000[+84838000000]', '08 38.000.001', 'customer@mysite.com', '', 'Bộ phận tiếp nhận và giải quyết các yêu cầu, đề nghị, ý kiến liên quan đến hoạt động chính của doanh nghiệp', '{"viber":"myViber","skype":"mySkype","zalo":"0933456789"}', 'Tư vấn|Khiếu nại, phản ánh|Đề nghị hợp tác', '1/1/1/0;', 1, 1, 1),
(2, 'Phòng Kỹ thuật', 'Ky-thuat', '', '(08) 38.000.002[+84838000002]', '08 38.000.003', 'technical@mysite.com', '', 'Bộ phận tiếp nhận và giải quyết các câu hỏi liên quan đến kỹ thuật', '{"viber":"myViber2","skype":"mySkype2","zalo":"0923456789"}', 'Thông báo lỗi|Góp ý cải tiến', '1/1/1/0;', 1, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_contact_reply`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_contact_reply` (
  `rid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `reply_content` text COLLATE utf8mb4_unicode_ci,
  `reply_time` int(11) unsigned NOT NULL DEFAULT '0',
  `reply_aid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_contact_send`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_contact_send` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `send_time` int(11) unsigned NOT NULL DEFAULT '0',
  `sender_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sender_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sender_ip` varchar(39) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_read` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_reply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_processed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `processed_by` int(11) unsigned NOT NULL DEFAULT '0',
  `processed_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sender_name` (`sender_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_contact_supporter`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_contact_supporter` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `departmentid` smallint(5) unsigned NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `others` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `act` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `weight` smallint(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_freecontent_blocks`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_freecontent_blocks` (
  `bid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hn4_vi_freecontent_blocks`
--

INSERT INTO `hn4_vi_freecontent_blocks` (`bid`, `title`, `description`) VALUES
(1, 'Sản phẩm', 'Sản phẩm của công ty cổ phần phát triển nguồn mở Việt Nam - VINADES.,JSC');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_freecontent_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_freecontent_rows` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `bid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `target` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '_blank|_self|_parent|_top',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `start_time` int(11) NOT NULL DEFAULT '0',
  `end_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0: In-Active, 1: Active, 2: Expired',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `hn4_vi_freecontent_rows`
--

INSERT INTO `hn4_vi_freecontent_rows` (`id`, `bid`, `title`, `description`, `link`, `target`, `image`, `start_time`, `end_time`, `status`) VALUES
(1, 1, 'Hệ quản trị nội dung NukeViet', '<ul>\n	<li>Giải thưởng Nhân tài đất Việt 2011, 10.000+ website đang sử dụng</li>\n	<li>Được Bộ GD&amp;ĐT khuyến khích sử dụng trong các cơ sở giáo dục</li>\n	<li>Bộ TT&amp;TT quy định ưu tiên sử dụng trong cơ quan nhà nước</li>\n</ul>', 'http://vinades.vn/vi/san-pham/nukeviet/', '_blank', 'cms.jpg', 1675986735, 0, 1),
(2, 1, 'Cổng thông tin doanh nghiệp', '<ul>\n	<li>Tích hợp bán hàng trực tuyến</li>\n	<li>Tích hợp các nghiệp vụ quản lý (quản lý khách hàng, quản lý nhân sự, quản lý tài liệu)</li>\n</ul>', 'http://vinades.vn/vi/san-pham/Cong-thong-tin-doanh-nghiep-NukeViet-portal/', '_blank', 'portal.jpg', 1675986735, 0, 1),
(3, 1, 'Cổng thông tin Phòng giáo dục, Sở giáo dục', '<ul>\n	<li>Tích hợp chung website hàng trăm trường</li>\n	<li>Tích hợp các ứng dụng trực tuyến (Tra điểm SMS, Tra cứu văn bằng, Học bạ điện tử ...)</li>\n</ul>', 'http://vinades.vn/vi/san-pham/Cong-thong-tin-giao-duc-NukeViet-Edugate/', '_blank', 'edugate.jpg', 1675986735, 0, 1),
(4, 1, 'Tòa soạn báo điện tử chuyên nghiệp', '<ul>\n	<li>Bảo mật đa tầng, phân quyền linh hoạt</li>\n	<li>Hệ thống bóc tin tự động, đăng bài tự động, cùng nhiều chức năng tiên tiến khác...</li>\n</ul>', 'http://vinades.vn/vi/san-pham/Toa-soan-bao-dien-tu/', '_blank', 'toa-soan-dien-tu.jpg', 1675986735, 0, 1),
(5, 1, 'Giải pháp bán hàng trực tuyến', '<ul><li>Tích hợp các tính năng cơ bản bán hàng trực tuyến</li><li>Tích hợp với các cổng thanh toán, ví điện tử trên toàn quốc</li></ul>', 'http://vinades.vn', '_blank', 'shop.jpg', 1675986735, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_menu`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_vi_menu`
--

INSERT INTO `hn4_vi_menu` (`id`, `title`) VALUES
(1, 'Top Menu'),
(2, 'Shop');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_menu_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_menu_rows` (
  `id` mediumint(5) NOT NULL AUTO_INCREMENT,
  `parentid` mediumint(5) unsigned NOT NULL,
  `mid` smallint(5) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` int(11) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '0',
  `lev` int(11) NOT NULL DEFAULT '0',
  `subitem` text COLLATE utf8mb4_unicode_ci,
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `module_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `op` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `target` tinyint(4) DEFAULT '0',
  `css` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `active_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`,`mid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=42 ;

--
-- Dumping data for table `hn4_vi_menu_rows`
--

INSERT INTO `hn4_vi_menu_rows` (`id`, `parentid`, `mid`, `title`, `link`, `icon`, `image`, `note`, `weight`, `sort`, `lev`, `subitem`, `groups_view`, `module_name`, `op`, `target`, `css`, `active_type`, `status`) VALUES
(1, 0, 1, 'Giới thiệu', '/index.php?language=vi&nv=about', '', '', '', 1, 1, 0, '8,9,10,11,12,13,14,15', '6', 'about', '', 1, '', 1, 1),
(2, 0, 1, 'Tin Tức', '/index.php?language=vi&nv=news', '', '', '', 2, 10, 0, '16,17,18,19,20,21,22', '6', 'news', '', 1, '', 1, 1),
(3, 0, 1, 'Tài khoản người dùng', '/index.php?language=vi&nv=users', '', '', '', 3, 18, 0, '', '6', 'users', '', 1, '', 1, 1),
(4, 0, 1, 'Thống kê', '/index.php?language=vi&nv=statistics', '', '', '', 4, 19, 0, '', '2', 'statistics', '', 1, '', 1, 1),
(5, 0, 1, 'Thăm dò ý kiến', '/index.php?language=vi&nv=voting', '', '', '', 5, 20, 0, '', '6', 'voting', '', 1, '', 1, 1),
(6, 0, 1, 'Tìm kiếm', '/index.php?language=vi&nv=seek', '', '', '', 6, 21, 0, '', '6', 'seek', '', 1, '', 1, 1),
(7, 0, 1, 'Liên hệ', '/index.php?language=vi&nv=contact', '', '', '', 7, 22, 0, '', '6', 'contact', '', 1, '', 1, 1),
(8, 1, 1, 'Giới thiệu về NukeViet', '/index.php?language=vi&nv=about&op=gioi-thieu-ve-nukeviet.html', '', '', '', 1, 2, 1, '', '6', 'about', 'gioi-thieu-ve-nukeviet', 1, '', 1, 1),
(9, 1, 1, 'Giới thiệu về NukeViet CMS', '/index.php?language=vi&nv=about&op=gioi-thieu-ve-nukeviet-cms.html', '', '', '', 2, 3, 1, '', '6', 'about', 'gioi-thieu-ve-nukeviet-cms', 1, '', 1, 1),
(10, 1, 1, 'Logo và tên gọi NukeViet', '/index.php?language=vi&nv=about&op=logo-va-ten-goi-nukeviet.html', '', '', '', 3, 4, 1, '', '6', 'about', 'logo-va-ten-goi-nukeviet', 1, '', 1, 1),
(11, 1, 1, 'Giấy phép sử dụng NukeViet', '/index.php?language=vi&nv=about&op=giay-phep-su-dung-nukeviet.html', '', '', '', 4, 5, 1, '', '6,7', 'about', 'giay-phep-su-dung-nukeviet', 1, '', 1, 1),
(12, 1, 1, 'Những tính năng của NukeViet CMS 4.0', '/index.php?language=vi&nv=about&op=nhung-tinh-nang-cua-nukeviet-cms-4-0.html', '', '', '', 5, 6, 1, '', '6', 'about', 'nhung-tinh-nang-cua-nukeviet-cms-4-0', 1, '', 1, 1),
(13, 1, 1, 'Yêu cầu sử dụng NukeViet 4', '/index.php?language=vi&nv=about&op=Yeu-cau-su-dung-NukeViet-4.html', '', '', '', 6, 7, 1, '', '6', 'about', 'Yeu-cau-su-dung-NukeViet-4', 1, '', 1, 1),
(14, 1, 1, 'Giới thiệu về Công ty cổ phần phát triển nguồn mở Việt Nam', '/index.php?language=vi&nv=about&op=gioi-thieu-ve-cong-ty-co-phan-phat-trien-nguon-mo-viet-nam.html', '', '', '', 7, 8, 1, '', '6', 'about', 'gioi-thieu-ve-cong-ty-co-phan-phat-trien-nguon-mo-viet-nam', 1, '', 1, 1),
(15, 1, 1, 'Ủng hộ, hỗ trợ và tham gia phát triển NukeViet', '/index.php?language=vi&nv=about&op=ung-ho-ho-tro-va-tham-gia-phat-trien-nukeviet.html', '', '', '', 8, 9, 1, '', '6', 'about', 'ung-ho-ho-tro-va-tham-gia-phat-trien-nukeviet', 1, '', 1, 1),
(16, 2, 1, 'Đối tác', '/index.php?language=vi&nv=news&op=Doi-tac', '', '', '', 1, 11, 1, '', '6', 'news', 'Doi-tac', 1, '', 1, 1),
(17, 2, 1, 'Tuyển dụng', '/index.php?language=vi&nv=news&op=Tuyen-dung', '', '', '', 2, 12, 1, '', '6', 'news', 'Tuyen-dung', 1, '', 1, 1),
(18, 2, 1, 'Rss', '/index.php?language=vi&nv=news&op=rss', '', '', '', 3, 13, 1, '', '6', 'news', 'rss', 1, '', 1, 1),
(19, 2, 1, 'Quản lý bài viết', '/index.php?language=vi&nv=news&op=content', '', '', '', 4, 14, 1, '', '6', 'news', 'content', 1, '', 1, 1),
(20, 2, 1, 'Tìm kiếm', '/index.php?language=vi&nv=news&op=search', '', '', '', 5, 15, 1, '', '6', 'news', 'search', 1, '', 1, 1),
(21, 2, 1, 'Tin tức', '/index.php?language=vi&nv=news&op=Tin-tuc', '', '', '', 6, 16, 1, '', '6', 'news', 'Tin-tuc', 1, '', 1, 1),
(22, 2, 1, 'Sản phẩm', '/index.php?language=vi&nv=news&op=San-pham', '', '', '', 7, 17, 1, '', '6', 'news', 'San-pham', 1, '', 1, 1),
(23, 0, 2, 'Linh Cavali Fashion', '/index.php?language=vi&nv=shops&op=linh-cavali-fashion', '', 'woman.jpeg', '', 1, 1, 0, '29,28,30,31,32,33,34,35,36,37,40', '6', 'shops', 'linh-cavali-fashion', 1, 'cavali', 0, 1),
(24, 0, 2, 'Bags &amp; Shoes', '/index.php?language=vi&nv=shops&op=bags-shoe', '', '', '', 2, 16, 0, '27', '6', 'shops', 'bags-shoe', 1, 'bags-shoe', 0, 1),
(25, 0, 2, 'Accessories', '/index.php?language=vi&nv=shops&op=accessories', '', '', '', 3, 18, 0, '', '6', 'shops', 'accessories', 1, 'accessories', 0, 1),
(27, 24, 2, 'new row', '', '', '', '', 1, 17, 1, '', '6', '', '', 1, '', 0, 1),
(29, 23, 2, 'Chân váy', '/index.php?language=vi&nv=shops&op=Chan-vay', '', '', '', 2, 3, 1, '', '6', 'shops', 'Chan-vay', 1, '', 0, 1),
(28, 23, 2, 'Đầm', '/index.php?language=vi&nv=shops&op=dam', '', '', '', 1, 2, 1, '', '6', 'shops', 'dam', 1, '', 0, 1),
(30, 23, 2, 'Áo khoác', '/index.php?language=vi&nv=shops&op=ao-khoac', '', '', '', 3, 4, 1, '', '6', 'shops', 'ao-khoac', 1, '', 0, 1),
(31, 23, 2, 'Jumpsuit &amp; Playsuit', '/index.php?language=vi&nv=shops&op=jumpsuit-playsuit', '', '', '', 4, 5, 1, '', '6', 'shops', 'jumpsuit-playsuit', 1, '', 0, 1),
(32, 23, 2, 'Đồ bơi', '/index.php?language=vi&nv=shops&op=Do-boi', '', '', '', 5, 6, 1, '', '6', 'shops', 'Do-boi', 1, '', 0, 1),
(33, 23, 2, 'Đồ thể thao', '/index.php?language=vi&nv=shops&op=do-the-thao', '', '', '', 6, 7, 1, '', '6', 'shops', 'do-the-thao', 1, '', 0, 1),
(34, 23, 2, 'Đồ ngủ', '/index.php?language=vi&nv=shops&op=do-ngu', '', '', '', 7, 8, 1, '', '6', 'shops', 'do-ngu', 1, '', 0, 1),
(35, 23, 2, 'Đồ lót', '/index.php?language=vi&nv=shops&op=do-lot', '', '', '', 8, 9, 1, '', '6', 'shops', 'do-lot', 1, '', 0, 1),
(36, 23, 2, 'Đồ Vest', '/index.php?language=vi&nv=shops&op=Do-Vest', '', '', '', 9, 10, 1, '', '6', 'shops', 'Do-Vest', 1, '', 0, 1),
(37, 23, 2, 'Áo nữ', '/index.php?language=vi&nv=shops&op=ao-nu', '', '', '', 10, 11, 1, '38,39', '6', 'shops', 'ao-nu', 1, '', 0, 1),
(38, 37, 2, 'Áo sơ mi', '/index.php?language=vi&nv=shops&op=Ao-so-mi', '', '', '', 1, 12, 2, '', '6', 'shops', 'Ao-so-mi', 1, '', 0, 1),
(39, 37, 2, 'Áo polo', '/index.php?language=vi&nv=shops&op=ao-polo', '', '', '', 2, 13, 2, '', '6', 'shops', 'ao-polo', 1, '', 0, 1),
(40, 23, 2, 'Quẩn nữ', '/index.php?language=vi&nv=shops&op=Quan-nu', '', '', '', 11, 14, 1, '41', '6', 'shops', 'Quan-nu', 1, '', 0, 1),
(41, 40, 2, 'Quần Jean', '/index.php?language=vi&nv=shops&op=quan-jean', '', '', '', 1, 15, 2, '', '6', 'shops', 'quan-jean', 1, '', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_modfuncs`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_modfuncs` (
  `func_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `func_name` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(55) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `func_custom_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `func_site_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `in_module` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `show_func` tinyint(4) NOT NULL DEFAULT '0',
  `in_submenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subweight` smallint(2) unsigned NOT NULL DEFAULT '1',
  `setting` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`func_id`),
  UNIQUE KEY `func_name` (`func_name`,`in_module`),
  UNIQUE KEY `alias` (`alias`,`in_module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=99 ;

--
-- Dumping data for table `hn4_vi_modfuncs`
--

INSERT INTO `hn4_vi_modfuncs` (`func_id`, `func_name`, `alias`, `func_custom_name`, `func_site_title`, `description`, `in_module`, `show_func`, `in_submenu`, `subweight`, `setting`) VALUES
(1, 'main', 'main', 'Main', '', '', 'about', 1, 0, 1, ''),
(2, 'sitemap', 'sitemap', 'Sitemap', '', '', 'about', 0, 0, 0, ''),
(3, 'rss', 'rss', 'Rss', '', '', 'about', 0, 0, 0, ''),
(4, 'main', 'main', 'Main', '', '', 'news', 1, 0, 1, ''),
(5, 'viewcat', 'viewcat', 'Viewcat', '', '', 'news', 1, 0, 2, ''),
(6, 'topic', 'topic', 'Topic', '', '', 'news', 1, 0, 3, ''),
(7, 'content', 'content', 'Content', '', '', 'news', 1, 1, 4, ''),
(8, 'detail', 'detail', 'Detail', '', '', 'news', 1, 0, 5, ''),
(9, 'tag', 'tag', 'Tag', '', '', 'news', 1, 0, 6, ''),
(10, 'rss', 'rss', 'Rss', '', '', 'news', 1, 1, 7, ''),
(11, 'search', 'search', 'Search', '', '', 'news', 1, 1, 8, ''),
(12, 'groups', 'groups', 'Groups', '', '', 'news', 1, 0, 9, ''),
(13, 'author', 'author', 'Author', '', '', 'news', 1, 0, 10, ''),
(14, 'sitemap', 'sitemap', 'Sitemap', '', '', 'news', 0, 0, 0, ''),
(15, 'print', 'print', 'Print', '', '', 'news', 0, 0, 0, ''),
(16, 'rating', 'rating', 'Rating', '', '', 'news', 0, 0, 0, ''),
(17, 'savefile', 'savefile', 'Savefile', '', '', 'news', 0, 0, 0, ''),
(18, 'sendmail', 'sendmail', 'Sendmail', '', '', 'news', 0, 0, 0, ''),
(19, 'instant-rss', 'instant-rss', 'Instant Articles RSS', '', '', 'news', 0, 0, 0, ''),
(20, 'main', 'main', 'Main', '', '', 'users', 1, 0, 1, ''),
(21, 'login', 'login', 'Đăng nhập', '', '', 'users', 1, 1, 2, ''),
(22, 'register', 'register', 'Đăng ký', '', '', 'users', 1, 1, 3, ''),
(23, 'lostpass', 'lostpass', 'Khôi phục mật khẩu', '', '', 'users', 1, 1, 4, ''),
(24, 'active', 'active', 'Kích hoạt tài khoản', '', '', 'users', 1, 0, 5, ''),
(25, 'lostactivelink', 'lostactivelink', 'Lostactivelink', '', '', 'users', 1, 0, 6, ''),
(26, 'editinfo', 'editinfo', 'Thiết lập tài khoản', '', '', 'users', 1, 1, 7, ''),
(27, 'memberlist', 'memberlist', 'Danh sách người dùng', '', '', 'users', 1, 1, 8, ''),
(28, 'groups', 'groups', 'Quản lý nhóm', '', '', 'users', 1, 1, 9, ''),
(29, 'avatar', 'avatar', 'Avatar', '', '', 'users', 1, 0, 10, ''),
(30, 'logout', 'logout', 'Thoát', '', '', 'users', 1, 1, 11, ''),
(31, 'oauth', 'oauth', 'Oauth', '', '', 'users', 0, 0, 0, ''),
(32, 'main', 'main', 'Main', '', '', 'myapi', 1, 0, 1, ''),
(33, 'main', 'main', 'Main', '', '', 'push', 1, 0, 1, ''),
(34, 'main', 'main', 'Main', '', '', 'contact', 1, 0, 1, ''),
(35, 'main', 'main', 'Main', '', '', 'statistics', 1, 0, 1, ''),
(36, 'allreferers', 'allreferers', 'Theo đường dẫn đến site', '', '', 'statistics', 1, 1, 2, ''),
(37, 'allcountries', 'allcountries', 'Theo quốc gia', '', '', 'statistics', 1, 1, 3, ''),
(38, 'allbrowsers', 'allbrowsers', 'Theo trình duyệt', '', '', 'statistics', 1, 1, 4, ''),
(39, 'allos', 'allos', 'Theo hệ điều hành', '', '', 'statistics', 1, 1, 5, ''),
(40, 'allbots', 'allbots', 'Theo máy chủ tìm kiếm', '', '', 'statistics', 1, 1, 6, ''),
(41, 'referer', 'referer', 'Đường dẫn đến site theo tháng', '', '', 'statistics', 1, 0, 7, ''),
(42, 'main', 'main', 'Main', '', '', 'voting', 1, 0, 1, ''),
(43, 'main', 'main', 'Main', '', '', 'banners', 1, 0, 1, ''),
(44, 'addads', 'addads', 'Addads', '', '', 'banners', 1, 0, 2, ''),
(45, 'clientinfo', 'clientinfo', 'Clientinfo', '', '', 'banners', 1, 0, 3, ''),
(46, 'stats', 'stats', 'Stats', '', '', 'banners', 1, 0, 4, ''),
(47, 'cledit', 'cledit', 'Cledit', '', '', 'banners', 0, 0, 0, ''),
(48, 'click', 'click', 'Click', '', '', 'banners', 0, 0, 0, ''),
(49, 'clinfo', 'clinfo', 'Clinfo', '', '', 'banners', 0, 0, 0, ''),
(50, 'logininfo', 'logininfo', 'Logininfo', '', '', 'banners', 0, 0, 0, ''),
(51, 'viewmap', 'viewmap', 'Viewmap', '', '', 'banners', 0, 0, 0, ''),
(52, 'main', 'main', 'Main', '', '', 'seek', 1, 0, 1, ''),
(53, 'opensearch', 'opensearch', 'Opensearch', '', '', 'seek', 0, 0, 0, ''),
(54, 'main', 'main', 'Main', '', '', 'feeds', 1, 0, 1, ''),
(55, 'main', 'main', 'Main', '', '', 'page', 1, 0, 1, ''),
(56, 'sitemap', 'sitemap', 'Sitemap', '', '', 'page', 0, 0, 0, ''),
(57, 'rss', 'rss', 'Rss', '', '', 'page', 0, 0, 0, ''),
(58, 'main', 'main', 'Main', '', '', 'comment', 1, 0, 1, ''),
(59, 'post', 'post', 'Post', '', '', 'comment', 1, 0, 2, ''),
(60, 'like', 'like', 'Like', '', '', 'comment', 1, 0, 3, ''),
(61, 'delete', 'delete', 'Delete', '', '', 'comment', 1, 0, 4, ''),
(62, 'down', 'down', 'Down', '', '', 'comment', 1, 0, 5, ''),
(63, 'main', 'main', 'Main', '', '', 'siteterms', 1, 0, 1, ''),
(64, 'rss', 'rss', 'Rss', '', '', 'siteterms', 1, 0, 2, ''),
(65, 'sitemap', 'sitemap', 'Sitemap', '', '', 'siteterms', 0, 0, 0, ''),
(66, 'main', 'main', 'Main', '', '', 'two-step-verification', 1, 0, 1, ''),
(67, 'confirm', 'confirm', 'Confirm', '', '', 'two-step-verification', 1, 0, 2, ''),
(68, 'setup', 'setup', 'Setup', '', '', 'two-step-verification', 1, 0, 3, ''),
(69, 'ajax', 'ajax', 'Ajax', '', '', 'shops', 1, 0, 18, ''),
(70, 'blockcat', 'blockcat', 'Blockcat', '', '', 'shops', 1, 0, 17, ''),
(71, 'cart', 'cart', 'Cart', '', '', 'shops', 1, 0, 5, ''),
(72, 'checkorder', 'checkorder', 'Checkorder', '', '', 'shops', 0, 0, 0, ''),
(73, 'compare', 'compare', 'Compare', '', '', 'shops', 1, 0, 11, ''),
(74, 'delhis', 'delhis', 'Delhis', '', '', 'shops', 0, 0, 0, ''),
(75, 'detail', 'detail', 'Detail', '', '', 'shops', 1, 0, 3, ''),
(76, 'download', 'download', 'Download', '', '', 'shops', 1, 0, 16, ''),
(77, 'group', 'group', 'Group', '', '', 'shops', 1, 0, 9, ''),
(78, 'history', 'history', 'History', '', '', 'shops', 1, 0, 8, ''),
(79, 'loadcart', 'loadcart', 'Loadcart', '', '', 'shops', 0, 0, 0, ''),
(80, 'main', 'main', 'Main', '', '', 'shops', 1, 0, 1, ''),
(81, 'order', 'order', 'Order', '', '', 'shops', 1, 0, 6, ''),
(82, 'payment', 'payment', 'Payment', '', '', 'shops', 1, 0, 7, ''),
(83, 'point', 'point', 'Point', '', '', 'shops', 1, 0, 14, ''),
(84, 'print', 'print', 'Print', '', '', 'shops', 0, 0, 0, ''),
(85, 'print_pro', 'print_pro', 'Print_pro', '', '', 'shops', 0, 0, 0, ''),
(86, 'remove', 'remove', 'Remove', '', '', 'shops', 0, 0, 0, ''),
(87, 'review', 'review', 'Review', '', '', 'shops', 0, 0, 0, ''),
(88, 'rss', 'rss', 'Rss', '', '', 'shops', 0, 0, 0, ''),
(89, 'search', 'search', 'Search', '', '', 'shops', 1, 0, 4, ''),
(90, 'search_result', 'search_result', 'Search_result', '', '', 'shops', 1, 0, 10, ''),
(91, 'sendmail', 'sendmail', 'Sendmail', '', '', 'shops', 0, 0, 0, ''),
(92, 'setcart', 'setcart', 'Setcart', '', '', 'shops', 0, 0, 0, ''),
(93, 'shippingajax', 'shippingajax', 'Shippingajax', '', '', 'shops', 1, 0, 15, ''),
(94, 'sitemap', 'sitemap', 'Sitemap', '', '', 'shops', 0, 0, 0, ''),
(95, 'tag', 'tag', 'Tag', '', '', 'shops', 1, 0, 13, ''),
(96, 'viewcat', 'viewcat', 'Viewcat', '', '', 'shops', 1, 0, 2, ''),
(97, 'wishlist', 'wishlist', 'Wishlist', '', '', 'shops', 1, 0, 12, ''),
(98, 'wishlist_update', 'wishlist_update', 'Wishlist_update', '', '', 'shops', 0, 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_modthemes`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_modthemes` (
  `func_id` mediumint(8) DEFAULT NULL,
  `layout` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `func_id` (`func_id`,`layout`,`theme`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_modthemes`
--

INSERT INTO `hn4_vi_modthemes` (`func_id`, `layout`, `theme`) VALUES
(0, 'left-main-right', 'default'),
(0, 'left-main-right', 'licavali'),
(0, 'main', 'mobile_default'),
(1, 'left-main-right', 'default'),
(1, 'main', 'mobile_default'),
(1, 'main-home', 'licavali'),
(4, 'left-main-right', 'default'),
(4, 'main', 'mobile_default'),
(4, 'main-home', 'licavali'),
(5, 'left-main-right', 'default'),
(5, 'main', 'mobile_default'),
(5, 'main-home', 'licavali'),
(6, 'left-main-right', 'default'),
(6, 'main', 'mobile_default'),
(6, 'main-home', 'licavali'),
(7, 'left-main-right', 'default'),
(7, 'main', 'mobile_default'),
(7, 'main-home', 'licavali'),
(8, 'left-main-right', 'default'),
(8, 'main', 'mobile_default'),
(8, 'main-home', 'licavali'),
(9, 'left-main-right', 'default'),
(9, 'main', 'mobile_default'),
(9, 'main-home', 'licavali'),
(10, 'left-main-right', 'default'),
(10, 'main-home', 'licavali'),
(11, 'left-main-right', 'default'),
(11, 'main', 'mobile_default'),
(11, 'main-home', 'licavali'),
(12, 'left-main-right', 'default'),
(12, 'main', 'mobile_default'),
(12, 'main-home', 'licavali'),
(13, 'left-main-right', 'default'),
(13, 'main', 'mobile_default'),
(13, 'main-home', 'licavali'),
(20, 'left-main', 'default'),
(20, 'main', 'mobile_default'),
(20, 'main-home', 'licavali'),
(21, 'left-main', 'default'),
(21, 'main', 'mobile_default'),
(21, 'main-home', 'licavali'),
(22, 'left-main', 'default'),
(22, 'main', 'mobile_default'),
(22, 'main-home', 'licavali'),
(23, 'left-main', 'default'),
(23, 'main', 'mobile_default'),
(23, 'main-home', 'licavali'),
(24, 'left-main', 'default'),
(24, 'main', 'mobile_default'),
(24, 'main-home', 'licavali'),
(25, 'left-main', 'default'),
(25, 'main', 'mobile_default'),
(25, 'main-home', 'licavali'),
(26, 'left-main', 'default'),
(26, 'main', 'mobile_default'),
(26, 'main-home', 'licavali'),
(27, 'left-main', 'default'),
(27, 'main', 'mobile_default'),
(27, 'main-home', 'licavali'),
(28, 'left-main', 'default'),
(28, 'main', 'mobile_default'),
(28, 'main-home', 'licavali'),
(29, 'left-main', 'default'),
(29, 'main-home', 'licavali'),
(30, 'left-main', 'default'),
(30, 'main', 'mobile_default'),
(30, 'main-home', 'licavali'),
(32, 'main', 'default'),
(32, 'main', 'mobile_default'),
(32, 'main-home', 'licavali'),
(33, 'left-main', 'default'),
(33, 'main', 'mobile_default'),
(33, 'main-home', 'licavali'),
(34, 'left-main', 'default'),
(34, 'main', 'mobile_default'),
(34, 'main-home', 'licavali'),
(35, 'left-main', 'default'),
(35, 'main', 'mobile_default'),
(35, 'main-home', 'licavali'),
(36, 'left-main', 'default'),
(36, 'main', 'mobile_default'),
(36, 'main-home', 'licavali'),
(37, 'left-main', 'default'),
(37, 'main', 'mobile_default'),
(37, 'main-home', 'licavali'),
(38, 'left-main', 'default'),
(38, 'main', 'mobile_default'),
(38, 'main-home', 'licavali'),
(39, 'left-main', 'default'),
(39, 'main', 'mobile_default'),
(39, 'main-home', 'licavali'),
(40, 'left-main', 'default'),
(40, 'main', 'mobile_default'),
(40, 'main-home', 'licavali'),
(41, 'left-main', 'default'),
(41, 'main', 'mobile_default'),
(41, 'main-home', 'licavali'),
(42, 'left-main', 'default'),
(42, 'main', 'mobile_default'),
(42, 'main-home', 'licavali'),
(43, 'left-main-right', 'default'),
(43, 'main', 'mobile_default'),
(43, 'main-home', 'licavali'),
(44, 'left-main-right', 'default'),
(44, 'main', 'mobile_default'),
(44, 'main-home', 'licavali'),
(45, 'left-main-right', 'default'),
(45, 'main', 'mobile_default'),
(45, 'main-home', 'licavali'),
(46, 'left-main-right', 'default'),
(46, 'main', 'mobile_default'),
(46, 'main-home', 'licavali'),
(52, 'left-main-right', 'default'),
(52, 'main', 'mobile_default'),
(52, 'main-home', 'licavali'),
(54, 'left-main-right', 'default'),
(54, 'main', 'mobile_default'),
(54, 'main-home', 'licavali'),
(55, 'left-main', 'default'),
(55, 'main', 'mobile_default'),
(55, 'main-home', 'licavali'),
(58, 'left-main-right', 'default'),
(58, 'main', 'mobile_default'),
(58, 'main-home', 'licavali'),
(59, 'left-main-right', 'default'),
(59, 'main', 'mobile_default'),
(59, 'main-home', 'licavali'),
(60, 'left-main-right', 'default'),
(60, 'main', 'mobile_default'),
(60, 'main-home', 'licavali'),
(61, 'left-main-right', 'default'),
(61, 'main', 'mobile_default'),
(61, 'main-home', 'licavali'),
(62, 'main-home', 'licavali'),
(63, 'left-main-right', 'default'),
(63, 'main', 'mobile_default'),
(63, 'main-home', 'licavali'),
(64, 'left-main-right', 'default'),
(64, 'main', 'mobile_default'),
(64, 'main-home', 'licavali'),
(66, 'left-main-right', 'default'),
(66, 'main', 'mobile_default'),
(66, 'main-home', 'licavali'),
(67, 'left-main-right', 'default'),
(67, 'main', 'mobile_default'),
(67, 'main-home', 'licavali'),
(68, 'left-main-right', 'default'),
(68, 'main', 'mobile_default'),
(68, 'main-home', 'licavali'),
(69, 'left-main-right', 'default'),
(69, 'main', 'mobile_default'),
(69, 'main-shop', 'licavali'),
(70, 'left-main-right', 'default'),
(70, 'main', 'mobile_default'),
(70, 'main-shop', 'licavali'),
(71, 'left-main-right', 'default'),
(71, 'main', 'mobile_default'),
(71, 'main-shop', 'licavali'),
(72, 'left-main-right', 'licavali'),
(73, 'left-main-right', 'default'),
(73, 'main', 'mobile_default'),
(73, 'main-shop', 'licavali'),
(74, 'left-main-right', 'licavali'),
(75, 'left-main-right', 'default'),
(75, 'main', 'mobile_default'),
(75, 'main-shop', 'licavali'),
(76, 'left-main-right', 'default'),
(76, 'main', 'mobile_default'),
(76, 'main-shop', 'licavali'),
(77, 'left-main-right', 'default'),
(77, 'main', 'mobile_default'),
(77, 'main-shop', 'licavali'),
(78, 'left-main-right', 'default'),
(78, 'main', 'mobile_default'),
(78, 'main-shop', 'licavali'),
(79, 'left-main-right', 'licavali'),
(80, 'left-main-right', 'default'),
(80, 'main', 'mobile_default'),
(80, 'main-home', 'licavali'),
(81, 'left-main-right', 'default'),
(81, 'main', 'mobile_default'),
(81, 'main-shop', 'licavali'),
(82, 'left-main-right', 'default'),
(82, 'main', 'mobile_default'),
(82, 'main-shop', 'licavali'),
(83, 'left-main-right', 'default'),
(83, 'main', 'mobile_default'),
(83, 'main-shop', 'licavali'),
(84, 'left-main-right', 'licavali'),
(85, 'left-main-right', 'licavali'),
(86, 'left-main-right', 'licavali'),
(87, 'left-main-right', 'licavali'),
(88, 'left-main-right', 'licavali'),
(89, 'left-main-right', 'default'),
(89, 'main', 'mobile_default'),
(89, 'main-shop', 'licavali'),
(90, 'left-main-right', 'default'),
(90, 'main', 'mobile_default'),
(90, 'main-shop', 'licavali'),
(91, 'left-main-right', 'licavali'),
(92, 'left-main-right', 'licavali'),
(93, 'left-main-right', 'default'),
(93, 'main', 'mobile_default'),
(93, 'main-shop', 'licavali'),
(94, 'left-main-right', 'licavali'),
(95, 'left-main-right', 'default'),
(95, 'main', 'mobile_default'),
(95, 'main-shop', 'licavali'),
(96, 'left-main-right', 'default'),
(96, 'main', 'mobile_default'),
(96, 'main-shop', 'licavali'),
(97, 'left-main-right', 'default'),
(97, 'main', 'mobile_default'),
(97, 'main-shop', 'licavali'),
(98, 'left-main-right', 'licavali');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_modules`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_modules` (
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_file` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module_data` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module_upload` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `module_theme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `set_time` int(11) unsigned NOT NULL DEFAULT '0',
  `main_file` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_file` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `mobile` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admins` varchar(4000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `rss` tinyint(4) NOT NULL DEFAULT '1',
  `sitemap` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_modules`
--

INSERT INTO `hn4_vi_modules` (`title`, `module_file`, `module_data`, `module_upload`, `module_theme`, `custom_title`, `site_title`, `admin_title`, `set_time`, `main_file`, `admin_file`, `theme`, `mobile`, `description`, `keywords`, `groups_view`, `weight`, `act`, `admins`, `rss`, `sitemap`) VALUES
('about', 'page', 'about', 'about', 'page', 'Giới thiệu', '', '', 1675986735, 1, 1, '', '', '', '', '6', 1, 1, '', 1, 1),
('zalo', 'zalo', 'zalo', 'zalo', 'zalo', 'Zalo', '', 'Zalo', 1675986735, 0, 1, '', '', '', '', '3', 2, 1, '', 0, 0),
('news', 'news', 'news', 'news', 'news', 'Tin Tức', '', '', 1675986735, 1, 1, '', '', '', '', '6', 3, 1, '', 1, 1),
('users', 'users', 'users', 'users', 'users', 'Tài khoản người dùng', '', 'Tài khoản', 1675986735, 1, 1, '', '', '', '', '6', 4, 1, '', 0, 1),
('myapi', 'myapi', 'myapi', 'myapi', 'myapi', 'API của tôi', '', '', 1675986735, 1, 1, '', '', '', '', '6', 5, 1, '', 0, 0),
('push', 'push', 'push', 'push', 'push', 'Thông báo đẩy', '', '', 1675986735, 1, 1, '', '', '', '', '4', 6, 1, '', 0, 0),
('contact', 'contact', 'contact', 'contact', 'contact', 'Liên hệ', '', '', 1675986735, 1, 1, '', '', '', '', '6', 7, 1, '', 0, 1),
('statistics', 'statistics', 'statistics', 'statistics', 'statistics', 'Thống kê', '', '', 1675986735, 1, 1, '', '', '', 'online, statistics', '6', 8, 1, '', 0, 1),
('voting', 'voting', 'voting', 'voting', 'voting', 'Thăm dò ý kiến', '', '', 1675986735, 1, 1, '', '', '', '', '6', 9, 1, '', 1, 1),
('banners', 'banners', 'banners', 'banners', 'banners', 'Quảng cáo', '', '', 1675986735, 1, 1, '', '', '', '', '6', 10, 1, '', 0, 1),
('seek', 'seek', 'seek', 'seek', 'seek', 'Tìm kiếm', '', '', 1675986735, 1, 0, '', '', '', '', '6', 11, 1, '', 0, 1),
('menu', 'menu', 'menu', 'menu', 'menu', 'Menu Site', '', '', 1675986735, 0, 1, '', '', '', '', '6', 12, 1, '', 0, 1),
('feeds', 'feeds', 'feeds', 'feeds', 'feeds', 'RSS-feeds', '', '', 1675986735, 1, 1, '', '', '', '', '6', 13, 1, '', 0, 1),
('page', 'page', 'page', 'page', 'page', 'Page', '', '', 1675986735, 1, 1, '', '', '', '', '6', 14, 1, '', 1, 0),
('comment', 'comment', 'comment', 'comment', 'comment', 'Bình luận', '', 'Quản lý bình luận', 1675986735, 0, 1, '', '', '', '', '6', 15, 1, '', 0, 1),
('siteterms', 'page', 'siteterms', 'siteterms', 'page', 'Điều khoản sử dụng', '', '', 1675986735, 1, 1, '', '', '', '', '6', 16, 1, '', 1, 1),
('freecontent', 'freecontent', 'freecontent', 'freecontent', 'freecontent', 'Giới thiệu sản phẩm', '', '', 1675986735, 0, 1, '', '', '', '', '6', 17, 1, '', 0, 1),
('two-step-verification', 'two-step-verification', 'two_step_verification', 'two_step_verification', 'two-step-verification', 'Xác thực hai bước', '', '', 1675986735, 1, 0, '', '', '', '', '6', 18, 1, '', 0, 1),
('shops', 'shops', 'shops', 'shops', 'shops', 'Sản phẩm', '', '', 1677353388, 1, 1, '', '', '', '', '6', 19, 1, '', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_1`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hn4_vi_news_1`
--

INSERT INTO `hn4_vi_news_1` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,5,7', 0, 1, 'Quỳnh Nhi', 1, 1274989177, 1275318126, 1, 1, 1274989140, 0, 2, 'Ra mắt công ty mã nguồn mở đầu tiên tại Việt Nam', 'Ra-mat-cong-ty-ma-nguon-mo-dau-tien-tai-Viet-Nam', 'Mã nguồn mở NukeViet vốn đã quá quen thuộc với cộng đồng CNTT Việt Nam trong mấy năm qua. Tuy chưa hoạt động chính thức, nhưng chỉ trong khoảng 5 năm gần đây, mã nguồn mở NukeViet đã được dùng phổ biến ở Việt Nam, áp dụng ở hầu hết các lĩnh vực, từ tin tức đến thương mại điện tử, từ các website cá nhân cho tới những hệ thống website doanh nghiệp.', 'nangly.jpg', 'Thành lập VINADES.,JSC', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(6, 1, '1,6', 0, 1, '', 3, 1322685920, 1322686042, 1, 2, 1322685920, 0, 2, 'Mã nguồn mở NukeViet giành giải ba Nhân tài đất Việt 2011', 'Ma-nguon-mo-NukeViet-gianh-giai-ba-Nhan-tai-dat-Viet-2011', 'Không có giải nhất và giải nhì, sản phẩm Mã nguồn mở NukeViet của VINADES.,JSC là một trong ba sản phẩm đã đoạt giải ba Nhân tài đất Việt 2011 - Lĩnh vực Công nghệ thông tin (Sản phẩm đã ứng dụng rộng rãi).', 'nukeviet-nhantaidatviet2011.jpg', 'Mã nguồn mở NukeViet giành giải ba Nhân tài đất Việt 2011', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0),
(7, 1, '1', 0, 1, '', 4, 1445309676, 1445309676, 1, 3, 1445309520, 0, 2, 'NukeViet được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước', 'nukeviet-duoc-uu-tien-mua-sam-su-dung-trong-co-quan-to-chuc-nha-nuoc', 'Ngày 5/12/2014, Bộ trưởng Bộ TT&TT Nguyễn Bắc Son đã ký ban hành Thông tư 20/2014/TT-BTTTT (Thông tư 20) quy định về các sản phẩm phần mềm nguồn mở (PMNM) được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước. NukeViet (phiên bản 3.4.02 trở lên) là phần mềm được nằm trong danh sách này.', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', 'NukeViet được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước', 1, 1, '4', 1, 0, 2, 0, 0, 0, 0, '', 0),
(9, 1, '1,4', 0, 1, 'Trần Thị Thu', 0, 1445391118, 1445394180, 1, 7, 1445391060, 0, 2, 'Chương trình thực tập sinh tại công ty VINADES', 'chuong-trinh-thuc-tap-sinh-tai-cong-ty-vinades', 'Cơ hội để những sinh viên năng động được học tập, trải nghiệm, thử thách sớm với những tình huống thực tế, được làm việc cùng các chuyên gia có nhiều kinh nghiệm của công ty VINADES.', 'thuc-tap-sinh.jpg', '', 1, 1, '4', 1, 0, 0, 0, 0, 0, 0, '', 0),
(11, 1, '1', 0, 1, '', 0, 1445391182, 1445394133, 1, 9, 1445391120, 0, 2, 'NukeViet được Bộ GD&amp;ĐT đưa vào Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016', 'nukeviet-duoc-bo-gd-dt-dua-vao-huong-dan-thuc-hien-nhiem-vu-cntt-nam-hoc-2015-2016', 'Trong Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo, NukeViet được đưa vào các hạng mục: Tập huấn sử dụng phần mềm nguồn mở cho giáo viên và cán bộ quản lý giáo dục; Khai thác, sử dụng và dạy học; đặc biệt phần &quot;khuyến cáo khi sử dụng các hệ thống CNTT&quot; có chỉ rõ &quot;Không nên làm website mã nguồn đóng&quot; và &quot;Nên làm NukeViet: phần mềm nguồn mở&quot;.', 'nukeviet-cms.jpg', '', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0),
(12, 1, '1,3', 0, 1, '', 0, 1445391217, 1445393997, 1, 10, 1445391180, 0, 2, 'Hỗ trợ tập huấn và triển khai NukeViet cho các Phòng, Sở GD&amp;ĐT', 'ho-tro-tap-huan-va-trien-khai-nukeviet-cho-cac-phong-so-gd-dt', 'Trên cơ sở Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo, Công ty cổ phần phát triển nguồn mở Việt Nam và các doanh nghiệp phát triển NukeViet trong cộng đồng NukeViet đang tích cực công tác hỗ trợ cho các phòng GD&ĐT, Sở GD&ĐT triển khai 2 nội dung chính: Hỗ trợ công tác đào tạo tập huấn hướng dẫn sử dụng NukeViet và Hỗ trợ triển khai NukeViet cho các trường, Phòng và Sở GD&ĐT', 'tap-huan-pgd-ha-dong-2015.jpg', 'Tập huấn triển khai NukeViet tại Phòng Giáo dục và Đào tạo Hà Đông - Hà Nội', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0),
(2, 7, '1,7', 0, 1, 'Nguyễn Thế Hùng', 7, 1453192444, 1453192444, 1, 12, 1453192444, 0, 2, 'Hãy trở thành nhà cung cấp dịch vụ của NukeViet&#33;', 'hay-tro-thanh-nha-cung-cap-dich-vu-cua-nukeviet', 'Nếu bạn là công ty hosting, là công ty thiết kế web có sử dụng mã nguồn NukeViet, là cơ sở đào tạo NukeViet hay là công ty bất kỳ có kinh doanh dịch vụ liên quan đến NukeViet... hãy cho chúng tôi biết thông tin liên hệ của bạn để NukeViet hỗ trợ bạn trong công việc kinh doanh nhé!', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 14, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_2`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `hn4_vi_news_2`
--

INSERT INTO `hn4_vi_news_2` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(13, 2, '2', 0, 1, 'VINADES', 0, 1453194455, 1453194455, 1, 13, 1453194455, 0, 2, 'NukeViet 4.0 có gì mới?', 'nukeviet-4-0-co-gi-moi', 'NukeViet 4 là phiên bản NukeViet được cộng đồng đánh giá cao, hứa hẹn nhiều điểm vượt trội về công nghệ đến thời điểm hiện tại. NukeViet 4 thay đổi gần như hoàn toàn từ nhân hệ thống đến chức năng, giao diện người dùng. Vậy, có gì mới trong phiên bản này?', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', '', 1, 1, '4', 1, 0, 4, 0, 0, 0, 0, '', 0),
(14, 2, '2', 0, 1, 'VINADES', 0, 1501837620, 1501837620, 1, 14, 1501837620, 0, 2, 'NukeViet 4.2 có gì mới?', 'nukeviet-4-2-co-gi-moi', 'NukeViet 4.2 là phiên bản nâng cấp của phiên bản NukeViet 4.0 tập trung vào việc fix các vấn đề bất cập còn tồn tại của NukeViet 4.0, Thêm các tính năng mới để tăng cường bảo mật của hệ thống cũng như tối ưu trải nghiệm của người dùng.', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', '', 1, 1, '4', 1, 1, 2, 0, 0, 0, 0, '', 0),
(15, 2, '2', 0, 1, 'VINADES', 0, 1510215907, 1510215907, 1, 15, 1510215907, 0, 2, 'NukeViet 4.3 có gì mới?', 'nukeviet-4-3-co-gi-moi', 'NukeViet 4.3 là phiên bản nâng cấp của phiên bản NukeViet 4.2 tập trung vào việc fix các vấn đề bất cập còn tồn tại, tối ưu trải nghiệm của người dùng.', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', '', 1, 1, '4', 1, 1, 2, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_3`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `hn4_vi_news_3`
--

INSERT INTO `hn4_vi_news_3` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(12, 1, '1,3', 0, 1, '', 0, 1445391217, 1445393997, 1, 10, 1445391180, 0, 2, 'Hỗ trợ tập huấn và triển khai NukeViet cho các Phòng, Sở GD&amp;ĐT', 'ho-tro-tap-huan-va-trien-khai-nukeviet-cho-cac-phong-so-gd-dt', 'Trên cơ sở Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo, Công ty cổ phần phát triển nguồn mở Việt Nam và các doanh nghiệp phát triển NukeViet trong cộng đồng NukeViet đang tích cực công tác hỗ trợ cho các phòng GD&ĐT, Sở GD&ĐT triển khai 2 nội dung chính: Hỗ trợ công tác đào tạo tập huấn hướng dẫn sử dụng NukeViet và Hỗ trợ triển khai NukeViet cho các trường, Phòng và Sở GD&ĐT', 'tap-huan-pgd-ha-dong-2015.jpg', 'Tập huấn triển khai NukeViet tại Phòng Giáo dục và Đào tạo Hà Đông - Hà Nội', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_4`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=11 ;

--
-- Dumping data for table `hn4_vi_news_4`
--

INSERT INTO `hn4_vi_news_4` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(8, 4, '4', 0, 1, 'Vũ Bích Ngọc', 0, 1445391061, 1445394203, 1, 4, 1445391000, 0, 2, 'Công ty VINADES tuyển dụng nhân viên kinh doanh', 'cong-ty-vinades-tuyen-dung-nhan-vien-kinh-doanh', 'Công ty cổ phần phát triển nguồn mở Việt Nam là đơn vị chủ quản của phần mềm mã nguồn mở NukeViet - một mã nguồn được tin dùng trong cơ quan nhà nước, đặc biệt là ngành giáo dục. Chúng tôi cần tuyển 05 nhân viên kinh doanh cho lĩnh vực này.', 'tuyen-dung-nvkd.png', '', 1, 1, '4', 1, 0, 0, 0, 0, 0, 0, '', 0),
(4, 4, '4', 0, 1, 'Phạm Quốc Tiến', 0, 1445391089, 1445394192, 1, 5, 1445391060, 0, 2, 'Tuyển dụng chuyên viên đồ hoạ phát triển NukeViet', 'Tuyen-dung-chuyen-vien-do-hoa', 'Bạn đam mê nguồn mở? Bạn là chuyên gia đồ họa? Chúng tôi sẽ giúp bạn hiện thực hóa ước mơ của mình với một mức lương đảm bảo. Hãy gia nhập VINADES.,JSC để xây dựng mã nguồn mở hàng đầu cho Việt Nam.', 'tuyendung-kythuat.jpg', 'Tuyển dụng', 1, 1, '6', 1, 0, 0, 0, 0, 0, 0, '', 0),
(5, 4, '4', 0, 1, 'Phạm Quốc Tiến', 0, 1445391090, 1445394193, 1, 6, 1445391060, 0, 2, 'Tuyển dụng lập trình viên front-end (HTML/CSS/JS) phát triển NukeViet', 'Tuyen-dung-lap-trinh-vien-front-end-HTML-CSS-JS', 'Bạn đam mê nguồn mở? Bạn đang cần tìm một công việc phù hợp với thế mạnh của bạn về front-end (HTML/CSS/JS)? Hãy gia nhập VINADES.,JSC để xây dựng mã nguồn mở hàng đầu cho Việt Nam.', 'tuyendung-kythuat.jpg', 'Tuyển dụng', 1, 1, '6', 1, 0, 0, 0, 0, 0, 0, '', 0),
(9, 1, '1,4', 0, 1, 'Trần Thị Thu', 0, 1445391118, 1445394180, 1, 7, 1445391060, 0, 2, 'Chương trình thực tập sinh tại công ty VINADES', 'chuong-trinh-thuc-tap-sinh-tai-cong-ty-vinades', 'Cơ hội để những sinh viên năng động được học tập, trải nghiệm, thử thách sớm với những tình huống thực tế, được làm việc cùng các chuyên gia có nhiều kinh nghiệm của công ty VINADES.', 'thuc-tap-sinh.jpg', '', 1, 1, '4', 1, 0, 0, 0, 0, 0, 0, '', 0),
(10, 4, '4', 0, 1, 'Trần Thị Thu', 0, 1445391135, 1445394444, 1, 8, 1445391120, 0, 2, 'Học việc tại công ty VINADES', 'hoc-viec-tai-cong-ty-vinades', 'Công ty cổ phần phát triển nguồn mở Việt Nam tạo cơ hội việc làm và học việc miễn phí cho những ứng viên có đam mê thiết kế web, lập trình PHP… được học tập và rèn luyện cùng đội ngũ lập trình viên phát triển NukeViet.', 'hoc-viec-tai-cong-ty-vinades.jpg', '', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0),
(3, 4, '4', 0, 1, 'Phạm Quốc Tiến', 2, 1453192400, 1453192400, 1, 11, 1453192400, 0, 2, 'Tuyển dụng lập trình viên PHP phát triển NukeViet', 'Tuyen-dung-lap-trinh-vien-PHP', 'Bạn đam mê nguồn mở? Bạn đang cần tìm một công việc phù hợp với thế mạnh của bạn về PHP và MySQL? Hãy gia nhập VINADES.,JSC để xây dựng mã nguồn mở hàng đầu cho Việt Nam.', 'tuyendung-kythuat.jpg', 'Tuyển dụng', 1, 1, '6', 1, 0, 0, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_5`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hn4_vi_news_5`
--

INSERT INTO `hn4_vi_news_5` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,5,7', 0, 1, 'Quỳnh Nhi', 1, 1274989177, 1275318126, 1, 1, 1274989140, 0, 2, 'Ra mắt công ty mã nguồn mở đầu tiên tại Việt Nam', 'Ra-mat-cong-ty-ma-nguon-mo-dau-tien-tai-Viet-Nam', 'Mã nguồn mở NukeViet vốn đã quá quen thuộc với cộng đồng CNTT Việt Nam trong mấy năm qua. Tuy chưa hoạt động chính thức, nhưng chỉ trong khoảng 5 năm gần đây, mã nguồn mở NukeViet đã được dùng phổ biến ở Việt Nam, áp dụng ở hầu hết các lĩnh vực, từ tin tức đến thương mại điện tử, từ các website cá nhân cho tới những hệ thống website doanh nghiệp.', 'nangly.jpg', 'Thành lập VINADES.,JSC', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_6`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `hn4_vi_news_6`
--

INSERT INTO `hn4_vi_news_6` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(6, 1, '1,6', 0, 1, '', 3, 1322685920, 1322686042, 1, 2, 1322685920, 0, 2, 'Mã nguồn mở NukeViet giành giải ba Nhân tài đất Việt 2011', 'Ma-nguon-mo-NukeViet-gianh-giai-ba-Nhan-tai-dat-Viet-2011', 'Không có giải nhất và giải nhì, sản phẩm Mã nguồn mở NukeViet của VINADES.,JSC là một trong ba sản phẩm đã đoạt giải ba Nhân tài đất Việt 2011 - Lĩnh vực Công nghệ thông tin (Sản phẩm đã ứng dụng rộng rãi).', 'nukeviet-nhantaidatviet2011.jpg', 'Mã nguồn mở NukeViet giành giải ba Nhân tài đất Việt 2011', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_7`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_vi_news_7`
--

INSERT INTO `hn4_vi_news_7` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,5,7', 0, 1, 'Quỳnh Nhi', 1, 1274989177, 1275318126, 1, 1, 1274989140, 0, 2, 'Ra mắt công ty mã nguồn mở đầu tiên tại Việt Nam', 'Ra-mat-cong-ty-ma-nguon-mo-dau-tien-tai-Viet-Nam', 'Mã nguồn mở NukeViet vốn đã quá quen thuộc với cộng đồng CNTT Việt Nam trong mấy năm qua. Tuy chưa hoạt động chính thức, nhưng chỉ trong khoảng 5 năm gần đây, mã nguồn mở NukeViet đã được dùng phổ biến ở Việt Nam, áp dụng ở hầu hết các lĩnh vực, từ tin tức đến thương mại điện tử, từ các website cá nhân cho tới những hệ thống website doanh nghiệp.', 'nangly.jpg', 'Thành lập VINADES.,JSC', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(2, 7, '1,7', 0, 1, 'Nguyễn Thế Hùng', 7, 1453192444, 1453192444, 1, 12, 1453192444, 0, 2, 'Hãy trở thành nhà cung cấp dịch vụ của NukeViet&#33;', 'hay-tro-thanh-nha-cung-cap-dich-vu-cua-nukeviet', 'Nếu bạn là công ty hosting, là công ty thiết kế web có sử dụng mã nguồn NukeViet, là cơ sở đào tạo NukeViet hay là công ty bất kỳ có kinh doanh dịch vụ liên quan đến NukeViet... hãy cho chúng tôi biết thông tin liên hệ của bạn để NukeViet hỗ trợ bạn trong công việc kinh doanh nhé!', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 14, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_admins`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_admins` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) NOT NULL DEFAULT '0',
  `admin` tinyint(4) NOT NULL DEFAULT '0',
  `add_content` tinyint(4) NOT NULL DEFAULT '0',
  `pub_content` tinyint(4) NOT NULL DEFAULT '0',
  `edit_content` tinyint(4) NOT NULL DEFAULT '0',
  `del_content` tinyint(4) NOT NULL DEFAULT '0',
  `app_content` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`,`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_author`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_author` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pseudonym` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `numnews` mediumint(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_authorlist`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_authorlist` (
  `id` int(11) NOT NULL,
  `aid` mediumint(8) NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pseudonym` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `id_aid` (`id`,`aid`),
  KEY `aid` (`aid`),
  KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_block`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_block` (
  `bid` smallint(5) unsigned NOT NULL,
  `id` int(11) unsigned NOT NULL,
  `weight` int(11) unsigned NOT NULL,
  UNIQUE KEY `bid` (`bid`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_news_block`
--

INSERT INTO `hn4_vi_news_block` (`bid`, `id`, `weight`) VALUES
(1, 1, 1),
(2, 12, 1),
(2, 11, 2),
(2, 10, 3),
(2, 9, 4),
(2, 8, 5),
(2, 7, 6),
(2, 1, 7),
(2, 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_block_cat`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_block_cat` (
  `bid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `adddefault` tinyint(4) NOT NULL DEFAULT '0',
  `numbers` smallint(5) NOT NULL DEFAULT '10',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(5) NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_vi_news_block_cat`
--

INSERT INTO `hn4_vi_news_block_cat` (`bid`, `adddefault`, `numbers`, `title`, `alias`, `image`, `description`, `weight`, `keywords`, `add_time`, `edit_time`) VALUES
(1, 0, 4, 'Tin tiêu điểm', 'Tin-tieu-diem', '', 'Tin tiêu điểm', 1, '', 1279945710, 1279956943),
(2, 1, 4, 'Tin mới nhất', 'Tin-moi-nhat', '', 'Tin mới nhất', 2, '', 1279945725, 1279956445);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_cat`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_cat` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titlesite` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `descriptionhtml` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `viewdescription` tinyint(2) NOT NULL DEFAULT '0',
  `weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(5) NOT NULL DEFAULT '0',
  `lev` smallint(5) NOT NULL DEFAULT '0',
  `viewcat` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'viewcat_page_new',
  `numsubcat` smallint(5) NOT NULL DEFAULT '0',
  `subcatid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `numlinks` tinyint(2) unsigned NOT NULL DEFAULT '3',
  `newday` tinyint(2) unsigned NOT NULL DEFAULT '2',
  `featured` int(11) NOT NULL DEFAULT '0',
  `ad_block_cat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `admins` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` smallint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`catid`),
  UNIQUE KEY `alias` (`alias`),
  KEY `parentid` (`parentid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `hn4_vi_news_cat`
--

INSERT INTO `hn4_vi_news_cat` (`catid`, `parentid`, `title`, `titlesite`, `alias`, `description`, `descriptionhtml`, `image`, `viewdescription`, `weight`, `sort`, `lev`, `viewcat`, `numsubcat`, `subcatid`, `numlinks`, `newday`, `featured`, `ad_block_cat`, `keywords`, `admins`, `add_time`, `edit_time`, `groups_view`, `status`) VALUES
(1, 0, 'Tin tức', '', 'Tin-tuc', '', '', '', 0, 1, 1, 0, 'viewcat_main_right', 3, '5,6,7', 4, 2, 0, '', '', '', 1274986690, 1274986690, '6', 1),
(2, 0, 'Sản phẩm', '', 'San-pham', '', '', '', 0, 2, 5, 0, 'viewcat_page_new', 0, '', 4, 2, 0, '', '', '', 1274986705, 1274986705, '6', 1),
(3, 0, 'Đối tác', '', 'Doi-tac', '', '', '', 0, 3, 9, 0, 'viewcat_page_new', 0, '', 4, 2, 0, '', '', '', 1274987460, 1274987460, '6', 1),
(4, 0, 'Tuyển dụng', '', 'Tuyen-dung', '', '', '', 0, 4, 12, 0, 'viewcat_page_new', 0, '', 4, 2, 0, '', '', '', 1274987538, 1274987538, '6', 1),
(5, 1, 'Thông cáo báo chí', '', 'thong-cao-bao-chi', '', '', '', 0, 1, 2, 1, 'viewcat_page_new', 0, '', 4, 2, 0, '', '', '', 1274987105, 1274987244, '6', 1),
(6, 1, 'Tin công nghệ', '', 'Tin-cong-nghe', '', '', '', 0, 3, 4, 1, 'viewcat_page_new', 0, '', 4, 2, 0, '', '', '', 1274987212, 1274987212, '6', 1),
(7, 1, 'Bản tin nội bộ', '', 'Ban-tin-noi-bo', '', '', '', 0, 2, 3, 1, 'viewcat_page_new', 0, '', 4, 2, 0, '', '', '', 1274987902, 1274987902, '6', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_config_post`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_config_post` (
  `group_id` smallint(5) NOT NULL,
  `addcontent` tinyint(4) NOT NULL,
  `postcontent` tinyint(4) NOT NULL,
  `editcontent` tinyint(4) NOT NULL,
  `delcontent` tinyint(4) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_detail`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_detail` (
  `id` int(11) unsigned NOT NULL,
  `titlesite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyhtml` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `voicedata` text COLLATE utf8mb4_unicode_ci COMMENT 'Data giọng đọc json',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourcetext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `files` text COLLATE utf8mb4_unicode_ci,
  `imgposition` tinyint(1) NOT NULL DEFAULT '1',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `copyright` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_send` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_print` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_save` tinyint(1) NOT NULL DEFAULT '0',
  `auto_nav` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_news_detail`
--

INSERT INTO `hn4_vi_news_detail` (`id`, `titlesite`, `description`, `bodyhtml`, `voicedata`, `keywords`, `sourcetext`, `files`, `imgposition`, `layout_func`, `copyright`, `allowed_send`, `allowed_print`, `allowed_save`, `auto_nav`) VALUES
(1, '', '', '<p>Để chuyên nghiệp hóa việc phát hành mã nguồn mở NukeViet, Ban quản trị NukeViet quyết định thành lập doanh nghiệp chuyên quản NukeViet mang tên Công ty cổ phần Phát triển nguồn mở Việt Nam (Viết tắt là VINADES.,JSC), chính thức ra mắt vào ngày 25-2-2010 (trụ sở tại Hà Nội) nhằm phát triển, phổ biến hệ thống NukeViet tại Việt Nam.<br /> <br /> Theo ông Nguyễn Anh Tú, Chủ tịch HĐQT VINADES, công ty sẽ phát triển bộ mã nguồn NukeViet nhất quán theo con đường mã nguồn mở đã chọn, chuyên nghiệp và quy mô hơn bao giờ hết. Đặc biệt là hoàn toàn miễn phí đúng tinh thần mã nguồn mở quốc tế.<br /> <br /> NukeViet là một hệ quản trị nội dung mã nguồn mở (Opensource Content Management System) thuần Việt từ nền tảng PHP-Nuke và cơ sở dữ liệu MySQL. Người sử dụng thường gọi NukeViet là portal vì nó có khả năng tích hợp nhiều ứng dụng trên nền web, cho phép người sử dụng có thể dễ dàng xuất bản và quản trị các nội dung của họ lên internet hoặc intranet.<br /> <br /> NukeViet cung cấp nhiều dịch vụ và ứng dụng nhờ khả năng tăng cường tính năng thêm các module, block... tạo sự dễ dàng cài đặt, quản lý, ngay cả với những người mới tiếp cận với website. Người dùng có thể tìm hiểu thêm thông tin và tải về sản phẩm tại địa chỉ http://nukeviet.vn</p><blockquote> <p> <em>Thông tin ra mắt công ty VINADES có thể tìm thấy trên trang 7 báo Hà Nội Mới ra ngày 25/02/2010 (<a href="http://hanoimoi.com.vn/newsdetail/Cong_nghe/309750/ra-mat-cong-ty-ma-nguon-mo-dau-tien-tai-viet-nam.htm" target="_blank">xem chi tiết</a>), Bản tin tiếng Anh của đài tiếng nói Việt Nam ngày 26/02/2010 (<a href="http://english.vovnews.vn/Home/First-opensource-company-starts-operation/20102/112960.vov" target="_blank">xem chi tiết</a>); trang 7 báo An ninh Thủ Đô số 2858 ra vào thứ 2 ngày 01/03/2010 và các trang tin tức, báo điện tử khác.</em></p></blockquote>', NULL, '', 'http://hanoimoi.com.vn/newsdetail/Cong_nghe/309750/ra-mat-cong-ty-ma-nguon-mo-dau-tien-tai-viet-nam.htm', NULL, 2, '', 0, 1, 1, 1, 0),
(2, '', '', '<div>Tính đến năm 2015, ước tính có hơn 10.000 website đang sử dụng NukeViet. Nhu cầu triển khai NukeViet không chỉ dừng lại ở các cá nhân, doanh nghiệp, cơ sở giáo dục mà đã lan rộng ra khối chính phủ.</div><div><br  />Cộng đồng NukeViet cũng đã lớn mạnh hơn trước. Nếu như đầu năm 2010, ngoài Công ty VINADES chỉ có một vài công ty cung cấp dịch vụ cho NukeViet nhưng không chuyên, thì theo thống kê năm 2015 đã có hàng trăm doanh nghiệp đang cung cấp dịch vụ có liên quan đến NukeViet như: đào tạo NukeViet, thiết kế web, phát triển phần mềm, cung cấp giao diện, module... trên nền tảng NukeViet. Đặc biệt có nhiều doanh nghiệp hoàn toàn cung cấp dịch vụ thiết kế web, cung cấp giao diện, module... sử dụng nền tảng NukeViet. Nhiều sản phẩm phái sinh từ NukeViet đã ra đời, NukeViet được phát triển thành nhiều phần mềm quản lý sử dụng trên mạng LAN hay trên internet, được phát triển thành các phần mềm dùng riêng hay sử dụng như một nền tảng để cung cấp dịch vụ online, thậm chí đã được thử nghiệm tích hợp vào trong các thiết bị phần cứng để bán cùng thiết bị (NukeViet Captive Portal - dùng để quản lý người dùng truy cập internet, tích hợp trong thiết bị quản lý wifi)...<br  /><br  />Tuy nhiên, cùng với những cơ hội, cộng đồng NukeViet đang đứng trước một thách thức mới. NukeViet cần tập hợp tất cả các doanh nghiệp, tổ chức và cá nhân đang cung cấp dịch vụ cho NukeViet và liên kết các đơn vị này với nhau để giúp nhau chuyên nghiệp hóa, cùng nhau chia sẻ những cơ hội kinh doanh và trở lên lớn mạnh hơn.<br  /><br  />Nếu cộng đồng NukeViet có 500 công ty siêu nhỏ chỉ 2-3 người và những công ty này đứng riêng rẽ như hiện nay thì NukeViet mãi bé nhỏ và sẽ không làm được việc gì. Nhưng nếu 500 công ty này biết nhau, cùng làm một số việc, cùng tham gia phát triển NukeViet, đó sẽ là sức mạnh rất lớn cho một phần mềm nguồn mở như NukeViet, và đó cũng là cơ hội rất lớn để các công ty nhỏ ấy trở lên chuyên nghiệp và vững mạnh.<br  /><br  />Cho dù bạn là doanh nghiệp hay một nhóm kinh doanh, cho dù bạn đang cung cấp bất kỳ dịch vụ có liên quan trực tiếp đến NukeViet như: đào tạo NukeViet, thiết kế web, phát triển phần mềm, cung cấp giao diện, module... hoặc gián tiếp có liên quan đến NukeViet (ví dụ các công ty hosting, các nhà cung cấp dịch vụ thanh toán điện tử...). Bạn đều là một thành phần quan trọng của NukeViet. Dù bạn là công ty to hay một nhóm nhỏ, hãy đăng ký vào danh sách các đối tác của NukeViet để thiết lập kênh liên lạc với các doanh nghiệp khác trong cộng đồng NukeViet và nhận sự hỗ trợ từ Ban Quản Trị NukeViet cũng như từ các cơ quan nhà nước đang có nhu cầu tìm kiếm các đơn vị cung ứng dịch vụ cho NukeViet.<br  /><br  />Hãy gửi email cho Ban Quản Trị NukeViet về địa chỉ: admin@nukeviet.vn để đăng ký vào danh sách các đơn vị hỗ trợ NukeViet.<br  /><br  />Tiêu đề email: Đăng ký vào danh sách các đơn vị cung cấp dịch vụ dựa trên NukeViet<br  />Nội dung email: Thông tin về đơn vị, dịch vụ cung cấp.<br  /><br  />Hoặc gửi yêu cầu tại đây: <a href="http://nukeviet.vn/vi/contact/" target="_blank">http://nukeviet.vn/vi/contact/</a><br  /><br  />Mọi yêu cầu sẽ được phản hồi trong vòng 24h. Trường hợp không nhận được phản hồi, hãy liên hệ với Ban Quản Trị NukeViet qua các kênh liên lạc khác như:<br  /><br  />- Diễn đàn doanh nghiệp NukeViet: <a href="http://forum.nukeviet.vn/viewforum.php?f=4" target="_blank">http://forum.nukeviet.vn/viewforum.php?f=4</a><br  />- Fanpage NukeViet trên FaceBook: <a href="http://fb.com/nukeviet/" target="_blank">http://fb.com/nukeviet/</a><br  /><br  />Vui lòng truy cập địa chỉ sau để xem danh sách các đơn vị: <a href="https://nukeviet.vn/vi/partner/" target="_blank">https://nukeviet.vn/vi/partner/</a></div>', NULL, '', 'http://vinades.vn/vi/news/thong-cao-bao-chi/Thu-moi-hop-tac-6/', NULL, 2, '', 0, 1, 1, 1, 0),
(3, '', '', 'Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC) đang thu hút tuyển dụng nhân tài ở các vị trí:<ol><li><a href="/Tuyen-dung/Tuyen-dung-lap-trinh-vien-PHP-7.html">Lập trình viên PHP và MySQL.</a></li><li><a href="/Tuyen-dung/Tuyen-dung-lap-trinh-vien-front-end-HTML-CSS-JS-9.html">Lập trình viên front-end (HTML/CSS/JS).</a></li><li><a href="/Tuyen-dung/Tuyen-dung-chuyen-vien-do-hoa-8.html">Chuyên Viên Đồ Hoạ.</a></li></ol><br />Tại VINADES.,JSC bạn sẽ được tham gia các dự án của công ty, tham gia xây dựng và phát triển bộ nhân hệ thống NukeViet, được học hỏi và trau dồi nâng cao kiến thức và kỹ năng cá nhân. Ngoài ra, nếu bạn đam mê về nguồn mở và có mong muốn cống hiến cho quá trình phát triển nguồn mở của Việt Nam nói riêng và của thế giới nói chung, thì đây là cơ hội lớn nhất để bạn đạt được mong muốn của mình. Tham gia công tác tại công ty là bạn đã góp phần xây dựng một cộng đồng nguồn mở chuyên nghiệp cho Việt Nam để vươn xa ra thế giới.<br /><br /><span style="font-size:16px;"><strong>1. Vị trí dự tuyển:</strong></span> Lập trình viên PHP và MySQL<br /><br /><span style="font-size:16px;"><strong>2. Mô tả công việc:</strong></span><ul><li>Phát triển hệ thống NukeViet.</li><li>Phân tích yêu cầu và lập trình riêng cho các dự án cụ thể.</li><li>Thực hiện các công đoạn để dưa website vào hoạt động như upload dữ liệu lên host, xử lý lỗi, sự cố liên quan.</li><li>Chịu trách nhiệm về chất lượng, trải nghiệm người dùng của sản phẩm trong khi sản phẩm hoạt động.</li><li>Thực hiện các công việc theo sự phân công của cấp trên.</li><li>Chịu trách nhiệm về chất lượng và tiến độ công việc.</li></ul><br /><span style="font-size:16px;"><strong>3. Yêu cầu:</strong></span><ul><li>Nắm vững kiến thức hướng đối tượng, cấu trúc dữ liệu và giải thuật.</li><li>Có kinh nghiệm về PHP và các hệ cơ sở dữ liệu MySQL.…</li><li>Tư duy lập trình tốt, thiết kế CSDL chuẩn, biết xử lý nhanh các vấn đề khi phát sinh nghiệp vụ mới.</li><li>Sửa được các lỗi, nâng cấp tính năng cho các module đã có. 6. Viết module mới.</li><li>Biết đưa website lên host, xử lý lỗi, sự cố liên quan.</li><li>Chịu trách nhiệm về chất lượng và tiến độ công việc phụ trách.</li><li>Khả năng sáng tạo.</li><li>Đam mê công việc về lập trình web.</li></ul><br /><em><strong>Ưu tiên các ứng viên:</strong></em><ul><li>Có kiến thức cơ bản về quản trị website NukeViệt.</li><li>Sử dụng và nắm rõ các tính năng, block thường dùng của NukeViet.</li><li>Biết sử dụng git để quản lý source code (nếu ứng viên chưa biết công ty sẽ đào tạo thêm).</li><li>Có khả năng giao tiếp với khách hàng (Trực tiếp, điện thoại, email).</li><li>Có khả năng làm việc độc lập và làm việc theo nhóm.</li><li>Có tinh thần trách nhiệm cao và chủ động trong công việc.</li><li>Có khả năng trình bày ý tưởng.</li></ul><br /><span style="font-size:16px;"><strong>4. Quyền lợi:</strong></span><ul><li>Lương thoả thuận, trả qua ATM.</li><li>Thưởng theo dự án, các ngày lễ tết.</li><li>Hưởng các chế độ khác theo quy định của công ty và pháp luật: Bảo hiểm y tế, bảo hiểm xã hội...</li></ul><br /><span style="font-size:16px;"><strong>5. Thời gian làm việc:</strong></span> Toàn thời gian cố định hoặc làm online.<br /><br /><span style="font-size:16px;"><strong>6. Hạn nộp hồ sơ:</strong></span> Không hạn chế, vui lòng kiểm tra tại <a href="http://vinades.vn/vi/news/Tuyen-dung/">http://vinades.vn/vi/news/Tuyen-dung/</a><br /><br /><span style="font-size:16px;"><strong>7. Cách thức đăng ký dự tuyển:</strong></span> Làm Hồ sơ xin việc<em><strong> (download tại đây: <strong><a href="http://vinades.vn/vi/download/Tai-lieu/Ban-khai-so-yeu-ly-lich-ky-thuat-vien/" target="_blank"><u>Mẫu lý lịch ứng viên</u></a></strong>)</strong></em> và gửi về hòm thư <a href="mailto:tuyendung@vinades.vn">tuyendung@vinades.vn</a><br /><br /><span style="font-size:16px;"><strong>8. Hồ sơ bao gồm:</strong></span><ul><li>Đơn xin việc: Tự biên soạn.</li><li>Thông tin ứng viên: Theo mẫu của VINADES.,JSC</li></ul>&nbsp;<p><strong>Chi tiết vui lòng tham khảo tại:</strong> <a href="http://vinades.vn/vi/news/Tuyen-dung/" target="_blank">http://vinades.vn/vi/news/Tuyen-dung/</a><br /><br /><strong>Mọi thắc mắc vui lòng liên hệ:</strong></p><blockquote><p><strong>Công ty cổ phần phát triển nguồn mở Việt Nam.</strong><br />Trụ sở chính: Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.</p><div>- Tel: +84-24-85872007 - Fax: +84-24-35500914<br />- Email: <a href="mailto:contact@vinades.vn">contact@vinades.vn</a> - Website: <a href="http://www.vinades.vn/">http://www.vinades.vn</a></div></blockquote>', NULL, '', 'http://vinades.vn/vi/news/Tuyen-dung/', NULL, 2, '', 0, 1, 1, 1, 0),
(4, '', '', 'Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC) đang thu hút tuyển dụng nhân tài ở các vị trí:<ol><li><a href="/Tuyen-dung/Tuyen-dung-lap-trinh-vien-PHP-7.html">Lập trình viên PHP và MySQL.</a></li><li><a href="/Tuyen-dung/Tuyen-dung-lap-trinh-vien-front-end-HTML-CSS-JS-9.html">Lập trình viên front-end (HTML/CSS/JS).</a></li><li><a href="/Tuyen-dung/Tuyen-dung-chuyen-vien-do-hoa-8.html">Chuyên Viên Đồ Hoạ.</a></li></ol><br />Tại VINADES.,JSC bạn sẽ được tham gia các dự án của công ty, tham gia xây dựng và phát triển bộ nhân hệ thống NukeViet, được học hỏi và trau dồi nâng cao kiến thức và kỹ năng cá nhân. Ngoài ra, nếu bạn đam mê về nguồn mở và có mong muốn cống hiến cho quá trình phát triển nguồn mở của Việt Nam nói riêng và của thế giới nói chung, thì đây là cơ hội lớn nhất để bạn đạt được mong muốn của mình. Tham gia công tác tại công ty là bạn đã góp phần xây dựng một cộng đồng nguồn mở chuyên nghiệp cho Việt Nam để vươn xa ra thế giới.<br /><br /><span style="font-size:16px;"><strong>1. Vị trí dự tuyển:</strong></span> Chuyên viên đồ hoạ.<br /><br /><span style="font-size:16px;"><strong>2. Mô tả công việc:</strong></span><br /><br /><em><strong>Công việc chính:</strong></em><ul><li>Thiết kế layout, banner, logo website theo yêu cầu của dự án.</li><li>Đưa ra sản phẩm sáng tạo dựa trên ý tưởng của khách hàng.</li><li>Thực hiện các công việc theo sự phân công của cấp trên.</li><li>Chịu trách nhiệm về chất lượng và tiến độ công việc.</li></ul><br /><em><strong>Ngoài ra bạn cần có khả năng thực hiện các công việc sau:</strong></em><ul><li>Cắt và ghép giao diện cho hệ thống.</li><li>Valid CSS, xHTML.</li></ul><br /><span style="font-size:16px;"><strong>3. Yêu cầu:</strong></span><ul><li>Sử dụng thành thạo phần mềm thiết kế: Photoshop ngoài ra cần biết cách sử dụng các phần mềm thiết kế khác là một lợi thế.</li><li>Có kiến thức cơ bản về thiết kế website: Am hiểu các dạng layout, thành phần của một website.</li><li>Có kinh nghiệm, kỹ năng thiết kế giao diện web, logo, banner.</li><li>Chịu trách nhiệm về chất lượng và tiến độ công việc phụ trách.</li><li>Khả năng sáng tạo, tính thẩm mỹ tốt</li><li>Đam mê công việc thiết kế và website.</li></ul><br /><em><strong>Ưu tiên các ứng viên:</strong></em><ul><li>Có kiến thức cơ bản về quản trị website NukeViệt</li><li>Am hiểu về Responsive và có thể thiết kế giao diện, layout trên mobile (Boostrap).</li><li>Sử dụng và nắm rõ các tính năng, block thường dùng của NukeViet.</li><li>Biết sử dụng git để quản lý source code (nếu ứng viên chưa biết công ty sẽ đào tạo thêm).</li><li>Sử dụng thành thạo HTML5, CSS3 &amp; Javascrip/Jquery và Xtemplate</li><li>Khả năng chuyển PSD sang NukeViet tốt.</li><li>Hiểu rõ và nắm chắc cách làm Theme/Template.</li><li>Có khả năng giao tiếp với khách hàng (Trực tiếp, điện thoại, email).</li><li>Có khả năng làm việc độc lập và làm việc theo nhóm.</li><li>Có tinh thần trách nhiệm cao và chủ động trong công việc.</li><li>Có khả năng trình bày ý tưởng</li></ul><br /><span style="font-size:16px;"><strong>4. Quyền lợi:</strong></span><ul><li>Lương thoả thuận, trả qua ATM.</li><li>Thưởng theo dự án, các ngày lễ tết.</li><li>Hưởng các chế độ khác theo quy định của công ty và pháp luật: Bảo hiểm y tế, bảo hiểm xã hội...</li></ul><br /><span style="font-size:16px;"><strong>5. Thời gian làm việc:</strong></span> Toàn thời gian cố định hoặc làm online.<br /><br /><span style="font-size:16px;"><strong>6. Hạn nộp hồ sơ:</strong></span> Không hạn chế, vui lòng kiểm tra tại <a href="http://vinades.vn/vi/news/Tuyen-dung/">http://vinades.vn/vi/news/Tuyen-dung/</a><br /><br /><span style="font-size:16px;"><strong>7. Cách thức đăng ký dự tuyển:</strong></span> Làm Hồ sơ xin việc<em><strong> (download tại đây: <strong><a href="http://vinades.vn/vi/download/Tai-lieu/Ban-khai-so-yeu-ly-lich-ky-thuat-vien/" target="_blank"><u>Mẫu lý lịch ứng viên</u></a></strong>)</strong></em> và gửi về hòm thư <a href="mailto:tuyendung@vinades.vn">tuyendung@vinades.vn</a><br /><br /><span style="font-size:16px;"><strong>8. Hồ sơ bao gồm:</strong></span><ul><li>Đơn xin việc: Tự biên soạn.</li><li>Thông tin ứng viên: Theo mẫu của VINADES.,JSC</li></ul>&nbsp;<p><strong>Chi tiết vui lòng tham khảo tại:</strong> <a href="http://vinades.vn/vi/news/Tuyen-dung/" target="_blank">http://vinades.vn/vi/news/Tuyen-dung/</a><br /><br /><strong>Mọi thắc mắc vui lòng liên hệ:</strong></p><blockquote><p><strong>Công ty cổ phần phát triển nguồn mở Việt Nam.</strong><br />Trụ sở chính: Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.</p><div>- Tel: +84-24-85872007 - Fax: +84-24-35500914<br />- Email: <a href="mailto:contact@vinades.vn">contact@vinades.vn</a> - Website: <a href="http://www.vinades.vn/">http://www.vinades.vn</a></div></blockquote>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(5, '', '', 'Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC) đang thu hút tuyển dụng nhân tài ở các vị trí:<ol><li><a href="/Tuyen-dung/Tuyen-dung-lap-trinh-vien-PHP-7.html">Lập trình viên PHP và MySQL.</a></li><li><a href="/Tuyen-dung/Tuyen-dung-lap-trinh-vien-front-end-HTML-CSS-JS-9.html">Lập trình viên front-end (HTML/CSS/JS).</a></li><li><a href="/Tuyen-dung/Tuyen-dung-chuyen-vien-do-hoa-8.html">Chuyên Viên Đồ Hoạ.</a></li></ol><br />Tại VINADES.,JSC bạn sẽ được tham gia các dự án của công ty, tham gia xây dựng và phát triển bộ nhân hệ thống NukeViet, được học hỏi và trau dồi nâng cao kiến thức và kỹ năng cá nhân. Ngoài ra, nếu bạn đam mê về nguồn mở và có mong muốn cống hiến cho quá trình phát triển nguồn mở của Việt Nam nói riêng và của thế giới nói chung, thì đây là cơ hội lớn nhất để bạn đạt được mong muốn của mình. Tham gia công tác tại công ty là bạn đã góp phần xây dựng một cộng đồng nguồn mở chuyên nghiệp cho Việt Nam để vươn xa ra thế giới.<br /><br /><span style="font-size:16px;"><strong>1. Vị trí dự tuyển:</strong></span> Lập trình viên front-end (HTML/ CSS/ JS)<br /><br /><span style="font-size:16px;"><strong>2. Mô tả công việc:</strong></span><ul><li>Cắt, làm giao diện website từ bản thiết kế (sử dụng Photoshop) trên nền hệ thống NukeViet.</li><li>Tham gia vào việc phát triển Front-End các ứng dụng nền web.</li><li>Thực hiện các công đoạn để dưa website vào hoạt động như upload dữ liệu lên host, xử lý lỗi, sự cố liên quan.</li><li>Chịu trách nhiệm về chất lượng, trải nghiệm người dùng, thẩm mỹ của sản phẩm trong khi sản phẩm hoạt động Tham mưu, tư vấn về chất lượng, thẩm mỹ, trải nghiệm người dùng về các sản phẩm.</li><li>Đảm bảo website theo các tiêu chuẩn web (W3c, XHTML, CSS 3.0, Tableless, no inline style, … ).</li><li>Đảm bảo website hiển thị đúng trên tất cả các trình duyệt.</li><li>Đảm bảo website theo chuẩn “Responsive Web Design.</li><li>Đảm bảo việc đưa sản phẩm thiết kế đến người dùng cuối cùng một cách chính xác và đẹp.</li><li>Thực hiện các công việc theo sự phân công của cấp trên.</li><li>Chịu trách nhiệm về chất lượng và tiến độ công việc.</li></ul><br /><span style="font-size:16px;"><strong>3. Yêu cầu:</strong></span><ul><li>Có kiến thức cơ bản về thiết kế website: Am hiểu các dạng layout, thành phần của một website.</li><li>Hiểu rõ và nắm chắc cách làm Theme/Template.</li><li>Sử dụng thành thạo HTML5, CSS3 &amp; Javascrip/Jquery và Xtemplate</li><li>Khả năng chuyển PSD sang NukeViet tốt.</li><li>Biết đưa website lên host, xử lý lỗi, sự cố liên quan.</li><li>Chịu trách nhiệm về chất lượng và tiến độ công việc phụ trách.</li><li>Khả năng sáng tạo, tính thẩm mỹ tốt.</li><li>Đam mê công việc về web.</li></ul><br /><em><strong>Ưu tiên các ứng viên:</strong></em><ul><li>Có kiến thức cơ bản về quản trị website NukeViệt.</li><li>Am hiểu về Responsive và có thể thiết kế giao diện, layout trên mobile (Boostrap).</li><li>Sử dụng và nắm rõ các tính năng, block thường dùng của NukeViet.</li><li>Biết sử dụng git để quản lý source code (nếu ứng viên chưa biết công ty sẽ đào tạo thêm).</li><li>Có khả năng giao tiếp với khách hàng (Trực tiếp, điện thoại, email).</li><li>Có khả năng làm việc độc lập và làm việc theo nhóm.</li><li>Có tinh thần trách nhiệm cao và chủ động trong công việc.</li><li>Có khả năng trình bày ý tưởng.</li></ul><br /><span style="font-size:16px;"><strong>4. Quyền lợi:</strong></span><ul><li>Lương thoả thuận, trả qua ATM.</li><li>Thưởng theo dự án, các ngày lễ tết.</li><li>Hưởng các chế độ khác theo quy định của công ty và pháp luật: Bảo hiểm y tế, bảo hiểm xã hội...</li></ul><br /><span style="font-size:16px;"><strong>5. Thời gian làm việc:</strong></span> Toàn thời gian cố định hoặc làm online.<br /><br /><span style="font-size:16px;"><strong>6. Hạn nộp hồ sơ:</strong></span> Không hạn chế, vui lòng kiểm tra tại <a href="http://vinades.vn/vi/news/Tuyen-dung/">http://vinades.vn/vi/news/Tuyen-dung/</a><br /><br /><span style="font-size:16px;"><strong>7. Cách thức đăng ký dự tuyển:</strong></span> Làm Hồ sơ xin việc<em><strong> (download tại đây: <strong><a href="http://vinades.vn/vi/download/Tai-lieu/Ban-khai-so-yeu-ly-lich-ky-thuat-vien/" target="_blank"><u>Mẫu lý lịch ứng viên</u></a></strong>)</strong></em> và gửi về hòm thư <a href="mailto:tuyendung@vinades.vn">tuyendung@vinades.vn</a><br /><br /><span style="font-size:16px;"><strong>8. Hồ sơ bao gồm:</strong></span><ul><li>Đơn xin việc: Tự biên soạn.</li><li>Thông tin ứng viên: Theo mẫu của VINADES.,JSC</li></ul>&nbsp;<p><strong>Chi tiết vui lòng tham khảo tại:</strong> <a href="http://vinades.vn/vi/news/Tuyen-dung/" target="_blank">http://vinades.vn/vi/news/Tuyen-dung/</a><br /><br /><strong>Mọi thắc mắc vui lòng liên hệ:</strong></p><blockquote><p><strong>Công ty cổ phần phát triển nguồn mở Việt Nam.</strong><br />Trụ sở chính: Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.</p><div>- Tel: +84-24-85872007 - Fax: +84-24-35500914<br />- Email: <a href="mailto:contact@vinades.vn">contact@vinades.vn</a> - Website: <a href="http://www.vinades.vn/">http://www.vinades.vn</a></div></blockquote>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0);
INSERT INTO `hn4_vi_news_detail` (`id`, `titlesite`, `description`, `bodyhtml`, `voicedata`, `keywords`, `sourcetext`, `files`, `imgposition`, `layout_func`, `copyright`, `allowed_send`, `allowed_print`, `allowed_save`, `auto_nav`) VALUES
(6, '', '', 'Cả hội trường như vỡ òa, rộn tiếng vỗ tay, tiếng cười nói chúc mừng các nhà khoa học, các nhóm tác giả đoạt Giải thưởng Nhân tài Đất Việt năm 2011. Năm thứ 7 liên tiếp, Giải thưởng đã phát hiện và tôn vinh nhiều tài năng của đất nước.<div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/01_b7d3f.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Sân khấu trước lễ trao giải.</span></div><div> &nbsp;</div><div align="center"> &nbsp;</div><div align="left"> Cơ cấu Giải thưởng của Nhân tài Đất Việt 2011 trong lĩnh vực CNTT bao gồm 2 hệ thống giải dành cho “Sản phẩm có tiềm năng ứng dụng” và “Sản phẩm đã ứng dụng rộng rãi trong thực tế”. Mỗi hệ thống giải sẽ có 1 giải Nhất, 1 giải Nhì và 1 giải Ba với trị giá giải thưởng tương đương là 100 triệu đồng, 50 triệu đồng và 30 triệu đồng cùng phần thưởng của các đơn vị tài trợ.</div><div align="center"> &nbsp;</div><div align="center"> <div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/03_f19bd.jpg" width="350" /></div> <div align="center"> Nhiều tác giả, nhóm tác giả đến lễ trao giải từ rất sớm.</div></div><p> Giải thưởng Nhân tài Đất Việt 2011 trong lĩnh vực Khoa học Tự nhiên được gọi chính thức là Giải thưởng Khoa học Tự nhiên Việt Nam sẽ có tối đa 6 giải, trị giá 100 triệu đồng/giải dành cho các lĩnh vực: Toán học, Cơ học, Vật lý, Hoá học, Các khoa học về sự sống, Các khoa học về trái đất (gồm cả biển) và môi trường, và các lĩnh vực khoa học liên ngành hoặc đa ngành của hai hoặc nhiều ngành nói trên. Viện Khoa học và Công nghệ Việt Nam thành lập Hội đồng giám khảo gồm các nhà khoa học tự nhiên hàng đầu trong nước để thực hiện việc đánh giá và trao giải.</p><div> Sau thành công của việc trao Giải thưởng Nhân tài Đất Việt trong lĩnh vực Y dược năm 2010, Ban Tổ chức tiếp tục tìm kiếm những chủ nhân xứng đáng cho Giải thưởng này trong năm 2011.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/07_78b85.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nguyên Tổng Bí thư BCH TW Đảng Cộng sản Việt Nam Lê Khả Phiêu tới&nbsp;dự Lễ trao giải.</span></div><div> &nbsp;</div><div> 45 phút trước lễ trao giải, không khí tại Cung Văn hóa Hữu nghị Việt - Xô đã trở nên nhộn nhịp. Sảnh phía trước Cung gần như chật kín. Rất đông bạn trẻ yêu thích công nghệ thông tin, sinh viên các trường đại học đã đổ về đây, cùng với đó là những bó hoa tươi tắn sẽ được dành cho các tác giả, nhóm tác giả đoạt giải.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/09_aef87.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Phó Chủ tịch nước CHXHCN Việt Nam Nguyễn Thị Doan.</span></div><div> &nbsp;</div><div> Các vị khách quý cũng đến từ rất sớm. Tới tham dự lễ trao giải năm nay có ông Lê Khả Phiêu, nguyên Tổng Bí thư BCH TW Đảng Cộng sản Việt Nam; bà Nguyễn Thị Doan, Phó Chủ tịch nước CHXHCN Việt Nam; ông Vũ Oanh, nguyên Ủy viên Bộ Chính trị, nguyên Chủ tịch Hội Khuyến học Việt Nam; ông Nguyễn Bắc Son, Bộ trưởng Bộ Thông tin và Truyền thông; ông Đặng Ngọc Tùng, Chủ tịch Tổng Liên đoàn lao động Việt Nam; ông Phạm Văn Linh, Phó trưởng ban Tuyên giáo Trung ương; ông Đỗ Trung Tá, Phái viên của Thủ tướng Chính phủ về CNTT, Chủ tịch Hội đồng Khoa học công nghệ quốc gia; ông Nguyễn Quốc Triệu, nguyên Bộ trưởng Bộ Y tế, Trưởng Ban Bảo vệ Sức khỏe TƯ; bà Cù Thị Hậu, Chủ tịch Hội người cao tuổi Việt Nam; ông Lê Doãn Hợp, nguyên Bộ trưởng Bộ Thông tin Truyền thông, Chủ tịch Hội thông tin truyền thông số…</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/08_ba46c.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Bộ trưởng Bộ Thông tin và Truyền thông Nguyễn Bắc Son.</span></div><div align="center"> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/06_29592.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Giáo sư - Viện sỹ Nguyễn Văn Hiệu.</span></div><div align="center"> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/04_051f2.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nguyên Bộ trưởng Bộ Y tế Nguyễn Quốc Triệu.</span></div><div align="center"> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/05_c7ea4.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Ông Vũ Oanh, nguyên Ủy viên Bộ Chính trị, nguyên Chủ tịch Hội Khuyến học Việt Nam.</span></div><p> Do tuổi cao, sức yếu hoặc bận công tác không đến tham dự lễ trao giải nhưng Đại tướng Võ Nguyên Giáp và Chủ tịch nước Trương Tấn Sang cũng gửi lẵng hoa đến chúc mừng lễ trao giải.</p><div> Đúng 20h, Lễ trao giải bắt đầu với bài hát “Nhân tài Đất Việt” do ca sỹ Thái Thùy Linh cùng ca sĩ nhí và nhóm múa biểu diễn. Các nhóm tác giả tham dự Giải thưởng năm 2011 và những tác giả của các năm trước từ từ bước ra sân khấu trong tiếng vỗ tay tán dương của khán giả.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/12_74abf.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> &nbsp;</div><div align="center"> <div> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/PHN15999_3e629.jpg" style="MARGIN: 5px" width="450" /></div></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Tiết mục mở màn Lễ trao giải.</span></div><p> Trước Lễ trao giải Giải thưởng Nhân tài Đất Việt năm 2011, Đại tướng Võ Nguyên Giáp, Chủ tịch danh dự Hội Khuyến học Việt Nam, đã gửi thư chúc mừng, khích lệ Ban tổ chức Giải thưởng cũng như các nhà khoa học, các tác giả tham dự.</p><blockquote> <p> <em><span style="FONT-STYLE: italic">Hà Nội, ngày 16 tháng 11 năm 2011</span></em></p> <div> <em>Giải thưởng “Nhân tài đất Việt” do Hội Khuyến học Việt Nam khởi xướng đã bước vào năm thứ bảy (2005 - 2011) với ba lĩnh vực: Công nghệ thông tin, Khoa học tự nhiên và Y dược.</em></div></blockquote><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/thuDaituong1_767f4.jpg" style="MARGIN: 5px" width="400" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Thư của Đại tướng Võ Nguyên Giáp gửi BTC Giải thưởng Nhân tài đất Việt.</span></div><blockquote> <p> <em>Tôi gửi lời chúc mừng các nhà khoa học và các thí sinh được nhận giải thưởng “Nhân tài đất Việt” năm nay.</em></p> <p> <em>Mong rằng, các sản phẩm và các công trình nghiên cứu được trao giải sẽ được tiếp tục hoàn thiện và được ứng dụng rộng rãi trong đời sống, đem lại hiệu quả kinh tế và xã hội thiết thực.</em></p> <p> <em>Nhân ngày “Nhà giáo Việt Nam”, chúc Hội Khuyến học Việt nam, chúc các thầy giáo và cô giáo, với tâm huyết và trí tuệ của mình, sẽ đóng góp xứng đáng vào công cuộc đổi mới căn bản và toàn diện nền giáo dục nước nhà, để cho nền giáo dục Việt Nam thực sự là cội nguồn của nguyên khí quốc gia, đảm bảo cho mọi nhân cách và tài năng đất Việt được vun đắp và phát huy vì sự trường tồn, sự phát triển tiến bộ và bền vững của đất nước trong thời đại toàn cầu hóa và hội nhập quốc tế.</em></p> <p> <em>Chào thân ái,</em></p> <p> <strong><em>Chủ tịch danh dự Hội Khuyến học Việt Nam</em></strong></p> <p> <strong><em>Đại tướng Võ Nguyên Giáp</em></strong></p></blockquote><p> Phát biểu khai mạc Lễ trao giải, Nhà báo Phạm Huy Hoàn, TBT báo điện tử Dân trí, Trưởng Ban tổ chức, bày tỏ lời cám ơn chân thành về những tình cảm cao đẹp và sự quan tâm chăm sóc của Đại tướng Võ Nguyên Giáp và Chủ tịch nước Trương Tấn Sang đã và đang dành cho Nhân tài Đất Việt.</p><div> Nhà báo Phạm Huy Hoàn nhấn mạnh, Giải thưởng Nhân tài Đất Việt suốt 7 năm qua đều nhận được sự quan tâm của các vị lãnh đạo Đảng, Nhà nước và của toàn xã hội. Tại Lễ trao giải, Ban tổ chức luôn có vinh dự được đón tiếp&nbsp;các vị lãnh đạo&nbsp; Đảng và Nhà nước đến dự và trực tiếp trao Giải thưởng.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/15_4670c.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Trưởng Ban tổ chức Phạm Huy Hoàn phát biểu khai mạc buổi lễ.</span></div><p> Năm 2011, Giải thưởng có 3 lĩnh vực được xét trao giải là CNTT, Khoa học tự nhiên và Y dược. Lĩnh&nbsp; vực CNTT đã đón nhận 204 sản phẩm tham dự từ mọi miền đất nước và cả nước ngoài như thí sinh Nguyễn Thái Bình từ bang California - Hoa Kỳ và một thí sinh ở Pháp cũng đăng ký tham gia.</p><div> “Cùng với lĩnh vực CNTT, năm nay, Hội đồng khoa học của Viện khoa học và công nghệ Việt Nam và Hội đồng khoa học - Bộ Y tế tiếp tục giới thiệu những nhà khoa học xuất&nbsp; sắc, có công trình nghiên cứu đem lại nhiều lợi ích cho xã hội trong lĩnh vực khoa học tự nhiên và lĩnh vực y dược. Đó là những bác sĩ tài năng, những nhà khoa học mẫn tuệ, những người đang ngày đêm thầm lặng cống hiến trí tuệ sáng tạo của mình cho xã hội trong công cuộc xây dựng đất nước.” - nhà báo Phạm Huy Hoàn nói.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/14_6e18f.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nhà báo Phạm Huy Hoàn, TBT báo điện tử Dân trí, Trưởng BTC Giải thưởng và ông Phan Hoàng Đức, Phó TGĐ Tập đoàn VNPT nhận lẵng hoa chúc mừng của Đại tướng Võ Nguyên Giáp và Chủ tịch nước Trương Tấn Sang.</span></div><p> Cũng theo Trưởng Ban tổ chức Phạm Huy Hoàn, đến nay, vị Chủ tịch danh dự đầu tiên của Hội Khuyến học Việt Nam, Đại tướng Võ Nguyên Giáp, đã bước qua tuổi 100 nhưng vẫn luôn dõi theo và động viên từng bước phát triển của Giải thưởng Nhân tài Đất Việt. Đại tướng luôn quan tâm chăm sóc Giải thưởng ngay từ khi Giải thưởng&nbsp; mới ra đời cách đây 7 năm.</p><p> Trước lễ trao giải, Đại tướng Võ Nguyên Giáp đã gửi thư chúc mừng, động viên Ban tổ chức. Trong thư, Đại tướng viết: “Mong rằng, các sản phẩm và các công trình nghiên cứu được trao giải sẽ được tiếp tục hoàn thiện và được ứng dụng rộng rãi trong đời sống, đem lại hiệu quả kinh tế và xã hội thiết thực.</p><p> Sau phần khai mạc, cả hội trường hồi hội chờ đợi phút vinh danh các nhà khoa học và các tác giả, nhóm tác giả đoạt giải.</p><div> <span style="FONT-WEIGHT: bold">* Giải thưởng Khoa học Tự nhiên Việt Nam </span>thuộc về 2 nhà khoa học GS.TS Trần Đức Thiệp và GS.TS Nguyễn Văn Đỗ - Viện Vật lý, Viện Khoa học công nghệ Việt Nam với công trình “Nghiên cứu cấu trúc hạt nhân và các phản ứng hạt nhân”.</div><div> &nbsp;</div><div align="center"> <div> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/khtn_d4aae.jpg" style="MARGIN: 5px" width="450" /></div></div><p> Hai nhà khoa học đã tiến hành thành công các nghiên cứu về phản ứng hạt nhân với nơtron, phản ứng quang hạt nhân, quang phân hạch và các phản ứng hạt nhân khác có cơ chế phức tạp trên các máy gia tốc như máy phát nơtron, Microtron và các máy gia tốc thẳng của Việt Nam và Quốc tế. Các nghiên cứu này đã góp phần làm sáng tỏ cấu trúc hạt nhân và cơ chế phản ứng hạt nhân, đồng thời cung cấp nhiều số liệu hạt nhân mới có giá trị cho Kho tàng số liệu hạt nhân.</p><p> GS.TS Trần Đức Thiệp và GS.TS Nguyễn Văn Đỗ đã khai thác hiệu quả hai máy gia tốc đầu tiên của Việt Nam là máy phát nơtron NA-3-C và Microtron MT-17 trong nghiên cứu cơ bản, nghiên cứu ứng dụng và đào tạo nhân lực. Trên cơ sở các thiết bị này, hai nhà khoa học đã tiến hành thành công những nghiên cứu cơ bản thực nghiệm đầu tiên về phản ứng hạt nhân ở Việt Nam; nghiên cứu và phát triển các phương pháp phân tích hạt nhân hiện đại và áp dụng thành công ở Việt Nam.</p><div> Bà Nguyễn Thị Doan, Phó Chủ tịch nước CHXHCNVN và Giáo sư - Viện sỹ Nguyễn Văn Hiệu trao giải thưởng cho 2 nhà khoa học.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/khtn2_e2865.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Phó Chủ tịch nước CHXHCNVN Nguyễn Thị Doan và Giáo sư - Viện sỹ Nguyễn Văn Hiệu trao giải thưởng cho 2 nhà khoa học GS.TS Trần Đức Thiệp và GS.TS Nguyễn Văn Đỗ.</span></div><p> GS.VS Nguyễn Văn Hiệu chia sẻ: “Cách đây không lâu, Chính phủ đã ký quyết định xây dựng nhà máy điện hạt nhân trong điều kiện đất nước còn nhỏ bé, nghèo khó và vì thế việc đào tạo nhân lực là nhiệm vụ số 1 hiện nay. Rất may, Việt Nam có 2 nhà khoa học cực kỳ tâm huyết và nổi tiếng trong cả nước cũng như trên thế giới. Hội đồng khoa học chúng tôi muốn xướng tên 2 nhà khoa học này để Chính phủ huy động cùng phát triển xây dựng nhà máy điện hạt nhân.”</p><p> GS.VS Hiệu nhấn mạnh, mặc dù điều kiện làm việc của 2 nhà khoa học không được quan tâm, làm việc trên những máy móc cũ kỹ được mua từ năm 1992 nhưng 2 ông vẫn xay mê cống hiến hết mình cho lĩnh Khoa học tự nhiên Việt Nam.</p><p> <span style="FONT-WEIGHT: bold">* Giải thưởng Nhân tài Đất Việt trong lĩnh vực Y Dược:</span> 2 giải</p><div> <span style="FONT-WEIGHT: bold">1.</span> Nhóm nghiên cứu của Bệnh viện Hữu nghị Việt - Đức với công trình <span style="FONT-STYLE: italic">“Nghiên cứu triển khai ghép gan, thận, tim lấy từ người cho chết não”</span>.</div><div> &nbsp;</div><div align="center"> <div> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/y_3dca2.jpg" style="MARGIN: 5px" width="450" /></div></div><div> &nbsp;</div><div> Tại bệnh viện Việt Đức, tháng 4/2011, các ca ghép tạng từ nguồn cho là người bệnh chết não được triển khai liên tục. Với 4 người cho chết não hiến tạng, bệnh viện đã ghép tim cho một trường hợp,&nbsp;2 người được ghép gan, 8 người được ghép thận, 2 người được ghép van tim và tất cả các ca ghép này đều thành công, người bệnh được ghép đã có một cuộc sống tốt hơn với tình trạng sức khỏe ổn định.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/y2_cb5a1.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nguyên Tổng Bí Ban chấp hành TW Đảng CSVN Lê Khả Phiêu và ông Vũ Văn Tiền, Chủ tịch Hội đồng quản trị Ngân hàng An Bình trao giải thưởng cho nhóm nghiên cứu của BV Hữu nghị Việt - Đức.</span></div><p> Công trong việc ghép tạng từ người cho chết não không chỉ thể hiện năng lực, trình độ, tay nghề của bác sĩ Việt Nam mà nó còn mang một ý nghĩa nhân văn to lớn, mang một thông điệp gửi đến những con người giàu lòng nhân ái với nghĩa cử cao đẹp đã hiến tạng để cứu sống những người bệnh khác.</p><p> <span style="FONT-WEIGHT: bold">2.</span> Hội đồng ghép tim Bệnh viện Trung ương Huế với công trình nghiên cứu <span style="FONT-STYLE: italic">“Triển khai ghép tim trên người lấy từ người cho chết não”</span>.</p><div> Đề tài được thực hiện dựa trên ca mổ ghép tim thành công lần đầu tiên ở Việt Nam của chính 100% đội ngũ y, bác sĩ của Bệnh viện Trung ương Huế đầu tháng 3/2011. Bệnh nhân được ghép tim thành công là anh Trần Mậu Đức (26 tuổi, ở phường Phú Hội, TP. Huế).</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/y3_7768c.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Hội đồng ghép tim BV Trung ương Huế nhận Giải thưởng Nhân tài Đất Việt.</span></div><p> Ghép tim từ người cho chết não đến người bị bệnh tim cần được ghép tim phải đảm bảo các yêu cầu: đánh giá chức năng các cơ quan; đánh giá tương hợp miễn dịch và phát hiện nguy cơ tiềm ẩn có thể xảy ra trong và sau khi ghép tim để từ đó có phương thức điều trị thích hợp. Có tới 30 xét nghiệm cận lâm sàng trung và cao cấp tiến hành cho cả người cho tim chết não và người sẽ nhận ghép tim tại hệ thống labo của bệnh viện.</p><p> ---------------------</p><p> <span style="FONT-WEIGHT: bold">* Giải thưởng Nhân tài đất Việt Lĩnh vực Công nghệ thông tin.</span></p><p> <span style="FONT-STYLE: italic">Hệ thống sản phẩm đã ứng dụng thực tế:</span></p><p> <span style="FONT-STYLE: italic">Giải Nhất:</span> Không có.</p><p> <span style="FONT-STYLE: italic">Giải Nhì:</span> Không có</p><p> <span style="FONT-STYLE: italic">Giải Ba:</span> 3 giải, mỗi giải trị giá 30 triệu đồng.</p><div> <span style="FONT-WEIGHT: bold">1.</span> <span style="FONT-STYLE: italic">“Bộ cạc xử lý tín hiệu HDTV”</span> của nhóm HD Việt Nam.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/hdtv_13b10.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nhóm HDTV Việt Nam lên nhận giải.</span></div><p> Đây là bộ cạc xử lý tín hiệu HDTV đầu tiên tại Việt Nam đạt tiêu chuẩn OpenGear. Bộ thiết bị bao gồm 2 sản phẩm là cạc khuếch đại phân chia tín hiệu HD DA và cạc xử lý tín hiệu HD FX1. Nhờ bộ cạc này mà người sử dụng cũng có thể điều chỉnh mức âm thanh hoặc video để tín hiệu của kênh tuân theo mức chuẩn và không phụ thuộc vào chương trình đầu vào.</p><div> <span style="FONT-WEIGHT: bold; FONT-STYLE: italic">2.</span> <span style="FONT-STYLE: italic">“Mã nguồn mở NukeViet”</span> của nhóm tác giả Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC).</div><div> &nbsp;</div><div align="center"> <div> <img _fl="" align="middle" alt="NukeViet nhận giải ba Nhân tài đất Việt 2011" src="/uploads/news/nukeviet-nhantaidatviet2011.jpg" style="margin: 5px; width: 450px; height: 301px;" /></div></div><p> NukeViet là CMS mã nguồn mở đầu tiên của Việt Nam có quá trình phát triển lâu dài nhất, có lượng người sử dụng đông nhất. Hiện NukeViet cũng là một trong những mã nguồn mở chuyên nghiệp đầu tiên của Việt Nam, cơ quan chủ quản của NukeViet là VINADES.,JSC - đơn vị chịu trách nhiệm phát triển NukeViet và triển khai NukeViet thành các ứng dụng cụ thể cho doanh nghiệp.</p><div> <span style="FONT-WEIGHT: bold">3.</span> <span style="FONT-STYLE: italic">“Hệ thống ngôi nhà thông minh homeON”</span> của nhóm Smart home group.</div><div> &nbsp;</div><div align="center"> <div> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/PHN16132_82014.jpg" style="MARGIN: 5px" width="450" /></div></div><p> Sản phẩm là kết quả từ những nghiên cứu miệt mài nhằm xây dựng một ngôi nhà thông minh, một cuộc sống xanh với tiêu chí: An toàn, tiện nghi, sang trọng và tiết kiệm năng lượng, hưởng ứng lời kêu gọi tiết kiệm năng lượng của Chính phủ.&nbsp;</p><p> <strong><span style="FONT-STYLE: italic">* Hệ thống sản phẩm có tiềm năng ứng dụng:</span></strong></p><p> <span style="FONT-STYLE: italic">Giải Nhất: </span>Không có.</p><div> <span style="FONT-STYLE: italic">Giải Nhì:</span> trị giá 50 triệu đồng: <span style="FONT-STYLE: italic">“Dịch vụ Thông tin và Tri thức du lịch ứng dụng cộng nghệ ngữ nghĩa - iCompanion”</span> của nhóm tác giả SIG.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/nhi_7eee0.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nhóm tác giả SIG nhận giải Nhì Nhân tài đất Việt 2011 ở hệ thống sản phẩm có tiềm năng ứng dụng.</span></div><p> ICompanion là hệ thống thông tin đầu tiên ứng dụng công nghệ ngữ nghĩa trong lĩnh vực du lịch - với đặc thù khác biệt là cung cấp các dịch vụ tìm kiếm, gợi ý thông tin “thông minh” hơn, hướng người dùng và kết hợp khai thác các tính năng hiện đại của môi trường di động.</p><p> Đại diện nhóm SIG chia sẻ: “Tinh thần sáng tạo và lòng khát khao muốn được tạo ra các sản phẩm mới có khả năng ứng dụng cao trong thực tiễn luôn có trong lòng của những người trẻ Việt Nam. Cảm ơn ban tổ chức và những nhà tài trợ đã giúp chúng tôi có một sân chơi thú vị để khuyến khích và chắp cánh thực hiện ước mơ của mình. Xin cảm ơn trường ĐH Bách Khoa đã tạo ra một môi trường nghiên cứu và sáng tạo, gắn kết 5 thành viên trong nhóm.”</p><p> <span style="FONT-STYLE: italic">Giải Ba:</span> 2 giải, mỗi giải trị giá 30 triệu đồng.</p><div> <span style="FONT-WEIGHT: bold">1. </span><span style="FONT-STYLE: italic">“Bộ điều khiển IPNET”</span> của nhóm IPNET</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/PHN16149_ed58d.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> <span style="FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Nhà báo Phạm Huy Hoàn, Trưởng Ban Tổ chức Giải thưởng NTĐV, Tổng Biên tập báo điện tử Dân trí và ông Tạ Hữu Thanh - Phó TGĐ Jetstar Pacific trao giải cho nhóm IPNET.</span></div><p> Bằng cách sử dụng kiến thức thiên văn học để tính giờ mặt trời lặn và mọc tại vị trí cần chiếu sáng được sáng định bởi kinh độ, vĩ độ cao độ, hàng ngày sản phẩm sẽ tính lại thời gian cần bật/tắt đèn cho phù hợp với giờ mặt trời lặn/mọc.</p><div> <span style="FONT-WEIGHT: bold">2.</span> <span style="FONT-STYLE: italic">“Hệ thống lập kế hoạch xạ trị ung thư quản lý thông tin bệnh nhân trên web - LYNX”</span> của nhóm LYNX.</div><div> &nbsp;</div><div align="center"> <div> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/3tiem-nang_32fee.jpg" style="MARGIN: 5px" width="450" /></div></div><p> Đây là loại phần mềm hoàn toàn mới ở Việt Nam, là hệ thống lập kế hoạch và quản lý thông tin của bệnh nhân ung thư qua Internet (LYNX) dựa vào nền tảng Silverlight của Microsoft và kiến thức chuyên ngành Vật lý y học. LYNX giúp ích cho các nhà khoa học, bác sĩ, kỹ sư vật lý, bệnh nhân và mọi thành viên trong việc quản lý và theo dõi hệ thống xạ trị ung thư một cách tổng thể. LYNX có thể được sử dụng thông qua các thiết bị như máy tính cá nhân, máy tính bảng… và các trình duyệt Internet Explorer, Firefox, Chrome…</p><div> Chương trình trao giải đã được truyền hình trực tiếp trên VTV2 - Đài Truyền hình Việt Nam và tường thuật trực&nbsp;tuyến trên báo điện tử Dân trí từ 20h tối 20/11/2011.</div><div> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/NVH0545_c898e.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/NVH0560_c995c.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> &nbsp;</div><div align="center"> <img _fl="" align="middle" src="http://dantri4.vcmedia.vn/xFKfMbJ7RTXgah5W1cc/File/2011/PHN16199_36a5c.jpg" style="MARGIN: 5px" width="450" /></div><div align="center"> &nbsp;</div><div align="center"> <div align="center"> <table border="1" cellpadding="0" cellspacing="0" width="90%"> <tbody> <tr> <td> <div> <span style="FONT-WEIGHT: bold"><span style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Khởi xướng từ năm 2005, Giải thưởng Nhân tài Đất Việt đã phát hiện và tôn vinh nhiều tài năng trong lĩnh vực CNTT-TT, Khoa học tự nhiên và Y dược, trở thành một sân chơi bổ ích cho những người yêu thích CNTT. Mỗi năm, Giải thưởng ngày càng thu hút số lượng tác giả và sản phẩm tham gia đông đảo và nhận được sự quan tâm sâu sắc của lãnh đạo Đảng, Nhà nước cũng như công chúng.</span></span></div> <div> <span style="FONT-WEIGHT: bold">&nbsp;</span></div> <div> <span style="FONT-WEIGHT: bold"><span style="FONT-WEIGHT: normal; FONT-SIZE: 10pt; FONT-FAMILY: Tahoma">Đối tượng tham gia Giải thưởng trong lĩnh vực CNTT là những người Việt Nam ở mọi lứa tuổi, đang sinh sống trong cũng như ngoài nước. Năm 2006, Giải thưởng có sự tham gia của thí sinh đến từ 8 nước trên thế giới và 40 tỉnh thành của Việt Nam. Từ năm 2009, Giải thưởng được mở rộng sang lĩnh vực Khoa học tự nhiên, và năm 2010 là lĩnh vực Y dược, vinh danh những nhà khoa học trong các lĩnh vực này.</span>&nbsp;</span></div> <div> <span style="FONT-WEIGHT: bold">&nbsp;</span></div> </td> </tr> </tbody> </table> </div></div>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(7, '', '', '<div>Có hiệu lực từ ngày 20/1/2015, Thông tư này thay thế cho Thông tư 41/2009/TT-BTTTT (Thông tư 41) ngày 30/12/2009 ban hành Danh mục các sản phẩm phần mềm nguồn mở đáp ứng yêu cầu sử dụng trong cơ quan, tổ chức nhà nước.<br />\r\n<br />\r\nSản phẩm phần mềm nguồn mở được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước trong Thông tư 41/2009/TT-BTTTT vừa được Bộ TT&amp;TT ban hành, là những&nbsp;sản phẩm đã đáp ứng các tiêu chí về tính năng kỹ thuật cũng như tính mở và bền vững, và NukeViet là một trong số đó.</div>\r\n\r\n<p>Cụ thể, theo Thông tư 20, sản phẩm phần mềm nguồn mở được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước phải đáp các tiêu chí về chức năng, tính năng kỹ thuật bao gồm: phần mềm có các chức năng, tính năng kỹ thuật phù hợp với các yêu cầu nghiệp vụ hoặc các quy định, hướng dẫn tương ứng về ứng dụng CNTT trong các cơ quan, tổ chức nhà nước; phần mềm đáp ứng được yêu cầu tương thích với hệ thống thông tin, cơ sở dữ liệu hiện có của các cơ quan, tổ chức.</p>\r\n\r\n<p>Bên cạnh đó, các sản phẩm phần mềm nguồn mở được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước còn phải đáp ứng tiêu chí về tính mở và tính bền vững của phần mềm. Cụ thể, phần mềm phải đảm bảo các quyền: tự do sử dụng phần mềm không phải trả phí bản quyền, tự do phân phối lại phần mềm, tự do sửa đổi phần mềm theo nhu cầu sử dụng, tự do phân phối lại phần mềm đã chỉnh sửa (có thể thu phí hoặc miễn phí); phần mềm phải có bản mã nguồn, bản cài đặt được cung cấp miễn phí trên mạng; có điểm ngưỡng thất bại PoF từ 50 điểm trở xuống và điểm mô hình độ chín nguồn mở OSMM từ 60 điểm trở lên.</p>\r\n\r\n<p>Căn cứ những tiêu chuẩn trên, thông tư 20 quy định cụ thể Danh mục 31 sản phẩm thuộc 11 loại phần mềm được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước.&nbsp;NukeViet thuộc danh mục hệ quản trị nội dung nguồn mở. Chi tiết thông tư và danh sách 31 sản phẩm phần mềm nguồn mở được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước có&nbsp;<a href="http://vinades.vn/vi/download/van-ban-luat/Thong-tu-20-2014-TT-BTTTT/" target="_blank">tại đây</a>.</p>\r\n\r\n<p>Thông tư 20/2014/TT-BTTTT quy định rõ: Các cơ quan, tổ chức nhà nước khi có nhu cầu sử dụng vốn nhà nước để đầu tư xây dựng, mua sắm hoặc thuê sử dụng các loại phần mềm có trong Danh mục hoặc các loại phần mềm trên thị trường đã có sản phẩm phần mềm nguồn mở tương ứng thỏa mãn các tiêu chí trên (quy định tại Điều 3 Thông tư 20) thì phải&nbsp;ưu tiên lựa chọn các sản phẩm phần mềm nguồn mở tương ứng, đồng thời phải thể hiện rõ sự ưu tiên này trong các tài liệu&nbsp;như thiết kế sơ bộ, thiết kế thi công, kế hoạch đấu thầu, kế hoạch đầu tư, hồ sơ mời thầu, yêu cầu chào hàng, yêu cầu báo giá hoặc các yêu cầu mua sắm khác.</p>\r\n\r\n<p>Đồng thời,&nbsp;các cơ quan, tổ chức nhà nước phải đảm bảo không đưa ra các yêu cầu, điều kiện, tính năng kỹ thuật có thể dẫn đến việc loại bỏ các sản phẩm phần mềm nguồn mở&nbsp;trong các tài liệu như thiết kế sơ bộ, thiết kế thi công, kế hoạch đấu thầu, kế hoạch đầu tư, hồ sơ mời thầu, yêu cầu chào hàng, yêu cầu báo giá hoặc các yêu cầu mua sắm khác.</p>\r\n\r\n<p>Như vậy, sau thông tư số 08/2010/TT-BGDĐT của Bộ GD&amp;ĐT ban hành ngày 01-03-2010 quy định về sử dụng phần mềm tự do mã nguồn mở trong các cơ sở giáo dục trong đó đưa NukeViet vào danh sách các mã nguồn mở được khuyến khích sử dụng trong giáo dục, thông tư 20/2014/TT-BTTTT đã mở đường cho NukeViet vào sử dụng cho các cơ quan, tổ chức nhà nước. Các đơn vị hỗ trợ triển khai NukeViet cho các cơ quan nhà nước có thể sử dụng quy định này để được ưu tiên triển khai cho các dự án website, cổng thông tin cho các cơ quan, tổ chức nhà nước.<br />\r\n<br />\r\nThời gian tới, Công ty cổ phần phát triển nguồn mở Việt Nam (<a href="http://vinades.vn/" target="_blank">VINADES.,JSC</a>) - đơn vị chủ quản của NukeViet - sẽ cùng với Ban Quản Trị NukeViet tiếp tục hỗ trợ các doanh nghiệp đào tạo nguồn nhân lực chính quy phát triển NukeViet nhằm cung cấp dịch vụ ngày một tốt hơn cho chính phủ và các cơ quan nhà nước, từng bước xây dựng và hình thành liên minh các doanh nghiệp phát triển NukeViet, đưa sản phẩm phần mềm nguồn mở Việt không những phục vụ tốt thị trường Việt Nam mà còn từng bước tiến ra thị trường khu vực và các nước đang phát triển khác trên thế giới nhờ vào lợi thế phần mềm nguồn mở đang được chính phủ nhiều nước ưu tiên phát triển.</p>', NULL, '', 'mic.gov.vn', NULL, 2, '', 0, 1, 1, 1, 0),
(8, '', '', '<div>Trong năm 2016, chúng tôi xác định là đơn vị sát cánh cùng các đơn vị giáo dục- là đơn vị xây dựng nhiều website cho ngành giáo dục nhất trên cả nước.<br  />Với phần mềm mã nguồn mở NukeViet hiện có nhiều lợi thế:<br  />+ Được Bộ giáo dục khuyến khích sử dụng.<br  />+ Được bộ thông tin truyền thông chỉ định sử dụng trong khối cơ quan nhà nước.<br  />+Được cục công nghệ thông tin ghi rõ tên sản phẩm NukeViet nên dùng theo hướng dẫn thực hiện CNTT 2015-2016.<br  />Chúng tôi cần các bạn góp phần xây dựng nền giáo dục nước nhà ngày càng phát triển.</div><div>&nbsp;</div><table align="left" border="1" cellpadding="20" cellspacing="0" class="table table-striped table-bordered table-hover" style="width:100%;" width="653">	<tbody>		<tr>			<td style="width: 27.66%;"><strong>Vị trí tuyển dụng:</strong></td>			<td style="width: 72.34%;">Nhân viên kinh doanh</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Chức vụ:</strong></td>			<td style="width: 72.34%;">Nhân viên</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Ngành nghề:</strong></td>			<td style="width: 72.34%;"><strong>Sản phẩm:</strong><br  />			Cổng thông tin, website cho các phòng, sở giáo dục và đào tạo các trường học.</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Hình thức làm việc:</strong></td>			<td style="width: 72.34%;">Toàn thời gian cố định</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Địa điểm làm việc:</strong></td>			<td style="width: 72.34%;">Văn phòng công ty (Được đi công tác theo hợp đồng đã ký)</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Mức lương:</strong></td>			<td style="width: 72.34%;">&nbsp;Lương cố định + Thưởng vượt doanh số + thưởng theo từng hợp đồng (từ 2-7%).</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Mô tả công việc:</strong></td>			<td style="width: 72.34%;">Chúng tôi có khách hàng mục tiêu và danh sách khách hàng, công việc đòi hỏi ứng viên sử dụng thành thạo vi tính văn phòng, các phần mềm liên quan đến công việc và có laptop để phục vụ công việc.<br  />			- Sales Online, quảng bá ký kết, liên kết, với các đối tác qua INTERNET. Xây dưng mối quan hệ phát triển bền vững với các đối tác.<br  />			- Gọi điện, giới thiệu dịch vụ, sản phẩm của công ty đến đối tác.<br  />			- Xử lý các cuộc gọi của khách hàng liên quan đến, sản phẩm, dịch vụ công ty.<br  />			- Đàm phán, thương thuyết, ký kết hợp đồng với khách hàng đang có nhu cầu thiết kế website , SEO website , PR thương hiệu trên Internet&nbsp;<br  />			- Duy trì và chăm sóc mối quan hệ lâu dài với khách hàng, mở rộng khách hàng tiềm năng nhằm thúc đẩy doanh số bán hàng<br  />			- Hỗ trợ khách hàng khi được yêu cầu</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Số lượng cần tuyển:</strong></td>			<td style="width: 72.34%;">05</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Quyền lợi được hưởng:</strong></td>			<td style="width: 72.34%;">- Được đào tạo kĩ năng bán hàng, được công ty hỗ trợ tham gia khóa học bán hàng chuyên nghiệp.<br  />			- Lương cứng: 3.000.000 VNĐ+ hoa hồng dự án (2-7%/năm/hợp đồng). Lương trả qua ATM, được xét tăng lương 3 tháng một lần dựa trên doanh thu.<br  />			- Bậc lương xét trên năng lực bán hàng.<br  />			- Thưởng theo dự án, các ngày lễ tết.<br  />			- Hưởng các chế độ khác theo quy định của công ty và pháp luật: Bảo hiểm y tế, bảo hiểm xã hội.<br  />			- Cơ hội làm việc và gắn bó lâu dài trong công ty, được thưởng cổ phần nếu doanh thu tốt.</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Số năm kinh nghiệm:</strong></td>			<td style="width: 72.34%;">Trên 6 tháng</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Yêu cầu bằng cấp:</strong></td>			<td style="width: 72.34%;">Cao đẳng, Đại học</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Yêu cầu giới tính:</strong></td>			<td style="width: 72.34%;">Không yêu cầu</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Yêu cầu độ tuổi:</strong></td>			<td style="width: 72.34%;">Không yêu cầu</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Yêu cầu khác:</strong></td>			<td style="width: 72.34%;">- Yêu thích và đam mê Internet Marketing, thích online, thương mại điện tử<br  />			- Giọng nói dễ nghe, không nói ngọng.<br  />			- Có khả năng giao tiếp qua điện thoại.<br  />			- Ngoại hình ưa nhìn là một lợi thế<br  />			- Có tính cẩn thận trong công việc, luôn cố gắng học hỏi.<br  />			- Kỹ năng sales online tốt.<br  />			-Trung thực, năng động, nhiệt tình,siêng năng, nhiệt huyết trong công việc.</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Hồ sơ bao gồm:</strong></td>			<td style="width: 72.34%;"><strong>* Yêu cầu Hồ sơ:</strong><br  />			<strong>Cách thức đăng ký dự tuyển</strong>: Làm Hồ sơ xin việc (file mềm) và gửi về hòm thư <a href="mailto:tuyendung@vinades.vn">tuyendung@vinades.vn</a><br  />			<br  />			<strong>Nội dung hồ sơ xin việc file mềm gồm</strong>:<br  />			<strong>+ Đơn xin việc:</strong>&nbsp;Theo hướng dẫn bên dưới.<br  />			<strong>+ Thông tin ứng viên:</strong>&nbsp;Theo mẫu của VINADES.,JSC <strong><em>(download tại đây:&nbsp;<a href="http://vinades.vn/vi/download/Tai-lieu/Ban-khai-so-yeu-ly-lich-kinh-doanh/">Mẫu lý lịch ứng viên</a>)</em></strong><br  />			<strong>* Hồ sơ xin việc (Bản in thông thường) bao gồm</strong>:<br  />			- Giấy khám sức khoẻ của cơ quan y tế.<br  />			- Bản sao hộ khẩu (có công chứng)<br  />			- Bản sao giấy khai sinh (có công chứng)<br  />			- Bản sao quá trình học tập (bảng điểm tốt nghiệp), các văn -bằng chứng chỉ (có công chứng)<br  />			- Sơ yếu lý lịch có xác nhận của cơ quan công tác trước đó (nếu có) hoặc xác nhận của chính quyền địa phương nơi bạn đăng ký hộ khẩu thường trú.<br  />			- Thư giới thiệu (nếu có)<br  />			- Ảnh 4x6: 4 chiếc (đã bao gồm 1 chiếc gắn trên sơ yếu lý lịch).<br  />			<br  />			<strong>*Hướng dẫn</strong>:<br  />			- Với bản in của hồ sơ ứng tuyển, ứng viên sẽ phải nộp trước cho Ban tuyển dụng hoặc muộn nhất là mang theo khi có lịch phỏng vấn. Bản in sẽ không được trả lại ngay cả khi ứng viên không đạt yêu cầu.<br  />			- Nếu không thể bố trí thời gian phỏng vấn như sắp xếp của -Ban tuyển dụng, thí sinh cần thông báo ngay để được đổi lịch.<br  />			- Nếu có bất cứ thắc mắc gì bạn có thể liên hệ với Ms. Thu qua email: tuyendung@vinades.vn. Có thể gọi điện theo số điện thoại: 01255723353</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Hạn nộp hồ sơ:</strong></td>			<td style="width: 72.34%;">Không hạn chế cho tới khi tuyển đủ.</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Hình thức nộp hồ sơ:</strong></td>			<td style="width: 72.34%;">Qua Email</td>		</tr>		<tr>			<td colspan="2" style="width:100.0%;">			<h3>THÔNG TIN LIÊN HỆ</h3>			</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Điện thoại liên hệ:</strong></td>			<td style="width: 72.34%;">01255723353- Ms. Thu</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Địa chỉ liên hệ:</strong></td>			<td style="width: 72.34%;">Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.</td>		</tr>		<tr>			<td style="width: 27.66%;"><strong>Email liên hệ:</strong></td><td style="width: 72.34%;">tuyendung@vinades.vn</td></tr></tbody></table>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(9, '', '', '<p>Nếu bạn yêu thích công nghệ, thích kinh doanh hoặc lập trình web và mong muốn trải nghiệm, học hỏi, thậm chí là đi làm ngay từ khi còn ngồi trên ghế nhà trường, hãy tham gia chương trình thực tập sinh tại công ty VINADES.</p><p>Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC) là đơn vị chịu trách nhiệm chính trong việc phát triển phần mềm NukeViet và có nhiệm vụ hỗ trợ cộng đồng người dùng NukeViet &#91;<u><a href="http://vinades.vn/vi/about/history/" target="_blank">xem thêm giới thiệu về lịch sử hình thành VINADES</a></u>&#93;. Là công ty được thành lập từ cộng đồng phần mềm nguồn mở, hàng năm công ty dành những vị trí đặc biệt cho các bạn sinh viên được học tập, trải nghiệm, làm việc tại công ty.<br  />&nbsp;</p><h2><b>C</b><b>ác vị trí thực tập</b></h2><ul>	<li><strong>Kinh doanh:</strong> Cổng thông tin doanh nghiệp, Cổng thông tin giáo dục Edu Gate…</li>	<li><strong>Kỹ thuật:</strong> Chuyên viên đồ họa, Lập trình viên…</li></ul><h2><b>Quyền lợi của thực tập sinh</b></h2><ul>	<li>Được&nbsp;tiếp xúc với văn hóa doanh nghiệp, trải nghiệm trong môi trường làm việc chuyên nghiệp, năng động.</li>	<li>Được&nbsp;giao tiếp và học hỏi kiến thức từ những SEO, các lập trình viên chính của đội code NukeViet; qua đó&nbsp;nâng cao không chỉ kỹ năng chuyên môn liên quan đến công việc mà còn các kỹ năng mềm trong quá trình làm việc hàng ngày.</li>	<li>Có cơ hội tìm hiểu, phát triển định hướng của bản thân.</li>	<li>Tham gia các chương trình ngoại khóa, các hoạt động nội bộ của công ty.</li>	<li>Cơ&nbsp;hội được học việc để trở thành nhân viên chính thức nếu có kết quả thực tập tốt.</li>	<li>Thực tập không hưởng lương nhưng có thể được trả thù lao cho một số công việc được giao theo đơn hàng.</li></ul><h2><b>Thời gian làm việc</b></h2><ul>	<li>Toàn thời gian cố định hoặc làm online.</li>	<li>Thời gian làm việc là:&nbsp;8:00 – 17:00, Thứ hai – Thứ sáu</li>	<li>Ngày làm việc và thời gian làm việc có thể thay đổi linh hoạt tùy thuộc vào điều kiện của ứng viên và tình hình thực tế.</li></ul><h2><b>Đối tượng và điều kiện ứng tuyển</b></h2><p>Tất cả các bạn sinh viên năm cuối/mới tốt nghiệp các trường CĐ - ĐH đáp ứng được những yêu cầu sau:</p><ul>	<li>Sinh viên khối ngành kinh tế: yêu thích marketing online, mong muốn thực tập trong lĩnh vực kinh doanh phần mềm.</li>	<li>Sinh viên khối ngành kỹ thuật: yêu thích thiết kế, lập trình web.</li></ul><p>Có kỹ năng giao tiếp và tư duy logic tốt, năng động và ham học hỏi.</p><p>Có máy tính xách tay để làm việc.</p><p>Ưu tiên các ứng viên đam mê phần mềm nguồn mở, đặc biệt là các ứng viên đã từng tham gia và có bài viết diễn đàn NukeViet (<a href="http://forum.nukeviet.vn/">forum.nukeviet.vn</a>).</p><h2><b>Cách thức ứng tuyển</b></h2><p>Gửi bản mềm đơn đăng ký ứng tuyển tới:&nbsp;<a href="mailto:tuyendung@vinades.vn">tuyendung@vinades.vn</a>;</p><p>Tiêu đề mail ghi rõ: &#91;Họ tên&#93; –Ứng tuyển thực tập &#91;Bộ phận ứng tuyển&#93;.</p><p>Ví dụ: Lê Văn Nam –&nbsp;Ứng tuyển thực tập sinh bộ phận đồ họa</p><p>Hồ sơ bản cứng cần chuẩn bị (sẽ gửi sau nếu đạt yêu cầu) gồm:</p><ul>	<li>Giấy khám sức khoẻ của cơ quan y tế</li>	<li>Bản sao giấy khai sinh (có công chứng).</li>	<li>Bản sao quá trình học tập (bảng điểm tốt nghiệp), các văn bằng chứng chỉ (có công chứng) nếu đã tốt nghiệp.</li>	<li>Sơ yếu lý lịch có xác nhận của cơ quan công tác trước đó (nếu có) hoặc xác nhận của chính quyền địa phương nơi bạn đăng ký hộ khẩu thường trú.</li>	<li>Chứng minh thư (photo không cần công chứng).</li>	<li>Thư giới thiệu (nếu có)</li>	<li>Ảnh 4x6: 4 chiếc (đã bao gồm 1 chiếc gắn trên sơ yếu lý lịch).</li></ul><p><br  /><strong>Chi tiết vui lòng tham khảo tại:</strong>&nbsp;<a href="http://vinades.vn/vi/news/Tuyen-dung/" target="_blank">http://vinades.vn/vi/news/Tuyen-dung/</a><br  /><br  /><strong>Mọi thắc mắc vui lòng liên hệ:</strong></p><blockquote><p><strong>Công ty cổ phần phát triển nguồn mở Việt Nam.</strong><br  />Trụ sở chính: Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.<br  /><br  />- Tel: +84-24-85872007 - Fax: +84-24-35500914<br  />- Email:&nbsp;<a href="mailto:contact@vinades.vn">contact@vinades.vn</a>&nbsp;- Website:&nbsp;<a href="http://www.vinades.vn/">http://www.vinades.vn</a></p></blockquote>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0);
INSERT INTO `hn4_vi_news_detail` (`id`, `titlesite`, `description`, `bodyhtml`, `voicedata`, `keywords`, `sourcetext`, `files`, `imgposition`, `layout_func`, `copyright`, `allowed_send`, `allowed_print`, `allowed_save`, `auto_nav`) VALUES
(10, '', '', '<p>Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC) là đơn vị chịu trách nhiệm chính trong việc phát triển phần mềm NukeViet và có nhiệm vụ hỗ trợ cộng đồng người dùng NukeViet &#91;<u><a href="http://vinades.vn/vi/about/history/" target="_blank">xem thêm giới thiệu về lịch sử hình thành VINADES</a></u>&#93;.</p><p>Nếu bạn yêu thích phần mềm nguồn mở, triết lý của phần mềm tự do nguồn mở hoặc đơn giản là yêu NukeViet, hãy liên hệ ngay để gia nhập công ty VINADES, cùng chúng tôi phát triển NukeViet – Phần mềm nguồn mở Việt Nam – và tạo ra những sản phẩm web tuyệt vời cho cộng đồng.</p><h2><b>Các vị trí nhận học việc</b></h2><ul>	<li><strong>Kinh doanh:</strong> Cổng thông tin doanh nghiệp, Cổng thông tin giáo dục Edu Gate…</li>	<li><strong>Kỹ thuật:</strong> Chuyên viên đồ họa, Lập trình viên…</li></ul><h2><b>Quyền lợi của học viên</b></h2><ul>	<li>Được hưởng trợ cấp ăn trưa.</li>	<li>Được trợ cấp vé gửi xe.</li>	<li>Được hưởng lương khoán theo từng dự án (nếu có).</li>	<li>Được hỗ trợ học phí tham gia các khóa học nâng cao các kỹ năng (nếu có).</li>	<li>Được&nbsp;tiếp xúc với văn hóa doanh nghiệp, trải nghiệm trong môi trường làm việc chuyên nghiệp, năng động.</li>	<li>Được&nbsp;giao tiếp và học hỏi kiến thức từ những SEO, các lập trình viên chính của đội code NukeViet; qua đó&nbsp;nâng cao không chỉ kỹ năng chuyên môn liên quan đến công việc mà còn các kỹ năng mềm trong quá trình làm việc hàng ngày.</li>	<li>Tham gia các chương trình ngoại khóa, các hoạt động nội bộ của công ty.</li>	<li>Cơ&nbsp;hội ưu tiên (không cần qua thử việc) trở thành nhân viên chính thức nếu có kết quả học việc tốt.</li></ul><h2><b>Thời gian làm việc</b></h2><ul>	<li>Toàn thời gian cố định hoặc làm online.</li>	<li>Thời gian làm việc là:&nbsp;8:00 – 17:00, Thứ hai – Thứ sáu</li>	<li>Ngày làm việc và thời gian làm việc có thể thay đổi linh hoạt tùy thuộc vào điều kiện của ứng viên và tình hình thực tế.</li></ul><h2><b>Đối tượng</b></h2><p>Tất cả các bạn sinh viên năm cuối/mới tốt nghiệp các trường CĐ - ĐH đáp ứng được những yêu cầu sau:</p><ul>	<li>Sinh viên khối ngành kinh tế: yêu thích marketing online, mong muốn thực tập trong lĩnh vực kinh doanh phần mềm.</li>	<li>Sinh viên khối ngành kỹ thuật: yêu thích thiết kế, lập trình web.</li></ul><p>Có kỹ năng giao tiếp và tư duy logic tốt, năng động và ham học hỏi.</p><p>Ưu tiên các ứng viên đam mê phần mềm nguồn mở, đặc biệt là các ứng viên đã từng tham gia và có bài viết diễn đàn NukeViet (<a href="http://forum.nukeviet.vn/">forum.nukeviet.vn</a>)</p><h2><b>Điều kiện</b></h2><p>Có máy tính xách tay để làm việc.</p><p>Ứng viên sẽ được ký hợp đồng học việc (có thời hạn cụ thể). Nếu được nhận vào làm việc chính thức, người lao động phải làm ở công ty ít nhất 2 năm, nếu không làm hoặc nghỉ trước thời hạn sẽ phải hoàn lại tiền đào tạo. Chi phí này được tính là 3.000.000 VND</p><p>Nếu được cử đi học, người lao động phải làm ở công ty ít nhất 2 năm, nếu không làm hoặc nghỉ trước thời hạn sẽ phải hoàn lại tiền học phí.</p><p>Thực hiện theo các quy định khác của công ty...</p><h2><b>Cách thức ứng tuyển</b></h2><p>Gửi bản mềm đơn đăng ký ứng tuyển tới:&nbsp;<a href="mailto:tuyendung@vinades.vn">tuyendung@vinades.vn</a>;</p><p>Tiêu đề mail ghi rõ: &#91;Họ tên&#93; –Ứng tuyển học việc&#91;Bộ phận ứng tuyển&#93;;</p><p>Ví dụ: Lê Văn Nam –&nbsp;Ứng tuyển học việc bộ phận đồ họa</p><p>Hồ sơ bản cứng cần chuẩn bị (sẽ gửi sau nếu đạt yêu cầu) gồm:</p><ul>	<li>Giấy khám sức khoẻ của cơ quan y tế</li>	<li>Bản sao giấy khai sinh (có công chứng).</li>	<li>Bản sao quá trình học tập (bảng điểm tốt nghiệp), các văn bằng chứng chỉ (có công chứng) nếu đã tốt nghiệp.</li>	<li>Sơ yếu lý lịch có xác nhận của cơ quan công tác trước đó (nếu có) hoặc xác nhận của chính quyền địa phương nơi bạn đăng ký hộ khẩu thường trú.</li>	<li>Chứng minh thư (photo không cần công chứng).</li>	<li>Thư giới thiệu (nếu có)</li>	<li>Ảnh 4x6: 4 chiếc (đã bao gồm 1 chiếc gắn trên sơ yếu lý lịch).</li></ul><p><br  /><strong>Chi tiết vui lòng tham khảo tại:</strong>&nbsp;<a href="http://vinades.vn/vi/news/Tuyen-dung/" target="_blank">http://vinades.vn/vi/news/Tuyen-dung/</a><br  /><br  /><strong>Mọi thắc mắc vui lòng liên hệ:</strong></p><blockquote><p><strong>Công ty cổ phần phát triển nguồn mở Việt Nam.</strong><br  />Trụ sở chính: Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội.<br  /><br  />- Tel: +84-24-85872007 - Fax: +84-24-35500914<br  />- Email:&nbsp;<a href="mailto:contact@vinades.vn">contact@vinades.vn</a>&nbsp;- Website:&nbsp;<a href="http://www.vinades.vn/">http://www.vinades.vn</a></p></blockquote>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(11, '', '', '<div class="details-content clearfix" id="bodytext"><strong>Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo có gì mới?</strong><br  /><br  />Trong các hướng dẫn thực hiện nhiệm vụ CNTT từ năm 2010 đến nay liên tục chỉ đạo việc đẩy mạnh công tác triển khai sử dụng phần mềm nguồn mở trong nhà trường và các cơ quan quản lý giáo dục. Tuy nhiên Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo có nhiều thay đổi mạnh mẽ đáng chú ý, đặc biệt việc chỉ đạo triển khai các phần mềm nguồn mở vào trong các cơ sở quản lý giao dục được rõ ràng và cụ thể hơn rất nhiều.<br  /><br  />Một điểm thay đổi đáng chú ý đối với phần mềm nguồn mở, trong đó đã thay hẳn thuật ngữ &quot;phần mềm tự do mã nguồn mở&quot; hoặc &quot;phần mềm mã nguồn mở&quot; thành &quot;phần mềm nguồn mở&quot;, phản ánh xu thế sử dụng thuật ngữ phần mềm nguồn mở đã phổ biến trong cộng đồng nguồn mở thời gian vài năm trở lại đây.<br  /><br  /><strong>NukeViet - Phần mềm nguồn mở Việt - không chỉ được khuyến khích mà đã được hướng dẫn thực thi</strong><br  /><br  />Từ 5 năm trước, thông tư số 08/2010/TT-BGDĐT của Bộ GD&amp;ĐTquy định về sử dụng phần mềm tự do mã nguồn mở trong các cơ sở giáo dục, NukeViet đã được đưa vào danh sách các mã nguồn mở <strong>được khuyến khích sử dụng trong giáo dục</strong>. Tuy nhiên, việc sử dụng chưa được thực hiện một cách đồng bộ mà chủ yếu làm nhỏ lẻ rải rác tại một số trường, Phòng và Sở GD&amp;ĐT.<br  /><br  />Trong Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo lần này, NukeViet&nbsp; không chỉ được khuyến khích mà đã được hướng dẫn thực thi, không những thế NukeViet còn được đưa vào hầu hết các nhiệm vụ chính, cụ thể:<div><div><div>&nbsp;</div>- <strong>Nhiệm vụ số 5</strong> &quot;<strong>Công tác bồi dưỡng ứng dụng CNTT cho giáo viên và cán bộ quản lý giáo dục</strong>&quot;, mục 5.1 &quot;Một số nội dung cần bồi dưỡng&quot; có ghi &quot;<strong>Tập huấn sử dụng phần mềm nguồn mở NukeViet.</strong>&quot;<br  />&nbsp;</div>- <strong>Nhiệm vụ số 10 &quot;Khai thác, sử dụng và dạy học bằng phần mềm nguồn mở</strong>&quot; có ghi: &quot;<strong>Khai thác và áp dụng phần mềm nguồn mở NukeViet trong giáo dục.&quot;</strong><br  />&nbsp;</div>- Phụ lục văn bản, có trong nội dung &quot;Khuyến cáo khi sử dụng các hệ thống CNTT&quot;, hạng mục số 3 ghi rõ &quot;<strong>Không nên làm website mã nguồn đóng&quot; và &quot;Nên làm NukeViet: phần mềm nguồn mở&quot;.</strong><br  />&nbsp;<div>Hiện giờ văn bản này đã được đăng lên website của Bộ GD&amp;ĐT: <a href="http://moet.gov.vn/?page=1.10&amp;view=983&amp;opt=brpage" target="_blank">http://moet.gov.vn/?page=1.10&amp;view=983&amp;opt=brpage</a></div><p><br  />Hoặc có thể tải về tại đây: <a href="http://vinades.vn/vi/download/van-ban-luat/Huong-dan-thuc-hien-nhiem-vu-CNTT-nam-hoc-2015-2016/" target="_blank">http://vinades.vn/vi/download/van-ban-luat/Huong-dan-thuc-hien-nhiem-vu-CNTT-nam-hoc-2015-2016/</a></p><blockquote><p><em>Trên cơ sở hướng dẫn của Bộ GD&amp;ĐT, Công ty cổ phần phát triển nguồn mở Việt Nam và các doanh nghiệp phát triển NukeViet trong cộng đồng NukeViet đang tích cực công tác hỗ trợ cho các phòng GD&amp;ĐT, Sở GD&amp;ĐT triển khai 2 nội dung chính: Hỗ trợ công tác đào tạo tập huấn hướng dẫn sử dụng NukeViet và Hỗ trợ triển khai NukeViet cho các trường, Phòng và Sở GD&amp;ĐT.<br  /><br  />Các Phòng, Sở GD&amp;ĐT có nhu cầu có thể xem thêm thông tin chi tiết tại đây: <a href="http://vinades.vn/vi/news/thong-cao-bao-chi/Ho-tro-trien-khai-dao-tao-va-trien-khai-NukeViet-cho-cac-Phong-So-GD-DT-264/" target="_blank">Hỗ trợ triển khai đào tạo và triển khai NukeViet cho các Phòng, Sở GD&amp;ĐT</a></em></p></blockquote></div>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(12, '', '', '<div class="details-content clearfix" id="bodytext"><span style="font-size:16px;"><strong>Hỗ trợ công tác đào tạo tập huấn hướng dẫn sử dụng phần mềm nguồn mở NukeViet</strong></span><br  /><br  />Công tác hỗ trợ công tác đào tạo tập huấn hướng dẫn sử dụng phần mềm nguồn mở NukeViet sẽ được thực hiện bởi đội ngũ chuyên gia giàu kinh nghiệm về NukeViet được tuyển chọn từ lực lượng lập trình viên, chuyên viên kỹ thuật hiện đang tham gia phát triển và hỗ trợ về NukeViet từ Ban Quản Trị NukeViet và Công ty cổ phần phát triển nguồn mở Việt Nam và các đối tác thuộc Liên minh phần mềm giáo dục nguồn mở NukeViet.<br  /><br  />Với kinh nghiệm tập huấn đã được tổ chức thành công cho nhiều Phòng giáo dục và đào tạo, các chuyên gia về NukeViet sẽ giúp chuyển giao giáo trình, chương trình, kịch bản đào tạo cho các Phòng, Sở GD&amp;ĐT; hỗ trợ các giáo viên và cán bộ quản lý giáo dục sử dụng trong suốt thời gian sau đào tạo.<br  /><br  />Đặc biệt, đối với các đơn vị sử dụng NukeViet làm website và cổng thông tin đồng bộ theo quy mô cấp Phòng và Sở, cán bộ tập huấn của NukeViet sẽ có nhiều chương trình hỗ trợ khác như chương trình thi đua giữa các website sử dụng NukeViet trong cùng đơn vị cấp Phòng, Sở và trên toàn quốc; Chương trình báo cáo và giám sát và xếp hạng website hàng tháng; Chương trình tập huấn nâng cao trình độ sử dụng NukeViet hàng năm cho giáo viên và cán bộ quản lý giáo dục đang thực hiện công tác quản trị các hệ thống sử dụng nền tảng NukeViet.<br  /><br  /><span style="font-size:16px;"><strong>Hỗ trợ triển khai NukeViet cho các trường, Phòng và Sở GD&amp;ĐT</strong></span><br  /><br  />Nhằm hỗ trợ triển khai NukeViet cho các trường, Phòng và Sở GD&amp;ĐT một cách toàn diện, đồng bộ và tiết kiệm, hiện tại, Liên minh phần mềm nguồn mở giáo dục NukeViet chuẩn bị ra mắt. Liên minh này do Công ty cổ phần phát triển nguồn mở Việt Nam đứng dầu và thực hiện việc điều phối công các hỗ trợ và phối hợp giữa các đơn vị trên toàn quốc. Thành viên của liên minh là các doanh nghiệp cung cấp sản phẩm và dịch vụ phần mềm hỗ trợ cho giáo dục (kể cả những đơn vị chỉ tham gia lập trình và những đơn vị chỉ tham gia khai thác thương mại). Liên minh sẽ cùng nhau làm việc để xây dựng một hệ thống phần mềm thống nhất cho giáo dục, có khả năng liên thông và kết nối với nhau, hoàn toàn dựa trên nền tảng phần mềm nguồn mở. Liên minh cũng hỗ trợ và phân phối phần mềm cho các đơn vị làm phần mềm trong ngành giáo dục với mục tiêu là tiết kiệm tối đa chi phí trong khâu thương mại, mang tới cơ hội cho các đơn vị làm phần mềm giáo dục mà không cần phải lo lắng về việc phân phối phần mềm. Các doanh nghiệp quan tâm đến cơ hội kinh doanh bằng phần mềm nguồn mở, muốn tìm hiểu và tham gia liên minh có thể đăng ký tại đây: <a href="http://edu.nukeviet.vn/lienminh-dangky.html" target="_blank">http://edu.nukeviet.vn/lienminh-dangky.html</a><br  /><br  />Liên minh phần mềm nguồn mở giáo dục NukeViet đang cung cấp giải pháp cổng thông tin chuyên dùng cho phòng và Sở GD&amp;ĐT (NukeViet Edu Gate) cung cấp dưới dạng dịch vụ công nghệ thông tin (theo mô hình của <a href="http://vinades.vn/vi/download/van-ban-luat/Quyet-dinh-80-ve-thue-dich-vu-CNTT/" target="_blank">Quyết định số 80/2014/QĐ-TTg của Thủ tướng Chính phủ</a>) có thể hỗ trợ cho các trường, Phòng và Sở GD&amp;ĐT triển khai NukeViet ngay lập tức.<br  /><br  />Giải pháp cổng thông tin chuyên dùng cho phòng và Sở GD&amp;ĐT (NukeViet Edu Gate) có tích hợp website các trường (liên thông 3 cấp: trường - phòng - sở) cho phép tích hợp hàng ngàn website của các trường cùng nhiều dịch vụ khác trên cùng một hệ thống giúp tiết kiệm chi phí đầu tư, chi phí triển khai và bảo trì hệ thống bởi toàn bộ hệ thống được vận hành bằng một phần mềm duy nhất. Ngoài giải pháp cổng thông tin giáo dục tích hợp, Liên minh phần mềm nguồn mở giáo dục NukeViet cũng đang phát triển một số&nbsp;sản phẩm phần mềm dựa trên phần mềm nguồn mở NukeViet và sẽ sớm ra mắt trong thời gian tới.<div><br  />Hiện nay,&nbsp;NukeViet Edu Gate cũng&nbsp;đã được triển khai rộng rãi và nhận được sự ủng hộ của&nbsp;nhiều Phòng, Sở GD&amp;ĐT trên toàn quốc.&nbsp;Các phòng, sở GD&amp;ĐT quan tâm đến giải pháp NukeViet Edu Gate có thể truy cập&nbsp;<a href="http://edu.nukeviet.vn/" target="_blank">http://edu.nukeviet.vn</a>&nbsp;để tìm hiểu thêm hoặc liên hệ:<br  /><br  /><span style="font-size:14px;"><strong>Liên minh phần mềm nguồn mở giáo dục NukeViet</strong></span><br  />Đại diện: <strong>Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC)</strong><br  /><strong>Địa chỉ</strong>: Phòng 1706 - Tòa nhà CT2 Nàng Hương, 583 Nguyễn Trãi, Hà Nội<br  /><strong>Email</strong>: contact@vinades.vn, Tel: 024-85872007, <strong>Fax</strong>: 024-35500914,<br  /><strong>Hotline</strong>: 0904762534 (Mr. Hùng), 0936226385 (Ms. Ngọc),&nbsp;<span style="color: rgb(38, 38, 38); font-family: arial, sans-serif; font-size: 13px; line-height: 16px;">0904719186 (Mr. Hậu)</span><br  />Các Phòng GD&amp;ĐT, Sở GD&amp;ĐT có thể đăng ký tìm hiểu, tổ chức hội thảo, tập huấn, triển khai NukeViet trực tiếp tại đây: <a href="http://edu.nukeviet.vn/dangky.html" target="_blank">http://edu.nukeviet.vn/dangky.html</a><br  /><br  /><span style="font-size:16px;"><strong>Tìm hiểu về phương thức chuyển đổi các hệ thống website cổng thông tin sang NukeViet theo mô hình tích hợp liên thông từ trưởng, lên Phòng, Sở GD&amp;ĐT:</strong></span><br  /><br  />Đối với các Phòng, Sở GD&amp;ĐT, trường Nầm non, tiểu học, THCS, THPT... chưa có website, Liên minh phần mềm nguồn mở giáo dục NukeViet sẽ hỗ trợ triển khai NukeViet theo mô hình cổng thông tin liên cấp như quy định tại <a href="http://vinades.vn/vi/download/van-ban-luat/Thong-tu-quy-dinh-ve-ve-to-chuc-hoat-dong-su-dung-thu-dien-tu/" target="_blank">thông tư số <strong>53/2012/TT-BGDĐT</strong> của Bộ GD&amp;ĐT</a> ban hành ngày 20-12-2012 quy định về quy định về về tổ chức hoạt động, sử dụng thư điện tử và cổng thông tin điện tử tại sở giáo dục và đào tạo, phòng giáo dục và đào tạo và các cơ sở GDMN, GDPT và GDTX.<br  /><br  />Trường hợp các đơn vị có website và đang sử dụng NukeViet theo dạng rời rạc thì việc chuyển đổi và tích hợp các website NukeViet rời rạc vào NukeViet Edu Gate của Phòng và Sở có thể thực hiện dễ dàng và giữ nguyên toàn bộ dữ liệu.<br  /><br  />Trường hợp các đơn vị có website và nhưng không sử dụng NukeViet cũng có thể chuyển đổi sang sử dụng NukeViet để hợp nhất vào hệ thống cổng thông tin giáo dục cấp Phòng, Sở. Tuy nhiên mức độ và tỉ lệ dữ liệu được chuyển đổi thành công sẽ phụ thuộc vào tình hình thực tế của từng website.</div></div>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(13, '', '', '<p dir="ltr">Trải qua hơn 10 năm phát triển, từ một mã nguồn chỉ mang tính cá nhân, NukeViet đã phát triển thành công theo hướng cộng đồng. Năm 2010, NukeViet 3 ra đời đánh dấu một mốc lớn trong quá trình đi lên của NukeViet, phát triển theo hướng chuyên nghiệp với sự hậu thuẫn của Công ty cổ phần phát triển nguồn mở Việt Nam (VINADES.,JSC). NukeViet 3 đã và được sử dụng rộng rãi trong cộng đồng, từ các cổng thông tin tổ chức, hệ thống giáo dục, cho đến các website cá nhân, thương mại, mang lại các trải nghiệm vượt trội của mã nguồn thương hiệu Việt so với các mã nguồn nổi tiếng khác trên thế giới.<br  /><br  />Năm 2016, NukeViet 4 ra đời được xem là một cuộc cách mạng lớn trong chuỗi sự kiện phát triển NukeViet, cũng như xu thế công nghệ hiện tại. Hệ thống gần như được đổi mới hoàn toàn từ nhân hệ thống đến giao diện, nâng cao đáng kể hiệu suất và trải nghiệm người dùng.<br  /><br  /><span style="line-height: 1.6;"><strong>Dưới đây là một số thay đổi của NukeViet 4.</strong></span><br  /><strong><span style="line-height: 1.6;">Các thay đổi từ nhân hệ thống:</span></strong></p><ul>	<li dir="ltr">	<p dir="ltr"><strong>Các công nghệ mới được áp dụng.</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Sử dụng composer để quản lý các thư viện PHP được cài vào hệ thống.</p>		</li>		<li dir="ltr">		<p dir="ltr">Từng bước áp dụng &nbsp;các tiêu chuẩn viết code PHP theo khuyến nghị của <a href="http://www.php-fig.org/psr/">http://www.php-fig.org/psr/</a></p>		</li>		<li dir="ltr">		<p dir="ltr">Sử dụng PDO để thay cho extension MySQL.</p>		</li>	</ul>	</li></ul><ul>	<li dir="ltr">	<p dir="ltr"><strong>Tăng cường khả năng bảo mật</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Sau khi các chuyên giả bảo mật của HP gửi đánh giá, chúng tôi đã tối ưu NukeViet 4.0 để hệ thống an toàn hơn.</p>		</li>		<li dir="ltr">		<p dir="ltr">Mã hóa các mật khẩu lưu trữ trong hệ thống: Các mật khẩu như FTP, SMTP,... đã được mã hóa, bảo mật thông tin người dùng.</p>		</li>	</ul>	</li></ul><ul>	<li dir="ltr">	<p dir="ltr"><strong>Tối ưu SEO:</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">SEO được xem là một trong những ưu tiên hàng đầu được phát triển trong phiên bản này. NukeViet 4 tập trung tối ưu hóa SEO Onpage mạnh mẽ. Các công cụ hỗ trợ SEO được tập hợp lại qua module “Công cụ SEO”. Các chức năng được thêm mới:</p>		<ul>			<li dir="ltr">			<p dir="ltr">Loại bỏ tên module khỏi URL khi không dùng đa ngôn ngữ</p>			</li>			<li dir="ltr">			<p dir="ltr">Cho phép đổi đường dẫn module</p>			</li>			<li dir="ltr">			<p dir="ltr">Thêm chức năng xác thực Google+ (Bản quyền tác giả)</p>			</li>			<li dir="ltr">			<p dir="ltr">Thêm chức năng ping đến các công cụ tìm kiếm: Submit url mới đến google để việc hiển thị bài viết mới lên kết quả tìm kiếm nhanh chóng hơn.</p>			</li>			<li dir="ltr">			<p dir="ltr">Hỗ trợ Meta OG của facebook</p>			</li>			<li dir="ltr">			<p dir="ltr">Hỗ trợ chèn Meta GEO qua Cấu hình Meta-Tags</p>			</li>		</ul>		</li>		<li dir="ltr">		<p dir="ltr">Cùng với đó, các module cũng được tối ưu hóa bằng các form hỗ trợ khai báo tiêu đề, mô tả (description), từ khóa (keywods) cho từng khu vực, từng trang. &nbsp;</p>		</li>		<li dir="ltr">		<p dir="ltr">Với sự hỗ trợ tối đa này, người quản trị (admin) có thể tùy biến lại website theo phong cách SEO riêng biệt.</p>		</li>	</ul>	</li>	<li dir="ltr">	<p dir="ltr"><strong>Thay đổi giao diện, sử dụng giao diện tuỳ biến</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Giao diện trong NukeViet 4 được làm mới, tương thích với nhiều màn hình hơn.</p>		</li>		<li dir="ltr">		<p dir="ltr">Sử dụng thư viện bootstrap để việc phát triển giao diện thống nhất và dễ dàng hơn.</p>		</li>	</ul>	</li>	<li dir="ltr">	<p dir="ltr"><strong>Hệ thống nhận thông báo:&nbsp;</strong><span style="line-height: 1.6;">Có thể gọi đây là một tiện ích nhỏ, song nó rất hữu dụng để admin tương tác với hệ thống một cách nhanh chóng. Admin có thể nhận thông báo từ hệ thống (hoặc từ module) khi có sự kiện nào đó.</span></p>	</li></ul><p dir="ltr" style="margin-left: 40px;"><strong>Ví dụ:</strong> Khi có khách gửi liên hệ (qua module contact) đến thì hệ thống xuất hiện biểu tượng thông báo “Có liên hệ mới” ở góc phải, Admin sẽ nhận được ngay lập tức thông báo khi người dùng đang ở Admin control panel (ACP).</p><ul>	<li dir="ltr">	<p dir="ltr"><strong>Thay đổi cơ chế quản lý block:</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Nhận thấy việc hiển thị block ở lightbox trong NukeViet 3 dẫn đến một số bất tiện trong quá trình quản lý, NukeViet 4 đã thay thế cách hiển thị này ở dạng cửa sổ popup. Dễ nhận thấy sự thay đổi này khi admin thêm (hoặc sửa) một block nào đó.</p>		</li>		<li dir="ltr">		<p dir="ltr">“Cấu hình hiển thị block trên các thiết bị” cũng được đưa vào phần cấu hình block, admin có thể tùy chọn cho phép block hiển thị trên các thiết bị nào (tất cả thiết bị, thiết bị di động, máy tính bảng, thiết bị khác).<span style="line-height: 1.6;">&nbsp;</span></p>		</li>	</ul>	</li></ul><ul>	<li dir="ltr">	<p dir="ltr"><strong>Thêm ngôn ngữ tiếng Pháp:</strong> website cài đặt mới có sẵn 3 ngôn ngữ mặc định là Việt, Anh và Pháp.</p>	</li></ul><p dir="ltr"><strong>Các thay đổi của module:</strong></p><ul>	<li dir="ltr">	<p dir="ltr"><strong>Module menu:</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Phương án quản lý menu được thay đổi hướng tới việc quản lý menu nhanh chóng, tiện lợi nhất cho admin. Admin có thể nạp nhanh menu theo các tùy chọn mà hệ thống cung cấp.</p>		</li>		<li dir="ltr">		<p dir="ltr">Mẫu menu cũng được thay đổi, đa dạng và hiển thị tốt với các giao diện hiện đại.</p>		</li>	</ul>	</li>	<li dir="ltr">	<p dir="ltr"><strong>Module contact (Liên hệ):</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Bổ sung các trường thông tin về bộ phận (Điện thoại, fax, email, các trường liên hệ khác,...).</p>		</li>		<li dir="ltr">		<p dir="ltr">Admin có thể trả lời khách nhiều lần, hệ thống lưu lại lịch sử trao đổi đó.</p>		</li>	</ul>	</li>	<li dir="ltr">	<p dir="ltr"><strong>Module users (Tài khoản):</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Thay thế OpenID bằng thư viện OAuth - hỗ trợ tích hợp đăng nhập qua tài khoản mạng xã hội</p>		</li>		<li dir="ltr">		<p dir="ltr">Cho phép đăng nhập 1 lần tài khoản người dùng NukeViet với Alfresco, Zimbra, Moodle, Koha</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm chức năng tùy biến trường dữ liệu thành viên</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm chức năng phân quyền sử dụng module users</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm cấu hình: Số ký tự username, độ phức tạp mật khẩu, tạo mật khảu ngẫu nhiên,....</p>		</li>		<li dir="ltr">		<p dir="ltr">Cho phép sử dụng tên truy cập, hoặc email để đăng nhập</p>		</li>	</ul>	</li>	<li dir="ltr">	<p dir="ltr"><strong>Module about:</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Module about ở NukeViet 3 được đổi tên thành module page</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm các cấu hình hỗ trợ SEO: Ảnh minh họa, chú thích ảnh minh họa, mô tả, từ khóa cho bài viết, hiển thị các công cụ tương tác với các mạng xã hội.</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm RSS</p>		</li>		<li dir="ltr">		<p dir="ltr">Cấu hình phương án hiển thị các bài viết trên trang chính</p>		</li>	</ul>	</li>	<li dir="ltr">	<p dir="ltr"><strong>Module news (Tin tức):</strong></p>	<ul>		<li dir="ltr">		<p dir="ltr">Thêm phân quyền cho người quản lý module, đến từng chủ đề</p>		</li>		<li dir="ltr">		<p dir="ltr">Thay đổi phương án lọc từ khóa bài viết, lọc từ khóa theo các từ khóa đã có trong tags thay vì đọc từ từ điển.</p>		</li>		<li dir="ltr">		<p dir="ltr">Bổ sung các trạng thái bài viết</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm cấu hình mặc định hiển thị ảnh minh họa trên trang xem chi tiết bài viết</p>		</li>		<li dir="ltr">		<p dir="ltr">Thêm các công cụ tương tác với mạng xã &nbsp;hội.</p>		</li>	</ul>	</li></ul><p dir="ltr"><strong>Quản lý Bình luận</strong></p><ul>	<li dir="ltr">	<p dir="ltr">Các bình luận của các module sẽ được tích hợp quản lý tập trung để cấu hình.</p>	</li>	<li dir="ltr">Khi xây dựng mới module, Chỉ cần nhúng 1 đoạn mã vào. Tránh phải việc copy mã code gây khó khăn cho bảo trì.</li></ul>', NULL, '', '', NULL, 2, '', 0, 1, 1, 1, 0),
(14, '', '', '<strong>Hệ thống:</strong><br  />- Sửa code theo khuyến nghị của codacy: https://www.codacy.com/app/nukeviet/nukeviet/dashboard<br  />- Cải thiện an ninh hệ thống theo đánh giá của các phần mềm bảo mật OWASP ZAP 2.6<br  />- Cải tiến chức năng Rewrite<br  />- Thêm tính năng bật tắt sitemap cho các module<br  />- Thêm link hướng dẫn sử dụng website dẫn tới từng chức năng tại https://wiki.nukeviet.vn/<br  />- Cập nhật trình soạn thảo&nbsp; CKEditor 4.7.1 để hỗ trợ việc copy nội dung từ Word, Excel, Hỗ trợ việc kéo thả ảnh, file từ máy tính vào trình soạn thảo tốt hơn: http://ckeditor.com/blog/CKEditor-4.7-released<br  />- Tích hợp thêm <a href=\\"https://nukeviet.vn/vi/news/Tin-tuc/nukeviet-4-1-se-ho-tro-redis-de-cache-435.html\\">Redis để cache</a> cho hệ thống<br  /><br  /><strong>Module Tài khoản:</strong><br  />- Tùy biến các trường hệ thống của module users giúp quản trị có thể cho ẩn/hiện khi đăng ký và đổi tên các trường này.<br  />- Thêm chức năng&nbsp; xác thực hai bước cho từng nhóm thành viên, Cấu hình yêu cầu xác thực hai bước cho từng nhóm thành viên.<br  />- Tích hợp reCAPTCHA<br  /><br  /><strong>Module Tin tức:</strong><br  />- Thêm cấu hình có bật tính năng copy bài viết, để dùng module này đăng cái bài viết có cạc trình bày tương tự nhau.<br  />- Cải thiện tính năng cho bài viết Facebook Instant Articles<br  />- Cảnh báo tránh cùng&nbsp; một lúc nhiều người sửa bài viết.<br  /><br  /><strong>Module banners</strong><br  />- Bỏ phần quản lý khách hàng tại quảng cáo, chuyển sang dùng tài khoản chung của site<br  />- Phần cấu hình khối quảng cáo được viết lại để cấu hình nhóm&nbsp; thành viên được đăng quảng cáo ngoài site, sau đó quản trị duyệt lại quảng cáo để hiển thị ngoài site.<br  />- Thêm cấu hình về thời gian chung áp dụng cho quảng cáo theo khối.<br  />- Sửa lại link quản cáo để tránh các click ảo.<br  />- Sửa hiển thị quản lý quảng cáo để tiện quản lý hơn.<br  /><br  />Và nhiều cập nhật sửa lỗi khác, xem chi tiết tại: https://github.com/nukeviet/nukeviet/blob/develop/CHANGELOG.txt<br  />', NULL, '', 'https://nukeviet.vn/vi/news/Tin-tuc/nukeviet-4-2-co-gi-moi-505.html', NULL, 2, '', 0, 1, 1, 1, 0),
(15, '', '', '<strong>Hệ thống:</strong><br  />- Thay đổi phần quản lý block để dễ dùng hơn khi module có quá nhiều chức năng.<br  />- Thêm các tham số cấu hình&nbsp; SSL cho&nbsp; SMTP<br  />- Module Upload: Thêm cấu hình có thể chia nhỏ các file khi upload để có thể upload<br  />- Plugin:Thêm vị trí chạy sau khi thực hiện module, cải tiến mỗi Plugin sẽ chạy được ở các vị trí nhất định theo người lập trình quy định.<br  />- Tích hợp thêm thư viện PDF.js<br  />- Thêm tính năng xuất dữ liệu mẫu để khi tiết hành cài đặt có thể dựng luôn site hoàn chỉnh tường tự như cài đặt NukeViet eGovernment<br  /><br  /><strong>Module comment: </strong><br  />- Cho phép cấu hình có sử dụng trình soạn thảo ở phần bình luận hay không.<br  />- Cho phép cấu hình có sử dụng file đính kèm ở phần bình luận hay không.<br  />- Module news: Allow deactive category, allow search for locked posts, Allows attaching files to posts<br  />- Config module display on admin index for authors<br  />&nbsp;<br  /><strong>Module Tài khoản:</strong><br  />- Module users: Allowed to delete and change status multiple account, fix block login, update Openid icon, fix sort groups, fix delete group<br  />- Người điều hành chung của site có thể cấu hình 1 số thông số. (Lúc trước chỉ quản trị tối cao mới cấu hình được)<br  />- Với mỗi tài khoản quản trị, có thể chọn module mặc định sau khi đăng nhập quản trị.<br  /><br  /><strong>Module Tin tức:</strong><br  />-&nbsp; Thay đổi chức năng quản lý chủ đề có thể: Hiển thị trên trang chủ, không hiển thị trên trang chủ hoặc Khóa chủ đề.<br  />-&nbsp; Cho phép đính kèm file vào các bài viết (Không cần thông qua trình soạn thảo)<br  />- Thêm tính năng sắp xếp các bài viết.<br  />- Cho phép cấu hình layout khi xem chi tiết bài viết (Tưong tự module page đã có trước)<br  /><br  /><strong>Module page</strong><br  />-&nbsp; Thêm cấu hình alias lower khi thêm bài viết mới.<br  /><br  />Và nhiều cập nhật sửa lỗi khác, xem chi tiết tại: <a href="https://github.com/nukeviet/nukeviet/blob/develop/CHANGELOG.txt">https://github.com/nukeviet/nukeviet/blob/develop/CHANGELOG.txt</a>', NULL, '', 'https://nukeviet.vn/vi/news/Tin-tuc/nukeviet-4-3-co-gi-moi-540.html', NULL, 2, '', 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_logs`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_logs` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `sid` mediumint(8) NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `log_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Khóa loại log, tùy vào lập trình',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `set_time` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `log_key` (`log_key`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_report`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `newsid` int(11) unsigned NOT NULL DEFAULT '0',
  `md5content` char(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_ip` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_time` int(11) NOT NULL DEFAULT '0',
  `orig_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `repl_content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `newsid_md5content_post_ip` (`newsid`,`md5content`,`post_ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_rows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourceid` mediumint(8) NOT NULL DEFAULT '0',
  `addtime` int(11) unsigned NOT NULL DEFAULT '0',
  `edittime` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgthumb` tinyint(4) NOT NULL DEFAULT '0',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hitscm` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_rating` int(11) NOT NULL DEFAULT '0',
  `click_rating` int(11) NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `catid` (`catid`),
  KEY `topicid` (`topicid`),
  KEY `admin_id` (`admin_id`),
  KEY `author` (`author`),
  KEY `title` (`title`),
  KEY `addtime` (`addtime`),
  KEY `edittime` (`edittime`),
  KEY `publtime` (`publtime`),
  KEY `exptime` (`exptime`),
  KEY `status` (`status`),
  KEY `instant_active` (`instant_active`),
  KEY `instant_creatauto` (`instant_creatauto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=16 ;

--
-- Dumping data for table `hn4_vi_news_rows`
--

INSERT INTO `hn4_vi_news_rows` (`id`, `catid`, `listcatid`, `topicid`, `admin_id`, `author`, `sourceid`, `addtime`, `edittime`, `status`, `weight`, `publtime`, `exptime`, `archive`, `title`, `alias`, `hometext`, `homeimgfile`, `homeimgalt`, `homeimgthumb`, `inhome`, `allowed_comm`, `allowed_rating`, `external_link`, `hitstotal`, `hitscm`, `total_rating`, `click_rating`, `instant_active`, `instant_template`, `instant_creatauto`) VALUES
(1, 1, '1,5,7', 0, 1, 'Quỳnh Nhi', 1, 1274989177, 1275318126, 1, 1, 1274989140, 0, 2, 'Ra mắt công ty mã nguồn mở đầu tiên tại Việt Nam', 'Ra-mat-cong-ty-ma-nguon-mo-dau-tien-tai-Viet-Nam', 'Mã nguồn mở NukeViet vốn đã quá quen thuộc với cộng đồng CNTT Việt Nam trong mấy năm qua. Tuy chưa hoạt động chính thức, nhưng chỉ trong khoảng 5 năm gần đây, mã nguồn mở NukeViet đã được dùng phổ biến ở Việt Nam, áp dụng ở hầu hết các lĩnh vực, từ tin tức đến thương mại điện tử, từ các website cá nhân cho tới những hệ thống website doanh nghiệp.', 'nangly.jpg', 'Thành lập VINADES.,JSC', 1, 1, '6', 1, 0, 2, 0, 0, 0, 0, '', 0),
(2, 7, '1,7', 0, 1, 'Nguyễn Thế Hùng', 7, 1453192444, 1453192444, 1, 12, 1453192444, 0, 2, 'Hãy trở thành nhà cung cấp dịch vụ của NukeViet&#33;', 'hay-tro-thanh-nha-cung-cap-dich-vu-cua-nukeviet', 'Nếu bạn là công ty hosting, là công ty thiết kế web có sử dụng mã nguồn NukeViet, là cơ sở đào tạo NukeViet hay là công ty bất kỳ có kinh doanh dịch vụ liên quan đến NukeViet... hãy cho chúng tôi biết thông tin liên hệ của bạn để NukeViet hỗ trợ bạn trong công việc kinh doanh nhé!', 'hoptac.jpg', '', 1, 1, '6', 1, 0, 14, 0, 0, 0, 0, '', 0),
(3, 4, '4', 0, 1, 'Phạm Quốc Tiến', 2, 1453192400, 1453192400, 1, 11, 1453192400, 0, 2, 'Tuyển dụng lập trình viên PHP phát triển NukeViet', 'Tuyen-dung-lap-trinh-vien-PHP', 'Bạn đam mê nguồn mở? Bạn đang cần tìm một công việc phù hợp với thế mạnh của bạn về PHP và MySQL? Hãy gia nhập VINADES.,JSC để xây dựng mã nguồn mở hàng đầu cho Việt Nam.', 'tuyendung-kythuat.jpg', 'Tuyển dụng', 1, 1, '6', 1, 0, 0, 0, 0, 0, 0, '', 0),
(4, 4, '4', 0, 1, 'Phạm Quốc Tiến', 0, 1445391089, 1445394192, 1, 5, 1445391060, 0, 2, 'Tuyển dụng chuyên viên đồ hoạ phát triển NukeViet', 'Tuyen-dung-chuyen-vien-do-hoa', 'Bạn đam mê nguồn mở? Bạn là chuyên gia đồ họa? Chúng tôi sẽ giúp bạn hiện thực hóa ước mơ của mình với một mức lương đảm bảo. Hãy gia nhập VINADES.,JSC để xây dựng mã nguồn mở hàng đầu cho Việt Nam.', 'tuyendung-kythuat.jpg', 'Tuyển dụng', 1, 1, '6', 1, 0, 0, 0, 0, 0, 0, '', 0),
(5, 4, '4', 0, 1, 'Phạm Quốc Tiến', 0, 1445391090, 1445394193, 1, 6, 1445391060, 0, 2, 'Tuyển dụng lập trình viên front-end (HTML/CSS/JS) phát triển NukeViet', 'Tuyen-dung-lap-trinh-vien-front-end-HTML-CSS-JS', 'Bạn đam mê nguồn mở? Bạn đang cần tìm một công việc phù hợp với thế mạnh của bạn về front-end (HTML/CSS/JS)? Hãy gia nhập VINADES.,JSC để xây dựng mã nguồn mở hàng đầu cho Việt Nam.', 'tuyendung-kythuat.jpg', 'Tuyển dụng', 1, 1, '6', 1, 0, 0, 0, 0, 0, 0, '', 0),
(6, 1, '1,6', 0, 1, '', 3, 1322685920, 1322686042, 1, 2, 1322685920, 0, 2, 'Mã nguồn mở NukeViet giành giải ba Nhân tài đất Việt 2011', 'Ma-nguon-mo-NukeViet-gianh-giai-ba-Nhan-tai-dat-Viet-2011', 'Không có giải nhất và giải nhì, sản phẩm Mã nguồn mở NukeViet của VINADES.,JSC là một trong ba sản phẩm đã đoạt giải ba Nhân tài đất Việt 2011 - Lĩnh vực Công nghệ thông tin (Sản phẩm đã ứng dụng rộng rãi).', 'nukeviet-nhantaidatviet2011.jpg', 'Mã nguồn mở NukeViet giành giải ba Nhân tài đất Việt 2011', 1, 1, '6', 1, 0, 1, 0, 0, 0, 0, '', 0),
(7, 1, '1', 0, 1, '', 4, 1445309676, 1445309676, 1, 3, 1445309520, 0, 2, 'NukeViet được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước', 'nukeviet-duoc-uu-tien-mua-sam-su-dung-trong-co-quan-to-chuc-nha-nuoc', 'Ngày 5/12/2014, Bộ trưởng Bộ TT&TT Nguyễn Bắc Son đã ký ban hành Thông tư 20/2014/TT-BTTTT (Thông tư 20) quy định về các sản phẩm phần mềm nguồn mở (PMNM) được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước. NukeViet (phiên bản 3.4.02 trở lên) là phần mềm được nằm trong danh sách này.', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', 'NukeViet được ưu tiên mua sắm, sử dụng trong cơ quan, tổ chức nhà nước', 1, 1, '4', 1, 0, 2, 0, 0, 0, 0, '', 0),
(8, 4, '4', 0, 1, 'Vũ Bích Ngọc', 0, 1445391061, 1445394203, 1, 4, 1445391000, 0, 2, 'Công ty VINADES tuyển dụng nhân viên kinh doanh', 'cong-ty-vinades-tuyen-dung-nhan-vien-kinh-doanh', 'Công ty cổ phần phát triển nguồn mở Việt Nam là đơn vị chủ quản của phần mềm mã nguồn mở NukeViet - một mã nguồn được tin dùng trong cơ quan nhà nước, đặc biệt là ngành giáo dục. Chúng tôi cần tuyển 05 nhân viên kinh doanh cho lĩnh vực này.', 'tuyen-dung-nvkd.png', '', 1, 1, '4', 1, 0, 0, 0, 0, 0, 0, '', 0),
(9, 1, '1,4', 0, 1, 'Trần Thị Thu', 0, 1445391118, 1445394180, 1, 7, 1445391060, 0, 2, 'Chương trình thực tập sinh tại công ty VINADES', 'chuong-trinh-thuc-tap-sinh-tai-cong-ty-vinades', 'Cơ hội để những sinh viên năng động được học tập, trải nghiệm, thử thách sớm với những tình huống thực tế, được làm việc cùng các chuyên gia có nhiều kinh nghiệm của công ty VINADES.', 'thuc-tap-sinh.jpg', '', 1, 1, '4', 1, 0, 0, 0, 0, 0, 0, '', 0),
(10, 4, '4', 0, 1, 'Trần Thị Thu', 0, 1445391135, 1445394444, 1, 8, 1445391120, 0, 2, 'Học việc tại công ty VINADES', 'hoc-viec-tai-cong-ty-vinades', 'Công ty cổ phần phát triển nguồn mở Việt Nam tạo cơ hội việc làm và học việc miễn phí cho những ứng viên có đam mê thiết kế web, lập trình PHP… được học tập và rèn luyện cùng đội ngũ lập trình viên phát triển NukeViet.', 'hoc-viec-tai-cong-ty-vinades.jpg', '', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0),
(11, 1, '1', 0, 1, '', 0, 1445391182, 1445394133, 1, 9, 1445391120, 0, 2, 'NukeViet được Bộ GD&amp;ĐT đưa vào Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016', 'nukeviet-duoc-bo-gd-dt-dua-vao-huong-dan-thuc-hien-nhiem-vu-cntt-nam-hoc-2015-2016', 'Trong Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo, NukeViet được đưa vào các hạng mục: Tập huấn sử dụng phần mềm nguồn mở cho giáo viên và cán bộ quản lý giáo dục; Khai thác, sử dụng và dạy học; đặc biệt phần &quot;khuyến cáo khi sử dụng các hệ thống CNTT&quot; có chỉ rõ &quot;Không nên làm website mã nguồn đóng&quot; và &quot;Nên làm NukeViet: phần mềm nguồn mở&quot;.', 'nukeviet-cms.jpg', '', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0),
(12, 1, '1,3', 0, 1, '', 0, 1445391217, 1445393997, 1, 10, 1445391180, 0, 2, 'Hỗ trợ tập huấn và triển khai NukeViet cho các Phòng, Sở GD&amp;ĐT', 'ho-tro-tap-huan-va-trien-khai-nukeviet-cho-cac-phong-so-gd-dt', 'Trên cơ sở Hướng dẫn thực hiện nhiệm vụ CNTT năm học 2015 - 2016 của Bộ Giáo dục và Đào tạo, Công ty cổ phần phát triển nguồn mở Việt Nam và các doanh nghiệp phát triển NukeViet trong cộng đồng NukeViet đang tích cực công tác hỗ trợ cho các phòng GD&ĐT, Sở GD&ĐT triển khai 2 nội dung chính: Hỗ trợ công tác đào tạo tập huấn hướng dẫn sử dụng NukeViet và Hỗ trợ triển khai NukeViet cho các trường, Phòng và Sở GD&ĐT', 'tap-huan-pgd-ha-dong-2015.jpg', 'Tập huấn triển khai NukeViet tại Phòng Giáo dục và Đào tạo Hà Đông - Hà Nội', 1, 1, '4', 1, 0, 1, 0, 0, 0, 0, '', 0),
(13, 2, '2', 0, 1, 'VINADES', 0, 1453194455, 1453194455, 1, 13, 1453194455, 0, 2, 'NukeViet 4.0 có gì mới?', 'nukeviet-4-0-co-gi-moi', 'NukeViet 4 là phiên bản NukeViet được cộng đồng đánh giá cao, hứa hẹn nhiều điểm vượt trội về công nghệ đến thời điểm hiện tại. NukeViet 4 thay đổi gần như hoàn toàn từ nhân hệ thống đến chức năng, giao diện người dùng. Vậy, có gì mới trong phiên bản này?', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', '', 1, 1, '4', 1, 0, 4, 0, 0, 0, 0, '', 0),
(14, 2, '2', 0, 1, 'VINADES', 0, 1501837620, 1501837620, 1, 14, 1501837620, 0, 2, 'NukeViet 4.2 có gì mới?', 'nukeviet-4-2-co-gi-moi', 'NukeViet 4.2 là phiên bản nâng cấp của phiên bản NukeViet 4.0 tập trung vào việc fix các vấn đề bất cập còn tồn tại của NukeViet 4.0, Thêm các tính năng mới để tăng cường bảo mật của hệ thống cũng như tối ưu trải nghiệm của người dùng.', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', '', 1, 1, '4', 1, 1, 2, 0, 0, 0, 0, '', 0),
(15, 2, '2', 0, 1, 'VINADES', 0, 1510215907, 1510215907, 1, 15, 1510215907, 0, 2, 'NukeViet 4.3 có gì mới?', 'nukeviet-4-3-co-gi-moi', 'NukeViet 4.3 là phiên bản nâng cấp của phiên bản NukeViet 4.2 tập trung vào việc fix các vấn đề bất cập còn tồn tại, tối ưu trải nghiệm của người dùng.', 'chuc-mung-nukeviet-thong-tu-20-bo-tttt.jpg', '', 1, 1, '4', 1, 1, 2, 0, 0, 0, 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_row_histories`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_row_histories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `new_id` int(11) unsigned NOT NULL DEFAULT '0',
  `historytime` int(11) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listcatid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `topicid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'ID người đăng',
  `author` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sourceid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `publtime` int(11) unsigned NOT NULL DEFAULT '0',
  `exptime` int(11) unsigned NOT NULL DEFAULT '0',
  `archive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hometext` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `homeimgfile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `homeimgalt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `inhome` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowed_comm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `allowed_rating` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `external_link` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `instant_active` tinyint(1) NOT NULL DEFAULT '0',
  `instant_template` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `instant_creatauto` tinyint(1) NOT NULL DEFAULT '0',
  `titlesite` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bodyhtml` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `voicedata` text COLLATE utf8mb4_unicode_ci COMMENT 'Data giọng đọc json',
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `sourcetext` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `files` text COLLATE utf8mb4_unicode_ci,
  `tags` text COLLATE utf8mb4_unicode_ci,
  `internal_authors` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `imgposition` tinyint(1) NOT NULL DEFAULT '1',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `copyright` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_send` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_print` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_save` tinyint(1) NOT NULL DEFAULT '0',
  `auto_nav` tinyint(1) NOT NULL DEFAULT '0',
  `changed_fields` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Các field thay đổi',
  PRIMARY KEY (`id`),
  KEY `new_id` (`new_id`),
  KEY `historytime` (`historytime`),
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Lịch sử bài viết' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_sources`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_sources` (
  `sourceid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) unsigned NOT NULL,
  `edit_time` int(11) unsigned NOT NULL,
  PRIMARY KEY (`sourceid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hn4_vi_news_sources`
--

INSERT INTO `hn4_vi_news_sources` (`sourceid`, `title`, `link`, `logo`, `weight`, `add_time`, `edit_time`) VALUES
(1, 'Báo Hà Nội Mới', 'http://hanoimoi.com.vn', '', 1, 1274989177, 1274989177),
(2, 'VINADES.,JSC', 'http://vinades.vn', '', 2, 1274989787, 1274989787),
(3, 'Báo điện tử Dân Trí', 'http://dantri.com.vn', '', 3, 1322685396, 1322685396),
(4, 'Bộ Thông tin và Truyền thông', 'http://http://mic.gov.vn', '', 4, 1445309676, 1445309676);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_tags`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_tags` (
  `tid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `numnews` mediumint(8) NOT NULL DEFAULT '0',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`tid`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `hn4_vi_news_tags`
--

INSERT INTO `hn4_vi_news_tags` (`tid`, `numnews`, `title`, `alias`, `image`, `description`, `keywords`) VALUES
(1, 0, 'Nguồn mở', 'nguồn-mở', '', '', 'nguồn mở'),
(2, 0, 'Quen thuộc', 'quen-thuộc', '', '', 'quen thuộc'),
(3, 0, 'Cộng đồng', 'cộng-đồng', '', '', 'cộng đồng'),
(4, 0, 'Việt Nam', 'việt-nam', '', '', 'việt nam'),
(5, 0, 'Hoạt động', 'hoạt-động', '', '', 'hoạt động'),
(6, 0, 'Tin tức', 'tin-tức', '', '', 'tin tức'),
(7, 1, 'Thương mại điện', 'thương-mại-điện', '', '', 'thương mại điện'),
(8, 0, 'Điện tử', 'điện-tử', '', '', 'điện tử'),
(9, 13, 'Nukeviet', 'nukeviet', '', '', 'nukeviet'),
(10, 8, 'VINADES', 'vinades', '', '', 'vinades'),
(11, 3, 'Lập trình viên', 'lập-trình-viên', '', '', 'lập trình viên'),
(12, 3, 'Chuyên viên đồ họa', 'chuyên-viên-đồ-họa', '', '', 'chuyên viên đồ họa'),
(13, 3, 'Php', 'php', '', '', 'php'),
(14, 2, 'Mysql', 'mysql', '', '', 'mysql'),
(15, 1, 'Nhân tài đất Việt 2011', 'nhân-tài-đất-việt-2011', '', '', 'nhân tài đất việt 2011'),
(16, 9, 'Mã nguồn mở', 'mã-nguồn-mở', '', '', 'mã nguồn mở'),
(17, 2, 'Nukeviet4', 'nukeviet4', '', '', 'nukeviet4'),
(18, 1, 'Mail', 'mail', '', '', 'mail'),
(19, 1, 'Fpt', 'fpt', '', '', 'fpt'),
(20, 1, 'Smtp', 'smtp', '', '', 'smtp'),
(21, 1, 'Bootstrap', 'bootstrap', '', '', 'bootstrap'),
(22, 1, 'Block', 'block', '', '', 'block'),
(23, 1, 'Modules', 'modules', '', '', 'modules'),
(24, 2, 'Banner', 'banner', '', '', 'banner'),
(25, 1, 'Liên kết', 'liên-kết', '', '', 'liên kết'),
(26, 2, 'Hosting', 'hosting', '', '', 'hosting'),
(27, 1, 'Hỗ trợ', 'hỗ-trợ', '', '', 'hỗ trợ'),
(28, 1, 'Hợp tác', 'hợp-tác', '', '', 'hợp tác'),
(29, 1, 'Tốc độ', 'tốc-độ', '', '', 'tốc độ'),
(30, 2, 'Website', 'website', '', '', 'website'),
(31, 1, 'Bảo mật', 'bảo-mật', '', '', 'bảo mật'),
(32, 4, 'Giáo dục', 'giáo-dục', '', '', 'giáo dục'),
(33, 1, 'Edu gate', 'edu-gate', '', '', 'edu gate'),
(34, 2, 'Lập trình', 'lập-trình', '', '', 'lập trình'),
(35, 1, 'Logo', 'logo', '', '', 'logo'),
(36, 1, 'Code', 'code', '', '', 'code'),
(37, 1, 'Thực tập', 'thực-tập', '', '', 'thực tập'),
(38, 1, 'Kinh doanh', 'kinh-doanh', '', '', 'kinh doanh'),
(39, 1, 'Nhân viên', 'nhân-viên', '', '', 'nhân viên'),
(40, 1, 'Bộ GD&ĐT', 'bộ-gd-đt', '', '', 'bộ gd&đt'),
(41, 1, 'Module', 'module', '', '', 'module'),
(42, 1, 'Php Nuke', 'php-nuke', '', '', 'php-nuke');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_tags_id`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_tags_id` (
  `id` int(11) NOT NULL,
  `tid` mediumint(9) NOT NULL,
  `keyword` varchar(65) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `id_tid` (`id`,`tid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_news_tags_id`
--

INSERT INTO `hn4_vi_news_tags_id` (`id`, `tid`, `keyword`) VALUES
(1, 7, 'thương mại điện'),
(1, 9, 'nukeviet'),
(1, 41, 'module'),
(1, 16, 'mã nguồn mở'),
(1, 42, 'php-nuke'),
(2, 16, 'mã nguồn mở'),
(2, 9, 'nukeviet'),
(2, 17, 'nukeviet4'),
(2, 10, 'vinades'),
(2, 24, 'banner'),
(2, 25, 'liên kết'),
(2, 26, 'hosting'),
(2, 27, 'hỗ trợ'),
(2, 28, 'hợp tác'),
(3, 10, 'vinades'),
(3, 9, 'nukeviet'),
(3, 11, 'lập trình viên'),
(3, 12, 'chuyên viên đồ họa'),
(3, 13, 'php'),
(3, 14, 'mysql'),
(4, 10, 'vinades'),
(4, 34, 'lập trình'),
(4, 35, 'logo'),
(4, 24, 'banner'),
(4, 30, 'website'),
(4, 36, 'code'),
(4, 13, 'php'),
(5, 16, 'mã nguồn mở'),
(5, 10, 'vinades'),
(5, 34, 'lập trình'),
(5, 9, 'nukeviet'),
(6, 15, 'nhân tài đất việt 2011'),
(6, 16, 'mã nguồn mở'),
(6, 9, 'nukeviet'),
(7, 16, 'mã nguồn mở'),
(7, 9, 'nukeviet'),
(7, 40, 'bộ gd&đt'),
(7, 32, 'giáo dục'),
(8, 38, 'kinh doanh'),
(8, 9, 'nukeviet'),
(8, 32, 'giáo dục'),
(8, 39, 'nhân viên'),
(9, 37, 'thực tập'),
(9, 10, 'vinades'),
(9, 12, 'chuyên viên đồ họa'),
(9, 11, 'lập trình viên'),
(9, 9, 'nukeviet'),
(9, 16, 'mã nguồn mở'),
(10, 16, 'mã nguồn mở'),
(10, 10, 'vinades'),
(10, 9, 'nukeviet'),
(10, 11, 'lập trình viên'),
(10, 12, 'chuyên viên đồ họa'),
(11, 9, 'nukeviet'),
(11, 16, 'mã nguồn mở'),
(11, 32, 'giáo dục'),
(12, 9, 'nukeviet'),
(12, 32, 'giáo dục'),
(12, 33, 'edu gate'),
(13, 17, 'nukeviet4'),
(13, 9, 'nukeviet'),
(13, 10, 'vinades'),
(13, 13, 'php'),
(13, 14, 'mysql'),
(13, 18, 'mail'),
(13, 19, 'fpt'),
(13, 20, 'smtp'),
(13, 21, 'bootstrap'),
(13, 22, 'block'),
(13, 23, 'modules'),
(13, 16, 'mã nguồn mở');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_tmp`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_tmp` (
  `id` mediumint(8) unsigned NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `time_edit` int(11) NOT NULL,
  `time_late` int(11) NOT NULL,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_topics`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_topics` (
  `topicid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(5) NOT NULL DEFAULT '0',
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topicid`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `hn4_vi_news_topics`
--

INSERT INTO `hn4_vi_news_topics` (`topicid`, `title`, `alias`, `image`, `description`, `weight`, `keywords`, `add_time`, `edit_time`) VALUES
(1, 'NukeViet 4', 'NukeViet-4', '', 'NukeViet 4', 1, 'NukeViet 4', 1445396011, 1445396011);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_news_voices`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_news_voices` (
  `id` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `voice_key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Khóa dùng trong Api sau này',
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `edit_time` int(11) unsigned NOT NULL DEFAULT '0',
  `weight` smallint(4) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0: Dừng, 1: Hoạt động',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `weight` (`weight`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_page`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_page` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imagealt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `socialbutton` tinyint(4) NOT NULL DEFAULT '0',
  `activecomm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot_post` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_page_config`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_page_config` (
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_page_config`
--

INSERT INTO `hn4_vi_page_config` (`config_name`, `config_value`) VALUES
('viewtype', '0'),
('facebookapi', ''),
('per_page', '20'),
('news_first', '0'),
('related_articles', '5'),
('copy_page', '0'),
('alias_lower', '1'),
('socialbutton', 'facebook,twitter');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_referer_stats`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_referer_stats` (
  `host` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `month01` int(11) NOT NULL DEFAULT '0',
  `month02` int(11) NOT NULL DEFAULT '0',
  `month03` int(11) NOT NULL DEFAULT '0',
  `month04` int(11) NOT NULL DEFAULT '0',
  `month05` int(11) NOT NULL DEFAULT '0',
  `month06` int(11) NOT NULL DEFAULT '0',
  `month07` int(11) NOT NULL DEFAULT '0',
  `month08` int(11) NOT NULL DEFAULT '0',
  `month09` int(11) NOT NULL DEFAULT '0',
  `month10` int(11) NOT NULL DEFAULT '0',
  `month11` int(11) NOT NULL DEFAULT '0',
  `month12` int(11) NOT NULL DEFAULT '0',
  `last_update` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `host` (`host`),
  KEY `total` (`total`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_referer_stats`
--

INSERT INTO `hn4_vi_referer_stats` (`host`, `total`, `month01`, `month02`, `month03`, `month04`, `month05`, `month06`, `month07`, `month08`, `month09`, `month10`, `month11`, `month12`, `last_update`) VALUES
('google.com', 4, 0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1677982195),
('qiper.ru', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1676812230),
('linhcavali.com', 6, 0, 1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678991124),
('chat.zalo.me', 10, 0, 1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678838032),
('fintechscommunity.com', 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678123477),
('pavietnam.vn', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678297496),
('bing.com', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1678501492);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_searchkeys`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_searchkeys` (
  `id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `skey` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` int(11) NOT NULL DEFAULT '0',
  `search_engine` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `id` (`id`),
  KEY `skey` (`skey`),
  KEY `search_engine` (`search_engine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_siteterms`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_siteterms` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imagealt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `imageposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `bodytext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` text COLLATE utf8mb4_unicode_ci,
  `socialbutton` tinyint(4) NOT NULL DEFAULT '0',
  `activecomm` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `layout_func` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `weight` smallint(4) NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(11) NOT NULL DEFAULT '0',
  `edit_time` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hitstotal` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hot_post` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `hn4_vi_siteterms`
--

INSERT INTO `hn4_vi_siteterms` (`id`, `title`, `alias`, `image`, `imagealt`, `imageposition`, `description`, `bodytext`, `keywords`, `socialbutton`, `activecomm`, `layout_func`, `weight`, `admin_id`, `add_time`, `edit_time`, `status`, `hitstotal`, `hot_post`) VALUES
(1, 'Chính sách bảo mật (Quyền riêng tư)', 'privacy', '', '', 0, 'Tài liệu này cung cấp cho bạn (người truy cập và sử dụng website) chính sách liên quan đến bảo mật và quyền riêng tư của bạn', '<strong><a id="index" name="index"></a>Danh mục</strong><br /> <a href="#1">Điều 1: Thu thập thông tin</a><br /> <a href="#2">Điều 2: Lưu trữ &amp; Bảo vệ thông tin</a><br /> <a href="#3">Điều 3: Sử dụng thông tin </a><br /> <a href="#4">Điều 4: Tiếp nhận thông tin từ các đối tác </a><br /> <a href="#5">Điều 5: Chia sẻ thông tin với bên thứ ba</a><br /> <a href="#6">Điều 6: Thay đổi chính sách bảo mật</a>  <hr  /> <h2><a id="1" name="1"></a>Điều 1: Thu thập thông tin</h2>  <h3>1.1. Thu thập tự động:</h3>  <div>Hệ thống này được xây dựng bằng mã nguồn NukeViet. Như mọi website hiện đại khác, chúng tôi sẽ thu thập địa chỉ IP và các thông tin web tiêu chuẩn khác của bạn như: loại trình duyệt, các trang bạn truy cập trong quá trình sử dụng dịch vụ, thông tin về máy tính &amp; thiết bị mạng v.v… cho mục đích phân tích thông tin phục vụ việc bảo mật và giữ an toàn cho hệ thống.</div>  <h3>1.2. Thu thập từ các khai báo của chính bạn:</h3>  <div>Các thông tin do bạn khai báo cho chúng tôi trong quá trình làm việc như: đăng ký tài khoản, liên hệ với chúng tôi... cũng sẽ được chúng tôi lưu trữ phục vụ công việc chăm sóc khách hàng sau này.</div>  <h3>1.3. Thu thập thông tin thông qua việc đặt cookies:</h3>  <p>Như mọi website hiện đại khác, khi bạn truy cập website, chúng tôi (hoặc các công cụ theo dõi hoặc thống kê hoạt động của website do các đối tác cung cấp) sẽ đặt một số File dữ liệu gọi là Cookies lên đĩa cứng hoặc bộ nhớ máy tính của bạn.</p>  <p>Một trong số những Cookies này có thể tồn tại lâu để thuận tiện cho bạn trong quá trình sử dụng, ví dụ như: lưu Email của bạn trong trang đăng nhập để bạn không phải nhập lại v.v…</p>  <h3>1.4. Thu thập và lưu trữ thông tin trong quá khứ:</h3>  <p>Bạn có thể thay đổi thông tin cá nhân của mình bất kỳ lúc nào bằng cách sử dụng chức năng tương ứng. Tuy nhiên chúng tôi sẽ lưu lại những thông tin bị thay đổi để chống các hành vi xóa dấu vết gian lận.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="2" name="2"></a>Điều 2: Lưu trữ &amp; Bảo vệ thông tin</h2>  <div>Hầu hết các thông tin được thu thập sẽ được lưu trữ tại cơ sở dữ liệu của chúng tôi.<br /> <br /> Chúng tôi bảo vệ dữ liệu cá nhân của các bạn bằng các hình thức như: mật khẩu, tường lửa, mã hóa cùng các hình thức thích hợp khác và chỉ cấp phép việc truy cập và xử lý dữ liệu cho các đối tượng phù hợp, ví dụ chính bạn hoặc các nhân viên có trách nhiệm xử lý thông tin với bạn thông qua các bước xác định danh tính phù hợp.<br /> <br /> Mật khẩu của bạn được lưu trữ và bảo vệ bằng phương pháp mã hoá trong cơ sở dữ liệu của hệ thống, vì thế nó rất an toàn. Tuy nhiên, chúng tôi khuyên bạn không nên dùng lại mật khẩu này trên các website khác. Mật khẩu của bạn là cách duy nhất để bạn đăng nhập vào tài khoản thành viên của mình trong website này, vì thế hãy cất giữ nó cẩn thận. Trong mọi trường hợp bạn không nên cung cấp thông tin mật khẩu cho bất kỳ người nào dù là người của chúng tôi, người của NukeViet hay bất kỳ người thứ ba nào khác trừ khi bạn hiểu rõ các rủi ro khi để lộ mật khẩu. Nếu quên mật khẩu, bạn có thể sử dụng chức năng “<a href="/users/lostpass/">Quên mật khẩu</a>” trên website. Để thực hiện việc này, bạn cần phải cung cấp cho hệ thống biết tên thành viên hoặc địa chỉ Email đang sử dụng của mình trong tài khoản, sau đó hệ thống sẽ tạo ra cho bạn mật khẩu mới và gửi đến cho bạn để bạn vẫn có thể đăng nhập vào tài khoản thành viên của mình.  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p> </div>  <h2><a id="3" name="3"></a>Điều 3: Sử dụng thông tin</h2>  <p>Thông tin thu thập được sẽ được chúng tôi sử dụng để:</p>  <div>- Cung cấp các dịch vụ hỗ trợ &amp; chăm sóc khách hàng.</div>  <div>- Thực hiện giao dịch thanh toán &amp; gửi các thông báo trong quá trình giao dịch.</div>  <div>- Xử lý khiếu nại, thu phí &amp; giải quyết sự cố.</div>  <div>- Ngăn chặn các hành vi có nguy cơ rủi ro, bị cấm hoặc bất hợp pháp và đảm bảo tuân thủ đúng chính sách “Thỏa thuận người dùng”.</div>  <div>- Đo đạc, tùy biến &amp; cải tiến dịch vụ, nội dung và hình thức của website.</div>  <div>- Gửi bạn các thông tin về chương trình Marketing, các thông báo &amp; chương trình khuyến mại.</div>  <div>- So sánh độ chính xác của thông tin cá nhân của bạn trong quá trình kiểm tra với bên thứ ba.</div>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="4" name="4"></a>Điều 4: Tiếp nhận thông tin từ các đối tác</h2>  <div>Khi sử dụng các công cụ giao dịch và thanh toán thông qua internet, chúng tôi có thể tiếp nhận thêm các thông tin về bạn như địa chỉ username, Email, số tài khoản ngân hàng... Chúng tôi kiểm tra những thông tin này với cơ sở dữ liệu người dùng của mình nhằm xác nhận rằng bạn có phải là khách hàng của chúng tôi hay không nhằm giúp việc thực hiện các dịch vụ cho bạn được thuận lợi.<br /> <br /> Các thông tin tiếp nhận được sẽ được chúng tôi bảo mật như những thông tin mà chúng tôi thu thập được trực tiếp từ bạn.</div>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="5" name="5"></a>Điều 5: Chia sẻ thông tin với bên thứ ba</h2>  <p>Chúng tôi sẽ không chia sẻ thông tin cá nhân, thông tin tài chính... của bạn cho các bên thứ 3 trừ khi được sự đồng ý của chính bạn hoặc khi chúng tôi buộc phải tuân thủ theo các quy định pháp luật hoặc khi có yêu cầu từ cơ quan công quyền có thẩm quyền.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="6" name="6"></a>Điều 6: Thay đổi chính sách bảo mật</h2>  <p>Chính sách Bảo mật này có thể thay đổi theo thời gian. Chúng tôi sẽ không giảm quyền của bạn theo Chính sách Bảo mật này mà không có sự đồng ý rõ ràng của bạn. Chúng tôi sẽ đăng bất kỳ thay đổi Chính sách Bảo mật nào trên trang này và, nếu những thay đổi này quan trọng, chúng tôi sẽ cung cấp thông báo nổi bật hơn (bao gồm, đối với một số dịch vụ nhất định, thông báo bằng email về các thay đổi của Chính sách Bảo mật).</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <p style="text-align: right;">Chính sách bảo mật mặc định này được xây dựng cho <a href="http://nukeviet.vn" target="_blank">NukeViet CMS</a>, được tham khảo từ website <a href="http://webnhanh.vn/vi/thiet-ke-web/detail/Chinh-sach-bao-mat-Quyen-rieng-tu-Privacy-Policy-2147/">webnhanh.vn</a></p>', '', 0, '4', '', 1, 1, 1675986735, 1675986735, 1, 0, 0),
(2, 'Điều khoản và điều kiện sử dụng', 'terms-and-conditions', '', '', 0, 'Đây là các điều khoản và điều kiện áp dụng cho website này. Truy cập và sử dụng website tức là bạn đã đồng ý với các quy định này.', '<div>Cảm ơn bạn đã sử dụng. Xin vui lòng đọc các Điều khoản một cách cẩn thận, và <a href="/contact/">liên hệ</a> với chúng tôi nếu bạn có bất kỳ câu hỏi. Bằng việc truy cập hoặc sử dụng website của chúng tôi, bạn đồng ý bị ràng buộc bởi các <a href="/siteterms/terms-and-conditions.html">Điều khoản và điều kiện</a> sử dụng cũng như <a href="/siteterms/privacy.html">Chính sách bảo mật</a> của chúng tôi. Nếu không đồng ý với các quy định này, bạn vui lòng ngưng sử dụng website.<br /> <br /> <strong><a id="index" name="index"></a>Danh mục</strong><br /> <a href="#1">Điều 1: Điều khoản liên quan đến phần mềm vận hành website</a><br /> <a href="#2">Điều 2: Giới hạn cho việc sử dụng Website và các tài liệu trên website</a><br /> <a href="#3">Điều 3: Sử dụng thương hiệu</a><br /> <a href="#4">Điều 4: Các hành vi bị nghiêm cấm</a><br /> <a href="#5">Điều 5: Các đường liên kết đến các website khác</a><br /> <a href="#6">Điều 6: Từ chối bảo đảm</a><br /> <a href="#7">Điều 7: Luật áp dụng và cơ quan giải quyết tranh chấp</a><br /> <a href="#8">Điều 8: Thay đổi điều khoản và điều kiện sử dụng</a></div>  <hr  /> <h2><a id="1" name="1"></a>Điều khoản liên quan đến phần mềm vận hành website</h2>  <p>- Website của chúng tôi sử dụng hệ thống NukeViet, là giải pháp về website/ cổng thông tin nguồn mở được phát hành theo giấy phép bản quyền phần mềm tự do nguồn mở “<a href="http://www.gnu.org/licenses/old-licenses/gpl-2.0.html" target="_blank">GNU General Public License</a>” (viết tắt là GNU/GPL hay GPL) và có thể tải về miễn phí tại trang web <a href="http://www.nukeviet.vn" target="_blank">www.nukeviet.vn</a>.<br /> - Website này do chúng tôi sở hữu, điều hành và duy trì. NukeViet (hiểu ở đây là “hệ thống NukeViet” (bao gồm nhân hệ thống NukeViet và các sản phẩm phái sinh như NukeViet CMS, NukeViet Portal, <a href="http://edu.nukeviet.vn" target="_blank">NukeViet Edu Gate</a>...), “www.nukeviet.vn”, “tổ chức NukeViet”, “ban điều hành NukeViet”, &quot;Ban Quản Trị NukeViet&quot; và nói chung là những gì liên quan đến NukeViet...) không liên quan gì đến việc chúng tôi điều hành website cũng như quy định bạn được phép làm và không được phép làm gì trên website này.<br /> - Hệ thống NukeViet là bộ mã nguồn được phát triển để xây dựng các website/ cổng thông tin trên mạng. Chúng tôi (chủ sở hữu, điều hành và duy trì website này) không hỗ trợ và khẳng định hay ngụ ý về việc có liên quan đến NukeViet. Để biết thêm nhiều thông tin về NukeViet, hãy ghé thăm website của NukeViet tại địa chỉ: <a href="http://nukeviet.vn" target="_blank">http://nukeviet.vn</a>.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="2" name="2"></a>Giới hạn cho việc sử dụng Website và các tài liệu trên website</h2>  <p>- Tất cả các quyền liên quan đến tất cả tài liệu và thông tin được hiển thị và/ hoặc được tạo ra sẵn cho Website này (ví dụ như những tài liệu được cung cấp để tải về) được quản lý, sở hữu hoặc được cho phép sử dụng bởi chúng tôi hoặc chủ sở hữu tương ứng với giấy phép tương ứng. Việc sử dụng các tài liệu và thông tin phải được tuân thủ theo giấy phép tương ứng được áp dụng cho chúng.<br /> - Ngoại trừ các tài liệu được cấp phép rõ ràng dưới dạng giấy phép tư liệu mở&nbsp;Creative Commons (gọi là giấy phép CC) cho phép bạn khai thác và chia sẻ theo quy định của giấy phép tư liệu mở, đối với các loại tài liệu không ghi giấy phép rõ ràng thì bạn không được phép sử dụng (bao gồm nhưng không giới hạn việc sao chép, chỉnh sửa toàn bộ hay một phần, đăng tải, phân phối, cấp phép, bán và xuất bản) bất cứ tài liệu nào mà không có sự cho phép trước bằng văn bản của chúng tôi ngoại trừ việc sử dụng cho mục đích cá nhân, nội bộ, phi thương mại.<br /> - Một số tài liệu hoặc thông tin có những điều khoản và điều kiện áp dụng riêng cho chúng không phải là giấy phép tư liệu mở, trong trường hợp như vậy, bạn được yêu cầu phải chấp nhận các điều khoản và điều kiện đó khi truy cập vào các tài liệu và thông tin này.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="3" name="3"></a>Sử dụng thương hiệu</h2>  <p>- VINADES.,JSC, NukeViet và thương hiệu gắn với NukeViet (ví dụ NukeViet CMS, NukeViet Portal, NukeViet Edu Gate...), logo công ty VINADES thuộc sở hữu của Công ty cổ phần phát triển nguồn mở Việt Nam.<br /> - Những tên sản phẩm, tên dịch vụ khác, logo và/ hoặc những tên công ty được sử dụng trong Website này là những tài sản đã được đăng ký độc quyền và được giữ bản quyền bởi những người sở hữu và/ hoặc người cấp phép tương ứng.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="4" name="4"></a>Các hành vi bị nghiêm cấm</h2>  <p>Người truy cập website này không được thực hiện những hành vi dưới đây khi sử dụng website:<br /> - Xâm phạm các quyền hợp pháp (bao gồm nhưng không giới hạn đối với các quyền riêng tư và chung) của người khác.<br /> - Gây ra sự thiệt hại hoặc bất lợi cho người khác.<br /> - Làm xáo trộn trật tự công cộng.<br /> - Hành vi liên quan đến tội phạm.<br /> - Tải lên hoặc phát tán thông tin riêng tư của tổ chức, cá nhân khác mà không được sự chấp thuận của họ.<br /> - Sử dụng Website này vào mục đích thương mại mà chưa được sự cho phép của chúng tôi.<br /> - Nói xấu, làm nhục, phỉ báng người khác.<br /> - Tải lên các tập tin chứa virus hoặc các tập tin bị hư mà có thể gây thiệt hại đến sự vận hành của máy tính khác.<br /> - Những hoạt động có khả năng ảnh hưởng đến hoạt động bình thường của website.<br /> - Những hoạt động mà chúng tôi cho là không thích hợp.<br /> - Những hoạt động bất hợp pháp hoặc bị cấm bởi pháp luật hiện hành.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="5" name="5"></a>Các đường liên kết đến các website khác</h2>  <p>- Các website của các bên thứ ba (không phải các trang do chúng tôi quản lý) được liên kết đến hoặc từ website này (&quot;Các website khác&quot;) được điều hành và duy trì hoàn toàn độc lập bởi các bên thứ ba đó và không nằm trong quyền điều khiển và/hoặc giám sát của chúng tôi. Việc truy cập các website khác phải được tuân thủ theo các điều khoản và điều kiện quy định bởi ban điều hành của website đó.<br /> - Chúng tôi không chịu trách nhiệm cho sự mất mát hoặc thiệt hại do việc truy cập và sử dụng các website bên ngoài, và bạn phải chịu mọi rủi ro khi truy cập các website đó.<br /> - Không có nội dung nào trong Website này thể hiện như một sự đảm bảo của chúng tôi về nội dung của các website khác và các sản phẩm và/ hoặc các dịch vụ xuất hiện và/ hoặc được cung cấp tại các website khác.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="6" name="6"></a>Từ chối bảo đảm</h2>  <p>NGOẠI TRỪ PHẠM VI BỊ CẤM THEO LUẬT PHÁP HIỆN HÀNH, CHÚNG TÔI SẼ:<br /> - KHÔNG CHỊU TRÁCH NHIỆM HAY BẢO ĐẢM, MỘT CÁCH RÕ RÀNG HAY NGỤ Ý, BAO GỒM SỰ BẢO ĐẢM VỀ TÍNH CHÍNH XÁC, MỨC ĐỘ TIN CẬY, HOÀN THIỆN, PHÙ HỢP CHO MỤC ĐÍCH CỤ THỂ, SỰ KHÔNG XÂM PHẠM QUYỀN CỦA BÊN THỨ 3 VÀ/HOẶC TÍNH AN TOÀN CỦA NỘI DỤNG WEBSITE NÀY, VÀ NHỮNG TUYÊN BỐ, ĐẢM BẢO CÓ LIÊN QUAN.<br /> - KHÔNG CHỊU TRÁCH NHIỆM CHO BẤT KỲ SỰ THIỆT HẠI HAY MẤT MÁT PHÁT SINH TỪ VIỆC TRUY CẬP VÀ SỬ DỤNG WEBSITE HAY VIỆC KHÔNG THỂ SỬ DỤNG WEBSITE.<br /> - CHÚNG TÔI CÓ THỂ THAY ĐỔI VÀ/HOẶC THAY THẾ NỘI DUNG CỦA WEBSITE NÀY, HOẶC TẠM HOÃN HOẶC NGƯNG CUNG CẤP CÁC DỊCH VỤ QUA WEBSITE NÀY VÀO BẤT KỲ THỜI ĐIỂM NÀO MÀ KHÔNG CẦN THÔNG BÁO TRƯỚC. CHÚNG TÔI SẼ KHÔNG CHỊU TRÁCH NHIỆM CHO BẤT CỨ THIỆT HẠI NÀO PHÁT SINH DO SỰ THAY ĐỔI HOẶC THAY THẾ NỘI DUNG CỦA WEBSITE.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="7" name="7"></a>Luật áp dụng và cơ quan giải quyết tranh chấp</h2>  <p>- Các Điều Khoản và Điều Kiện này được điều chỉnh và giải thích theo luật của Việt Nam trừ khi có điều khoản khác được cung cấp thêm. Tất cả tranh chấp phát sinh liên quan đến website này và các Điều Khoản và Điều Kiện sử dụng này sẽ được giải quyết tại các tòa án ở Việt Nam.<br /> - Nếu một phần nào đó của các Điều Khoản và Điều Kiện bị xem là không có giá trị, vô hiệu, hoặc không áp dụng được vì lý do nào đó, phần đó được xem như là phần riêng biệt và không ảnh hưởng đến tính hiệu lực của phần còn lại.<br /> - Trong trường hợp có sự mâu thuẫn giữa bản Tiếng Anh và bản Tiếng Việt của bản Điều Khoản và Điều Kiện này, bản Tiếng Việt sẽ được ưu tiên áp dụng.</p>  <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p>  <h2><a id="8" name="8"></a>Thay đổi điều khoản và điều kiện sử dụng</h2>  <div>Điều khoản và điều kiện sử dụng có thể thay đổi theo thời gian. Chúng tôi bảo lưu quyền thay đổi hoặc sửa đổi bất kỳ điều khoản và điều kiện cũng như các quy định khác, bất cứ lúc nào và theo ý mình. Chúng tôi sẽ có thông báo trên website khi có sự thay đổi. Tiếp tục sử dụng trang web này sau khi đăng các thay đổi tức là bạn đã chấp nhận các thay đổi đó. <p style="text-align: right;"><a href="#index">Trở lại danh mục</a></p> </div>', '', 0, '4', '', 2, 1, 1675986735, 1675986735, 1, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_siteterms_config`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_siteterms_config` (
  `config_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hn4_vi_siteterms_config`
--

INSERT INTO `hn4_vi_siteterms_config` (`config_name`, `config_value`) VALUES
('viewtype', '0'),
('facebookapi', ''),
('per_page', '20'),
('news_first', '0'),
('related_articles', '5'),
('copy_page', '0'),
('alias_lower', '1'),
('socialbutton', 'facebook,twitter');

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_voting`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_voting` (
  `vid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `acceptcm` int(2) NOT NULL DEFAULT '1',
  `active_captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `admin_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `groups_view` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `publ_time` int(11) unsigned NOT NULL DEFAULT '0',
  `exp_time` int(11) unsigned NOT NULL DEFAULT '0',
  `act` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vote_one` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0 cho phép vote nhiều lần 1 cho phép vote 1 lần',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `question` (`question`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `hn4_vi_voting`
--

INSERT INTO `hn4_vi_voting` (`vid`, `question`, `link`, `acceptcm`, `active_captcha`, `admin_id`, `groups_view`, `publ_time`, `exp_time`, `act`, `vote_one`) VALUES
(2, 'Bạn biết gì về NukeViet 4?', '', 1, 0, 1, '6', 1675986735, 0, 1, 0),
(3, 'Lợi ích của phần mềm nguồn mở là gì?', '', 1, 0, 1, '6', 1675986735, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_voting_rows`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_voting_rows` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `vid` smallint(5) unsigned NOT NULL,
  `title` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `hitstotal` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `vid` (`vid`,`title`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=14 ;

--
-- Dumping data for table `hn4_vi_voting_rows`
--

INSERT INTO `hn4_vi_voting_rows` (`id`, `vid`, `title`, `url`, `hitstotal`) VALUES
(5, 2, 'Một bộ sourcecode cho web hoàn toàn mới.', '', 0),
(6, 2, 'Mã nguồn mở, sử dụng miễn phí.', '', 0),
(7, 2, 'Sử dụng HTML5, CSS3 và hỗ trợ Ajax', '', 0),
(8, 2, 'Tất cả các ý kiến trên', '', 0),
(9, 3, 'Liên tục được cải tiến, sửa đổi bởi cả thế giới.', '', 0),
(10, 3, 'Được sử dụng miễn phí không mất tiền.', '', 0),
(11, 3, 'Được tự do khám phá, sửa đổi theo ý thích.', '', 0),
(12, 3, 'Phù hợp để học tập, nghiên cứu vì được tự do sửa đổi theo ý thích.', '', 0),
(13, 3, 'Tất cả các ý kiến trên', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hn4_vi_voting_voted`
--

CREATE TABLE IF NOT EXISTS `hn4_vi_voting_voted` (
  `vid` smallint(5) unsigned NOT NULL,
  `voted` text COLLATE utf8mb4_unicode_ci,
  UNIQUE KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_article`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_article` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `zalo_id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `author` char(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover_type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover_photo_url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover_video_id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover_view` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'horizontal',
  `cover_status` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hide',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `related_medias` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_link` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `video_id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `video_avatar` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `comment` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'show',
  `create_date` int(11) NOT NULL DEFAULT '0',
  `update_date` int(11) NOT NULL DEFAULT '0',
  `total_view` int(11) NOT NULL DEFAULT '0',
  `total_share` int(11) NOT NULL DEFAULT '0',
  `is_sync` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `zalo_id` (`zalo_id`),
  KEY `is_sync` (`is_sync`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_conversation`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_conversation` (
  `message_id` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `links` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `thumb` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` char(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `displayed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_followers`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_followers` (
  `user_id` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `app_id` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id_by_app` char(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar120` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar240` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_gender` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tags_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes_info` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isfollow` tinyint(1) NOT NULL DEFAULT '1',
  `weight` mediumint(8) NOT NULL DEFAULT '0',
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone_code` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone_number` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city_id` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `district_id` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_sync` tinyint(1) NOT NULL DEFAULT '0',
  `updatetime` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_settings`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_settings` (
  `skey` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `svalue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `info_key` (`skey`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_tags`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_tags` (
  `alias` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `alias` (`alias`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_tags_follower`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_tags_follower` (
  `tag` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` char(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  UNIQUE KEY `tag` (`tag`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_template`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_template` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `type` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_upload`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_upload` (
  `id` tinyint(8) NOT NULL AUTO_INCREMENT,
  `type` char(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `localfile` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `width` smallint(4) NOT NULL DEFAULT '0',
  `height` smallint(4) NOT NULL DEFAULT '0',
  `zalo_id` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `hn4_zalo_video`
--

CREATE TABLE IF NOT EXISTS `hn4_zalo_video` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `video_id` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_name` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `video_size` int(11) NOT NULL DEFAULT '0',
  `description` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `view` char(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'horizontal',
  `thumb` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `status_message` char(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `convert_percent` int(11) NOT NULL DEFAULT '0',
  `convert_error_code` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
