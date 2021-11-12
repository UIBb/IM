/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2020-06-24 08:54:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for chat_admin
-- ----------------------------
DROP TABLE IF EXISTS `chat_admin`;
CREATE TABLE `chat_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0',
  `login_time` datetime NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  `num` int(2) NOT NULL DEFAULT '0',
  `err_time` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_admin
-- ----------------------------
INSERT INTO `chat_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2020-06-24 08:18:03', '0', '2020-06-24 08:18:03', '127.0.0.1', '0', '0');

-- ----------------------------
-- Table structure for chat_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `chat_auth_group`;
CREATE TABLE `chat_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 : 1为正常,0为禁用',
  `rules` char(80) NOT NULL DEFAULT '' COMMENT '规则ID （这里填写的是 tp_auth_rule里面的规则的ID)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='后台用户组表';

-- ----------------------------
-- Records of chat_auth_group
-- ----------------------------
INSERT INTO `chat_auth_group` VALUES ('1', '超级管理组', '1', '1');

-- ----------------------------
-- Table structure for chat_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `chat_auth_group_access`;
CREATE TABLE `chat_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限组规则表';

-- ----------------------------
-- Records of chat_auth_group_access
-- ----------------------------
INSERT INTO `chat_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for chat_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `chat_auth_rule`;
CREATE TABLE `chat_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `pid` smallint(5) unsigned NOT NULL COMMENT '父级ID',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `sort` tinyint(4) unsigned NOT NULL COMMENT '排序',
  `condition` char(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='后台功能表';

-- ----------------------------
-- Records of chat_auth_rule
-- ----------------------------
INSERT INTO `chat_auth_rule` VALUES ('1', '', '管理员管理', '1', '1', '0', '&#xe68e', '100', '');
INSERT INTO `chat_auth_rule` VALUES ('3', 'adminlist', '管理员列表', '1', '1', '1', '', '0', '');
INSERT INTO `chat_auth_rule` VALUES ('2', 'groups', '用户组', '1', '1', '1', '', '0', '');
INSERT INTO `chat_auth_rule` VALUES ('4', 'auth/index', '功能管理', '1', '1', '1', '', '0', '');
INSERT INTO `chat_auth_rule` VALUES ('5', '', '客服管理', '1', '1', '0', '&#xe606;', '0', '');
INSERT INTO `chat_auth_rule` VALUES ('6', '', '系统管理', '1', '1', '0', '&#xe614;', '0', '');
INSERT INTO `chat_auth_rule` VALUES ('7', 'systems/config', '系统设置', '1', '1', '6', '', '0', '');
INSERT INTO `chat_auth_rule` VALUES ('9', 'chat/chatlist', '客服列表', '1', '1', '5', '', '0', '');

-- ----------------------------
-- Table structure for chat_chat_record
-- ----------------------------
DROP TABLE IF EXISTS `chat_chat_record`;
CREATE TABLE `chat_chat_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` varchar(255) NOT NULL,
  `toid` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `time` varchar(30) NOT NULL,
  `isonline` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `foid` varchar(255) NOT NULL,
  `ftoid` varchar(255) NOT NULL,
  `state` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fid` (`fid`),
  KEY `toid` (`toid`),
  KEY `soid` (`foid`),
  KEY `ftoid` (`ftoid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_chat_record
-- ----------------------------
INSERT INTO `chat_chat_record` VALUES ('1', 'MTI3LjAuMC4xMTU1MjYzMDMxNw==', '00001', '[喵喵]', '2019-03-18 11:27:49', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1MjYzMDMxNw==', '0');
INSERT INTO `chat_chat_record` VALUES ('2', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '00001', 'kkkk', '2019-03-18 11:28:09', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('3', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '00001', 'lll', '2019-03-18 11:28:33', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('4', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '00001', 'llp', '2019-03-18 11:29:18', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('5', 'MTI3LjAuMC4xMTU1Mjg3OTc3Mw==', '00001', 'lll7777', '2019-03-18 11:29:38', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTc3Mw==', '1');
INSERT INTO `chat_chat_record` VALUES ('6', 'MTI3LjAuMC4xMTU1Mjg3OTc3Mw==', '00001', '[[[[', '2019-03-18 11:29:51', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTc3Mw==', '1');
INSERT INTO `chat_chat_record` VALUES ('7', 'MTI3LjAuMC4xMTU1Mjg4MDAzMg==', '00001', '[抓狂]', '2019-03-18 11:33:59', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg4MDAzMg==', '1');
INSERT INTO `chat_chat_record` VALUES ('8', 'MTI3LjAuMC4xMTU1Mjg4MDAzMg==', '00001', '[坏笑]', '2019-03-18 11:34:07', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg4MDAzMg==', '1');
INSERT INTO `chat_chat_record` VALUES ('9', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '00001', 'jjjj', '2019-03-20 16:45:47', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('10', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '00001', 'ggg', '2019-03-20 16:49:57', '1', 'save', '00001', 'MTI3LjAuMC4xMTU1Mjg3OTY4NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('11', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '微炫客客服', '121', '2020-06-24 08:32:39', '1', 'save', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('12', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '你好', '2020-06-24 08:32:52', '1', 'save', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('13', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '微炫客客服', '[笑cry]请问你们有什么, ', '2020-06-24 08:35:41', '1', 'save', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('14', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '微炫客客服', '213123', '2020-06-24 08:37:12', '1', 'save', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('15', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '2112', '2020-06-24 08:37:15', '1', 'save', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '0');
INSERT INTO `chat_chat_record` VALUES ('16', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '微炫客客服', '21', '2020-06-24 08:38:10', '0', 'save', '微炫客客服', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('17', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '客服001', '21215615', '2020-06-24 08:50:46', '0', 'save', '客服001', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('18', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '客服001', '114', '2020-06-24 08:51:51', '0', 'save', '客服001', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('19', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '客服001', '111451', '2020-06-24 08:52:05', '0', 'save', '客服001', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1');
INSERT INTO `chat_chat_record` VALUES ('20', '客服001', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '1221', '2020-06-24 08:52:49', '1', 'save', '客服001', 'MTI3LjAuMC4xMTU5Mjk1ODc1NQ==', '0');

-- ----------------------------
-- Table structure for chat_chat_user
-- ----------------------------
DROP TABLE IF EXISTS `chat_chat_user`;
CREATE TABLE `chat_chat_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) NOT NULL,
  `pw` varchar(255) NOT NULL,
  `add_time` datetime NOT NULL,
  `state` int(1) NOT NULL DEFAULT '0',
  `login_time` datetime NOT NULL,
  `login_ip` varchar(20) NOT NULL,
  `num` int(2) NOT NULL DEFAULT '0',
  `err_time` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of chat_chat_user
-- ----------------------------
INSERT INTO `chat_chat_user` VALUES ('5', '客服001', 'e10adc3949ba59abbe56e057f20f883e', '2020-06-24 08:39:28', '0', '2020-06-24 08:52:35', '127.0.0.1', '0', '0');
