/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : university-tutor-center

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 15/04/2023 12:15:30
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
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of appointment
-- ----------------------------
INSERT INTO `appointment` VALUES (4, 276959246, 1, '2023-03-07 15:18:59', 'Pending', 4, NULL, NULL);
INSERT INTO `appointment` VALUES (5, 276959246, 1, '2023-03-07 15:19:05', 'Pending', 5, NULL, NULL);
INSERT INTO `appointment` VALUES (6, 276959246, 1, '2023-03-07 15:20:10', 'Declined', 6, NULL, NULL);
INSERT INTO `appointment` VALUES (8, 276959247, 32, '2023-03-07 19:57:41', 'Declined', 8, 20, NULL);
INSERT INTO `appointment` VALUES (9, 276959247, 1, '2023-04-12 17:51:03', 'Pending', 9, 20, NULL);
INSERT INTO `appointment` VALUES (10, 276959247, 1, '2023-04-12 22:09:38', 'Accepted', 10, 20, NULL);
INSERT INTO `appointment` VALUES (11, 276959247, 32, '2023-04-12 22:11:12', 'Accepted', 0, 20, NULL);
INSERT INTO `appointment` VALUES (12, 276959247, 1, '2023-04-13 22:05:44', 'Pending', 12, 20, NULL);
INSERT INTO `appointment` VALUES (13, 276959248, 1, '2023-04-13 23:34:31', 'Pending', 13, 20, NULL);
INSERT INTO `appointment` VALUES (14, 276959248, 1, '2023-04-13 23:37:20', 'Declined', 14, 20, 'math');
INSERT INTO `appointment` VALUES (15, 276959248, 32, '2023-04-13 23:42:14', 'Accepted', 0, 20, 'math');
INSERT INTO `appointment` VALUES (16, 276959248, 1, '2023-04-14 01:05:31', 'Pending', 16, 20, 'math');
INSERT INTO `appointment` VALUES (17, 276959248, 1, '2023-04-14 01:08:44', 'Pending', 17, 20, 'math');
INSERT INTO `appointment` VALUES (18, 276959248, 1, '2023-04-14 01:10:21', 'Pending', 18, 20, 'math');
INSERT INTO `appointment` VALUES (19, 276959248, 1, '2023-04-14 01:11:41', 'Pending', 19, 20, 'math');
INSERT INTO `appointment` VALUES (20, 276959248, 1, '2023-04-14 01:44:21', 'Pending', 20, 20, 'math');

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
  `nums` int NULL DEFAULT NULL,
  `nums_left` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 276959249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of availability
