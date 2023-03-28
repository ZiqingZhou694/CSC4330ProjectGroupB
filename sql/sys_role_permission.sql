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

 Date: 27/03/2023 22:51:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id` ASC, `permission_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3780 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES (3503, 1, 1);
INSERT INTO `sys_role_permission` VALUES (3504, 1, 3);
INSERT INTO `sys_role_permission` VALUES (3505, 1, 4);
INSERT INTO `sys_role_permission` VALUES (3506, 1, 8);
INSERT INTO `sys_role_permission` VALUES (3507, 1, 9);
INSERT INTO `sys_role_permission` VALUES (3511, 1, 10);
INSERT INTO `sys_role_permission` VALUES (3518, 1, 11);
INSERT INTO `sys_role_permission` VALUES (3477, 1, 12);
INSERT INTO `sys_role_permission` VALUES (3648, 1, 13);
INSERT INTO `sys_role_permission` VALUES (3508, 1, 14);
INSERT INTO `sys_role_permission` VALUES (3509, 1, 15);
INSERT INTO `sys_role_permission` VALUES (3510, 1, 16);
INSERT INTO `sys_role_permission` VALUES (3512, 1, 21);
INSERT INTO `sys_role_permission` VALUES (3513, 1, 22);
INSERT INTO `sys_role_permission` VALUES (3514, 1, 23);
INSERT INTO `sys_role_permission` VALUES (3515, 1, 25);
INSERT INTO `sys_role_permission` VALUES (3516, 1, 26);
INSERT INTO `sys_role_permission` VALUES (3517, 1, 27);
INSERT INTO `sys_role_permission` VALUES (3519, 1, 30);
INSERT INTO `sys_role_permission` VALUES (3520, 1, 31);
INSERT INTO `sys_role_permission` VALUES (3521, 1, 32);
INSERT INTO `sys_role_permission` VALUES (3522, 1, 34);
INSERT INTO `sys_role_permission` VALUES (3523, 1, 35);
INSERT INTO `sys_role_permission` VALUES (3525, 1, 37);
INSERT INTO `sys_role_permission` VALUES (3526, 1, 38);
INSERT INTO `sys_role_permission` VALUES (3527, 1, 39);
INSERT INTO `sys_role_permission` VALUES (3528, 1, 40);
INSERT INTO `sys_role_permission` VALUES (3529, 1, 41);
INSERT INTO `sys_role_permission` VALUES (3530, 1, 42);
INSERT INTO `sys_role_permission` VALUES (3532, 1, 97);
INSERT INTO `sys_role_permission` VALUES (3533, 1, 98);
INSERT INTO `sys_role_permission` VALUES (3534, 1, 99);
INSERT INTO `sys_role_permission` VALUES (3535, 1, 100);
INSERT INTO `sys_role_permission` VALUES (3536, 1, 101);
INSERT INTO `sys_role_permission` VALUES (3537, 1, 102);
INSERT INTO `sys_role_permission` VALUES (3478, 1, 208);
INSERT INTO `sys_role_permission` VALUES (3479, 1, 209);
INSERT INTO `sys_role_permission` VALUES (3480, 1, 210);
INSERT INTO `sys_role_permission` VALUES (3481, 1, 211);
INSERT INTO `sys_role_permission` VALUES (3482, 1, 212);
INSERT INTO `sys_role_permission` VALUES (3483, 1, 213);
INSERT INTO `sys_role_permission` VALUES (3484, 1, 214);
INSERT INTO `sys_role_permission` VALUES (3485, 1, 215);
INSERT INTO `sys_role_permission` VALUES (3486, 1, 392);
INSERT INTO `sys_role_permission` VALUES (3487, 1, 393);
INSERT INTO `sys_role_permission` VALUES (3488, 1, 394);
INSERT INTO `sys_role_permission` VALUES (3489, 1, 395);
INSERT INTO `sys_role_permission` VALUES (3490, 1, 396);
INSERT INTO `sys_role_permission` VALUES (3491, 1, 397);
INSERT INTO `sys_role_permission` VALUES (3492, 1, 398);
INSERT INTO `sys_role_permission` VALUES (3493, 1, 399);
INSERT INTO `sys_role_permission` VALUES (3494, 1, 400);
INSERT INTO `sys_role_permission` VALUES (3495, 1, 406);
INSERT INTO `sys_role_permission` VALUES (3496, 1, 407);
INSERT INTO `sys_role_permission` VALUES (3497, 1, 408);
INSERT INTO `sys_role_permission` VALUES (3498, 1, 409);
INSERT INTO `sys_role_permission` VALUES (3499, 1, 410);
INSERT INTO `sys_role_permission` VALUES (3500, 1, 411);
INSERT INTO `sys_role_permission` VALUES (3501, 1, 416);
INSERT INTO `sys_role_permission` VALUES (3502, 1, 417);
INSERT INTO `sys_role_permission` VALUES (3768, 3, 12);
INSERT INTO `sys_role_permission` VALUES (3765, 3, 208);
INSERT INTO `sys_role_permission` VALUES (3769, 3, 209);
INSERT INTO `sys_role_permission` VALUES (3766, 3, 392);
INSERT INTO `sys_role_permission` VALUES (3770, 3, 393);
INSERT INTO `sys_role_permission` VALUES (3771, 3, 394);
INSERT INTO `sys_role_permission` VALUES (3772, 3, 398);
INSERT INTO `sys_role_permission` VALUES (3773, 3, 399);
INSERT INTO `sys_role_permission` VALUES (3774, 3, 406);
INSERT INTO `sys_role_permission` VALUES (3775, 3, 407);
INSERT INTO `sys_role_permission` VALUES (3767, 3, 408);
INSERT INTO `sys_role_permission` VALUES (3776, 3, 410);
INSERT INTO `sys_role_permission` VALUES (3777, 3, 411);
INSERT INTO `sys_role_permission` VALUES (3778, 3, 416);
INSERT INTO `sys_role_permission` VALUES (3779, 3, 417);
INSERT INTO `sys_role_permission` VALUES (3641, 11, 12);
INSERT INTO `sys_role_permission` VALUES (3638, 11, 208);
INSERT INTO `sys_role_permission` VALUES (3642, 11, 209);
INSERT INTO `sys_role_permission` VALUES (3639, 11, 392);
INSERT INTO `sys_role_permission` VALUES (3643, 11, 393);
INSERT INTO `sys_role_permission` VALUES (3644, 11, 400);
INSERT INTO `sys_role_permission` VALUES (3640, 11, 408);
INSERT INTO `sys_role_permission` VALUES (3645, 11, 409);
INSERT INTO `sys_role_permission` VALUES (3646, 11, 416);
INSERT INTO `sys_role_permission` VALUES (3647, 11, 417);

SET FOREIGN_KEY_CHECKS = 1;
