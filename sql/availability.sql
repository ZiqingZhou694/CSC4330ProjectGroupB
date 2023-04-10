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

 Date: 09/04/2023 21:28:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for availability
-- ----------------------------
DROP TABLE IF EXISTS `availability`;
CREATE TABLE `availability`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'tutor name',
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'subject',
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'start time',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'end time',
  `tutor_id` int NULL DEFAULT NULL COMMENT 'tutor id',
  `virtual_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'online meeting link',
  `deleted` int NULL DEFAULT 0 COMMENT 'delete logic',
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'date',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'Available' COMMENT 'status',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276959248 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of availability
-- ----------------------------
INSERT INTO `availability` VALUES (276959241, 'Ziqing Zhou', NULL, '09:30 AM', '06:30 PM', 37, NULL, 276959241, '2023-03-01', 'Expired');
INSERT INTO `availability` VALUES (276959242, 'Ziqing Zhou', NULL, '12:00 AM', '02:00 AM', 37, NULL, 276959242, '2023-03-01', 'available');
INSERT INTO `availability` VALUES (276959244, 'zz null', NULL, '01:30 AM', '02:30 AM', 20, NULL, 276959244, '2023-03-03', 'Expired');
INSERT INTO `availability` VALUES (276959245, 'zz null', NULL, '01:30 AM', '02:00 AM', 20, NULL, 276959245, '2023-03-01', 'Expired');
INSERT INTO `availability` VALUES (276959246, 'tester 2', NULL, '12:00 AM', '12:30 AM', 32, NULL, 276959246, '2023-03-02', 'Expired');
INSERT INTO `availability` VALUES (276959247, 'z z', 'math', '09:00:00', '20:00:00', 20, NULL, 0, '2023-03-08', 'Expired');

SET FOREIGN_KEY_CHECKS = 1;
