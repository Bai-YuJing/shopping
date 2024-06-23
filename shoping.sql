/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : localhost:3306
 Source Schema         : shoping

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 23/06/2024 19:17:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_address
-- ----------------------------
DROP TABLE IF EXISTS `t_address`;
CREATE TABLE `t_address`  (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_province` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_city` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_describe` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`address_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_address
-- ----------------------------
INSERT INTO `t_address` VALUES (3, '湖北', '恩施', '土家族', '民族路', 2);
INSERT INTO `t_address` VALUES (4, '北京', '县', '密云县', '琴台大道', 2);
INSERT INTO `t_address` VALUES (5, '天津', '市辖区', '河东区', '琴台大道', 3);
INSERT INTO `t_address` VALUES (6, '辽宁', '沈阳市', '和平区', '光谷', 3);
INSERT INTO `t_address` VALUES (7, '重庆', '市辖区', '渝北区', '阿特', 4);
INSERT INTO `t_address` VALUES (8, '重庆', '市辖区', '渝北区', '阿特', 4);
INSERT INTO `t_address` VALUES (38, '北京', '市辖区', '门头沟区', '琴台大道', 7);
INSERT INTO `t_address` VALUES (40, '北京', '市辖区', '西城区', '琴台大道', 12);
INSERT INTO `t_address` VALUES (41, '湖北', '武汉市', '洪山区', '琴台大道', 17);
INSERT INTO `t_address` VALUES (42, '湖北', '武汉市', '江岸区', '琴台大道', 18);
INSERT INTO `t_address` VALUES (43, '北京', '县', '密云县', '琴台大道', 21);
INSERT INTO `t_address` VALUES (44, '上海', '市辖区', '卢湾区', '琴台大道', 22);
INSERT INTO `t_address` VALUES (45, '重庆', '县', '潼南县', '琴台大道', 22);
INSERT INTO `t_address` VALUES (47, '湖北', '武汉市', '洪山区', '王志刚', 1);
INSERT INTO `t_address` VALUES (48, '北京', '市辖区', '海淀区', '京爷', 27);

-- ----------------------------
-- Table structure for t_cart
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart`  (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `product_num` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 309 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES (276, 82, 1, 15);
INSERT INTO `t_cart` VALUES (277, 83, 1, 15);
INSERT INTO `t_cart` VALUES (287, 83, 1, 12);
INSERT INTO `t_cart` VALUES (295, 79, 1, 23);
INSERT INTO `t_cart` VALUES (296, 81, 1, 23);
INSERT INTO `t_cart` VALUES (297, 82, 1, 23);
INSERT INTO `t_cart` VALUES (298, 76, 1, 23);
INSERT INTO `t_cart` VALUES (299, 77, 1, 23);
INSERT INTO `t_cart` VALUES (300, 75, 1, 23);
INSERT INTO `t_cart` VALUES (307, 83, 2, 24);
INSERT INTO `t_cart` VALUES (308, 79, 5, 24);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (5, '手机');
INSERT INTO `t_category` VALUES (6, '电脑');
INSERT INTO `t_category` VALUES (7, '电视');
INSERT INTO `t_category` VALUES (8, '零食');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order`  (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `address_details` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_type` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES (56, '2024-01-03 13:39:48', NULL, 1, '湖北-恩施-土家族-民族路', 1);
INSERT INTO `t_order` VALUES (57, '2024-01-03 13:39:51', NULL, 1, '湖北-恩施-土家族-民族路', 1);
INSERT INTO `t_order` VALUES (58, '2024-01-03 15:34:22', NULL, 1, '湖北-恩施-土家族-民族路', 1);
INSERT INTO `t_order` VALUES (59, '2024-01-03 17:00:02', NULL, 1, '湖北-宜昌市-秭归县-我家', 1);
INSERT INTO `t_order` VALUES (60, '2024-01-03 17:01:52', NULL, 1, '湖北-宜昌市-秭归县-我家', 1);
INSERT INTO `t_order` VALUES (61, '2024-01-03 17:10:31', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (62, '2024-01-03 17:12:26', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (63, '2024-01-03 17:18:16', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (64, '2024-01-03 17:18:53', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (65, '2024-01-03 17:19:17', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (66, '2024-01-03 17:20:14', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (67, '2024-01-03 17:27:14', NULL, 27, NULL, 1);
INSERT INTO `t_order` VALUES (68, '2024-01-03 17:43:34', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (69, '2024-01-03 17:57:51', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (70, '2024-01-03 18:10:45', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (71, '2024-01-03 18:10:48', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (72, '2024-01-03 18:13:26', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (73, '2024-01-03 18:15:27', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (74, '2024-01-03 18:16:03', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (75, '2024-01-03 19:14:16', NULL, 1, NULL, 1);
INSERT INTO `t_order` VALUES (76, '2024-01-04 14:12:25', NULL, 1, NULL, 1);

-- ----------------------------
-- Table structure for t_order_details
-- ----------------------------
DROP TABLE IF EXISTS `t_order_details`;
CREATE TABLE `t_order_details`  (
  `order_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_num` int(11) NOT NULL,
  `product_money` decimal(8, 2) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`order_details_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_order_details
-- ----------------------------
INSERT INTO `t_order_details` VALUES (113, 'K10x', 1, 1099.00, 56);
INSERT INTO `t_order_details` VALUES (114, 'MateBook D 14 SE', 1, 3749.00, 56);
INSERT INTO `t_order_details` VALUES (115, '爆浆曲奇小丸子', 2, 19.80, 56);
INSERT INTO `t_order_details` VALUES (116, '辣卤礼包30包', 2, 19.80, 56);
INSERT INTO `t_order_details` VALUES (117, 'EA43 43英寸', 1, 897.00, 56);
INSERT INTO `t_order_details` VALUES (118, '12T Pro 5G ', 1, 1349.00, 58);
INSERT INTO `t_order_details` VALUES (119, '爆浆曲奇小丸子', 1, 9.90, 58);
INSERT INTO `t_order_details` VALUES (120, '12T Pro 5G ', 1, 1349.00, 59);
INSERT INTO `t_order_details` VALUES (121, '零食礼包3332g ', 1, 199.00, 60);
INSERT INTO `t_order_details` VALUES (122, '12T Pro 5G ', 2, 2698.00, 61);
INSERT INTO `t_order_details` VALUES (123, 'Vidda R43 43英寸 ', 2, 1598.00, 61);
INSERT INTO `t_order_details` VALUES (124, 'P31 32英寸', 1, 495.00, 61);
INSERT INTO `t_order_details` VALUES (125, '大帅哥', 1, 1.00, 61);
INSERT INTO `t_order_details` VALUES (126, '12T Pro 5G ', 2, 2698.00, 63);
INSERT INTO `t_order_details` VALUES (127, '爆浆曲奇小丸子', 1, 9.90, 64);
INSERT INTO `t_order_details` VALUES (128, '爆浆曲奇小丸子', 2, 19.80, 67);
INSERT INTO `t_order_details` VALUES (129, '12T Pro 5G ', 1, 1349.00, 68);
INSERT INTO `t_order_details` VALUES (130, '测试', 3, 6.00, 69);
INSERT INTO `t_order_details` VALUES (131, '12T Pro 5G ', 1, 1349.00, 70);
INSERT INTO `t_order_details` VALUES (132, '爆浆曲奇小丸子', 2, 19.80, 70);
INSERT INTO `t_order_details` VALUES (133, '辣卤礼包30包', 1, 9.90, 70);
INSERT INTO `t_order_details` VALUES (134, '高清一体机电脑', 1, 1699.00, 70);
INSERT INTO `t_order_details` VALUES (135, '测试', 2, 4.00, 72);
INSERT INTO `t_order_details` VALUES (136, '测试', 2, 4.00, 74);
INSERT INTO `t_order_details` VALUES (137, '测试', 3, 6.00, 75);
INSERT INTO `t_order_details` VALUES (138, '12T Pro 5G ', 1, 1349.00, 75);
INSERT INTO `t_order_details` VALUES (139, '12T Pro 5G ', 2, 2698.00, 76);
INSERT INTO `t_order_details` VALUES (140, '爆浆曲奇小丸子', 1, 9.90, 76);
INSERT INTO `t_order_details` VALUES (141, '辣卤礼包30包', 1, 9.90, 76);
INSERT INTO `t_order_details` VALUES (142, '零食礼包3332g ', 1, 199.00, 76);
INSERT INTO `t_order_details` VALUES (143, 'A55 55英寸', 1, 2499.00, 76);
INSERT INTO `t_order_details` VALUES (144, 'P31 32英寸', 25, 12375.00, 76);
INSERT INTO `t_order_details` VALUES (145, '台式机电脑服务器', 6, 25794.00, 76);

-- ----------------------------
-- Table structure for t_product
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_pic` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `product_price` decimal(8, 2) NOT NULL,
  `product_describe` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product` VALUES (86, 'Note13 pro', '1704262976607.png', 1499.00, 'Redmin', 5, 'Y');
INSERT INTO `t_product` VALUES (87, 'X50 ', '1704262967759.png', 1399.00, '荣耀', 5, 'Y');
INSERT INTO `t_product` VALUES (88, ' Note11', '1704263003728.png', 799.00, ' Redmin', 5, 'Y');
INSERT INTO `t_product` VALUES (89, 'K10x', '1704262990143.png', 1099.00, 'OPPO', 5, 'Y');
INSERT INTO `t_product` VALUES (90, 'Mate 30', '1704263015343.png', 1289.00, 'HUAWEI ', 5, 'Y');
INSERT INTO `t_product` VALUES (92, '台式机电脑服务器', '1704262959895.png', 4299.00, '联想国产信创', 6, 'Y');
INSERT INTO `t_product` VALUES (93, '高清一体机电脑', '1704262943791.png', 1699.00, '飞利浦（PHILIPS', 6, 'Y');
INSERT INTO `t_product` VALUES (94, '垃圾', '1704272025017.png', 789.00, ' 英特尔i5酷睿i7升十二核', 5, 'Y');
INSERT INTO `t_product` VALUES (95, 'MateBook D 14 SE', '1704262917174.png', 3749.00, '华为笔记本电脑', 6, 'Y');
INSERT INTO `t_product` VALUES (96, 'Vidda R43 43英寸 ', '1704262907934.png', 799.00, ' 海信', 7, 'Y');
INSERT INTO `t_product` VALUES (97, 'P31 32英寸', '1704262897673.png', 495.00, '酷开创维', 7, 'Y');
INSERT INTO `t_product` VALUES (98, 'EA43 43英寸', '1704262887989.png', 897.00, '小米电视', 7, 'Y');
INSERT INTO `t_product` VALUES (99, 'A55 55英寸', '1704262878004.png', 2499.00, '小米电视 Redmi ', 7, 'Y');
INSERT INTO `t_product` VALUES (100, '零食礼包3332g ', '1704262861762.png', 199.00, '百草味', 8, 'Y');
INSERT INTO `t_product` VALUES (101, '辣卤礼包30包', '1704262852169.png', 9.90, '三只松鼠', 8, 'Y');
INSERT INTO `t_product` VALUES (102, '爆浆曲奇小丸子', '1704262830667.png', 9.90, '比比赞（BIBIZAN）', 8, 'Y');
INSERT INTO `t_product` VALUES (103, '12T Pro 5G ', '1704262841465.png', 1349.00, 'Redmi Note ', 5, 'Y');
INSERT INTO `t_product` VALUES (108, '测试', '1704275804223.jpg', 2.00, 'test', 5, 'Y');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_tel` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_pwd` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y',
  `user_role` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'U',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'admin', 'zxw123456', '王志刚', 'M', '2024-01-03 15:25:47', 'Y', 'A');
INSERT INTO `t_user` VALUES (27, 'user1', 'zxw123456', '王志强', 'F', '2024-01-04 14:13:40', 'Y', 'U');
INSERT INTO `t_user` VALUES (28, 'user2', 'zxw123456', '王志宇', 'F', '2024-01-03 15:27:31', 'Y', 'U');

SET FOREIGN_KEY_CHECKS = 1;
