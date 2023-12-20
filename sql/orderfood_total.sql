/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 80034
Source Host           : localhost:3306
Source Database       : orderfood

Target Server Type    : MYSQL
Target Server Version : 80034
File Encoding         : 65001

Date: 2023-12-20 15:08:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for desk
-- ----------------------------
DROP TABLE IF EXISTS `desk`;
CREATE TABLE `desk` (
  `desk_id` int NOT NULL AUTO_INCREMENT COMMENT '餐桌id',
  `dish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜名',
  `price` decimal(10,2) DEFAULT NULL COMMENT '菜品单价',
  `total_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '总价',
  `dish_num` int DEFAULT NULL COMMENT '菜品数量',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `t_desk_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`desk_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of desk
-- ----------------------------
INSERT INTO `desk` VALUES ('65', '鱼香肉丝', '38.00', '116', '2', '2023-12-20 14:06:00', '1');
INSERT INTO `desk` VALUES ('66', '鱼香肉丝', '38.00', '38', '1', '2023-12-20 14:14:05', '1');
INSERT INTO `desk` VALUES ('67', '松鼠桂鱼', '78.00', '78', '1', '2023-12-20 14:22:55', '1');

-- ----------------------------
-- Table structure for dish
-- ----------------------------
DROP TABLE IF EXISTS `dish`;
CREATE TABLE `dish` (
  `dish_id` int NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `dish_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜品名称',
  `dish_des` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '菜品描述',
  `price` int DEFAULT NULL COMMENT '价格',
  PRIMARY KEY (`dish_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dish
-- ----------------------------
INSERT INTO `dish` VALUES ('1', '鱼香肉丝', '鱼香味的肉丝', '38');
INSERT INTO `dish` VALUES ('4', '松鼠桂鱼', '松鼠吃桂鱼', '78');
INSERT INTO `dish` VALUES ('5', '红烧鸡块', '烧鸡块', '34');
INSERT INTO `dish` VALUES ('6', '东坡肉', '苏轼做的红烧肉', '56');
INSERT INTO `dish` VALUES ('7', '手抓羊肉', '来自草原的问候', '112');
INSERT INTO `dish` VALUES ('8', '九转大肠', '自己体会', '66');
INSERT INTO `dish` VALUES ('17', '佛跳墙', '如来翻墙', '108');
INSERT INTO `dish` VALUES ('18', '辣子鸡', '狠辣的鸡', '1');
INSERT INTO `dish` VALUES ('19', '卫龙爆炒魔芋爽', '挑战你的味蕾', '25');
INSERT INTO `dish` VALUES ('20', '葱爆羊肉', '山东大葱和青青草原的结合', '49');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int DEFAULT NULL COMMENT '用户id',
  `order_time` datetime DEFAULT NULL COMMENT '下单时间',
  `total_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '总金额',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '1', '2023-12-14 17:11:02', '158');

-- ----------------------------
-- Table structure for order_detailld
-- ----------------------------
DROP TABLE IF EXISTS `order_detailld`;
CREATE TABLE `order_detailld` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT COMMENT '订单详情id',
  `order_id` int DEFAULT NULL COMMENT '订单id',
  `dish_id` int DEFAULT NULL COMMENT '菜品id',
  `quantity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数量',
  `sub_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '小计金额',
  PRIMARY KEY (`order_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of order_detailld
-- ----------------------------
INSERT INTO `order_detailld` VALUES ('1', '1', '1', '1', '38');

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `pay_id` int NOT NULL AUTO_INCREMENT COMMENT '支付id',
  `order_id` int DEFAULT NULL COMMENT '订单id',
  `pay_way` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付方式',
  `pay_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付金额',
  `pay_time` datetime DEFAULT NULL COMMENT '支付时间',
  `pay_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '支付状态',
  PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of pay
-- ----------------------------
INSERT INTO `pay` VALUES ('1', '1', '支付宝', '158', '2023-12-14 17:11:46', 'OK');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `password` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123456', 'littleren');
INSERT INTO `user` VALUES ('2', '123456', 'xiaopi');
INSERT INTO `user` VALUES ('3', '123456', 'dalu');
INSERT INTO `user` VALUES ('4', '123456', 'yangyang');
INSERT INTO `user` VALUES ('5', 'fdfd', 'hfjhd');
