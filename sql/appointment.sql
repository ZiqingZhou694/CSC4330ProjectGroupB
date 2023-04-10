/*
 Navicat Premium Data Transfer

 Source Server         : Handynote
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : university

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 09/04/2023 21:28:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appointment
-- ----------------------------
DROP TABLE IF EXISTS `appointment`;
CREATE TABLE `appointment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `availability_id` int NULL DEFAULT NULL COMMENT 'availability id',
  `user_id` int NULL DEFAULT NULL COMMENT 'user id',
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'appointment time',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Pending' COMMENT 'pending',
  `deleted` int NULL DEFAULT 0 COMMENT 'deleted logic',
  `tutor_id` int NULL DEFAULT NULL COMMENT 'tutor id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (4, 276959246, 1, '2023-03-07 15:18:59', 'Pending', 4, NULL);
INSERT INTO `appointment` VALUES (5, 276959246, 1, '2023-03-07 15:19:05', 'Pending', 5, NULL);
INSERT INTO `appointment` VALUES (6, 276959246, 1, '2023-03-07 15:20:10', 'Declined', 6, NULL);
INSERT INTO `appointment` VALUES (8, 276959247, 32, '2023-03-07 19:57:41', 'Declined', 8, 20);

SET FOREIGN_KEY_CHECKS = 1;
