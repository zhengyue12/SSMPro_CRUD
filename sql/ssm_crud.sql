/*
 Navicat Premium Data Transfer

 Source Server         : ++
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : ssm_crud

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 25/02/2020 14:33:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '开发部');
INSERT INTO `department` VALUES (2, '测试部');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gender` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `d_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `fk_dept_emp`(`d_id`) USING BTREE,
  CONSTRAINT `fk_dept_emp` FOREIGN KEY (`d_id`) REFERENCES `department` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 520 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'Jerry', 'M', 'Jerry@qq.com', 1);
INSERT INTO `employee` VALUES (2, 'c2bef0', 'M', 'aaa@163.com', 1);
INSERT INTO `employee` VALUES (3, 'd4b591', 'M', 'd4b591@163.com', 1);
INSERT INTO `employee` VALUES (4, '1c2922', 'M', '1c2922@163.com', 1);
INSERT INTO `employee` VALUES (5, '64ebc3', 'M', '64ebc3@163.com', 1);
INSERT INTO `employee` VALUES (6, '610744', 'M', '610744@163.com', 1);
INSERT INTO `employee` VALUES (7, 'df6105', 'M', 'df6105@163.com', 1);
INSERT INTO `employee` VALUES (8, '671726', 'M', '671726@163.com', 1);
INSERT INTO `employee` VALUES (9, '3e76d7', 'M', '3e76d7@163.com', 1);
INSERT INTO `employee` VALUES (10, 'e9cdb8', 'M', 'e9cdb8@163.com', 1);
INSERT INTO `employee` VALUES (11, 'ae43a9', 'M', 'ae43a9@163.com', 1);
INSERT INTO `employee` VALUES (14, '9382b12', 'M', '9382b12@163.com', 1);
INSERT INTO `employee` VALUES (15, 'faefb13', 'M', 'faefb13@163.com', 1);
INSERT INTO `employee` VALUES (16, '0ddc214', 'M', '0ddc214@163.com', 1);
INSERT INTO `employee` VALUES (19, '9f5b117', 'M', '9f5b117@163.com', 1);
INSERT INTO `employee` VALUES (21, 'af3bc19', 'M', 'af3bc19@163.com', 1);
INSERT INTO `employee` VALUES (22, '2601020', 'M', '2601020@163.com', 1);
INSERT INTO `employee` VALUES (23, 'f161521', 'M', 'f161521@163.com', 1);
INSERT INTO `employee` VALUES (25, 'ddc7d23', 'M', 'ddc7d23@163.com', 1);
INSERT INTO `employee` VALUES (26, '5a7f024', 'M', '5a7f024@163.com', 1);
INSERT INTO `employee` VALUES (27, 'a75b125', 'M', 'a75b125@163.com', 1);
INSERT INTO `employee` VALUES (31, 'fb9c529', 'M', 'fb9c529@163.com', 1);
INSERT INTO `employee` VALUES (32, '6ead530', 'M', '6ead530@163.com', 1);
INSERT INTO `employee` VALUES (33, '05d5831', 'M', '05d5831@163.com', 1);
INSERT INTO `employee` VALUES (34, 'ddb4b32', 'M', 'ddb4b32@163.com', 1);
INSERT INTO `employee` VALUES (35, '83a3c33', 'M', '83a3c33@163.com', 1);
INSERT INTO `employee` VALUES (36, 'c024434', 'M', 'c024434@163.com', 1);
INSERT INTO `employee` VALUES (37, 'dcc8435', 'M', 'dcc8435@163.com', 1);
INSERT INTO `employee` VALUES (38, '8524236', 'M', '8524236@163.com', 1);
INSERT INTO `employee` VALUES (39, 'd446037', 'M', 'd446037@163.com', 1);
INSERT INTO `employee` VALUES (40, '37a9638', 'M', '37a9638@163.com', 1);
INSERT INTO `employee` VALUES (41, '2b0cf39', 'M', '2b0cf39@163.com', 1);
INSERT INTO `employee` VALUES (43, '647c441', 'M', '647c441@163.com', 1);
INSERT INTO `employee` VALUES (44, '2ae0542', 'M', '2ae0542@163.com', 1);
INSERT INTO `employee` VALUES (45, '6befd43', 'M', '6befd43@163.com', 1);
INSERT INTO `employee` VALUES (46, '2662b44', 'M', '2662b44@163.com', 1);
INSERT INTO `employee` VALUES (47, '40f6045', 'M', '40f6045@163.com', 1);
INSERT INTO `employee` VALUES (48, '2ece146', 'M', 'aaa@163.com', 1);
INSERT INTO `employee` VALUES (49, 'ecddc47', 'M', 'ecddc47@163.com', 1);
INSERT INTO `employee` VALUES (50, 'be9a848', 'M', 'be9a848@163.com', 1);
