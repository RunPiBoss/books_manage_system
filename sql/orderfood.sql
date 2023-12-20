/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 192.168.202.129:3306
 Source Schema         : orderfood

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 18/12/2023 19:55:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for desk
-- ----------------------------
DROP TABLE IF EXISTS `desk`;
CREATE TABLE `desk`  (
  `desk_id` int NOT NULL AUTO_INCREMENT COMMENT '餐桌id',
  `dish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜名',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '菜品单价',
  `total_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '总价',
  `dish_num` int NULL DEFAULT NULL COMMENT '菜品数量',
  `order_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`desk_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of desk
-- ----------------------------
INSERT INTO `desk` VALUES (29, '东坡肉', 56.00, '168', 3, '2023-12-18 19:14:08');
INSERT INTO `desk` VALUES (30, '鱼香肉丝', 38.00, '38', 1, '2023-12-18 19:21:04');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish`  (
  `dish_id` int NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `dish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品名称',
  `dish_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜品描述',
  `price` int NULL DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`dish_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES (1, '鱼香肉丝', '鱼香味的肉丝', 38);
INSERT INTO `dish` VALUES (2, '京酱肉丝', '京酱味的肉丝', 40);
INSERT INTO `dish` VALUES (3, '佛跳墙', '如来翻墙', 108);
INSERT INTO `dish` VALUES (4, '松鼠桂鱼', '松鼠吃桂鱼', 78);
INSERT INTO `dish` VALUES (5, '红烧鸡块', '烧鸡块', 34);
INSERT INTO `dish` VALUES (6, '东坡肉', '苏轼做的红烧肉', 56);
INSERT INTO `dish` VALUES (7, '手抓羊肉', '来自草原的问候', 112);
INSERT INTO `dish` VALUES (8, '九转大肠', '自己体会', 66);
INSERT INTO `dish` VALUES (9, '臭豆腐配法式煎鹅肝', '味儿老正了', 158);
INSERT INTO `dish` VALUES (10, '麻辣小龙虾', '麻麻辣辣的入侵物种', 96);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int NULL DEFAULT NULL COMMENT '用户id',
  `order_time` datetime NULL DEFAULT NULL COMMENT '下单时间',
  `total_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 1, '2023-12-14 17:11:02', '158');

-- ----------------------------
-- Table structure for order_detailld
-- ----------------------------
DROP TABLE IF EXISTS `order_detailld`;
CREATE TABLE `order_detailld`  (
  `order_detail_id` int NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int NULL DEFAULT NULL COMMENT '订单id',
  `dish_id` int NULL DEFAULT NULL COMMENT '菜品id',
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数量',
  `sub_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '小计金额',
  PRIMARY KEY (`order_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detailld
-- ----------------------------
INSERT INTO `order_detailld` VALUES (1, 1, 1, '1', '38');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay`  (
  `pay_id` int NOT NULL AUTO_INCREMENT COMMENT '支付id',
  `order_id` int NULL DEFAULT NULL COMMENT '订单id',
  `pay_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付方式',
  `pay_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付金额',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `pay_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES (1, 1, '支付宝', '158', '2023-12-14 17:11:46', 'OK');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'littleren');
INSERT INTO `user` VALUES (2, 'xiaopi');
INSERT INTO `user` VALUES (3, 'dalu');
INSERT INTO `user` VALUES (4, 'yangyang');

SET FOREIGN_KEY_CHECKS = 1;
