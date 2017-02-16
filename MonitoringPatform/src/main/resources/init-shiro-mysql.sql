/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : shiro

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2016-12-27 19:16:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_system_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_menu`;
CREATE TABLE `t_system_menu` (
  `MENU_ID` int(11) NOT NULL auto_increment,
  `MENU_KEY` varchar(255) default NULL,
  `MENU_NAME` varchar(255) default NULL,
  `MENU_URI` varchar(255) default NULL,
  `MENU_ICON` varchar(255) default NULL,
  `ORDER_BY` int(11) default NULL,
  `STATUS` varchar(1) default NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  `PARENT_ID` int(11) default NULL,
  PRIMARY KEY  (`MENU_ID`),
  KEY `FK_myun4ja9v78a8prjososv9ajd` (`PARENT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_menu
-- ----------------------------
INSERT INTO `t_system_menu` VALUES ('1', null, '系统管理', null, null, '0', '1', 'admin', '2016-12-27', 'admin', '2016-12-27', null);
INSERT INTO `t_system_menu` VALUES ('2', 'systemUser', '用户管理', 'systemUserList', null, '0', '1', 'admin', '2016-12-27', 'admin', '2016-12-27', '1');
INSERT INTO `t_system_menu` VALUES ('3', 'systemRole', '角色管理', 'systemRoleList', null, '0', '1', 'admin', '2016-12-27', 'admin', '2016-12-27', '1');
INSERT INTO `t_system_menu` VALUES ('4', 'systemMenu', '菜单管理', 'systemMenuList', null, '0', '1', 'admin', '2016-12-27', 'admin', '2016-12-27', '1');
INSERT INTO `t_system_menu` VALUES ('5', 'systemOperation', '操作管理', 'systemOperationList', null, '0', '1', 'admin', '2016-12-27', 'admin', '2016-12-27', '1');

-- ----------------------------
-- Table structure for `t_system_menu_operation`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_menu_operation`;
CREATE TABLE `t_system_menu_operation` (
  `ID` int(11) NOT NULL auto_increment,
  `MENU_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_8ryme5wlf29f8ks7de8w4fhl9` (`OPERATION_ID`),
  KEY `FK_tj1axg0rsxf72gqitwpd86x2e` (`MENU_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_menu_operation
-- ----------------------------
INSERT INTO `t_system_menu_operation` VALUES ('1', '2', '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('2', '2', '2', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('3', '2', '3', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('4', '2', '4', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('5', '3', '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('6', '3', '2', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('7', '3', '3', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('8', '3', '4', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('9', '4', '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('10', '4', '2', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('11', '4', '3', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('12', '4', '4', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('13', '5', '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('14', '5', '2', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('15', '5', '3', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_menu_operation` VALUES ('16', '5', '4', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');

-- ----------------------------
-- Table structure for `t_system_operation`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_operation`;
CREATE TABLE `t_system_operation` (
  `OPERATION_ID` int(11) NOT NULL auto_increment,
  `OPERATION_KEY` varchar(255) default NULL,
  `OPERATION_NAME` varchar(255) default NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`OPERATION_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_operation
-- ----------------------------
INSERT INTO `t_system_operation` VALUES ('1', 'add', '新增', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_operation` VALUES ('2', 'delete', '删除', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_operation` VALUES ('3', 'update', '修改', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_operation` VALUES ('4', 'select', '查询', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');

-- ----------------------------
-- Table structure for `t_system_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_permission`;
CREATE TABLE `t_system_permission` (
  `ID` int(11) NOT NULL auto_increment,
  `ROLE_ID` int(11) default NULL,
  `MENU_ID` int(11) default NULL,
  `PERMISSION_KEY` varchar(255) default NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_permission
-- ----------------------------
INSERT INTO `t_system_permission` VALUES ('1', '1', '2', 'add', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('2', '1', '2', 'delete', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('3', '1', '2', 'update', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('4', '1', '2', 'select', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('5', '1', '3', 'add', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('6', '1', '3', 'delete', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('7', '1', '3', 'update', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('8', '1', '3', 'select', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('9', '1', '4', 'add', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('10', '1', '4', 'delete', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('11', '1', '4', 'update', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('12', '1', '4', 'select', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('13', '1', '5', 'add', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('14', '1', '5', 'delete', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('15', '1', '5', 'update', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_permission` VALUES ('16', '1', '5', 'select', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');

-- ----------------------------
-- Table structure for `t_system_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role`;
CREATE TABLE `t_system_role` (
  `ROLE_ID` int(11) NOT NULL auto_increment,
  `ROLE_NAME` varchar(255) NOT NULL,
  `ROLE_INFO` varchar(255) NOT NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`ROLE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_role
-- ----------------------------
INSERT INTO `t_system_role` VALUES ('1', '超级管理员', '超级管理员', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');

-- ----------------------------
-- Table structure for `t_system_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_role_menu`;
CREATE TABLE `t_system_role_menu` (
  `ID` int(11) NOT NULL auto_increment,
  `ROLE_ID` int(11) default NULL,
  `MENU_ID` int(11) default NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_l0y17i4fe4kejgvp8tfupcn83` (`MENU_ID`),
  KEY `FK_o5d8cf43e9a86kfu59md061lw` (`ROLE_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_role_menu
-- ----------------------------
INSERT INTO `t_system_role_menu` VALUES ('1', '1', '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_role_menu` VALUES ('2', '1', '2', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_role_menu` VALUES ('3', '1', '3', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_role_menu` VALUES ('4', '1', '4', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
INSERT INTO `t_system_role_menu` VALUES ('5', '1', '5', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');

-- ----------------------------
-- Table structure for `t_system_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user`;
CREATE TABLE `t_system_user` (
  `USER_ID` int(11) NOT NULL auto_increment,
  `USER_NUM` varchar(50) NOT NULL,
  `USER_PASSWORD` varchar(50) NOT NULL,
  `USER_PHONE` varchar(20) NOT NULL,
  `USER_EMAIL` varchar(50) NOT NULL,
  `USER_NICKNAME` varchar(255) default NULL,
  `REGISTER_DATE` datetime default NULL,
  `REPORT_MANAGER` varchar(255) default NULL,
  `SEX` varchar(1) default NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`USER_ID`),
  UNIQUE KEY `UK_njs90epcq9q4h1wry1mbm44mg` (`USER_EMAIL`),
  UNIQUE KEY `UK_oco8dmkteh9nw1p8oyjfptgdd` (`USER_PHONE`),
  UNIQUE KEY `UK_byc6wqmqsulae39rewiwlh73n` (`USER_NUM`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_user
-- ----------------------------
INSERT INTO `t_system_user` VALUES ('1', 'admin', '823da4223e46ec671a10ea13d7823534', '13816469240', 'admin@163.com', '超级管理员', '2016-12-27 19:16:09', null, '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');

-- ----------------------------
-- Table structure for `t_system_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_system_user_role`;
CREATE TABLE `t_system_user_role` (
  `ID` int(11) NOT NULL auto_increment,
  `ROLE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `CREATE_BY` varchar(255) default NULL,
  `CREATE_DATE` date default NULL,
  `STATUS` varchar(1) default NULL,
  `UPDATE_BY` varchar(255) default NULL,
  `UPDATE_DATE` date default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_mf6mbns6n3276kh56r8gbglrq` (`ROLE_ID`),
  KEY `FK_orvkfb25x5rt294ihxefa1g4a` (`USER_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_system_user_role
-- ----------------------------
INSERT INTO `t_system_user_role` VALUES ('1', '1', '1', 'admin', '2016-12-27', '1', 'admin', '2016-12-27');
