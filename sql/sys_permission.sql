/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : university-tutor-center

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 27/03/2023 22:08:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'name',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'path',
  `orders` int(0) NULL DEFAULT 1 COMMENT 'order',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'grid' COMMENT 'icon',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'page path',
  `auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'role',
  `pid` int(0) NULL DEFAULT NULL COMMENT 'pid',
  `deleted` int(0) NULL DEFAULT 0 COMMENT 'deleted logic',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'create time',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT 'update time',
  `type` int(0) NULL DEFAULT NULL COMMENT 'type',
  `hide` tinyint(1) NULL DEFAULT 0 COMMENT 'hide',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `a_d_index`(`auth`, `deleted`) USING BTREE,
  UNIQUE INDEX `p_p_d_index`(`path`, `page`, `deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 'system', '', 2, 'menu', NULL, NULL, NULL, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 1, 0);
INSERT INTO `sys_permission` VALUES (3, 'User', 'user', 1, 'grid', 'User', 'user.list', 1, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 2, 0);
INSERT INTO `sys_permission` VALUES (4, 'Add', '', 1, NULL, '', 'user.add', 3, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 1);
INSERT INTO `sys_permission` VALUES (8, 'Edit', '', 1, NULL, NULL, 'user.edit', 3, 0, NULL, '2023-01-28 11:45:21', 3, 1);
INSERT INTO `sys_permission` VALUES (9, 'Delete', NULL, 1, NULL, NULL, 'user.delete', 3, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 1);
INSERT INTO `sys_permission` VALUES (10, 'Role', 'role', 1, 'grid', 'Role', 'role.list', 1, 0, '2023-01-31 20:32:59', '2023-01-31 20:32:59', 2, 0);
INSERT INTO `sys_permission` VALUES (11, 'Permission', 'permission', 1, 'grid', 'Permission', 'permission.list', 1, 0, '2023-01-31 20:33:25', '2023-01-31 20:33:25', 2, 0);
INSERT INTO `sys_permission` VALUES (12, 'Home', 'home', 1, 'house', 'Home', NULL, NULL, 0, '2023-01-31 21:03:00', '2023-01-31 21:03:00', 2, 0);
INSERT INTO `sys_permission` VALUES (13, 'dict icon', 'dict', 1, 'grid', 'Dict', 'dict.list', 1, 0, '2023-02-02 20:41:32', '2023-03-11 05:25:23', 2, 0);
INSERT INTO `sys_permission` VALUES (14, 'DeleteBatch', NULL, 1, '', NULL, 'user.deleteBatch', 3, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 1);
INSERT INTO `sys_permission` VALUES (15, 'Import', NULL, 1, NULL, NULL, 'user.import', 3, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 1);
INSERT INTO `sys_permission` VALUES (16, 'Export', NULL, 1, NULL, NULL, 'user.export', 3, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 1);
INSERT INTO `sys_permission` VALUES (21, 'Add', NULL, 1, NULL, '', 'role.add', 10, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (22, 'Edit', NULL, 1, NULL, NULL, 'role.edit', 10, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (23, 'Delete', NULL, 1, NULL, NULL, 'role.delete', 10, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (25, 'DeletBatch', NULL, 1, NULL, NULL, 'role.deleteBatch', 10, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (26, 'Import', NULL, 1, NULL, NULL, 'role.import', 10, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (27, 'Export', NULL, 1, NULL, NULL, 'role.export', 10, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (30, 'Add', NULL, 1, NULL, '', 'permission.add', 11, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (31, 'Edit', NULL, 1, NULL, NULL, 'permission.edit', 11, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (32, 'Delete', NULL, 1, NULL, NULL, 'permission.delete', 11, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (34, 'Import', NULL, 1, NULL, NULL, 'permission.import', 11, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (35, 'Export', NULL, 1, NULL, NULL, 'permission.export', 11, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (37, 'Add', NULL, 1, NULL, '', 'dict.add', 13, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (38, 'Edit', NULL, 1, NULL, NULL, 'dict.edit', 13, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (39, 'Delete', NULL, 1, NULL, NULL, 'dict.delete', 13, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (40, 'DeletBatch', NULL, 1, NULL, NULL, 'dict.deleteBatch', 13, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (41, 'Import', NULL, 1, NULL, NULL, 'dict.import', 13, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (42, 'Export', NULL, 1, NULL, NULL, 'dict.export', 13, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (392, 'Availability', 'availability', 1, 'grid', 'Availability', NULL, NULL, 0, NULL, '2023-02-28 23:57:21', 2, 0);
INSERT INTO `sys_permission` VALUES (393, 'AvailabilitySearch', NULL, 1, 'grid', NULL, 'availability.list', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (394, 'AvailabilityAdd', NULL, 1, 'grid', NULL, 'availability.add', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (395, 'AvailabilityImport', NULL, 1, 'grid', NULL, 'availability.import', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (396, 'AvailabilityExport', NULL, 1, 'grid', NULL, 'availability.export', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (397, 'Delete Batch', NULL, 1, 'grid', NULL, 'availability.deleteBatch', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (398, 'AvailabilityEdit', NULL, 1, 'grid', NULL, 'availability.edit', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (399, 'AvailabilityDelete', NULL, 1, 'grid', NULL, 'availability.delete', 392, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (400, 'AvailabilitySchedule', NULL, 1, 'grid', NULL, 'availability.schedule', 392, 0, '2023-03-02 01:04:31', '2023-03-02 01:04:31', 3, 0);
INSERT INTO `sys_permission` VALUES (406, 'status', NULL, 1, 'grid', NULL, 'availability.status', 392, 0, '2023-03-02 01:38:52', '2023-03-02 01:38:52', 3, 0);
INSERT INTO `sys_permission` VALUES (407, 'action', NULL, 1, 'grid', NULL, 'availability.action', 392, 0, '2023-03-02 01:45:45', '2023-03-02 01:45:45', 3, 0);
INSERT INTO `sys_permission` VALUES (408, 'Appointment', 'appointment', 1, 'grid', 'Appointment', NULL, NULL, 0, NULL, '2023-03-02 22:28:42', 2, 0);
INSERT INTO `sys_permission` VALUES (409, 'Cancel', NULL, 1, 'grid', NULL, 'appointment.cancel', 408, 0, NULL, '2023-03-02 22:35:57', 3, 0);
INSERT INTO `sys_permission` VALUES (410, 'Accept', NULL, 1, 'grid', NULL, 'appointment.accept', 408, 0, NULL, '2023-03-06 17:44:40', 3, 0);
INSERT INTO `sys_permission` VALUES (411, 'Decline', NULL, 1, 'grid', NULL, 'appointment.decline', 408, 0, NULL, '2023-03-06 17:45:38', 3, 0);
INSERT INTO `sys_permission` VALUES (416, 'Search', NULL, 1, 'grid', NULL, 'appointment.list', 408, 0, '2023-03-06 18:11:59', '2023-03-06 18:11:59', 3, 0);
INSERT INTO `sys_permission` VALUES (417, 'Add', NULL, 1, 'grid', NULL, 'appointment.add', 408, 0, '2023-03-06 18:22:28', '2023-03-06 18:22:28', 3, 0);

SET FOREIGN_KEY_CHECKS = 1;