-- ----------------------------
INSERT INTO `availability` VALUES (276959241, 'Ziqing Zhou', NULL, '09:30 AM', '06:30 PM', 37, NULL, 276959241, '2023-03-01', 'Expired', NULL, NULL);
INSERT INTO `availability` VALUES (276959242, 'Ziqing Zhou', NULL, '12:00 AM', '02:00 AM', 37, NULL, 276959242, '2023-03-01', 'available', NULL, NULL);
INSERT INTO `availability` VALUES (276959244, 'zz null', NULL, '01:30 AM', '02:30 AM', 20, NULL, 276959244, '2023-03-03', 'Expired', NULL, NULL);
INSERT INTO `availability` VALUES (276959245, 'zz null', NULL, '01:30 AM', '02:00 AM', 20, NULL, 276959245, '2023-03-01', 'Expired', NULL, NULL);
INSERT INTO `availability` VALUES (276959246, 'tester 2', NULL, '12:00 AM', '12:30 AM', 32, NULL, 276959246, '2023-03-02', 'Expired', NULL, NULL);
INSERT INTO `availability` VALUES (276959247, 'z z', 'math', '09:00:00', '20:00:00', 20, NULL, 0, '2023-04-13', 'Expired', 0, 0);
INSERT INTO `availability` VALUES (276959248, 'z z', 'math', '09:00:00', '10:00:00', 20, NULL, 0, '2023-04-14', 'Expired', 1, 1);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `rate` decimal(10, 0) NULL DEFAULT NULL,
  `foreign_id` int NULL DEFAULT NULL COMMENT 'tutor id',
  `pid` int NULL DEFAULT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'replay target',
  `createtime` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (8, '', NULL, NULL, 4, NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (9, '12', NULL, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (10, '345', 'admin', 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (11, '', 'admin', 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (12, '2', 'admin', 1, 4, 20, NULL, NULL, NULL);
INSERT INTO `comment` VALUES (13, '22', 'admin', 1, 4, 20, NULL, NULL, '2023-04-13 16:47:42');
INSERT INTO `comment` VALUES (14, '5', 'admin', 1, 5, 20, NULL, NULL, '2023-04-13 16:49:52');
INSERT INTO `comment` VALUES (15, '', 'admin', 1, 1, 20, NULL, NULL, '2023-04-13 19:18:47');
INSERT INTO `comment` VALUES (16, '还可以', 'test', 32, 5, 20, NULL, NULL, '2023-04-13 21:59:53');
INSERT INTO `comment` VALUES (17, 'good', 'test', 32, 5, 20, NULL, NULL, '2023-04-13 23:46:22');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `deleted` int NULL DEFAULT 0 COMMENT '删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `c_d`(`code` ASC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user', 'user', 'icon', 0);
INSERT INTO `sys_dict` VALUES (2, 'message', 'message', 'icon', 0);
INSERT INTO `sys_dict` VALUES (3, 'menu', 'menu', 'icon', 0);
INSERT INTO `sys_dict` VALUES (4, 'grid', 'grid', 'icon', 0);
INSERT INTO `sys_dict` VALUES (5, 'house', 'house', 'icon', 0);
INSERT INTO `sys_dict` VALUES (6, 'file', 'files', 'icon', 0);

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `size` bigint NULL DEFAULT NULL COMMENT '大小',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '访问链接',
  `md5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件摘要',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '存储地址',
  `deleted` int NULL DEFAULT 0 COMMENT '软删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (14, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 11:37:40', '2023-02-04 11:37:40');
INSERT INTO `sys_file` VALUES (15, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 11:37:58', '2023-02-04 11:37:58');
INSERT INTO `sys_file` VALUES (16, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 11:38:33', '2023-02-04 11:38:33');
INSERT INTO `sys_file` VALUES (17, 'dog.jpg', 63308, 'jpg', 'http://localhost:9090/file/download/46a791c6ebd74972a9b761d137d77397.jpg', '698f208b46b5b780a231593517b6b26e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/46a791c6ebd74972a9b761d137d77397.jpg', 0, '2023-02-04 13:28:30', '2023-02-04 13:28:30');
INSERT INTO `sys_file` VALUES (18, 'QQ截图20220521171636.png', 269788, 'png', 'http://localhost:9090/file/download/12e4dd9a53da43ab99e2559793b833a1.png', '85c90d261ac69c13bf4a1d2ed7898e52', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/12e4dd9a53da43ab99e2559793b833a1.png', 0, '2023-02-04 13:31:58', '2023-02-04 13:31:58');
INSERT INTO `sys_file` VALUES (19, 'QQ截图20221123205241.png', 88397, 'png', 'http://localhost:9090/file/download/c852ac64fd9440efa739f59d092fa8e9.png', '5851f34ce75540e33f95e224ee03d268', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/c852ac64fd9440efa739f59d092fa8e9.png', 0, '2023-02-04 13:32:01', '2023-02-04 13:32:01');
INSERT INTO `sys_file` VALUES (20, 'QQ截图20220521171636.png', 269788, 'png', 'http://localhost:9090/file/download/12e4dd9a53da43ab99e2559793b833a1.png', '85c90d261ac69c13bf4a1d2ed7898e52', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/12e4dd9a53da43ab99e2559793b833a1.png', 0, '2023-02-04 13:32:31', '2023-02-04 13:32:31');
INSERT INTO `sys_file` VALUES (21, 'c1b4644290f8421fb31d1cde90364ec1.webp', 49510, 'webp', 'http://localhost:9090/file/download/dd79ba9edcf149c086737e7c11ae91b8.webp', 'ee4b25e9cdd41506dae9018a4f615f12', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dd79ba9edcf149c086737e7c11ae91b8.webp', 0, '2023-02-04 13:33:52', '2023-02-04 13:33:52');
INSERT INTO `sys_file` VALUES (22, 'ab8ea261a9b6467d8f5827e208fc25c0.pdf', 821746, 'pdf', 'http://localhost:9090/file/download/e322e7951e684f6cb4d8e11860cc23c0.pdf', '4c96cd3aa19642e7eaf655df981e379e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/e322e7951e684f6cb4d8e11860cc23c0.pdf', 0, '2023-02-04 13:35:29', '2023-02-04 13:35:29');
INSERT INTO `sys_file` VALUES (23, '0e2fec37cf0241f0ac82db224f7e9093.png', 455277, 'png', 'http://localhost:9090/file/download/8ddfe75750d446228539750cf83cc5e1.png', '22a706b36b213562544aa8041bdb0b22', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/8ddfe75750d446228539750cf83cc5e1.png', 0, '2023-02-04 13:36:12', '2023-02-04 13:36:12');
INSERT INTO `sys_file` VALUES (24, 'BQ20220823668193_qrcode.jpg', 21129, 'jpg', 'http://localhost:9090/file/download/b6ab2e46470f4e8ead02eb9c1d8cab73.jpg', '33d7e6c0870242b060b074426a16382c', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/b6ab2e46470f4e8ead02eb9c1d8cab73.jpg', 0, '2023-02-04 13:36:47', '2023-02-04 13:36:47');
INSERT INTO `sys_file` VALUES (25, '6aa9b8f78cba45329df8849575c90837.png', 10675, 'png', 'http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png', '03836b3799ae0fa0870d370e28582d19', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dfcf5f36d649469393f9a0cff3a9adbd.png', 0, '2023-02-04 13:39:40', '2023-02-04 13:39:40');
INSERT INTO `sys_file` VALUES (26, '9fb235cd4e8d41c79802b4f3d7c23895.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-04 13:39:49', '2023-02-04 13:39:49');
INSERT INTO `sys_file` VALUES (27, 'dcd050fbd8ec4c45920d43ba15a493bb.png', 455277, 'png', 'http://localhost:9090/file/download/8ddfe75750d446228539750cf83cc5e1.png', '22a706b36b213562544aa8041bdb0b22', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/8ddfe75750d446228539750cf83cc5e1.png', 0, '2023-02-04 13:40:13', '2023-02-04 13:40:13');
INSERT INTO `sys_file` VALUES (28, 'c1b4644290f8421fb31d1cde90364ec1.webp', 49510, 'webp', 'http://localhost:9090/file/download/dd79ba9edcf149c086737e7c11ae91b8.webp', 'ee4b25e9cdd41506dae9018a4f615f12', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dd79ba9edcf149c086737e7c11ae91b8.webp', 0, '2023-02-04 13:41:24', '2023-02-04 13:41:24');
INSERT INTO `sys_file` VALUES (29, '新建 PPT 演示文稿.ppt', 41984, 'ppt', 'http://localhost:9090/file/download/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', '67babc8456f7bde3e137aa3ada775487', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', 0, '2023-02-04 15:29:35', '2023-02-04 15:29:35');
INSERT INTO `sys_file` VALUES (30, 'QQ截图20221201222714.png', 121662, 'png', 'http://localhost:9090/file/download/473224461f4d418fbeaeb6c9083543ae.png', '5fff63c4999b440a0a39fdfd6510c3dd', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/473224461f4d418fbeaeb6c9083543ae.png', 0, '2023-02-04 15:30:09', '2023-02-04 15:30:09');
INSERT INTO `sys_file` VALUES (31, 'ds.png', 499437, 'png', 'http://localhost:9090/file/download/f1ada57ace804697832d18c19c9b8d75.png', 'fcef406f63714fd1559d16cecda654b6', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/f1ada57ace804697832d18c19c9b8d75.png', 0, '2023-02-04 15:30:13', '2023-02-04 15:30:13');
INSERT INTO `sys_file` VALUES (32, '微信截图_20220806192019.png', 41695, 'png', 'http://localhost:9090/file/download/45e112ffda2c4db4bd55771742c4de8f.png', '1b362fca0adc034ff5fdfc49d4e320b1', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/45e112ffda2c4db4bd55771742c4de8f.png', 0, '2023-02-04 15:30:53', '2023-02-04 15:30:53');
INSERT INTO `sys_file` VALUES (33, '微信截图_20220706191248.png', 974309, 'png', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'd0af07d4be66ce7c392a22fb0f1ba659', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/cce151d3972b4780acf5a115f6a55f48.png', 0, '2023-02-04 15:30:57', '2023-02-04 15:30:57');
INSERT INTO `sys_file` VALUES (34, 'QQ截图20220523170916.png', 1118, 'png', 'http://localhost:9090/file/download/61ce3f7364d341f1a7b55bda746f5abe.png', '8841b08ce04ed9d6426b8c0fea829e70', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/61ce3f7364d341f1a7b55bda746f5abe.png', 0, '2023-02-04 15:31:03', '2023-02-04 15:31:03');
INSERT INTO `sys_file` VALUES (35, 'nacos服务.png', 44960, 'png', 'http://localhost:9090/file/download/eed68ab96ea14cfdb4f082867cc36a0e.png', '0f34d6534bbc23b0d9d30483d739b791', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/eed68ab96ea14cfdb4f082867cc36a0e.png', 0, '2023-02-04 15:31:20', '2023-02-04 15:31:20');
INSERT INTO `sys_file` VALUES (36, '微信截图_20220806192019.png', 41695, 'png', 'http://localhost:9090/file/download/45e112ffda2c4db4bd55771742c4de8f.png', '1b362fca0adc034ff5fdfc49d4e320b1', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/45e112ffda2c4db4bd55771742c4de8f.png', 0, '2023-02-04 15:33:19', '2023-02-04 15:33:19');
INSERT INTO `sys_file` VALUES (37, '新建 PPT 演示文稿.ppt', 20992, 'ppt', 'http://localhost:9090/file/download/1ed9786a139b4b409d319192a3ae6942.ppt', '5d7d0eb6696fb3e37a6dfeeccff006ab', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/1ed9786a139b4b409d319192a3ae6942.ppt', 0, '2023-02-04 15:33:41', '2023-02-04 15:33:41');
INSERT INTO `sys_file` VALUES (38, 'QQ截图20220909195631.png', 75987, 'png', 'http://localhost:9090/file/download/91ef247cc585445f8ac6b6a55bba070c.png', '1a549f80ababc51b0c63b5ca67c74c58', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/91ef247cc585445f8ac6b6a55bba070c.png', 0, '2023-02-04 15:33:51', '2023-02-04 15:33:51');
INSERT INTO `sys_file` VALUES (39, 'Nacos.png', 78968, 'png', 'http://localhost:9090/file/download/1cd464179e9741d79d0ff0e9233b3666.png', '09540432f77549b7c06111a8ae987a66', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/1cd464179e9741d79d0ff0e9233b3666.png', 0, '2023-02-04 15:35:38', '2023-02-04 15:35:38');
INSERT INTO `sys_file` VALUES (40, '微信截图_20220706191248.png', 974309, 'png', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'd0af07d4be66ce7c392a22fb0f1ba659', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/cce151d3972b4780acf5a115f6a55f48.png', 0, '2023-02-04 15:45:25', '2023-02-04 15:45:25');
INSERT INTO `sys_file` VALUES (41, '微信截图_20220616213432.png', 142891, 'png', 'http://localhost:9090/file/download/71cbf05d68d24634b098d3273d1fd8af.png', '76df935870440427fa9e809ff3abfbe6', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/71cbf05d68d24634b098d3273d1fd8af.png', 0, '2023-02-04 15:45:33', '2023-02-04 15:45:33');
INSERT INTO `sys_file` VALUES (42, '微信截图_20220818192957.png', 90105, 'png', 'http://localhost:9090/file/download/a359454194cc41378db71379950ee60b.png', '71c3963fb83637917497bd55a7d7809f', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/a359454194cc41378db71379950ee60b.png', 0, '2023-02-04 16:01:51', '2023-02-04 16:01:51');
INSERT INTO `sys_file` VALUES (43, '微信截图_20220706191248.png', 974309, 'png', 'http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png', 'd0af07d4be66ce7c392a22fb0f1ba659', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/cce151d3972b4780acf5a115f6a55f48.png', 0, '2023-02-04 22:01:37', '2023-02-04 22:01:37');
INSERT INTO `sys_file` VALUES (44, '足球.png', 10675, 'png', 'http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png', '03836b3799ae0fa0870d370e28582d19', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/dfcf5f36d649469393f9a0cff3a9adbd.png', 0, '2023-02-04 22:04:22', '2023-02-04 22:04:22');
INSERT INTO `sys_file` VALUES (45, 'Nacos.png', 78968, 'png', 'http://localhost:9090/file/download/1cd464179e9741d79d0ff0e9233b3666.png', '09540432f77549b7c06111a8ae987a66', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/1cd464179e9741d79d0ff0e9233b3666.png', 0, '2023-02-04 22:16:49', '2023-02-04 22:16:49');
INSERT INTO `sys_file` VALUES (46, 'QQ截图20220612201918.png', 463169, 'png', 'http://localhost:9090/file/download/9969de9cfcea45fb98caf185060e88de.png', '69759e96a1c92263b185d48d50e3396a', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/9969de9cfcea45fb98caf185060e88de.png', 0, '2023-02-04 22:17:36', '2023-02-04 22:17:36');
INSERT INTO `sys_file` VALUES (47, 'courgette.log', 0, 'log', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-04 22:17:51', '2023-02-04 22:17:51');
INSERT INTO `sys_file` VALUES (48, '新建 PPT 演示文稿.ppt', 41984, 'ppt', 'http://localhost:9090/file/download/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', '67babc8456f7bde3e137aa3ada775487', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/b3ebb01a0d8946e6bee7c6c326d789fd.ppt', 0, '2023-02-04 22:18:19', '2023-02-04 22:18:19');
INSERT INTO `sys_file` VALUES (49, 'ssss.docx', 10071, 'docx', 'http://localhost:9090/file/download/3525cc2c23c444218307bf42ddbd44d8.docx', '49e0ca3aefb9be63647c7dd009be5db3', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/3525cc2c23c444218307bf42ddbd44d8.docx', 0, '2023-02-04 22:19:15', '2023-02-04 22:19:15');
INSERT INTO `sys_file` VALUES (50, 'ssss.doc', 10071, 'doc', 'http://localhost:9090/file/download/3525cc2c23c444218307bf42ddbd44d8.docx', '49e0ca3aefb9be63647c7dd009be5db3', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/3525cc2c23c444218307bf42ddbd44d8.docx', 0, '2023-02-04 22:20:04', '2023-02-04 22:20:04');
INSERT INTO `sys_file` VALUES (51, 'ssss.doc', 10103, 'doc', 'http://localhost:9090/file/download/04c8e6b510d84917bd8dd948dd316843.doc', '4a2d1ef17edd9aac3027c3b6aba00d51', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/04c8e6b510d84917bd8dd948dd316843.doc', 0, '2023-02-04 22:20:25', '2023-02-04 22:20:25');
INSERT INTO `sys_file` VALUES (52, '5d14421163796-big.jpg', 4716, 'jpg', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', 'dd1100e1b58e3a834802ddb5ead2623b', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', 0, '2023-02-11 21:25:45', '2023-02-11 21:25:45');
INSERT INTO `sys_file` VALUES (53, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-11 22:25:41', '2023-02-11 22:25:41');
INSERT INTO `sys_file` VALUES (54, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-11 22:25:44', '2023-02-11 22:25:44');
INSERT INTO `sys_file` VALUES (55, '1213123213.jpg', 10458, 'jpg', 'http://localhost:9090/file/download/80640a374c144fd2bd8d94c122fc1d79.jpg', '75ea040ecc58b96bc2f5290daf215105', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/80640a374c144fd2bd8d94c122fc1d79.jpg', 0, '2023-02-11 22:30:48', '2023-02-11 22:30:48');
INSERT INTO `sys_file` VALUES (56, 'v2-66672db58d976e6e095e08a180d1d530_r.jpg', 82790, 'jpg', 'http://localhost:9090/file/download/15b95fcef7be42e099ccdd831c688202.jpg', '0d4423a175ed5ac1c689c952b408b6bc', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/15b95fcef7be42e099ccdd831c688202.jpg', 0, '2023-02-11 22:30:51', '2023-02-11 22:30:51');
INSERT INTO `sys_file` VALUES (57, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-11 22:39:57', '2023-02-11 22:39:57');
INSERT INTO `sys_file` VALUES (58, 'QQ截图20230211105625.png', 44382, 'png', 'http://localhost:9090/file/download/e432e1f8bd2a42269f6cc1ac11cfd557.png', 'd5a45b2485746400308bbe52904a7069', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/e432e1f8bd2a42269f6cc1ac11cfd557.png', 0, '2023-02-11 22:39:59', '2023-02-11 22:39:59');
INSERT INTO `sys_file` VALUES (59, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 22:31:43', '2023-02-18 22:31:43');
INSERT INTO `sys_file` VALUES (60, 'QQ截图20230211105625.png', 44382, 'png', 'http://localhost:9090/file/download/e432e1f8bd2a42269f6cc1ac11cfd557.png', 'd5a45b2485746400308bbe52904a7069', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/e432e1f8bd2a42269f6cc1ac11cfd557.png', 0, '2023-02-18 22:33:42', '2023-02-18 22:33:42');
INSERT INTO `sys_file` VALUES (61, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 22:34:21', '2023-02-18 22:34:21');
INSERT INTO `sys_file` VALUES (62, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 22:35:30', '2023-02-18 22:35:30');
INSERT INTO `sys_file` VALUES (63, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 22:36:54', '2023-02-18 22:36:54');
INSERT INTO `sys_file` VALUES (64, 'beer.jpg', 13289, 'jpg', 'http://localhost:9090/file/download/2049d91719af4ecb8a5604d0e4e50f63.jpg', '35977e7dc2159a734f3c81de460e4b8d', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/2049d91719af4ecb8a5604d0e4e50f63.jpg', 0, '2023-02-18 22:47:51', '2023-02-18 22:47:51');
INSERT INTO `sys_file` VALUES (65, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 23:06:23', '2023-02-18 23:06:23');
INSERT INTO `sys_file` VALUES (66, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 23:06:45', '2023-02-18 23:06:45');
INSERT INTO `sys_file` VALUES (67, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 0, '2023-02-18 23:09:01', '2023-02-18 23:09:01');
INSERT INTO `sys_file` VALUES (68, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 0, '2023-02-18 23:09:29', '2023-02-18 23:09:29');
INSERT INTO `sys_file` VALUES (69, 'JAVA核心知识点整理.pdf', 10922015, 'pdf', 'http://localhost:9090/file/download/934931f5ab274096b6222150cc674822.pdf', 'cc26057c92f30401abae727d442d5b33', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/934931f5ab274096b6222150cc674822.pdf', 0, '2023-02-19 10:30:37', '2023-02-19 10:30:37');
INSERT INTO `sys_file` VALUES (70, '测试.docx', 0, 'docx', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-19 10:31:26', '2023-02-19 10:31:26');
INSERT INTO `sys_file` VALUES (71, '测试.docx', 0, 'docx', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-19 10:31:52', '2023-02-19 10:31:52');
INSERT INTO `sys_file` VALUES (72, 'Java开发手册-嵩山版.pdf', 1580978, 'pdf', 'http://localhost:9090/file/download/e732d71cae9842fe849fbfe6ca96d915.pdf', '0b1f94339d5757ed196198f70491cc25', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/e732d71cae9842fe849fbfe6ca96d915.pdf', 0, '2023-02-19 10:32:11', '2023-02-19 10:32:11');
INSERT INTO `sys_file` VALUES (73, 'JAVA核心知识点整理.pdf', 10922015, 'pdf', 'http://localhost:9090/file/download/934931f5ab274096b6222150cc674822.pdf', 'cc26057c92f30401abae727d442d5b33', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/934931f5ab274096b6222150cc674822.pdf', 0, '2023-02-19 10:33:10', '2023-02-19 10:33:10');
INSERT INTO `sys_file` VALUES (74, '测试.docx', 0, 'docx', 'http://localhost:9090/file/download/0ee054a700b344b3b555cb69e8517928.docx', 'd41d8cd98f00b204e9800998ecf8427e', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/0ee054a700b344b3b555cb69e8517928.docx', 0, '2023-02-19 10:56:45', '2023-02-19 10:56:45');
INSERT INTO `sys_file` VALUES (75, '封面@凡科快图.png', 392587, 'png', 'http://localhost:9090/file/download/a75a2983d16d4936afaf2c1f48a4483c.png', 'd9edc6e52d72029994a7fb495e25bde7', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/a75a2983d16d4936afaf2c1f48a4483c.png', 75, '2023-02-19 10:57:05', '2023-02-28 16:27:36');
INSERT INTO `sys_file` VALUES (76, 'QQ截图20230211105532.png', 166647, 'png', 'http://localhost:9090/file/download/244a4821658f493db9d304a2000c1eca.png', 'bd74ba46e1481611bdccaeb29791e12e', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/244a4821658f493db9d304a2000c1eca.png', 76, '2023-02-19 10:57:18', '2023-02-28 16:27:36');
INSERT INTO `sys_file` VALUES (77, 'QQ截图20230211105428.png', 302241, 'png', 'http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png', 'adfd0ea8a0f4d2e4ed589b88b480b523', 'D:\\毕设\\演示\\vue3代码生成器演示\\boot-vue3-master/files/dd566990afa541cfb241203e83e8c651.png', 77, '2023-02-19 21:15:15', '2023-02-28 16:27:02');
INSERT INTO `sys_file` VALUES (78, 'weibo.webp', 12860, 'webp', 'http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp', '06805213683f2d30e88ee5e567cdf6d2', 'D:\\毕设\\脚手架\\代码生成器\\boot-vue3-master/files/66faf9a9ef34404991add03ffa9d8e59.webp', 78, '2023-02-19 21:15:19', '2023-02-28 16:27:02');
INSERT INTO `sys_file` VALUES (79, 'QQ图片20220509133430.jpg', 13303, 'jpg', 'http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg', '993624841008f005395a1bf0dc0d151e', 'D:\\IdeaProjects\\University-Tutor-Center/files/b759d9b851134c0e9765b476f5f37d25.jpg', 0, '2023-02-28 01:20:02', '2023-02-28 01:20:02');
INSERT INTO `sys_file` VALUES (80, 'QQ图片20220509133430.jpg', 13303, 'jpg', 'http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg', '993624841008f005395a1bf0dc0d151e', 'D:\\IdeaProjects\\University-Tutor-Center/files/b759d9b851134c0e9765b476f5f37d25.jpg', 0, '2023-02-28 16:12:23', '2023-02-28 16:12:23');
INSERT INTO `sys_file` VALUES (81, 'QQ图片20220509133430.jpg', 13303, 'jpg', 'http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg', '993624841008f005395a1bf0dc0d151e', 'D:\\IdeaProjects\\University-Tutor-Center/files/b759d9b851134c0e9765b476f5f37d25.jpg', 0, '2023-02-28 16:14:21', '2023-02-28 16:14:21');
INSERT INTO `sys_file` VALUES (82, 'user2.jpg', 71952, 'jpg', 'http://localhost:9090/file/download/f8c7f74546df4c1095253e7e6d66c4fa.jpg', 'a098f6f8eb2909b8a09ee88a1d2285ed', 'C:\\Users\\jing7\\OneDrive\\Desktop\\school work\\CSC4330\\University-Tutor-Center/files/f8c7f74546df4c1095253e7e6d66c4fa.jpg', 0, '2023-04-12 20:50:41', '2023-04-12 20:50:41');
INSERT INTO `sys_file` VALUES (83, 'user2.jpg', 71952, 'jpg', 'http://localhost:9090/file/download/f8c7f74546df4c1095253e7e6d66c4fa.jpg', 'a098f6f8eb2909b8a09ee88a1d2285ed', 'C:\\Users\\jing7\\OneDrive\\Desktop\\school work\\CSC4330\\University-Tutor-Center/files/f8c7f74546df4c1095253e7e6d66c4fa.jpg', 0, '2023-04-12 20:51:43', '2023-04-12 20:51:43');
INSERT INTO `sys_file` VALUES (84, '7c9bb1965b10aaad6d83b8bbaa18bddb7620ea9d.jpg', 131973, 'jpg', 'http://localhost:9090/file/download/b3b384eea49d49eda3119faf28612d5c.jpg', '73bc173d4cae77f236aad7389e1f47af', 'C:\\Users\\jing7\\OneDrive\\Desktop\\school work\\CSC4330\\University-Tutor-Center/files/b3b384eea49d49eda3119faf28612d5c.jpg', 0, '2023-04-13 21:23:03', '2023-04-13 21:23:03');
INSERT INTO `sys_file` VALUES (85, 'de83ff758e479116d7446e105faa15ce4282455f.jpg', 376078, 'jpg', 'http://localhost:9090/file/download/1a628038d68a43cfa7e0ab3ea6c5a3f2.jpg', '114c43170235b07888fc0b24aab2250d', 'C:\\Users\\jing7\\OneDrive\\Desktop\\school work\\CSC4330\\University-Tutor-Center/files/1a628038d68a43cfa7e0ab3ea6c5a3f2.jpg', 0, '2023-04-13 21:23:31', '2023-04-13 21:23:31');
INSERT INTO `sys_file` VALUES (86, 'dc54564e9258d1098445f2fbd158ccbf6d814dd0.jpg', 437859, 'jpg', 'http://localhost:9090/file/download/0ed4f3f2e0b846c3a76b9893f98383f2.jpg', 'e152ea49dd52dca7d35f2777a9e0d56e', 'C:\\Users\\jing7\\OneDrive\\Desktop\\school work\\CSC4330\\University-Tutor-Center/files/0ed4f3f2e0b846c3a76b9893f98383f2.jpg', 0, '2023-04-13 21:23:37', '2023-04-13 21:23:37');
INSERT INTO `sys_file` VALUES (87, '153_170613132340_2.jpg', 499441, 'jpg', 'http://localhost:9090/file/download/3ef03aa921504d26bada818bc02077bf.jpg', 'f80091e885725384b23d459702c02efe', 'C:\\Users\\jing7\\OneDrive\\Desktop\\school work\\CSC4330\\University-Tutor-Center/files/3ef03aa921504d26bada818bc02077bf.jpg', 0, '2023-04-13 21:23:44', '2023-04-13 21:23:44');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作',
  `params` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '入参',
  `output` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '出参',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'url',
  `duration` int NULL DEFAULT NULL COMMENT '执行时间',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` int NULL DEFAULT 0 COMMENT '软删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 271 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (4, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '返回状态码：200', 'http://localhost:9090/login', 675, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:00:12', 0);
INSERT INTO `sys_log` VALUES (5, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 769, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:02:50', 0);
INSERT INTO `sys_log` VALUES (6, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:02:54', 0);
INSERT INTO `sys_log` VALUES (7, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 107, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:03:16', 0);
INSERT INTO `sys_log` VALUES (8, '编辑权限', '{\"id\":360,\"名称\":\"日志管理\",\"路径\":\"log\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Log\",\"父级id\":1,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1676797462449,\"children\":[{\"id\":361,\"名称\":\"系统日志查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.list\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":362,\"名称\":\"系统日志新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.add\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":363,\"名称\":\"系统日志导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.import\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":364,\"名称\":\"系统日志导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.export\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":365,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.deleteBatch\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":366,\"名称\":\"系统日志编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.edit\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":367,\"名称\":\"系统日志删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"log.delete\",\"父级id\":360,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 15, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:04:23', 0);
INSERT INTO `sys_log` VALUES (9, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:04:29', 0);
INSERT INTO `sys_log` VALUES (10, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:04:33', 0);
INSERT INTO `sys_log` VALUES (11, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 17:12:05', 0);
INSERT INTO `sys_log` VALUES (12, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 17:13:27', 0);
INSERT INTO `sys_log` VALUES (13, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 869, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:33:02', 0);
INSERT INTO `sys_log` VALUES (14, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 110, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:37:48', 0);
INSERT INTO `sys_log` VALUES (15, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 92, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:37:55', 0);
INSERT INTO `sys_log` VALUES (16, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 90, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:38:06', 0);
INSERT INTO `sys_log` VALUES (17, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":19,\"用户名\":\"gbb\",\"密码\":\"$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae\",\"昵称\":\"Ikun小黑子专用号\",\"邮箱\":\"ikun@163.com\",\"地址\":\"蔡徐坤北京分坤\",\"用户唯一id\":\"f3e75978695847e59c7c575d8379afa3\",\"头像\":\"http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1676121934000,\"updateTime\":1676121934000,\"角色\":\"USER\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJmM2U3NTk3ODY5NTg0N2U1OWM3YzU3NWQ4Mzc5YWZhMyIsInJuU3RyIjoiOERleThoYm1RT1dscUs0N0RVY2VWM29sQVBsdGdZYVcifQ.-nUk51wSNf4BvacXyUWpa09aEXq93kGPpnK0rLjwb5Y\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675170180000,\"更新时间\":1675170180000,\"children\":[],\"是否隐藏\":false},{\"id\":187,\"名称\":\"在线聊天室\",\"路径\":\"im\",\"顺序\":1,\"图标\":\"chatRound\",\"页面路径\":\"IM\",\"类型\":2,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 93, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:38:22', 0);
INSERT INTO `sys_log` VALUES (18, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,187,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 16, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:38:53', 0);
INSERT INTO `sys_log` VALUES (19, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:39:00', 0);
INSERT INTO `sys_log` VALUES (20, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,187,195,198,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 14, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:39:15', 0);
INSERT INTO `sys_log` VALUES (21, '编辑角色', '{\"id\":3,\"名称\":\"普通用户\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673869841000,\"更新时间\":1673869841000,\"permissionIds\":[208,12,187,195,198,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 14, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:39:19', 0);
INSERT INTO `sys_log` VALUES (22, '用户退出登录', 'f3e75978695847e59c7c575d8379afa3', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/f3e75978695847e59c7c575d8379afa3', 15, '112.32.138.68', '安徽省合肥市', 'gbb', '2023-02-19 20:40:03', 0);
INSERT INTO `sys_log` VALUES (23, '用户登录', '{\"username\":\"gbb\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 93, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:40:10', 0);
INSERT INTO `sys_log` VALUES (24, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 20:41:35', 0);
INSERT INTO `sys_log` VALUES (25, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 94, '112.32.138.68', '安徽省合肥市', '', '2023-02-19 20:41:40', 0);
INSERT INTO `sys_log` VALUES (26, '新增动态', '{\"id\":13,\"名称\":\"测试富文本\",\"内容\":\"<blockquote>测试测试</blockquote><h1>11111</h1><h2>222222</h2><p><span style=\\\"color: rgb(250, 250, 250); background-color: rgb(54, 88, 226);\\\"><em><strong>bbbbbb</strong></em></span></p><p><br></p><pre><code class=\\\"language-java\\\">class Hello {\\n  \\n}</code></pre><p><br></p>\",\"创建时间\":1676811617832,\"更新时间\":1676811617832}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 16, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:00:18', 0);
INSERT INTO `sys_log` VALUES (27, '编辑动态', '{\"id\":13,\"软删除\":0,\"名称\":\"测试富文本\",\"内容\":\"<blockquote>测试测试</blockquote><h1>11111</h1><h2>222222</h2><p><span style=\\\"color: rgb(250, 250, 250); background-color: rgb(54, 88, 226);\\\"><em><strong>bbbbbb</strong></em></span></p><p><br></p><pre><code class=\\\"language-java\\\">class Hello {\\n  \\n}</code></pre><p><br></p>\",\"用户id\":4,\"创建时间\":1676811618000,\"更新时间\":1676811618000}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/dynamic', 0, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:05:48', 0);
INSERT INTO `sys_log` VALUES (28, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 797, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:14:54', 0);
INSERT INTO `sys_log` VALUES (29, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\"}', 'http://localhost:9090/file/upload', 31, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:15:16', 0);
INSERT INTO `sys_log` VALUES (30, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp\"}', 'http://localhost:9090/file/upload', 16, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:15:19', 0);
INSERT INTO `sys_log` VALUES (31, '新增发帖', '{\"id\":1,\"名称\":\"测试发帖\",\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"文件\":\"http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp\",\"日期\":\"2023-02-19\",\"时间\":\"2023-02-19 21:15:23\",\"富文本\":\"<blockquote>富文本</blockquote><ol><li>哈哈哈</li><li>红红火火恍恍惚惚</li></ol>\",\"用户id\":4,\"是否隐藏\":\"是\",\"创建时间\":1676812553349,\"更新时间\":1676812553349}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/posts', 15, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:15:54', 0);
INSERT INTO `sys_log` VALUES (32, '编辑发帖', '{\"id\":1,\"名称\":\"测试发帖11122333\",\"软删除\":0,\"图片\":\"http://localhost:9090/file/download/dd566990afa541cfb241203e83e8c651.png\",\"文件\":\"http://localhost:9090/file/download/66faf9a9ef34404991add03ffa9d8e59.webp\",\"日期\":\"2023-02-20\",\"时间\":\"2023-02-19 21:15:23\",\"富文本\":\"<blockquote>富文本</blockquote><ol><li>哈哈哈</li><li>红红火火恍恍惚惚</li></ol>\",\"用户id\":4,\"是否隐藏\":\"否\",\"创建时间\":1676812553000,\"更新时间\":1676812553000}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/posts', 15, '112.32.138.68', '安徽省合肥市', 'admin', '2023-02-19 21:17:21', 0);
INSERT INTO `sys_log` VALUES (33, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 822, '174.64.14.13', NULL, '', '2023-02-21 00:07:45', 0);
INSERT INTO `sys_log` VALUES (34, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 733, '174.64.14.13', NULL, '', '2023-02-27 11:52:33', 0);
INSERT INTO `sys_log` VALUES (35, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 448, '174.64.14.13', NULL, '', '2023-02-27 12:43:46', 0);
INSERT INTO `sys_log` VALUES (36, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-27 12:56:55', 0);
INSERT INTO `sys_log` VALUES (37, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 87, '174.64.14.13', NULL, '', '2023-02-27 12:57:05', 0);
INSERT INTO `sys_log` VALUES (38, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 429, '174.64.14.13', NULL, 'admin', '2023-02-27 17:18:34', 0);
INSERT INTO `sys_log` VALUES (39, '删除权限', '187', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/187', 15, '174.64.14.13', NULL, 'admin', '2023-02-27 17:18:49', 0);
INSERT INTO `sys_log` VALUES (40, '编辑角色', '{\"id\":1,\"名称\":\"管理员\",\"唯一标识\":\"ADMIN\",\"逻辑删除\":0,\"创建时间\":1673920184000,\"更新时间\":1673920195000,\"permissionIds\":[12,186,195,198,208,209,210,211,212,213,214,215,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,1,3,4,8,9,14,15,16,10,21,22,23,25,26,27,11,30,31,32,34,35,13,37,38,39,40,41,42,96,97,98,99,100,101,102,360,361,362,363,364,365,366,367]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 56, '174.64.14.13', NULL, 'admin', '2023-02-27 17:19:03', 0);
INSERT INTO `sys_log` VALUES (41, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 5, '174.64.14.13', NULL, 'admin', '2023-02-27 17:19:04', 0);
INSERT INTO `sys_log` VALUES (42, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 91, '174.64.14.13', NULL, '', '2023-02-27 17:19:11', 0);
INSERT INTO `sys_log` VALUES (43, '删除权限', '384', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/384', 4, '174.64.14.13', NULL, 'admin', '2023-02-27 17:24:31', 0);
INSERT INTO `sys_log` VALUES (44, '编辑角色', '{\"id\":1,\"名称\":\"管理员\",\"唯一标识\":\"ADMIN\",\"逻辑删除\":0,\"创建时间\":1673920184000,\"更新时间\":1673920195000,\"permissionIds\":[12,186,195,198,208,209,210,211,212,213,214,215,376,377,378,379,380,381,382,383,1,3,4,8,9,14,15,16,10,21,22,23,25,26,27,11,30,31,32,34,35,13,37,38,39,40,41,42,96,97,98,99,100,101,102,360,361,362,363,364,365,366,367]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 43, '174.64.14.13', NULL, 'admin', '2023-02-27 17:24:52', 0);
INSERT INTO `sys_log` VALUES (45, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 3, '174.64.14.13', NULL, 'admin', '2023-02-27 17:24:53', 0);
INSERT INTO `sys_log` VALUES (46, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '174.64.14.13', NULL, '', '2023-02-27 17:25:01', 0);
INSERT INTO `sys_log` VALUES (47, '删除权限', '376', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/376', 12, '174.64.14.13', NULL, 'admin', '2023-02-27 17:29:38', 0);
INSERT INTO `sys_log` VALUES (48, '删除权限', '376', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/376', 4, '174.64.14.13', NULL, 'admin', '2023-02-27 17:33:55', 0);
INSERT INTO `sys_log` VALUES (49, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 9, '174.64.14.13', NULL, 'admin', '2023-02-27 17:34:14', 0);
INSERT INTO `sys_log` VALUES (50, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 95, '174.64.14.13', NULL, '', '2023-02-27 17:34:22', 0);
INSERT INTO `sys_log` VALUES (51, '删除权限', '198', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/198', 6, '174.64.14.13', NULL, 'admin', '2023-02-27 17:34:51', 0);
INSERT INTO `sys_log` VALUES (52, '删除权限', '195', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/195', 9, '174.64.14.13', NULL, 'admin', '2023-02-27 17:34:54', 0);
INSERT INTO `sys_log` VALUES (53, '删除权限', '186', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/186', 4, '174.64.14.13', NULL, 'admin', '2023-02-27 17:34:58', 0);
INSERT INTO `sys_log` VALUES (54, '编辑角色', '{\"id\":1,\"名称\":\"管理员\",\"唯一标识\":\"ADMIN\",\"逻辑删除\":0,\"创建时间\":1673920184000,\"更新时间\":1673920195000,\"permissionIds\":[12,208,209,210,211,212,213,214,215,1,3,4,8,9,14,15,16,10,21,22,23,25,26,27,11,30,31,32,34,35,13,37,38,39,40,41,42,96,97,98,99,100,101,102,360,361,362,363,364,365,366,367]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 38, '174.64.14.13', NULL, 'admin', '2023-02-27 17:35:15', 0);
INSERT INTO `sys_log` VALUES (55, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 3, '174.64.14.13', NULL, 'admin', '2023-02-27 17:35:18', 0);
INSERT INTO `sys_log` VALUES (56, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 81, '174.64.14.13', NULL, '', '2023-02-27 17:35:30', 0);
INSERT INTO `sys_log` VALUES (57, '删除权限', '360', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission/360', 4, '174.64.14.13', NULL, 'admin', '2023-02-27 17:36:19', 0);
INSERT INTO `sys_log` VALUES (58, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-27 17:36:42', 0);
INSERT INTO `sys_log` VALUES (59, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 80, '174.64.14.13', NULL, '', '2023-02-27 17:37:03', 0);
INSERT INTO `sys_log` VALUES (60, '新增用户', '{\"id\":20,\"用户名\":\"KLL\",\"密码\":\"$2a$10$06AOofUiDDUy3PpC6tp8nedSbOZvN.QTzWkkyRlOqS8yDj/eSVoIe\",\"昵称\":\"zz\",\"邮箱\":\"1@1\",\"地址\":\"123\",\"用户唯一id\":\"4bd2cde3e3654e6f9094f31210ac1d56\",\"createTime\":1677541432108,\"updateTime\":1677541432110,\"角色\":\"USER\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/user', 84, '174.64.14.13', NULL, 'admin', '2023-02-27 17:43:54', 0);
INSERT INTO `sys_log` VALUES (61, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 12, '174.64.14.13', NULL, 'admin', '2023-02-27 17:44:09', 0);
INSERT INTO `sys_log` VALUES (62, '用户登录', '{\"username\":\"KLL\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 473, '174.64.14.13', NULL, '', '2023-02-27 17:47:01', 0);
INSERT INTO `sys_log` VALUES (63, '用户修改密码', '{\"password\":\"123\",\"uid\":\"4bd2cde3e3654e6f9094f31210ac1d56\",\"newPassword\":\"321\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/password/change', 139, '174.64.14.13', NULL, 'KLL', '2023-02-27 17:47:20', 0);
INSERT INTO `sys_log` VALUES (64, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 86, '174.64.14.13', NULL, 'KLL', '2023-02-27 17:47:37', 0);
INSERT INTO `sys_log` VALUES (65, '用户退出登录', '4bd2cde3e3654e6f9094f31210ac1d56', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4bd2cde3e3654e6f9094f31210ac1d56', 3, '174.64.14.13', NULL, 'KLL', '2023-02-27 17:47:47', 0);
INSERT INTO `sys_log` VALUES (66, '用户注册', '{\"username\":\"test\",\"password\":\"123\",\"email\":\"t@t\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 77, '174.64.14.13', NULL, '', '2023-02-27 17:48:25', 0);
INSERT INTO `sys_log` VALUES (67, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 86, '174.64.14.13', NULL, '', '2023-02-27 17:48:38', 0);
INSERT INTO `sys_log` VALUES (68, '用户退出登录', '695896572b6b40998904cbc3378ea486', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/695896572b6b40998904cbc3378ea486', 2, '174.64.14.13', NULL, 'test', '2023-02-27 17:49:03', 0);
INSERT INTO `sys_log` VALUES (69, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 81, '174.64.14.13', NULL, '', '2023-02-27 17:49:28', 0);
INSERT INTO `sys_log` VALUES (70, '新增角色', '{\"id\":11,\"名称\":\"student\",\"唯一标识\":\"student\",\"创建时间\":1677541865295,\"更新时间\":1677541865295,\"permissionIds\":[12]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 15, '174.64.14.13', NULL, 'admin', '2023-02-27 17:51:07', 0);
INSERT INTO `sys_log` VALUES (71, '编辑角色', '{\"id\":11,\"名称\":\"student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[12]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 6, '174.64.14.13', NULL, 'admin', '2023-02-27 17:55:49', 0);
INSERT INTO `sys_log` VALUES (72, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 24, '174.64.14.13', NULL, 'admin', '2023-02-27 17:56:28', 0);
INSERT INTO `sys_log` VALUES (73, '用户注册', '{\"username\":\"test2\",\"password\":\"123\",\"email\":\"2@2\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 74, '174.64.14.13', NULL, '', '2023-02-27 17:57:14', 0);
INSERT INTO `sys_log` VALUES (74, '用户登录', '{\"username\":\"test2\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":24,\"用户名\":\"test2\",\"密码\":\"$2a$10$NV0NvB2Idjt1pLeoyaFDDuv04QI8BuhxW7mDAE8j5MymbJtcB89cO\",\"昵称\":\"系统用户rd9gae\",\"邮箱\":\"2@2\",\"用户唯一id\":\"3bd4604749ef4d6f861e310b24b603fc\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677542231000,\"updateTime\":1677542231000,\"角色\":\"STUDENT\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiIzYmQ0NjA0NzQ5ZWY0ZDZmODYxZTMxMGIyNGI2MDNmYyIsInJuU3RyIjoiWlVrT2xHVEhudzhXM2syQjh0RmtBUWRIM1JkMlF4WHMifQ.Lb5-mAdOLxHUBhwT1vCGeBKzUqQmaJTgyp-ZQSPEwx0\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675220580000,\"更新时间\":1675220580000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 130, '174.64.14.13', NULL, '', '2023-02-27 17:57:24', 0);
INSERT INTO `sys_log` VALUES (75, '用户登录', '{\"username\":\"test2\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":24,\"用户名\":\"test2\",\"密码\":\"$2a$10$NV0NvB2Idjt1pLeoyaFDDuv04QI8BuhxW7mDAE8j5MymbJtcB89cO\",\"昵称\":\"系统用户rd9gae\",\"邮箱\":\"2@2\",\"用户唯一id\":\"3bd4604749ef4d6f861e310b24b603fc\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677542231000,\"updateTime\":1677542231000,\"角色\":\"STUDENT\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiIzYmQ0NjA0NzQ5ZWY0ZDZmODYxZTMxMGIyNGI2MDNmYyIsInJuU3RyIjoiWlVrT2xHVEhudzhXM2syQjh0RmtBUWRIM1JkMlF4WHMifQ.Lb5-mAdOLxHUBhwT1vCGeBKzUqQmaJTgyp-ZQSPEwx0\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675220580000,\"更新时间\":1675220580000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 87, '174.64.14.13', NULL, 'test2', '2023-02-27 17:57:40', 0);
INSERT INTO `sys_log` VALUES (76, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 84, '174.64.14.13', NULL, 'test2', '2023-02-27 17:57:49', 0);
INSERT INTO `sys_log` VALUES (77, '编辑角色', '{\"id\":11,\"名称\":\"student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[12,208,209,210,211,212,213,214,215]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 16, '174.64.14.13', NULL, 'admin', '2023-02-27 17:58:31', 0);
INSERT INTO `sys_log` VALUES (78, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-27 17:58:38', 0);
INSERT INTO `sys_log` VALUES (79, '用户登录', '{\"username\":\"test2\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 81, '174.64.14.13', NULL, '', '2023-02-27 17:58:48', 0);
INSERT INTO `sys_log` VALUES (80, '用户退出登录', '3bd4604749ef4d6f861e310b24b603fc', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/3bd4604749ef4d6f861e310b24b603fc', 1, '174.64.14.13', NULL, 'test2', '2023-02-27 17:59:09', 0);
INSERT INTO `sys_log` VALUES (81, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 81, '174.64.14.13', NULL, '', '2023-02-27 17:59:28', 0);
INSERT INTO `sys_log` VALUES (82, '编辑角色', '{\"id\":11,\"名称\":\"student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[12]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 5, '174.64.14.13', NULL, 'admin', '2023-02-27 17:59:50', 0);
INSERT INTO `sys_log` VALUES (83, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-27 18:00:00', 0);
INSERT INTO `sys_log` VALUES (84, '用户登录', '{\"username\":\"test2\",\"password\":\"123\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"user\":{\"id\":24,\"用户名\":\"test2\",\"密码\":\"$2a$10$NV0NvB2Idjt1pLeoyaFDDuv04QI8BuhxW7mDAE8j5MymbJtcB89cO\",\"昵称\":\"系统用户rd9gae\",\"邮箱\":\"2@2\",\"用户唯一id\":\"3bd4604749ef4d6f861e310b24b603fc\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677542231000,\"updateTime\":1677542231000,\"角色\":\"STUDENT\"},\"token\":\"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiIzYmQ0NjA0NzQ5ZWY0ZDZmODYxZTMxMGIyNGI2MDNmYyIsInJuU3RyIjoiV3lXdU5RbVFIQ2kyRnZ6ejRqdHN2VTJ3bDEyb29qdEsifQ.7F_MO7d9KEU08R_IlfUQ8ZK2DRbIDGj7FFcg-b4XoW0\",\"menus\":[{\"id\":12,\"名称\":\"首页\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675220580000,\"更新时间\":1675220580000,\"children\":[],\"是否隐藏\":false}],\"auths\":[]}}', 'http://localhost:9090/login', 80, '174.64.14.13', NULL, '', '2023-02-27 18:00:10', 0);
INSERT INTO `sys_log` VALUES (85, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '174.64.14.13', NULL, 'test2', '2023-02-27 18:00:48', 0);
INSERT INTO `sys_log` VALUES (86, '编辑角色', '{\"id\":11,\"名称\":\"student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[208,12,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 5, '174.64.14.13', NULL, 'admin', '2023-02-27 18:01:10', 0);
INSERT INTO `sys_log` VALUES (87, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-27 18:01:17', 0);
INSERT INTO `sys_log` VALUES (88, '用户登录', '{\"username\":\"test2\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '174.64.14.13', NULL, '', '2023-02-27 18:01:23', 0);
INSERT INTO `sys_log` VALUES (89, '用户退出登录', '3bd4604749ef4d6f861e310b24b603fc', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/3bd4604749ef4d6f861e310b24b603fc', 14, '174.64.14.13', NULL, 'test2', '2023-02-27 18:07:29', 0);
INSERT INTO `sys_log` VALUES (90, '用户注册', '{\"username\":\"test3\",\"password\":\"123\",\"email\":\"1@1.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 73, '174.64.14.13', NULL, '', '2023-02-27 20:19:57', 0);
INSERT INTO `sys_log` VALUES (91, '用户注册', '{\"username\":\"test3\",\"password\":\"123\",\"email\":\"1@1.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 71, '174.64.14.13', NULL, '', '2023-02-27 20:22:59', 0);
INSERT INTO `sys_log` VALUES (92, '用户注册', '{\"username\":\"test3\",\"password\":\"123\",\"email\":\"1@1.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 73, '174.64.14.13', NULL, '', '2023-02-27 20:33:11', 0);
INSERT INTO `sys_log` VALUES (93, '用户注册', '{\"username\":\"test4\",\"password\":\"123\",\"email\":\"1@2.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 73, '174.64.14.13', NULL, '', '2023-02-27 20:48:18', 0);
INSERT INTO `sys_log` VALUES (94, '用户注册', '{\"username\":\"test\",\"password\":\"123\",\"email\":\"1@1.edu\",\"name\":\"tester 1\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 76, '174.64.14.13', NULL, '', '2023-02-27 21:05:13', 0);
INSERT INTO `sys_log` VALUES (95, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 100, '174.64.14.13', NULL, '', '2023-02-27 21:05:23', 0);
INSERT INTO `sys_log` VALUES (96, '用户退出登录', 'b396e13e996142caa439bbb34c014054', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/b396e13e996142caa439bbb34c014054', 2, '174.64.14.13', NULL, 'test', '2023-02-27 21:12:44', 0);
INSERT INTO `sys_log` VALUES (97, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 82, '174.64.14.13', NULL, '', '2023-02-27 21:12:53', 0);
INSERT INTO `sys_log` VALUES (98, '编辑权限', '{\"id\":12,\"名称\":\"Home\",\"路径\":\"home\",\"顺序\":1,\"图标\":\"house\",\"页面路径\":\"Home\",\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675220580000,\"更新时间\":1675220580000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 5, '174.64.14.13', NULL, 'admin', '2023-02-27 21:13:15', 0);
INSERT INTO `sys_log` VALUES (99, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-27 21:13:28', 0);
INSERT INTO `sys_log` VALUES (100, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 82, '174.64.14.13', NULL, '', '2023-02-27 21:13:36', 0);
INSERT INTO `sys_log` VALUES (101, '编辑权限', '{\"id\":208,\"名称\":\"post\",\"路径\":\"notice\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Notice\",\"类型\":2,\"逻辑删除\":0,\"更新时间\":1677560745511,\"children\":[{\"id\":209,\"名称\":\"公告查询\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.list\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":210,\"名称\":\"公告新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.add\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":211,\"名称\":\"公告导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.import\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":212,\"名称\":\"公告导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.export\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":213,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.deleteBatch\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":214,\"名称\":\"公告编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.edit\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":215,\"名称\":\"公告删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.delete\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 4, '174.64.14.13', NULL, 'admin', '2023-02-27 23:05:48', 0);
INSERT INTO `sys_log` VALUES (102, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-27 23:09:38', 0);
INSERT INTO `sys_log` VALUES (103, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 91, '174.64.14.13', NULL, '', '2023-02-27 23:09:47', 0);
INSERT INTO `sys_log` VALUES (104, '编辑用户', '{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"1\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"1\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}}', 'http://localhost:9090/user', 11, NULL, NULL, 'admin', '2023-02-28 00:20:53', 0);
INSERT INTO `sys_log` VALUES (105, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 11, NULL, NULL, 'admin', '2023-02-28 00:46:16', 0);
INSERT INTO `sys_log` VALUES (106, '用户注册', '{\"username\":\"test2\",\"password\":\"123\",\"email\":\"2@2.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 83, NULL, NULL, '', '2023-02-28 00:46:40', 0);
INSERT INTO `sys_log` VALUES (107, '用户注册', '{\"username\":\"test2\",\"password\":\"123\",\"email\":\"2@2.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 411, NULL, NULL, '', '2023-02-28 00:50:56', 0);
INSERT INTO `sys_log` VALUES (108, '用户注册', '{\"username\":\"test2\",\"firstName\":\"tester\",\"lastName\":\"2\",\"password\":\"123\",\"email\":\"2@2.edu\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/register', 422, NULL, NULL, '', '2023-02-28 00:59:40', 0);
INSERT INTO `sys_log` VALUES (109, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 163, NULL, NULL, '', '2023-02-28 01:04:54', 0);
INSERT INTO `sys_log` VALUES (110, '编辑用户', '{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"1\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"1\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}}', 'http://localhost:9090/updateUser', 5, NULL, NULL, 'test', '2023-02-28 01:05:25', 0);
INSERT INTO `sys_log` VALUES (111, '编辑用户', '{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"3\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"3\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}}', 'http://localhost:9090/updateUser', 4, '174.64.14.13', NULL, 'test', '2023-02-28 01:19:41', 0);
INSERT INTO `sys_log` VALUES (112, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\"}', 'http://localhost:9090/file/upload', 19, '174.64.14.13', NULL, 'test', '2023-02-28 01:20:03', 0);
INSERT INTO `sys_log` VALUES (113, '编辑用户', '{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"3\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"头像\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":32,\"用户名\":\"test\",\"密码\":\"$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq\",\"first name\":\"tester \",\"last name\":\"3\",\"邮箱\":\"1@1.edu\",\"地址\":\"123\",\"用户唯一id\":\"b396e13e996142caa439bbb34c014054\",\"头像\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677553512000,\"updateTime\":1677553512000,\"角色\":\"STUDENT\"}}', 'http://localhost:9090/updateUser', 3, '174.64.14.13', NULL, 'test', '2023-02-28 01:20:05', 0);
INSERT INTO `sys_log` VALUES (114, '用户退出登录', 'b396e13e996142caa439bbb34c014054', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/b396e13e996142caa439bbb34c014054', 3, '174.64.14.13', NULL, 'test', '2023-02-28 01:21:11', 0);
INSERT INTO `sys_log` VALUES (115, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 82, '174.64.14.13', NULL, '', '2023-02-28 01:21:20', 0);
INSERT INTO `sys_log` VALUES (116, '编辑角色', '{\"id\":3,\"名称\":\"Tutor\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673920241000,\"更新时间\":1673920241000,\"permissionIds\":[208,12,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 16, '174.64.14.13', NULL, 'admin', '2023-02-28 01:31:18', 0);
INSERT INTO `sys_log` VALUES (117, '编辑角色', '{\"id\":1,\"名称\":\"Admin\",\"唯一标识\":\"ADMIN\",\"逻辑删除\":0,\"创建时间\":1673920184000,\"更新时间\":1673920195000,\"permissionIds\":[12,208,209,210,211,212,213,214,215,1,3,4,8,9,14,15,16,10,21,22,23,25,26,27,11,30,31,32,34,35,13,37,38,39,40,41,42,96,97,98,99,100,101,102]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 29, '174.64.14.13', NULL, 'admin', '2023-02-28 01:31:29', 0);
INSERT INTO `sys_log` VALUES (118, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:31:29', 0);
INSERT INTO `sys_log` VALUES (119, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '174.64.14.13', NULL, '', '2023-02-28 01:31:38', 0);
INSERT INTO `sys_log` VALUES (120, '编辑角色', '{\"id\":11,\"名称\":\"Student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[208,12,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 6, '174.64.14.13', NULL, 'admin', '2023-02-28 01:31:54', 0);
INSERT INTO `sys_log` VALUES (121, '编辑权限', '{\"id\":11,\"名称\":\"Permission\",\"路径\":\"permission\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"Permission\",\"权限\":\"permission.list\",\"父级id\":1,\"类型\":2,\"逻辑删除\":0,\"创建时间\":1675218805000,\"更新时间\":1675218805000,\"children\":[{\"id\":30,\"名称\":\"权限新增\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"permission.add\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":false},{\"id\":31,\"名称\":\"权限编辑\",\"顺序\":1,\"权限\":\"permission.edit\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1674927921000,\"children\":[],\"是否隐藏\":false},{\"id\":32,\"名称\":\"权限删除\",\"顺序\":1,\"权限\":\"permission.delete\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675011855000,\"更新时间\":1675011855000,\"children\":[],\"是否隐藏\":false},{\"id\":34,\"名称\":\"权限导入\",\"顺序\":1,\"权限\":\"permission.import\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":false},{\"id\":35,\"名称\":\"权限导出\",\"顺序\":1,\"权限\":\"permission.export\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:35:12', 0);
INSERT INTO `sys_log` VALUES (122, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:36:16', 0);
INSERT INTO `sys_log` VALUES (123, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 80, '174.64.14.13', NULL, '', '2023-02-28 01:36:25', 0);
INSERT INTO `sys_log` VALUES (124, '编辑权限', '{\"id\":30,\"名称\":\"Add permission\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"permission.add\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:36:59', 0);
INSERT INTO `sys_log` VALUES (125, '编辑权限', '{\"id\":31,\"名称\":\"Edit permission\",\"顺序\":1,\"权限\":\"permission.edit\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1674927921000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:37:14', 0);
INSERT INTO `sys_log` VALUES (126, '编辑权限', '{\"id\":32,\"名称\":\"Delete\",\"顺序\":1,\"权限\":\"permission.delete\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675011855000,\"更新时间\":1675011855000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:37:56', 0);
INSERT INTO `sys_log` VALUES (127, '编辑权限', '{\"id\":34,\"名称\":\"Import\",\"顺序\":1,\"权限\":\"permission.import\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:38:06', 0);
INSERT INTO `sys_log` VALUES (128, '编辑权限', '{\"id\":35,\"名称\":\"Export\",\"顺序\":1,\"权限\":\"permission.export\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:38:14', 0);
INSERT INTO `sys_log` VALUES (129, '编辑权限', '{\"id\":30,\"名称\":\"Add\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"permission.add\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:38:21', 0);
INSERT INTO `sys_log` VALUES (130, '编辑权限', '{\"id\":31,\"名称\":\"Edit\",\"顺序\":1,\"权限\":\"permission.edit\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1674927921000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:38:30', 0);
INSERT INTO `sys_log` VALUES (131, '编辑权限', '{\"id\":30,\"名称\":\"Add\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"permission.add\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:38:34', 0);
INSERT INTO `sys_log` VALUES (132, '编辑权限', '{\"id\":30,\"名称\":\"Add\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"permission.add\",\"父级id\":11,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:38:58', 0);
INSERT INTO `sys_log` VALUES (133, '编辑权限', '{\"id\":21,\"名称\":\"角色新增\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"role.add\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:39:01', 0);
INSERT INTO `sys_log` VALUES (134, '编辑权限', '{\"id\":21,\"名称\":\"角色新增\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"role.add\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:39:28', 0);
INSERT INTO `sys_log` VALUES (135, '编辑权限', '{\"id\":26,\"名称\":\"角色导入\",\"顺序\":1,\"权限\":\"role.import\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:39:41', 0);
INSERT INTO `sys_log` VALUES (136, '编辑权限', '{\"id\":27,\"名称\":\"角色导出\",\"顺序\":1,\"权限\":\"role.export\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:39:42', 0);
INSERT INTO `sys_log` VALUES (137, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:39:56', 0);
INSERT INTO `sys_log` VALUES (138, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 76, '174.64.14.13', NULL, '', '2023-02-28 01:40:04', 0);
INSERT INTO `sys_log` VALUES (139, '编辑权限', '{\"id\":26,\"名称\":\"角色导入\",\"顺序\":1,\"权限\":\"role.import\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:40:24', 0);
INSERT INTO `sys_log` VALUES (140, '编辑权限', '{\"id\":27,\"名称\":\"角色导出\",\"顺序\":1,\"权限\":\"role.export\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:40:25', 0);
INSERT INTO `sys_log` VALUES (141, '编辑角色', '{\"id\":11,\"名称\":\"Student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[208,1,3,12,209,16]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 6, '174.64.14.13', NULL, 'admin', '2023-02-28 01:42:20', 0);
INSERT INTO `sys_log` VALUES (142, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:42:23', 0);
INSERT INTO `sys_log` VALUES (143, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 75, '174.64.14.13', NULL, '', '2023-02-28 01:42:31', 0);
INSERT INTO `sys_log` VALUES (144, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '174.64.14.13', NULL, 'test', '2023-02-28 01:42:41', 0);
INSERT INTO `sys_log` VALUES (145, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '174.64.14.13', NULL, 'test', '2023-02-28 01:42:59', 0);
INSERT INTO `sys_log` VALUES (146, '编辑权限', '{\"id\":96,\"名称\":\"文件管理\",\"路径\":\"file\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"File\",\"权限\":\"file.list\",\"父级id\":1,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1675536357000,\"children\":[{\"id\":97,\"名称\":\"文件新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.add\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":98,\"名称\":\"文件导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.import\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":99,\"名称\":\"文件导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.export\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":100,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.deleteBatch\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":101,\"名称\":\"文件编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.edit\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":102,\"名称\":\"文件删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.delete\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:43:24', 0);
INSERT INTO `sys_log` VALUES (147, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 0, '174.64.14.13', NULL, 'admin', '2023-02-28 01:43:36', 0);
INSERT INTO `sys_log` VALUES (148, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 75, '174.64.14.13', NULL, '', '2023-02-28 01:43:44', 0);
INSERT INTO `sys_log` VALUES (149, '编辑权限', '{\"id\":96,\"名称\":\"文件管理\",\"路径\":\"file\",\"顺序\":1,\"图标\":\"grid\",\"页面路径\":\"File\",\"权限\":\"file.list\",\"父级id\":1,\"类型\":2,\"逻辑删除\":0,\"更新时间\":1675536357000,\"children\":[{\"id\":97,\"名称\":\"文件新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.add\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":98,\"名称\":\"文件导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.import\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":99,\"名称\":\"文件导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.export\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":100,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.deleteBatch\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":101,\"名称\":\"文件编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.edit\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false},{\"id\":102,\"名称\":\"文件删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"file.delete\",\"父级id\":96,\"类型\":3,\"逻辑删除\":0,\"children\":[],\"是否隐藏\":false}],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:43:57', 0);
INSERT INTO `sys_log` VALUES (150, '编辑角色', '{\"id\":11,\"名称\":\"Student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[208,1,12,209,3,4,8,9,14,15,16]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 6, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:18', 0);
INSERT INTO `sys_log` VALUES (151, '编辑权限', '{\"id\":4,\"名称\":\"用户新增\",\"路径\":\"\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"user.add\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:44', 0);
INSERT INTO `sys_log` VALUES (152, '编辑权限', '{\"id\":8,\"名称\":\"用户编辑\",\"路径\":\"\",\"顺序\":1,\"权限\":\"user.edit\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1674927921000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:45', 0);
INSERT INTO `sys_log` VALUES (153, '编辑权限', '{\"id\":9,\"名称\":\"用户删除\",\"顺序\":1,\"权限\":\"user.delete\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675011855000,\"更新时间\":1675011855000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:45', 0);
INSERT INTO `sys_log` VALUES (154, '编辑权限', '{\"id\":14,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"\",\"权限\":\"user.deleteBatch\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398742000,\"更新时间\":1675398742000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:45', 0);
INSERT INTO `sys_log` VALUES (155, '编辑权限', '{\"id\":15,\"名称\":\"用户导入\",\"顺序\":1,\"权限\":\"user.import\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:45', 0);
INSERT INTO `sys_log` VALUES (156, '编辑权限', '{\"id\":16,\"名称\":\"用户导出\",\"顺序\":1,\"权限\":\"user.export\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:46', 0);
INSERT INTO `sys_log` VALUES (157, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:44:59', 0);
INSERT INTO `sys_log` VALUES (158, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 74, '174.64.14.13', NULL, '', '2023-02-28 01:45:06', 0);
INSERT INTO `sys_log` VALUES (159, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '174.64.14.13', NULL, 'test', '2023-02-28 01:46:04', 0);
INSERT INTO `sys_log` VALUES (160, '编辑角色', '{\"id\":11,\"名称\":\"Student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[208,12,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 5, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:18', 0);
INSERT INTO `sys_log` VALUES (161, '编辑角色', '{\"id\":11,\"名称\":\"Student\",\"唯一标识\":\"STUDENT\",\"逻辑删除\":0,\"创建时间\":1677541865000,\"更新时间\":1677541865000,\"permissionIds\":[208,12,209]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 5, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:29', 0);
INSERT INTO `sys_log` VALUES (162, '编辑权限', '{\"id\":210,\"名称\":\"公告新增\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.add\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1677570397106,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:39', 0);
INSERT INTO `sys_log` VALUES (163, '编辑权限', '{\"id\":211,\"名称\":\"公告导入\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.import\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1677570397566,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:39', 0);
INSERT INTO `sys_log` VALUES (164, '编辑权限', '{\"id\":212,\"名称\":\"公告导出\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.export\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1677570397976,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:39', 0);
INSERT INTO `sys_log` VALUES (165, '编辑权限', '{\"id\":213,\"名称\":\"批量删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.deleteBatch\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1677570398381,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:39', 0);
INSERT INTO `sys_log` VALUES (166, '编辑权限', '{\"id\":214,\"名称\":\"公告编辑\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.edit\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1677570398829,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:39', 0);
INSERT INTO `sys_log` VALUES (167, '编辑权限', '{\"id\":215,\"名称\":\"公告删除\",\"顺序\":1,\"图标\":\"grid\",\"权限\":\"notice.delete\",\"父级id\":208,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1677570399591,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:40', 0);
INSERT INTO `sys_log` VALUES (168, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 01:46:55', 0);
INSERT INTO `sys_log` VALUES (169, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 73, '174.64.14.13', NULL, '', '2023-02-28 01:47:03', 0);
INSERT INTO `sys_log` VALUES (170, '用户退出登录', 'b396e13e996142caa439bbb34c014054', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/b396e13e996142caa439bbb34c014054', 1, '174.64.14.13', NULL, 'test', '2023-02-28 01:47:13', 0);
INSERT INTO `sys_log` VALUES (171, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 74, '174.64.14.13', NULL, '', '2023-02-28 01:47:21', 0);
INSERT INTO `sys_log` VALUES (172, '编辑权限', '{\"id\":4,\"名称\":\"Add\",\"路径\":\"\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"user.add\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:47:50', 0);
INSERT INTO `sys_log` VALUES (173, '编辑权限', '{\"id\":8,\"名称\":\"Edit\",\"路径\":\"\",\"顺序\":1,\"权限\":\"user.edit\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1674927921000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:48:03', 0);
INSERT INTO `sys_log` VALUES (174, '编辑权限', '{\"id\":9,\"名称\":\"Delete\",\"顺序\":1,\"权限\":\"user.delete\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675011855000,\"更新时间\":1675011855000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:48:12', 0);
INSERT INTO `sys_log` VALUES (175, '编辑权限', '{\"id\":14,\"名称\":\"DeleteBatch\",\"顺序\":1,\"图标\":\"\",\"权限\":\"user.deleteBatch\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398742000,\"更新时间\":1675398742000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:48:25', 0);
INSERT INTO `sys_log` VALUES (176, '编辑权限', '{\"id\":15,\"名称\":\"Import\",\"顺序\":1,\"权限\":\"user.import\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:48:35', 0);
INSERT INTO `sys_log` VALUES (177, '编辑权限', '{\"id\":16,\"名称\":\"Export\",\"顺序\":1,\"权限\":\"user.export\",\"父级id\":3,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":true}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:48:43', 0);
INSERT INTO `sys_log` VALUES (178, '编辑权限', '{\"id\":21,\"名称\":\"Add\",\"顺序\":1,\"页面路径\":\"\",\"权限\":\"role.add\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1673923551000,\"更新时间\":1673923551000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 0, '174.64.14.13', NULL, 'admin', '2023-02-28 01:48:53', 0);
INSERT INTO `sys_log` VALUES (179, '编辑权限', '{\"id\":22,\"名称\":\"Edit\",\"顺序\":1,\"权限\":\"role.edit\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"更新时间\":1674927921000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 4, '174.64.14.13', NULL, 'admin', '2023-02-28 01:49:04', 0);
INSERT INTO `sys_log` VALUES (180, '编辑权限', '{\"id\":23,\"名称\":\"Delete\",\"顺序\":1,\"权限\":\"role.delete\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675011855000,\"更新时间\":1675011855000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:49:11', 0);
INSERT INTO `sys_log` VALUES (181, '编辑权限', '{\"id\":25,\"名称\":\"DeletBatch\",\"顺序\":1,\"权限\":\"role.deleteBatch\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398742000,\"更新时间\":1675398742000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:49:21', 0);
INSERT INTO `sys_log` VALUES (182, '编辑权限', '{\"id\":26,\"名称\":\"Import\",\"顺序\":1,\"权限\":\"role.import\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398773000,\"更新时间\":1675398773000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 01:49:29', 0);
INSERT INTO `sys_log` VALUES (183, '编辑权限', '{\"id\":27,\"名称\":\"Export\",\"顺序\":1,\"权限\":\"role.export\",\"父级id\":10,\"类型\":3,\"逻辑删除\":0,\"创建时间\":1675398788000,\"更新时间\":1675398788000,\"children\":[],\"是否隐藏\":false}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/permission', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:49:39', 0);
INSERT INTO `sys_log` VALUES (184, '编辑用户', '{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"first name\":\"Admin\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670638097000,\"updateTime\":1670638097000,\"角色\":\"ADMIN\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":1,\"用户名\":\"admin\",\"密码\":\"$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm\",\"first name\":\"Admin\",\"邮箱\":\"xqnode@163.com\",\"地址\":\"合肥市政务区\",\"用户唯一id\":\"4918ea50c06a458f94878abe741b4f51\",\"头像\":\"http://localhost:9090/file/download/cce151d3972b4780acf5a115f6a55f48.png\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1670638097000,\"updateTime\":1670638097000,\"角色\":\"ADMIN\"}}', 'http://localhost:9090/updateUser', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 01:59:09', 0);
INSERT INTO `sys_log` VALUES (185, '新增用户', '{\"id\":37,\"用户名\":\"kuaile\",\"密码\":\"$2a$10$QgDV60g9yQIDzS1OeqgJbu/V0DheoQPNMhlFLwSdE90kgSBftfFeK\",\"first name\":\"Ziqing\",\"last name\":\"Zhou\",\"邮箱\":\"zzhou24@lsu.edu\",\"地址\":\"6765 Corporate Blvd. \",\"用户唯一id\":\"69cfe3c5cee84ab9801bf9aeae75fc65\",\"createTime\":1677571222114,\"updateTime\":1677571222114,\"角色\":\"ADMIN\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/user', 71, '174.64.14.13', NULL, 'admin', '2023-02-28 02:00:24', 0);
INSERT INTO `sys_log` VALUES (186, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 02:00:41', 0);
INSERT INTO `sys_log` VALUES (187, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 75, '174.64.14.13', NULL, '', '2023-02-28 02:00:50', 0);
INSERT INTO `sys_log` VALUES (188, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 433, '174.64.14.13', NULL, '', '2023-02-28 15:30:21', 0);
INSERT INTO `sys_log` VALUES (189, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\"}', 'http://localhost:9090/file/upload', 14, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:12:25', 0);
INSERT INTO `sys_log` VALUES (190, '编辑用户', '{\"id\":37,\"用户名\":\"kuaile\",\"密码\":\"$2a$10$QgDV60g9yQIDzS1OeqgJbu/V0DheoQPNMhlFLwSdE90kgSBftfFeK\",\"first name\":\"Ziqing\",\"last name\":\"Zhou\",\"邮箱\":\"zzhou24@lsu.edu\",\"地址\":\"6765 Corporate Blvd. \",\"用户唯一id\":\"69cfe3c5cee84ab9801bf9aeae75fc65\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677571222000,\"updateTime\":1677571222000,\"角色\":\"ADMIN\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":37,\"用户名\":\"kuaile\",\"密码\":\"$2a$10$QgDV60g9yQIDzS1OeqgJbu/V0DheoQPNMhlFLwSdE90kgSBftfFeK\",\"first name\":\"Ziqing\",\"last name\":\"Zhou\",\"邮箱\":\"zzhou24@lsu.edu\",\"地址\":\"6765 Corporate Blvd. \",\"用户唯一id\":\"69cfe3c5cee84ab9801bf9aeae75fc65\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677571222000,\"updateTime\":1677571222000,\"角色\":\"ADMIN\"}}', 'http://localhost:9090/updateUser', 4, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:12:25', 0);
INSERT INTO `sys_log` VALUES (191, '用户退出登录', '69cfe3c5cee84ab9801bf9aeae75fc65', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/69cfe3c5cee84ab9801bf9aeae75fc65', 3, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:13:31', 0);
INSERT INTO `sys_log` VALUES (192, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 82, '174.64.14.13', NULL, '', '2023-02-28 16:13:56', 0);
INSERT INTO `sys_log` VALUES (193, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 16:14:00', 0);
INSERT INTO `sys_log` VALUES (194, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '174.64.14.13', NULL, '', '2023-02-28 16:14:09', 0);
INSERT INTO `sys_log` VALUES (195, '上传文件', '文件流', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\"}', 'http://localhost:9090/file/upload', 5, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:14:23', 0);
INSERT INTO `sys_log` VALUES (196, '编辑用户', '{\"id\":37,\"用户名\":\"kuaile\",\"密码\":\"$2a$10$QgDV60g9yQIDzS1OeqgJbu/V0DheoQPNMhlFLwSdE90kgSBftfFeK\",\"first name\":\"Ziqing\",\"last name\":\"Zhou\",\"邮箱\":\"zzhou24@lsu.edu\",\"地址\":\"6765 Corporate Blvd. \",\"用户唯一id\":\"69cfe3c5cee84ab9801bf9aeae75fc65\",\"头像\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677571222000,\"updateTime\":1677571222000,\"角色\":\"ADMIN\"}', '{\"code\":\"200\",\"msg\":\"操作成功\",\"data\":{\"id\":37,\"用户名\":\"kuaile\",\"密码\":\"$2a$10$QgDV60g9yQIDzS1OeqgJbu/V0DheoQPNMhlFLwSdE90kgSBftfFeK\",\"first name\":\"Ziqing\",\"last name\":\"Zhou\",\"邮箱\":\"zzhou24@lsu.edu\",\"地址\":\"6765 Corporate Blvd. \",\"用户唯一id\":\"69cfe3c5cee84ab9801bf9aeae75fc65\",\"头像\":\"http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg\",\"逻辑删除 0存在  id删除\":0,\"createTime\":1677571222000,\"updateTime\":1677571222000,\"角色\":\"ADMIN\"}}', 'http://localhost:9090/updateUser', 3, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:14:26', 0);
INSERT INTO `sys_log` VALUES (197, '批量删除文件记录', '[78,77]', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/file/del/batch', 13, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:27:04', 0);
INSERT INTO `sys_log` VALUES (198, '批量删除文件记录', '[76,75]', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/file/del/batch', 4, '174.64.14.13', NULL, 'kuaile', '2023-02-28 16:27:38', 0);
INSERT INTO `sys_log` VALUES (199, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 78, '174.64.14.13', NULL, '', '2023-02-28 21:24:33', 0);
INSERT INTO `sys_log` VALUES (200, '删除用户', '5', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/user/5', 2, '174.64.14.13', NULL, 'kuaile', '2023-02-28 21:26:37', 0);
INSERT INTO `sys_log` VALUES (201, '用户退出登录', '69cfe3c5cee84ab9801bf9aeae75fc65', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/69cfe3c5cee84ab9801bf9aeae75fc65', 1, '174.64.14.13', NULL, 'kuaile', '2023-02-28 21:28:45', 0);
INSERT INTO `sys_log` VALUES (202, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 75, '174.64.14.13', NULL, '', '2023-02-28 21:29:10', 0);
INSERT INTO `sys_log` VALUES (203, '用户退出登录', 'b396e13e996142caa439bbb34c014054', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/b396e13e996142caa439bbb34c014054', 1, '174.64.14.13', NULL, 'test', '2023-02-28 21:29:32', 0);
INSERT INTO `sys_log` VALUES (204, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 75, '174.64.14.13', NULL, '', '2023-02-28 21:30:11', 0);
INSERT INTO `sys_log` VALUES (205, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-02-28 21:41:06', 0);
INSERT INTO `sys_log` VALUES (206, '用户登录', '{\"username\":\"test\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 77, '174.64.14.13', NULL, '', '2023-02-28 21:41:14', 0);
INSERT INTO `sys_log` VALUES (207, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 644, '174.64.14.13', NULL, '', '2023-02-28 23:54:35', 0);
INSERT INTO `sys_log` VALUES (208, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 3, '174.64.14.13', NULL, 'admin', '2023-02-28 23:57:31', 0);
INSERT INTO `sys_log` VALUES (209, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 86, '174.64.14.13', NULL, '', '2023-02-28 23:57:40', 0);
INSERT INTO `sys_log` VALUES (210, '编辑角色', '{\"id\":3,\"名称\":\"Tutor\",\"唯一标识\":\"USER\",\"逻辑删除\":0,\"创建时间\":1673920241000,\"更新时间\":1673920241000,\"permissionIds\":[208,12,209,392,393,394,395,396,397,398,399]}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/role', 20, '174.64.14.13', NULL, 'admin', '2023-02-28 23:58:13', 0);
INSERT INTO `sys_log` VALUES (211, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 2, '174.64.14.13', NULL, 'admin', '2023-02-28 23:58:27', 0);
INSERT INTO `sys_log` VALUES (212, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 80, '174.64.14.13', NULL, '', '2023-02-28 23:58:50', 0);
INSERT INTO `sys_log` VALUES (213, '新增Availability', '{\"id\":-637399038,\"tutor name\":\"zz\",\"subject\":\"math\",\"start time\":\"2023-02-28 18:30:00\",\"end time\":\"2023-02-28 09:00:00\",\"online meeting link\":\"jkhkj\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 5, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:00:07', 0);
INSERT INTO `sys_log` VALUES (214, '删除Availability', '-637399038', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/-637399038', 4, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:00:49', 0);
INSERT INTO `sys_log` VALUES (215, '新增Availability', '{\"id\":276959234,\"tutor name\":\"zz\",\"subject\":\"math\",\"start time\":\"2023-03-01 00:01:22\",\"end time\":\"2023-03-01 00:01:20\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:01:39', 0);
INSERT INTO `sys_log` VALUES (216, '删除Availability', '276959234', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/276959234', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:02:38', 0);
INSERT INTO `sys_log` VALUES (217, '新增Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"2023-03-01 00:00:00\",\"end time\":\"2023-03-01 00:00:00\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 10, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:04:15', 0);
INSERT INTO `sys_log` VALUES (218, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"2023-03-01 00:00:00\",\"end time\":\"2023-03-01 02:04\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 4, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:12:32', 0);
INSERT INTO `sys_log` VALUES (219, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"2023-03-01 00:00:00\",\"end time\":\"2023-03-01 02:04\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:12:33', 0);
INSERT INTO `sys_log` VALUES (220, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"10:30\",\"end time\":\"09:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:26:30', 0);
INSERT INTO `sys_log` VALUES (221, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"2023-03-02 00:00\",\"end time\":\"2023-03-01 00:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:30:41', 0);
INSERT INTO `sys_log` VALUES (222, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"2023-03-01 09:00\",\"end time\":\"2023-03-01 17:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:34:48', 0);
INSERT INTO `sys_log` VALUES (223, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"09:00\",\"end time\":\"10:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:36:36', 0);
INSERT INTO `sys_log` VALUES (224, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"09:00\",\"end time\":\"10:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 1, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:36:37', 0);
INSERT INTO `sys_log` VALUES (225, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"09:00\",\"end time\":\"10:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 0, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:41:24', 0);
INSERT INTO `sys_log` VALUES (226, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"09:00\",\"end time\":\"10:00\",\"delete logic\":0}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 1, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:44:18', 0);
INSERT INTO `sys_log` VALUES (227, '编辑Availability', '{\"id\":276959235,\"tutor name\":\"11\",\"start time\":\"09:00\",\"end time\":\"10:00\",\"delete logic\":0,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 8, '174.64.14.13', NULL, 'KLL', '2023-03-01 00:45:27', 0);
INSERT INTO `sys_log` VALUES (228, '新增Availability', '{\"id\":276959236,\"tutor name\":\"nullzz\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 6, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:18:10', 0);
INSERT INTO `sys_log` VALUES (229, '新增Availability', '{\"id\":276959237,\"tutor name\":\"null zz\",\"subject\":\"math\",\"start time\":\"10:00\",\"end time\":\"11:30\",\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 7, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:35:54', 0);
INSERT INTO `sys_log` VALUES (230, '删除Availability', '276959237', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/276959237', 3, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:37:16', 0);
INSERT INTO `sys_log` VALUES (231, '删除Availability', '276959236', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/276959236', 1, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:37:18', 0);
INSERT INTO `sys_log` VALUES (232, '删除Availability', '276959235', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/276959235', 3, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:37:20', 0);
INSERT INTO `sys_log` VALUES (233, '新增Availability', '{\"id\":276959238,\"tutor name\":\"null zz\",\"subject\":\"math\",\"start time\":\"09:30\",\"end time\":\"10:30\",\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 3, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:38:35', 0);
INSERT INTO `sys_log` VALUES (234, '新增Availability', '{\"id\":276959239,\"tutor name\":\"null zz\",\"subject\":\"Math\",\"start time\":\"10:30\",\"end time\":\"11:00\",\"date\":\"2023-03-02\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 4, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:38:47', 0);
INSERT INTO `sys_log` VALUES (235, '新增Availability', '{\"id\":276959240,\"tutor name\":\"null zz\",\"subject\":\"en\",\"start time\":\"10:30\",\"end time\":\"12:00\",\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 3, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:42:42', 0);
INSERT INTO `sys_log` VALUES (236, '批量删除Availability', '[276959240,276959239,276959238]', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/del/batch', 12, '174.64.14.13', NULL, 'KLL', '2023-03-01 01:46:40', 0);
INSERT INTO `sys_log` VALUES (237, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 696, '174.64.14.13', NULL, '', '2023-03-01 19:33:28', 0);
INSERT INTO `sys_log` VALUES (238, '新增Availability', '{\"id\":276959241,\"tutor name\":\"Ziqing Zhou\",\"start time\":\"09:30 AM\",\"end time\":\"06:30 PM\",\"tutor id\":37,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 13, '174.64.14.13', NULL, 'kuaile', '2023-03-01 21:21:18', 0);
INSERT INTO `sys_log` VALUES (239, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 145, '174.64.14.13', NULL, '', '2023-03-01 22:09:48', 0);
INSERT INTO `sys_log` VALUES (240, '新增Availability', '{\"id\":276959242,\"tutor name\":\"Ziqing Zhou\",\"start time\":\"12:00 AM\",\"end time\":\"02:00 AM\",\"tutor id\":37,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 11, '174.64.14.13', NULL, 'kuaile', '2023-03-01 22:26:46', 0);
INSERT INTO `sys_log` VALUES (241, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 104, '174.64.14.13', NULL, '', '2023-03-01 22:51:06', 0);
INSERT INTO `sys_log` VALUES (242, '用户退出登录', '4bd2cde3e3654e6f9094f31210ac1d56', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4bd2cde3e3654e6f9094f31210ac1d56', 4, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:14:46', 0);
INSERT INTO `sys_log` VALUES (243, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 85, '174.64.14.13', NULL, '', '2023-03-01 23:14:56', 0);
INSERT INTO `sys_log` VALUES (244, '用户退出登录', '69cfe3c5cee84ab9801bf9aeae75fc65', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/69cfe3c5cee84ab9801bf9aeae75fc65', 3, '174.64.14.13', NULL, 'kuaile', '2023-03-01 23:18:31', 0);
INSERT INTO `sys_log` VALUES (245, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '174.64.14.13', NULL, '', '2023-03-01 23:18:39', 0);
INSERT INTO `sys_log` VALUES (246, '用户退出登录', '4bd2cde3e3654e6f9094f31210ac1d56', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4bd2cde3e3654e6f9094f31210ac1d56', 3, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:20:49', 0);
INSERT INTO `sys_log` VALUES (247, '用户登录', '{\"username\":\"kuaile\",\"password\":\"123\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 79, '174.64.14.13', NULL, '', '2023-03-01 23:21:02', 0);
INSERT INTO `sys_log` VALUES (248, '删除Availability', '276959242', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/276959242', 3, '174.64.14.13', NULL, 'kuaile', '2023-03-01 23:35:49', 0);
INSERT INTO `sys_log` VALUES (249, '删除Availability', '276959241', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability/276959241', 1, '174.64.14.13', NULL, 'kuaile', '2023-03-01 23:35:52', 0);
INSERT INTO `sys_log` VALUES (250, '用户退出登录', '69cfe3c5cee84ab9801bf9aeae75fc65', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/69cfe3c5cee84ab9801bf9aeae75fc65', 3, '174.64.14.13', NULL, 'kuaile', '2023-03-01 23:36:25', 0);
INSERT INTO `sys_log` VALUES (251, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 80, '174.64.14.13', NULL, '', '2023-03-01 23:36:33', 0);
INSERT INTO `sys_log` VALUES (252, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 78, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:36:53', 0);
INSERT INTO `sys_log` VALUES (253, '用户退出登录', '4bd2cde3e3654e6f9094f31210ac1d56', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4bd2cde3e3654e6f9094f31210ac1d56', 14, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:41:17', 0);
INSERT INTO `sys_log` VALUES (254, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 107, '174.64.14.13', NULL, '', '2023-03-01 23:41:28', 0);
INSERT INTO `sys_log` VALUES (255, '用户退出登录', '4bd2cde3e3654e6f9094f31210ac1d56', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4bd2cde3e3654e6f9094f31210ac1d56', 2, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:47:02', 0);
INSERT INTO `sys_log` VALUES (256, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 84, '174.64.14.13', NULL, '', '2023-03-01 23:47:11', 0);
INSERT INTO `sys_log` VALUES (257, '新增Availability', '{\"id\":276959243,\"tutor name\":\"1\",\"start time\":\"01:30 AM\",\"end time\":\"02:00 AM\",\"tutor id\":1,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 4, '174.64.14.13', NULL, 'admin', '2023-03-01 23:49:08', 0);
INSERT INTO `sys_log` VALUES (258, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 1, '174.64.14.13', NULL, 'admin', '2023-03-01 23:51:10', 0);
INSERT INTO `sys_log` VALUES (259, '用户登录', '{\"username\":\"KLL\",\"password\":\"321\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 81, '174.64.14.13', NULL, '', '2023-03-01 23:51:20', 0);
INSERT INTO `sys_log` VALUES (260, '新增Availability', '{\"id\":276959245,\"tutor name\":\"zz null\",\"start time\":\"01:30 AM\",\"end time\":\"02:00 AM\",\"tutor id\":20,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 5, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:56:26', 0);
INSERT INTO `sys_log` VALUES (261, '新增Availability', '{\"id\":276959244,\"tutor name\":\"zz null\",\"start time\":\"01:30 AM\",\"end time\":\"02:30 AM\",\"tutor id\":20,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 60913, '174.64.14.13', NULL, 'KLL', '2023-03-01 23:56:26', 0);
INSERT INTO `sys_log` VALUES (262, '用户退出登录', '4bd2cde3e3654e6f9094f31210ac1d56', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4bd2cde3e3654e6f9094f31210ac1d56', 12, '174.64.14.13', NULL, 'KLL', '2023-03-02 00:02:48', 0);
INSERT INTO `sys_log` VALUES (263, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 111, '174.64.14.13', NULL, '', '2023-03-02 00:02:55', 0);
INSERT INTO `sys_log` VALUES (264, '新增Availability', '{\"id\":276959246,\"tutor name\":\"tester 2\",\"start time\":\"01:30 AM\",\"end time\":\"03:30 AM\",\"tutor id\":32,\"date\":\"2023-03-01\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 5, '174.64.14.13', NULL, 'admin', '2023-03-02 00:09:32', 0);
INSERT INTO `sys_log` VALUES (265, '编辑Availability', '{\"id\":276959246,\"tutor name\":\"tester 2\",\"start time\":\"12:00 AM\",\"end time\":\"12:30 AM\",\"tutor id\":32,\"delete logic\":0,\"date\":\"2023-03-02\",\"status\":\"available\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 8, '174.64.14.13', NULL, 'admin', '2023-03-02 00:17:50', 0);
INSERT INTO `sys_log` VALUES (266, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 12, '174.64.14.13', NULL, 'admin', '2023-03-02 00:26:08', 0);
INSERT INTO `sys_log` VALUES (267, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 109, '174.64.14.13', NULL, '', '2023-03-02 00:26:28', 0);
INSERT INTO `sys_log` VALUES (268, '编辑Availability', '{\"id\":276959244,\"tutor name\":\"zz null\",\"start time\":\"01:30 AM\",\"end time\":\"02:30 AM\",\"tutor id\":20,\"delete logic\":0,\"date\":\"2023-03-03\",\"status\":\"Expired\"}', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/availability', 4, '174.64.14.13', NULL, 'admin', '2023-03-02 00:34:30', 0);
INSERT INTO `sys_log` VALUES (269, '用户退出登录', '4918ea50c06a458f94878abe741b4f51', '{\"code\":\"200\",\"msg\":\"操作成功\"}', 'http://localhost:9090/logout/4918ea50c06a458f94878abe741b4f51', 14, '174.64.14.13', NULL, 'admin', '2023-03-02 00:44:18', 0);
INSERT INTO `sys_log` VALUES (270, '用户登录', '{\"username\":\"admin\",\"password\":\"admin\"}', '数据过大，返回状态码：200', 'http://localhost:9090/login', 111, '174.64.14.13', NULL, '', '2023-03-02 00:44:26', 0);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `orders` int NULL DEFAULT 1 COMMENT '顺序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'grid' COMMENT '图标',
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  `auth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `pid` int NULL DEFAULT NULL COMMENT '父级id',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `type` int NULL DEFAULT NULL COMMENT '类型，1目录  2菜单 3按钮',
  `hide` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `a_d_index`(`auth` ASC, `deleted` ASC) USING BTREE,
  UNIQUE INDEX `p_p_d_index`(`path` ASC, `page` ASC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 419 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_permission` VALUES (37, '数据字典新增', NULL, 1, NULL, '', 'dict.add', 13, 0, '2023-01-16 20:45:51', '2023-01-16 20:45:51', 3, 0);
INSERT INTO `sys_permission` VALUES (38, '数据字典编辑', NULL, 1, NULL, NULL, 'dict.edit', 13, 0, NULL, '2023-01-28 11:45:21', 3, 0);
INSERT INTO `sys_permission` VALUES (39, '数据字典删除', NULL, 1, NULL, NULL, 'dict.delete', 13, 0, '2023-01-29 11:04:15', '2023-01-29 11:04:15', 3, 0);
INSERT INTO `sys_permission` VALUES (40, '批量删除', NULL, 1, NULL, NULL, 'dict.deleteBatch', 13, 0, '2023-02-02 22:32:22', '2023-02-02 22:32:22', 3, 0);
INSERT INTO `sys_permission` VALUES (41, '数据字典导入', NULL, 1, NULL, NULL, 'dict.import', 13, 0, '2023-02-02 22:32:53', '2023-02-02 22:32:53', 3, 0);
INSERT INTO `sys_permission` VALUES (42, '数据字典导出', NULL, 1, NULL, NULL, 'dict.export', 13, 0, '2023-02-02 22:33:08', '2023-02-02 22:33:08', 3, 0);
INSERT INTO `sys_permission` VALUES (96, 'uploaded files', 'file', 1, 'grid', 'File', 'file.list', 1, 96, NULL, '2023-03-11 05:25:11', 2, 1);
INSERT INTO `sys_permission` VALUES (97, '文件新增', NULL, 1, 'grid', NULL, 'file.add', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (98, '文件导入', NULL, 1, 'grid', NULL, 'file.import', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (99, '文件导出', NULL, 1, 'grid', NULL, 'file.export', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (100, '批量删除', NULL, 1, 'grid', NULL, 'file.deleteBatch', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (101, '文件编辑', NULL, 1, 'grid', NULL, 'file.edit', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (102, '文件删除', NULL, 1, 'grid', NULL, 'file.delete', 96, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (208, 'post', 'notice', 1, 'grid', 'Notice', NULL, NULL, 208, NULL, '2023-04-13 22:01:27', 2, 0);
INSERT INTO `sys_permission` VALUES (209, '公告查询', NULL, 1, 'grid', NULL, 'notice.list', 208, 0, NULL, NULL, 3, 0);
INSERT INTO `sys_permission` VALUES (210, '公告新增', NULL, 1, 'grid', NULL, 'notice.add', 208, 0, NULL, '2023-02-28 01:46:37', 3, 1);
INSERT INTO `sys_permission` VALUES (211, '公告导入', NULL, 1, 'grid', NULL, 'notice.import', 208, 0, NULL, '2023-02-28 01:46:38', 3, 1);
INSERT INTO `sys_permission` VALUES (212, '公告导出', NULL, 1, 'grid', NULL, 'notice.export', 208, 0, NULL, '2023-02-28 01:46:38', 3, 1);
INSERT INTO `sys_permission` VALUES (213, '批量删除', NULL, 1, 'grid', NULL, 'notice.deleteBatch', 208, 0, NULL, '2023-02-28 01:46:38', 3, 1);
INSERT INTO `sys_permission` VALUES (214, '公告编辑', NULL, 1, 'grid', NULL, 'notice.edit', 208, 0, NULL, '2023-02-28 01:46:39', 3, 1);
INSERT INTO `sys_permission` VALUES (215, '公告删除', NULL, 1, 'grid', NULL, 'notice.delete', 208, 0, NULL, '2023-02-28 01:46:40', 3, 1);
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

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  `deleted` int NULL DEFAULT 0 COMMENT '逻辑删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `flag_deleted_idnex`(`flag` ASC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, 'Admin', 'ADMIN', 0, '2023-01-16 19:49:44', '2023-01-16 19:49:55');
INSERT INTO `sys_role` VALUES (3, 'Tutor', 'TUTOR', 0, '2023-01-16 19:50:41', '2023-01-16 19:50:41');
INSERT INTO `sys_role` VALUES (11, 'Student', 'STUDENT', 0, '2023-02-27 17:51:05', '2023-02-27 17:51:05');

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
) ENGINE = InnoDB AUTO_INCREMENT = 3829 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `sys_role_permission` VALUES (3802, 3, 12);
INSERT INTO `sys_role_permission` VALUES (3803, 3, 209);
INSERT INTO `sys_role_permission` VALUES (3800, 3, 392);
INSERT INTO `sys_role_permission` VALUES (3804, 3, 393);
INSERT INTO `sys_role_permission` VALUES (3805, 3, 394);
INSERT INTO `sys_role_permission` VALUES (3806, 3, 398);
INSERT INTO `sys_role_permission` VALUES (3807, 3, 399);
INSERT INTO `sys_role_permission` VALUES (3808, 3, 406);
INSERT INTO `sys_role_permission` VALUES (3809, 3, 407);
INSERT INTO `sys_role_permission` VALUES (3801, 3, 408);
INSERT INTO `sys_role_permission` VALUES (3810, 3, 410);
INSERT INTO `sys_role_permission` VALUES (3811, 3, 411);
INSERT INTO `sys_role_permission` VALUES (3812, 3, 416);
INSERT INTO `sys_role_permission` VALUES (3813, 3, 417);
INSERT INTO `sys_role_permission` VALUES (3823, 11, 12);
INSERT INTO `sys_role_permission` VALUES (3821, 11, 392);
INSERT INTO `sys_role_permission` VALUES (3824, 11, 393);
INSERT INTO `sys_role_permission` VALUES (3825, 11, 400);
INSERT INTO `sys_role_permission` VALUES (3822, 11, 408);
INSERT INTO `sys_role_permission` VALUES (3826, 11, 409);
INSERT INTO `sys_role_permission` VALUES (3827, 11, 416);
INSERT INTO `sys_role_permission` VALUES (3828, 11, 417);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'first name',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'last name',
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '地址',
  `uid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户唯一id',
  `deleted` int NOT NULL DEFAULT 0 COMMENT '逻辑删除 0存在  id删除',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `username_index`(`username` ASC, `deleted` ASC) USING BTREE,
  UNIQUE INDEX `email_index`(`email` ASC, `deleted` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '$2a$10$sz5GIsQI162NS90.iuF6KuqUq6VeUb4uXztDDMDlry44Hazid/lhm', 'Admin', NULL, 'xqnode@163.com', '合肥市政务区', '4918ea50c06a458f94878abe741b4f51', 0, '2022-12-09 20:08:17', '2022-12-09 20:08:17', 'http://localhost:9090/file/download/3ef03aa921504d26bada818bc02077bf.jpg', 'ADMIN', '23333');
INSERT INTO `sys_user` VALUES (2, 'bgg', '$2a$10$GMrMcVqC6nmefRENrgjWXeTHd4bvkwI/lYA0PkT01A.UkPwjq5Pym', 'bgg123456', NULL, 'xqnode1@163.com', '合肥市科大', '4918ea50c06a458f94878abe742131as', 2, NULL, '2023-02-02 22:36:23', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (3, 'ngg', '$2a$10$Vb/33mxBRFnFg/6sMv6E7O1rwt4JJw5s2CJ6LpMYZzxy/m8odHppu', 'ngg', NULL, '1', '合肥市图书馆', '4918ea50c06a458f94878abe742ert34', 0, NULL, '2023-01-29 11:20:30', 'http://localhost:9090/file/download/a359454194cc41378db71379950ee60b.png', 'USER', NULL);
INSERT INTO `sys_user` VALUES (4, 'mgg', '$2a$10$DS/R8r9TFena7ig1t4B.8eA3yLw1uTnmqiriEnnDxUT6.3yVz3HYy', '麦克111', NULL, 'mgg@163.com', '合肥市庐阳区', '4d144eeb49674271b2116d0a9793071c', 0, '2023-01-09 21:23:41', '2023-01-09 21:23:41', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (5, 'vgg', '$2a$10$kd/qJHiY8NY2Q5miTk3nSu2HDNw1kKpNBHHCKIpgNDxPxivjqVZHS', '微微', NULL, 'vv@qq.com', '合肥市新站区', 'b134172712c146ffa4a7d92fe3065c58', 5, '2023-01-09 21:24:23', '2023-02-28 21:26:35', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (6, 'lgg', '$2a$10$7kC0JSmoMWyBeoHZnIlqvuhDG/NV2/hgysV9Cy5DZ3KhdeUSLPWYi', '啦啦啦', NULL, 'lgg@163.com', '合肥市政务区', '5fb5e806e3bd47998c233e5fd4ddd9ed', 6, '2023-01-09 21:25:21', '2023-01-11 20:30:17', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (7, 'lgg1', '$2a$10$kqpZwCWQJo3AYo17bfbTq./GNSSfq.pWqHsg7tHKM.r5K7t6EAJv6', '啦啦啦1', NULL, 'lgg11@163.com', '合肥市政务区', '31c444962184473e817cbdabc2c7eda7', 7, '2023-01-09 21:25:52', '2023-01-11 20:30:17', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (8, 'cgg1', '$2a$10$bBnfsYfJJvshjk5d9DNu5O1mitdAOomBoVBfMZw1lm39UyokJrVG6', 'CAA1', NULL, 'cgg1@qq.com', '合肥市蜀山区1', '875068f088a7481cbb15f84f0e598b8c', 8, '2023-01-09 21:26:33', '2023-01-11 20:30:14', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (9, 'ygg1', '$2a$10$B5h2DD1LHFVrOB/x0W/AF.QgVnx57w9CrMw3ZAFyt7y9CbJK2pxQe', '呀呀呀1', NULL, 'ygg1@qq.com', '合肥市2222', '86e865d243cb4d039b4a011656a013a3', 9, '2023-01-09 21:51:16', '2023-01-09 21:56:16', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (10, 'acc', '$2a$10$sGuSBqboDWTIcGIgQyQ.6OtfK1K2IvMwHPIKb8eRpBJafhFtNi55u', '系统用户nhozq9', NULL, 'acc@163.com', '合肥市政务区', 'c4ce46d5f05c4b769da263fe6faedbbd', 10, '2023-01-11 20:15:32', '2023-01-11 20:30:14', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (11, 'acc1', '$2a$10$fNZZUDw00beUme0cnj9kyuaH3ehzJC/D04B95JztER3/B8w.irq/W', '系统用户4jqdlw', NULL, 'acc1@163.com', '合肥市政务区', 'e6d42290806c42fe8ed2f338949020e7', 11, '2023-01-11 20:15:32', '2023-01-11 20:30:09', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (12, 'acc2', '$2a$10$d9hMi0anGz7MFT2afLa/xe1p4v1d4oMDflm7BAkK0u3dJpzzwObTK', '系统用户l4e1l5', NULL, 'acc2@163.com', '合肥市政务区', 'c38cab03cdd9454494b7ff07973e9839', 12, '2023-01-11 20:17:41', '2023-01-11 20:29:59', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (13, 'acc3', '$2a$10$/pcccH2OgJzkKO9M5jJ5ouWszn4wUrTXBTCeFA6Jx30mhBbwsXDiO', '系统用户xl7e4q', NULL, 'acc3@163.com', '合肥市政务区', '0ec9c217a6a344a7a3ab008f4bd9f62b', 13, '2023-01-11 20:17:41', '2023-01-11 20:24:46', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (14, 'njj', '$2a$10$tx0fp6.3cU9g/VNz/nPMY.3ULcINaV9Dt3q9KmSFCR/5q6cG1j0B6', 'njj', NULL, 'njj@qq.com', '合肥市', 'd4d33c27834444ba81b98fe5e99e183d', 14, '2023-01-16 19:49:02', '2023-02-02 22:36:13', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (15, 'zzz', '$2a$10$/sk2nU6etdDOjzFEN9qgC.O/yct6COykSoTk7tDrv8lDNay5J.zYy', '系统用户nxyn4z', NULL, 'zzz@qq.com', NULL, '0843a13e05364b25b6d2a6b2cd89d807', 15, '2023-02-02 22:21:27', '2023-02-02 22:36:13', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (16, 'zzz1', '$2a$10$aUAismbA98BDKEoAHjUUfOU5L.Cr2ki7Tcn7O5BiG9sROucVQh1.m', '系统用户ams9ab', NULL, 'zzz1@qq.com', NULL, '633aab2eac50405387ae3e854527651f', 16, '2023-02-02 22:29:04', '2023-02-02 22:36:13', NULL, 'USER', NULL);
INSERT INTO `sys_user` VALUES (17, 'vbbb', '$2a$10$sHX8UzVB2s5abnkw1nQrA.pBbRu5kQQEqvdb71lFwH6G..RnlKxXS', '系统用户3rb0t1', NULL, 'vbbb@qq.com', '111222', '0e338aad58384bc8b80c2de7f1bbd7da', 0, '2023-02-03 21:44:15', '2023-02-03 21:44:15', 'http://localhost:9090/file/download/3f07f2e30d2942089606b2bd96c7c85f.jpg', 'USER', NULL);
INSERT INTO `sys_user` VALUES (18, 'asss', '$2a$10$Wfsje9KSLFOGFSsyU/OQ6e7Z9UbdKH3gnjH2DRoyX07EID0GaNrLG', '系统用户6usym6', NULL, 'asss@163.com', NULL, 'c8dcfc6f12c94963b8514f7495f7ca4c', 0, '2023-02-04 22:03:44', '2023-02-04 22:03:44', 'http://localhost:9090/file/download/dfcf5f36d649469393f9a0cff3a9adbd.png', 'USER', NULL);
INSERT INTO `sys_user` VALUES (19, 'gbb', '$2a$10$XmgagEBh2jlERi9JTAP3iub88e022RXMovXlV3ea/ZQbMi/.Yd3Ae', 'Ikun小黑子专用号', NULL, 'ikun@163.com', '蔡徐坤北京分坤', 'f3e75978695847e59c7c575d8379afa3', 0, '2023-02-11 21:25:34', '2023-02-11 21:25:34', 'http://localhost:9090/file/download/a2f11fdc5c8e4f4981f0d46e56d8f0c4.jpg', 'USER', NULL);
INSERT INTO `sys_user` VALUES (20, 'KLL', '$2a$10$pFtXWkNOGPCmEs.a53QceuP5D4bc.dFF8tgfoqwazzPG.QI6Zjio6', 'z', 'z', '1@1', '123', '4bd2cde3e3654e6f9094f31210ac1d56', 0, '2023-02-27 17:43:52', '2023-02-27 17:43:52', 'http://localhost:9090/file/download/f8c7f74546df4c1095253e7e6d66c4fa.jpg', 'TUTOR', '这个人没写任何内容\n2333');
INSERT INTO `sys_user` VALUES (32, 'test', '$2a$10$Hy4clX5R6DrUz4zCzZbvyeaucKWie8vbeavhHzpEhFvB6fbRJuMLq', 'tester ', '3', '1@1.edu', '123', 'b396e13e996142caa439bbb34c014054', 0, '2023-02-27 21:05:12', '2023-02-27 21:05:12', 'http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg', 'STUDENT', NULL);
INSERT INTO `sys_user` VALUES (36, 'test2', '$2a$10$nN2rfXbNTbDnoMfDgE4Fret127EZBzYNUDG59CJ1fwSjc11vtw9eG', 'tester', '2', '2@2.edu', NULL, '2483f4f5d28a491b8c0f2bb4aa10f96f', 0, '2023-02-28 00:59:39', '2023-02-28 00:59:39', NULL, 'STUDENT', NULL);
INSERT INTO `sys_user` VALUES (37, 'kuaile', '$2a$10$QgDV60g9yQIDzS1OeqgJbu/V0DheoQPNMhlFLwSdE90kgSBftfFeK', 'Ziqing', 'Zhou', 'zzhou24@lsu.edu', '6765 Corporate Blvd. ', '69cfe3c5cee84ab9801bf9aeae75fc65', 0, '2023-02-28 02:00:22', '2023-02-28 02:00:22', 'http://localhost:9090/file/download/b759d9b851134c0e9765b476f5f37d25.jpg', 'ADMIN', NULL);

SET FOREIGN_KEY_CHECKS = 1;
