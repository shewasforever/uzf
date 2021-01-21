/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : uzf

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-04-24 17:40:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `uzf_admin`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_admin`;
CREATE TABLE `uzf_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ad_work_number` varchar(10) DEFAULT NULL COMMENT '工号',
  `ad_account` varchar(255) DEFAULT NULL COMMENT '账号',
  `ad_tel` varchar(11) NOT NULL DEFAULT '' COMMENT '管理员电话',
  `ad_name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `ad_pwd` varchar(32) NOT NULL COMMENT '密码',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '管理员状态',
  `ro_id` int(10) DEFAULT '0' COMMENT '后台用户角色分组id',
  `add_time` datetime DEFAULT NULL COMMENT '入职日期',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `delete_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '删除状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- ----------------------------
-- Records of uzf_admin
-- ----------------------------
INSERT INTO `uzf_admin` VALUES ('1', 'YXG10001', null, 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '1', '1', '2020-03-28 11:35:10', null, '1');
INSERT INTO `uzf_admin` VALUES ('2', 'YXG10002', null, '15538927152', '王百万', 'e10adc3949ba59abbe56e057f20f883e', '1', '2', '2020-04-10 16:14:04', null, '1');
INSERT INTO `uzf_admin` VALUES ('3', 'YXG10003', null, '15538927151', '李旭', 'e10adc3949ba59abbe56e057f20f883e', '1', '3', '2020-04-10 16:17:39', null, '1');

-- ----------------------------
-- Table structure for `uzf_apply`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_apply`;
CREATE TABLE `uzf_apply` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户申请表',
  `merchant_name` varchar(50) DEFAULT NULL COMMENT '商户名称',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `merchant_style` int(5) DEFAULT NULL COMMENT '商户类型：1 餐饮 2 娱乐 3 门票 4 休闲消费 5 影视 6 其他',
  `address` varchar(255) DEFAULT NULL COMMENT '商户详细地址',
  `environment` varchar(255) DEFAULT NULL COMMENT '店铺环境',
  `person_in_charge` varchar(50) DEFAULT NULL COMMENT '负责人',
  `telephone` varchar(11) DEFAULT NULL COMMENT '负责人联系电话',
  `status` int(1) DEFAULT '1' COMMENT '审核状态： 1审核中 2系统服务商审核通过 3 超级节点审核通过 4 申请驳回',
  `picture` varchar(255) DEFAULT NULL COMMENT '相关图片',
  `start_time` datetime DEFAULT NULL COMMENT '申请时间',
  `setting_time` datetime DEFAULT NULL COMMENT '系统服务商审核通过时间',
  `apply_time` datetime DEFAULT NULL COMMENT '超级节点审核通过时间',
  `reason` varchar(255) DEFAULT NULL COMMENT '驳回原因',
  PRIMARY KEY (`id`),
  UNIQUE KEY `us_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='会员申请商户表';

-- ----------------------------
-- Records of uzf_apply
-- ----------------------------
INSERT INTO `uzf_apply` VALUES ('1', '剧会', '18', '1', '郑州市黄河路与花园路交叉口西200米', '环境优雅，适合情侣约会。', '李向阳', '15538927152', '3', 'safadf', '2020-04-13 11:06:59', '2020-04-14 10:48:55', '2020-04-15 10:49:04', null);
INSERT INTO `uzf_apply` VALUES ('2', '剧会', '20', '1', '郑州市黄河路与花园路交叉口西200米', '环境优雅，适合情侣约会。', '李向阳', '15538927152', '1', 'safadf', '2020-04-21 12:01:41', null, null, null);

-- ----------------------------
-- Table structure for `uzf_area`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_area`;
CREATE TABLE `uzf_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `area_name` varchar(120) NOT NULL DEFAULT '' COMMENT '地区名',
  `area_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '地区类型 0：国家，1：省，2：地区',
  PRIMARY KEY (`area_id`),
  KEY `area_id` (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8 COMMENT='全国地区表';

-- ----------------------------
-- Records of uzf_area
-- ----------------------------
INSERT INTO `uzf_area` VALUES ('1', '0', '中国', '0');
INSERT INTO `uzf_area` VALUES ('2', '1', '北京', '1');
INSERT INTO `uzf_area` VALUES ('3', '1', '安徽', '1');
INSERT INTO `uzf_area` VALUES ('4', '1', '福建', '1');
INSERT INTO `uzf_area` VALUES ('5', '1', '甘肃', '1');
INSERT INTO `uzf_area` VALUES ('6', '1', '广东', '1');
INSERT INTO `uzf_area` VALUES ('7', '1', '广西', '1');
INSERT INTO `uzf_area` VALUES ('8', '1', '贵州', '1');
INSERT INTO `uzf_area` VALUES ('9', '1', '海南', '1');
INSERT INTO `uzf_area` VALUES ('10', '1', '河北', '1');
INSERT INTO `uzf_area` VALUES ('11', '1', '河南', '1');
INSERT INTO `uzf_area` VALUES ('12', '1', '黑龙江', '1');
INSERT INTO `uzf_area` VALUES ('13', '1', '湖北', '1');
INSERT INTO `uzf_area` VALUES ('14', '1', '湖南', '1');
INSERT INTO `uzf_area` VALUES ('15', '1', '吉林', '1');
INSERT INTO `uzf_area` VALUES ('16', '1', '江苏', '1');
INSERT INTO `uzf_area` VALUES ('17', '1', '江西', '1');
INSERT INTO `uzf_area` VALUES ('18', '1', '辽宁', '1');
INSERT INTO `uzf_area` VALUES ('19', '1', '内蒙古', '1');
INSERT INTO `uzf_area` VALUES ('20', '1', '宁夏', '1');
INSERT INTO `uzf_area` VALUES ('21', '1', '青海', '1');
INSERT INTO `uzf_area` VALUES ('22', '1', '山东', '1');
INSERT INTO `uzf_area` VALUES ('23', '1', '山西', '1');
INSERT INTO `uzf_area` VALUES ('24', '1', '陕西', '1');
INSERT INTO `uzf_area` VALUES ('25', '1', '上海', '1');
INSERT INTO `uzf_area` VALUES ('26', '1', '四川', '1');
INSERT INTO `uzf_area` VALUES ('27', '1', '天津', '1');
INSERT INTO `uzf_area` VALUES ('28', '1', '西藏', '1');
INSERT INTO `uzf_area` VALUES ('29', '1', '新疆', '1');
INSERT INTO `uzf_area` VALUES ('30', '1', '云南', '1');
INSERT INTO `uzf_area` VALUES ('31', '1', '浙江', '1');
INSERT INTO `uzf_area` VALUES ('32', '1', '重庆', '1');
INSERT INTO `uzf_area` VALUES ('33', '1', '香港', '1');
INSERT INTO `uzf_area` VALUES ('34', '1', '澳门', '1');
INSERT INTO `uzf_area` VALUES ('35', '1', '台湾', '1');
INSERT INTO `uzf_area` VALUES ('36', '3', '安庆', '2');
INSERT INTO `uzf_area` VALUES ('37', '3', '蚌埠', '2');
INSERT INTO `uzf_area` VALUES ('38', '3', '巢湖', '2');
INSERT INTO `uzf_area` VALUES ('39', '3', '池州', '2');
INSERT INTO `uzf_area` VALUES ('40', '3', '滁州', '2');
INSERT INTO `uzf_area` VALUES ('41', '3', '阜阳', '2');
INSERT INTO `uzf_area` VALUES ('42', '3', '淮北', '2');
INSERT INTO `uzf_area` VALUES ('43', '3', '淮南', '2');
INSERT INTO `uzf_area` VALUES ('44', '3', '黄山', '2');
INSERT INTO `uzf_area` VALUES ('45', '3', '六安', '2');
INSERT INTO `uzf_area` VALUES ('46', '3', '马鞍山', '2');
INSERT INTO `uzf_area` VALUES ('47', '3', '宿州', '2');
INSERT INTO `uzf_area` VALUES ('48', '3', '铜陵', '2');
INSERT INTO `uzf_area` VALUES ('49', '3', '芜湖', '2');
INSERT INTO `uzf_area` VALUES ('50', '3', '宣城', '2');
INSERT INTO `uzf_area` VALUES ('51', '3', '亳州', '2');
INSERT INTO `uzf_area` VALUES ('52', '2', '北京', '2');
INSERT INTO `uzf_area` VALUES ('53', '4', '福州', '2');
INSERT INTO `uzf_area` VALUES ('54', '4', '龙岩', '2');
INSERT INTO `uzf_area` VALUES ('55', '4', '南平', '2');
INSERT INTO `uzf_area` VALUES ('56', '4', '宁德', '2');
INSERT INTO `uzf_area` VALUES ('57', '4', '莆田', '2');
INSERT INTO `uzf_area` VALUES ('58', '4', '泉州', '2');
INSERT INTO `uzf_area` VALUES ('59', '4', '三明', '2');
INSERT INTO `uzf_area` VALUES ('60', '4', '厦门', '2');
INSERT INTO `uzf_area` VALUES ('61', '4', '漳州', '2');
INSERT INTO `uzf_area` VALUES ('62', '5', '兰州', '2');
INSERT INTO `uzf_area` VALUES ('63', '5', '白银', '2');
INSERT INTO `uzf_area` VALUES ('64', '5', '定西', '2');
INSERT INTO `uzf_area` VALUES ('65', '5', '甘南', '2');
INSERT INTO `uzf_area` VALUES ('66', '5', '嘉峪关', '2');
INSERT INTO `uzf_area` VALUES ('67', '5', '金昌', '2');
INSERT INTO `uzf_area` VALUES ('68', '5', '酒泉', '2');
INSERT INTO `uzf_area` VALUES ('69', '5', '临夏', '2');
INSERT INTO `uzf_area` VALUES ('70', '5', '陇南', '2');
INSERT INTO `uzf_area` VALUES ('71', '5', '平凉', '2');
INSERT INTO `uzf_area` VALUES ('72', '5', '庆阳', '2');
INSERT INTO `uzf_area` VALUES ('73', '5', '天水', '2');
INSERT INTO `uzf_area` VALUES ('74', '5', '武威', '2');
INSERT INTO `uzf_area` VALUES ('75', '5', '张掖', '2');
INSERT INTO `uzf_area` VALUES ('76', '6', '广州', '2');
INSERT INTO `uzf_area` VALUES ('77', '6', '深圳', '2');
INSERT INTO `uzf_area` VALUES ('78', '6', '潮州', '2');
INSERT INTO `uzf_area` VALUES ('79', '6', '东莞', '2');
INSERT INTO `uzf_area` VALUES ('80', '6', '佛山', '2');
INSERT INTO `uzf_area` VALUES ('81', '6', '河源', '2');
INSERT INTO `uzf_area` VALUES ('82', '6', '惠州', '2');
INSERT INTO `uzf_area` VALUES ('83', '6', '江门', '2');
INSERT INTO `uzf_area` VALUES ('84', '6', '揭阳', '2');
INSERT INTO `uzf_area` VALUES ('85', '6', '茂名', '2');
INSERT INTO `uzf_area` VALUES ('86', '6', '梅州', '2');
INSERT INTO `uzf_area` VALUES ('87', '6', '清远', '2');
INSERT INTO `uzf_area` VALUES ('88', '6', '汕头', '2');
INSERT INTO `uzf_area` VALUES ('89', '6', '汕尾', '2');
INSERT INTO `uzf_area` VALUES ('90', '6', '韶关', '2');
INSERT INTO `uzf_area` VALUES ('91', '6', '阳江', '2');
INSERT INTO `uzf_area` VALUES ('92', '6', '云浮', '2');
INSERT INTO `uzf_area` VALUES ('93', '6', '湛江', '2');
INSERT INTO `uzf_area` VALUES ('94', '6', '肇庆', '2');
INSERT INTO `uzf_area` VALUES ('95', '6', '中山', '2');
INSERT INTO `uzf_area` VALUES ('96', '6', '珠海', '2');
INSERT INTO `uzf_area` VALUES ('97', '7', '南宁', '2');
INSERT INTO `uzf_area` VALUES ('98', '7', '桂林', '2');
INSERT INTO `uzf_area` VALUES ('99', '7', '百色', '2');
INSERT INTO `uzf_area` VALUES ('100', '7', '北海', '2');
INSERT INTO `uzf_area` VALUES ('101', '7', '崇左', '2');
INSERT INTO `uzf_area` VALUES ('102', '7', '防城港', '2');
INSERT INTO `uzf_area` VALUES ('103', '7', '贵港', '2');
INSERT INTO `uzf_area` VALUES ('104', '7', '河池', '2');
INSERT INTO `uzf_area` VALUES ('105', '7', '贺州', '2');
INSERT INTO `uzf_area` VALUES ('106', '7', '来宾', '2');
INSERT INTO `uzf_area` VALUES ('107', '7', '柳州', '2');
INSERT INTO `uzf_area` VALUES ('108', '7', '钦州', '2');
INSERT INTO `uzf_area` VALUES ('109', '7', '梧州', '2');
INSERT INTO `uzf_area` VALUES ('110', '7', '玉林', '2');
INSERT INTO `uzf_area` VALUES ('111', '8', '贵阳', '2');
INSERT INTO `uzf_area` VALUES ('112', '8', '安顺', '2');
INSERT INTO `uzf_area` VALUES ('113', '8', '毕节', '2');
INSERT INTO `uzf_area` VALUES ('114', '8', '六盘水', '2');
INSERT INTO `uzf_area` VALUES ('115', '8', '黔东南', '2');
INSERT INTO `uzf_area` VALUES ('116', '8', '黔南', '2');
INSERT INTO `uzf_area` VALUES ('117', '8', '黔西南', '2');
INSERT INTO `uzf_area` VALUES ('118', '8', '铜仁', '2');
INSERT INTO `uzf_area` VALUES ('119', '8', '遵义', '2');
INSERT INTO `uzf_area` VALUES ('120', '9', '海口', '2');
INSERT INTO `uzf_area` VALUES ('121', '9', '三亚', '2');
INSERT INTO `uzf_area` VALUES ('122', '9', '白沙', '2');
INSERT INTO `uzf_area` VALUES ('123', '9', '保亭', '2');
INSERT INTO `uzf_area` VALUES ('124', '9', '昌江', '2');
INSERT INTO `uzf_area` VALUES ('125', '9', '澄迈县', '2');
INSERT INTO `uzf_area` VALUES ('126', '9', '定安县', '2');
INSERT INTO `uzf_area` VALUES ('127', '9', '东方', '2');
INSERT INTO `uzf_area` VALUES ('128', '9', '乐东', '2');
INSERT INTO `uzf_area` VALUES ('129', '9', '临高县', '2');
INSERT INTO `uzf_area` VALUES ('130', '9', '陵水', '2');
INSERT INTO `uzf_area` VALUES ('131', '9', '琼海', '2');
INSERT INTO `uzf_area` VALUES ('132', '9', '琼中', '2');
INSERT INTO `uzf_area` VALUES ('133', '9', '屯昌县', '2');
INSERT INTO `uzf_area` VALUES ('134', '9', '万宁', '2');
INSERT INTO `uzf_area` VALUES ('135', '9', '文昌', '2');
INSERT INTO `uzf_area` VALUES ('136', '9', '五指山', '2');
INSERT INTO `uzf_area` VALUES ('137', '9', '儋州', '2');
INSERT INTO `uzf_area` VALUES ('138', '10', '石家庄', '2');
INSERT INTO `uzf_area` VALUES ('139', '10', '保定', '2');
INSERT INTO `uzf_area` VALUES ('140', '10', '沧州', '2');
INSERT INTO `uzf_area` VALUES ('141', '10', '承德', '2');
INSERT INTO `uzf_area` VALUES ('142', '10', '邯郸', '2');
INSERT INTO `uzf_area` VALUES ('143', '10', '衡水', '2');
INSERT INTO `uzf_area` VALUES ('144', '10', '廊坊', '2');
INSERT INTO `uzf_area` VALUES ('145', '10', '秦皇岛', '2');
INSERT INTO `uzf_area` VALUES ('146', '10', '唐山', '2');
INSERT INTO `uzf_area` VALUES ('147', '10', '邢台', '2');
INSERT INTO `uzf_area` VALUES ('148', '10', '张家口', '2');
INSERT INTO `uzf_area` VALUES ('149', '11', '郑州', '2');
INSERT INTO `uzf_area` VALUES ('150', '11', '洛阳', '2');
INSERT INTO `uzf_area` VALUES ('151', '11', '开封', '2');
INSERT INTO `uzf_area` VALUES ('152', '11', '安阳', '2');
INSERT INTO `uzf_area` VALUES ('153', '11', '鹤壁', '2');
INSERT INTO `uzf_area` VALUES ('154', '11', '济源', '2');
INSERT INTO `uzf_area` VALUES ('155', '11', '焦作', '2');
INSERT INTO `uzf_area` VALUES ('156', '11', '南阳', '2');
INSERT INTO `uzf_area` VALUES ('157', '11', '平顶山', '2');
INSERT INTO `uzf_area` VALUES ('158', '11', '三门峡', '2');
INSERT INTO `uzf_area` VALUES ('159', '11', '商丘', '2');
INSERT INTO `uzf_area` VALUES ('160', '11', '新乡', '2');
INSERT INTO `uzf_area` VALUES ('161', '11', '信阳', '2');
INSERT INTO `uzf_area` VALUES ('162', '11', '许昌', '2');
INSERT INTO `uzf_area` VALUES ('163', '11', '周口', '2');
INSERT INTO `uzf_area` VALUES ('164', '11', '驻马店', '2');
INSERT INTO `uzf_area` VALUES ('165', '11', '漯河', '2');
INSERT INTO `uzf_area` VALUES ('166', '11', '濮阳', '2');
INSERT INTO `uzf_area` VALUES ('167', '12', '哈尔滨', '2');
INSERT INTO `uzf_area` VALUES ('168', '12', '大庆', '2');
INSERT INTO `uzf_area` VALUES ('169', '12', '大兴安岭', '2');
INSERT INTO `uzf_area` VALUES ('170', '12', '鹤岗', '2');
INSERT INTO `uzf_area` VALUES ('171', '12', '黑河', '2');
INSERT INTO `uzf_area` VALUES ('172', '12', '鸡西', '2');
INSERT INTO `uzf_area` VALUES ('173', '12', '佳木斯', '2');
INSERT INTO `uzf_area` VALUES ('174', '12', '牡丹江', '2');
INSERT INTO `uzf_area` VALUES ('175', '12', '七台河', '2');
INSERT INTO `uzf_area` VALUES ('176', '12', '齐齐哈尔', '2');
INSERT INTO `uzf_area` VALUES ('177', '12', '双鸭山', '2');
INSERT INTO `uzf_area` VALUES ('178', '12', '绥化', '2');
INSERT INTO `uzf_area` VALUES ('179', '12', '伊春', '2');
INSERT INTO `uzf_area` VALUES ('180', '13', '武汉', '2');
INSERT INTO `uzf_area` VALUES ('181', '13', '仙桃', '2');
INSERT INTO `uzf_area` VALUES ('182', '13', '鄂州', '2');
INSERT INTO `uzf_area` VALUES ('183', '13', '黄冈', '2');
INSERT INTO `uzf_area` VALUES ('184', '13', '黄石', '2');
INSERT INTO `uzf_area` VALUES ('185', '13', '荆门', '2');
INSERT INTO `uzf_area` VALUES ('186', '13', '荆州', '2');
INSERT INTO `uzf_area` VALUES ('187', '13', '潜江', '2');
INSERT INTO `uzf_area` VALUES ('188', '13', '神农架林区', '2');
INSERT INTO `uzf_area` VALUES ('189', '13', '十堰', '2');
INSERT INTO `uzf_area` VALUES ('190', '13', '随州', '2');
INSERT INTO `uzf_area` VALUES ('191', '13', '天门', '2');
INSERT INTO `uzf_area` VALUES ('192', '13', '咸宁', '2');
INSERT INTO `uzf_area` VALUES ('193', '13', '襄樊', '2');
INSERT INTO `uzf_area` VALUES ('194', '13', '孝感', '2');
INSERT INTO `uzf_area` VALUES ('195', '13', '宜昌', '2');
INSERT INTO `uzf_area` VALUES ('196', '13', '恩施', '2');
INSERT INTO `uzf_area` VALUES ('197', '14', '长沙', '2');
INSERT INTO `uzf_area` VALUES ('198', '14', '张家界', '2');
INSERT INTO `uzf_area` VALUES ('199', '14', '常德', '2');
INSERT INTO `uzf_area` VALUES ('200', '14', '郴州', '2');
INSERT INTO `uzf_area` VALUES ('201', '14', '衡阳', '2');
INSERT INTO `uzf_area` VALUES ('202', '14', '怀化', '2');
INSERT INTO `uzf_area` VALUES ('203', '14', '娄底', '2');
INSERT INTO `uzf_area` VALUES ('204', '14', '邵阳', '2');
INSERT INTO `uzf_area` VALUES ('205', '14', '湘潭', '2');
INSERT INTO `uzf_area` VALUES ('206', '14', '湘西', '2');
INSERT INTO `uzf_area` VALUES ('207', '14', '益阳', '2');
INSERT INTO `uzf_area` VALUES ('208', '14', '永州', '2');
INSERT INTO `uzf_area` VALUES ('209', '14', '岳阳', '2');
INSERT INTO `uzf_area` VALUES ('210', '14', '株洲', '2');
INSERT INTO `uzf_area` VALUES ('211', '15', '长春', '2');
INSERT INTO `uzf_area` VALUES ('212', '15', '吉林', '2');
INSERT INTO `uzf_area` VALUES ('213', '15', '白城', '2');
INSERT INTO `uzf_area` VALUES ('214', '15', '白山', '2');
INSERT INTO `uzf_area` VALUES ('215', '15', '辽源', '2');
INSERT INTO `uzf_area` VALUES ('216', '15', '四平', '2');
INSERT INTO `uzf_area` VALUES ('217', '15', '松原', '2');
INSERT INTO `uzf_area` VALUES ('218', '15', '通化', '2');
INSERT INTO `uzf_area` VALUES ('219', '15', '延边', '2');
INSERT INTO `uzf_area` VALUES ('220', '16', '南京', '2');
INSERT INTO `uzf_area` VALUES ('221', '16', '苏州', '2');
INSERT INTO `uzf_area` VALUES ('222', '16', '无锡', '2');
INSERT INTO `uzf_area` VALUES ('223', '16', '常州', '2');
INSERT INTO `uzf_area` VALUES ('224', '16', '淮安', '2');
INSERT INTO `uzf_area` VALUES ('225', '16', '连云港', '2');
INSERT INTO `uzf_area` VALUES ('226', '16', '南通', '2');
INSERT INTO `uzf_area` VALUES ('227', '16', '宿迁', '2');
INSERT INTO `uzf_area` VALUES ('228', '16', '泰州', '2');
INSERT INTO `uzf_area` VALUES ('229', '16', '徐州', '2');
INSERT INTO `uzf_area` VALUES ('230', '16', '盐城', '2');
INSERT INTO `uzf_area` VALUES ('231', '16', '扬州', '2');
INSERT INTO `uzf_area` VALUES ('232', '16', '镇江', '2');
INSERT INTO `uzf_area` VALUES ('233', '17', '南昌', '2');
INSERT INTO `uzf_area` VALUES ('234', '17', '抚州', '2');
INSERT INTO `uzf_area` VALUES ('235', '17', '赣州', '2');
INSERT INTO `uzf_area` VALUES ('236', '17', '吉安', '2');
INSERT INTO `uzf_area` VALUES ('237', '17', '景德镇', '2');
INSERT INTO `uzf_area` VALUES ('238', '17', '九江', '2');
INSERT INTO `uzf_area` VALUES ('239', '17', '萍乡', '2');
INSERT INTO `uzf_area` VALUES ('240', '17', '上饶', '2');
INSERT INTO `uzf_area` VALUES ('241', '17', '新余', '2');
INSERT INTO `uzf_area` VALUES ('242', '17', '宜春', '2');
INSERT INTO `uzf_area` VALUES ('243', '17', '鹰潭', '2');
INSERT INTO `uzf_area` VALUES ('244', '18', '沈阳', '2');
INSERT INTO `uzf_area` VALUES ('245', '18', '大连', '2');
INSERT INTO `uzf_area` VALUES ('246', '18', '鞍山', '2');
INSERT INTO `uzf_area` VALUES ('247', '18', '本溪', '2');
INSERT INTO `uzf_area` VALUES ('248', '18', '朝阳', '2');
INSERT INTO `uzf_area` VALUES ('249', '18', '丹东', '2');
INSERT INTO `uzf_area` VALUES ('250', '18', '抚顺', '2');
INSERT INTO `uzf_area` VALUES ('251', '18', '阜新', '2');
INSERT INTO `uzf_area` VALUES ('252', '18', '葫芦岛', '2');
INSERT INTO `uzf_area` VALUES ('253', '18', '锦州', '2');
INSERT INTO `uzf_area` VALUES ('254', '18', '辽阳', '2');
INSERT INTO `uzf_area` VALUES ('255', '18', '盘锦', '2');
INSERT INTO `uzf_area` VALUES ('256', '18', '铁岭', '2');
INSERT INTO `uzf_area` VALUES ('257', '18', '营口', '2');
INSERT INTO `uzf_area` VALUES ('258', '19', '呼和浩特', '2');
INSERT INTO `uzf_area` VALUES ('259', '19', '阿拉善盟', '2');
INSERT INTO `uzf_area` VALUES ('260', '19', '巴彦淖尔盟', '2');
INSERT INTO `uzf_area` VALUES ('261', '19', '包头', '2');
INSERT INTO `uzf_area` VALUES ('262', '19', '赤峰', '2');
INSERT INTO `uzf_area` VALUES ('263', '19', '鄂尔多斯', '2');
INSERT INTO `uzf_area` VALUES ('264', '19', '呼伦贝尔', '2');
INSERT INTO `uzf_area` VALUES ('265', '19', '通辽', '2');
INSERT INTO `uzf_area` VALUES ('266', '19', '乌海', '2');
INSERT INTO `uzf_area` VALUES ('267', '19', '乌兰察布市', '2');
INSERT INTO `uzf_area` VALUES ('268', '19', '锡林郭勒盟', '2');
INSERT INTO `uzf_area` VALUES ('269', '19', '兴安盟', '2');
INSERT INTO `uzf_area` VALUES ('270', '20', '银川', '2');
INSERT INTO `uzf_area` VALUES ('271', '20', '固原', '2');
INSERT INTO `uzf_area` VALUES ('272', '20', '石嘴山', '2');
INSERT INTO `uzf_area` VALUES ('273', '20', '吴忠', '2');
INSERT INTO `uzf_area` VALUES ('274', '20', '中卫', '2');
INSERT INTO `uzf_area` VALUES ('275', '21', '西宁', '2');
INSERT INTO `uzf_area` VALUES ('276', '21', '果洛', '2');
INSERT INTO `uzf_area` VALUES ('277', '21', '海北', '2');
INSERT INTO `uzf_area` VALUES ('278', '21', '海东', '2');
INSERT INTO `uzf_area` VALUES ('279', '21', '海南', '2');
INSERT INTO `uzf_area` VALUES ('280', '21', '海西', '2');
INSERT INTO `uzf_area` VALUES ('281', '21', '黄南', '2');
INSERT INTO `uzf_area` VALUES ('282', '21', '玉树', '2');
INSERT INTO `uzf_area` VALUES ('283', '22', '济南', '2');
INSERT INTO `uzf_area` VALUES ('284', '22', '青岛', '2');
INSERT INTO `uzf_area` VALUES ('285', '22', '滨州', '2');
INSERT INTO `uzf_area` VALUES ('286', '22', '德州', '2');
INSERT INTO `uzf_area` VALUES ('287', '22', '东营', '2');
INSERT INTO `uzf_area` VALUES ('288', '22', '菏泽', '2');
INSERT INTO `uzf_area` VALUES ('289', '22', '济宁', '2');
INSERT INTO `uzf_area` VALUES ('290', '22', '莱芜', '2');
INSERT INTO `uzf_area` VALUES ('291', '22', '聊城', '2');
INSERT INTO `uzf_area` VALUES ('292', '22', '临沂', '2');
INSERT INTO `uzf_area` VALUES ('293', '22', '日照', '2');
INSERT INTO `uzf_area` VALUES ('294', '22', '泰安', '2');
INSERT INTO `uzf_area` VALUES ('295', '22', '威海', '2');
INSERT INTO `uzf_area` VALUES ('296', '22', '潍坊', '2');
INSERT INTO `uzf_area` VALUES ('297', '22', '烟台', '2');
INSERT INTO `uzf_area` VALUES ('298', '22', '枣庄', '2');
INSERT INTO `uzf_area` VALUES ('299', '22', '淄博', '2');
INSERT INTO `uzf_area` VALUES ('300', '23', '太原', '2');
INSERT INTO `uzf_area` VALUES ('301', '23', '长治', '2');
INSERT INTO `uzf_area` VALUES ('302', '23', '大同', '2');
INSERT INTO `uzf_area` VALUES ('303', '23', '晋城', '2');
INSERT INTO `uzf_area` VALUES ('304', '23', '晋中', '2');
INSERT INTO `uzf_area` VALUES ('305', '23', '临汾', '2');
INSERT INTO `uzf_area` VALUES ('306', '23', '吕梁', '2');
INSERT INTO `uzf_area` VALUES ('307', '23', '朔州', '2');
INSERT INTO `uzf_area` VALUES ('308', '23', '忻州', '2');
INSERT INTO `uzf_area` VALUES ('309', '23', '阳泉', '2');
INSERT INTO `uzf_area` VALUES ('310', '23', '运城', '2');
INSERT INTO `uzf_area` VALUES ('311', '24', '西安', '2');
INSERT INTO `uzf_area` VALUES ('312', '24', '安康', '2');
INSERT INTO `uzf_area` VALUES ('313', '24', '宝鸡', '2');
INSERT INTO `uzf_area` VALUES ('314', '24', '汉中', '2');
INSERT INTO `uzf_area` VALUES ('315', '24', '商洛', '2');
INSERT INTO `uzf_area` VALUES ('316', '24', '铜川', '2');
INSERT INTO `uzf_area` VALUES ('317', '24', '渭南', '2');
INSERT INTO `uzf_area` VALUES ('318', '24', '咸阳', '2');
INSERT INTO `uzf_area` VALUES ('319', '24', '延安', '2');
INSERT INTO `uzf_area` VALUES ('320', '24', '榆林', '2');
INSERT INTO `uzf_area` VALUES ('321', '25', '上海', '2');
INSERT INTO `uzf_area` VALUES ('322', '26', '成都', '2');
INSERT INTO `uzf_area` VALUES ('323', '26', '绵阳', '2');
INSERT INTO `uzf_area` VALUES ('324', '26', '阿坝', '2');
INSERT INTO `uzf_area` VALUES ('325', '26', '巴中', '2');
INSERT INTO `uzf_area` VALUES ('326', '26', '达州', '2');
INSERT INTO `uzf_area` VALUES ('327', '26', '德阳', '2');
INSERT INTO `uzf_area` VALUES ('328', '26', '甘孜', '2');
INSERT INTO `uzf_area` VALUES ('329', '26', '广安', '2');
INSERT INTO `uzf_area` VALUES ('330', '26', '广元', '2');
INSERT INTO `uzf_area` VALUES ('331', '26', '乐山', '2');
INSERT INTO `uzf_area` VALUES ('332', '26', '凉山', '2');
INSERT INTO `uzf_area` VALUES ('333', '26', '眉山', '2');
INSERT INTO `uzf_area` VALUES ('334', '26', '南充', '2');
INSERT INTO `uzf_area` VALUES ('335', '26', '内江', '2');
INSERT INTO `uzf_area` VALUES ('336', '26', '攀枝花', '2');
INSERT INTO `uzf_area` VALUES ('337', '26', '遂宁', '2');
INSERT INTO `uzf_area` VALUES ('338', '26', '雅安', '2');
INSERT INTO `uzf_area` VALUES ('339', '26', '宜宾', '2');
INSERT INTO `uzf_area` VALUES ('340', '26', '资阳', '2');
INSERT INTO `uzf_area` VALUES ('341', '26', '自贡', '2');
INSERT INTO `uzf_area` VALUES ('342', '26', '泸州', '2');
INSERT INTO `uzf_area` VALUES ('343', '27', '天津', '2');
INSERT INTO `uzf_area` VALUES ('344', '28', '拉萨', '2');
INSERT INTO `uzf_area` VALUES ('345', '28', '阿里', '2');
INSERT INTO `uzf_area` VALUES ('346', '28', '昌都', '2');
INSERT INTO `uzf_area` VALUES ('347', '28', '林芝', '2');
INSERT INTO `uzf_area` VALUES ('348', '28', '那曲', '2');
INSERT INTO `uzf_area` VALUES ('349', '28', '日喀则', '2');
INSERT INTO `uzf_area` VALUES ('350', '28', '山南', '2');
INSERT INTO `uzf_area` VALUES ('351', '29', '乌鲁木齐', '2');
INSERT INTO `uzf_area` VALUES ('352', '29', '阿克苏', '2');
INSERT INTO `uzf_area` VALUES ('353', '29', '阿拉尔', '2');
INSERT INTO `uzf_area` VALUES ('354', '29', '巴音郭楞', '2');
INSERT INTO `uzf_area` VALUES ('355', '29', '博尔塔拉', '2');
INSERT INTO `uzf_area` VALUES ('356', '29', '昌吉', '2');
INSERT INTO `uzf_area` VALUES ('357', '29', '哈密', '2');
INSERT INTO `uzf_area` VALUES ('358', '29', '和田', '2');
INSERT INTO `uzf_area` VALUES ('359', '29', '喀什', '2');
INSERT INTO `uzf_area` VALUES ('360', '29', '克拉玛依', '2');
INSERT INTO `uzf_area` VALUES ('361', '29', '克孜勒苏', '2');
INSERT INTO `uzf_area` VALUES ('362', '29', '石河子', '2');
INSERT INTO `uzf_area` VALUES ('363', '29', '图木舒克', '2');
INSERT INTO `uzf_area` VALUES ('364', '29', '吐鲁番', '2');
INSERT INTO `uzf_area` VALUES ('365', '29', '五家渠', '2');
INSERT INTO `uzf_area` VALUES ('366', '29', '伊犁', '2');
INSERT INTO `uzf_area` VALUES ('367', '30', '昆明', '2');
INSERT INTO `uzf_area` VALUES ('368', '30', '怒江', '2');
INSERT INTO `uzf_area` VALUES ('369', '30', '普洱', '2');
INSERT INTO `uzf_area` VALUES ('370', '30', '丽江', '2');
INSERT INTO `uzf_area` VALUES ('371', '30', '保山', '2');
INSERT INTO `uzf_area` VALUES ('372', '30', '楚雄', '2');
INSERT INTO `uzf_area` VALUES ('373', '30', '大理', '2');
INSERT INTO `uzf_area` VALUES ('374', '30', '德宏', '2');
INSERT INTO `uzf_area` VALUES ('375', '30', '迪庆', '2');
INSERT INTO `uzf_area` VALUES ('376', '30', '红河', '2');
INSERT INTO `uzf_area` VALUES ('377', '30', '临沧', '2');
INSERT INTO `uzf_area` VALUES ('378', '30', '曲靖', '2');
INSERT INTO `uzf_area` VALUES ('379', '30', '文山', '2');
INSERT INTO `uzf_area` VALUES ('380', '30', '西双版纳', '2');
INSERT INTO `uzf_area` VALUES ('381', '30', '玉溪', '2');
INSERT INTO `uzf_area` VALUES ('382', '30', '昭通', '2');
INSERT INTO `uzf_area` VALUES ('383', '31', '杭州', '2');
INSERT INTO `uzf_area` VALUES ('384', '31', '湖州', '2');
INSERT INTO `uzf_area` VALUES ('385', '31', '嘉兴', '2');
INSERT INTO `uzf_area` VALUES ('386', '31', '金华', '2');
INSERT INTO `uzf_area` VALUES ('387', '31', '丽水', '2');
INSERT INTO `uzf_area` VALUES ('388', '31', '宁波', '2');
INSERT INTO `uzf_area` VALUES ('389', '31', '绍兴', '2');
INSERT INTO `uzf_area` VALUES ('390', '31', '台州', '2');
INSERT INTO `uzf_area` VALUES ('391', '31', '温州', '2');
INSERT INTO `uzf_area` VALUES ('392', '31', '舟山', '2');
INSERT INTO `uzf_area` VALUES ('393', '31', '衢州', '2');
INSERT INTO `uzf_area` VALUES ('394', '32', '重庆', '2');
INSERT INTO `uzf_area` VALUES ('395', '33', '香港', '2');
INSERT INTO `uzf_area` VALUES ('396', '34', '澳门', '2');
INSERT INTO `uzf_area` VALUES ('397', '35', '台湾', '2');
INSERT INTO `uzf_area` VALUES ('398', '36', '迎江区', '3');
INSERT INTO `uzf_area` VALUES ('399', '36', '大观区', '3');
INSERT INTO `uzf_area` VALUES ('400', '36', '宜秀区', '3');
INSERT INTO `uzf_area` VALUES ('401', '36', '桐城市', '3');
INSERT INTO `uzf_area` VALUES ('402', '36', '怀宁县', '3');
INSERT INTO `uzf_area` VALUES ('403', '36', '枞阳县', '3');
INSERT INTO `uzf_area` VALUES ('404', '36', '潜山县', '3');
INSERT INTO `uzf_area` VALUES ('405', '36', '太湖县', '3');
INSERT INTO `uzf_area` VALUES ('406', '36', '宿松县', '3');
INSERT INTO `uzf_area` VALUES ('407', '36', '望江县', '3');
INSERT INTO `uzf_area` VALUES ('408', '36', '岳西县', '3');
INSERT INTO `uzf_area` VALUES ('409', '37', '中市区', '3');
INSERT INTO `uzf_area` VALUES ('410', '37', '东市区', '3');
INSERT INTO `uzf_area` VALUES ('411', '37', '西市区', '3');
INSERT INTO `uzf_area` VALUES ('412', '37', '郊区', '3');
INSERT INTO `uzf_area` VALUES ('413', '37', '怀远县', '3');
INSERT INTO `uzf_area` VALUES ('414', '37', '五河县', '3');
INSERT INTO `uzf_area` VALUES ('415', '37', '固镇县', '3');
INSERT INTO `uzf_area` VALUES ('416', '38', '居巢区', '3');
INSERT INTO `uzf_area` VALUES ('417', '38', '庐江县', '3');
INSERT INTO `uzf_area` VALUES ('418', '38', '无为县', '3');
INSERT INTO `uzf_area` VALUES ('419', '38', '含山县', '3');
INSERT INTO `uzf_area` VALUES ('420', '38', '和县', '3');
INSERT INTO `uzf_area` VALUES ('421', '39', '贵池区', '3');
INSERT INTO `uzf_area` VALUES ('422', '39', '东至县', '3');
INSERT INTO `uzf_area` VALUES ('423', '39', '石台县', '3');
INSERT INTO `uzf_area` VALUES ('424', '39', '青阳县', '3');
INSERT INTO `uzf_area` VALUES ('425', '40', '琅琊区', '3');
INSERT INTO `uzf_area` VALUES ('426', '40', '南谯区', '3');
INSERT INTO `uzf_area` VALUES ('427', '40', '天长市', '3');
INSERT INTO `uzf_area` VALUES ('428', '40', '明光市', '3');
INSERT INTO `uzf_area` VALUES ('429', '40', '来安县', '3');
INSERT INTO `uzf_area` VALUES ('430', '40', '全椒县', '3');
INSERT INTO `uzf_area` VALUES ('431', '40', '定远县', '3');
INSERT INTO `uzf_area` VALUES ('432', '40', '凤阳县', '3');
INSERT INTO `uzf_area` VALUES ('433', '41', '蚌山区', '3');
INSERT INTO `uzf_area` VALUES ('434', '41', '龙子湖区', '3');
INSERT INTO `uzf_area` VALUES ('435', '41', '禹会区', '3');
INSERT INTO `uzf_area` VALUES ('436', '41', '淮上区', '3');
INSERT INTO `uzf_area` VALUES ('437', '41', '颍州区', '3');
INSERT INTO `uzf_area` VALUES ('438', '41', '颍东区', '3');
INSERT INTO `uzf_area` VALUES ('439', '41', '颍泉区', '3');
INSERT INTO `uzf_area` VALUES ('440', '41', '界首市', '3');
INSERT INTO `uzf_area` VALUES ('441', '41', '临泉县', '3');
INSERT INTO `uzf_area` VALUES ('442', '41', '太和县', '3');
INSERT INTO `uzf_area` VALUES ('443', '41', '阜南县', '3');
INSERT INTO `uzf_area` VALUES ('444', '41', '颖上县', '3');
INSERT INTO `uzf_area` VALUES ('445', '42', '相山区', '3');
INSERT INTO `uzf_area` VALUES ('446', '42', '杜集区', '3');
INSERT INTO `uzf_area` VALUES ('447', '42', '烈山区', '3');
INSERT INTO `uzf_area` VALUES ('448', '42', '濉溪县', '3');
INSERT INTO `uzf_area` VALUES ('449', '43', '田家庵区', '3');
INSERT INTO `uzf_area` VALUES ('450', '43', '大通区', '3');
INSERT INTO `uzf_area` VALUES ('451', '43', '谢家集区', '3');
INSERT INTO `uzf_area` VALUES ('452', '43', '八公山区', '3');
INSERT INTO `uzf_area` VALUES ('453', '43', '潘集区', '3');
INSERT INTO `uzf_area` VALUES ('454', '43', '凤台县', '3');
INSERT INTO `uzf_area` VALUES ('455', '44', '屯溪区', '3');
INSERT INTO `uzf_area` VALUES ('456', '44', '黄山区', '3');
INSERT INTO `uzf_area` VALUES ('457', '44', '徽州区', '3');
INSERT INTO `uzf_area` VALUES ('458', '44', '歙县', '3');
INSERT INTO `uzf_area` VALUES ('459', '44', '休宁县', '3');
INSERT INTO `uzf_area` VALUES ('460', '44', '黟县', '3');
INSERT INTO `uzf_area` VALUES ('461', '44', '祁门县', '3');
INSERT INTO `uzf_area` VALUES ('462', '45', '金安区', '3');
INSERT INTO `uzf_area` VALUES ('463', '45', '裕安区', '3');
INSERT INTO `uzf_area` VALUES ('464', '45', '寿县', '3');
INSERT INTO `uzf_area` VALUES ('465', '45', '霍邱县', '3');
INSERT INTO `uzf_area` VALUES ('466', '45', '舒城县', '3');
INSERT INTO `uzf_area` VALUES ('467', '45', '金寨县', '3');
INSERT INTO `uzf_area` VALUES ('468', '45', '霍山县', '3');
INSERT INTO `uzf_area` VALUES ('469', '46', '雨山区', '3');
INSERT INTO `uzf_area` VALUES ('470', '46', '花山区', '3');
INSERT INTO `uzf_area` VALUES ('471', '46', '金家庄区', '3');
INSERT INTO `uzf_area` VALUES ('472', '46', '当涂县', '3');
INSERT INTO `uzf_area` VALUES ('473', '47', '埇桥区', '3');
INSERT INTO `uzf_area` VALUES ('474', '47', '砀山县', '3');
INSERT INTO `uzf_area` VALUES ('475', '47', '萧县', '3');
INSERT INTO `uzf_area` VALUES ('476', '47', '灵璧县', '3');
INSERT INTO `uzf_area` VALUES ('477', '47', '泗县', '3');
INSERT INTO `uzf_area` VALUES ('478', '48', '铜官山区', '3');
INSERT INTO `uzf_area` VALUES ('479', '48', '狮子山区', '3');
INSERT INTO `uzf_area` VALUES ('480', '48', '郊区', '3');
INSERT INTO `uzf_area` VALUES ('481', '48', '铜陵县', '3');
INSERT INTO `uzf_area` VALUES ('482', '49', '镜湖区', '3');
INSERT INTO `uzf_area` VALUES ('483', '49', '弋江区', '3');
INSERT INTO `uzf_area` VALUES ('484', '49', '鸠江区', '3');
INSERT INTO `uzf_area` VALUES ('485', '49', '三山区', '3');
INSERT INTO `uzf_area` VALUES ('486', '49', '芜湖县', '3');
INSERT INTO `uzf_area` VALUES ('487', '49', '繁昌县', '3');
INSERT INTO `uzf_area` VALUES ('488', '49', '南陵县', '3');
INSERT INTO `uzf_area` VALUES ('489', '50', '宣州区', '3');
INSERT INTO `uzf_area` VALUES ('490', '50', '宁国市', '3');
INSERT INTO `uzf_area` VALUES ('491', '50', '郎溪县', '3');
INSERT INTO `uzf_area` VALUES ('492', '50', '广德县', '3');
INSERT INTO `uzf_area` VALUES ('493', '50', '泾县', '3');
INSERT INTO `uzf_area` VALUES ('494', '50', '绩溪县', '3');
INSERT INTO `uzf_area` VALUES ('495', '50', '旌德县', '3');
INSERT INTO `uzf_area` VALUES ('496', '51', '涡阳县', '3');
INSERT INTO `uzf_area` VALUES ('497', '51', '蒙城县', '3');
INSERT INTO `uzf_area` VALUES ('498', '51', '利辛县', '3');
INSERT INTO `uzf_area` VALUES ('499', '51', '谯城区', '3');
INSERT INTO `uzf_area` VALUES ('500', '52', '东城区', '3');
INSERT INTO `uzf_area` VALUES ('501', '52', '西城区', '3');
INSERT INTO `uzf_area` VALUES ('502', '52', '海淀区', '3');
INSERT INTO `uzf_area` VALUES ('503', '52', '朝阳区', '3');
INSERT INTO `uzf_area` VALUES ('504', '52', '崇文区', '3');
INSERT INTO `uzf_area` VALUES ('505', '52', '宣武区', '3');
INSERT INTO `uzf_area` VALUES ('506', '52', '丰台区', '3');
INSERT INTO `uzf_area` VALUES ('507', '52', '石景山区', '3');
INSERT INTO `uzf_area` VALUES ('508', '52', '房山区', '3');
INSERT INTO `uzf_area` VALUES ('509', '52', '门头沟区', '3');
INSERT INTO `uzf_area` VALUES ('510', '52', '通州区', '3');
INSERT INTO `uzf_area` VALUES ('511', '52', '顺义区', '3');
INSERT INTO `uzf_area` VALUES ('512', '52', '昌平区', '3');
INSERT INTO `uzf_area` VALUES ('513', '52', '怀柔区', '3');
INSERT INTO `uzf_area` VALUES ('514', '52', '平谷区', '3');
INSERT INTO `uzf_area` VALUES ('515', '52', '大兴区', '3');
INSERT INTO `uzf_area` VALUES ('516', '52', '密云县', '3');
INSERT INTO `uzf_area` VALUES ('517', '52', '延庆县', '3');
INSERT INTO `uzf_area` VALUES ('518', '53', '鼓楼区', '3');
INSERT INTO `uzf_area` VALUES ('519', '53', '台江区', '3');
INSERT INTO `uzf_area` VALUES ('520', '53', '仓山区', '3');
INSERT INTO `uzf_area` VALUES ('521', '53', '马尾区', '3');
INSERT INTO `uzf_area` VALUES ('522', '53', '晋安区', '3');
INSERT INTO `uzf_area` VALUES ('523', '53', '福清市', '3');
INSERT INTO `uzf_area` VALUES ('524', '53', '长乐市', '3');
INSERT INTO `uzf_area` VALUES ('525', '53', '闽侯县', '3');
INSERT INTO `uzf_area` VALUES ('526', '53', '连江县', '3');
INSERT INTO `uzf_area` VALUES ('527', '53', '罗源县', '3');
INSERT INTO `uzf_area` VALUES ('528', '53', '闽清县', '3');
INSERT INTO `uzf_area` VALUES ('529', '53', '永泰县', '3');
INSERT INTO `uzf_area` VALUES ('530', '53', '平潭县', '3');
INSERT INTO `uzf_area` VALUES ('531', '54', '新罗区', '3');
INSERT INTO `uzf_area` VALUES ('532', '54', '漳平市', '3');
INSERT INTO `uzf_area` VALUES ('533', '54', '长汀县', '3');
INSERT INTO `uzf_area` VALUES ('534', '54', '永定县', '3');
INSERT INTO `uzf_area` VALUES ('535', '54', '上杭县', '3');
INSERT INTO `uzf_area` VALUES ('536', '54', '武平县', '3');
INSERT INTO `uzf_area` VALUES ('537', '54', '连城县', '3');
INSERT INTO `uzf_area` VALUES ('538', '55', '延平区', '3');
INSERT INTO `uzf_area` VALUES ('539', '55', '邵武市', '3');
INSERT INTO `uzf_area` VALUES ('540', '55', '武夷山市', '3');
INSERT INTO `uzf_area` VALUES ('541', '55', '建瓯市', '3');
INSERT INTO `uzf_area` VALUES ('542', '55', '建阳市', '3');
INSERT INTO `uzf_area` VALUES ('543', '55', '顺昌县', '3');
INSERT INTO `uzf_area` VALUES ('544', '55', '浦城县', '3');
INSERT INTO `uzf_area` VALUES ('545', '55', '光泽县', '3');
INSERT INTO `uzf_area` VALUES ('546', '55', '松溪县', '3');
INSERT INTO `uzf_area` VALUES ('547', '55', '政和县', '3');
INSERT INTO `uzf_area` VALUES ('548', '56', '蕉城区', '3');
INSERT INTO `uzf_area` VALUES ('549', '56', '福安市', '3');
INSERT INTO `uzf_area` VALUES ('550', '56', '福鼎市', '3');
INSERT INTO `uzf_area` VALUES ('551', '56', '霞浦县', '3');
INSERT INTO `uzf_area` VALUES ('552', '56', '古田县', '3');
INSERT INTO `uzf_area` VALUES ('553', '56', '屏南县', '3');
INSERT INTO `uzf_area` VALUES ('554', '56', '寿宁县', '3');
INSERT INTO `uzf_area` VALUES ('555', '56', '周宁县', '3');
INSERT INTO `uzf_area` VALUES ('556', '56', '柘荣县', '3');
INSERT INTO `uzf_area` VALUES ('557', '57', '城厢区', '3');
INSERT INTO `uzf_area` VALUES ('558', '57', '涵江区', '3');
INSERT INTO `uzf_area` VALUES ('559', '57', '荔城区', '3');
INSERT INTO `uzf_area` VALUES ('560', '57', '秀屿区', '3');
INSERT INTO `uzf_area` VALUES ('561', '57', '仙游县', '3');
INSERT INTO `uzf_area` VALUES ('562', '58', '鲤城区', '3');
INSERT INTO `uzf_area` VALUES ('563', '58', '丰泽区', '3');
INSERT INTO `uzf_area` VALUES ('564', '58', '洛江区', '3');
INSERT INTO `uzf_area` VALUES ('565', '58', '清濛开发区', '3');
INSERT INTO `uzf_area` VALUES ('566', '58', '泉港区', '3');
INSERT INTO `uzf_area` VALUES ('567', '58', '石狮市', '3');
INSERT INTO `uzf_area` VALUES ('568', '58', '晋江市', '3');
INSERT INTO `uzf_area` VALUES ('569', '58', '南安市', '3');
INSERT INTO `uzf_area` VALUES ('570', '58', '惠安县', '3');
INSERT INTO `uzf_area` VALUES ('571', '58', '安溪县', '3');
INSERT INTO `uzf_area` VALUES ('572', '58', '永春县', '3');
INSERT INTO `uzf_area` VALUES ('573', '58', '德化县', '3');
INSERT INTO `uzf_area` VALUES ('574', '58', '金门县', '3');
INSERT INTO `uzf_area` VALUES ('575', '59', '梅列区', '3');
INSERT INTO `uzf_area` VALUES ('576', '59', '三元区', '3');
INSERT INTO `uzf_area` VALUES ('577', '59', '永安市', '3');
INSERT INTO `uzf_area` VALUES ('578', '59', '明溪县', '3');
INSERT INTO `uzf_area` VALUES ('579', '59', '清流县', '3');
INSERT INTO `uzf_area` VALUES ('580', '59', '宁化县', '3');
INSERT INTO `uzf_area` VALUES ('581', '59', '大田县', '3');
INSERT INTO `uzf_area` VALUES ('582', '59', '尤溪县', '3');
INSERT INTO `uzf_area` VALUES ('583', '59', '沙县', '3');
INSERT INTO `uzf_area` VALUES ('584', '59', '将乐县', '3');
INSERT INTO `uzf_area` VALUES ('585', '59', '泰宁县', '3');
INSERT INTO `uzf_area` VALUES ('586', '59', '建宁县', '3');
INSERT INTO `uzf_area` VALUES ('587', '60', '思明区', '3');
INSERT INTO `uzf_area` VALUES ('588', '60', '海沧区', '3');
INSERT INTO `uzf_area` VALUES ('589', '60', '湖里区', '3');
INSERT INTO `uzf_area` VALUES ('590', '60', '集美区', '3');
INSERT INTO `uzf_area` VALUES ('591', '60', '同安区', '3');
INSERT INTO `uzf_area` VALUES ('592', '60', '翔安区', '3');
INSERT INTO `uzf_area` VALUES ('593', '61', '芗城区', '3');
INSERT INTO `uzf_area` VALUES ('594', '61', '龙文区', '3');
INSERT INTO `uzf_area` VALUES ('595', '61', '龙海市', '3');
INSERT INTO `uzf_area` VALUES ('596', '61', '云霄县', '3');
INSERT INTO `uzf_area` VALUES ('597', '61', '漳浦县', '3');
INSERT INTO `uzf_area` VALUES ('598', '61', '诏安县', '3');
INSERT INTO `uzf_area` VALUES ('599', '61', '长泰县', '3');
INSERT INTO `uzf_area` VALUES ('600', '61', '东山县', '3');
INSERT INTO `uzf_area` VALUES ('601', '61', '南靖县', '3');
INSERT INTO `uzf_area` VALUES ('602', '61', '平和县', '3');
INSERT INTO `uzf_area` VALUES ('603', '61', '华安县', '3');
INSERT INTO `uzf_area` VALUES ('604', '62', '皋兰县', '3');
INSERT INTO `uzf_area` VALUES ('605', '62', '城关区', '3');
INSERT INTO `uzf_area` VALUES ('606', '62', '七里河区', '3');
INSERT INTO `uzf_area` VALUES ('607', '62', '西固区', '3');
INSERT INTO `uzf_area` VALUES ('608', '62', '安宁区', '3');
INSERT INTO `uzf_area` VALUES ('609', '62', '红古区', '3');
INSERT INTO `uzf_area` VALUES ('610', '62', '永登县', '3');
INSERT INTO `uzf_area` VALUES ('611', '62', '榆中县', '3');
INSERT INTO `uzf_area` VALUES ('612', '63', '白银区', '3');
INSERT INTO `uzf_area` VALUES ('613', '63', '平川区', '3');
INSERT INTO `uzf_area` VALUES ('614', '63', '会宁县', '3');
INSERT INTO `uzf_area` VALUES ('615', '63', '景泰县', '3');
INSERT INTO `uzf_area` VALUES ('616', '63', '靖远县', '3');
INSERT INTO `uzf_area` VALUES ('617', '64', '临洮县', '3');
INSERT INTO `uzf_area` VALUES ('618', '64', '陇西县', '3');
INSERT INTO `uzf_area` VALUES ('619', '64', '通渭县', '3');
INSERT INTO `uzf_area` VALUES ('620', '64', '渭源县', '3');
INSERT INTO `uzf_area` VALUES ('621', '64', '漳县', '3');
INSERT INTO `uzf_area` VALUES ('622', '64', '岷县', '3');
INSERT INTO `uzf_area` VALUES ('623', '64', '安定区', '3');
INSERT INTO `uzf_area` VALUES ('624', '64', '安定区', '3');
INSERT INTO `uzf_area` VALUES ('625', '65', '合作市', '3');
INSERT INTO `uzf_area` VALUES ('626', '65', '临潭县', '3');
INSERT INTO `uzf_area` VALUES ('627', '65', '卓尼县', '3');
INSERT INTO `uzf_area` VALUES ('628', '65', '舟曲县', '3');
INSERT INTO `uzf_area` VALUES ('629', '65', '迭部县', '3');
INSERT INTO `uzf_area` VALUES ('630', '65', '玛曲县', '3');
INSERT INTO `uzf_area` VALUES ('631', '65', '碌曲县', '3');
INSERT INTO `uzf_area` VALUES ('632', '65', '夏河县', '3');
INSERT INTO `uzf_area` VALUES ('633', '66', '嘉峪关市', '3');
INSERT INTO `uzf_area` VALUES ('634', '67', '金川区', '3');
INSERT INTO `uzf_area` VALUES ('635', '67', '永昌县', '3');
INSERT INTO `uzf_area` VALUES ('636', '68', '肃州区', '3');
INSERT INTO `uzf_area` VALUES ('637', '68', '玉门市', '3');
INSERT INTO `uzf_area` VALUES ('638', '68', '敦煌市', '3');
INSERT INTO `uzf_area` VALUES ('639', '68', '金塔县', '3');
INSERT INTO `uzf_area` VALUES ('640', '68', '瓜州县', '3');
INSERT INTO `uzf_area` VALUES ('641', '68', '肃北', '3');
INSERT INTO `uzf_area` VALUES ('642', '68', '阿克塞', '3');
INSERT INTO `uzf_area` VALUES ('643', '69', '临夏市', '3');
INSERT INTO `uzf_area` VALUES ('644', '69', '临夏县', '3');
INSERT INTO `uzf_area` VALUES ('645', '69', '康乐县', '3');
INSERT INTO `uzf_area` VALUES ('646', '69', '永靖县', '3');
INSERT INTO `uzf_area` VALUES ('647', '69', '广河县', '3');
INSERT INTO `uzf_area` VALUES ('648', '69', '和政县', '3');
INSERT INTO `uzf_area` VALUES ('649', '69', '东乡族自治县', '3');
INSERT INTO `uzf_area` VALUES ('650', '69', '积石山', '3');
INSERT INTO `uzf_area` VALUES ('651', '70', '成县', '3');
INSERT INTO `uzf_area` VALUES ('652', '70', '徽县', '3');
INSERT INTO `uzf_area` VALUES ('653', '70', '康县', '3');
INSERT INTO `uzf_area` VALUES ('654', '70', '礼县', '3');
INSERT INTO `uzf_area` VALUES ('655', '70', '两当县', '3');
INSERT INTO `uzf_area` VALUES ('656', '70', '文县', '3');
INSERT INTO `uzf_area` VALUES ('657', '70', '西和县', '3');
INSERT INTO `uzf_area` VALUES ('658', '70', '宕昌县', '3');
INSERT INTO `uzf_area` VALUES ('659', '70', '武都区', '3');
INSERT INTO `uzf_area` VALUES ('660', '71', '崇信县', '3');
INSERT INTO `uzf_area` VALUES ('661', '71', '华亭县', '3');
INSERT INTO `uzf_area` VALUES ('662', '71', '静宁县', '3');
INSERT INTO `uzf_area` VALUES ('663', '71', '灵台县', '3');
INSERT INTO `uzf_area` VALUES ('664', '71', '崆峒区', '3');
INSERT INTO `uzf_area` VALUES ('665', '71', '庄浪县', '3');
INSERT INTO `uzf_area` VALUES ('666', '71', '泾川县', '3');
INSERT INTO `uzf_area` VALUES ('667', '72', '合水县', '3');
INSERT INTO `uzf_area` VALUES ('668', '72', '华池县', '3');
INSERT INTO `uzf_area` VALUES ('669', '72', '环县', '3');
INSERT INTO `uzf_area` VALUES ('670', '72', '宁县', '3');
INSERT INTO `uzf_area` VALUES ('671', '72', '庆城县', '3');
INSERT INTO `uzf_area` VALUES ('672', '72', '西峰区', '3');
INSERT INTO `uzf_area` VALUES ('673', '72', '镇原县', '3');
INSERT INTO `uzf_area` VALUES ('674', '72', '正宁县', '3');
INSERT INTO `uzf_area` VALUES ('675', '73', '甘谷县', '3');
INSERT INTO `uzf_area` VALUES ('676', '73', '秦安县', '3');
INSERT INTO `uzf_area` VALUES ('677', '73', '清水县', '3');
INSERT INTO `uzf_area` VALUES ('678', '73', '秦州区', '3');
INSERT INTO `uzf_area` VALUES ('679', '73', '麦积区', '3');
INSERT INTO `uzf_area` VALUES ('680', '73', '武山县', '3');
INSERT INTO `uzf_area` VALUES ('681', '73', '张家川', '3');
INSERT INTO `uzf_area` VALUES ('682', '74', '古浪县', '3');
INSERT INTO `uzf_area` VALUES ('683', '74', '民勤县', '3');
INSERT INTO `uzf_area` VALUES ('684', '74', '天祝', '3');
INSERT INTO `uzf_area` VALUES ('685', '74', '凉州区', '3');
INSERT INTO `uzf_area` VALUES ('686', '75', '高台县', '3');
INSERT INTO `uzf_area` VALUES ('687', '75', '临泽县', '3');
INSERT INTO `uzf_area` VALUES ('688', '75', '民乐县', '3');
INSERT INTO `uzf_area` VALUES ('689', '75', '山丹县', '3');
INSERT INTO `uzf_area` VALUES ('690', '75', '肃南', '3');
INSERT INTO `uzf_area` VALUES ('691', '75', '甘州区', '3');
INSERT INTO `uzf_area` VALUES ('692', '76', '从化市', '3');
INSERT INTO `uzf_area` VALUES ('693', '76', '天河区', '3');
INSERT INTO `uzf_area` VALUES ('694', '76', '东山区', '3');
INSERT INTO `uzf_area` VALUES ('695', '76', '白云区', '3');
INSERT INTO `uzf_area` VALUES ('696', '76', '海珠区', '3');
INSERT INTO `uzf_area` VALUES ('697', '76', '荔湾区', '3');
INSERT INTO `uzf_area` VALUES ('698', '76', '越秀区', '3');
INSERT INTO `uzf_area` VALUES ('699', '76', '黄埔区', '3');
INSERT INTO `uzf_area` VALUES ('700', '76', '番禺区', '3');
INSERT INTO `uzf_area` VALUES ('701', '76', '花都区', '3');
INSERT INTO `uzf_area` VALUES ('702', '76', '增城区', '3');
INSERT INTO `uzf_area` VALUES ('703', '76', '从化区', '3');
INSERT INTO `uzf_area` VALUES ('704', '76', '市郊', '3');
INSERT INTO `uzf_area` VALUES ('705', '77', '福田区', '3');
INSERT INTO `uzf_area` VALUES ('706', '77', '罗湖区', '3');
INSERT INTO `uzf_area` VALUES ('707', '77', '南山区', '3');
INSERT INTO `uzf_area` VALUES ('708', '77', '宝安区', '3');
INSERT INTO `uzf_area` VALUES ('709', '77', '龙岗区', '3');
INSERT INTO `uzf_area` VALUES ('710', '77', '盐田区', '3');
INSERT INTO `uzf_area` VALUES ('711', '78', '湘桥区', '3');
INSERT INTO `uzf_area` VALUES ('712', '78', '潮安县', '3');
INSERT INTO `uzf_area` VALUES ('713', '78', '饶平县', '3');
INSERT INTO `uzf_area` VALUES ('714', '79', '南城区', '3');
INSERT INTO `uzf_area` VALUES ('715', '79', '东城区', '3');
INSERT INTO `uzf_area` VALUES ('716', '79', '万江区', '3');
INSERT INTO `uzf_area` VALUES ('717', '79', '莞城区', '3');
INSERT INTO `uzf_area` VALUES ('718', '79', '石龙镇', '3');
INSERT INTO `uzf_area` VALUES ('719', '79', '虎门镇', '3');
INSERT INTO `uzf_area` VALUES ('720', '79', '麻涌镇', '3');
INSERT INTO `uzf_area` VALUES ('721', '79', '道滘镇', '3');
INSERT INTO `uzf_area` VALUES ('722', '79', '石碣镇', '3');
INSERT INTO `uzf_area` VALUES ('723', '79', '沙田镇', '3');
INSERT INTO `uzf_area` VALUES ('724', '79', '望牛墩镇', '3');
INSERT INTO `uzf_area` VALUES ('725', '79', '洪梅镇', '3');
INSERT INTO `uzf_area` VALUES ('726', '79', '茶山镇', '3');
INSERT INTO `uzf_area` VALUES ('727', '79', '寮步镇', '3');
INSERT INTO `uzf_area` VALUES ('728', '79', '大岭山镇', '3');
INSERT INTO `uzf_area` VALUES ('729', '79', '大朗镇', '3');
INSERT INTO `uzf_area` VALUES ('730', '79', '黄江镇', '3');
INSERT INTO `uzf_area` VALUES ('731', '79', '樟木头', '3');
INSERT INTO `uzf_area` VALUES ('732', '79', '凤岗镇', '3');
INSERT INTO `uzf_area` VALUES ('733', '79', '塘厦镇', '3');
INSERT INTO `uzf_area` VALUES ('734', '79', '谢岗镇', '3');
INSERT INTO `uzf_area` VALUES ('735', '79', '厚街镇', '3');
INSERT INTO `uzf_area` VALUES ('736', '79', '清溪镇', '3');
INSERT INTO `uzf_area` VALUES ('737', '79', '常平镇', '3');
INSERT INTO `uzf_area` VALUES ('738', '79', '桥头镇', '3');
INSERT INTO `uzf_area` VALUES ('739', '79', '横沥镇', '3');
INSERT INTO `uzf_area` VALUES ('740', '79', '东坑镇', '3');
INSERT INTO `uzf_area` VALUES ('741', '79', '企石镇', '3');
INSERT INTO `uzf_area` VALUES ('742', '79', '石排镇', '3');
INSERT INTO `uzf_area` VALUES ('743', '79', '长安镇', '3');
INSERT INTO `uzf_area` VALUES ('744', '79', '中堂镇', '3');
INSERT INTO `uzf_area` VALUES ('745', '79', '高埗镇', '3');
INSERT INTO `uzf_area` VALUES ('746', '80', '禅城区', '3');
INSERT INTO `uzf_area` VALUES ('747', '80', '南海区', '3');
INSERT INTO `uzf_area` VALUES ('748', '80', '顺德区', '3');
INSERT INTO `uzf_area` VALUES ('749', '80', '三水区', '3');
INSERT INTO `uzf_area` VALUES ('750', '80', '高明区', '3');
INSERT INTO `uzf_area` VALUES ('751', '81', '东源县', '3');
INSERT INTO `uzf_area` VALUES ('752', '81', '和平县', '3');
INSERT INTO `uzf_area` VALUES ('753', '81', '源城区', '3');
INSERT INTO `uzf_area` VALUES ('754', '81', '连平县', '3');
INSERT INTO `uzf_area` VALUES ('755', '81', '龙川县', '3');
INSERT INTO `uzf_area` VALUES ('756', '81', '紫金县', '3');
INSERT INTO `uzf_area` VALUES ('757', '82', '惠阳区', '3');
INSERT INTO `uzf_area` VALUES ('758', '82', '惠城区', '3');
INSERT INTO `uzf_area` VALUES ('759', '82', '大亚湾', '3');
INSERT INTO `uzf_area` VALUES ('760', '82', '博罗县', '3');
INSERT INTO `uzf_area` VALUES ('761', '82', '惠东县', '3');
INSERT INTO `uzf_area` VALUES ('762', '82', '龙门县', '3');
INSERT INTO `uzf_area` VALUES ('763', '83', '江海区', '3');
INSERT INTO `uzf_area` VALUES ('764', '83', '蓬江区', '3');
INSERT INTO `uzf_area` VALUES ('765', '83', '新会区', '3');
INSERT INTO `uzf_area` VALUES ('766', '83', '台山市', '3');
INSERT INTO `uzf_area` VALUES ('767', '83', '开平市', '3');
INSERT INTO `uzf_area` VALUES ('768', '83', '鹤山市', '3');
INSERT INTO `uzf_area` VALUES ('769', '83', '恩平市', '3');
INSERT INTO `uzf_area` VALUES ('770', '84', '榕城区', '3');
INSERT INTO `uzf_area` VALUES ('771', '84', '普宁市', '3');
INSERT INTO `uzf_area` VALUES ('772', '84', '揭东县', '3');
INSERT INTO `uzf_area` VALUES ('773', '84', '揭西县', '3');
INSERT INTO `uzf_area` VALUES ('774', '84', '惠来县', '3');
INSERT INTO `uzf_area` VALUES ('775', '85', '茂南区', '3');
INSERT INTO `uzf_area` VALUES ('776', '85', '茂港区', '3');
INSERT INTO `uzf_area` VALUES ('777', '85', '高州市', '3');
INSERT INTO `uzf_area` VALUES ('778', '85', '化州市', '3');
INSERT INTO `uzf_area` VALUES ('779', '85', '信宜市', '3');
INSERT INTO `uzf_area` VALUES ('780', '85', '电白县', '3');
INSERT INTO `uzf_area` VALUES ('781', '86', '梅县', '3');
INSERT INTO `uzf_area` VALUES ('782', '86', '梅江区', '3');
INSERT INTO `uzf_area` VALUES ('783', '86', '兴宁市', '3');
INSERT INTO `uzf_area` VALUES ('784', '86', '大埔县', '3');
INSERT INTO `uzf_area` VALUES ('785', '86', '丰顺县', '3');
INSERT INTO `uzf_area` VALUES ('786', '86', '五华县', '3');
INSERT INTO `uzf_area` VALUES ('787', '86', '平远县', '3');
INSERT INTO `uzf_area` VALUES ('788', '86', '蕉岭县', '3');
INSERT INTO `uzf_area` VALUES ('789', '87', '清城区', '3');
INSERT INTO `uzf_area` VALUES ('790', '87', '英德市', '3');
INSERT INTO `uzf_area` VALUES ('791', '87', '连州市', '3');
INSERT INTO `uzf_area` VALUES ('792', '87', '佛冈县', '3');
INSERT INTO `uzf_area` VALUES ('793', '87', '阳山县', '3');
INSERT INTO `uzf_area` VALUES ('794', '87', '清新县', '3');
INSERT INTO `uzf_area` VALUES ('795', '87', '连山', '3');
INSERT INTO `uzf_area` VALUES ('796', '87', '连南', '3');
INSERT INTO `uzf_area` VALUES ('797', '88', '南澳县', '3');
INSERT INTO `uzf_area` VALUES ('798', '88', '潮阳区', '3');
INSERT INTO `uzf_area` VALUES ('799', '88', '澄海区', '3');
INSERT INTO `uzf_area` VALUES ('800', '88', '龙湖区', '3');
INSERT INTO `uzf_area` VALUES ('801', '88', '金平区', '3');
INSERT INTO `uzf_area` VALUES ('802', '88', '濠江区', '3');
INSERT INTO `uzf_area` VALUES ('803', '88', '潮南区', '3');
INSERT INTO `uzf_area` VALUES ('804', '89', '城区', '3');
INSERT INTO `uzf_area` VALUES ('805', '89', '陆丰市', '3');
INSERT INTO `uzf_area` VALUES ('806', '89', '海丰县', '3');
INSERT INTO `uzf_area` VALUES ('807', '89', '陆河县', '3');
INSERT INTO `uzf_area` VALUES ('808', '90', '曲江县', '3');
INSERT INTO `uzf_area` VALUES ('809', '90', '浈江区', '3');
INSERT INTO `uzf_area` VALUES ('810', '90', '武江区', '3');
INSERT INTO `uzf_area` VALUES ('811', '90', '曲江区', '3');
INSERT INTO `uzf_area` VALUES ('812', '90', '乐昌市', '3');
INSERT INTO `uzf_area` VALUES ('813', '90', '南雄市', '3');
INSERT INTO `uzf_area` VALUES ('814', '90', '始兴县', '3');
INSERT INTO `uzf_area` VALUES ('815', '90', '仁化县', '3');
INSERT INTO `uzf_area` VALUES ('816', '90', '翁源县', '3');
INSERT INTO `uzf_area` VALUES ('817', '90', '新丰县', '3');
INSERT INTO `uzf_area` VALUES ('818', '90', '乳源', '3');
INSERT INTO `uzf_area` VALUES ('819', '91', '江城区', '3');
INSERT INTO `uzf_area` VALUES ('820', '91', '阳春市', '3');
INSERT INTO `uzf_area` VALUES ('821', '91', '阳西县', '3');
INSERT INTO `uzf_area` VALUES ('822', '91', '阳东县', '3');
INSERT INTO `uzf_area` VALUES ('823', '92', '云城区', '3');
INSERT INTO `uzf_area` VALUES ('824', '92', '罗定市', '3');
INSERT INTO `uzf_area` VALUES ('825', '92', '新兴县', '3');
INSERT INTO `uzf_area` VALUES ('826', '92', '郁南县', '3');
INSERT INTO `uzf_area` VALUES ('827', '92', '云安县', '3');
INSERT INTO `uzf_area` VALUES ('828', '93', '赤坎区', '3');
INSERT INTO `uzf_area` VALUES ('829', '93', '霞山区', '3');
INSERT INTO `uzf_area` VALUES ('830', '93', '坡头区', '3');
INSERT INTO `uzf_area` VALUES ('831', '93', '麻章区', '3');
INSERT INTO `uzf_area` VALUES ('832', '93', '廉江市', '3');
INSERT INTO `uzf_area` VALUES ('833', '93', '雷州市', '3');
INSERT INTO `uzf_area` VALUES ('834', '93', '吴川市', '3');
INSERT INTO `uzf_area` VALUES ('835', '93', '遂溪县', '3');
INSERT INTO `uzf_area` VALUES ('836', '93', '徐闻县', '3');
INSERT INTO `uzf_area` VALUES ('837', '94', '肇庆市', '3');
INSERT INTO `uzf_area` VALUES ('838', '94', '高要市', '3');
INSERT INTO `uzf_area` VALUES ('839', '94', '四会市', '3');
INSERT INTO `uzf_area` VALUES ('840', '94', '广宁县', '3');
INSERT INTO `uzf_area` VALUES ('841', '94', '怀集县', '3');
INSERT INTO `uzf_area` VALUES ('842', '94', '封开县', '3');
INSERT INTO `uzf_area` VALUES ('843', '94', '德庆县', '3');
INSERT INTO `uzf_area` VALUES ('844', '95', '石岐街道', '3');
INSERT INTO `uzf_area` VALUES ('845', '95', '东区街道', '3');
INSERT INTO `uzf_area` VALUES ('846', '95', '西区街道', '3');
INSERT INTO `uzf_area` VALUES ('847', '95', '环城街道', '3');
INSERT INTO `uzf_area` VALUES ('848', '95', '中山港街道', '3');
INSERT INTO `uzf_area` VALUES ('849', '95', '五桂山街道', '3');
INSERT INTO `uzf_area` VALUES ('850', '96', '香洲区', '3');
INSERT INTO `uzf_area` VALUES ('851', '96', '斗门区', '3');
INSERT INTO `uzf_area` VALUES ('852', '96', '金湾区', '3');
INSERT INTO `uzf_area` VALUES ('853', '97', '邕宁区', '3');
INSERT INTO `uzf_area` VALUES ('854', '97', '青秀区', '3');
INSERT INTO `uzf_area` VALUES ('855', '97', '兴宁区', '3');
INSERT INTO `uzf_area` VALUES ('856', '97', '良庆区', '3');
INSERT INTO `uzf_area` VALUES ('857', '97', '西乡塘区', '3');
INSERT INTO `uzf_area` VALUES ('858', '97', '江南区', '3');
INSERT INTO `uzf_area` VALUES ('859', '97', '武鸣县', '3');
INSERT INTO `uzf_area` VALUES ('860', '97', '隆安县', '3');
INSERT INTO `uzf_area` VALUES ('861', '97', '马山县', '3');
INSERT INTO `uzf_area` VALUES ('862', '97', '上林县', '3');
INSERT INTO `uzf_area` VALUES ('863', '97', '宾阳县', '3');
INSERT INTO `uzf_area` VALUES ('864', '97', '横县', '3');
INSERT INTO `uzf_area` VALUES ('865', '98', '秀峰区', '3');
INSERT INTO `uzf_area` VALUES ('866', '98', '叠彩区', '3');
INSERT INTO `uzf_area` VALUES ('867', '98', '象山区', '3');
INSERT INTO `uzf_area` VALUES ('868', '98', '七星区', '3');
INSERT INTO `uzf_area` VALUES ('869', '98', '雁山区', '3');
INSERT INTO `uzf_area` VALUES ('870', '98', '阳朔县', '3');
INSERT INTO `uzf_area` VALUES ('871', '98', '临桂县', '3');
INSERT INTO `uzf_area` VALUES ('872', '98', '灵川县', '3');
INSERT INTO `uzf_area` VALUES ('873', '98', '全州县', '3');
INSERT INTO `uzf_area` VALUES ('874', '98', '平乐县', '3');
INSERT INTO `uzf_area` VALUES ('875', '98', '兴安县', '3');
INSERT INTO `uzf_area` VALUES ('876', '98', '灌阳县', '3');
INSERT INTO `uzf_area` VALUES ('877', '98', '荔浦县', '3');
INSERT INTO `uzf_area` VALUES ('878', '98', '资源县', '3');
INSERT INTO `uzf_area` VALUES ('879', '98', '永福县', '3');
INSERT INTO `uzf_area` VALUES ('880', '98', '龙胜', '3');
INSERT INTO `uzf_area` VALUES ('881', '98', '恭城', '3');
INSERT INTO `uzf_area` VALUES ('882', '99', '右江区', '3');
INSERT INTO `uzf_area` VALUES ('883', '99', '凌云县', '3');
INSERT INTO `uzf_area` VALUES ('884', '99', '平果县', '3');
INSERT INTO `uzf_area` VALUES ('885', '99', '西林县', '3');
INSERT INTO `uzf_area` VALUES ('886', '99', '乐业县', '3');
INSERT INTO `uzf_area` VALUES ('887', '99', '德保县', '3');
INSERT INTO `uzf_area` VALUES ('888', '99', '田林县', '3');
INSERT INTO `uzf_area` VALUES ('889', '99', '田阳县', '3');
INSERT INTO `uzf_area` VALUES ('890', '99', '靖西县', '3');
INSERT INTO `uzf_area` VALUES ('891', '99', '田东县', '3');
INSERT INTO `uzf_area` VALUES ('892', '99', '那坡县', '3');
INSERT INTO `uzf_area` VALUES ('893', '99', '隆林', '3');
INSERT INTO `uzf_area` VALUES ('894', '100', '海城区', '3');
INSERT INTO `uzf_area` VALUES ('895', '100', '银海区', '3');
INSERT INTO `uzf_area` VALUES ('896', '100', '铁山港区', '3');
INSERT INTO `uzf_area` VALUES ('897', '100', '合浦县', '3');
INSERT INTO `uzf_area` VALUES ('898', '101', '江州区', '3');
INSERT INTO `uzf_area` VALUES ('899', '101', '凭祥市', '3');
INSERT INTO `uzf_area` VALUES ('900', '101', '宁明县', '3');
INSERT INTO `uzf_area` VALUES ('901', '101', '扶绥县', '3');
INSERT INTO `uzf_area` VALUES ('902', '101', '龙州县', '3');
INSERT INTO `uzf_area` VALUES ('903', '101', '大新县', '3');
INSERT INTO `uzf_area` VALUES ('904', '101', '天等县', '3');
INSERT INTO `uzf_area` VALUES ('905', '102', '港口区', '3');
INSERT INTO `uzf_area` VALUES ('906', '102', '防城区', '3');
INSERT INTO `uzf_area` VALUES ('907', '102', '东兴市', '3');
INSERT INTO `uzf_area` VALUES ('908', '102', '上思县', '3');
INSERT INTO `uzf_area` VALUES ('909', '103', '港北区', '3');
INSERT INTO `uzf_area` VALUES ('910', '103', '港南区', '3');
INSERT INTO `uzf_area` VALUES ('911', '103', '覃塘区', '3');
INSERT INTO `uzf_area` VALUES ('912', '103', '桂平市', '3');
INSERT INTO `uzf_area` VALUES ('913', '103', '平南县', '3');
INSERT INTO `uzf_area` VALUES ('914', '104', '金城江区', '3');
INSERT INTO `uzf_area` VALUES ('915', '104', '宜州市', '3');
INSERT INTO `uzf_area` VALUES ('916', '104', '天峨县', '3');
INSERT INTO `uzf_area` VALUES ('917', '104', '凤山县', '3');
INSERT INTO `uzf_area` VALUES ('918', '104', '南丹县', '3');
INSERT INTO `uzf_area` VALUES ('919', '104', '东兰县', '3');
INSERT INTO `uzf_area` VALUES ('920', '104', '都安', '3');
INSERT INTO `uzf_area` VALUES ('921', '104', '罗城', '3');
INSERT INTO `uzf_area` VALUES ('922', '104', '巴马', '3');
INSERT INTO `uzf_area` VALUES ('923', '104', '环江', '3');
INSERT INTO `uzf_area` VALUES ('924', '104', '大化', '3');
INSERT INTO `uzf_area` VALUES ('925', '105', '八步区', '3');
INSERT INTO `uzf_area` VALUES ('926', '105', '钟山县', '3');
INSERT INTO `uzf_area` VALUES ('927', '105', '昭平县', '3');
INSERT INTO `uzf_area` VALUES ('928', '105', '富川', '3');
INSERT INTO `uzf_area` VALUES ('929', '106', '兴宾区', '3');
INSERT INTO `uzf_area` VALUES ('930', '106', '合山市', '3');
INSERT INTO `uzf_area` VALUES ('931', '106', '象州县', '3');
INSERT INTO `uzf_area` VALUES ('932', '106', '武宣县', '3');
INSERT INTO `uzf_area` VALUES ('933', '106', '忻城县', '3');
INSERT INTO `uzf_area` VALUES ('934', '106', '金秀', '3');
INSERT INTO `uzf_area` VALUES ('935', '107', '城中区', '3');
INSERT INTO `uzf_area` VALUES ('936', '107', '鱼峰区', '3');
INSERT INTO `uzf_area` VALUES ('937', '107', '柳北区', '3');
INSERT INTO `uzf_area` VALUES ('938', '107', '柳南区', '3');
INSERT INTO `uzf_area` VALUES ('939', '107', '柳江县', '3');
INSERT INTO `uzf_area` VALUES ('940', '107', '柳城县', '3');
INSERT INTO `uzf_area` VALUES ('941', '107', '鹿寨县', '3');
INSERT INTO `uzf_area` VALUES ('942', '107', '融安县', '3');
INSERT INTO `uzf_area` VALUES ('943', '107', '融水', '3');
INSERT INTO `uzf_area` VALUES ('944', '107', '三江', '3');
INSERT INTO `uzf_area` VALUES ('945', '108', '钦南区', '3');
INSERT INTO `uzf_area` VALUES ('946', '108', '钦北区', '3');
INSERT INTO `uzf_area` VALUES ('947', '108', '灵山县', '3');
INSERT INTO `uzf_area` VALUES ('948', '108', '浦北县', '3');
INSERT INTO `uzf_area` VALUES ('949', '109', '万秀区', '3');
INSERT INTO `uzf_area` VALUES ('950', '109', '蝶山区', '3');
INSERT INTO `uzf_area` VALUES ('951', '109', '长洲区', '3');
INSERT INTO `uzf_area` VALUES ('952', '109', '岑溪市', '3');
INSERT INTO `uzf_area` VALUES ('953', '109', '苍梧县', '3');
INSERT INTO `uzf_area` VALUES ('954', '109', '藤县', '3');
INSERT INTO `uzf_area` VALUES ('955', '109', '蒙山县', '3');
INSERT INTO `uzf_area` VALUES ('956', '110', '玉州区', '3');
INSERT INTO `uzf_area` VALUES ('957', '110', '北流市', '3');
INSERT INTO `uzf_area` VALUES ('958', '110', '容县', '3');
INSERT INTO `uzf_area` VALUES ('959', '110', '陆川县', '3');
INSERT INTO `uzf_area` VALUES ('960', '110', '博白县', '3');
INSERT INTO `uzf_area` VALUES ('961', '110', '兴业县', '3');
INSERT INTO `uzf_area` VALUES ('962', '111', '南明区', '3');
INSERT INTO `uzf_area` VALUES ('963', '111', '云岩区', '3');
INSERT INTO `uzf_area` VALUES ('964', '111', '花溪区', '3');
INSERT INTO `uzf_area` VALUES ('965', '111', '乌当区', '3');
INSERT INTO `uzf_area` VALUES ('966', '111', '白云区', '3');
INSERT INTO `uzf_area` VALUES ('967', '111', '小河区', '3');
INSERT INTO `uzf_area` VALUES ('968', '111', '金阳新区', '3');
INSERT INTO `uzf_area` VALUES ('969', '111', '新天园区', '3');
INSERT INTO `uzf_area` VALUES ('970', '111', '清镇市', '3');
INSERT INTO `uzf_area` VALUES ('971', '111', '开阳县', '3');
INSERT INTO `uzf_area` VALUES ('972', '111', '修文县', '3');
INSERT INTO `uzf_area` VALUES ('973', '111', '息烽县', '3');
INSERT INTO `uzf_area` VALUES ('974', '112', '西秀区', '3');
INSERT INTO `uzf_area` VALUES ('975', '112', '关岭', '3');
INSERT INTO `uzf_area` VALUES ('976', '112', '镇宁', '3');
INSERT INTO `uzf_area` VALUES ('977', '112', '紫云', '3');
INSERT INTO `uzf_area` VALUES ('978', '112', '平坝县', '3');
INSERT INTO `uzf_area` VALUES ('979', '112', '普定县', '3');
INSERT INTO `uzf_area` VALUES ('980', '113', '毕节市', '3');
INSERT INTO `uzf_area` VALUES ('981', '113', '大方县', '3');
INSERT INTO `uzf_area` VALUES ('982', '113', '黔西县', '3');
INSERT INTO `uzf_area` VALUES ('983', '113', '金沙县', '3');
INSERT INTO `uzf_area` VALUES ('984', '113', '织金县', '3');
INSERT INTO `uzf_area` VALUES ('985', '113', '纳雍县', '3');
INSERT INTO `uzf_area` VALUES ('986', '113', '赫章县', '3');
INSERT INTO `uzf_area` VALUES ('987', '113', '威宁', '3');
INSERT INTO `uzf_area` VALUES ('988', '114', '钟山区', '3');
INSERT INTO `uzf_area` VALUES ('989', '114', '六枝特区', '3');
INSERT INTO `uzf_area` VALUES ('990', '114', '水城县', '3');
INSERT INTO `uzf_area` VALUES ('991', '114', '盘县', '3');
INSERT INTO `uzf_area` VALUES ('992', '115', '凯里市', '3');
INSERT INTO `uzf_area` VALUES ('993', '115', '黄平县', '3');
INSERT INTO `uzf_area` VALUES ('994', '115', '施秉县', '3');
INSERT INTO `uzf_area` VALUES ('995', '115', '三穗县', '3');
INSERT INTO `uzf_area` VALUES ('996', '115', '镇远县', '3');
INSERT INTO `uzf_area` VALUES ('997', '115', '岑巩县', '3');
INSERT INTO `uzf_area` VALUES ('998', '115', '天柱县', '3');
INSERT INTO `uzf_area` VALUES ('999', '115', '锦屏县', '3');
INSERT INTO `uzf_area` VALUES ('1000', '115', '剑河县', '3');
INSERT INTO `uzf_area` VALUES ('1001', '115', '台江县', '3');
INSERT INTO `uzf_area` VALUES ('1002', '115', '黎平县', '3');
INSERT INTO `uzf_area` VALUES ('1003', '115', '榕江县', '3');
INSERT INTO `uzf_area` VALUES ('1004', '115', '从江县', '3');
INSERT INTO `uzf_area` VALUES ('1005', '115', '雷山县', '3');
INSERT INTO `uzf_area` VALUES ('1006', '115', '麻江县', '3');
INSERT INTO `uzf_area` VALUES ('1007', '115', '丹寨县', '3');
INSERT INTO `uzf_area` VALUES ('1008', '116', '都匀市', '3');
INSERT INTO `uzf_area` VALUES ('1009', '116', '福泉市', '3');
INSERT INTO `uzf_area` VALUES ('1010', '116', '荔波县', '3');
INSERT INTO `uzf_area` VALUES ('1011', '116', '贵定县', '3');
INSERT INTO `uzf_area` VALUES ('1012', '116', '瓮安县', '3');
INSERT INTO `uzf_area` VALUES ('1013', '116', '独山县', '3');
INSERT INTO `uzf_area` VALUES ('1014', '116', '平塘县', '3');
INSERT INTO `uzf_area` VALUES ('1015', '116', '罗甸县', '3');
INSERT INTO `uzf_area` VALUES ('1016', '116', '长顺县', '3');
INSERT INTO `uzf_area` VALUES ('1017', '116', '龙里县', '3');
INSERT INTO `uzf_area` VALUES ('1018', '116', '惠水县', '3');
INSERT INTO `uzf_area` VALUES ('1019', '116', '三都', '3');
INSERT INTO `uzf_area` VALUES ('1020', '117', '兴义市', '3');
INSERT INTO `uzf_area` VALUES ('1021', '117', '兴仁县', '3');
INSERT INTO `uzf_area` VALUES ('1022', '117', '普安县', '3');
INSERT INTO `uzf_area` VALUES ('1023', '117', '晴隆县', '3');
INSERT INTO `uzf_area` VALUES ('1024', '117', '贞丰县', '3');
INSERT INTO `uzf_area` VALUES ('1025', '117', '望谟县', '3');
INSERT INTO `uzf_area` VALUES ('1026', '117', '册亨县', '3');
INSERT INTO `uzf_area` VALUES ('1027', '117', '安龙县', '3');
INSERT INTO `uzf_area` VALUES ('1028', '118', '铜仁市', '3');
INSERT INTO `uzf_area` VALUES ('1029', '118', '江口县', '3');
INSERT INTO `uzf_area` VALUES ('1030', '118', '石阡县', '3');
INSERT INTO `uzf_area` VALUES ('1031', '118', '思南县', '3');
INSERT INTO `uzf_area` VALUES ('1032', '118', '德江县', '3');
INSERT INTO `uzf_area` VALUES ('1033', '118', '玉屏', '3');
INSERT INTO `uzf_area` VALUES ('1034', '118', '印江', '3');
INSERT INTO `uzf_area` VALUES ('1035', '118', '沿河', '3');
INSERT INTO `uzf_area` VALUES ('1036', '118', '松桃', '3');
INSERT INTO `uzf_area` VALUES ('1037', '118', '万山特区', '3');
INSERT INTO `uzf_area` VALUES ('1038', '119', '红花岗区', '3');
INSERT INTO `uzf_area` VALUES ('1039', '119', '务川县', '3');
INSERT INTO `uzf_area` VALUES ('1040', '119', '道真县', '3');
INSERT INTO `uzf_area` VALUES ('1041', '119', '汇川区', '3');
INSERT INTO `uzf_area` VALUES ('1042', '119', '赤水市', '3');
INSERT INTO `uzf_area` VALUES ('1043', '119', '仁怀市', '3');
INSERT INTO `uzf_area` VALUES ('1044', '119', '遵义县', '3');
INSERT INTO `uzf_area` VALUES ('1045', '119', '桐梓县', '3');
INSERT INTO `uzf_area` VALUES ('1046', '119', '绥阳县', '3');
INSERT INTO `uzf_area` VALUES ('1047', '119', '正安县', '3');
INSERT INTO `uzf_area` VALUES ('1048', '119', '凤冈县', '3');
INSERT INTO `uzf_area` VALUES ('1049', '119', '湄潭县', '3');
INSERT INTO `uzf_area` VALUES ('1050', '119', '余庆县', '3');
INSERT INTO `uzf_area` VALUES ('1051', '119', '习水县', '3');
INSERT INTO `uzf_area` VALUES ('1052', '119', '道真', '3');
INSERT INTO `uzf_area` VALUES ('1053', '119', '务川', '3');
INSERT INTO `uzf_area` VALUES ('1054', '120', '秀英区', '3');
INSERT INTO `uzf_area` VALUES ('1055', '120', '龙华区', '3');
INSERT INTO `uzf_area` VALUES ('1056', '120', '琼山区', '3');
INSERT INTO `uzf_area` VALUES ('1057', '120', '美兰区', '3');
INSERT INTO `uzf_area` VALUES ('1058', '137', '市区', '3');
INSERT INTO `uzf_area` VALUES ('1059', '137', '洋浦开发区', '3');
INSERT INTO `uzf_area` VALUES ('1060', '137', '那大镇', '3');
INSERT INTO `uzf_area` VALUES ('1061', '137', '王五镇', '3');
INSERT INTO `uzf_area` VALUES ('1062', '137', '雅星镇', '3');
INSERT INTO `uzf_area` VALUES ('1063', '137', '大成镇', '3');
INSERT INTO `uzf_area` VALUES ('1064', '137', '中和镇', '3');
INSERT INTO `uzf_area` VALUES ('1065', '137', '峨蔓镇', '3');
INSERT INTO `uzf_area` VALUES ('1066', '137', '南丰镇', '3');
INSERT INTO `uzf_area` VALUES ('1067', '137', '白马井镇', '3');
INSERT INTO `uzf_area` VALUES ('1068', '137', '兰洋镇', '3');
INSERT INTO `uzf_area` VALUES ('1069', '137', '和庆镇', '3');
INSERT INTO `uzf_area` VALUES ('1070', '137', '海头镇', '3');
INSERT INTO `uzf_area` VALUES ('1071', '137', '排浦镇', '3');
INSERT INTO `uzf_area` VALUES ('1072', '137', '东成镇', '3');
INSERT INTO `uzf_area` VALUES ('1073', '137', '光村镇', '3');
INSERT INTO `uzf_area` VALUES ('1074', '137', '木棠镇', '3');
INSERT INTO `uzf_area` VALUES ('1075', '137', '新州镇', '3');
INSERT INTO `uzf_area` VALUES ('1076', '137', '三都镇', '3');
INSERT INTO `uzf_area` VALUES ('1077', '137', '其他', '3');
INSERT INTO `uzf_area` VALUES ('1078', '138', '长安区', '3');
INSERT INTO `uzf_area` VALUES ('1079', '138', '桥东区', '3');
INSERT INTO `uzf_area` VALUES ('1080', '138', '桥西区', '3');
INSERT INTO `uzf_area` VALUES ('1081', '138', '新华区', '3');
INSERT INTO `uzf_area` VALUES ('1082', '138', '裕华区', '3');
INSERT INTO `uzf_area` VALUES ('1083', '138', '井陉矿区', '3');
INSERT INTO `uzf_area` VALUES ('1084', '138', '高新区', '3');
INSERT INTO `uzf_area` VALUES ('1085', '138', '辛集市', '3');
INSERT INTO `uzf_area` VALUES ('1086', '138', '藁城市', '3');
INSERT INTO `uzf_area` VALUES ('1087', '138', '晋州市', '3');
INSERT INTO `uzf_area` VALUES ('1088', '138', '新乐市', '3');
INSERT INTO `uzf_area` VALUES ('1089', '138', '鹿泉市', '3');
INSERT INTO `uzf_area` VALUES ('1090', '138', '井陉县', '3');
INSERT INTO `uzf_area` VALUES ('1091', '138', '正定县', '3');
INSERT INTO `uzf_area` VALUES ('1092', '138', '栾城县', '3');
INSERT INTO `uzf_area` VALUES ('1093', '138', '行唐县', '3');
INSERT INTO `uzf_area` VALUES ('1094', '138', '灵寿县', '3');
INSERT INTO `uzf_area` VALUES ('1095', '138', '高邑县', '3');
INSERT INTO `uzf_area` VALUES ('1096', '138', '深泽县', '3');
INSERT INTO `uzf_area` VALUES ('1097', '138', '赞皇县', '3');
INSERT INTO `uzf_area` VALUES ('1098', '138', '无极县', '3');
INSERT INTO `uzf_area` VALUES ('1099', '138', '平山县', '3');
INSERT INTO `uzf_area` VALUES ('1100', '138', '元氏县', '3');
INSERT INTO `uzf_area` VALUES ('1101', '138', '赵县', '3');
INSERT INTO `uzf_area` VALUES ('1102', '139', '新市区', '3');
INSERT INTO `uzf_area` VALUES ('1103', '139', '南市区', '3');
INSERT INTO `uzf_area` VALUES ('1104', '139', '北市区', '3');
INSERT INTO `uzf_area` VALUES ('1105', '139', '涿州市', '3');
INSERT INTO `uzf_area` VALUES ('1106', '139', '定州市', '3');
INSERT INTO `uzf_area` VALUES ('1107', '139', '安国市', '3');
INSERT INTO `uzf_area` VALUES ('1108', '139', '高碑店市', '3');
INSERT INTO `uzf_area` VALUES ('1109', '139', '满城县', '3');
INSERT INTO `uzf_area` VALUES ('1110', '139', '清苑县', '3');
INSERT INTO `uzf_area` VALUES ('1111', '139', '涞水县', '3');
INSERT INTO `uzf_area` VALUES ('1112', '139', '阜平县', '3');
INSERT INTO `uzf_area` VALUES ('1113', '139', '徐水县', '3');
INSERT INTO `uzf_area` VALUES ('1114', '139', '定兴县', '3');
INSERT INTO `uzf_area` VALUES ('1115', '139', '唐县', '3');
INSERT INTO `uzf_area` VALUES ('1116', '139', '高阳县', '3');
INSERT INTO `uzf_area` VALUES ('1117', '139', '容城县', '3');
INSERT INTO `uzf_area` VALUES ('1118', '139', '涞源县', '3');
INSERT INTO `uzf_area` VALUES ('1119', '139', '望都县', '3');
INSERT INTO `uzf_area` VALUES ('1120', '139', '安新县', '3');
INSERT INTO `uzf_area` VALUES ('1121', '139', '易县', '3');
INSERT INTO `uzf_area` VALUES ('1122', '139', '曲阳县', '3');
INSERT INTO `uzf_area` VALUES ('1123', '139', '蠡县', '3');
INSERT INTO `uzf_area` VALUES ('1124', '139', '顺平县', '3');
INSERT INTO `uzf_area` VALUES ('1125', '139', '博野县', '3');
INSERT INTO `uzf_area` VALUES ('1126', '139', '雄县', '3');
INSERT INTO `uzf_area` VALUES ('1127', '140', '运河区', '3');
INSERT INTO `uzf_area` VALUES ('1128', '140', '新华区', '3');
INSERT INTO `uzf_area` VALUES ('1129', '140', '泊头市', '3');
INSERT INTO `uzf_area` VALUES ('1130', '140', '任丘市', '3');
INSERT INTO `uzf_area` VALUES ('1131', '140', '黄骅市', '3');
INSERT INTO `uzf_area` VALUES ('1132', '140', '河间市', '3');
INSERT INTO `uzf_area` VALUES ('1133', '140', '沧县', '3');
INSERT INTO `uzf_area` VALUES ('1134', '140', '青县', '3');
INSERT INTO `uzf_area` VALUES ('1135', '140', '东光县', '3');
INSERT INTO `uzf_area` VALUES ('1136', '140', '海兴县', '3');
INSERT INTO `uzf_area` VALUES ('1137', '140', '盐山县', '3');
INSERT INTO `uzf_area` VALUES ('1138', '140', '肃宁县', '3');
INSERT INTO `uzf_area` VALUES ('1139', '140', '南皮县', '3');
INSERT INTO `uzf_area` VALUES ('1140', '140', '吴桥县', '3');
INSERT INTO `uzf_area` VALUES ('1141', '140', '献县', '3');
INSERT INTO `uzf_area` VALUES ('1142', '140', '孟村', '3');
INSERT INTO `uzf_area` VALUES ('1143', '141', '双桥区', '3');
INSERT INTO `uzf_area` VALUES ('1144', '141', '双滦区', '3');
INSERT INTO `uzf_area` VALUES ('1145', '141', '鹰手营子矿区', '3');
INSERT INTO `uzf_area` VALUES ('1146', '141', '承德县', '3');
INSERT INTO `uzf_area` VALUES ('1147', '141', '兴隆县', '3');
INSERT INTO `uzf_area` VALUES ('1148', '141', '平泉县', '3');
INSERT INTO `uzf_area` VALUES ('1149', '141', '滦平县', '3');
INSERT INTO `uzf_area` VALUES ('1150', '141', '隆化县', '3');
INSERT INTO `uzf_area` VALUES ('1151', '141', '丰宁', '3');
INSERT INTO `uzf_area` VALUES ('1152', '141', '宽城', '3');
INSERT INTO `uzf_area` VALUES ('1153', '141', '围场', '3');
INSERT INTO `uzf_area` VALUES ('1154', '142', '从台区', '3');
INSERT INTO `uzf_area` VALUES ('1155', '142', '复兴区', '3');
INSERT INTO `uzf_area` VALUES ('1156', '142', '邯山区', '3');
INSERT INTO `uzf_area` VALUES ('1157', '142', '峰峰矿区', '3');
INSERT INTO `uzf_area` VALUES ('1158', '142', '武安市', '3');
INSERT INTO `uzf_area` VALUES ('1159', '142', '邯郸县', '3');
INSERT INTO `uzf_area` VALUES ('1160', '142', '临漳县', '3');
INSERT INTO `uzf_area` VALUES ('1161', '142', '成安县', '3');
INSERT INTO `uzf_area` VALUES ('1162', '142', '大名县', '3');
INSERT INTO `uzf_area` VALUES ('1163', '142', '涉县', '3');
INSERT INTO `uzf_area` VALUES ('1164', '142', '磁县', '3');
INSERT INTO `uzf_area` VALUES ('1165', '142', '肥乡县', '3');
INSERT INTO `uzf_area` VALUES ('1166', '142', '永年县', '3');
INSERT INTO `uzf_area` VALUES ('1167', '142', '邱县', '3');
INSERT INTO `uzf_area` VALUES ('1168', '142', '鸡泽县', '3');
INSERT INTO `uzf_area` VALUES ('1169', '142', '广平县', '3');
INSERT INTO `uzf_area` VALUES ('1170', '142', '馆陶县', '3');
INSERT INTO `uzf_area` VALUES ('1171', '142', '魏县', '3');
INSERT INTO `uzf_area` VALUES ('1172', '142', '曲周县', '3');
INSERT INTO `uzf_area` VALUES ('1173', '143', '桃城区', '3');
INSERT INTO `uzf_area` VALUES ('1174', '143', '冀州市', '3');
INSERT INTO `uzf_area` VALUES ('1175', '143', '深州市', '3');
INSERT INTO `uzf_area` VALUES ('1176', '143', '枣强县', '3');
INSERT INTO `uzf_area` VALUES ('1177', '143', '武邑县', '3');
INSERT INTO `uzf_area` VALUES ('1178', '143', '武强县', '3');
INSERT INTO `uzf_area` VALUES ('1179', '143', '饶阳县', '3');
INSERT INTO `uzf_area` VALUES ('1180', '143', '安平县', '3');
INSERT INTO `uzf_area` VALUES ('1181', '143', '故城县', '3');
INSERT INTO `uzf_area` VALUES ('1182', '143', '景县', '3');
INSERT INTO `uzf_area` VALUES ('1183', '143', '阜城县', '3');
INSERT INTO `uzf_area` VALUES ('1184', '144', '安次区', '3');
INSERT INTO `uzf_area` VALUES ('1185', '144', '广阳区', '3');
INSERT INTO `uzf_area` VALUES ('1186', '144', '霸州市', '3');
INSERT INTO `uzf_area` VALUES ('1187', '144', '三河市', '3');
INSERT INTO `uzf_area` VALUES ('1188', '144', '固安县', '3');
INSERT INTO `uzf_area` VALUES ('1189', '144', '永清县', '3');
INSERT INTO `uzf_area` VALUES ('1190', '144', '香河县', '3');
INSERT INTO `uzf_area` VALUES ('1191', '144', '大城县', '3');
INSERT INTO `uzf_area` VALUES ('1192', '144', '文安县', '3');
INSERT INTO `uzf_area` VALUES ('1193', '144', '大厂', '3');
INSERT INTO `uzf_area` VALUES ('1194', '145', '海港区', '3');
INSERT INTO `uzf_area` VALUES ('1195', '145', '山海关区', '3');
INSERT INTO `uzf_area` VALUES ('1196', '145', '北戴河区', '3');
INSERT INTO `uzf_area` VALUES ('1197', '145', '昌黎县', '3');
INSERT INTO `uzf_area` VALUES ('1198', '145', '抚宁县', '3');
INSERT INTO `uzf_area` VALUES ('1199', '145', '卢龙县', '3');
INSERT INTO `uzf_area` VALUES ('1200', '145', '青龙', '3');
INSERT INTO `uzf_area` VALUES ('1201', '146', '路北区', '3');
INSERT INTO `uzf_area` VALUES ('1202', '146', '路南区', '3');
INSERT INTO `uzf_area` VALUES ('1203', '146', '古冶区', '3');
INSERT INTO `uzf_area` VALUES ('1204', '146', '开平区', '3');
INSERT INTO `uzf_area` VALUES ('1205', '146', '丰南区', '3');
INSERT INTO `uzf_area` VALUES ('1206', '146', '丰润区', '3');
INSERT INTO `uzf_area` VALUES ('1207', '146', '遵化市', '3');
INSERT INTO `uzf_area` VALUES ('1208', '146', '迁安市', '3');
INSERT INTO `uzf_area` VALUES ('1209', '146', '滦县', '3');
INSERT INTO `uzf_area` VALUES ('1210', '146', '滦南县', '3');
INSERT INTO `uzf_area` VALUES ('1211', '146', '乐亭县', '3');
INSERT INTO `uzf_area` VALUES ('1212', '146', '迁西县', '3');
INSERT INTO `uzf_area` VALUES ('1213', '146', '玉田县', '3');
INSERT INTO `uzf_area` VALUES ('1214', '146', '唐海县', '3');
INSERT INTO `uzf_area` VALUES ('1215', '147', '桥东区', '3');
INSERT INTO `uzf_area` VALUES ('1216', '147', '桥西区', '3');
INSERT INTO `uzf_area` VALUES ('1217', '147', '南宫市', '3');
INSERT INTO `uzf_area` VALUES ('1218', '147', '沙河市', '3');
INSERT INTO `uzf_area` VALUES ('1219', '147', '邢台县', '3');
INSERT INTO `uzf_area` VALUES ('1220', '147', '临城县', '3');
INSERT INTO `uzf_area` VALUES ('1221', '147', '内丘县', '3');
INSERT INTO `uzf_area` VALUES ('1222', '147', '柏乡县', '3');
INSERT INTO `uzf_area` VALUES ('1223', '147', '隆尧县', '3');
INSERT INTO `uzf_area` VALUES ('1224', '147', '任县', '3');
INSERT INTO `uzf_area` VALUES ('1225', '147', '南和县', '3');
INSERT INTO `uzf_area` VALUES ('1226', '147', '宁晋县', '3');
INSERT INTO `uzf_area` VALUES ('1227', '147', '巨鹿县', '3');
INSERT INTO `uzf_area` VALUES ('1228', '147', '新河县', '3');
INSERT INTO `uzf_area` VALUES ('1229', '147', '广宗县', '3');
INSERT INTO `uzf_area` VALUES ('1230', '147', '平乡县', '3');
INSERT INTO `uzf_area` VALUES ('1231', '147', '威县', '3');
INSERT INTO `uzf_area` VALUES ('1232', '147', '清河县', '3');
INSERT INTO `uzf_area` VALUES ('1233', '147', '临西县', '3');
INSERT INTO `uzf_area` VALUES ('1234', '148', '桥西区', '3');
INSERT INTO `uzf_area` VALUES ('1235', '148', '桥东区', '3');
INSERT INTO `uzf_area` VALUES ('1236', '148', '宣化区', '3');
INSERT INTO `uzf_area` VALUES ('1237', '148', '下花园区', '3');
INSERT INTO `uzf_area` VALUES ('1238', '148', '宣化县', '3');
INSERT INTO `uzf_area` VALUES ('1239', '148', '张北县', '3');
INSERT INTO `uzf_area` VALUES ('1240', '148', '康保县', '3');
INSERT INTO `uzf_area` VALUES ('1241', '148', '沽源县', '3');
INSERT INTO `uzf_area` VALUES ('1242', '148', '尚义县', '3');
INSERT INTO `uzf_area` VALUES ('1243', '148', '蔚县', '3');
INSERT INTO `uzf_area` VALUES ('1244', '148', '阳原县', '3');
INSERT INTO `uzf_area` VALUES ('1245', '148', '怀安县', '3');
INSERT INTO `uzf_area` VALUES ('1246', '148', '万全县', '3');
INSERT INTO `uzf_area` VALUES ('1247', '148', '怀来县', '3');
INSERT INTO `uzf_area` VALUES ('1248', '148', '涿鹿县', '3');
INSERT INTO `uzf_area` VALUES ('1249', '148', '赤城县', '3');
INSERT INTO `uzf_area` VALUES ('1250', '148', '崇礼县', '3');
INSERT INTO `uzf_area` VALUES ('1251', '149', '金水区', '3');
INSERT INTO `uzf_area` VALUES ('1252', '149', '邙山区', '3');
INSERT INTO `uzf_area` VALUES ('1253', '149', '二七区', '3');
INSERT INTO `uzf_area` VALUES ('1254', '149', '管城区', '3');
INSERT INTO `uzf_area` VALUES ('1255', '149', '中原区', '3');
INSERT INTO `uzf_area` VALUES ('1256', '149', '上街区', '3');
INSERT INTO `uzf_area` VALUES ('1257', '149', '惠济区', '3');
INSERT INTO `uzf_area` VALUES ('1258', '149', '郑东新区', '3');
INSERT INTO `uzf_area` VALUES ('1259', '149', '经济技术开发区', '3');
INSERT INTO `uzf_area` VALUES ('1260', '149', '高新开发区', '3');
INSERT INTO `uzf_area` VALUES ('1261', '149', '出口加工区', '3');
INSERT INTO `uzf_area` VALUES ('1262', '149', '巩义市', '3');
INSERT INTO `uzf_area` VALUES ('1263', '149', '荥阳市', '3');
INSERT INTO `uzf_area` VALUES ('1264', '149', '新密市', '3');
INSERT INTO `uzf_area` VALUES ('1265', '149', '新郑市', '3');
INSERT INTO `uzf_area` VALUES ('1266', '149', '登封市', '3');
INSERT INTO `uzf_area` VALUES ('1267', '149', '中牟县', '3');
INSERT INTO `uzf_area` VALUES ('1268', '150', '西工区', '3');
INSERT INTO `uzf_area` VALUES ('1269', '150', '老城区', '3');
INSERT INTO `uzf_area` VALUES ('1270', '150', '涧西区', '3');
INSERT INTO `uzf_area` VALUES ('1271', '150', '瀍河回族区', '3');
INSERT INTO `uzf_area` VALUES ('1272', '150', '洛龙区', '3');
INSERT INTO `uzf_area` VALUES ('1273', '150', '吉利区', '3');
INSERT INTO `uzf_area` VALUES ('1274', '150', '偃师市', '3');
INSERT INTO `uzf_area` VALUES ('1275', '150', '孟津县', '3');
INSERT INTO `uzf_area` VALUES ('1276', '150', '新安县', '3');
INSERT INTO `uzf_area` VALUES ('1277', '150', '栾川县', '3');
INSERT INTO `uzf_area` VALUES ('1278', '150', '嵩县', '3');
INSERT INTO `uzf_area` VALUES ('1279', '150', '汝阳县', '3');
INSERT INTO `uzf_area` VALUES ('1280', '150', '宜阳县', '3');
INSERT INTO `uzf_area` VALUES ('1281', '150', '洛宁县', '3');
INSERT INTO `uzf_area` VALUES ('1282', '150', '伊川县', '3');
INSERT INTO `uzf_area` VALUES ('1283', '151', '鼓楼区', '3');
INSERT INTO `uzf_area` VALUES ('1284', '151', '龙亭区', '3');
INSERT INTO `uzf_area` VALUES ('1285', '151', '顺河回族区', '3');
INSERT INTO `uzf_area` VALUES ('1286', '151', '金明区', '3');
INSERT INTO `uzf_area` VALUES ('1287', '151', '禹王台区', '3');
INSERT INTO `uzf_area` VALUES ('1288', '151', '杞县', '3');
INSERT INTO `uzf_area` VALUES ('1289', '151', '通许县', '3');
INSERT INTO `uzf_area` VALUES ('1290', '151', '尉氏县', '3');
INSERT INTO `uzf_area` VALUES ('1291', '151', '开封县', '3');
INSERT INTO `uzf_area` VALUES ('1292', '151', '兰考县', '3');
INSERT INTO `uzf_area` VALUES ('1293', '152', '北关区', '3');
INSERT INTO `uzf_area` VALUES ('1294', '152', '文峰区', '3');
INSERT INTO `uzf_area` VALUES ('1295', '152', '殷都区', '3');
INSERT INTO `uzf_area` VALUES ('1296', '152', '龙安区', '3');
INSERT INTO `uzf_area` VALUES ('1297', '152', '林州市', '3');
INSERT INTO `uzf_area` VALUES ('1298', '152', '安阳县', '3');
INSERT INTO `uzf_area` VALUES ('1299', '152', '汤阴县', '3');
INSERT INTO `uzf_area` VALUES ('1300', '152', '滑县', '3');
INSERT INTO `uzf_area` VALUES ('1301', '152', '内黄县', '3');
INSERT INTO `uzf_area` VALUES ('1302', '153', '淇滨区', '3');
INSERT INTO `uzf_area` VALUES ('1303', '153', '山城区', '3');
INSERT INTO `uzf_area` VALUES ('1304', '153', '鹤山区', '3');
INSERT INTO `uzf_area` VALUES ('1305', '153', '浚县', '3');
INSERT INTO `uzf_area` VALUES ('1306', '153', '淇县', '3');
INSERT INTO `uzf_area` VALUES ('1307', '154', '济源市', '3');
INSERT INTO `uzf_area` VALUES ('1308', '155', '解放区', '3');
INSERT INTO `uzf_area` VALUES ('1309', '155', '中站区', '3');
INSERT INTO `uzf_area` VALUES ('1310', '155', '马村区', '3');
INSERT INTO `uzf_area` VALUES ('1311', '155', '山阳区', '3');
INSERT INTO `uzf_area` VALUES ('1312', '155', '沁阳市', '3');
INSERT INTO `uzf_area` VALUES ('1313', '155', '孟州市', '3');
INSERT INTO `uzf_area` VALUES ('1314', '155', '修武县', '3');
INSERT INTO `uzf_area` VALUES ('1315', '155', '博爱县', '3');
INSERT INTO `uzf_area` VALUES ('1316', '155', '武陟县', '3');
INSERT INTO `uzf_area` VALUES ('1317', '155', '温县', '3');
INSERT INTO `uzf_area` VALUES ('1318', '156', '卧龙区', '3');
INSERT INTO `uzf_area` VALUES ('1319', '156', '宛城区', '3');
INSERT INTO `uzf_area` VALUES ('1320', '156', '邓州市', '3');
INSERT INTO `uzf_area` VALUES ('1321', '156', '南召县', '3');
INSERT INTO `uzf_area` VALUES ('1322', '156', '方城县', '3');
INSERT INTO `uzf_area` VALUES ('1323', '156', '西峡县', '3');
INSERT INTO `uzf_area` VALUES ('1324', '156', '镇平县', '3');
INSERT INTO `uzf_area` VALUES ('1325', '156', '内乡县', '3');
INSERT INTO `uzf_area` VALUES ('1326', '156', '淅川县', '3');
INSERT INTO `uzf_area` VALUES ('1327', '156', '社旗县', '3');
INSERT INTO `uzf_area` VALUES ('1328', '156', '唐河县', '3');
INSERT INTO `uzf_area` VALUES ('1329', '156', '新野县', '3');
INSERT INTO `uzf_area` VALUES ('1330', '156', '桐柏县', '3');
INSERT INTO `uzf_area` VALUES ('1331', '157', '新华区', '3');
INSERT INTO `uzf_area` VALUES ('1332', '157', '卫东区', '3');
INSERT INTO `uzf_area` VALUES ('1333', '157', '湛河区', '3');
INSERT INTO `uzf_area` VALUES ('1334', '157', '石龙区', '3');
INSERT INTO `uzf_area` VALUES ('1335', '157', '舞钢市', '3');
INSERT INTO `uzf_area` VALUES ('1336', '157', '汝州市', '3');
INSERT INTO `uzf_area` VALUES ('1337', '157', '宝丰县', '3');
INSERT INTO `uzf_area` VALUES ('1338', '157', '叶县', '3');
INSERT INTO `uzf_area` VALUES ('1339', '157', '鲁山县', '3');
INSERT INTO `uzf_area` VALUES ('1340', '157', '郏县', '3');
INSERT INTO `uzf_area` VALUES ('1341', '158', '湖滨区', '3');
INSERT INTO `uzf_area` VALUES ('1342', '158', '义马市', '3');
INSERT INTO `uzf_area` VALUES ('1343', '158', '灵宝市', '3');
INSERT INTO `uzf_area` VALUES ('1344', '158', '渑池县', '3');
INSERT INTO `uzf_area` VALUES ('1345', '158', '陕县', '3');
INSERT INTO `uzf_area` VALUES ('1346', '158', '卢氏县', '3');
INSERT INTO `uzf_area` VALUES ('1347', '159', '梁园区', '3');
INSERT INTO `uzf_area` VALUES ('1348', '159', '睢阳区', '3');
INSERT INTO `uzf_area` VALUES ('1349', '159', '永城市', '3');
INSERT INTO `uzf_area` VALUES ('1350', '159', '民权县', '3');
INSERT INTO `uzf_area` VALUES ('1351', '159', '睢县', '3');
INSERT INTO `uzf_area` VALUES ('1352', '159', '宁陵县', '3');
INSERT INTO `uzf_area` VALUES ('1353', '159', '虞城县', '3');
INSERT INTO `uzf_area` VALUES ('1354', '159', '柘城县', '3');
INSERT INTO `uzf_area` VALUES ('1355', '159', '夏邑县', '3');
INSERT INTO `uzf_area` VALUES ('1356', '160', '卫滨区', '3');
INSERT INTO `uzf_area` VALUES ('1357', '160', '红旗区', '3');
INSERT INTO `uzf_area` VALUES ('1358', '160', '凤泉区', '3');
INSERT INTO `uzf_area` VALUES ('1359', '160', '牧野区', '3');
INSERT INTO `uzf_area` VALUES ('1360', '160', '卫辉市', '3');
INSERT INTO `uzf_area` VALUES ('1361', '160', '辉县市', '3');
INSERT INTO `uzf_area` VALUES ('1362', '160', '新乡县', '3');
INSERT INTO `uzf_area` VALUES ('1363', '160', '获嘉县', '3');
INSERT INTO `uzf_area` VALUES ('1364', '160', '原阳县', '3');
INSERT INTO `uzf_area` VALUES ('1365', '160', '延津县', '3');
INSERT INTO `uzf_area` VALUES ('1366', '160', '封丘县', '3');
INSERT INTO `uzf_area` VALUES ('1367', '160', '长垣县', '3');
INSERT INTO `uzf_area` VALUES ('1368', '161', '浉河区', '3');
INSERT INTO `uzf_area` VALUES ('1369', '161', '平桥区', '3');
INSERT INTO `uzf_area` VALUES ('1370', '161', '罗山县', '3');
INSERT INTO `uzf_area` VALUES ('1371', '161', '光山县', '3');
INSERT INTO `uzf_area` VALUES ('1372', '161', '新县', '3');
INSERT INTO `uzf_area` VALUES ('1373', '161', '商城县', '3');
INSERT INTO `uzf_area` VALUES ('1374', '161', '固始县', '3');
INSERT INTO `uzf_area` VALUES ('1375', '161', '潢川县', '3');
INSERT INTO `uzf_area` VALUES ('1376', '161', '淮滨县', '3');
INSERT INTO `uzf_area` VALUES ('1377', '161', '息县', '3');
INSERT INTO `uzf_area` VALUES ('1378', '162', '魏都区', '3');
INSERT INTO `uzf_area` VALUES ('1379', '162', '禹州市', '3');
INSERT INTO `uzf_area` VALUES ('1380', '162', '长葛市', '3');
INSERT INTO `uzf_area` VALUES ('1381', '162', '许昌县', '3');
INSERT INTO `uzf_area` VALUES ('1382', '162', '鄢陵县', '3');
INSERT INTO `uzf_area` VALUES ('1383', '162', '襄城县', '3');
INSERT INTO `uzf_area` VALUES ('1384', '163', '川汇区', '3');
INSERT INTO `uzf_area` VALUES ('1385', '163', '项城市', '3');
INSERT INTO `uzf_area` VALUES ('1386', '163', '扶沟县', '3');
INSERT INTO `uzf_area` VALUES ('1387', '163', '西华县', '3');
INSERT INTO `uzf_area` VALUES ('1388', '163', '商水县', '3');
INSERT INTO `uzf_area` VALUES ('1389', '163', '沈丘县', '3');
INSERT INTO `uzf_area` VALUES ('1390', '163', '郸城县', '3');
INSERT INTO `uzf_area` VALUES ('1391', '163', '淮阳县', '3');
INSERT INTO `uzf_area` VALUES ('1392', '163', '太康县', '3');
INSERT INTO `uzf_area` VALUES ('1393', '163', '鹿邑县', '3');
INSERT INTO `uzf_area` VALUES ('1394', '164', '驿城区', '3');
INSERT INTO `uzf_area` VALUES ('1395', '164', '西平县', '3');
INSERT INTO `uzf_area` VALUES ('1396', '164', '上蔡县', '3');
INSERT INTO `uzf_area` VALUES ('1397', '164', '平舆县', '3');
INSERT INTO `uzf_area` VALUES ('1398', '164', '正阳县', '3');
INSERT INTO `uzf_area` VALUES ('1399', '164', '确山县', '3');
INSERT INTO `uzf_area` VALUES ('1400', '164', '泌阳县', '3');
INSERT INTO `uzf_area` VALUES ('1401', '164', '汝南县', '3');
INSERT INTO `uzf_area` VALUES ('1402', '164', '遂平县', '3');
INSERT INTO `uzf_area` VALUES ('1403', '164', '新蔡县', '3');
INSERT INTO `uzf_area` VALUES ('1404', '165', '郾城区', '3');
INSERT INTO `uzf_area` VALUES ('1405', '165', '源汇区', '3');
INSERT INTO `uzf_area` VALUES ('1406', '165', '召陵区', '3');
INSERT INTO `uzf_area` VALUES ('1407', '165', '舞阳县', '3');
INSERT INTO `uzf_area` VALUES ('1408', '165', '临颍县', '3');
INSERT INTO `uzf_area` VALUES ('1409', '166', '华龙区', '3');
INSERT INTO `uzf_area` VALUES ('1410', '166', '清丰县', '3');
INSERT INTO `uzf_area` VALUES ('1411', '166', '南乐县', '3');
INSERT INTO `uzf_area` VALUES ('1412', '166', '范县', '3');
INSERT INTO `uzf_area` VALUES ('1413', '166', '台前县', '3');
INSERT INTO `uzf_area` VALUES ('1414', '166', '濮阳县', '3');
INSERT INTO `uzf_area` VALUES ('1415', '167', '道里区', '3');
INSERT INTO `uzf_area` VALUES ('1416', '167', '南岗区', '3');
INSERT INTO `uzf_area` VALUES ('1417', '167', '动力区', '3');
INSERT INTO `uzf_area` VALUES ('1418', '167', '平房区', '3');
INSERT INTO `uzf_area` VALUES ('1419', '167', '香坊区', '3');
INSERT INTO `uzf_area` VALUES ('1420', '167', '太平区', '3');
INSERT INTO `uzf_area` VALUES ('1421', '167', '道外区', '3');
INSERT INTO `uzf_area` VALUES ('1422', '167', '阿城区', '3');
INSERT INTO `uzf_area` VALUES ('1423', '167', '呼兰区', '3');
INSERT INTO `uzf_area` VALUES ('1424', '167', '松北区', '3');
INSERT INTO `uzf_area` VALUES ('1425', '167', '尚志市', '3');
INSERT INTO `uzf_area` VALUES ('1426', '167', '双城市', '3');
INSERT INTO `uzf_area` VALUES ('1427', '167', '五常市', '3');
INSERT INTO `uzf_area` VALUES ('1428', '167', '方正县', '3');
INSERT INTO `uzf_area` VALUES ('1429', '167', '宾县', '3');
INSERT INTO `uzf_area` VALUES ('1430', '167', '依兰县', '3');
INSERT INTO `uzf_area` VALUES ('1431', '167', '巴彦县', '3');
INSERT INTO `uzf_area` VALUES ('1432', '167', '通河县', '3');
INSERT INTO `uzf_area` VALUES ('1433', '167', '木兰县', '3');
INSERT INTO `uzf_area` VALUES ('1434', '167', '延寿县', '3');
INSERT INTO `uzf_area` VALUES ('1435', '168', '萨尔图区', '3');
INSERT INTO `uzf_area` VALUES ('1436', '168', '红岗区', '3');
INSERT INTO `uzf_area` VALUES ('1437', '168', '龙凤区', '3');
INSERT INTO `uzf_area` VALUES ('1438', '168', '让胡路区', '3');
INSERT INTO `uzf_area` VALUES ('1439', '168', '大同区', '3');
INSERT INTO `uzf_area` VALUES ('1440', '168', '肇州县', '3');
INSERT INTO `uzf_area` VALUES ('1441', '168', '肇源县', '3');
INSERT INTO `uzf_area` VALUES ('1442', '168', '林甸县', '3');
INSERT INTO `uzf_area` VALUES ('1443', '168', '杜尔伯特', '3');
INSERT INTO `uzf_area` VALUES ('1444', '169', '呼玛县', '3');
INSERT INTO `uzf_area` VALUES ('1445', '169', '漠河县', '3');
INSERT INTO `uzf_area` VALUES ('1446', '169', '塔河县', '3');
INSERT INTO `uzf_area` VALUES ('1447', '170', '兴山区', '3');
INSERT INTO `uzf_area` VALUES ('1448', '170', '工农区', '3');
INSERT INTO `uzf_area` VALUES ('1449', '170', '南山区', '3');
INSERT INTO `uzf_area` VALUES ('1450', '170', '兴安区', '3');
INSERT INTO `uzf_area` VALUES ('1451', '170', '向阳区', '3');
INSERT INTO `uzf_area` VALUES ('1452', '170', '东山区', '3');
INSERT INTO `uzf_area` VALUES ('1453', '170', '萝北县', '3');
INSERT INTO `uzf_area` VALUES ('1454', '170', '绥滨县', '3');
INSERT INTO `uzf_area` VALUES ('1455', '171', '爱辉区', '3');
INSERT INTO `uzf_area` VALUES ('1456', '171', '五大连池市', '3');
INSERT INTO `uzf_area` VALUES ('1457', '171', '北安市', '3');
INSERT INTO `uzf_area` VALUES ('1458', '171', '嫩江县', '3');
INSERT INTO `uzf_area` VALUES ('1459', '171', '逊克县', '3');
INSERT INTO `uzf_area` VALUES ('1460', '171', '孙吴县', '3');
INSERT INTO `uzf_area` VALUES ('1461', '172', '鸡冠区', '3');
INSERT INTO `uzf_area` VALUES ('1462', '172', '恒山区', '3');
INSERT INTO `uzf_area` VALUES ('1463', '172', '城子河区', '3');
INSERT INTO `uzf_area` VALUES ('1464', '172', '滴道区', '3');
INSERT INTO `uzf_area` VALUES ('1465', '172', '梨树区', '3');
INSERT INTO `uzf_area` VALUES ('1466', '172', '虎林市', '3');
INSERT INTO `uzf_area` VALUES ('1467', '172', '密山市', '3');
INSERT INTO `uzf_area` VALUES ('1468', '172', '鸡东县', '3');
INSERT INTO `uzf_area` VALUES ('1469', '173', '前进区', '3');
INSERT INTO `uzf_area` VALUES ('1470', '173', '郊区', '3');
INSERT INTO `uzf_area` VALUES ('1471', '173', '向阳区', '3');
INSERT INTO `uzf_area` VALUES ('1472', '173', '东风区', '3');
INSERT INTO `uzf_area` VALUES ('1473', '173', '同江市', '3');
INSERT INTO `uzf_area` VALUES ('1474', '173', '富锦市', '3');
INSERT INTO `uzf_area` VALUES ('1475', '173', '桦南县', '3');
INSERT INTO `uzf_area` VALUES ('1476', '173', '桦川县', '3');
INSERT INTO `uzf_area` VALUES ('1477', '173', '汤原县', '3');
INSERT INTO `uzf_area` VALUES ('1478', '173', '抚远县', '3');
INSERT INTO `uzf_area` VALUES ('1479', '174', '爱民区', '3');
INSERT INTO `uzf_area` VALUES ('1480', '174', '东安区', '3');
INSERT INTO `uzf_area` VALUES ('1481', '174', '阳明区', '3');
INSERT INTO `uzf_area` VALUES ('1482', '174', '西安区', '3');
INSERT INTO `uzf_area` VALUES ('1483', '174', '绥芬河市', '3');
INSERT INTO `uzf_area` VALUES ('1484', '174', '海林市', '3');
INSERT INTO `uzf_area` VALUES ('1485', '174', '宁安市', '3');
INSERT INTO `uzf_area` VALUES ('1486', '174', '穆棱市', '3');
INSERT INTO `uzf_area` VALUES ('1487', '174', '东宁县', '3');
INSERT INTO `uzf_area` VALUES ('1488', '174', '林口县', '3');
INSERT INTO `uzf_area` VALUES ('1489', '175', '桃山区', '3');
INSERT INTO `uzf_area` VALUES ('1490', '175', '新兴区', '3');
INSERT INTO `uzf_area` VALUES ('1491', '175', '茄子河区', '3');
INSERT INTO `uzf_area` VALUES ('1492', '175', '勃利县', '3');
INSERT INTO `uzf_area` VALUES ('1493', '176', '龙沙区', '3');
INSERT INTO `uzf_area` VALUES ('1494', '176', '昂昂溪区', '3');
INSERT INTO `uzf_area` VALUES ('1495', '176', '铁峰区', '3');
INSERT INTO `uzf_area` VALUES ('1496', '176', '建华区', '3');
INSERT INTO `uzf_area` VALUES ('1497', '176', '富拉尔基区', '3');
INSERT INTO `uzf_area` VALUES ('1498', '176', '碾子山区', '3');
INSERT INTO `uzf_area` VALUES ('1499', '176', '梅里斯达斡尔区', '3');
INSERT INTO `uzf_area` VALUES ('1500', '176', '讷河市', '3');
INSERT INTO `uzf_area` VALUES ('1501', '176', '龙江县', '3');
INSERT INTO `uzf_area` VALUES ('1502', '176', '依安县', '3');
INSERT INTO `uzf_area` VALUES ('1503', '176', '泰来县', '3');
INSERT INTO `uzf_area` VALUES ('1504', '176', '甘南县', '3');
INSERT INTO `uzf_area` VALUES ('1505', '176', '富裕县', '3');
INSERT INTO `uzf_area` VALUES ('1506', '176', '克山县', '3');
INSERT INTO `uzf_area` VALUES ('1507', '176', '克东县', '3');
INSERT INTO `uzf_area` VALUES ('1508', '176', '拜泉县', '3');
INSERT INTO `uzf_area` VALUES ('1509', '177', '尖山区', '3');
INSERT INTO `uzf_area` VALUES ('1510', '177', '岭东区', '3');
INSERT INTO `uzf_area` VALUES ('1511', '177', '四方台区', '3');
INSERT INTO `uzf_area` VALUES ('1512', '177', '宝山区', '3');
INSERT INTO `uzf_area` VALUES ('1513', '177', '集贤县', '3');
INSERT INTO `uzf_area` VALUES ('1514', '177', '友谊县', '3');
INSERT INTO `uzf_area` VALUES ('1515', '177', '宝清县', '3');
INSERT INTO `uzf_area` VALUES ('1516', '177', '饶河县', '3');
INSERT INTO `uzf_area` VALUES ('1517', '178', '北林区', '3');
INSERT INTO `uzf_area` VALUES ('1518', '178', '安达市', '3');
INSERT INTO `uzf_area` VALUES ('1519', '178', '肇东市', '3');
INSERT INTO `uzf_area` VALUES ('1520', '178', '海伦市', '3');
INSERT INTO `uzf_area` VALUES ('1521', '178', '望奎县', '3');
INSERT INTO `uzf_area` VALUES ('1522', '178', '兰西县', '3');
INSERT INTO `uzf_area` VALUES ('1523', '178', '青冈县', '3');
INSERT INTO `uzf_area` VALUES ('1524', '178', '庆安县', '3');
INSERT INTO `uzf_area` VALUES ('1525', '178', '明水县', '3');
INSERT INTO `uzf_area` VALUES ('1526', '178', '绥棱县', '3');
INSERT INTO `uzf_area` VALUES ('1527', '179', '伊春区', '3');
INSERT INTO `uzf_area` VALUES ('1528', '179', '带岭区', '3');
INSERT INTO `uzf_area` VALUES ('1529', '179', '南岔区', '3');
INSERT INTO `uzf_area` VALUES ('1530', '179', '金山屯区', '3');
INSERT INTO `uzf_area` VALUES ('1531', '179', '西林区', '3');
INSERT INTO `uzf_area` VALUES ('1532', '179', '美溪区', '3');
INSERT INTO `uzf_area` VALUES ('1533', '179', '乌马河区', '3');
INSERT INTO `uzf_area` VALUES ('1534', '179', '翠峦区', '3');
INSERT INTO `uzf_area` VALUES ('1535', '179', '友好区', '3');
INSERT INTO `uzf_area` VALUES ('1536', '179', '上甘岭区', '3');
INSERT INTO `uzf_area` VALUES ('1537', '179', '五营区', '3');
INSERT INTO `uzf_area` VALUES ('1538', '179', '红星区', '3');
INSERT INTO `uzf_area` VALUES ('1539', '179', '新青区', '3');
INSERT INTO `uzf_area` VALUES ('1540', '179', '汤旺河区', '3');
INSERT INTO `uzf_area` VALUES ('1541', '179', '乌伊岭区', '3');
INSERT INTO `uzf_area` VALUES ('1542', '179', '铁力市', '3');
INSERT INTO `uzf_area` VALUES ('1543', '179', '嘉荫县', '3');
INSERT INTO `uzf_area` VALUES ('1544', '180', '江岸区', '3');
INSERT INTO `uzf_area` VALUES ('1545', '180', '武昌区', '3');
INSERT INTO `uzf_area` VALUES ('1546', '180', '江汉区', '3');
INSERT INTO `uzf_area` VALUES ('1547', '180', '硚口区', '3');
INSERT INTO `uzf_area` VALUES ('1548', '180', '汉阳区', '3');
INSERT INTO `uzf_area` VALUES ('1549', '180', '青山区', '3');
INSERT INTO `uzf_area` VALUES ('1550', '180', '洪山区', '3');
INSERT INTO `uzf_area` VALUES ('1551', '180', '东西湖区', '3');
INSERT INTO `uzf_area` VALUES ('1552', '180', '汉南区', '3');
INSERT INTO `uzf_area` VALUES ('1553', '180', '蔡甸区', '3');
INSERT INTO `uzf_area` VALUES ('1554', '180', '江夏区', '3');
INSERT INTO `uzf_area` VALUES ('1555', '180', '黄陂区', '3');
INSERT INTO `uzf_area` VALUES ('1556', '180', '新洲区', '3');
INSERT INTO `uzf_area` VALUES ('1557', '180', '经济开发区', '3');
INSERT INTO `uzf_area` VALUES ('1558', '181', '仙桃市', '3');
INSERT INTO `uzf_area` VALUES ('1559', '182', '鄂城区', '3');
INSERT INTO `uzf_area` VALUES ('1560', '182', '华容区', '3');
INSERT INTO `uzf_area` VALUES ('1561', '182', '梁子湖区', '3');
INSERT INTO `uzf_area` VALUES ('1562', '183', '黄州区', '3');
INSERT INTO `uzf_area` VALUES ('1563', '183', '麻城市', '3');
INSERT INTO `uzf_area` VALUES ('1564', '183', '武穴市', '3');
INSERT INTO `uzf_area` VALUES ('1565', '183', '团风县', '3');
INSERT INTO `uzf_area` VALUES ('1566', '183', '红安县', '3');
INSERT INTO `uzf_area` VALUES ('1567', '183', '罗田县', '3');
INSERT INTO `uzf_area` VALUES ('1568', '183', '英山县', '3');
INSERT INTO `uzf_area` VALUES ('1569', '183', '浠水县', '3');
INSERT INTO `uzf_area` VALUES ('1570', '183', '蕲春县', '3');
INSERT INTO `uzf_area` VALUES ('1571', '183', '黄梅县', '3');
INSERT INTO `uzf_area` VALUES ('1572', '184', '黄石港区', '3');
INSERT INTO `uzf_area` VALUES ('1573', '184', '西塞山区', '3');
INSERT INTO `uzf_area` VALUES ('1574', '184', '下陆区', '3');
INSERT INTO `uzf_area` VALUES ('1575', '184', '铁山区', '3');
INSERT INTO `uzf_area` VALUES ('1576', '184', '大冶市', '3');
INSERT INTO `uzf_area` VALUES ('1577', '184', '阳新县', '3');
INSERT INTO `uzf_area` VALUES ('1578', '185', '东宝区', '3');
INSERT INTO `uzf_area` VALUES ('1579', '185', '掇刀区', '3');
INSERT INTO `uzf_area` VALUES ('1580', '185', '钟祥市', '3');
INSERT INTO `uzf_area` VALUES ('1581', '185', '京山县', '3');
INSERT INTO `uzf_area` VALUES ('1582', '185', '沙洋县', '3');
INSERT INTO `uzf_area` VALUES ('1583', '186', '沙市区', '3');
INSERT INTO `uzf_area` VALUES ('1584', '186', '荆州区', '3');
INSERT INTO `uzf_area` VALUES ('1585', '186', '石首市', '3');
INSERT INTO `uzf_area` VALUES ('1586', '186', '洪湖市', '3');
INSERT INTO `uzf_area` VALUES ('1587', '186', '松滋市', '3');
INSERT INTO `uzf_area` VALUES ('1588', '186', '公安县', '3');
INSERT INTO `uzf_area` VALUES ('1589', '186', '监利县', '3');
INSERT INTO `uzf_area` VALUES ('1590', '186', '江陵县', '3');
INSERT INTO `uzf_area` VALUES ('1591', '187', '潜江市', '3');
INSERT INTO `uzf_area` VALUES ('1592', '188', '神农架林区', '3');
INSERT INTO `uzf_area` VALUES ('1593', '189', '张湾区', '3');
INSERT INTO `uzf_area` VALUES ('1594', '189', '茅箭区', '3');
INSERT INTO `uzf_area` VALUES ('1595', '189', '丹江口市', '3');
INSERT INTO `uzf_area` VALUES ('1596', '189', '郧县', '3');
INSERT INTO `uzf_area` VALUES ('1597', '189', '郧西县', '3');
INSERT INTO `uzf_area` VALUES ('1598', '189', '竹山县', '3');
INSERT INTO `uzf_area` VALUES ('1599', '189', '竹溪县', '3');
INSERT INTO `uzf_area` VALUES ('1600', '189', '房县', '3');
INSERT INTO `uzf_area` VALUES ('1601', '190', '曾都区', '3');
INSERT INTO `uzf_area` VALUES ('1602', '190', '广水市', '3');
INSERT INTO `uzf_area` VALUES ('1603', '191', '天门市', '3');
INSERT INTO `uzf_area` VALUES ('1604', '192', '咸安区', '3');
INSERT INTO `uzf_area` VALUES ('1605', '192', '赤壁市', '3');
INSERT INTO `uzf_area` VALUES ('1606', '192', '嘉鱼县', '3');
INSERT INTO `uzf_area` VALUES ('1607', '192', '通城县', '3');
INSERT INTO `uzf_area` VALUES ('1608', '192', '崇阳县', '3');
INSERT INTO `uzf_area` VALUES ('1609', '192', '通山县', '3');
INSERT INTO `uzf_area` VALUES ('1610', '193', '襄城区', '3');
INSERT INTO `uzf_area` VALUES ('1611', '193', '樊城区', '3');
INSERT INTO `uzf_area` VALUES ('1612', '193', '襄阳区', '3');
INSERT INTO `uzf_area` VALUES ('1613', '193', '老河口市', '3');
INSERT INTO `uzf_area` VALUES ('1614', '193', '枣阳市', '3');
INSERT INTO `uzf_area` VALUES ('1615', '193', '宜城市', '3');
INSERT INTO `uzf_area` VALUES ('1616', '193', '南漳县', '3');
INSERT INTO `uzf_area` VALUES ('1617', '193', '谷城县', '3');
INSERT INTO `uzf_area` VALUES ('1618', '193', '保康县', '3');
INSERT INTO `uzf_area` VALUES ('1619', '194', '孝南区', '3');
INSERT INTO `uzf_area` VALUES ('1620', '194', '应城市', '3');
INSERT INTO `uzf_area` VALUES ('1621', '194', '安陆市', '3');
INSERT INTO `uzf_area` VALUES ('1622', '194', '汉川市', '3');
INSERT INTO `uzf_area` VALUES ('1623', '194', '孝昌县', '3');
INSERT INTO `uzf_area` VALUES ('1624', '194', '大悟县', '3');
INSERT INTO `uzf_area` VALUES ('1625', '194', '云梦县', '3');
INSERT INTO `uzf_area` VALUES ('1626', '195', '长阳', '3');
INSERT INTO `uzf_area` VALUES ('1627', '195', '五峰', '3');
INSERT INTO `uzf_area` VALUES ('1628', '195', '西陵区', '3');
INSERT INTO `uzf_area` VALUES ('1629', '195', '伍家岗区', '3');
INSERT INTO `uzf_area` VALUES ('1630', '195', '点军区', '3');
INSERT INTO `uzf_area` VALUES ('1631', '195', '猇亭区', '3');
INSERT INTO `uzf_area` VALUES ('1632', '195', '夷陵区', '3');
INSERT INTO `uzf_area` VALUES ('1633', '195', '宜都市', '3');
INSERT INTO `uzf_area` VALUES ('1634', '195', '当阳市', '3');
INSERT INTO `uzf_area` VALUES ('1635', '195', '枝江市', '3');
INSERT INTO `uzf_area` VALUES ('1636', '195', '远安县', '3');
INSERT INTO `uzf_area` VALUES ('1637', '195', '兴山县', '3');
INSERT INTO `uzf_area` VALUES ('1638', '195', '秭归县', '3');
INSERT INTO `uzf_area` VALUES ('1639', '196', '恩施市', '3');
INSERT INTO `uzf_area` VALUES ('1640', '196', '利川市', '3');
INSERT INTO `uzf_area` VALUES ('1641', '196', '建始县', '3');
INSERT INTO `uzf_area` VALUES ('1642', '196', '巴东县', '3');
INSERT INTO `uzf_area` VALUES ('1643', '196', '宣恩县', '3');
INSERT INTO `uzf_area` VALUES ('1644', '196', '咸丰县', '3');
INSERT INTO `uzf_area` VALUES ('1645', '196', '来凤县', '3');
INSERT INTO `uzf_area` VALUES ('1646', '196', '鹤峰县', '3');
INSERT INTO `uzf_area` VALUES ('1647', '197', '岳麓区', '3');
INSERT INTO `uzf_area` VALUES ('1648', '197', '芙蓉区', '3');
INSERT INTO `uzf_area` VALUES ('1649', '197', '天心区', '3');
INSERT INTO `uzf_area` VALUES ('1650', '197', '开福区', '3');
INSERT INTO `uzf_area` VALUES ('1651', '197', '雨花区', '3');
INSERT INTO `uzf_area` VALUES ('1652', '197', '开发区', '3');
INSERT INTO `uzf_area` VALUES ('1653', '197', '浏阳市', '3');
INSERT INTO `uzf_area` VALUES ('1654', '197', '长沙县', '3');
INSERT INTO `uzf_area` VALUES ('1655', '197', '望城县', '3');
INSERT INTO `uzf_area` VALUES ('1656', '197', '宁乡县', '3');
INSERT INTO `uzf_area` VALUES ('1657', '198', '永定区', '3');
INSERT INTO `uzf_area` VALUES ('1658', '198', '武陵源区', '3');
INSERT INTO `uzf_area` VALUES ('1659', '198', '慈利县', '3');
INSERT INTO `uzf_area` VALUES ('1660', '198', '桑植县', '3');
INSERT INTO `uzf_area` VALUES ('1661', '199', '武陵区', '3');
INSERT INTO `uzf_area` VALUES ('1662', '199', '鼎城区', '3');
INSERT INTO `uzf_area` VALUES ('1663', '199', '津市市', '3');
INSERT INTO `uzf_area` VALUES ('1664', '199', '安乡县', '3');
INSERT INTO `uzf_area` VALUES ('1665', '199', '汉寿县', '3');
INSERT INTO `uzf_area` VALUES ('1666', '199', '澧县', '3');
INSERT INTO `uzf_area` VALUES ('1667', '199', '临澧县', '3');
INSERT INTO `uzf_area` VALUES ('1668', '199', '桃源县', '3');
INSERT INTO `uzf_area` VALUES ('1669', '199', '石门县', '3');
INSERT INTO `uzf_area` VALUES ('1670', '200', '北湖区', '3');
INSERT INTO `uzf_area` VALUES ('1671', '200', '苏仙区', '3');
INSERT INTO `uzf_area` VALUES ('1672', '200', '资兴市', '3');
INSERT INTO `uzf_area` VALUES ('1673', '200', '桂阳县', '3');
INSERT INTO `uzf_area` VALUES ('1674', '200', '宜章县', '3');
INSERT INTO `uzf_area` VALUES ('1675', '200', '永兴县', '3');
INSERT INTO `uzf_area` VALUES ('1676', '200', '嘉禾县', '3');
INSERT INTO `uzf_area` VALUES ('1677', '200', '临武县', '3');
INSERT INTO `uzf_area` VALUES ('1678', '200', '汝城县', '3');
INSERT INTO `uzf_area` VALUES ('1679', '200', '桂东县', '3');
INSERT INTO `uzf_area` VALUES ('1680', '200', '安仁县', '3');
INSERT INTO `uzf_area` VALUES ('1681', '201', '雁峰区', '3');
INSERT INTO `uzf_area` VALUES ('1682', '201', '珠晖区', '3');
INSERT INTO `uzf_area` VALUES ('1683', '201', '石鼓区', '3');
INSERT INTO `uzf_area` VALUES ('1684', '201', '蒸湘区', '3');
INSERT INTO `uzf_area` VALUES ('1685', '201', '南岳区', '3');
INSERT INTO `uzf_area` VALUES ('1686', '201', '耒阳市', '3');
INSERT INTO `uzf_area` VALUES ('1687', '201', '常宁市', '3');
INSERT INTO `uzf_area` VALUES ('1688', '201', '衡阳县', '3');
INSERT INTO `uzf_area` VALUES ('1689', '201', '衡南县', '3');
INSERT INTO `uzf_area` VALUES ('1690', '201', '衡山县', '3');
INSERT INTO `uzf_area` VALUES ('1691', '201', '衡东县', '3');
INSERT INTO `uzf_area` VALUES ('1692', '201', '祁东县', '3');
INSERT INTO `uzf_area` VALUES ('1693', '202', '鹤城区', '3');
INSERT INTO `uzf_area` VALUES ('1694', '202', '靖州', '3');
INSERT INTO `uzf_area` VALUES ('1695', '202', '麻阳', '3');
INSERT INTO `uzf_area` VALUES ('1696', '202', '通道', '3');
INSERT INTO `uzf_area` VALUES ('1697', '202', '新晃', '3');
INSERT INTO `uzf_area` VALUES ('1698', '202', '芷江', '3');
INSERT INTO `uzf_area` VALUES ('1699', '202', '沅陵县', '3');
INSERT INTO `uzf_area` VALUES ('1700', '202', '辰溪县', '3');
INSERT INTO `uzf_area` VALUES ('1701', '202', '溆浦县', '3');
INSERT INTO `uzf_area` VALUES ('1702', '202', '中方县', '3');
INSERT INTO `uzf_area` VALUES ('1703', '202', '会同县', '3');
INSERT INTO `uzf_area` VALUES ('1704', '202', '洪江市', '3');
INSERT INTO `uzf_area` VALUES ('1705', '203', '娄星区', '3');
INSERT INTO `uzf_area` VALUES ('1706', '203', '冷水江市', '3');
INSERT INTO `uzf_area` VALUES ('1707', '203', '涟源市', '3');
INSERT INTO `uzf_area` VALUES ('1708', '203', '双峰县', '3');
INSERT INTO `uzf_area` VALUES ('1709', '203', '新化县', '3');
INSERT INTO `uzf_area` VALUES ('1710', '204', '城步', '3');
INSERT INTO `uzf_area` VALUES ('1711', '204', '双清区', '3');
INSERT INTO `uzf_area` VALUES ('1712', '204', '大祥区', '3');
INSERT INTO `uzf_area` VALUES ('1713', '204', '北塔区', '3');
INSERT INTO `uzf_area` VALUES ('1714', '204', '武冈市', '3');
INSERT INTO `uzf_area` VALUES ('1715', '204', '邵东县', '3');
INSERT INTO `uzf_area` VALUES ('1716', '204', '新邵县', '3');
INSERT INTO `uzf_area` VALUES ('1717', '204', '邵阳县', '3');
INSERT INTO `uzf_area` VALUES ('1718', '204', '隆回县', '3');
INSERT INTO `uzf_area` VALUES ('1719', '204', '洞口县', '3');
INSERT INTO `uzf_area` VALUES ('1720', '204', '绥宁县', '3');
INSERT INTO `uzf_area` VALUES ('1721', '204', '新宁县', '3');
INSERT INTO `uzf_area` VALUES ('1722', '205', '岳塘区', '3');
INSERT INTO `uzf_area` VALUES ('1723', '205', '雨湖区', '3');
INSERT INTO `uzf_area` VALUES ('1724', '205', '湘乡市', '3');
INSERT INTO `uzf_area` VALUES ('1725', '205', '韶山市', '3');
INSERT INTO `uzf_area` VALUES ('1726', '205', '湘潭县', '3');
INSERT INTO `uzf_area` VALUES ('1727', '206', '吉首市', '3');
INSERT INTO `uzf_area` VALUES ('1728', '206', '泸溪县', '3');
INSERT INTO `uzf_area` VALUES ('1729', '206', '凤凰县', '3');
INSERT INTO `uzf_area` VALUES ('1730', '206', '花垣县', '3');
INSERT INTO `uzf_area` VALUES ('1731', '206', '保靖县', '3');
INSERT INTO `uzf_area` VALUES ('1732', '206', '古丈县', '3');
INSERT INTO `uzf_area` VALUES ('1733', '206', '永顺县', '3');
INSERT INTO `uzf_area` VALUES ('1734', '206', '龙山县', '3');
INSERT INTO `uzf_area` VALUES ('1735', '207', '赫山区', '3');
INSERT INTO `uzf_area` VALUES ('1736', '207', '资阳区', '3');
INSERT INTO `uzf_area` VALUES ('1737', '207', '沅江市', '3');
INSERT INTO `uzf_area` VALUES ('1738', '207', '南县', '3');
INSERT INTO `uzf_area` VALUES ('1739', '207', '桃江县', '3');
INSERT INTO `uzf_area` VALUES ('1740', '207', '安化县', '3');
INSERT INTO `uzf_area` VALUES ('1741', '208', '江华', '3');
INSERT INTO `uzf_area` VALUES ('1742', '208', '冷水滩区', '3');
INSERT INTO `uzf_area` VALUES ('1743', '208', '零陵区', '3');
INSERT INTO `uzf_area` VALUES ('1744', '208', '祁阳县', '3');
INSERT INTO `uzf_area` VALUES ('1745', '208', '东安县', '3');
INSERT INTO `uzf_area` VALUES ('1746', '208', '双牌县', '3');
INSERT INTO `uzf_area` VALUES ('1747', '208', '道县', '3');
INSERT INTO `uzf_area` VALUES ('1748', '208', '江永县', '3');
INSERT INTO `uzf_area` VALUES ('1749', '208', '宁远县', '3');
INSERT INTO `uzf_area` VALUES ('1750', '208', '蓝山县', '3');
INSERT INTO `uzf_area` VALUES ('1751', '208', '新田县', '3');
INSERT INTO `uzf_area` VALUES ('1752', '209', '岳阳楼区', '3');
INSERT INTO `uzf_area` VALUES ('1753', '209', '君山区', '3');
INSERT INTO `uzf_area` VALUES ('1754', '209', '云溪区', '3');
INSERT INTO `uzf_area` VALUES ('1755', '209', '汨罗市', '3');
INSERT INTO `uzf_area` VALUES ('1756', '209', '临湘市', '3');
INSERT INTO `uzf_area` VALUES ('1757', '209', '岳阳县', '3');
INSERT INTO `uzf_area` VALUES ('1758', '209', '华容县', '3');
INSERT INTO `uzf_area` VALUES ('1759', '209', '湘阴县', '3');
INSERT INTO `uzf_area` VALUES ('1760', '209', '平江县', '3');
INSERT INTO `uzf_area` VALUES ('1761', '210', '天元区', '3');
INSERT INTO `uzf_area` VALUES ('1762', '210', '荷塘区', '3');
INSERT INTO `uzf_area` VALUES ('1763', '210', '芦淞区', '3');
INSERT INTO `uzf_area` VALUES ('1764', '210', '石峰区', '3');
INSERT INTO `uzf_area` VALUES ('1765', '210', '醴陵市', '3');
INSERT INTO `uzf_area` VALUES ('1766', '210', '株洲县', '3');
INSERT INTO `uzf_area` VALUES ('1767', '210', '攸县', '3');
INSERT INTO `uzf_area` VALUES ('1768', '210', '茶陵县', '3');
INSERT INTO `uzf_area` VALUES ('1769', '210', '炎陵县', '3');
INSERT INTO `uzf_area` VALUES ('1770', '211', '朝阳区', '3');
INSERT INTO `uzf_area` VALUES ('1771', '211', '宽城区', '3');
INSERT INTO `uzf_area` VALUES ('1772', '211', '二道区', '3');
INSERT INTO `uzf_area` VALUES ('1773', '211', '南关区', '3');
INSERT INTO `uzf_area` VALUES ('1774', '211', '绿园区', '3');
INSERT INTO `uzf_area` VALUES ('1775', '211', '双阳区', '3');
INSERT INTO `uzf_area` VALUES ('1776', '211', '净月潭开发区', '3');
INSERT INTO `uzf_area` VALUES ('1777', '211', '高新技术开发区', '3');
INSERT INTO `uzf_area` VALUES ('1778', '211', '经济技术开发区', '3');
INSERT INTO `uzf_area` VALUES ('1779', '211', '汽车产业开发区', '3');
INSERT INTO `uzf_area` VALUES ('1780', '211', '德惠市', '3');
INSERT INTO `uzf_area` VALUES ('1781', '211', '九台市', '3');
INSERT INTO `uzf_area` VALUES ('1782', '211', '榆树市', '3');
INSERT INTO `uzf_area` VALUES ('1783', '211', '农安县', '3');
INSERT INTO `uzf_area` VALUES ('1784', '212', '船营区', '3');
INSERT INTO `uzf_area` VALUES ('1785', '212', '昌邑区', '3');
INSERT INTO `uzf_area` VALUES ('1786', '212', '龙潭区', '3');
INSERT INTO `uzf_area` VALUES ('1787', '212', '丰满区', '3');
INSERT INTO `uzf_area` VALUES ('1788', '212', '蛟河市', '3');
INSERT INTO `uzf_area` VALUES ('1789', '212', '桦甸市', '3');
INSERT INTO `uzf_area` VALUES ('1790', '212', '舒兰市', '3');
INSERT INTO `uzf_area` VALUES ('1791', '212', '磐石市', '3');
INSERT INTO `uzf_area` VALUES ('1792', '212', '永吉县', '3');
INSERT INTO `uzf_area` VALUES ('1793', '213', '洮北区', '3');
INSERT INTO `uzf_area` VALUES ('1794', '213', '洮南市', '3');
INSERT INTO `uzf_area` VALUES ('1795', '213', '大安市', '3');
INSERT INTO `uzf_area` VALUES ('1796', '213', '镇赉县', '3');
INSERT INTO `uzf_area` VALUES ('1797', '213', '通榆县', '3');
INSERT INTO `uzf_area` VALUES ('1798', '214', '江源区', '3');
INSERT INTO `uzf_area` VALUES ('1799', '214', '八道江区', '3');
INSERT INTO `uzf_area` VALUES ('1800', '214', '长白', '3');
INSERT INTO `uzf_area` VALUES ('1801', '214', '临江市', '3');
INSERT INTO `uzf_area` VALUES ('1802', '214', '抚松县', '3');
INSERT INTO `uzf_area` VALUES ('1803', '214', '靖宇县', '3');
INSERT INTO `uzf_area` VALUES ('1804', '215', '龙山区', '3');
INSERT INTO `uzf_area` VALUES ('1805', '215', '西安区', '3');
INSERT INTO `uzf_area` VALUES ('1806', '215', '东丰县', '3');
INSERT INTO `uzf_area` VALUES ('1807', '215', '东辽县', '3');
INSERT INTO `uzf_area` VALUES ('1808', '216', '铁西区', '3');
INSERT INTO `uzf_area` VALUES ('1809', '216', '铁东区', '3');
INSERT INTO `uzf_area` VALUES ('1810', '216', '伊通', '3');
INSERT INTO `uzf_area` VALUES ('1811', '216', '公主岭市', '3');
INSERT INTO `uzf_area` VALUES ('1812', '216', '双辽市', '3');
INSERT INTO `uzf_area` VALUES ('1813', '216', '梨树县', '3');
INSERT INTO `uzf_area` VALUES ('1814', '217', '前郭尔罗斯', '3');
INSERT INTO `uzf_area` VALUES ('1815', '217', '宁江区', '3');
INSERT INTO `uzf_area` VALUES ('1816', '217', '长岭县', '3');
INSERT INTO `uzf_area` VALUES ('1817', '217', '乾安县', '3');
INSERT INTO `uzf_area` VALUES ('1818', '217', '扶余县', '3');
INSERT INTO `uzf_area` VALUES ('1819', '218', '东昌区', '3');
INSERT INTO `uzf_area` VALUES ('1820', '218', '二道江区', '3');
INSERT INTO `uzf_area` VALUES ('1821', '218', '梅河口市', '3');
INSERT INTO `uzf_area` VALUES ('1822', '218', '集安市', '3');
INSERT INTO `uzf_area` VALUES ('1823', '218', '通化县', '3');
INSERT INTO `uzf_area` VALUES ('1824', '218', '辉南县', '3');
INSERT INTO `uzf_area` VALUES ('1825', '218', '柳河县', '3');
INSERT INTO `uzf_area` VALUES ('1826', '219', '延吉市', '3');
INSERT INTO `uzf_area` VALUES ('1827', '219', '图们市', '3');
INSERT INTO `uzf_area` VALUES ('1828', '219', '敦化市', '3');
INSERT INTO `uzf_area` VALUES ('1829', '219', '珲春市', '3');
INSERT INTO `uzf_area` VALUES ('1830', '219', '龙井市', '3');
INSERT INTO `uzf_area` VALUES ('1831', '219', '和龙市', '3');
INSERT INTO `uzf_area` VALUES ('1832', '219', '安图县', '3');
INSERT INTO `uzf_area` VALUES ('1833', '219', '汪清县', '3');
INSERT INTO `uzf_area` VALUES ('1834', '220', '玄武区', '3');
INSERT INTO `uzf_area` VALUES ('1835', '220', '鼓楼区', '3');
INSERT INTO `uzf_area` VALUES ('1836', '220', '白下区', '3');
INSERT INTO `uzf_area` VALUES ('1837', '220', '建邺区', '3');
INSERT INTO `uzf_area` VALUES ('1838', '220', '秦淮区', '3');
INSERT INTO `uzf_area` VALUES ('1839', '220', '雨花台区', '3');
INSERT INTO `uzf_area` VALUES ('1840', '220', '下关区', '3');
INSERT INTO `uzf_area` VALUES ('1841', '220', '栖霞区', '3');
INSERT INTO `uzf_area` VALUES ('1842', '220', '浦口区', '3');
INSERT INTO `uzf_area` VALUES ('1843', '220', '江宁区', '3');
INSERT INTO `uzf_area` VALUES ('1844', '220', '六合区', '3');
INSERT INTO `uzf_area` VALUES ('1845', '220', '溧水县', '3');
INSERT INTO `uzf_area` VALUES ('1846', '220', '高淳县', '3');
INSERT INTO `uzf_area` VALUES ('1847', '221', '沧浪区', '3');
INSERT INTO `uzf_area` VALUES ('1848', '221', '金阊区', '3');
INSERT INTO `uzf_area` VALUES ('1849', '221', '平江区', '3');
INSERT INTO `uzf_area` VALUES ('1850', '221', '虎丘区', '3');
INSERT INTO `uzf_area` VALUES ('1851', '221', '吴中区', '3');
INSERT INTO `uzf_area` VALUES ('1852', '221', '相城区', '3');
INSERT INTO `uzf_area` VALUES ('1853', '221', '园区', '3');
INSERT INTO `uzf_area` VALUES ('1854', '221', '新区', '3');
INSERT INTO `uzf_area` VALUES ('1855', '221', '常熟市', '3');
INSERT INTO `uzf_area` VALUES ('1856', '221', '张家港市', '3');
INSERT INTO `uzf_area` VALUES ('1857', '221', '玉山镇', '3');
INSERT INTO `uzf_area` VALUES ('1858', '221', '巴城镇', '3');
INSERT INTO `uzf_area` VALUES ('1859', '221', '周市镇', '3');
INSERT INTO `uzf_area` VALUES ('1860', '221', '陆家镇', '3');
INSERT INTO `uzf_area` VALUES ('1861', '221', '花桥镇', '3');
INSERT INTO `uzf_area` VALUES ('1862', '221', '淀山湖镇', '3');
INSERT INTO `uzf_area` VALUES ('1863', '221', '张浦镇', '3');
INSERT INTO `uzf_area` VALUES ('1864', '221', '周庄镇', '3');
INSERT INTO `uzf_area` VALUES ('1865', '221', '千灯镇', '3');
INSERT INTO `uzf_area` VALUES ('1866', '221', '锦溪镇', '3');
INSERT INTO `uzf_area` VALUES ('1867', '221', '开发区', '3');
INSERT INTO `uzf_area` VALUES ('1868', '221', '吴江市', '3');
INSERT INTO `uzf_area` VALUES ('1869', '221', '太仓市', '3');
INSERT INTO `uzf_area` VALUES ('1870', '222', '崇安区', '3');
INSERT INTO `uzf_area` VALUES ('1871', '222', '北塘区', '3');
INSERT INTO `uzf_area` VALUES ('1872', '222', '南长区', '3');
INSERT INTO `uzf_area` VALUES ('1873', '222', '锡山区', '3');
INSERT INTO `uzf_area` VALUES ('1874', '222', '惠山区', '3');
INSERT INTO `uzf_area` VALUES ('1875', '222', '滨湖区', '3');
INSERT INTO `uzf_area` VALUES ('1876', '222', '新区', '3');
INSERT INTO `uzf_area` VALUES ('1877', '222', '江阴市', '3');
INSERT INTO `uzf_area` VALUES ('1878', '222', '宜兴市', '3');
INSERT INTO `uzf_area` VALUES ('1879', '223', '天宁区', '3');
INSERT INTO `uzf_area` VALUES ('1880', '223', '钟楼区', '3');
INSERT INTO `uzf_area` VALUES ('1881', '223', '戚墅堰区', '3');
INSERT INTO `uzf_area` VALUES ('1882', '223', '郊区', '3');
INSERT INTO `uzf_area` VALUES ('1883', '223', '新北区', '3');
INSERT INTO `uzf_area` VALUES ('1884', '223', '武进区', '3');
INSERT INTO `uzf_area` VALUES ('1885', '223', '溧阳市', '3');
INSERT INTO `uzf_area` VALUES ('1886', '223', '金坛市', '3');
INSERT INTO `uzf_area` VALUES ('1887', '224', '清河区', '3');
INSERT INTO `uzf_area` VALUES ('1888', '224', '清浦区', '3');
INSERT INTO `uzf_area` VALUES ('1889', '224', '楚州区', '3');
INSERT INTO `uzf_area` VALUES ('1890', '224', '淮阴区', '3');
INSERT INTO `uzf_area` VALUES ('1891', '224', '涟水县', '3');
INSERT INTO `uzf_area` VALUES ('1892', '224', '洪泽县', '3');
INSERT INTO `uzf_area` VALUES ('1893', '224', '盱眙县', '3');
INSERT INTO `uzf_area` VALUES ('1894', '224', '金湖县', '3');
INSERT INTO `uzf_area` VALUES ('1895', '225', '新浦区', '3');
INSERT INTO `uzf_area` VALUES ('1896', '225', '连云区', '3');
INSERT INTO `uzf_area` VALUES ('1897', '225', '海州区', '3');
INSERT INTO `uzf_area` VALUES ('1898', '225', '赣榆县', '3');
INSERT INTO `uzf_area` VALUES ('1899', '225', '东海县', '3');
INSERT INTO `uzf_area` VALUES ('1900', '225', '灌云县', '3');
INSERT INTO `uzf_area` VALUES ('1901', '225', '灌南县', '3');
INSERT INTO `uzf_area` VALUES ('1902', '226', '崇川区', '3');
INSERT INTO `uzf_area` VALUES ('1903', '226', '港闸区', '3');
INSERT INTO `uzf_area` VALUES ('1904', '226', '经济开发区', '3');
INSERT INTO `uzf_area` VALUES ('1905', '226', '启东市', '3');
INSERT INTO `uzf_area` VALUES ('1906', '226', '如皋市', '3');
INSERT INTO `uzf_area` VALUES ('1907', '226', '通州市', '3');
INSERT INTO `uzf_area` VALUES ('1908', '226', '海门市', '3');
INSERT INTO `uzf_area` VALUES ('1909', '226', '海安县', '3');
INSERT INTO `uzf_area` VALUES ('1910', '226', '如东县', '3');
INSERT INTO `uzf_area` VALUES ('1911', '227', '宿城区', '3');
INSERT INTO `uzf_area` VALUES ('1912', '227', '宿豫区', '3');
INSERT INTO `uzf_area` VALUES ('1913', '227', '宿豫县', '3');
INSERT INTO `uzf_area` VALUES ('1914', '227', '沭阳县', '3');
INSERT INTO `uzf_area` VALUES ('1915', '227', '泗阳县', '3');
INSERT INTO `uzf_area` VALUES ('1916', '227', '泗洪县', '3');
INSERT INTO `uzf_area` VALUES ('1917', '228', '海陵区', '3');
INSERT INTO `uzf_area` VALUES ('1918', '228', '高港区', '3');
INSERT INTO `uzf_area` VALUES ('1919', '228', '兴化市', '3');
INSERT INTO `uzf_area` VALUES ('1920', '228', '靖江市', '3');
INSERT INTO `uzf_area` VALUES ('1921', '228', '泰兴市', '3');
INSERT INTO `uzf_area` VALUES ('1922', '228', '姜堰市', '3');
INSERT INTO `uzf_area` VALUES ('1923', '229', '云龙区', '3');
INSERT INTO `uzf_area` VALUES ('1924', '229', '鼓楼区', '3');
INSERT INTO `uzf_area` VALUES ('1925', '229', '九里区', '3');
INSERT INTO `uzf_area` VALUES ('1926', '229', '贾汪区', '3');
INSERT INTO `uzf_area` VALUES ('1927', '229', '泉山区', '3');
INSERT INTO `uzf_area` VALUES ('1928', '229', '新沂市', '3');
INSERT INTO `uzf_area` VALUES ('1929', '229', '邳州市', '3');
INSERT INTO `uzf_area` VALUES ('1930', '229', '丰县', '3');
INSERT INTO `uzf_area` VALUES ('1931', '229', '沛县', '3');
INSERT INTO `uzf_area` VALUES ('1932', '229', '铜山县', '3');
INSERT INTO `uzf_area` VALUES ('1933', '229', '睢宁县', '3');
INSERT INTO `uzf_area` VALUES ('1934', '230', '城区', '3');
INSERT INTO `uzf_area` VALUES ('1935', '230', '亭湖区', '3');
INSERT INTO `uzf_area` VALUES ('1936', '230', '盐都区', '3');
INSERT INTO `uzf_area` VALUES ('1937', '230', '盐都县', '3');
INSERT INTO `uzf_area` VALUES ('1938', '230', '东台市', '3');
INSERT INTO `uzf_area` VALUES ('1939', '230', '大丰市', '3');
INSERT INTO `uzf_area` VALUES ('1940', '230', '响水县', '3');
INSERT INTO `uzf_area` VALUES ('1941', '230', '滨海县', '3');
INSERT INTO `uzf_area` VALUES ('1942', '230', '阜宁县', '3');
INSERT INTO `uzf_area` VALUES ('1943', '230', '射阳县', '3');
INSERT INTO `uzf_area` VALUES ('1944', '230', '建湖县', '3');
INSERT INTO `uzf_area` VALUES ('1945', '231', '广陵区', '3');
INSERT INTO `uzf_area` VALUES ('1946', '231', '维扬区', '3');
INSERT INTO `uzf_area` VALUES ('1947', '231', '邗江区', '3');
INSERT INTO `uzf_area` VALUES ('1948', '231', '仪征市', '3');
INSERT INTO `uzf_area` VALUES ('1949', '231', '高邮市', '3');
INSERT INTO `uzf_area` VALUES ('1950', '231', '江都市', '3');
INSERT INTO `uzf_area` VALUES ('1951', '231', '宝应县', '3');
INSERT INTO `uzf_area` VALUES ('1952', '232', '京口区', '3');
INSERT INTO `uzf_area` VALUES ('1953', '232', '润州区', '3');
INSERT INTO `uzf_area` VALUES ('1954', '232', '丹徒区', '3');
INSERT INTO `uzf_area` VALUES ('1955', '232', '丹阳市', '3');
INSERT INTO `uzf_area` VALUES ('1956', '232', '扬中市', '3');
INSERT INTO `uzf_area` VALUES ('1957', '232', '句容市', '3');
INSERT INTO `uzf_area` VALUES ('1958', '233', '东湖区', '3');
INSERT INTO `uzf_area` VALUES ('1959', '233', '西湖区', '3');
INSERT INTO `uzf_area` VALUES ('1960', '233', '青云谱区', '3');
INSERT INTO `uzf_area` VALUES ('1961', '233', '湾里区', '3');
INSERT INTO `uzf_area` VALUES ('1962', '233', '青山湖区', '3');
INSERT INTO `uzf_area` VALUES ('1963', '233', '红谷滩新区', '3');
INSERT INTO `uzf_area` VALUES ('1964', '233', '昌北区', '3');
INSERT INTO `uzf_area` VALUES ('1965', '233', '高新区', '3');
INSERT INTO `uzf_area` VALUES ('1966', '233', '南昌县', '3');
INSERT INTO `uzf_area` VALUES ('1967', '233', '新建县', '3');
INSERT INTO `uzf_area` VALUES ('1968', '233', '安义县', '3');
INSERT INTO `uzf_area` VALUES ('1969', '233', '进贤县', '3');
INSERT INTO `uzf_area` VALUES ('1970', '234', '临川区', '3');
INSERT INTO `uzf_area` VALUES ('1971', '234', '南城县', '3');
INSERT INTO `uzf_area` VALUES ('1972', '234', '黎川县', '3');
INSERT INTO `uzf_area` VALUES ('1973', '234', '南丰县', '3');
INSERT INTO `uzf_area` VALUES ('1974', '234', '崇仁县', '3');
INSERT INTO `uzf_area` VALUES ('1975', '234', '乐安县', '3');
INSERT INTO `uzf_area` VALUES ('1976', '234', '宜黄县', '3');
INSERT INTO `uzf_area` VALUES ('1977', '234', '金溪县', '3');
INSERT INTO `uzf_area` VALUES ('1978', '234', '资溪县', '3');
INSERT INTO `uzf_area` VALUES ('1979', '234', '东乡县', '3');
INSERT INTO `uzf_area` VALUES ('1980', '234', '广昌县', '3');
INSERT INTO `uzf_area` VALUES ('1981', '235', '章贡区', '3');
INSERT INTO `uzf_area` VALUES ('1982', '235', '于都县', '3');
INSERT INTO `uzf_area` VALUES ('1983', '235', '瑞金市', '3');
INSERT INTO `uzf_area` VALUES ('1984', '235', '南康市', '3');
INSERT INTO `uzf_area` VALUES ('1985', '235', '赣县', '3');
INSERT INTO `uzf_area` VALUES ('1986', '235', '信丰县', '3');
INSERT INTO `uzf_area` VALUES ('1987', '235', '大余县', '3');
INSERT INTO `uzf_area` VALUES ('1988', '235', '上犹县', '3');
INSERT INTO `uzf_area` VALUES ('1989', '235', '崇义县', '3');
INSERT INTO `uzf_area` VALUES ('1990', '235', '安远县', '3');
INSERT INTO `uzf_area` VALUES ('1991', '235', '龙南县', '3');
INSERT INTO `uzf_area` VALUES ('1992', '235', '定南县', '3');
INSERT INTO `uzf_area` VALUES ('1993', '235', '全南县', '3');
INSERT INTO `uzf_area` VALUES ('1994', '235', '宁都县', '3');
INSERT INTO `uzf_area` VALUES ('1995', '235', '兴国县', '3');
INSERT INTO `uzf_area` VALUES ('1996', '235', '会昌县', '3');
INSERT INTO `uzf_area` VALUES ('1997', '235', '寻乌县', '3');
INSERT INTO `uzf_area` VALUES ('1998', '235', '石城县', '3');
INSERT INTO `uzf_area` VALUES ('1999', '236', '安福县', '3');
INSERT INTO `uzf_area` VALUES ('2000', '236', '吉州区', '3');
INSERT INTO `uzf_area` VALUES ('2001', '236', '青原区', '3');
INSERT INTO `uzf_area` VALUES ('2002', '236', '井冈山市', '3');
INSERT INTO `uzf_area` VALUES ('2003', '236', '吉安县', '3');
INSERT INTO `uzf_area` VALUES ('2004', '236', '吉水县', '3');
INSERT INTO `uzf_area` VALUES ('2005', '236', '峡江县', '3');
INSERT INTO `uzf_area` VALUES ('2006', '236', '新干县', '3');
INSERT INTO `uzf_area` VALUES ('2007', '236', '永丰县', '3');
INSERT INTO `uzf_area` VALUES ('2008', '236', '泰和县', '3');
INSERT INTO `uzf_area` VALUES ('2009', '236', '遂川县', '3');
INSERT INTO `uzf_area` VALUES ('2010', '236', '万安县', '3');
INSERT INTO `uzf_area` VALUES ('2011', '236', '永新县', '3');
INSERT INTO `uzf_area` VALUES ('2012', '237', '珠山区', '3');
INSERT INTO `uzf_area` VALUES ('2013', '237', '昌江区', '3');
INSERT INTO `uzf_area` VALUES ('2014', '237', '乐平市', '3');
INSERT INTO `uzf_area` VALUES ('2015', '237', '浮梁县', '3');
INSERT INTO `uzf_area` VALUES ('2016', '238', '浔阳区', '3');
INSERT INTO `uzf_area` VALUES ('2017', '238', '庐山区', '3');
INSERT INTO `uzf_area` VALUES ('2018', '238', '瑞昌市', '3');
INSERT INTO `uzf_area` VALUES ('2019', '238', '九江县', '3');
INSERT INTO `uzf_area` VALUES ('2020', '238', '武宁县', '3');
INSERT INTO `uzf_area` VALUES ('2021', '238', '修水县', '3');
INSERT INTO `uzf_area` VALUES ('2022', '238', '永修县', '3');
INSERT INTO `uzf_area` VALUES ('2023', '238', '德安县', '3');
INSERT INTO `uzf_area` VALUES ('2024', '238', '星子县', '3');
INSERT INTO `uzf_area` VALUES ('2025', '238', '都昌县', '3');
INSERT INTO `uzf_area` VALUES ('2026', '238', '湖口县', '3');
INSERT INTO `uzf_area` VALUES ('2027', '238', '彭泽县', '3');
INSERT INTO `uzf_area` VALUES ('2028', '239', '安源区', '3');
INSERT INTO `uzf_area` VALUES ('2029', '239', '湘东区', '3');
INSERT INTO `uzf_area` VALUES ('2030', '239', '莲花县', '3');
INSERT INTO `uzf_area` VALUES ('2031', '239', '芦溪县', '3');
INSERT INTO `uzf_area` VALUES ('2032', '239', '上栗县', '3');
INSERT INTO `uzf_area` VALUES ('2033', '240', '信州区', '3');
INSERT INTO `uzf_area` VALUES ('2034', '240', '德兴市', '3');
INSERT INTO `uzf_area` VALUES ('2035', '240', '上饶县', '3');
INSERT INTO `uzf_area` VALUES ('2036', '240', '广丰县', '3');
INSERT INTO `uzf_area` VALUES ('2037', '240', '玉山县', '3');
INSERT INTO `uzf_area` VALUES ('2038', '240', '铅山县', '3');
INSERT INTO `uzf_area` VALUES ('2039', '240', '横峰县', '3');
INSERT INTO `uzf_area` VALUES ('2040', '240', '弋阳县', '3');
INSERT INTO `uzf_area` VALUES ('2041', '240', '余干县', '3');
INSERT INTO `uzf_area` VALUES ('2042', '240', '波阳县', '3');
INSERT INTO `uzf_area` VALUES ('2043', '240', '万年县', '3');
INSERT INTO `uzf_area` VALUES ('2044', '240', '婺源县', '3');
INSERT INTO `uzf_area` VALUES ('2045', '241', '渝水区', '3');
INSERT INTO `uzf_area` VALUES ('2046', '241', '分宜县', '3');
INSERT INTO `uzf_area` VALUES ('2047', '242', '袁州区', '3');
INSERT INTO `uzf_area` VALUES ('2048', '242', '丰城市', '3');
INSERT INTO `uzf_area` VALUES ('2049', '242', '樟树市', '3');
INSERT INTO `uzf_area` VALUES ('2050', '242', '高安市', '3');
INSERT INTO `uzf_area` VALUES ('2051', '242', '奉新县', '3');
INSERT INTO `uzf_area` VALUES ('2052', '242', '万载县', '3');
INSERT INTO `uzf_area` VALUES ('2053', '242', '上高县', '3');
INSERT INTO `uzf_area` VALUES ('2054', '242', '宜丰县', '3');
INSERT INTO `uzf_area` VALUES ('2055', '242', '靖安县', '3');
INSERT INTO `uzf_area` VALUES ('2056', '242', '铜鼓县', '3');
INSERT INTO `uzf_area` VALUES ('2057', '243', '月湖区', '3');
INSERT INTO `uzf_area` VALUES ('2058', '243', '贵溪市', '3');
INSERT INTO `uzf_area` VALUES ('2059', '243', '余江县', '3');
INSERT INTO `uzf_area` VALUES ('2060', '244', '沈河区', '3');
INSERT INTO `uzf_area` VALUES ('2061', '244', '皇姑区', '3');
INSERT INTO `uzf_area` VALUES ('2062', '244', '和平区', '3');
INSERT INTO `uzf_area` VALUES ('2063', '244', '大东区', '3');
INSERT INTO `uzf_area` VALUES ('2064', '244', '铁西区', '3');
INSERT INTO `uzf_area` VALUES ('2065', '244', '苏家屯区', '3');
INSERT INTO `uzf_area` VALUES ('2066', '244', '东陵区', '3');
INSERT INTO `uzf_area` VALUES ('2067', '244', '沈北新区', '3');
INSERT INTO `uzf_area` VALUES ('2068', '244', '于洪区', '3');
INSERT INTO `uzf_area` VALUES ('2069', '244', '浑南新区', '3');
INSERT INTO `uzf_area` VALUES ('2070', '244', '新民市', '3');
INSERT INTO `uzf_area` VALUES ('2071', '244', '辽中县', '3');
INSERT INTO `uzf_area` VALUES ('2072', '244', '康平县', '3');
INSERT INTO `uzf_area` VALUES ('2073', '244', '法库县', '3');
INSERT INTO `uzf_area` VALUES ('2074', '245', '西岗区', '3');
INSERT INTO `uzf_area` VALUES ('2075', '245', '中山区', '3');
INSERT INTO `uzf_area` VALUES ('2076', '245', '沙河口区', '3');
INSERT INTO `uzf_area` VALUES ('2077', '245', '甘井子区', '3');
INSERT INTO `uzf_area` VALUES ('2078', '245', '旅顺口区', '3');
INSERT INTO `uzf_area` VALUES ('2079', '245', '金州区', '3');
INSERT INTO `uzf_area` VALUES ('2080', '245', '开发区', '3');
INSERT INTO `uzf_area` VALUES ('2081', '245', '瓦房店市', '3');
INSERT INTO `uzf_area` VALUES ('2082', '245', '普兰店市', '3');
INSERT INTO `uzf_area` VALUES ('2083', '245', '庄河市', '3');
INSERT INTO `uzf_area` VALUES ('2084', '245', '长海县', '3');
INSERT INTO `uzf_area` VALUES ('2085', '246', '铁东区', '3');
INSERT INTO `uzf_area` VALUES ('2086', '246', '铁西区', '3');
INSERT INTO `uzf_area` VALUES ('2087', '246', '立山区', '3');
INSERT INTO `uzf_area` VALUES ('2088', '246', '千山区', '3');
INSERT INTO `uzf_area` VALUES ('2089', '246', '岫岩', '3');
INSERT INTO `uzf_area` VALUES ('2090', '246', '海城市', '3');
INSERT INTO `uzf_area` VALUES ('2091', '246', '台安县', '3');
INSERT INTO `uzf_area` VALUES ('2092', '247', '本溪', '3');
INSERT INTO `uzf_area` VALUES ('2093', '247', '平山区', '3');
INSERT INTO `uzf_area` VALUES ('2094', '247', '明山区', '3');
INSERT INTO `uzf_area` VALUES ('2095', '247', '溪湖区', '3');
INSERT INTO `uzf_area` VALUES ('2096', '247', '南芬区', '3');
INSERT INTO `uzf_area` VALUES ('2097', '247', '桓仁', '3');
INSERT INTO `uzf_area` VALUES ('2098', '248', '双塔区', '3');
INSERT INTO `uzf_area` VALUES ('2099', '248', '龙城区', '3');
INSERT INTO `uzf_area` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3');
INSERT INTO `uzf_area` VALUES ('2101', '248', '北票市', '3');
INSERT INTO `uzf_area` VALUES ('2102', '248', '凌源市', '3');
INSERT INTO `uzf_area` VALUES ('2103', '248', '朝阳县', '3');
INSERT INTO `uzf_area` VALUES ('2104', '248', '建平县', '3');
INSERT INTO `uzf_area` VALUES ('2105', '249', '振兴区', '3');
INSERT INTO `uzf_area` VALUES ('2106', '249', '元宝区', '3');
INSERT INTO `uzf_area` VALUES ('2107', '249', '振安区', '3');
INSERT INTO `uzf_area` VALUES ('2108', '249', '宽甸', '3');
INSERT INTO `uzf_area` VALUES ('2109', '249', '东港市', '3');
INSERT INTO `uzf_area` VALUES ('2110', '249', '凤城市', '3');
INSERT INTO `uzf_area` VALUES ('2111', '250', '顺城区', '3');
INSERT INTO `uzf_area` VALUES ('2112', '250', '新抚区', '3');
INSERT INTO `uzf_area` VALUES ('2113', '250', '东洲区', '3');
INSERT INTO `uzf_area` VALUES ('2114', '250', '望花区', '3');
INSERT INTO `uzf_area` VALUES ('2115', '250', '清原', '3');
INSERT INTO `uzf_area` VALUES ('2116', '250', '新宾', '3');
INSERT INTO `uzf_area` VALUES ('2117', '250', '抚顺县', '3');
INSERT INTO `uzf_area` VALUES ('2118', '251', '阜新', '3');
INSERT INTO `uzf_area` VALUES ('2119', '251', '海州区', '3');
INSERT INTO `uzf_area` VALUES ('2120', '251', '新邱区', '3');
INSERT INTO `uzf_area` VALUES ('2121', '251', '太平区', '3');
INSERT INTO `uzf_area` VALUES ('2122', '251', '清河门区', '3');
INSERT INTO `uzf_area` VALUES ('2123', '251', '细河区', '3');
INSERT INTO `uzf_area` VALUES ('2124', '251', '彰武县', '3');
INSERT INTO `uzf_area` VALUES ('2125', '252', '龙港区', '3');
INSERT INTO `uzf_area` VALUES ('2126', '252', '南票区', '3');
INSERT INTO `uzf_area` VALUES ('2127', '252', '连山区', '3');
INSERT INTO `uzf_area` VALUES ('2128', '252', '兴城市', '3');
INSERT INTO `uzf_area` VALUES ('2129', '252', '绥中县', '3');
INSERT INTO `uzf_area` VALUES ('2130', '252', '建昌县', '3');
INSERT INTO `uzf_area` VALUES ('2131', '253', '太和区', '3');
INSERT INTO `uzf_area` VALUES ('2132', '253', '古塔区', '3');
INSERT INTO `uzf_area` VALUES ('2133', '253', '凌河区', '3');
INSERT INTO `uzf_area` VALUES ('2134', '253', '凌海市', '3');
INSERT INTO `uzf_area` VALUES ('2135', '253', '北镇市', '3');
INSERT INTO `uzf_area` VALUES ('2136', '253', '黑山县', '3');
INSERT INTO `uzf_area` VALUES ('2137', '253', '义县', '3');
INSERT INTO `uzf_area` VALUES ('2138', '254', '白塔区', '3');
INSERT INTO `uzf_area` VALUES ('2139', '254', '文圣区', '3');
INSERT INTO `uzf_area` VALUES ('2140', '254', '宏伟区', '3');
INSERT INTO `uzf_area` VALUES ('2141', '254', '太子河区', '3');
INSERT INTO `uzf_area` VALUES ('2142', '254', '弓长岭区', '3');
INSERT INTO `uzf_area` VALUES ('2143', '254', '灯塔市', '3');
INSERT INTO `uzf_area` VALUES ('2144', '254', '辽阳县', '3');
INSERT INTO `uzf_area` VALUES ('2145', '255', '双台子区', '3');
INSERT INTO `uzf_area` VALUES ('2146', '255', '兴隆台区', '3');
INSERT INTO `uzf_area` VALUES ('2147', '255', '大洼县', '3');
INSERT INTO `uzf_area` VALUES ('2148', '255', '盘山县', '3');
INSERT INTO `uzf_area` VALUES ('2149', '256', '银州区', '3');
INSERT INTO `uzf_area` VALUES ('2150', '256', '清河区', '3');
INSERT INTO `uzf_area` VALUES ('2151', '256', '调兵山市', '3');
INSERT INTO `uzf_area` VALUES ('2152', '256', '开原市', '3');
INSERT INTO `uzf_area` VALUES ('2153', '256', '铁岭县', '3');
INSERT INTO `uzf_area` VALUES ('2154', '256', '西丰县', '3');
INSERT INTO `uzf_area` VALUES ('2155', '256', '昌图县', '3');
INSERT INTO `uzf_area` VALUES ('2156', '257', '站前区', '3');
INSERT INTO `uzf_area` VALUES ('2157', '257', '西市区', '3');
INSERT INTO `uzf_area` VALUES ('2158', '257', '鲅鱼圈区', '3');
INSERT INTO `uzf_area` VALUES ('2159', '257', '老边区', '3');
INSERT INTO `uzf_area` VALUES ('2160', '257', '盖州市', '3');
INSERT INTO `uzf_area` VALUES ('2161', '257', '大石桥市', '3');
INSERT INTO `uzf_area` VALUES ('2162', '258', '回民区', '3');
INSERT INTO `uzf_area` VALUES ('2163', '258', '玉泉区', '3');
INSERT INTO `uzf_area` VALUES ('2164', '258', '新城区', '3');
INSERT INTO `uzf_area` VALUES ('2165', '258', '赛罕区', '3');
INSERT INTO `uzf_area` VALUES ('2166', '258', '清水河县', '3');
INSERT INTO `uzf_area` VALUES ('2167', '258', '土默特左旗', '3');
INSERT INTO `uzf_area` VALUES ('2168', '258', '托克托县', '3');
INSERT INTO `uzf_area` VALUES ('2169', '258', '和林格尔县', '3');
INSERT INTO `uzf_area` VALUES ('2170', '258', '武川县', '3');
INSERT INTO `uzf_area` VALUES ('2171', '259', '阿拉善左旗', '3');
INSERT INTO `uzf_area` VALUES ('2172', '259', '阿拉善右旗', '3');
INSERT INTO `uzf_area` VALUES ('2173', '259', '额济纳旗', '3');
INSERT INTO `uzf_area` VALUES ('2174', '260', '临河区', '3');
INSERT INTO `uzf_area` VALUES ('2175', '260', '五原县', '3');
INSERT INTO `uzf_area` VALUES ('2176', '260', '磴口县', '3');
INSERT INTO `uzf_area` VALUES ('2177', '260', '乌拉特前旗', '3');
INSERT INTO `uzf_area` VALUES ('2178', '260', '乌拉特中旗', '3');
INSERT INTO `uzf_area` VALUES ('2179', '260', '乌拉特后旗', '3');
INSERT INTO `uzf_area` VALUES ('2180', '260', '杭锦后旗', '3');
INSERT INTO `uzf_area` VALUES ('2181', '261', '昆都仑区', '3');
INSERT INTO `uzf_area` VALUES ('2182', '261', '青山区', '3');
INSERT INTO `uzf_area` VALUES ('2183', '261', '东河区', '3');
INSERT INTO `uzf_area` VALUES ('2184', '261', '九原区', '3');
INSERT INTO `uzf_area` VALUES ('2185', '261', '石拐区', '3');
INSERT INTO `uzf_area` VALUES ('2186', '261', '白云矿区', '3');
INSERT INTO `uzf_area` VALUES ('2187', '261', '土默特右旗', '3');
INSERT INTO `uzf_area` VALUES ('2188', '261', '固阳县', '3');
INSERT INTO `uzf_area` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3');
INSERT INTO `uzf_area` VALUES ('2190', '262', '红山区', '3');
INSERT INTO `uzf_area` VALUES ('2191', '262', '元宝山区', '3');
INSERT INTO `uzf_area` VALUES ('2192', '262', '松山区', '3');
INSERT INTO `uzf_area` VALUES ('2193', '262', '阿鲁科尔沁旗', '3');
INSERT INTO `uzf_area` VALUES ('2194', '262', '巴林左旗', '3');
INSERT INTO `uzf_area` VALUES ('2195', '262', '巴林右旗', '3');
INSERT INTO `uzf_area` VALUES ('2196', '262', '林西县', '3');
INSERT INTO `uzf_area` VALUES ('2197', '262', '克什克腾旗', '3');
INSERT INTO `uzf_area` VALUES ('2198', '262', '翁牛特旗', '3');
INSERT INTO `uzf_area` VALUES ('2199', '262', '喀喇沁旗', '3');
INSERT INTO `uzf_area` VALUES ('2200', '262', '宁城县', '3');
INSERT INTO `uzf_area` VALUES ('2201', '262', '敖汉旗', '3');
INSERT INTO `uzf_area` VALUES ('2202', '263', '东胜区', '3');
INSERT INTO `uzf_area` VALUES ('2203', '263', '达拉特旗', '3');
INSERT INTO `uzf_area` VALUES ('2204', '263', '准格尔旗', '3');
INSERT INTO `uzf_area` VALUES ('2205', '263', '鄂托克前旗', '3');
INSERT INTO `uzf_area` VALUES ('2206', '263', '鄂托克旗', '3');
INSERT INTO `uzf_area` VALUES ('2207', '263', '杭锦旗', '3');
INSERT INTO `uzf_area` VALUES ('2208', '263', '乌审旗', '3');
INSERT INTO `uzf_area` VALUES ('2209', '263', '伊金霍洛旗', '3');
INSERT INTO `uzf_area` VALUES ('2210', '264', '海拉尔区', '3');
INSERT INTO `uzf_area` VALUES ('2211', '264', '莫力达瓦', '3');
INSERT INTO `uzf_area` VALUES ('2212', '264', '满洲里市', '3');
INSERT INTO `uzf_area` VALUES ('2213', '264', '牙克石市', '3');
INSERT INTO `uzf_area` VALUES ('2214', '264', '扎兰屯市', '3');
INSERT INTO `uzf_area` VALUES ('2215', '264', '额尔古纳市', '3');
INSERT INTO `uzf_area` VALUES ('2216', '264', '根河市', '3');
INSERT INTO `uzf_area` VALUES ('2217', '264', '阿荣旗', '3');
INSERT INTO `uzf_area` VALUES ('2218', '264', '鄂伦春自治旗', '3');
INSERT INTO `uzf_area` VALUES ('2219', '264', '鄂温克族自治旗', '3');
INSERT INTO `uzf_area` VALUES ('2220', '264', '陈巴尔虎旗', '3');
INSERT INTO `uzf_area` VALUES ('2221', '264', '新巴尔虎左旗', '3');
INSERT INTO `uzf_area` VALUES ('2222', '264', '新巴尔虎右旗', '3');
INSERT INTO `uzf_area` VALUES ('2223', '265', '科尔沁区', '3');
INSERT INTO `uzf_area` VALUES ('2224', '265', '霍林郭勒市', '3');
INSERT INTO `uzf_area` VALUES ('2225', '265', '科尔沁左翼中旗', '3');
INSERT INTO `uzf_area` VALUES ('2226', '265', '科尔沁左翼后旗', '3');
INSERT INTO `uzf_area` VALUES ('2227', '265', '开鲁县', '3');
INSERT INTO `uzf_area` VALUES ('2228', '265', '库伦旗', '3');
INSERT INTO `uzf_area` VALUES ('2229', '265', '奈曼旗', '3');
INSERT INTO `uzf_area` VALUES ('2230', '265', '扎鲁特旗', '3');
INSERT INTO `uzf_area` VALUES ('2231', '266', '海勃湾区', '3');
INSERT INTO `uzf_area` VALUES ('2232', '266', '乌达区', '3');
INSERT INTO `uzf_area` VALUES ('2233', '266', '海南区', '3');
INSERT INTO `uzf_area` VALUES ('2234', '267', '化德县', '3');
INSERT INTO `uzf_area` VALUES ('2235', '267', '集宁区', '3');
INSERT INTO `uzf_area` VALUES ('2236', '267', '丰镇市', '3');
INSERT INTO `uzf_area` VALUES ('2237', '267', '卓资县', '3');
INSERT INTO `uzf_area` VALUES ('2238', '267', '商都县', '3');
INSERT INTO `uzf_area` VALUES ('2239', '267', '兴和县', '3');
INSERT INTO `uzf_area` VALUES ('2240', '267', '凉城县', '3');
INSERT INTO `uzf_area` VALUES ('2241', '267', '察哈尔右翼前旗', '3');
INSERT INTO `uzf_area` VALUES ('2242', '267', '察哈尔右翼中旗', '3');
INSERT INTO `uzf_area` VALUES ('2243', '267', '察哈尔右翼后旗', '3');
INSERT INTO `uzf_area` VALUES ('2244', '267', '四子王旗', '3');
INSERT INTO `uzf_area` VALUES ('2245', '268', '二连浩特市', '3');
INSERT INTO `uzf_area` VALUES ('2246', '268', '锡林浩特市', '3');
INSERT INTO `uzf_area` VALUES ('2247', '268', '阿巴嘎旗', '3');
INSERT INTO `uzf_area` VALUES ('2248', '268', '苏尼特左旗', '3');
INSERT INTO `uzf_area` VALUES ('2249', '268', '苏尼特右旗', '3');
INSERT INTO `uzf_area` VALUES ('2250', '268', '东乌珠穆沁旗', '3');
INSERT INTO `uzf_area` VALUES ('2251', '268', '西乌珠穆沁旗', '3');
INSERT INTO `uzf_area` VALUES ('2252', '268', '太仆寺旗', '3');
INSERT INTO `uzf_area` VALUES ('2253', '268', '镶黄旗', '3');
INSERT INTO `uzf_area` VALUES ('2254', '268', '正镶白旗', '3');
INSERT INTO `uzf_area` VALUES ('2255', '268', '正蓝旗', '3');
INSERT INTO `uzf_area` VALUES ('2256', '268', '多伦县', '3');
INSERT INTO `uzf_area` VALUES ('2257', '269', '乌兰浩特市', '3');
INSERT INTO `uzf_area` VALUES ('2258', '269', '阿尔山市', '3');
INSERT INTO `uzf_area` VALUES ('2259', '269', '科尔沁右翼前旗', '3');
INSERT INTO `uzf_area` VALUES ('2260', '269', '科尔沁右翼中旗', '3');
INSERT INTO `uzf_area` VALUES ('2261', '269', '扎赉特旗', '3');
INSERT INTO `uzf_area` VALUES ('2262', '269', '突泉县', '3');
INSERT INTO `uzf_area` VALUES ('2263', '270', '西夏区', '3');
INSERT INTO `uzf_area` VALUES ('2264', '270', '金凤区', '3');
INSERT INTO `uzf_area` VALUES ('2265', '270', '兴庆区', '3');
INSERT INTO `uzf_area` VALUES ('2266', '270', '灵武市', '3');
INSERT INTO `uzf_area` VALUES ('2267', '270', '永宁县', '3');
INSERT INTO `uzf_area` VALUES ('2268', '270', '贺兰县', '3');
INSERT INTO `uzf_area` VALUES ('2269', '271', '原州区', '3');
INSERT INTO `uzf_area` VALUES ('2270', '271', '海原县', '3');
INSERT INTO `uzf_area` VALUES ('2271', '271', '西吉县', '3');
INSERT INTO `uzf_area` VALUES ('2272', '271', '隆德县', '3');
INSERT INTO `uzf_area` VALUES ('2273', '271', '泾源县', '3');
INSERT INTO `uzf_area` VALUES ('2274', '271', '彭阳县', '3');
INSERT INTO `uzf_area` VALUES ('2275', '272', '惠农县', '3');
INSERT INTO `uzf_area` VALUES ('2276', '272', '大武口区', '3');
INSERT INTO `uzf_area` VALUES ('2277', '272', '惠农区', '3');
INSERT INTO `uzf_area` VALUES ('2278', '272', '陶乐县', '3');
INSERT INTO `uzf_area` VALUES ('2279', '272', '平罗县', '3');
INSERT INTO `uzf_area` VALUES ('2280', '273', '利通区', '3');
INSERT INTO `uzf_area` VALUES ('2281', '273', '中卫县', '3');
INSERT INTO `uzf_area` VALUES ('2282', '273', '青铜峡市', '3');
INSERT INTO `uzf_area` VALUES ('2283', '273', '中宁县', '3');
INSERT INTO `uzf_area` VALUES ('2284', '273', '盐池县', '3');
INSERT INTO `uzf_area` VALUES ('2285', '273', '同心县', '3');
INSERT INTO `uzf_area` VALUES ('2286', '274', '沙坡头区', '3');
INSERT INTO `uzf_area` VALUES ('2287', '274', '海原县', '3');
INSERT INTO `uzf_area` VALUES ('2288', '274', '中宁县', '3');
INSERT INTO `uzf_area` VALUES ('2289', '275', '城中区', '3');
INSERT INTO `uzf_area` VALUES ('2290', '275', '城东区', '3');
INSERT INTO `uzf_area` VALUES ('2291', '275', '城西区', '3');
INSERT INTO `uzf_area` VALUES ('2292', '275', '城北区', '3');
INSERT INTO `uzf_area` VALUES ('2293', '275', '湟中县', '3');
INSERT INTO `uzf_area` VALUES ('2294', '275', '湟源县', '3');
INSERT INTO `uzf_area` VALUES ('2295', '275', '大通', '3');
INSERT INTO `uzf_area` VALUES ('2296', '276', '玛沁县', '3');
INSERT INTO `uzf_area` VALUES ('2297', '276', '班玛县', '3');
INSERT INTO `uzf_area` VALUES ('2298', '276', '甘德县', '3');
INSERT INTO `uzf_area` VALUES ('2299', '276', '达日县', '3');
INSERT INTO `uzf_area` VALUES ('2300', '276', '久治县', '3');
INSERT INTO `uzf_area` VALUES ('2301', '276', '玛多县', '3');
INSERT INTO `uzf_area` VALUES ('2302', '277', '海晏县', '3');
INSERT INTO `uzf_area` VALUES ('2303', '277', '祁连县', '3');
INSERT INTO `uzf_area` VALUES ('2304', '277', '刚察县', '3');
INSERT INTO `uzf_area` VALUES ('2305', '277', '门源', '3');
INSERT INTO `uzf_area` VALUES ('2306', '278', '平安县', '3');
INSERT INTO `uzf_area` VALUES ('2307', '278', '乐都县', '3');
INSERT INTO `uzf_area` VALUES ('2308', '278', '民和', '3');
INSERT INTO `uzf_area` VALUES ('2309', '278', '互助', '3');
INSERT INTO `uzf_area` VALUES ('2310', '278', '化隆', '3');
INSERT INTO `uzf_area` VALUES ('2311', '278', '循化', '3');
INSERT INTO `uzf_area` VALUES ('2312', '279', '共和县', '3');
INSERT INTO `uzf_area` VALUES ('2313', '279', '同德县', '3');
INSERT INTO `uzf_area` VALUES ('2314', '279', '贵德县', '3');
INSERT INTO `uzf_area` VALUES ('2315', '279', '兴海县', '3');
INSERT INTO `uzf_area` VALUES ('2316', '279', '贵南县', '3');
INSERT INTO `uzf_area` VALUES ('2317', '280', '德令哈市', '3');
INSERT INTO `uzf_area` VALUES ('2318', '280', '格尔木市', '3');
INSERT INTO `uzf_area` VALUES ('2319', '280', '乌兰县', '3');
INSERT INTO `uzf_area` VALUES ('2320', '280', '都兰县', '3');
INSERT INTO `uzf_area` VALUES ('2321', '280', '天峻县', '3');
INSERT INTO `uzf_area` VALUES ('2322', '281', '同仁县', '3');
INSERT INTO `uzf_area` VALUES ('2323', '281', '尖扎县', '3');
INSERT INTO `uzf_area` VALUES ('2324', '281', '泽库县', '3');
INSERT INTO `uzf_area` VALUES ('2325', '281', '河南蒙古族自治县', '3');
INSERT INTO `uzf_area` VALUES ('2326', '282', '玉树县', '3');
INSERT INTO `uzf_area` VALUES ('2327', '282', '杂多县', '3');
INSERT INTO `uzf_area` VALUES ('2328', '282', '称多县', '3');
INSERT INTO `uzf_area` VALUES ('2329', '282', '治多县', '3');
INSERT INTO `uzf_area` VALUES ('2330', '282', '囊谦县', '3');
INSERT INTO `uzf_area` VALUES ('2331', '282', '曲麻莱县', '3');
INSERT INTO `uzf_area` VALUES ('2332', '283', '市中区', '3');
INSERT INTO `uzf_area` VALUES ('2333', '283', '历下区', '3');
INSERT INTO `uzf_area` VALUES ('2334', '283', '天桥区', '3');
INSERT INTO `uzf_area` VALUES ('2335', '283', '槐荫区', '3');
INSERT INTO `uzf_area` VALUES ('2336', '283', '历城区', '3');
INSERT INTO `uzf_area` VALUES ('2337', '283', '长清区', '3');
INSERT INTO `uzf_area` VALUES ('2338', '283', '章丘市', '3');
INSERT INTO `uzf_area` VALUES ('2339', '283', '平阴县', '3');
INSERT INTO `uzf_area` VALUES ('2340', '283', '济阳县', '3');
INSERT INTO `uzf_area` VALUES ('2341', '283', '商河县', '3');
INSERT INTO `uzf_area` VALUES ('2342', '284', '市南区', '3');
INSERT INTO `uzf_area` VALUES ('2343', '284', '市北区', '3');
INSERT INTO `uzf_area` VALUES ('2344', '284', '城阳区', '3');
INSERT INTO `uzf_area` VALUES ('2345', '284', '四方区', '3');
INSERT INTO `uzf_area` VALUES ('2346', '284', '李沧区', '3');
INSERT INTO `uzf_area` VALUES ('2347', '284', '黄岛区', '3');
INSERT INTO `uzf_area` VALUES ('2348', '284', '崂山区', '3');
INSERT INTO `uzf_area` VALUES ('2349', '284', '胶州市', '3');
INSERT INTO `uzf_area` VALUES ('2350', '284', '即墨市', '3');
INSERT INTO `uzf_area` VALUES ('2351', '284', '平度市', '3');
INSERT INTO `uzf_area` VALUES ('2352', '284', '胶南市', '3');
INSERT INTO `uzf_area` VALUES ('2353', '284', '莱西市', '3');
INSERT INTO `uzf_area` VALUES ('2354', '285', '滨城区', '3');
INSERT INTO `uzf_area` VALUES ('2355', '285', '惠民县', '3');
INSERT INTO `uzf_area` VALUES ('2356', '285', '阳信县', '3');
INSERT INTO `uzf_area` VALUES ('2357', '285', '无棣县', '3');
INSERT INTO `uzf_area` VALUES ('2358', '285', '沾化县', '3');
INSERT INTO `uzf_area` VALUES ('2359', '285', '博兴县', '3');
INSERT INTO `uzf_area` VALUES ('2360', '285', '邹平县', '3');
INSERT INTO `uzf_area` VALUES ('2361', '286', '德城区', '3');
INSERT INTO `uzf_area` VALUES ('2362', '286', '陵县', '3');
INSERT INTO `uzf_area` VALUES ('2363', '286', '乐陵市', '3');
INSERT INTO `uzf_area` VALUES ('2364', '286', '禹城市', '3');
INSERT INTO `uzf_area` VALUES ('2365', '286', '宁津县', '3');
INSERT INTO `uzf_area` VALUES ('2366', '286', '庆云县', '3');
INSERT INTO `uzf_area` VALUES ('2367', '286', '临邑县', '3');
INSERT INTO `uzf_area` VALUES ('2368', '286', '齐河县', '3');
INSERT INTO `uzf_area` VALUES ('2369', '286', '平原县', '3');
INSERT INTO `uzf_area` VALUES ('2370', '286', '夏津县', '3');
INSERT INTO `uzf_area` VALUES ('2371', '286', '武城县', '3');
INSERT INTO `uzf_area` VALUES ('2372', '287', '东营区', '3');
INSERT INTO `uzf_area` VALUES ('2373', '287', '河口区', '3');
INSERT INTO `uzf_area` VALUES ('2374', '287', '垦利县', '3');
INSERT INTO `uzf_area` VALUES ('2375', '287', '利津县', '3');
INSERT INTO `uzf_area` VALUES ('2376', '287', '广饶县', '3');
INSERT INTO `uzf_area` VALUES ('2377', '288', '牡丹区', '3');
INSERT INTO `uzf_area` VALUES ('2378', '288', '曹县', '3');
INSERT INTO `uzf_area` VALUES ('2379', '288', '单县', '3');
INSERT INTO `uzf_area` VALUES ('2380', '288', '成武县', '3');
INSERT INTO `uzf_area` VALUES ('2381', '288', '巨野县', '3');
INSERT INTO `uzf_area` VALUES ('2382', '288', '郓城县', '3');
INSERT INTO `uzf_area` VALUES ('2383', '288', '鄄城县', '3');
INSERT INTO `uzf_area` VALUES ('2384', '288', '定陶县', '3');
INSERT INTO `uzf_area` VALUES ('2385', '288', '东明县', '3');
INSERT INTO `uzf_area` VALUES ('2386', '289', '市中区', '3');
INSERT INTO `uzf_area` VALUES ('2387', '289', '任城区', '3');
INSERT INTO `uzf_area` VALUES ('2388', '289', '曲阜市', '3');
INSERT INTO `uzf_area` VALUES ('2389', '289', '兖州市', '3');
INSERT INTO `uzf_area` VALUES ('2390', '289', '邹城市', '3');
INSERT INTO `uzf_area` VALUES ('2391', '289', '微山县', '3');
INSERT INTO `uzf_area` VALUES ('2392', '289', '鱼台县', '3');
INSERT INTO `uzf_area` VALUES ('2393', '289', '金乡县', '3');
INSERT INTO `uzf_area` VALUES ('2394', '289', '嘉祥县', '3');
INSERT INTO `uzf_area` VALUES ('2395', '289', '汶上县', '3');
INSERT INTO `uzf_area` VALUES ('2396', '289', '泗水县', '3');
INSERT INTO `uzf_area` VALUES ('2397', '289', '梁山县', '3');
INSERT INTO `uzf_area` VALUES ('2398', '290', '莱城区', '3');
INSERT INTO `uzf_area` VALUES ('2399', '290', '钢城区', '3');
INSERT INTO `uzf_area` VALUES ('2400', '291', '东昌府区', '3');
INSERT INTO `uzf_area` VALUES ('2401', '291', '临清市', '3');
INSERT INTO `uzf_area` VALUES ('2402', '291', '阳谷县', '3');
INSERT INTO `uzf_area` VALUES ('2403', '291', '莘县', '3');
INSERT INTO `uzf_area` VALUES ('2404', '291', '茌平县', '3');
INSERT INTO `uzf_area` VALUES ('2405', '291', '东阿县', '3');
INSERT INTO `uzf_area` VALUES ('2406', '291', '冠县', '3');
INSERT INTO `uzf_area` VALUES ('2407', '291', '高唐县', '3');
INSERT INTO `uzf_area` VALUES ('2408', '292', '兰山区', '3');
INSERT INTO `uzf_area` VALUES ('2409', '292', '罗庄区', '3');
INSERT INTO `uzf_area` VALUES ('2410', '292', '河东区', '3');
INSERT INTO `uzf_area` VALUES ('2411', '292', '沂南县', '3');
INSERT INTO `uzf_area` VALUES ('2412', '292', '郯城县', '3');
INSERT INTO `uzf_area` VALUES ('2413', '292', '沂水县', '3');
INSERT INTO `uzf_area` VALUES ('2414', '292', '苍山县', '3');
INSERT INTO `uzf_area` VALUES ('2415', '292', '费县', '3');
INSERT INTO `uzf_area` VALUES ('2416', '292', '平邑县', '3');
INSERT INTO `uzf_area` VALUES ('2417', '292', '莒南县', '3');
INSERT INTO `uzf_area` VALUES ('2418', '292', '蒙阴县', '3');
INSERT INTO `uzf_area` VALUES ('2419', '292', '临沭县', '3');
INSERT INTO `uzf_area` VALUES ('2420', '293', '东港区', '3');
INSERT INTO `uzf_area` VALUES ('2421', '293', '岚山区', '3');
INSERT INTO `uzf_area` VALUES ('2422', '293', '五莲县', '3');
INSERT INTO `uzf_area` VALUES ('2423', '293', '莒县', '3');
INSERT INTO `uzf_area` VALUES ('2424', '294', '泰山区', '3');
INSERT INTO `uzf_area` VALUES ('2425', '294', '岱岳区', '3');
INSERT INTO `uzf_area` VALUES ('2426', '294', '新泰市', '3');
INSERT INTO `uzf_area` VALUES ('2427', '294', '肥城市', '3');
INSERT INTO `uzf_area` VALUES ('2428', '294', '宁阳县', '3');
INSERT INTO `uzf_area` VALUES ('2429', '294', '东平县', '3');
INSERT INTO `uzf_area` VALUES ('2430', '295', '荣成市', '3');
INSERT INTO `uzf_area` VALUES ('2431', '295', '乳山市', '3');
INSERT INTO `uzf_area` VALUES ('2432', '295', '环翠区', '3');
INSERT INTO `uzf_area` VALUES ('2433', '295', '文登市', '3');
INSERT INTO `uzf_area` VALUES ('2434', '296', '潍城区', '3');
INSERT INTO `uzf_area` VALUES ('2435', '296', '寒亭区', '3');
INSERT INTO `uzf_area` VALUES ('2436', '296', '坊子区', '3');
INSERT INTO `uzf_area` VALUES ('2437', '296', '奎文区', '3');
INSERT INTO `uzf_area` VALUES ('2438', '296', '青州市', '3');
INSERT INTO `uzf_area` VALUES ('2439', '296', '诸城市', '3');
INSERT INTO `uzf_area` VALUES ('2440', '296', '寿光市', '3');
INSERT INTO `uzf_area` VALUES ('2441', '296', '安丘市', '3');
INSERT INTO `uzf_area` VALUES ('2442', '296', '高密市', '3');
INSERT INTO `uzf_area` VALUES ('2443', '296', '昌邑市', '3');
INSERT INTO `uzf_area` VALUES ('2444', '296', '临朐县', '3');
INSERT INTO `uzf_area` VALUES ('2445', '296', '昌乐县', '3');
INSERT INTO `uzf_area` VALUES ('2446', '297', '芝罘区', '3');
INSERT INTO `uzf_area` VALUES ('2447', '297', '福山区', '3');
INSERT INTO `uzf_area` VALUES ('2448', '297', '牟平区', '3');
INSERT INTO `uzf_area` VALUES ('2449', '297', '莱山区', '3');
INSERT INTO `uzf_area` VALUES ('2450', '297', '开发区', '3');
INSERT INTO `uzf_area` VALUES ('2451', '297', '龙口市', '3');
INSERT INTO `uzf_area` VALUES ('2452', '297', '莱阳市', '3');
INSERT INTO `uzf_area` VALUES ('2453', '297', '莱州市', '3');
INSERT INTO `uzf_area` VALUES ('2454', '297', '蓬莱市', '3');
INSERT INTO `uzf_area` VALUES ('2455', '297', '招远市', '3');
INSERT INTO `uzf_area` VALUES ('2456', '297', '栖霞市', '3');
INSERT INTO `uzf_area` VALUES ('2457', '297', '海阳市', '3');
INSERT INTO `uzf_area` VALUES ('2458', '297', '长岛县', '3');
INSERT INTO `uzf_area` VALUES ('2459', '298', '市中区', '3');
INSERT INTO `uzf_area` VALUES ('2460', '298', '山亭区', '3');
INSERT INTO `uzf_area` VALUES ('2461', '298', '峄城区', '3');
INSERT INTO `uzf_area` VALUES ('2462', '298', '台儿庄区', '3');
INSERT INTO `uzf_area` VALUES ('2463', '298', '薛城区', '3');
INSERT INTO `uzf_area` VALUES ('2464', '298', '滕州市', '3');
INSERT INTO `uzf_area` VALUES ('2465', '299', '张店区', '3');
INSERT INTO `uzf_area` VALUES ('2466', '299', '临淄区', '3');
INSERT INTO `uzf_area` VALUES ('2467', '299', '淄川区', '3');
INSERT INTO `uzf_area` VALUES ('2468', '299', '博山区', '3');
INSERT INTO `uzf_area` VALUES ('2469', '299', '周村区', '3');
INSERT INTO `uzf_area` VALUES ('2470', '299', '桓台县', '3');
INSERT INTO `uzf_area` VALUES ('2471', '299', '高青县', '3');
INSERT INTO `uzf_area` VALUES ('2472', '299', '沂源县', '3');
INSERT INTO `uzf_area` VALUES ('2473', '300', '杏花岭区', '3');
INSERT INTO `uzf_area` VALUES ('2474', '300', '小店区', '3');
INSERT INTO `uzf_area` VALUES ('2475', '300', '迎泽区', '3');
INSERT INTO `uzf_area` VALUES ('2476', '300', '尖草坪区', '3');
INSERT INTO `uzf_area` VALUES ('2477', '300', '万柏林区', '3');
INSERT INTO `uzf_area` VALUES ('2478', '300', '晋源区', '3');
INSERT INTO `uzf_area` VALUES ('2479', '300', '高新开发区', '3');
INSERT INTO `uzf_area` VALUES ('2480', '300', '民营经济开发区', '3');
INSERT INTO `uzf_area` VALUES ('2481', '300', '经济技术开发区', '3');
INSERT INTO `uzf_area` VALUES ('2482', '300', '清徐县', '3');
INSERT INTO `uzf_area` VALUES ('2483', '300', '阳曲县', '3');
INSERT INTO `uzf_area` VALUES ('2484', '300', '娄烦县', '3');
INSERT INTO `uzf_area` VALUES ('2485', '300', '古交市', '3');
INSERT INTO `uzf_area` VALUES ('2486', '301', '城区', '3');
INSERT INTO `uzf_area` VALUES ('2487', '301', '郊区', '3');
INSERT INTO `uzf_area` VALUES ('2488', '301', '沁县', '3');
INSERT INTO `uzf_area` VALUES ('2489', '301', '潞城市', '3');
INSERT INTO `uzf_area` VALUES ('2490', '301', '长治县', '3');
INSERT INTO `uzf_area` VALUES ('2491', '301', '襄垣县', '3');
INSERT INTO `uzf_area` VALUES ('2492', '301', '屯留县', '3');
INSERT INTO `uzf_area` VALUES ('2493', '301', '平顺县', '3');
INSERT INTO `uzf_area` VALUES ('2494', '301', '黎城县', '3');
INSERT INTO `uzf_area` VALUES ('2495', '301', '壶关县', '3');
INSERT INTO `uzf_area` VALUES ('2496', '301', '长子县', '3');
INSERT INTO `uzf_area` VALUES ('2497', '301', '武乡县', '3');
INSERT INTO `uzf_area` VALUES ('2498', '301', '沁源县', '3');
INSERT INTO `uzf_area` VALUES ('2499', '302', '城区', '3');
INSERT INTO `uzf_area` VALUES ('2500', '302', '矿区', '3');
INSERT INTO `uzf_area` VALUES ('2501', '302', '南郊区', '3');
INSERT INTO `uzf_area` VALUES ('2502', '302', '新荣区', '3');
INSERT INTO `uzf_area` VALUES ('2503', '302', '阳高县', '3');
INSERT INTO `uzf_area` VALUES ('2504', '302', '天镇县', '3');
INSERT INTO `uzf_area` VALUES ('2505', '302', '广灵县', '3');
INSERT INTO `uzf_area` VALUES ('2506', '302', '灵丘县', '3');
INSERT INTO `uzf_area` VALUES ('2507', '302', '浑源县', '3');
INSERT INTO `uzf_area` VALUES ('2508', '302', '左云县', '3');
INSERT INTO `uzf_area` VALUES ('2509', '302', '大同县', '3');
INSERT INTO `uzf_area` VALUES ('2510', '303', '城区', '3');
INSERT INTO `uzf_area` VALUES ('2511', '303', '高平市', '3');
INSERT INTO `uzf_area` VALUES ('2512', '303', '沁水县', '3');
INSERT INTO `uzf_area` VALUES ('2513', '303', '阳城县', '3');
INSERT INTO `uzf_area` VALUES ('2514', '303', '陵川县', '3');
INSERT INTO `uzf_area` VALUES ('2515', '303', '泽州县', '3');
INSERT INTO `uzf_area` VALUES ('2516', '304', '榆次区', '3');
INSERT INTO `uzf_area` VALUES ('2517', '304', '介休市', '3');
INSERT INTO `uzf_area` VALUES ('2518', '304', '榆社县', '3');
INSERT INTO `uzf_area` VALUES ('2519', '304', '左权县', '3');
INSERT INTO `uzf_area` VALUES ('2520', '304', '和顺县', '3');
INSERT INTO `uzf_area` VALUES ('2521', '304', '昔阳县', '3');
INSERT INTO `uzf_area` VALUES ('2522', '304', '寿阳县', '3');
INSERT INTO `uzf_area` VALUES ('2523', '304', '太谷县', '3');
INSERT INTO `uzf_area` VALUES ('2524', '304', '祁县', '3');
INSERT INTO `uzf_area` VALUES ('2525', '304', '平遥县', '3');
INSERT INTO `uzf_area` VALUES ('2526', '304', '灵石县', '3');
INSERT INTO `uzf_area` VALUES ('2527', '305', '尧都区', '3');
INSERT INTO `uzf_area` VALUES ('2528', '305', '侯马市', '3');
INSERT INTO `uzf_area` VALUES ('2529', '305', '霍州市', '3');
INSERT INTO `uzf_area` VALUES ('2530', '305', '曲沃县', '3');
INSERT INTO `uzf_area` VALUES ('2531', '305', '翼城县', '3');
INSERT INTO `uzf_area` VALUES ('2532', '305', '襄汾县', '3');
INSERT INTO `uzf_area` VALUES ('2533', '305', '洪洞县', '3');
INSERT INTO `uzf_area` VALUES ('2534', '305', '吉县', '3');
INSERT INTO `uzf_area` VALUES ('2535', '305', '安泽县', '3');
INSERT INTO `uzf_area` VALUES ('2536', '305', '浮山县', '3');
INSERT INTO `uzf_area` VALUES ('2537', '305', '古县', '3');
INSERT INTO `uzf_area` VALUES ('2538', '305', '乡宁县', '3');
INSERT INTO `uzf_area` VALUES ('2539', '305', '大宁县', '3');
INSERT INTO `uzf_area` VALUES ('2540', '305', '隰县', '3');
INSERT INTO `uzf_area` VALUES ('2541', '305', '永和县', '3');
INSERT INTO `uzf_area` VALUES ('2542', '305', '蒲县', '3');
INSERT INTO `uzf_area` VALUES ('2543', '305', '汾西县', '3');
INSERT INTO `uzf_area` VALUES ('2544', '306', '离石市', '3');
INSERT INTO `uzf_area` VALUES ('2545', '306', '离石区', '3');
INSERT INTO `uzf_area` VALUES ('2546', '306', '孝义市', '3');
INSERT INTO `uzf_area` VALUES ('2547', '306', '汾阳市', '3');
INSERT INTO `uzf_area` VALUES ('2548', '306', '文水县', '3');
INSERT INTO `uzf_area` VALUES ('2549', '306', '交城县', '3');
INSERT INTO `uzf_area` VALUES ('2550', '306', '兴县', '3');
INSERT INTO `uzf_area` VALUES ('2551', '306', '临县', '3');
INSERT INTO `uzf_area` VALUES ('2552', '306', '柳林县', '3');
INSERT INTO `uzf_area` VALUES ('2553', '306', '石楼县', '3');
INSERT INTO `uzf_area` VALUES ('2554', '306', '岚县', '3');
INSERT INTO `uzf_area` VALUES ('2555', '306', '方山县', '3');
INSERT INTO `uzf_area` VALUES ('2556', '306', '中阳县', '3');
INSERT INTO `uzf_area` VALUES ('2557', '306', '交口县', '3');
INSERT INTO `uzf_area` VALUES ('2558', '307', '朔城区', '3');
INSERT INTO `uzf_area` VALUES ('2559', '307', '平鲁区', '3');
INSERT INTO `uzf_area` VALUES ('2560', '307', '山阴县', '3');
INSERT INTO `uzf_area` VALUES ('2561', '307', '应县', '3');
INSERT INTO `uzf_area` VALUES ('2562', '307', '右玉县', '3');
INSERT INTO `uzf_area` VALUES ('2563', '307', '怀仁县', '3');
INSERT INTO `uzf_area` VALUES ('2564', '308', '忻府区', '3');
INSERT INTO `uzf_area` VALUES ('2565', '308', '原平市', '3');
INSERT INTO `uzf_area` VALUES ('2566', '308', '定襄县', '3');
INSERT INTO `uzf_area` VALUES ('2567', '308', '五台县', '3');
INSERT INTO `uzf_area` VALUES ('2568', '308', '代县', '3');
INSERT INTO `uzf_area` VALUES ('2569', '308', '繁峙县', '3');
INSERT INTO `uzf_area` VALUES ('2570', '308', '宁武县', '3');
INSERT INTO `uzf_area` VALUES ('2571', '308', '静乐县', '3');
INSERT INTO `uzf_area` VALUES ('2572', '308', '神池县', '3');
INSERT INTO `uzf_area` VALUES ('2573', '308', '五寨县', '3');
INSERT INTO `uzf_area` VALUES ('2574', '308', '岢岚县', '3');
INSERT INTO `uzf_area` VALUES ('2575', '308', '河曲县', '3');
INSERT INTO `uzf_area` VALUES ('2576', '308', '保德县', '3');
INSERT INTO `uzf_area` VALUES ('2577', '308', '偏关县', '3');
INSERT INTO `uzf_area` VALUES ('2578', '309', '城区', '3');
INSERT INTO `uzf_area` VALUES ('2579', '309', '矿区', '3');
INSERT INTO `uzf_area` VALUES ('2580', '309', '郊区', '3');
INSERT INTO `uzf_area` VALUES ('2581', '309', '平定县', '3');
INSERT INTO `uzf_area` VALUES ('2582', '309', '盂县', '3');
INSERT INTO `uzf_area` VALUES ('2583', '310', '盐湖区', '3');
INSERT INTO `uzf_area` VALUES ('2584', '310', '永济市', '3');
INSERT INTO `uzf_area` VALUES ('2585', '310', '河津市', '3');
INSERT INTO `uzf_area` VALUES ('2586', '310', '临猗县', '3');
INSERT INTO `uzf_area` VALUES ('2587', '310', '万荣县', '3');
INSERT INTO `uzf_area` VALUES ('2588', '310', '闻喜县', '3');
INSERT INTO `uzf_area` VALUES ('2589', '310', '稷山县', '3');
INSERT INTO `uzf_area` VALUES ('2590', '310', '新绛县', '3');
INSERT INTO `uzf_area` VALUES ('2591', '310', '绛县', '3');
INSERT INTO `uzf_area` VALUES ('2592', '310', '垣曲县', '3');
INSERT INTO `uzf_area` VALUES ('2593', '310', '夏县', '3');
INSERT INTO `uzf_area` VALUES ('2594', '310', '平陆县', '3');
INSERT INTO `uzf_area` VALUES ('2595', '310', '芮城县', '3');
INSERT INTO `uzf_area` VALUES ('2596', '311', '莲湖区', '3');
INSERT INTO `uzf_area` VALUES ('2597', '311', '新城区', '3');
INSERT INTO `uzf_area` VALUES ('2598', '311', '碑林区', '3');
INSERT INTO `uzf_area` VALUES ('2599', '311', '雁塔区', '3');
INSERT INTO `uzf_area` VALUES ('2600', '311', '灞桥区', '3');
INSERT INTO `uzf_area` VALUES ('2601', '311', '未央区', '3');
INSERT INTO `uzf_area` VALUES ('2602', '311', '阎良区', '3');
INSERT INTO `uzf_area` VALUES ('2603', '311', '临潼区', '3');
INSERT INTO `uzf_area` VALUES ('2604', '311', '长安区', '3');
INSERT INTO `uzf_area` VALUES ('2605', '311', '蓝田县', '3');
INSERT INTO `uzf_area` VALUES ('2606', '311', '周至县', '3');
INSERT INTO `uzf_area` VALUES ('2607', '311', '户县', '3');
INSERT INTO `uzf_area` VALUES ('2608', '311', '高陵县', '3');
INSERT INTO `uzf_area` VALUES ('2609', '312', '汉滨区', '3');
INSERT INTO `uzf_area` VALUES ('2610', '312', '汉阴县', '3');
INSERT INTO `uzf_area` VALUES ('2611', '312', '石泉县', '3');
INSERT INTO `uzf_area` VALUES ('2612', '312', '宁陕县', '3');
INSERT INTO `uzf_area` VALUES ('2613', '312', '紫阳县', '3');
INSERT INTO `uzf_area` VALUES ('2614', '312', '岚皋县', '3');
INSERT INTO `uzf_area` VALUES ('2615', '312', '平利县', '3');
INSERT INTO `uzf_area` VALUES ('2616', '312', '镇坪县', '3');
INSERT INTO `uzf_area` VALUES ('2617', '312', '旬阳县', '3');
INSERT INTO `uzf_area` VALUES ('2618', '312', '白河县', '3');
INSERT INTO `uzf_area` VALUES ('2619', '313', '陈仓区', '3');
INSERT INTO `uzf_area` VALUES ('2620', '313', '渭滨区', '3');
INSERT INTO `uzf_area` VALUES ('2621', '313', '金台区', '3');
INSERT INTO `uzf_area` VALUES ('2622', '313', '凤翔县', '3');
INSERT INTO `uzf_area` VALUES ('2623', '313', '岐山县', '3');
INSERT INTO `uzf_area` VALUES ('2624', '313', '扶风县', '3');
INSERT INTO `uzf_area` VALUES ('2625', '313', '眉县', '3');
INSERT INTO `uzf_area` VALUES ('2626', '313', '陇县', '3');
INSERT INTO `uzf_area` VALUES ('2627', '313', '千阳县', '3');
INSERT INTO `uzf_area` VALUES ('2628', '313', '麟游县', '3');
INSERT INTO `uzf_area` VALUES ('2629', '313', '凤县', '3');
INSERT INTO `uzf_area` VALUES ('2630', '313', '太白县', '3');
INSERT INTO `uzf_area` VALUES ('2631', '314', '汉台区', '3');
INSERT INTO `uzf_area` VALUES ('2632', '314', '南郑县', '3');
INSERT INTO `uzf_area` VALUES ('2633', '314', '城固县', '3');
INSERT INTO `uzf_area` VALUES ('2634', '314', '洋县', '3');
INSERT INTO `uzf_area` VALUES ('2635', '314', '西乡县', '3');
INSERT INTO `uzf_area` VALUES ('2636', '314', '勉县', '3');
INSERT INTO `uzf_area` VALUES ('2637', '314', '宁强县', '3');
INSERT INTO `uzf_area` VALUES ('2638', '314', '略阳县', '3');
INSERT INTO `uzf_area` VALUES ('2639', '314', '镇巴县', '3');
INSERT INTO `uzf_area` VALUES ('2640', '314', '留坝县', '3');
INSERT INTO `uzf_area` VALUES ('2641', '314', '佛坪县', '3');
INSERT INTO `uzf_area` VALUES ('2642', '315', '商州区', '3');
INSERT INTO `uzf_area` VALUES ('2643', '315', '洛南县', '3');
INSERT INTO `uzf_area` VALUES ('2644', '315', '丹凤县', '3');
INSERT INTO `uzf_area` VALUES ('2645', '315', '商南县', '3');
INSERT INTO `uzf_area` VALUES ('2646', '315', '山阳县', '3');
INSERT INTO `uzf_area` VALUES ('2647', '315', '镇安县', '3');
INSERT INTO `uzf_area` VALUES ('2648', '315', '柞水县', '3');
INSERT INTO `uzf_area` VALUES ('2649', '316', '耀州区', '3');
INSERT INTO `uzf_area` VALUES ('2650', '316', '王益区', '3');
INSERT INTO `uzf_area` VALUES ('2651', '316', '印台区', '3');
INSERT INTO `uzf_area` VALUES ('2652', '316', '宜君县', '3');
INSERT INTO `uzf_area` VALUES ('2653', '317', '临渭区', '3');
INSERT INTO `uzf_area` VALUES ('2654', '317', '韩城市', '3');
INSERT INTO `uzf_area` VALUES ('2655', '317', '华阴市', '3');
INSERT INTO `uzf_area` VALUES ('2656', '317', '华县', '3');
INSERT INTO `uzf_area` VALUES ('2657', '317', '潼关县', '3');
INSERT INTO `uzf_area` VALUES ('2658', '317', '大荔县', '3');
INSERT INTO `uzf_area` VALUES ('2659', '317', '合阳县', '3');
INSERT INTO `uzf_area` VALUES ('2660', '317', '澄城县', '3');
INSERT INTO `uzf_area` VALUES ('2661', '317', '蒲城县', '3');
INSERT INTO `uzf_area` VALUES ('2662', '317', '白水县', '3');
INSERT INTO `uzf_area` VALUES ('2663', '317', '富平县', '3');
INSERT INTO `uzf_area` VALUES ('2664', '318', '秦都区', '3');
INSERT INTO `uzf_area` VALUES ('2665', '318', '渭城区', '3');
INSERT INTO `uzf_area` VALUES ('2666', '318', '杨陵区', '3');
INSERT INTO `uzf_area` VALUES ('2667', '318', '兴平市', '3');
INSERT INTO `uzf_area` VALUES ('2668', '318', '三原县', '3');
INSERT INTO `uzf_area` VALUES ('2669', '318', '泾阳县', '3');
INSERT INTO `uzf_area` VALUES ('2670', '318', '乾县', '3');
INSERT INTO `uzf_area` VALUES ('2671', '318', '礼泉县', '3');
INSERT INTO `uzf_area` VALUES ('2672', '318', '永寿县', '3');
INSERT INTO `uzf_area` VALUES ('2673', '318', '彬县', '3');
INSERT INTO `uzf_area` VALUES ('2674', '318', '长武县', '3');
INSERT INTO `uzf_area` VALUES ('2675', '318', '旬邑县', '3');
INSERT INTO `uzf_area` VALUES ('2676', '318', '淳化县', '3');
INSERT INTO `uzf_area` VALUES ('2677', '318', '武功县', '3');
INSERT INTO `uzf_area` VALUES ('2678', '319', '吴起县', '3');
INSERT INTO `uzf_area` VALUES ('2679', '319', '宝塔区', '3');
INSERT INTO `uzf_area` VALUES ('2680', '319', '延长县', '3');
INSERT INTO `uzf_area` VALUES ('2681', '319', '延川县', '3');
INSERT INTO `uzf_area` VALUES ('2682', '319', '子长县', '3');
INSERT INTO `uzf_area` VALUES ('2683', '319', '安塞县', '3');
INSERT INTO `uzf_area` VALUES ('2684', '319', '志丹县', '3');
INSERT INTO `uzf_area` VALUES ('2685', '319', '甘泉县', '3');
INSERT INTO `uzf_area` VALUES ('2686', '319', '富县', '3');
INSERT INTO `uzf_area` VALUES ('2687', '319', '洛川县', '3');
INSERT INTO `uzf_area` VALUES ('2688', '319', '宜川县', '3');
INSERT INTO `uzf_area` VALUES ('2689', '319', '黄龙县', '3');
INSERT INTO `uzf_area` VALUES ('2690', '319', '黄陵县', '3');
INSERT INTO `uzf_area` VALUES ('2691', '320', '榆阳区', '3');
INSERT INTO `uzf_area` VALUES ('2692', '320', '神木县', '3');
INSERT INTO `uzf_area` VALUES ('2693', '320', '府谷县', '3');
INSERT INTO `uzf_area` VALUES ('2694', '320', '横山县', '3');
INSERT INTO `uzf_area` VALUES ('2695', '320', '靖边县', '3');
INSERT INTO `uzf_area` VALUES ('2696', '320', '定边县', '3');
INSERT INTO `uzf_area` VALUES ('2697', '320', '绥德县', '3');
INSERT INTO `uzf_area` VALUES ('2698', '320', '米脂县', '3');
INSERT INTO `uzf_area` VALUES ('2699', '320', '佳县', '3');
INSERT INTO `uzf_area` VALUES ('2700', '320', '吴堡县', '3');
INSERT INTO `uzf_area` VALUES ('2701', '320', '清涧县', '3');
INSERT INTO `uzf_area` VALUES ('2702', '320', '子洲县', '3');
INSERT INTO `uzf_area` VALUES ('2703', '321', '长宁区', '3');
INSERT INTO `uzf_area` VALUES ('2704', '321', '闸北区', '3');
INSERT INTO `uzf_area` VALUES ('2705', '321', '闵行区', '3');
INSERT INTO `uzf_area` VALUES ('2706', '321', '徐汇区', '3');
INSERT INTO `uzf_area` VALUES ('2707', '321', '浦东新区', '3');
INSERT INTO `uzf_area` VALUES ('2708', '321', '杨浦区', '3');
INSERT INTO `uzf_area` VALUES ('2709', '321', '普陀区', '3');
INSERT INTO `uzf_area` VALUES ('2710', '321', '静安区', '3');
INSERT INTO `uzf_area` VALUES ('2711', '321', '卢湾区', '3');
INSERT INTO `uzf_area` VALUES ('2712', '321', '虹口区', '3');
INSERT INTO `uzf_area` VALUES ('2713', '321', '黄浦区', '3');
INSERT INTO `uzf_area` VALUES ('2714', '321', '南汇区', '3');
INSERT INTO `uzf_area` VALUES ('2715', '321', '松江区', '3');
INSERT INTO `uzf_area` VALUES ('2716', '321', '嘉定区', '3');
INSERT INTO `uzf_area` VALUES ('2717', '321', '宝山区', '3');
INSERT INTO `uzf_area` VALUES ('2718', '321', '青浦区', '3');
INSERT INTO `uzf_area` VALUES ('2719', '321', '金山区', '3');
INSERT INTO `uzf_area` VALUES ('2720', '321', '奉贤区', '3');
INSERT INTO `uzf_area` VALUES ('2721', '321', '崇明县', '3');
INSERT INTO `uzf_area` VALUES ('2722', '322', '青羊区', '3');
INSERT INTO `uzf_area` VALUES ('2723', '322', '锦江区', '3');
INSERT INTO `uzf_area` VALUES ('2724', '322', '金牛区', '3');
INSERT INTO `uzf_area` VALUES ('2725', '322', '武侯区', '3');
INSERT INTO `uzf_area` VALUES ('2726', '322', '成华区', '3');
INSERT INTO `uzf_area` VALUES ('2727', '322', '龙泉驿区', '3');
INSERT INTO `uzf_area` VALUES ('2728', '322', '青白江区', '3');
INSERT INTO `uzf_area` VALUES ('2729', '322', '新都区', '3');
INSERT INTO `uzf_area` VALUES ('2730', '322', '温江区', '3');
INSERT INTO `uzf_area` VALUES ('2731', '322', '高新区', '3');
INSERT INTO `uzf_area` VALUES ('2732', '322', '高新西区', '3');
INSERT INTO `uzf_area` VALUES ('2733', '322', '都江堰市', '3');
INSERT INTO `uzf_area` VALUES ('2734', '322', '彭州市', '3');
INSERT INTO `uzf_area` VALUES ('2735', '322', '邛崃市', '3');
INSERT INTO `uzf_area` VALUES ('2736', '322', '崇州市', '3');
INSERT INTO `uzf_area` VALUES ('2737', '322', '金堂县', '3');
INSERT INTO `uzf_area` VALUES ('2738', '322', '双流县', '3');
INSERT INTO `uzf_area` VALUES ('2739', '322', '郫县', '3');
INSERT INTO `uzf_area` VALUES ('2740', '322', '大邑县', '3');
INSERT INTO `uzf_area` VALUES ('2741', '322', '蒲江县', '3');
INSERT INTO `uzf_area` VALUES ('2742', '322', '新津县', '3');
INSERT INTO `uzf_area` VALUES ('2743', '322', '都江堰市', '3');
INSERT INTO `uzf_area` VALUES ('2744', '322', '彭州市', '3');
INSERT INTO `uzf_area` VALUES ('2745', '322', '邛崃市', '3');
INSERT INTO `uzf_area` VALUES ('2746', '322', '崇州市', '3');
INSERT INTO `uzf_area` VALUES ('2747', '322', '金堂县', '3');
INSERT INTO `uzf_area` VALUES ('2748', '322', '双流县', '3');
INSERT INTO `uzf_area` VALUES ('2749', '322', '郫县', '3');
INSERT INTO `uzf_area` VALUES ('2750', '322', '大邑县', '3');
INSERT INTO `uzf_area` VALUES ('2751', '322', '蒲江县', '3');
INSERT INTO `uzf_area` VALUES ('2752', '322', '新津县', '3');
INSERT INTO `uzf_area` VALUES ('2753', '323', '涪城区', '3');
INSERT INTO `uzf_area` VALUES ('2754', '323', '游仙区', '3');
INSERT INTO `uzf_area` VALUES ('2755', '323', '江油市', '3');
INSERT INTO `uzf_area` VALUES ('2756', '323', '盐亭县', '3');
INSERT INTO `uzf_area` VALUES ('2757', '323', '三台县', '3');
INSERT INTO `uzf_area` VALUES ('2758', '323', '平武县', '3');
INSERT INTO `uzf_area` VALUES ('2759', '323', '安县', '3');
INSERT INTO `uzf_area` VALUES ('2760', '323', '梓潼县', '3');
INSERT INTO `uzf_area` VALUES ('2761', '323', '北川县', '3');
INSERT INTO `uzf_area` VALUES ('2762', '324', '马尔康县', '3');
INSERT INTO `uzf_area` VALUES ('2763', '324', '汶川县', '3');
INSERT INTO `uzf_area` VALUES ('2764', '324', '理县', '3');
INSERT INTO `uzf_area` VALUES ('2765', '324', '茂县', '3');
INSERT INTO `uzf_area` VALUES ('2766', '324', '松潘县', '3');
INSERT INTO `uzf_area` VALUES ('2767', '324', '九寨沟县', '3');
INSERT INTO `uzf_area` VALUES ('2768', '324', '金川县', '3');
INSERT INTO `uzf_area` VALUES ('2769', '324', '小金县', '3');
INSERT INTO `uzf_area` VALUES ('2770', '324', '黑水县', '3');
INSERT INTO `uzf_area` VALUES ('2771', '324', '壤塘县', '3');
INSERT INTO `uzf_area` VALUES ('2772', '324', '阿坝县', '3');
INSERT INTO `uzf_area` VALUES ('2773', '324', '若尔盖县', '3');
INSERT INTO `uzf_area` VALUES ('2774', '324', '红原县', '3');
INSERT INTO `uzf_area` VALUES ('2775', '325', '巴州区', '3');
INSERT INTO `uzf_area` VALUES ('2776', '325', '通江县', '3');
INSERT INTO `uzf_area` VALUES ('2777', '325', '南江县', '3');
INSERT INTO `uzf_area` VALUES ('2778', '325', '平昌县', '3');
INSERT INTO `uzf_area` VALUES ('2779', '326', '通川区', '3');
INSERT INTO `uzf_area` VALUES ('2780', '326', '万源市', '3');
INSERT INTO `uzf_area` VALUES ('2781', '326', '达县', '3');
INSERT INTO `uzf_area` VALUES ('2782', '326', '宣汉县', '3');
INSERT INTO `uzf_area` VALUES ('2783', '326', '开江县', '3');
INSERT INTO `uzf_area` VALUES ('2784', '326', '大竹县', '3');
INSERT INTO `uzf_area` VALUES ('2785', '326', '渠县', '3');
INSERT INTO `uzf_area` VALUES ('2786', '327', '旌阳区', '3');
INSERT INTO `uzf_area` VALUES ('2787', '327', '广汉市', '3');
INSERT INTO `uzf_area` VALUES ('2788', '327', '什邡市', '3');
INSERT INTO `uzf_area` VALUES ('2789', '327', '绵竹市', '3');
INSERT INTO `uzf_area` VALUES ('2790', '327', '罗江县', '3');
INSERT INTO `uzf_area` VALUES ('2791', '327', '中江县', '3');
INSERT INTO `uzf_area` VALUES ('2792', '328', '康定县', '3');
INSERT INTO `uzf_area` VALUES ('2793', '328', '丹巴县', '3');
INSERT INTO `uzf_area` VALUES ('2794', '328', '泸定县', '3');
INSERT INTO `uzf_area` VALUES ('2795', '328', '炉霍县', '3');
INSERT INTO `uzf_area` VALUES ('2796', '328', '九龙县', '3');
INSERT INTO `uzf_area` VALUES ('2797', '328', '甘孜县', '3');
INSERT INTO `uzf_area` VALUES ('2798', '328', '雅江县', '3');
INSERT INTO `uzf_area` VALUES ('2799', '328', '新龙县', '3');
INSERT INTO `uzf_area` VALUES ('2800', '328', '道孚县', '3');
INSERT INTO `uzf_area` VALUES ('2801', '328', '白玉县', '3');
INSERT INTO `uzf_area` VALUES ('2802', '328', '理塘县', '3');
INSERT INTO `uzf_area` VALUES ('2803', '328', '德格县', '3');
INSERT INTO `uzf_area` VALUES ('2804', '328', '乡城县', '3');
INSERT INTO `uzf_area` VALUES ('2805', '328', '石渠县', '3');
INSERT INTO `uzf_area` VALUES ('2806', '328', '稻城县', '3');
INSERT INTO `uzf_area` VALUES ('2807', '328', '色达县', '3');
INSERT INTO `uzf_area` VALUES ('2808', '328', '巴塘县', '3');
INSERT INTO `uzf_area` VALUES ('2809', '328', '得荣县', '3');
INSERT INTO `uzf_area` VALUES ('2810', '329', '广安区', '3');
INSERT INTO `uzf_area` VALUES ('2811', '329', '华蓥市', '3');
INSERT INTO `uzf_area` VALUES ('2812', '329', '岳池县', '3');
INSERT INTO `uzf_area` VALUES ('2813', '329', '武胜县', '3');
INSERT INTO `uzf_area` VALUES ('2814', '329', '邻水县', '3');
INSERT INTO `uzf_area` VALUES ('2815', '330', '利州区', '3');
INSERT INTO `uzf_area` VALUES ('2816', '330', '元坝区', '3');
INSERT INTO `uzf_area` VALUES ('2817', '330', '朝天区', '3');
INSERT INTO `uzf_area` VALUES ('2818', '330', '旺苍县', '3');
INSERT INTO `uzf_area` VALUES ('2819', '330', '青川县', '3');
INSERT INTO `uzf_area` VALUES ('2820', '330', '剑阁县', '3');
INSERT INTO `uzf_area` VALUES ('2821', '330', '苍溪县', '3');
INSERT INTO `uzf_area` VALUES ('2822', '331', '峨眉山市', '3');
INSERT INTO `uzf_area` VALUES ('2823', '331', '乐山市', '3');
INSERT INTO `uzf_area` VALUES ('2824', '331', '犍为县', '3');
INSERT INTO `uzf_area` VALUES ('2825', '331', '井研县', '3');
INSERT INTO `uzf_area` VALUES ('2826', '331', '夹江县', '3');
INSERT INTO `uzf_area` VALUES ('2827', '331', '沐川县', '3');
INSERT INTO `uzf_area` VALUES ('2828', '331', '峨边', '3');
INSERT INTO `uzf_area` VALUES ('2829', '331', '马边', '3');
INSERT INTO `uzf_area` VALUES ('2830', '332', '西昌市', '3');
INSERT INTO `uzf_area` VALUES ('2831', '332', '盐源县', '3');
INSERT INTO `uzf_area` VALUES ('2832', '332', '德昌县', '3');
INSERT INTO `uzf_area` VALUES ('2833', '332', '会理县', '3');
INSERT INTO `uzf_area` VALUES ('2834', '332', '会东县', '3');
INSERT INTO `uzf_area` VALUES ('2835', '332', '宁南县', '3');
INSERT INTO `uzf_area` VALUES ('2836', '332', '普格县', '3');
INSERT INTO `uzf_area` VALUES ('2837', '332', '布拖县', '3');
INSERT INTO `uzf_area` VALUES ('2838', '332', '金阳县', '3');
INSERT INTO `uzf_area` VALUES ('2839', '332', '昭觉县', '3');
INSERT INTO `uzf_area` VALUES ('2840', '332', '喜德县', '3');
INSERT INTO `uzf_area` VALUES ('2841', '332', '冕宁县', '3');
INSERT INTO `uzf_area` VALUES ('2842', '332', '越西县', '3');
INSERT INTO `uzf_area` VALUES ('2843', '332', '甘洛县', '3');
INSERT INTO `uzf_area` VALUES ('2844', '332', '美姑县', '3');
INSERT INTO `uzf_area` VALUES ('2845', '332', '雷波县', '3');
INSERT INTO `uzf_area` VALUES ('2846', '332', '木里', '3');
INSERT INTO `uzf_area` VALUES ('2847', '333', '东坡区', '3');
INSERT INTO `uzf_area` VALUES ('2848', '333', '仁寿县', '3');
INSERT INTO `uzf_area` VALUES ('2849', '333', '彭山县', '3');
INSERT INTO `uzf_area` VALUES ('2850', '333', '洪雅县', '3');
INSERT INTO `uzf_area` VALUES ('2851', '333', '丹棱县', '3');
INSERT INTO `uzf_area` VALUES ('2852', '333', '青神县', '3');
INSERT INTO `uzf_area` VALUES ('2853', '334', '阆中市', '3');
INSERT INTO `uzf_area` VALUES ('2854', '334', '南部县', '3');
INSERT INTO `uzf_area` VALUES ('2855', '334', '营山县', '3');
INSERT INTO `uzf_area` VALUES ('2856', '334', '蓬安县', '3');
INSERT INTO `uzf_area` VALUES ('2857', '334', '仪陇县', '3');
INSERT INTO `uzf_area` VALUES ('2858', '334', '顺庆区', '3');
INSERT INTO `uzf_area` VALUES ('2859', '334', '高坪区', '3');
INSERT INTO `uzf_area` VALUES ('2860', '334', '嘉陵区', '3');
INSERT INTO `uzf_area` VALUES ('2861', '334', '西充县', '3');
INSERT INTO `uzf_area` VALUES ('2862', '335', '市中区', '3');
INSERT INTO `uzf_area` VALUES ('2863', '335', '东兴区', '3');
INSERT INTO `uzf_area` VALUES ('2864', '335', '威远县', '3');
INSERT INTO `uzf_area` VALUES ('2865', '335', '资中县', '3');
INSERT INTO `uzf_area` VALUES ('2866', '335', '隆昌县', '3');
INSERT INTO `uzf_area` VALUES ('2867', '336', '东  区', '3');
INSERT INTO `uzf_area` VALUES ('2868', '336', '西  区', '3');
INSERT INTO `uzf_area` VALUES ('2869', '336', '仁和区', '3');
INSERT INTO `uzf_area` VALUES ('2870', '336', '米易县', '3');
INSERT INTO `uzf_area` VALUES ('2871', '336', '盐边县', '3');
INSERT INTO `uzf_area` VALUES ('2872', '337', '船山区', '3');
INSERT INTO `uzf_area` VALUES ('2873', '337', '安居区', '3');
INSERT INTO `uzf_area` VALUES ('2874', '337', '蓬溪县', '3');
INSERT INTO `uzf_area` VALUES ('2875', '337', '射洪县', '3');
INSERT INTO `uzf_area` VALUES ('2876', '337', '大英县', '3');
INSERT INTO `uzf_area` VALUES ('2877', '338', '雨城区', '3');
INSERT INTO `uzf_area` VALUES ('2878', '338', '名山县', '3');
INSERT INTO `uzf_area` VALUES ('2879', '338', '荥经县', '3');
INSERT INTO `uzf_area` VALUES ('2880', '338', '汉源县', '3');
INSERT INTO `uzf_area` VALUES ('2881', '338', '石棉县', '3');
INSERT INTO `uzf_area` VALUES ('2882', '338', '天全县', '3');
INSERT INTO `uzf_area` VALUES ('2883', '338', '芦山县', '3');
INSERT INTO `uzf_area` VALUES ('2884', '338', '宝兴县', '3');
INSERT INTO `uzf_area` VALUES ('2885', '339', '翠屏区', '3');
INSERT INTO `uzf_area` VALUES ('2886', '339', '宜宾县', '3');
INSERT INTO `uzf_area` VALUES ('2887', '339', '南溪县', '3');
INSERT INTO `uzf_area` VALUES ('2888', '339', '江安县', '3');
INSERT INTO `uzf_area` VALUES ('2889', '339', '长宁县', '3');
INSERT INTO `uzf_area` VALUES ('2890', '339', '高县', '3');
INSERT INTO `uzf_area` VALUES ('2891', '339', '珙县', '3');
INSERT INTO `uzf_area` VALUES ('2892', '339', '筠连县', '3');
INSERT INTO `uzf_area` VALUES ('2893', '339', '兴文县', '3');
INSERT INTO `uzf_area` VALUES ('2894', '339', '屏山县', '3');
INSERT INTO `uzf_area` VALUES ('2895', '340', '雁江区', '3');
INSERT INTO `uzf_area` VALUES ('2896', '340', '简阳市', '3');
INSERT INTO `uzf_area` VALUES ('2897', '340', '安岳县', '3');
INSERT INTO `uzf_area` VALUES ('2898', '340', '乐至县', '3');
INSERT INTO `uzf_area` VALUES ('2899', '341', '大安区', '3');
INSERT INTO `uzf_area` VALUES ('2900', '341', '自流井区', '3');
INSERT INTO `uzf_area` VALUES ('2901', '341', '贡井区', '3');
INSERT INTO `uzf_area` VALUES ('2902', '341', '沿滩区', '3');
INSERT INTO `uzf_area` VALUES ('2903', '341', '荣县', '3');
INSERT INTO `uzf_area` VALUES ('2904', '341', '富顺县', '3');
INSERT INTO `uzf_area` VALUES ('2905', '342', '江阳区', '3');
INSERT INTO `uzf_area` VALUES ('2906', '342', '纳溪区', '3');
INSERT INTO `uzf_area` VALUES ('2907', '342', '龙马潭区', '3');
INSERT INTO `uzf_area` VALUES ('2908', '342', '泸县', '3');
INSERT INTO `uzf_area` VALUES ('2909', '342', '合江县', '3');
INSERT INTO `uzf_area` VALUES ('2910', '342', '叙永县', '3');
INSERT INTO `uzf_area` VALUES ('2911', '342', '古蔺县', '3');
INSERT INTO `uzf_area` VALUES ('2912', '343', '和平区', '3');
INSERT INTO `uzf_area` VALUES ('2913', '343', '河西区', '3');
INSERT INTO `uzf_area` VALUES ('2914', '343', '南开区', '3');
INSERT INTO `uzf_area` VALUES ('2915', '343', '河北区', '3');
INSERT INTO `uzf_area` VALUES ('2916', '343', '河东区', '3');
INSERT INTO `uzf_area` VALUES ('2917', '343', '红桥区', '3');
INSERT INTO `uzf_area` VALUES ('2918', '343', '东丽区', '3');
INSERT INTO `uzf_area` VALUES ('2919', '343', '津南区', '3');
INSERT INTO `uzf_area` VALUES ('2920', '343', '西青区', '3');
INSERT INTO `uzf_area` VALUES ('2921', '343', '北辰区', '3');
INSERT INTO `uzf_area` VALUES ('2922', '343', '塘沽区', '3');
INSERT INTO `uzf_area` VALUES ('2923', '343', '汉沽区', '3');
INSERT INTO `uzf_area` VALUES ('2924', '343', '大港区', '3');
INSERT INTO `uzf_area` VALUES ('2925', '343', '武清区', '3');
INSERT INTO `uzf_area` VALUES ('2926', '343', '宝坻区', '3');
INSERT INTO `uzf_area` VALUES ('2927', '343', '经济开发区', '3');
INSERT INTO `uzf_area` VALUES ('2928', '343', '宁河县', '3');
INSERT INTO `uzf_area` VALUES ('2929', '343', '静海县', '3');
INSERT INTO `uzf_area` VALUES ('2930', '343', '蓟县', '3');
INSERT INTO `uzf_area` VALUES ('2931', '344', '城关区', '3');
INSERT INTO `uzf_area` VALUES ('2932', '344', '林周县', '3');
INSERT INTO `uzf_area` VALUES ('2933', '344', '当雄县', '3');
INSERT INTO `uzf_area` VALUES ('2934', '344', '尼木县', '3');
INSERT INTO `uzf_area` VALUES ('2935', '344', '曲水县', '3');
INSERT INTO `uzf_area` VALUES ('2936', '344', '堆龙德庆县', '3');
INSERT INTO `uzf_area` VALUES ('2937', '344', '达孜县', '3');
INSERT INTO `uzf_area` VALUES ('2938', '344', '墨竹工卡县', '3');
INSERT INTO `uzf_area` VALUES ('2939', '345', '噶尔县', '3');
INSERT INTO `uzf_area` VALUES ('2940', '345', '普兰县', '3');
INSERT INTO `uzf_area` VALUES ('2941', '345', '札达县', '3');
INSERT INTO `uzf_area` VALUES ('2942', '345', '日土县', '3');
INSERT INTO `uzf_area` VALUES ('2943', '345', '革吉县', '3');
INSERT INTO `uzf_area` VALUES ('2944', '345', '改则县', '3');
INSERT INTO `uzf_area` VALUES ('2945', '345', '措勤县', '3');
INSERT INTO `uzf_area` VALUES ('2946', '346', '昌都县', '3');
INSERT INTO `uzf_area` VALUES ('2947', '346', '江达县', '3');
INSERT INTO `uzf_area` VALUES ('2948', '346', '贡觉县', '3');
INSERT INTO `uzf_area` VALUES ('2949', '346', '类乌齐县', '3');
INSERT INTO `uzf_area` VALUES ('2950', '346', '丁青县', '3');
INSERT INTO `uzf_area` VALUES ('2951', '346', '察雅县', '3');
INSERT INTO `uzf_area` VALUES ('2952', '346', '八宿县', '3');
INSERT INTO `uzf_area` VALUES ('2953', '346', '左贡县', '3');
INSERT INTO `uzf_area` VALUES ('2954', '346', '芒康县', '3');
INSERT INTO `uzf_area` VALUES ('2955', '346', '洛隆县', '3');
INSERT INTO `uzf_area` VALUES ('2956', '346', '边坝县', '3');
INSERT INTO `uzf_area` VALUES ('2957', '347', '林芝县', '3');
INSERT INTO `uzf_area` VALUES ('2958', '347', '工布江达县', '3');
INSERT INTO `uzf_area` VALUES ('2959', '347', '米林县', '3');
INSERT INTO `uzf_area` VALUES ('2960', '347', '墨脱县', '3');
INSERT INTO `uzf_area` VALUES ('2961', '347', '波密县', '3');
INSERT INTO `uzf_area` VALUES ('2962', '347', '察隅县', '3');
INSERT INTO `uzf_area` VALUES ('2963', '347', '朗县', '3');
INSERT INTO `uzf_area` VALUES ('2964', '348', '那曲县', '3');
INSERT INTO `uzf_area` VALUES ('2965', '348', '嘉黎县', '3');
INSERT INTO `uzf_area` VALUES ('2966', '348', '比如县', '3');
INSERT INTO `uzf_area` VALUES ('2967', '348', '聂荣县', '3');
INSERT INTO `uzf_area` VALUES ('2968', '348', '安多县', '3');
INSERT INTO `uzf_area` VALUES ('2969', '348', '申扎县', '3');
INSERT INTO `uzf_area` VALUES ('2970', '348', '索县', '3');
INSERT INTO `uzf_area` VALUES ('2971', '348', '班戈县', '3');
INSERT INTO `uzf_area` VALUES ('2972', '348', '巴青县', '3');
INSERT INTO `uzf_area` VALUES ('2973', '348', '尼玛县', '3');
INSERT INTO `uzf_area` VALUES ('2974', '349', '日喀则市', '3');
INSERT INTO `uzf_area` VALUES ('2975', '349', '南木林县', '3');
INSERT INTO `uzf_area` VALUES ('2976', '349', '江孜县', '3');
INSERT INTO `uzf_area` VALUES ('2977', '349', '定日县', '3');
INSERT INTO `uzf_area` VALUES ('2978', '349', '萨迦县', '3');
INSERT INTO `uzf_area` VALUES ('2979', '349', '拉孜县', '3');
INSERT INTO `uzf_area` VALUES ('2980', '349', '昂仁县', '3');
INSERT INTO `uzf_area` VALUES ('2981', '349', '谢通门县', '3');
INSERT INTO `uzf_area` VALUES ('2982', '349', '白朗县', '3');
INSERT INTO `uzf_area` VALUES ('2983', '349', '仁布县', '3');
INSERT INTO `uzf_area` VALUES ('2984', '349', '康马县', '3');
INSERT INTO `uzf_area` VALUES ('2985', '349', '定结县', '3');
INSERT INTO `uzf_area` VALUES ('2986', '349', '仲巴县', '3');
INSERT INTO `uzf_area` VALUES ('2987', '349', '亚东县', '3');
INSERT INTO `uzf_area` VALUES ('2988', '349', '吉隆县', '3');
INSERT INTO `uzf_area` VALUES ('2989', '349', '聂拉木县', '3');
INSERT INTO `uzf_area` VALUES ('2990', '349', '萨嘎县', '3');
INSERT INTO `uzf_area` VALUES ('2991', '349', '岗巴县', '3');
INSERT INTO `uzf_area` VALUES ('2992', '350', '乃东县', '3');
INSERT INTO `uzf_area` VALUES ('2993', '350', '扎囊县', '3');
INSERT INTO `uzf_area` VALUES ('2994', '350', '贡嘎县', '3');
INSERT INTO `uzf_area` VALUES ('2995', '350', '桑日县', '3');
INSERT INTO `uzf_area` VALUES ('2996', '350', '琼结县', '3');
INSERT INTO `uzf_area` VALUES ('2997', '350', '曲松县', '3');
INSERT INTO `uzf_area` VALUES ('2998', '350', '措美县', '3');
INSERT INTO `uzf_area` VALUES ('2999', '350', '洛扎县', '3');
INSERT INTO `uzf_area` VALUES ('3000', '350', '加查县', '3');
INSERT INTO `uzf_area` VALUES ('3001', '350', '隆子县', '3');
INSERT INTO `uzf_area` VALUES ('3002', '350', '错那县', '3');
INSERT INTO `uzf_area` VALUES ('3003', '350', '浪卡子县', '3');
INSERT INTO `uzf_area` VALUES ('3004', '351', '天山区', '3');
INSERT INTO `uzf_area` VALUES ('3005', '351', '沙依巴克区', '3');
INSERT INTO `uzf_area` VALUES ('3006', '351', '新市区', '3');
INSERT INTO `uzf_area` VALUES ('3007', '351', '水磨沟区', '3');
INSERT INTO `uzf_area` VALUES ('3008', '351', '头屯河区', '3');
INSERT INTO `uzf_area` VALUES ('3009', '351', '达坂城区', '3');
INSERT INTO `uzf_area` VALUES ('3010', '351', '米东区', '3');
INSERT INTO `uzf_area` VALUES ('3011', '351', '乌鲁木齐县', '3');
INSERT INTO `uzf_area` VALUES ('3012', '352', '阿克苏市', '3');
INSERT INTO `uzf_area` VALUES ('3013', '352', '温宿县', '3');
INSERT INTO `uzf_area` VALUES ('3014', '352', '库车县', '3');
INSERT INTO `uzf_area` VALUES ('3015', '352', '沙雅县', '3');
INSERT INTO `uzf_area` VALUES ('3016', '352', '新和县', '3');
INSERT INTO `uzf_area` VALUES ('3017', '352', '拜城县', '3');
INSERT INTO `uzf_area` VALUES ('3018', '352', '乌什县', '3');
INSERT INTO `uzf_area` VALUES ('3019', '352', '阿瓦提县', '3');
INSERT INTO `uzf_area` VALUES ('3020', '352', '柯坪县', '3');
INSERT INTO `uzf_area` VALUES ('3021', '353', '阿拉尔市', '3');
INSERT INTO `uzf_area` VALUES ('3022', '354', '库尔勒市', '3');
INSERT INTO `uzf_area` VALUES ('3023', '354', '轮台县', '3');
INSERT INTO `uzf_area` VALUES ('3024', '354', '尉犁县', '3');
INSERT INTO `uzf_area` VALUES ('3025', '354', '若羌县', '3');
INSERT INTO `uzf_area` VALUES ('3026', '354', '且末县', '3');
INSERT INTO `uzf_area` VALUES ('3027', '354', '焉耆', '3');
INSERT INTO `uzf_area` VALUES ('3028', '354', '和静县', '3');
INSERT INTO `uzf_area` VALUES ('3029', '354', '和硕县', '3');
INSERT INTO `uzf_area` VALUES ('3030', '354', '博湖县', '3');
INSERT INTO `uzf_area` VALUES ('3031', '355', '博乐市', '3');
INSERT INTO `uzf_area` VALUES ('3032', '355', '精河县', '3');
INSERT INTO `uzf_area` VALUES ('3033', '355', '温泉县', '3');
INSERT INTO `uzf_area` VALUES ('3034', '356', '呼图壁县', '3');
INSERT INTO `uzf_area` VALUES ('3035', '356', '米泉市', '3');
INSERT INTO `uzf_area` VALUES ('3036', '356', '昌吉市', '3');
INSERT INTO `uzf_area` VALUES ('3037', '356', '阜康市', '3');
INSERT INTO `uzf_area` VALUES ('3038', '356', '玛纳斯县', '3');
INSERT INTO `uzf_area` VALUES ('3039', '356', '奇台县', '3');
INSERT INTO `uzf_area` VALUES ('3040', '356', '吉木萨尔县', '3');
INSERT INTO `uzf_area` VALUES ('3041', '356', '木垒', '3');
INSERT INTO `uzf_area` VALUES ('3042', '357', '哈密市', '3');
INSERT INTO `uzf_area` VALUES ('3043', '357', '伊吾县', '3');
INSERT INTO `uzf_area` VALUES ('3044', '357', '巴里坤', '3');
INSERT INTO `uzf_area` VALUES ('3045', '358', '和田市', '3');
INSERT INTO `uzf_area` VALUES ('3046', '358', '和田县', '3');
INSERT INTO `uzf_area` VALUES ('3047', '358', '墨玉县', '3');
INSERT INTO `uzf_area` VALUES ('3048', '358', '皮山县', '3');
INSERT INTO `uzf_area` VALUES ('3049', '358', '洛浦县', '3');
INSERT INTO `uzf_area` VALUES ('3050', '358', '策勒县', '3');
INSERT INTO `uzf_area` VALUES ('3051', '358', '于田县', '3');
INSERT INTO `uzf_area` VALUES ('3052', '358', '民丰县', '3');
INSERT INTO `uzf_area` VALUES ('3053', '359', '喀什市', '3');
INSERT INTO `uzf_area` VALUES ('3054', '359', '疏附县', '3');
INSERT INTO `uzf_area` VALUES ('3055', '359', '疏勒县', '3');
INSERT INTO `uzf_area` VALUES ('3056', '359', '英吉沙县', '3');
INSERT INTO `uzf_area` VALUES ('3057', '359', '泽普县', '3');
INSERT INTO `uzf_area` VALUES ('3058', '359', '莎车县', '3');
INSERT INTO `uzf_area` VALUES ('3059', '359', '叶城县', '3');
INSERT INTO `uzf_area` VALUES ('3060', '359', '麦盖提县', '3');
INSERT INTO `uzf_area` VALUES ('3061', '359', '岳普湖县', '3');
INSERT INTO `uzf_area` VALUES ('3062', '359', '伽师县', '3');
INSERT INTO `uzf_area` VALUES ('3063', '359', '巴楚县', '3');
INSERT INTO `uzf_area` VALUES ('3064', '359', '塔什库尔干', '3');
INSERT INTO `uzf_area` VALUES ('3065', '360', '克拉玛依市', '3');
INSERT INTO `uzf_area` VALUES ('3066', '361', '阿图什市', '3');
INSERT INTO `uzf_area` VALUES ('3067', '361', '阿克陶县', '3');
INSERT INTO `uzf_area` VALUES ('3068', '361', '阿合奇县', '3');
INSERT INTO `uzf_area` VALUES ('3069', '361', '乌恰县', '3');
INSERT INTO `uzf_area` VALUES ('3070', '362', '石河子市', '3');
INSERT INTO `uzf_area` VALUES ('3071', '363', '图木舒克市', '3');
INSERT INTO `uzf_area` VALUES ('3072', '364', '吐鲁番市', '3');
INSERT INTO `uzf_area` VALUES ('3073', '364', '鄯善县', '3');
INSERT INTO `uzf_area` VALUES ('3074', '364', '托克逊县', '3');
INSERT INTO `uzf_area` VALUES ('3075', '365', '五家渠市', '3');
INSERT INTO `uzf_area` VALUES ('3076', '366', '阿勒泰市', '3');
INSERT INTO `uzf_area` VALUES ('3077', '366', '布克赛尔', '3');
INSERT INTO `uzf_area` VALUES ('3078', '366', '伊宁市', '3');
INSERT INTO `uzf_area` VALUES ('3079', '366', '布尔津县', '3');
INSERT INTO `uzf_area` VALUES ('3080', '366', '奎屯市', '3');
INSERT INTO `uzf_area` VALUES ('3081', '366', '乌苏市', '3');
INSERT INTO `uzf_area` VALUES ('3082', '366', '额敏县', '3');
INSERT INTO `uzf_area` VALUES ('3083', '366', '富蕴县', '3');
INSERT INTO `uzf_area` VALUES ('3084', '366', '伊宁县', '3');
INSERT INTO `uzf_area` VALUES ('3085', '366', '福海县', '3');
INSERT INTO `uzf_area` VALUES ('3086', '366', '霍城县', '3');
INSERT INTO `uzf_area` VALUES ('3087', '366', '沙湾县', '3');
INSERT INTO `uzf_area` VALUES ('3088', '366', '巩留县', '3');
INSERT INTO `uzf_area` VALUES ('3089', '366', '哈巴河县', '3');
INSERT INTO `uzf_area` VALUES ('3090', '366', '托里县', '3');
INSERT INTO `uzf_area` VALUES ('3091', '366', '青河县', '3');
INSERT INTO `uzf_area` VALUES ('3092', '366', '新源县', '3');
INSERT INTO `uzf_area` VALUES ('3093', '366', '裕民县', '3');
INSERT INTO `uzf_area` VALUES ('3094', '366', '和布克赛尔', '3');
INSERT INTO `uzf_area` VALUES ('3095', '366', '吉木乃县', '3');
INSERT INTO `uzf_area` VALUES ('3096', '366', '昭苏县', '3');
INSERT INTO `uzf_area` VALUES ('3097', '366', '特克斯县', '3');
INSERT INTO `uzf_area` VALUES ('3098', '366', '尼勒克县', '3');
INSERT INTO `uzf_area` VALUES ('3099', '366', '察布查尔', '3');
INSERT INTO `uzf_area` VALUES ('3100', '367', '盘龙区', '3');
INSERT INTO `uzf_area` VALUES ('3101', '367', '五华区', '3');
INSERT INTO `uzf_area` VALUES ('3102', '367', '官渡区', '3');
INSERT INTO `uzf_area` VALUES ('3103', '367', '西山区', '3');
INSERT INTO `uzf_area` VALUES ('3104', '367', '东川区', '3');
INSERT INTO `uzf_area` VALUES ('3105', '367', '安宁市', '3');
INSERT INTO `uzf_area` VALUES ('3106', '367', '呈贡县', '3');
INSERT INTO `uzf_area` VALUES ('3107', '367', '晋宁县', '3');
INSERT INTO `uzf_area` VALUES ('3108', '367', '富民县', '3');
INSERT INTO `uzf_area` VALUES ('3109', '367', '宜良县', '3');
INSERT INTO `uzf_area` VALUES ('3110', '367', '嵩明县', '3');
INSERT INTO `uzf_area` VALUES ('3111', '367', '石林县', '3');
INSERT INTO `uzf_area` VALUES ('3112', '367', '禄劝', '3');
INSERT INTO `uzf_area` VALUES ('3113', '367', '寻甸', '3');
INSERT INTO `uzf_area` VALUES ('3114', '368', '兰坪', '3');
INSERT INTO `uzf_area` VALUES ('3115', '368', '泸水县', '3');
INSERT INTO `uzf_area` VALUES ('3116', '368', '福贡县', '3');
INSERT INTO `uzf_area` VALUES ('3117', '368', '贡山', '3');
INSERT INTO `uzf_area` VALUES ('3118', '369', '宁洱', '3');
INSERT INTO `uzf_area` VALUES ('3119', '369', '思茅区', '3');
INSERT INTO `uzf_area` VALUES ('3120', '369', '墨江', '3');
INSERT INTO `uzf_area` VALUES ('3121', '369', '景东', '3');
INSERT INTO `uzf_area` VALUES ('3122', '369', '景谷', '3');
INSERT INTO `uzf_area` VALUES ('3123', '369', '镇沅', '3');
INSERT INTO `uzf_area` VALUES ('3124', '369', '江城', '3');
INSERT INTO `uzf_area` VALUES ('3125', '369', '孟连', '3');
INSERT INTO `uzf_area` VALUES ('3126', '369', '澜沧', '3');
INSERT INTO `uzf_area` VALUES ('3127', '369', '西盟', '3');
INSERT INTO `uzf_area` VALUES ('3128', '370', '古城区', '3');
INSERT INTO `uzf_area` VALUES ('3129', '370', '宁蒗', '3');
INSERT INTO `uzf_area` VALUES ('3130', '370', '玉龙', '3');
INSERT INTO `uzf_area` VALUES ('3131', '370', '永胜县', '3');
INSERT INTO `uzf_area` VALUES ('3132', '370', '华坪县', '3');
INSERT INTO `uzf_area` VALUES ('3133', '371', '隆阳区', '3');
INSERT INTO `uzf_area` VALUES ('3134', '371', '施甸县', '3');
INSERT INTO `uzf_area` VALUES ('3135', '371', '腾冲县', '3');
INSERT INTO `uzf_area` VALUES ('3136', '371', '龙陵县', '3');
INSERT INTO `uzf_area` VALUES ('3137', '371', '昌宁县', '3');
INSERT INTO `uzf_area` VALUES ('3138', '372', '楚雄市', '3');
INSERT INTO `uzf_area` VALUES ('3139', '372', '双柏县', '3');
INSERT INTO `uzf_area` VALUES ('3140', '372', '牟定县', '3');
INSERT INTO `uzf_area` VALUES ('3141', '372', '南华县', '3');
INSERT INTO `uzf_area` VALUES ('3142', '372', '姚安县', '3');
INSERT INTO `uzf_area` VALUES ('3143', '372', '大姚县', '3');
INSERT INTO `uzf_area` VALUES ('3144', '372', '永仁县', '3');
INSERT INTO `uzf_area` VALUES ('3145', '372', '元谋县', '3');
INSERT INTO `uzf_area` VALUES ('3146', '372', '武定县', '3');
INSERT INTO `uzf_area` VALUES ('3147', '372', '禄丰县', '3');
INSERT INTO `uzf_area` VALUES ('3148', '373', '大理市', '3');
INSERT INTO `uzf_area` VALUES ('3149', '373', '祥云县', '3');
INSERT INTO `uzf_area` VALUES ('3150', '373', '宾川县', '3');
INSERT INTO `uzf_area` VALUES ('3151', '373', '弥渡县', '3');
INSERT INTO `uzf_area` VALUES ('3152', '373', '永平县', '3');
INSERT INTO `uzf_area` VALUES ('3153', '373', '云龙县', '3');
INSERT INTO `uzf_area` VALUES ('3154', '373', '洱源县', '3');
INSERT INTO `uzf_area` VALUES ('3155', '373', '剑川县', '3');
INSERT INTO `uzf_area` VALUES ('3156', '373', '鹤庆县', '3');
INSERT INTO `uzf_area` VALUES ('3157', '373', '漾濞', '3');
INSERT INTO `uzf_area` VALUES ('3158', '373', '南涧', '3');
INSERT INTO `uzf_area` VALUES ('3159', '373', '巍山', '3');
INSERT INTO `uzf_area` VALUES ('3160', '374', '潞西市', '3');
INSERT INTO `uzf_area` VALUES ('3161', '374', '瑞丽市', '3');
INSERT INTO `uzf_area` VALUES ('3162', '374', '梁河县', '3');
INSERT INTO `uzf_area` VALUES ('3163', '374', '盈江县', '3');
INSERT INTO `uzf_area` VALUES ('3164', '374', '陇川县', '3');
INSERT INTO `uzf_area` VALUES ('3165', '375', '香格里拉县', '3');
INSERT INTO `uzf_area` VALUES ('3166', '375', '德钦县', '3');
INSERT INTO `uzf_area` VALUES ('3167', '375', '维西', '3');
INSERT INTO `uzf_area` VALUES ('3168', '376', '泸西县', '3');
INSERT INTO `uzf_area` VALUES ('3169', '376', '蒙自县', '3');
INSERT INTO `uzf_area` VALUES ('3170', '376', '个旧市', '3');
INSERT INTO `uzf_area` VALUES ('3171', '376', '开远市', '3');
INSERT INTO `uzf_area` VALUES ('3172', '376', '绿春县', '3');
INSERT INTO `uzf_area` VALUES ('3173', '376', '建水县', '3');
INSERT INTO `uzf_area` VALUES ('3174', '376', '石屏县', '3');
INSERT INTO `uzf_area` VALUES ('3175', '376', '弥勒县', '3');
INSERT INTO `uzf_area` VALUES ('3176', '376', '元阳县', '3');
INSERT INTO `uzf_area` VALUES ('3177', '376', '红河县', '3');
INSERT INTO `uzf_area` VALUES ('3178', '376', '金平', '3');
INSERT INTO `uzf_area` VALUES ('3179', '376', '河口', '3');
INSERT INTO `uzf_area` VALUES ('3180', '376', '屏边', '3');
INSERT INTO `uzf_area` VALUES ('3181', '377', '临翔区', '3');
INSERT INTO `uzf_area` VALUES ('3182', '377', '凤庆县', '3');
INSERT INTO `uzf_area` VALUES ('3183', '377', '云县', '3');
INSERT INTO `uzf_area` VALUES ('3184', '377', '永德县', '3');
INSERT INTO `uzf_area` VALUES ('3185', '377', '镇康县', '3');
INSERT INTO `uzf_area` VALUES ('3186', '377', '双江', '3');
INSERT INTO `uzf_area` VALUES ('3187', '377', '耿马', '3');
INSERT INTO `uzf_area` VALUES ('3188', '377', '沧源', '3');
INSERT INTO `uzf_area` VALUES ('3189', '378', '麒麟区', '3');
INSERT INTO `uzf_area` VALUES ('3190', '378', '宣威市', '3');
INSERT INTO `uzf_area` VALUES ('3191', '378', '马龙县', '3');
INSERT INTO `uzf_area` VALUES ('3192', '378', '陆良县', '3');
INSERT INTO `uzf_area` VALUES ('3193', '378', '师宗县', '3');
INSERT INTO `uzf_area` VALUES ('3194', '378', '罗平县', '3');
INSERT INTO `uzf_area` VALUES ('3195', '378', '富源县', '3');
INSERT INTO `uzf_area` VALUES ('3196', '378', '会泽县', '3');
INSERT INTO `uzf_area` VALUES ('3197', '378', '沾益县', '3');
INSERT INTO `uzf_area` VALUES ('3198', '379', '文山县', '3');
INSERT INTO `uzf_area` VALUES ('3199', '379', '砚山县', '3');
INSERT INTO `uzf_area` VALUES ('3200', '379', '西畴县', '3');
INSERT INTO `uzf_area` VALUES ('3201', '379', '麻栗坡县', '3');
INSERT INTO `uzf_area` VALUES ('3202', '379', '马关县', '3');
INSERT INTO `uzf_area` VALUES ('3203', '379', '丘北县', '3');
INSERT INTO `uzf_area` VALUES ('3204', '379', '广南县', '3');
INSERT INTO `uzf_area` VALUES ('3205', '379', '富宁县', '3');
INSERT INTO `uzf_area` VALUES ('3206', '380', '景洪市', '3');
INSERT INTO `uzf_area` VALUES ('3207', '380', '勐海县', '3');
INSERT INTO `uzf_area` VALUES ('3208', '380', '勐腊县', '3');
INSERT INTO `uzf_area` VALUES ('3209', '381', '红塔区', '3');
INSERT INTO `uzf_area` VALUES ('3210', '381', '江川县', '3');
INSERT INTO `uzf_area` VALUES ('3211', '381', '澄江县', '3');
INSERT INTO `uzf_area` VALUES ('3212', '381', '通海县', '3');
INSERT INTO `uzf_area` VALUES ('3213', '381', '华宁县', '3');
INSERT INTO `uzf_area` VALUES ('3214', '381', '易门县', '3');
INSERT INTO `uzf_area` VALUES ('3215', '381', '峨山', '3');
INSERT INTO `uzf_area` VALUES ('3216', '381', '新平', '3');
INSERT INTO `uzf_area` VALUES ('3217', '381', '元江', '3');
INSERT INTO `uzf_area` VALUES ('3218', '382', '昭阳区', '3');
INSERT INTO `uzf_area` VALUES ('3219', '382', '鲁甸县', '3');
INSERT INTO `uzf_area` VALUES ('3220', '382', '巧家县', '3');
INSERT INTO `uzf_area` VALUES ('3221', '382', '盐津县', '3');
INSERT INTO `uzf_area` VALUES ('3222', '382', '大关县', '3');
INSERT INTO `uzf_area` VALUES ('3223', '382', '永善县', '3');
INSERT INTO `uzf_area` VALUES ('3224', '382', '绥江县', '3');
INSERT INTO `uzf_area` VALUES ('3225', '382', '镇雄县', '3');
INSERT INTO `uzf_area` VALUES ('3226', '382', '彝良县', '3');
INSERT INTO `uzf_area` VALUES ('3227', '382', '威信县', '3');
INSERT INTO `uzf_area` VALUES ('3228', '382', '水富县', '3');
INSERT INTO `uzf_area` VALUES ('3229', '383', '西湖区', '3');
INSERT INTO `uzf_area` VALUES ('3230', '383', '上城区', '3');
INSERT INTO `uzf_area` VALUES ('3231', '383', '下城区', '3');
INSERT INTO `uzf_area` VALUES ('3232', '383', '拱墅区', '3');
INSERT INTO `uzf_area` VALUES ('3233', '383', '滨江区', '3');
INSERT INTO `uzf_area` VALUES ('3234', '383', '江干区', '3');
INSERT INTO `uzf_area` VALUES ('3235', '383', '萧山区', '3');
INSERT INTO `uzf_area` VALUES ('3236', '383', '余杭区', '3');
INSERT INTO `uzf_area` VALUES ('3237', '383', '市郊', '3');
INSERT INTO `uzf_area` VALUES ('3238', '383', '建德市', '3');
INSERT INTO `uzf_area` VALUES ('3239', '383', '富阳市', '3');
INSERT INTO `uzf_area` VALUES ('3240', '383', '临安市', '3');
INSERT INTO `uzf_area` VALUES ('3241', '383', '桐庐县', '3');
INSERT INTO `uzf_area` VALUES ('3242', '383', '淳安县', '3');
INSERT INTO `uzf_area` VALUES ('3243', '384', '吴兴区', '3');
INSERT INTO `uzf_area` VALUES ('3244', '384', '南浔区', '3');
INSERT INTO `uzf_area` VALUES ('3245', '384', '德清县', '3');
INSERT INTO `uzf_area` VALUES ('3246', '384', '长兴县', '3');
INSERT INTO `uzf_area` VALUES ('3247', '384', '安吉县', '3');
INSERT INTO `uzf_area` VALUES ('3248', '385', '南湖区', '3');
INSERT INTO `uzf_area` VALUES ('3249', '385', '秀洲区', '3');
INSERT INTO `uzf_area` VALUES ('3250', '385', '海宁市', '3');
INSERT INTO `uzf_area` VALUES ('3251', '385', '嘉善县', '3');
INSERT INTO `uzf_area` VALUES ('3252', '385', '平湖市', '3');
INSERT INTO `uzf_area` VALUES ('3253', '385', '桐乡市', '3');
INSERT INTO `uzf_area` VALUES ('3254', '385', '海盐县', '3');
INSERT INTO `uzf_area` VALUES ('3255', '386', '婺城区', '3');
INSERT INTO `uzf_area` VALUES ('3256', '386', '金东区', '3');
INSERT INTO `uzf_area` VALUES ('3257', '386', '兰溪市', '3');
INSERT INTO `uzf_area` VALUES ('3258', '386', '市区', '3');
INSERT INTO `uzf_area` VALUES ('3259', '386', '佛堂镇', '3');
INSERT INTO `uzf_area` VALUES ('3260', '386', '上溪镇', '3');
INSERT INTO `uzf_area` VALUES ('3261', '386', '义亭镇', '3');
INSERT INTO `uzf_area` VALUES ('3262', '386', '大陈镇', '3');
INSERT INTO `uzf_area` VALUES ('3263', '386', '苏溪镇', '3');
INSERT INTO `uzf_area` VALUES ('3264', '386', '赤岸镇', '3');
INSERT INTO `uzf_area` VALUES ('3265', '386', '东阳市', '3');
INSERT INTO `uzf_area` VALUES ('3266', '386', '永康市', '3');
INSERT INTO `uzf_area` VALUES ('3267', '386', '武义县', '3');
INSERT INTO `uzf_area` VALUES ('3268', '386', '浦江县', '3');
INSERT INTO `uzf_area` VALUES ('3269', '386', '磐安县', '3');
INSERT INTO `uzf_area` VALUES ('3270', '387', '莲都区', '3');
INSERT INTO `uzf_area` VALUES ('3271', '387', '龙泉市', '3');
INSERT INTO `uzf_area` VALUES ('3272', '387', '青田县', '3');
INSERT INTO `uzf_area` VALUES ('3273', '387', '缙云县', '3');
INSERT INTO `uzf_area` VALUES ('3274', '387', '遂昌县', '3');
INSERT INTO `uzf_area` VALUES ('3275', '387', '松阳县', '3');
INSERT INTO `uzf_area` VALUES ('3276', '387', '云和县', '3');
INSERT INTO `uzf_area` VALUES ('3277', '387', '庆元县', '3');
INSERT INTO `uzf_area` VALUES ('3278', '387', '景宁', '3');
INSERT INTO `uzf_area` VALUES ('3279', '388', '海曙区', '3');
INSERT INTO `uzf_area` VALUES ('3280', '388', '江东区', '3');
INSERT INTO `uzf_area` VALUES ('3281', '388', '江北区', '3');
INSERT INTO `uzf_area` VALUES ('3282', '388', '镇海区', '3');
INSERT INTO `uzf_area` VALUES ('3283', '388', '北仑区', '3');
INSERT INTO `uzf_area` VALUES ('3284', '388', '鄞州区', '3');
INSERT INTO `uzf_area` VALUES ('3285', '388', '余姚市', '3');
INSERT INTO `uzf_area` VALUES ('3286', '388', '慈溪市', '3');
INSERT INTO `uzf_area` VALUES ('3287', '388', '奉化市', '3');
INSERT INTO `uzf_area` VALUES ('3288', '388', '象山县', '3');
INSERT INTO `uzf_area` VALUES ('3289', '388', '宁海县', '3');
INSERT INTO `uzf_area` VALUES ('3290', '389', '越城区', '3');
INSERT INTO `uzf_area` VALUES ('3291', '389', '上虞市', '3');
INSERT INTO `uzf_area` VALUES ('3292', '389', '嵊州市', '3');
INSERT INTO `uzf_area` VALUES ('3293', '389', '绍兴县', '3');
INSERT INTO `uzf_area` VALUES ('3294', '389', '新昌县', '3');
INSERT INTO `uzf_area` VALUES ('3295', '389', '诸暨市', '3');
INSERT INTO `uzf_area` VALUES ('3296', '390', '椒江区', '3');
INSERT INTO `uzf_area` VALUES ('3297', '390', '黄岩区', '3');
INSERT INTO `uzf_area` VALUES ('3298', '390', '路桥区', '3');
INSERT INTO `uzf_area` VALUES ('3299', '390', '温岭市', '3');
INSERT INTO `uzf_area` VALUES ('3300', '390', '临海市', '3');
INSERT INTO `uzf_area` VALUES ('3301', '390', '玉环县', '3');
INSERT INTO `uzf_area` VALUES ('3302', '390', '三门县', '3');
INSERT INTO `uzf_area` VALUES ('3303', '390', '天台县', '3');
INSERT INTO `uzf_area` VALUES ('3304', '390', '仙居县', '3');
INSERT INTO `uzf_area` VALUES ('3305', '391', '鹿城区', '3');
INSERT INTO `uzf_area` VALUES ('3306', '391', '龙湾区', '3');
INSERT INTO `uzf_area` VALUES ('3307', '391', '瓯海区', '3');
INSERT INTO `uzf_area` VALUES ('3308', '391', '瑞安市', '3');
INSERT INTO `uzf_area` VALUES ('3309', '391', '乐清市', '3');
INSERT INTO `uzf_area` VALUES ('3310', '391', '洞头县', '3');
INSERT INTO `uzf_area` VALUES ('3311', '391', '永嘉县', '3');
INSERT INTO `uzf_area` VALUES ('3312', '391', '平阳县', '3');
INSERT INTO `uzf_area` VALUES ('3313', '391', '苍南县', '3');
INSERT INTO `uzf_area` VALUES ('3314', '391', '文成县', '3');
INSERT INTO `uzf_area` VALUES ('3315', '391', '泰顺县', '3');
INSERT INTO `uzf_area` VALUES ('3316', '392', '定海区', '3');
INSERT INTO `uzf_area` VALUES ('3317', '392', '普陀区', '3');
INSERT INTO `uzf_area` VALUES ('3318', '392', '岱山县', '3');
INSERT INTO `uzf_area` VALUES ('3319', '392', '嵊泗县', '3');
INSERT INTO `uzf_area` VALUES ('3320', '393', '衢州市', '3');
INSERT INTO `uzf_area` VALUES ('3321', '393', '江山市', '3');
INSERT INTO `uzf_area` VALUES ('3322', '393', '常山县', '3');
INSERT INTO `uzf_area` VALUES ('3323', '393', '开化县', '3');
INSERT INTO `uzf_area` VALUES ('3324', '393', '龙游县', '3');
INSERT INTO `uzf_area` VALUES ('3325', '394', '合川区', '3');
INSERT INTO `uzf_area` VALUES ('3326', '394', '江津区', '3');
INSERT INTO `uzf_area` VALUES ('3327', '394', '南川区', '3');
INSERT INTO `uzf_area` VALUES ('3328', '394', '永川区', '3');
INSERT INTO `uzf_area` VALUES ('3329', '394', '南岸区', '3');
INSERT INTO `uzf_area` VALUES ('3330', '394', '渝北区', '3');
INSERT INTO `uzf_area` VALUES ('3331', '394', '万盛区', '3');
INSERT INTO `uzf_area` VALUES ('3332', '394', '大渡口区', '3');
INSERT INTO `uzf_area` VALUES ('3333', '394', '万州区', '3');
INSERT INTO `uzf_area` VALUES ('3334', '394', '北碚区', '3');
INSERT INTO `uzf_area` VALUES ('3335', '394', '沙坪坝区', '3');
INSERT INTO `uzf_area` VALUES ('3336', '394', '巴南区', '3');
INSERT INTO `uzf_area` VALUES ('3337', '394', '涪陵区', '3');
INSERT INTO `uzf_area` VALUES ('3338', '394', '江北区', '3');
INSERT INTO `uzf_area` VALUES ('3339', '394', '九龙坡区', '3');
INSERT INTO `uzf_area` VALUES ('3340', '394', '渝中区', '3');
INSERT INTO `uzf_area` VALUES ('3341', '394', '黔江开发区', '3');
INSERT INTO `uzf_area` VALUES ('3342', '394', '长寿区', '3');
INSERT INTO `uzf_area` VALUES ('3343', '394', '双桥区', '3');
INSERT INTO `uzf_area` VALUES ('3344', '394', '綦江县', '3');
INSERT INTO `uzf_area` VALUES ('3345', '394', '潼南县', '3');
INSERT INTO `uzf_area` VALUES ('3346', '394', '铜梁县', '3');
INSERT INTO `uzf_area` VALUES ('3347', '394', '大足县', '3');
INSERT INTO `uzf_area` VALUES ('3348', '394', '荣昌县', '3');
INSERT INTO `uzf_area` VALUES ('3349', '394', '璧山县', '3');
INSERT INTO `uzf_area` VALUES ('3350', '394', '垫江县', '3');
INSERT INTO `uzf_area` VALUES ('3351', '394', '武隆县', '3');
INSERT INTO `uzf_area` VALUES ('3352', '394', '丰都县', '3');
INSERT INTO `uzf_area` VALUES ('3353', '394', '城口县', '3');
INSERT INTO `uzf_area` VALUES ('3354', '394', '梁平县', '3');
INSERT INTO `uzf_area` VALUES ('3355', '394', '开县', '3');
INSERT INTO `uzf_area` VALUES ('3356', '394', '巫溪县', '3');
INSERT INTO `uzf_area` VALUES ('3357', '394', '巫山县', '3');
INSERT INTO `uzf_area` VALUES ('3358', '394', '奉节县', '3');
INSERT INTO `uzf_area` VALUES ('3359', '394', '云阳县', '3');
INSERT INTO `uzf_area` VALUES ('3360', '394', '忠县', '3');
INSERT INTO `uzf_area` VALUES ('3361', '394', '石柱', '3');
INSERT INTO `uzf_area` VALUES ('3362', '394', '彭水', '3');
INSERT INTO `uzf_area` VALUES ('3363', '394', '酉阳', '3');
INSERT INTO `uzf_area` VALUES ('3364', '394', '秀山', '3');
INSERT INTO `uzf_area` VALUES ('3365', '395', '沙田区', '3');
INSERT INTO `uzf_area` VALUES ('3366', '395', '东区', '3');
INSERT INTO `uzf_area` VALUES ('3367', '395', '观塘区', '3');
INSERT INTO `uzf_area` VALUES ('3368', '395', '黄大仙区', '3');
INSERT INTO `uzf_area` VALUES ('3369', '395', '九龙城区', '3');
INSERT INTO `uzf_area` VALUES ('3370', '395', '屯门区', '3');
INSERT INTO `uzf_area` VALUES ('3371', '395', '葵青区', '3');
INSERT INTO `uzf_area` VALUES ('3372', '395', '元朗区', '3');
INSERT INTO `uzf_area` VALUES ('3373', '395', '深水埗区', '3');
INSERT INTO `uzf_area` VALUES ('3374', '395', '西贡区', '3');
INSERT INTO `uzf_area` VALUES ('3375', '395', '大埔区', '3');
INSERT INTO `uzf_area` VALUES ('3376', '395', '湾仔区', '3');
INSERT INTO `uzf_area` VALUES ('3377', '395', '油尖旺区', '3');
INSERT INTO `uzf_area` VALUES ('3378', '395', '北区', '3');
INSERT INTO `uzf_area` VALUES ('3379', '395', '南区', '3');
INSERT INTO `uzf_area` VALUES ('3380', '395', '荃湾区', '3');
INSERT INTO `uzf_area` VALUES ('3381', '395', '中西区', '3');
INSERT INTO `uzf_area` VALUES ('3382', '395', '离岛区', '3');
INSERT INTO `uzf_area` VALUES ('3383', '396', '澳门', '3');
INSERT INTO `uzf_area` VALUES ('3384', '397', '台北', '3');
INSERT INTO `uzf_area` VALUES ('3385', '397', '高雄', '3');
INSERT INTO `uzf_area` VALUES ('3386', '397', '基隆', '3');
INSERT INTO `uzf_area` VALUES ('3387', '397', '台中', '3');
INSERT INTO `uzf_area` VALUES ('3388', '397', '台南', '3');
INSERT INTO `uzf_area` VALUES ('3389', '397', '新竹', '3');
INSERT INTO `uzf_area` VALUES ('3390', '397', '嘉义', '3');
INSERT INTO `uzf_area` VALUES ('3391', '397', '宜兰县', '3');
INSERT INTO `uzf_area` VALUES ('3392', '397', '桃园县', '3');
INSERT INTO `uzf_area` VALUES ('3393', '397', '苗栗县', '3');
INSERT INTO `uzf_area` VALUES ('3394', '397', '彰化县', '3');
INSERT INTO `uzf_area` VALUES ('3395', '397', '南投县', '3');
INSERT INTO `uzf_area` VALUES ('3396', '397', '云林县', '3');
INSERT INTO `uzf_area` VALUES ('3397', '397', '屏东县', '3');
INSERT INTO `uzf_area` VALUES ('3398', '397', '台东县', '3');
INSERT INTO `uzf_area` VALUES ('3399', '397', '花莲县', '3');
INSERT INTO `uzf_area` VALUES ('3400', '397', '澎湖县', '3');
INSERT INTO `uzf_area` VALUES ('3401', '3', '合肥', '2');
INSERT INTO `uzf_area` VALUES ('3402', '3401', '庐阳区', '3');
INSERT INTO `uzf_area` VALUES ('3403', '3401', '瑶海区', '3');
INSERT INTO `uzf_area` VALUES ('3404', '3401', '蜀山区', '3');
INSERT INTO `uzf_area` VALUES ('3405', '3401', '包河区', '3');
INSERT INTO `uzf_area` VALUES ('3406', '3401', '长丰县', '3');
INSERT INTO `uzf_area` VALUES ('3407', '3401', '肥东县', '3');
INSERT INTO `uzf_area` VALUES ('3408', '3401', '肥西县', '3');

-- ----------------------------
-- Table structure for `uzf_area_store`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_area_store`;
CREATE TABLE `uzf_area_store` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `us_id` int(100) NOT NULL COMMENT '对应会员id',
  `area_name` varchar(100) NOT NULL COMMENT '区域运营名',
  `add_time` datetime NOT NULL,
  `area_status` tinyint(2) NOT NULL DEFAULT '1',
  `area_description` text,
  `area_delete_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1存在0删除',
  `ad_id` int(100) NOT NULL COMMENT '对应管理员id',
  `delete_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='区域商表';

-- ----------------------------
-- Records of uzf_area_store
-- ----------------------------
INSERT INTO `uzf_area_store` VALUES ('1', '0', '自营店', '2018-05-21 15:41:51', '1', '所有的自营店', '1', '1', null);
INSERT INTO `uzf_area_store` VALUES ('7', '75', '第一区域', '2018-06-23 16:56:21', '1', '第一个区域商', '1', '31', null);

-- ----------------------------
-- Table structure for `uzf_award`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_award`;
CREATE TABLE `uzf_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `us_level` int(2) NOT NULL COMMENT '会员等级  2一星  4两星  6三星',
  `award_level` int(2) NOT NULL COMMENT '奖励代数 1一代  2二代  3三代',
  `ca_level` int(2) NOT NULL COMMENT '分类级别 1A大类 2B大类 3C大类',
  `award` float(11,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='奖励表';

-- ----------------------------
-- Records of uzf_award
-- ----------------------------
INSERT INTO `uzf_award` VALUES ('1', '2', '1', '1', '0.3000');
INSERT INTO `uzf_award` VALUES ('2', '2', '1', '2', '0.1000');
INSERT INTO `uzf_award` VALUES ('3', '2', '1', '3', '0.0300');
INSERT INTO `uzf_award` VALUES ('4', '2', '2', '1', '0.1000');
INSERT INTO `uzf_award` VALUES ('5', '2', '2', '2', '0.0500');
INSERT INTO `uzf_award` VALUES ('6', '2', '2', '3', '0.0200');
INSERT INTO `uzf_award` VALUES ('7', '2', '3', '1', '0.0500');
INSERT INTO `uzf_award` VALUES ('8', '2', '3', '2', '0.0300');
INSERT INTO `uzf_award` VALUES ('9', '2', '3', '3', '0.0100');
INSERT INTO `uzf_award` VALUES ('10', '4', '1', '1', '0.4000');
INSERT INTO `uzf_award` VALUES ('11', '4', '1', '2', '0.1500');
INSERT INTO `uzf_award` VALUES ('12', '4', '1', '3', '0.0400');
INSERT INTO `uzf_award` VALUES ('13', '4', '2', '1', '0.1000');
INSERT INTO `uzf_award` VALUES ('14', '4', '2', '2', '0.0500');
INSERT INTO `uzf_award` VALUES ('15', '4', '2', '3', '0.0200');
INSERT INTO `uzf_award` VALUES ('16', '4', '3', '1', '0.0500');
INSERT INTO `uzf_award` VALUES ('17', '4', '3', '2', '0.0300');
INSERT INTO `uzf_award` VALUES ('18', '4', '3', '3', '0.0100');
INSERT INTO `uzf_award` VALUES ('19', '6', '1', '1', '0.5000');
INSERT INTO `uzf_award` VALUES ('20', '6', '1', '2', '0.2000');
INSERT INTO `uzf_award` VALUES ('21', '6', '1', '3', '0.0500');
INSERT INTO `uzf_award` VALUES ('22', '6', '2', '1', '0.1000');
INSERT INTO `uzf_award` VALUES ('23', '6', '2', '2', '0.0500');
INSERT INTO `uzf_award` VALUES ('24', '6', '2', '3', '0.0200');
INSERT INTO `uzf_award` VALUES ('25', '6', '3', '1', '0.0500');
INSERT INTO `uzf_award` VALUES ('26', '6', '3', '2', '0.0300');
INSERT INTO `uzf_award` VALUES ('27', '6', '3', '3', '0.0100');

-- ----------------------------
-- Table structure for `uzf_bidding`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_bidding`;
CREATE TABLE `uzf_bidding` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '竞价表',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `pd_id` int(20) DEFAULT NULL COMMENT '服务id（产品id）',
  `sales` int(20) DEFAULT NULL COMMENT '服务次数',
  `times` int(5) DEFAULT NULL COMMENT '第几次竞拍',
  `add_time` datetime DEFAULT NULL COMMENT '竞价时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '竞价状态：0 未中标 1 中标',
  `pd_name` varchar(100) DEFAULT NULL COMMENT '服务名称',
  `pd_price` decimal(20,8) DEFAULT NULL COMMENT '服务价格',
  `fee` decimal(20,8) DEFAULT NULL COMMENT '手续费',
  PRIMARY KEY (`id`),
  UNIQUE KEY `biding_unique` (`pd_id`,`sales`,`times`) USING BTREE COMMENT '同一服务，同一销售次数，必须有唯一一次竞拍'
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='竞价表';

-- ----------------------------
-- Records of uzf_bidding
-- ----------------------------
INSERT INTO `uzf_bidding` VALUES ('1', '19', '129', '1', '1', '2020-04-12 09:21:38', '0', '好容颜SAP', '655.00000000', null);
INSERT INTO `uzf_bidding` VALUES ('4', '20', '121', '1266', '1', '2020-04-15 17:56:10', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '0.00000000');
INSERT INTO `uzf_bidding` VALUES ('8', '20', '121', '1266', '2', '2020-04-16 11:32:12', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '1.00000000');
INSERT INTO `uzf_bidding` VALUES ('16', '20', '121', '1266', '3', '2020-04-17 15:31:36', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '2.00000000');
INSERT INTO `uzf_bidding` VALUES ('24', '20', '121', '1266', '4', '2020-04-17 16:02:35', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '4.00000000');
INSERT INTO `uzf_bidding` VALUES ('25', '20', '121', '1266', '5', '2020-04-17 16:07:34', '1', '奥斯卡影视城特价电影票（双人）', '50.00000000', '8.00000000');
INSERT INTO `uzf_bidding` VALUES ('39', '20', '121', '1267', '1', '2020-04-20 17:29:25', '1', '奥斯卡影视城特价电影票（双人）', '50.00000000', '16.00000000');
INSERT INTO `uzf_bidding` VALUES ('40', '19', '121', '1268', '1', '2020-04-21 14:17:15', '1', '奥斯卡影视城特价电影票（双人）', '50.00000000', '16.00000000');
INSERT INTO `uzf_bidding` VALUES ('52', '19', '121', '1269', '1', '2020-04-21 15:24:05', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '0.00000000');
INSERT INTO `uzf_bidding` VALUES ('53', '19', '121', '1269', '2', '2020-04-21 15:24:17', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '1.00000000');
INSERT INTO `uzf_bidding` VALUES ('54', '19', '121', '1269', '3', '2020-04-21 15:24:20', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '2.00000000');
INSERT INTO `uzf_bidding` VALUES ('55', '19', '121', '1269', '4', '2020-04-21 15:24:21', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '4.00000000');
INSERT INTO `uzf_bidding` VALUES ('56', '19', '121', '1269', '5', '2020-04-21 15:24:23', '1', '奥斯卡影视城特价电影票（双人）', '50.00000000', '8.00000000');
INSERT INTO `uzf_bidding` VALUES ('57', '19', '121', '1270', '1', '2020-04-21 15:34:08', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '0.00000000');
INSERT INTO `uzf_bidding` VALUES ('58', '19', '121', '1270', '2', '2020-04-21 15:34:22', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '1.00000000');
INSERT INTO `uzf_bidding` VALUES ('59', '19', '121', '1270', '3', '2020-04-21 15:34:23', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '2.00000000');
INSERT INTO `uzf_bidding` VALUES ('60', '19', '121', '1270', '4', '2020-04-21 15:34:24', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '4.00000000');
INSERT INTO `uzf_bidding` VALUES ('61', '19', '121', '1270', '5', '2020-04-21 15:34:24', '1', '奥斯卡影视城特价电影票（双人）', '50.00000000', '8.00000000');
INSERT INTO `uzf_bidding` VALUES ('62', '19', '121', '1271', '1', '2020-04-21 16:45:44', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '0.00000000');
INSERT INTO `uzf_bidding` VALUES ('63', '19', '121', '1271', '2', '2020-04-21 16:46:00', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '1.00000000');
INSERT INTO `uzf_bidding` VALUES ('64', '20', '121', '1271', '3', '2020-04-21 16:49:25', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '2.00000000');
INSERT INTO `uzf_bidding` VALUES ('65', '20', '121', '1271', '4', '2020-04-21 16:56:18', '0', '奥斯卡影视城特价电影票（双人）', '50.00000000', '4.00000000');
INSERT INTO `uzf_bidding` VALUES ('67', '20', '121', '1271', '5', '2020-04-21 17:03:03', '1', '奥斯卡影视城特价电影票（双人）', '50.00000000', '8.00000000');
INSERT INTO `uzf_bidding` VALUES ('73', '20', '128', '1', '1', '2020-04-24 10:52:30', '0', '蓝钻KTV（15人）', '15.12400000', '0.00000000');
INSERT INTO `uzf_bidding` VALUES ('74', '20', '128', '1', '2', '2020-04-24 10:52:31', '1', '蓝钻KTV（15人）', '15.12400000', '1.00000000');

-- ----------------------------
-- Table structure for `uzf_cart`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_cart`;
CREATE TABLE `uzf_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `us_id` int(11) NOT NULL COMMENT '用户id',
  `pd_id` int(11) NOT NULL,
  `pd_num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `pd_name` varchar(100) NOT NULL COMMENT '商品名',
  `pd_price` varchar(11) NOT NULL COMMENT '商品价格',
  `pd_pic` text NOT NULL COMMENT '商品图片',
  `st_id` int(11) NOT NULL COMMENT '店铺id',
  `st_name` varchar(20) NOT NULL COMMENT '店铺名',
  `pd_content` varchar(255) NOT NULL,
  `pd_color` varchar(11) NOT NULL COMMENT '商品颜色分类',
  `pd_spec` varchar(11) NOT NULL COMMENT '商品规格',
  `delete_time` int(10) DEFAULT NULL,
  `take_fee` decimal(11,2) DEFAULT NULL COMMENT '快递费，显示用，结算时按商品表里的',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `pd_head_pic` text COMMENT '商品缩略图',
  `ca_pid` int(11) NOT NULL COMMENT '商品大类id',
  `sku_id` int(11) DEFAULT NULL COMMENT '商品规格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Records of uzf_cart
-- ----------------------------
INSERT INTO `uzf_cart` VALUES ('10', '15', '107', '5', 'vivo Z3  极光蓝', '20.00', '/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png,/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png', '0', '', '化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号', '经典红', '无敌型', null, '0.00', '2019-04-15 15:41:44', '/uploads/20180831/de750cabec9de915dfb33e1295ac8a67.png', '6', null);
INSERT INTO `uzf_cart` VALUES ('26', '22', '112', '1', '青岛啤酒', '50.00', '/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png,/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png', '0', '', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '', '默认', null, '0.00', '2019-05-09 17:09:13', '/uploads/20190508/49b359f820a23511bcfb53f217bc78a3.png', '11', '72743');

-- ----------------------------
-- Table structure for `uzf_cate`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_cate`;
CREATE TABLE `uzf_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务分类表',
  `p_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `ca_name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `ca_add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `ca_sort` int(10) DEFAULT '1' COMMENT '排序',
  `ca_pic` text COMMENT '分类图标',
  `bid_times` int(5) DEFAULT '2' COMMENT '竞价次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品（服务）分类表';

-- ----------------------------
-- Records of uzf_cate
-- ----------------------------
INSERT INTO `uzf_cate` VALUES ('1', '0', '餐饮', null, '2020-03-30 10:13:21', '1', '/uploads/20200330/b435ab9de81c0dc4cea125e5134e8082.jfif', '5');
INSERT INTO `uzf_cate` VALUES ('2', '0', '娱乐', null, '2020-03-30 10:20:34', '1', '/uploads/20200330/be60ba4008d638b8801da2a6d3fdf66b.png', null);
INSERT INTO `uzf_cate` VALUES ('3', '0', '影视', null, '2020-03-31 17:09:31', '1', '/uploads/20200331/5f4fd50b8ed6f4665cace9e62cf0e9ba.png', null);
INSERT INTO `uzf_cate` VALUES ('4', '0', '购物', null, '2020-04-01 09:21:13', '1', '/uploads/20200401/53d06d6a4bcc8864f2cbea5ba5dfb13d.jfif', null);
INSERT INTO `uzf_cate` VALUES ('5', '0', '美容', null, '2020-04-01 10:51:34', '1', '/uploads/20200401/0684a39c67a28259077fadf6c29c40d3.jfif', null);
INSERT INTO `uzf_cate` VALUES ('6', '1', '到店餐饮类', null, '2020-04-02 10:27:15', '1', '/uploads/20200402/95f24da73353145b06721d9b36e57332.jfif', null);
INSERT INTO `uzf_cate` VALUES ('7', '1', '外卖服务', null, '2020-04-02 11:01:11', '1', '/uploads/20200402/9d5adc4d66985812ae46d29e8f62dd26.jfif', null);
INSERT INTO `uzf_cate` VALUES ('8', '6', '豪华酒店', null, '2020-04-02 11:02:11', '1', '/uploads/20200402/93b9f8974168131155ccddc442f04d95.jfif', null);

-- ----------------------------
-- Table structure for `uzf_coin`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_coin`;
CREATE TABLE `uzf_coin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网站币种',
  `name` varchar(60) CHARACTER SET utf8 DEFAULT '' COMMENT '币名',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `usdt` decimal(15,8) DEFAULT '0.00000000' COMMENT '对usdt价格',
  `logo` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT 'logo',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `contract_address` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '合约地址',
  `contract_abi` text COMMENT '合约abi',
  `is_transfer` int(4) DEFAULT '0' COMMENT '是否开始提币',
  `min_transfer` decimal(15,8) DEFAULT '0.00000000' COMMENT '最小提币数量',
  `transfer_fee` decimal(15,8) DEFAULT '0.00000000' COMMENT '提币手续费',
  `is_recharge` tinyint(1) DEFAULT '0' COMMENT '是否开启充值',
  `min_recharge` decimal(15,8) DEFAULT '0.00000000' COMMENT '最小充值数量',
  `min_legal` decimal(25,8) DEFAULT '0.00000000' COMMENT '最小交易数量',
  `max_legal` decimal(25,8) DEFAULT '0.00000000' COMMENT '最大交易数量',
  `is_collect` int(4) DEFAULT '0' COMMENT '是否归拢',
  `min_collect` decimal(15,8) DEFAULT '0.00000000' COMMENT '最小归拢金额',
  `collect_public_key` varchar(255) DEFAULT NULL COMMENT '归拢地址',
  `fee_public_key` varchar(255) DEFAULT '' COMMENT '归拢时手续费账户公钥',
  `fee_private_key` varchar(255) DEFAULT NULL COMMENT '归拢时手续费账户私钥',
  `is_show` tinyint(4) DEFAULT '0' COMMENT '隐藏，显示，0显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `is_lever` (`is_recharge`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='币种表';

-- ----------------------------
-- Records of uzf_coin
-- ----------------------------
INSERT INTO `uzf_coin` VALUES ('1', 'AGB', '1', '0.00000000', null, null, '2019-01-15 17:05:59', '-', null, '1', '0.01000000', '0.00000000', '1', '0.00000000', '0.00000000', '0.50000000', '1', '0.00000000', '1CxmPvSU8uddDCXfBdiDG4qUCQCWZ3dm6N', '', null, '0');
INSERT INTO `uzf_coin` VALUES ('2', 'UZF', '98', '0.00000000', null, null, '2019-01-15 17:07:36', '-', null, '1', '0.10000000', '0.01000000', '1', '0.00000000', '0.50000000', '10.00000000', '1', '0.00000000', '0x6634a5352a313429dabd22c396272073e10cbde9', '', null, '0');
INSERT INTO `uzf_coin` VALUES ('3', 'USDT', '101', '0.00000000', null, null, '2019-01-17 18:45:38', '-', null, '0', '200.00000000', '5.00000000', '0', '0.00000000', '50.00000000', '10000.00000000', '0', '0.00000000', '0xC4630A0bF97d5B961e80377F577DD440007e3644', '', null, '0');
INSERT INTO `uzf_coin` VALUES ('12', 'USDT', '6', '0.00000000', null, null, '2019-12-07 01:59:21', '0xdac17f958d2ee523a2206206994597c13d831ec7', null, '1', '1.00000000', '1.00000000', '1', '0.00000000', null, null, '1', '0.00000000', '0xC4630A0bF97d5B961e80377F577DD440007e3644', '', null, '0');

-- ----------------------------
-- Table structure for `uzf_config`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_config`;
CREATE TABLE `uzf_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) DEFAULT NULL,
  `value` text,
  `note` varchar(255) DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='系统表';

-- ----------------------------
-- Records of uzf_config
-- ----------------------------
INSERT INTO `uzf_config` VALUES ('1', 'status', '1', '网站状态');
INSERT INTO `uzf_config` VALUES ('2', 'yuan_coin', '3', '购物币/人民币');
INSERT INTO `uzf_config` VALUES ('3', 'yong_ding', '500', '每日佣金封顶');
INSERT INTO `uzf_config` VALUES ('4', 'tixian_day', '3', '每周提现的日期 1234567');
INSERT INTO `uzf_config` VALUES ('5', 'direct_profit', '10', '动态直推佣金奖励%');
INSERT INTO `uzf_config` VALUES ('6', 'label', 'a:3:{i:1;a:2:{s:4:\"name\";s:6:\"超市\";s:3:\"pic\";s:54:\"/uploads/20180508\\641dd215aea7cf91f0670323e21f7e08.jpg\";}i:2;a:2:{s:4:\"name\";s:6:\"美食\";s:3:\"pic\";s:54:\"/uploads/20180508\\7d25c590d0474a9ed291adb31d85a60a.jpg\";}i:3;a:2:{s:4:\"name\";s:3:\"们\";s:3:\"pic\";s:54:\"/uploads/20180508\\fc30273afecc1b9d25ba85eebb9053e2.jpg\";}}', '门店标签列表');
INSERT INTO `uzf_config` VALUES ('7', 'award3', '5', '报单提成（间推）');
INSERT INTO `uzf_config` VALUES ('8', 'shuffling_figure', '/uploads/20190429\\62e4b43e4a0a26eb9929ebbcd5ec13b1.png', '轮播图');
INSERT INTO `uzf_config` VALUES ('9', 'award2', '50', '报单提成三的倍数（直推）');
INSERT INTO `uzf_config` VALUES ('10', 'award1', '10', '报单提成非三的倍数（直推）');
INSERT INTO `uzf_config` VALUES ('11', 'bank_num', '6228480218721012670', '平台收款银行卡号');
INSERT INTO `uzf_config` VALUES ('12', 'bank_person', '张三', '平台银行卡姓名');
INSERT INTO `uzf_config` VALUES ('138', 'bank_name', '中国农业银行', '平台银行卡');
INSERT INTO `uzf_config` VALUES ('139', 'bank_addr', '中国农业银行郑州分行', '平台银行卡分行名称');
INSERT INTO `uzf_config` VALUES ('140', 'fee', '0.1', '提现手续费');
INSERT INTO `uzf_config` VALUES ('141', 'lowest', '100', '提现最低额度');
INSERT INTO `uzf_config` VALUES ('142', 'sb', '0.1', '综合费用比例');
INSERT INTO `uzf_config` VALUES ('143', 'customer_tel', '13456879854', '客服电话');
INSERT INTO `uzf_config` VALUES ('144', 'customer_WeChat', 'shewasforever', '客服微信');
INSERT INTO `uzf_config` VALUES ('145', 'customer_qq', '784578452', '客服qq');
INSERT INTO `uzf_config` VALUES ('146', 'award4', '15', '复购提成（直推）');
INSERT INTO `uzf_config` VALUES ('147', 'award5', '5', '复购提成（间推）');
INSERT INTO `uzf_config` VALUES ('148', 'award6', '3', '特惠专区提成（直推）');
INSERT INTO `uzf_config` VALUES ('149', 'award7', '1', '特惠专区提成（间推）');
INSERT INTO `uzf_config` VALUES ('150', 'award8', '0.5', '月底分红提成（3-17人）');
INSERT INTO `uzf_config` VALUES ('151', 'award9', '1', '月底分红提成（18-59人）');
INSERT INTO `uzf_config` VALUES ('152', 'award10', '2.5', '月底分红提成（60人以上）');
INSERT INTO `uzf_config` VALUES ('153', 'bank_branch_name', '中国农业银行郑州分行', '平台银行卡分行名称');

-- ----------------------------
-- Table structure for `uzf_last`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_last`;
CREATE TABLE `uzf_last` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `ca_id` int(20) DEFAULT NULL COMMENT '分类id',
  `last_time` int(10) DEFAULT '2' COMMENT '持续时长（小时）',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `delete_time` varchar(50) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='服务分类对应时间表';

-- ----------------------------
-- Records of uzf_last
-- ----------------------------
INSERT INTO `uzf_last` VALUES ('1', '1', '2', '2020-04-01 15:24:48', null);
INSERT INTO `uzf_last` VALUES ('2', '1', '5', '2020-04-02 09:49:14', null);
INSERT INTO `uzf_last` VALUES ('3', '2', '3', '2020-04-02 09:52:45', null);
INSERT INTO `uzf_last` VALUES ('4', '3', '2', '2020-04-02 09:53:19', null);
INSERT INTO `uzf_last` VALUES ('5', '5', '4', '2020-04-02 09:53:39', null);
INSERT INTO `uzf_last` VALUES ('6', '4', '12', '2020-04-02 09:55:11', null);
INSERT INTO `uzf_last` VALUES ('7', '1', '1', '2020-04-02 09:56:00', null);
INSERT INTO `uzf_last` VALUES ('8', '8', '2', '2020-04-02 13:50:14', null);

-- ----------------------------
-- Table structure for `uzf_log`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_log`;
CREATE TABLE `uzf_log` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户操作记录表',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `table` varchar(100) DEFAULT NULL COMMENT '表名',
  `style` int(1) DEFAULT '1' COMMENT '操作类型：1查询 2 增加 3 更新  4 删除 ',
  `note` varchar(255) DEFAULT NULL COMMENT '记录内容',
  `add_time` datetime DEFAULT NULL COMMENT '操作时间',
  `role_id` int(20) DEFAULT NULL COMMENT '操作者id',
  `action_url` varchar(255) DEFAULT NULL COMMENT '操作url',
  `role_name` varchar(50) DEFAULT NULL COMMENT '操作者名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='操作记录表';

-- ----------------------------
-- Records of uzf_log
-- ----------------------------
INSERT INTO `uzf_log` VALUES ('1', '19', null, '3', '更改会员信息', '2020-04-10 15:58:08', '1', '/admin/user/edit.html', '超级管理员');
INSERT INTO `uzf_log` VALUES ('2', '17', 'user', '3', '更改会员信息', '2020-04-11 10:04:21', '1', '/admin/user/edit.html', '超级管理员');
INSERT INTO `uzf_log` VALUES ('3', '20', 'user', '2', '添加会员', '2020-04-11 10:24:44', '1', '/admin/user/add.html', '超级管理员');
INSERT INTO `uzf_log` VALUES ('4', '20', 'user', '4', '删除会员', '2020-04-11 11:42:56', '1', '/admin/user/delete.html', '超级管理员');
INSERT INTO `uzf_log` VALUES ('5', '3', 'admin', '3', '更新角色信息', '2020-04-22 10:37:08', '1', '/admin/admin/roleindex.html', '超级管理员');

-- ----------------------------
-- Table structure for `uzf_message`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_message`;
CREATE TABLE `uzf_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '新闻标题',
  `content` text COMMENT '留言内容',
  `add_time` datetime NOT NULL,
  `simple` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `us_id` int(11) DEFAULT '0' COMMENT '用户id',
  `ad_name` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `ad_tel` varchar(11) NOT NULL DEFAULT '' COMMENT '联系电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of uzf_message
-- ----------------------------
INSERT INTO `uzf_message` VALUES ('12', '新年大吉，前10位消费的用户可享受5折优惠', '<p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); clear: both; -ms-word-wrap: break-word !important; min-height: 1em; max-width: 100%; box-sizing: border-box !important;\"><br/></p><p><img src=\"/ueditor/php/upload/image/20180809/1533801930.png\" title=\"1533801930.png\"/></p><p>今天上线到拉萨口袋里撒克劳德凯撒卢克打了萨克的萨来得快</p><p><img src=\"/ueditor/php/upload/image/20180809/1533801930.png\" title=\"1533801930.png\"/></p><p>的萨拉快捷登录萨科技的了肯德基奥斯卡了解到来看撒娇的了肯德基阿斯利康建档立卡三级代理商骄傲地离开静安寺考虑到据了解</p><p><img src=\"/ueditor/php/upload/image/20180809/1533801930.png\" title=\"1533801930.png\"/></p><p>的数据卡号的空间仨号大家好看见爱上的科技的哈桑接客户的空间仨号的空间挥洒的跨界石的空间仨号的卡萨较好的卡萨较好的卡</p><p style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51); clear: both; -ms-word-wrap: break-word !important; min-height: 1em; max-width: 100%; box-sizing: border-box !important;\"><br/></p><p><br/></p><p><br/></p>', '2018-07-26 09:47:44', '代理商卡惊呆了空间撒的来看撒娇大立科技撒了肯德基流口水惊呆了空间撒来得快进口量撒娇镰刀快撒娇的来看撒娇的流口水甲氨蝶呤跨界', '/uploads/20180809\\b94dd7e112382421994951e1a87ee019.png', '0', '', '');
INSERT INTO `uzf_message` VALUES ('13', '第一条新闻', '<p>大萨达萨达</p><p><img src=\"/ueditor/php/upload/image/20180809/1533806498.png\" title=\"1533806498.png\" alt=\"sc11.png\"/></p>', '2018-08-09 17:21:39', '代理商卡惊呆了空间撒的来看撒娇大立科技撒了肯德基流口水惊呆了空间撒来得快进口量撒娇镰刀快撒娇的来看撒娇的流口水甲氨蝶呤跨界', '/uploads/20180809\\81db9c029dcde7978ddfb41d1ebe7d10.png', '0', '', '');
INSERT INTO `uzf_message` VALUES ('14', '第2条新闻', '<p>大萨达撒阿德萨打打<br/></p><p><img src=\"/ueditor/php/upload/image/20180809/1533807042.png\" title=\"1533807042.png\" alt=\"sc10.png\"/></p>', '2018-08-09 17:30:45', '代理商卡惊呆了空间撒的来看撒娇大立科技撒了肯德基流口水惊呆了空间撒来得快进口量撒娇镰刀快撒娇的来看撒娇的流口水甲氨蝶呤跨界', '/uploads/20180809\\6400d9bdf01d0cb6a7d088aa10ad62c9.png', '0', '', '');
INSERT INTO `uzf_message` VALUES ('15', '第3条新闻', '<p></p><p>大萨达撒阿德萨打打死打死 阿萨德 sad</p><p>大萨达萨达</p><p>大叔大婶</p><p>打死dsa</p><p><img src=\"/ueditor/php/upload/image/20180809/1533807087.png\" title=\"1533807087.png\" alt=\"sj5.png\"/></p><p><img src=\"/ueditor/php/upload/image/20180809/1533807094.png\" title=\"1533807094.png\" alt=\"sc13.png\"/></p>', '2018-08-09 17:31:36', '代理商卡惊呆了空间撒的来看撒娇大立科技撒了肯德基流口水惊呆了空间撒来得快进口量撒娇镰刀快撒娇的来看撒娇的流口水甲氨蝶呤跨界大萨达撒a大萨达撒a', '/uploads/20180809\\0100d70d1fed3232e6a1ee4a213ee58a.png', '0', '', '');

-- ----------------------------
-- Table structure for `uzf_money`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_money`;
CREATE TABLE `uzf_money` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员余额表',
  `user_id` int(11) DEFAULT '0' COMMENT '会员id',
  `username` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '会员账户',
  `coin_id` int(11) DEFAULT '0' COMMENT '币种id',
  `coin_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '币种名称',
  `address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT '分配公钥地址',
  `private_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '私钥',
  `money` decimal(20,8) DEFAULT '0.00000000' COMMENT '账户余额',
  `lock_money` decimal(20,8) DEFAULT '0.00000000' COMMENT '冻结金额',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `users_wallet_address_currency_user_id_index` (`address`,`coin_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT COMMENT='会员余额表';

-- ----------------------------
-- Records of uzf_money
-- ----------------------------
INSERT INTO `uzf_money` VALUES ('1', '20', '赵大宝', '2', 'UZF', '', null, '137.25600000', '766.62000000', '2020-04-15 13:45:09', null);
INSERT INTO `uzf_money` VALUES ('2', '1', '超级节点（1）', '2', 'UZF', '', null, '1005.80000000', '0.00000000', null, null);
INSERT INTO `uzf_money` VALUES ('3', '16', '系统服务商2', '2', 'UZF', '', null, '1002.40000000', '0.00000000', null, null);
INSERT INTO `uzf_money` VALUES ('4', '18', '顾先生', '2', 'UZF', '', null, '1029.00000000', '-66.00000000', null, null);
INSERT INTO `uzf_money` VALUES ('5', '19', '王琳', '2', 'UZF', '', null, '999.60000000', '0.00000000', null, null);
INSERT INTO `uzf_money` VALUES ('6', '15', '系统服务商', '2', 'UZF', '', null, '1000.00000000', '0.00000000', null, null);

-- ----------------------------
-- Table structure for `uzf_order`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_order`;
CREATE TABLE `uzf_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单表',
  `or_num` varchar(255) DEFAULT NULL COMMENT '订单号',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `us_id` int(11) DEFAULT NULL COMMENT '用户id',
  `or_add_time` datetime DEFAULT NULL COMMENT '添加订单时间',
  `or_status` int(11) DEFAULT NULL COMMENT '订单状态 0待支付  1已支付 2已完成',
  `or_finish_time` datetime DEFAULT NULL COMMENT '完成时间',
  `or_remark` text COMMENT '备注',
  `st_id` int(10) NOT NULL DEFAULT '0' COMMENT '商户id',
  `pay_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '支付方式：1uzf  2 agb ',
  `pd_id` int(20) DEFAULT NULL COMMENT '服务（商品）id',
  `total` decimal(20,8) DEFAULT '0.00000000' COMMENT '订单金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `or_num` (`or_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of uzf_order
-- ----------------------------
INSERT INTO `uzf_order` VALUES ('157', '2020042015065829731', null, '1', '2020-04-20 15:06:58', '0', null, null, '0', '1', null, '0.00000000');
INSERT INTO `uzf_order` VALUES ('158', '2020042017292553914', null, '20', '2020-04-20 17:29:25', '1', null, null, '0', '1', null, '66.00000000');
INSERT INTO `uzf_order` VALUES ('159', '2020042114171500753', null, '19', '2020-04-21 14:17:15', '1', null, null, '0', '1', null, '66.00000000');
INSERT INTO `uzf_order` VALUES ('160', '2020042115242332610', null, '19', '2020-04-21 15:24:23', '1', null, null, '0', '1', null, '58.00000000');
INSERT INTO `uzf_order` VALUES ('161', '2020042115342455789', null, '19', '2020-04-21 15:34:24', '1', null, null, '0', '1', null, '58.00000000');
INSERT INTO `uzf_order` VALUES ('162', '2020042117030354638', null, '20', '2020-04-21 17:03:03', '1', null, null, '0', '1', null, '58.00000000');

-- ----------------------------
-- Table structure for `uzf_order_detail`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_order_detail`;
CREATE TABLE `uzf_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `or_id` int(11) DEFAULT NULL COMMENT '订单id',
  `ca_id` int(11) DEFAULT NULL COMMENT '分类id',
  `pd_id` int(11) DEFAULT NULL COMMENT '产品id',
  `or_pd_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `or_pd_pic` text COMMENT '产品主图',
  `or_pd_price` decimal(11,2) DEFAULT NULL COMMENT '单价',
  `or_pd_total` decimal(10,2) DEFAULT NULL COMMENT '总价',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `or_num` varchar(100) DEFAULT NULL COMMENT '订单编号',
  `or_pd_num` int(11) DEFAULT NULL COMMENT '产品数量',
  `or_pd_content` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `sku_id` int(11) NOT NULL DEFAULT '0' COMMENT '规格id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='订单详情表';

-- ----------------------------
-- Records of uzf_order_detail
-- ----------------------------
INSERT INTO `uzf_order_detail` VALUES ('1', '1', '14', '107', 'vivo Z3  极光蓝', '/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png,/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png', '20.00', null, null, null, '1', '化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('2', '2', '15', '113', 'Apple iPhone XS Max', '/uploads/20180627/e04cdaa7d13e4cbf5f795b5a4366dcfc.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('3', '2', '19', '117', '植物香氛洗发乳防脱控油型', '/uploads/20180824/541d1453cb1c771e8d25c0d17413d438.png,/uploads/20180824/c15108d38cdb90e5f1fa35060f648916.png,/uploads/20180820/37bc53629ce86e153c1b89141c835172.png,/uploads/20180824/541d1453cb1c771e8d25c0d17413d438.png,/uploads/20180824/c15108d38cdb90e5f1fa35060f648916.png', '70.00', null, null, null, '1', '独特配方能有效地清除及平衡头皮过剩油脂，改善微循环，加固毛囊达到防脱、固发的功效。', '0');
INSERT INTO `uzf_order_detail` VALUES ('4', '3', '12', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '40.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('5', '4', '19', '117', '植物香氛洗发乳防脱控油型', '/uploads/20180824/541d1453cb1c771e8d25c0d17413d438.png,/uploads/20180824/c15108d38cdb90e5f1fa35060f648916.png,/uploads/20180820/37bc53629ce86e153c1b89141c835172.png,/uploads/20180824/541d1453cb1c771e8d25c0d17413d438.png,/uploads/20180824/c15108d38cdb90e5f1fa35060f648916.png', '70.00', null, null, null, '1', '独特配方能有效地清除及平衡头皮过剩油脂，改善微循环，加固毛囊达到防脱、固发的功效。', '0');
INSERT INTO `uzf_order_detail` VALUES ('6', '4', '15', '113', 'Apple iPhone XS Max', '/uploads/20180627/e04cdaa7d13e4cbf5f795b5a4366dcfc.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('7', '5', '14', '121', '全面屏双摄游戏手机', '/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png,/uploads/20180814/e58b90a8d8787ebd400bcc2bf113010d.png,/uploads/20180818/115bdb94264d80c62f6247e25ddf5384.png,/uploads/20180818/f605f2d13e51171117de4955f6cae7ae.png,/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png', '80.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('8', '6', '15', '113', 'Apple iPhone XS Max', '/uploads/20180627/e04cdaa7d13e4cbf5f795b5a4366dcfc.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('9', '7', '14', '121', '全面屏双摄游戏手机', '/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png,/uploads/20180814/e58b90a8d8787ebd400bcc2bf113010d.png,/uploads/20180818/115bdb94264d80c62f6247e25ddf5384.png,/uploads/20180818/f605f2d13e51171117de4955f6cae7ae.png,/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png', '80.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('10', '8', '13', '109', '小米一号', '/uploads/20180824/6cc40f03d979fae34bfd874607dbc554.png,/uploads/20180824/54edc865d8de1d5e173c11a2614b525b.png,/uploads/20180820/91089d5808c006899d1065ec5292a01a.png,/uploads/20180820/ce8b34967ce997bd5b56819ab248aa22.png,/uploads/20180824/6cc40f03d979fae34bfd874607dbc554.png,/uploads/20180824/54edc865d8de1d5e173c11a2614b525b.png', '40.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('11', '9', '12', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '40.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('12', '10', '15', '113', 'Apple iPhone XS Max', '/uploads/20180627/e04cdaa7d13e4cbf5f795b5a4366dcfc.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('13', '11', '14', '107', 'vivo Z3  极光蓝', '/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png,/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png', '20.00', null, null, null, '1', '化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('14', '12', '14', '120', '荣耀10青春版 幻彩渐变', '/uploads/20181208/ef229c3b159173f155b524fdfa1bd135.jpg,/uploads/20181208/5b6f1c30cdc0f24fd3378262ce977987.jpg,/uploads/20181208/ef229c3b159173f155b524fdfa1bd135.jpg,/uploads/20181208/5b6f1c30cdc0f24fd3378262ce977987.jpg', '80.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('15', '13', '18', '126', '店铺一的机器人', '/uploads/20180830/8ee50205f90929771b501a6124e7ef7b.png,/uploads/20180830/4906b59567efd6d4d31fd5d9186f1fe3.png,,/uploads/20180830/8ee50205f90929771b501a6124e7ef7b.png,/uploads/20180830/4906b59567efd6d4d31fd5d9186f1fe3.png', '30.00', null, null, null, '5', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('16', '14', '20', '113', 'Apple iPhone XS Max', '/uploads/20180627/e04cdaa7d13e4cbf5f795b5a4366dcfc.png', '500.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('17', '15', '20', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('18', '15', '20', '120', '双清口服液', '/uploads/20190415/5932d0f4616a8a2616f1994c3d46f4d0.jpg,/uploads/20190415/5932d0f4616a8a2616f1994c3d46f4d0.jpg', '80.00', null, null, null, '6', '双清口服液 shuang qing kou ru ye', '0');
INSERT INTO `uzf_order_detail` VALUES ('19', '16', '20', '121', '芬必得布洛芬缓释胶囊', '/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png,/uploads/20180814/e58b90a8d8787ebd400bcc2bf113010d.png,/uploads/20180818/115bdb94264d80c62f6247e25ddf5384.png,/uploads/20180818/f605f2d13e51171117de4955f6cae7ae.png,/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png', '499.00', null, null, null, '3', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('20', '17', '20', '121', '芬必得布洛芬缓释胶囊', '/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png,/uploads/20180814/e58b90a8d8787ebd400bcc2bf113010d.png,/uploads/20180818/115bdb94264d80c62f6247e25ddf5384.png,/uploads/20180818/f605f2d13e51171117de4955f6cae7ae.png,/uploads/20180827/da76ea3c37da5033d7dab6e96481a20a.png,/uploads/20180827/e2a065ecf4af6c2c05aedd012bf5389b.png', '499.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('21', '18', '21', '115', '植物香氛洗发乳滋润修复型', '/uploads/20180809/4e9d7f6351e18ada7b4f916d51290ec9.png', '60.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('22', '19', '18', '126', '长效西林(注射用苄星青霉素)', '/uploads/20190415/1c20787eb26279cdd135df825f5567c2.jpg,/uploads/20190415/1c20787eb26279cdd135df825f5567c2.jpg', '500.00', null, null, null, '1', '药品通提供注射用苄星青霉素(华北制药)的价格,同时包括注射用苄星青霉素(华北制药)说明书,注射用苄星青霉素(华北制药)功效与作用,注射用苄星青霉素(华北制药)副作用,', '0');
INSERT INTO `uzf_order_detail` VALUES ('23', '20', '20', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '40.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('24', '21', '20', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '40.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('25', '22', '20', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '40.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('26', '23', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('27', '24', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('28', '25', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('29', '26', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('30', '27', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('31', '28', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('32', '29', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('33', '30', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('34', '31', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('35', '32', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('36', '33', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('37', '34', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('38', '35', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('39', '36', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('40', '37', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('41', '38', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('42', '39', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('43', '40', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('44', '41', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('45', '42', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('46', '43', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('47', '44', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('48', '45', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('49', '46', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('50', '47', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('51', '48', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('52', '49', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('53', '50', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('54', '51', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('55', '52', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('56', '53', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('57', '54', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('58', '55', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('59', '56', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('60', '57', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('61', '58', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('62', '59', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('63', '60', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('64', '61', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('65', '62', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('66', '63', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('67', '64', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('68', '65', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('69', '66', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('70', '67', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('71', '68', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('72', '69', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('73', '70', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('74', '71', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('75', '72', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('76', '73', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('77', '74', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('78', '75', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('79', '76', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('80', '77', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('81', '78', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('82', '79', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('83', '80', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('84', '81', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('85', '82', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('86', '83', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('87', '84', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '1', '口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('88', '80', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '2', '一号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('89', '79', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '5', '号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('90', '85', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('91', '85', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '5', '号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('92', '85', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('93', '85', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '5', '号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('94', '85', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('95', '85', '10', '106', '口服液一号', '/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png,/uploads/20180824/29f60eb62d93bd72761dac91b47ef369.png,/uploads/20180824/afda487cdc4ef7c494436bec629eb7f6.png', '10.00', null, null, null, '5', '号口服液一号口服液一号', '0');
INSERT INTO `uzf_order_detail` VALUES ('96', '87', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '17', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('97', '88', '10', '126', '长效西林(注射用苄星青霉素)', '/uploads/20190415/1c20787eb26279cdd135df825f5567c2.jpg,/uploads/20190415/1c20787eb26279cdd135df825f5567c2.jpg', '500.00', null, null, null, '1', '药品通提供注射用苄星青霉素(华北制药)的价格,同时包括注射用苄星青霉素(华北制药)说明书,注射用苄星青霉素(华北制药)功效与作用,注射用苄星青霉素(华北制药)副作用,', '0');
INSERT INTO `uzf_order_detail` VALUES ('98', '89', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('99', '90', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('100', '91', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('101', '92', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('102', '93', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('103', '94', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('104', '95', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('105', '103', '9', '128', '东阿阿胶花', '/uploads/20190430/eaaac89bbb4e2d5997cb51c1ee998ff6.png,,/uploads/20190430/eaaac89bbb4e2d5997cb51c1ee998ff6.png', '500.00', null, null, null, '1', '', '0');
INSERT INTO `uzf_order_detail` VALUES ('106', '119', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('107', '121', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('108', '124', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('109', '126', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('110', '128', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('111', '130', '9', '128', '东阿阿胶花', '/uploads/20190430/eaaac89bbb4e2d5997cb51c1ee998ff6.png,,/uploads/20190430/eaaac89bbb4e2d5997cb51c1ee998ff6.png', '500.00', null, null, null, '2', '', '0');
INSERT INTO `uzf_order_detail` VALUES ('112', '131', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('113', '133', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('114', '134', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('115', '135', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('116', '137', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('117', '138', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('118', '139', '9', '108', '彩妆一号', '/uploads/20180627/bb7a8bc25b51b7a6c714843e621d00fe.png', '20.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('119', '141', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '72745');
INSERT INTO `uzf_order_detail` VALUES ('120', '142', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('121', '143', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('122', '144', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('123', '145', '9', '105', '清香洗发露', '/uploads/20180627/da824c824d225e29c7241ead85d73cf4.png', '10.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('124', '146', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '6', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('125', '147', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '2', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('126', '148', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '2', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('127', '149', '11', '112', '青岛啤酒', '/uploads/20180627/cf0fc42678eab469b901e4e6bfac6f58.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('128', '150', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('129', '151', '11', '110', '锤子（smartisan ) 坚果', '/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png,/uploads/20180720/1e36f7863126320613fa9041c2d6a3e6.jpg,/uploads/20180824/043cd1a9b80768e1abd7077319ab728c.png,/uploads/20180824/9f19da456a6e91f26914b27a0e5cab5e.png', '400.00', null, null, null, '1', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '0');
INSERT INTO `uzf_order_detail` VALUES ('130', '152', '11', '112', '青岛啤酒', '/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png,/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('131', '153', '11', '112', '青岛啤酒', '/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png,/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('132', '154', '9', '128', '东阿阿胶花', '/uploads/20190430/eaaac89bbb4e2d5997cb51c1ee998ff6.png,,/uploads/20190430/eaaac89bbb4e2d5997cb51c1ee998ff6.png', '500.00', null, null, null, '1', '', '0');
INSERT INTO `uzf_order_detail` VALUES ('133', '155', '11', '109', '小米一号', '/uploads/20190508/b44fc63fed8fe6b4b9a2ebe8cf6da144.png,/uploads/20190508/b44fc63fed8fe6b4b9a2ebe8cf6da144.png', '40.00', null, null, null, '4', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('134', '156', '11', '112', '青岛啤酒', '/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png,/uploads/20190507/d0c0dd5d78e9e78faa9e7c06f4b316c1.png', '50.00', null, null, null, '1', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '0');
INSERT INTO `uzf_order_detail` VALUES ('135', '157', '3', '121', '奥斯卡影视城特价电影票（双人）', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '50.00', null, null, null, '1', '奥斯卡，让你享受不一样的视觉盛宴！', '0');
INSERT INTO `uzf_order_detail` VALUES ('136', '158', '3', '121', '奥斯卡影视城特价电影票（双人）', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '50.00', null, null, null, '1', '奥斯卡，让你享受不一样的视觉盛宴！', '0');
INSERT INTO `uzf_order_detail` VALUES ('137', '159', '3', '121', '奥斯卡影视城特价电影票（双人）', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '50.00', null, null, null, '1', '奥斯卡，让你享受不一样的视觉盛宴！', '0');
INSERT INTO `uzf_order_detail` VALUES ('138', '160', '3', '121', '奥斯卡影视城特价电影票（双人）', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '50.00', null, null, null, '1', '奥斯卡，让你享受不一样的视觉盛宴！', '0');
INSERT INTO `uzf_order_detail` VALUES ('139', '161', '3', '121', '奥斯卡影视城特价电影票（双人）', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '50.00', null, null, null, '1', '奥斯卡，让你享受不一样的视觉盛宴！', '0');
INSERT INTO `uzf_order_detail` VALUES ('140', '162', '3', '121', '奥斯卡影视城特价电影票（双人）', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '50.00', null, null, null, '1', '奥斯卡，让你享受不一样的视觉盛宴！', '0');

-- ----------------------------
-- Table structure for `uzf_product`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_product`;
CREATE TABLE `uzf_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pd_name` varchar(255) NOT NULL DEFAULT '' COMMENT '服务名称',
  `pd_price` decimal(20,8) DEFAULT '0.00000000' COMMENT '服务价格',
  `pd_status` int(11) DEFAULT '1' COMMENT '服务状态 1 空闲 2预定中3 成交 4 冷却中',
  `pd_sales` int(20) DEFAULT '0' COMMENT '已服务次数（同一标的标识）',
  `pd_pic` text COMMENT '产品主图',
  `pd_content` text COMMENT '内容',
  `delete_time` varchar(50) DEFAULT NULL COMMENT '删除时间',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `ca_id` int(11) DEFAULT NULL COMMENT '服务分类id',
  `pd_detail` text COMMENT '详情',
  `pd_place` varchar(50) DEFAULT NULL COMMENT '服务地址',
  `st_id` int(11) DEFAULT '0' COMMENT '商家id',
  `st_status` tinyint(2) DEFAULT '1' COMMENT '1审核中 2通过审核',
  `pd_head_pic` text COMMENT '服务主图',
  `last_time` int(5) DEFAULT '2' COMMENT '服务持续时长（小时）',
  `start_time` datetime DEFAULT NULL COMMENT '竞价开始时间',
  `deal_time` datetime DEFAULT NULL COMMENT '成交时间',
  `spend_time` datetime DEFAULT NULL COMMENT '消费开始时间',
  `bidding_times` int(10) DEFAULT '3' COMMENT '最大竞价次数',
  `times` int(10) DEFAULT NULL COMMENT '当前竞价次数',
  `bid_last_time` int(10) DEFAULT '2' COMMENT '竞标可持续时间（小时）',
  `maybe_end_time` datetime DEFAULT NULL COMMENT '预计结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='商品（服务）表';

-- ----------------------------
-- Records of uzf_product
-- ----------------------------
INSERT INTO `uzf_product` VALUES ('105', '清香洗发露', '10.00000000', '2', '100', '/uploads/20190507/2d04057c86ec96128a81c6c1b2bc3d04.png,/uploads/20190507/2d04057c86ec96128a81c6c1b2bc3d04.png', '清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露清香洗发露', '1585709788', '2019-05-07 18:24:21', '9', '<p><br/></p><p><img src=\"/ueditor/php/upload/image/20190507/1557224658.png\" title=\"1557224658.png\" alt=\"详情3_副本.png\"/></p><p><br/></p>', '郑州', '0', '1', '/uploads/20190507/893e35267fb86f91c20f7c25dfb6b4db.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('107', 'vivo Z3  极光蓝', '20.00000000', '4', '111', '/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png,/uploads/20180824/b9c13ee7be9fb1fe4f185fe381d951bd.png,/uploads/20180824/b1210d894a784ad3e080895d91786562.png', '化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号化妆品一号', '1585709784', '2018-12-08 15:46:13', '14', '<p>的数据奥克兰的就离开<br/></p><p>大萨达大萨达</p><p><img src=\"/ueditor/php/upload/image/20180814/1534238911.png\" title=\"1534238911.png\" alt=\"分类_03 (2).png\"/></p><p>大萨达萨达撒旦撒多撒大所大啊阿萨德阿萨德啊</p><p><img src=\"/ueditor/php/upload/image/20180814/1534238919.png\" title=\"1534238919.png\" alt=\"分类_03.png\"/></p><p>的撒旦撒旦撒多</p><p>打死</p><p>阿萨德萨达</p><p><img src=\"/ueditor/php/upload/image/20180814/1534238935.png\" title=\"1534238935.png\" alt=\"分类_18.png\"/></p><p><img src=\"/ueditor/php/upload/image/20180814/1534238944.png\" title=\"1534238944.png\" alt=\"周周-首页_03 (3).png\"/></p><p><br/></p>', '郑州', '0', '1', '/uploads/20180831/de750cabec9de915dfb33e1295ac8a67.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('108', '彩妆一号', '20.00000000', '2', '12', '/uploads/20190507/1710dc5e6400d44c88c52907277bafd1.png,/uploads/20190507/1710dc5e6400d44c88c52907277bafd1.png', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '1585709779', '2019-05-07 18:22:38', '9', '<p><img src=\"/ueditor/php/upload/image/20190507/1557224555.png\" title=\"1557224555.png\" alt=\"详情3_副本.png\"/></p><p><br/></p>', '郑州', '0', '1', '/uploads/20190507/87f893d890c6a01b8fb7529deb15870e.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('113', 'Apple iPhone XS Max', '500.00000000', '2', '21', '/uploads/20180627/e04cdaa7d13e4cbf5f795b5a4366dcfc.png', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '1585709774', '2019-04-15 17:18:33', '20', '<p>的数据奥克兰的就离开<br/></p><p>大萨达大萨达</p><p><img src=\"/ueditor/php/upload/image/20180814/1534238911.png\" title=\"1534238911.png\" alt=\"分类_03 (2).png\"/></p><p>大萨达萨达撒旦撒多撒大所大啊阿萨德阿萨德啊</p><p><img src=\"/ueditor/php/upload/image/20180814/1534238919.png\" title=\"1534238919.png\" alt=\"分类_03.png\"/></p><p>的撒旦撒旦撒多</p><p>打死</p><p>阿萨德萨达</p><p><img src=\"/ueditor/php/upload/image/20180814/1534238935.png\" title=\"1534238935.png\" alt=\"分类_18.png\"/></p><p><img src=\"/ueditor/php/upload/image/20180814/1534238944.png\" title=\"1534238944.png\" alt=\"周周-首页_03 (3).png\"/></p><p><br/></p>', '郑州', '0', '1', '/uploads/20180831/b1c31df124ce21101d98c117c85f72fc.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('114', '植物香氛清疗丝滑素', '60.00000000', '2', '232', '/uploads/20180809/f020b87c2c70d89fb44f317c5c1a7d3b.png', '富含天然水解蛋白高营养H2O和阳离子聚合物，能迅速补充发质流失的蛋白质，氨基酸和水分，并能及时修复及锁紧毛鳞片，深层滋润发丝，强效修复受损空洞，抚平发丝毛躁，令秀发如丝般柔软顺滑，炫亮光泽。', '1585709770', '2019-04-15 17:18:11', '17', '<p><img src=\"/ueditor/php/upload/image/20180809/1533798345.png\" title=\"1533798345.png\" alt=\"fl1.png\"/></p>', '郑州', '0', '1', '/uploads/20180824/6c486730f95a7e37f7f4652e5f322199.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('115', '植物香氛洗发乳滋润修复型', '60.00000000', '2', '136', '/uploads/20180809/4e9d7f6351e18ada7b4f916d51290ec9.png', '富含氨基酸，天然杏仁油及橄榄油等多种滋养成分，并添加高丽参精华，进行充分深层渗透至发芯，填补头发因受损而产生的空洞，修复及顺滑头发纤维，修补保护膜，并防止头发水分流失，恢复原有的柔韧顺滑，炫亮光泽。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '1585709758', '2019-04-15 17:25:25', '21', '<p><img src=\"/ueditor/php/upload/image/20180809/1533798264.png\" title=\"1533798264.png\"/></p><p><img src=\"/ueditor/php/upload/image/20180809/1533798264.png\" title=\"1533798264.png\"/></p><p><br/></p><p>&nbsp;</p>', '郑州', '0', '1', '/uploads/20180824/7081a1bf30b1ebdf2b3e6b30f1f4e286.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('116', '植物香氛洗发乳清爽去屑型', '70.00000000', '2', '111', '/uploads/20180809/ff244f50bc79e97a9b4de65b37b9f863.png', '能有效清除头发及头皮有害物质，抑制头屑再生发痒等症状，保持头发及头皮生理健康，强化发丝，锁紧水分，长期减少外界带来的伤害，促进头皮的新陈代谢，使秀发清新光泽，头皮舒爽水润。COCO小姐5号经典香型，48小时留香，飘香四溢散发出迷人的香氛。', '1585709752', '2018-09-15 10:34:22', '18', '<p><img src=\"/ueditor/php/upload/image/20180809/1533798304.png\" title=\"1533798304.png\" alt=\"fl1.png\"/></p>', '郑州', '0', '1', '/uploads/20180824/4715c8ab235970bac34638abc8321c29.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('117', '植物香氛洗发乳防脱控油型', '700.00000000', '2', '1560', '/uploads/20180824/541d1453cb1c771e8d25c0d17413d438.png,/uploads/20180824/c15108d38cdb90e5f1fa35060f648916.png,/uploads/20180820/37bc53629ce86e153c1b89141c835172.png,/uploads/20180824/541d1453cb1c771e8d25c0d17413d438.png,/uploads/20180824/c15108d38cdb90e5f1fa35060f648916.png', '独特配方能有效地清除及平衡头皮过剩油脂，改善微循环，加固毛囊达到防脱、固发的功效。', '1585709747', '2019-04-15 17:25:07', '21', '', '郑州', '0', '1', '/uploads/20180824/8dd372dfb98422220ac8ed19b39b4d65.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('118', '水嫩滋养沐浴露柔美香型', '300.00000000', '2', '120', '/uploads/20190430/291db4adf36933cca41fc118af1616bc.png,/uploads/20190430/291db4adf36933cca41fc118af1616bc.png', '采用独特植物精油环保配方，蕴含独特香草精油成分，细腻低泡易冲水。诠释肌肤性感柔滑魅力，弥漫在来自希腊米克诺斯沐浴散发的迷人魅香梦境之中。持久留香，洁净皮肤的同时轻盈呵护，滋润保湿。\r\n使用方法：取适量本品倒入手心或浴棉上，轻轻揉搓出泡沫至全身，片刻后，用清水冲洗干净即可。\r\n注意事项：如不慎入眼，立即用清水冲洗干净。\r\n成分：水、月桂醇聚醚硫酸钠、脂肪醇硫酸铵、乙二醇双硬脂酸酯、椰油酸二乙醇胺、椰油酸胺丙基甜菜碱、EDTA二钠、氯化钠、草本植物精华、香精、芦荟精华。', '1585706233', '2019-04-30 10:48:35', '10', '<p><img src=\"/ueditor/php/upload/image/20190430/1556592495.png\" title=\"1556592495.png\" alt=\"详情3_副本.png\"/></p>', '郑州', '0', '1', '/uploads/20190430/fd67c0e39babaa4359eecd1f2f630b8a.png', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('120', '双清口服液', '80.00000000', '2', '100', '/uploads/20190415/5932d0f4616a8a2616f1994c3d46f4d0.jpg,/uploads/20190415/5932d0f4616a8a2616f1994c3d46f4d0.jpg', '双清口服液 shuang qing kou ru ye', '1585709738', '2019-04-15 17:18:53', '20', '<p><br/></p><p><br/></p><p><br/></p><p><br/></p><p><img src=\"/ueditor/php/upload/image/20190415/1555319375.png\" title=\"1555319375.png\" alt=\"image.png\"/></p>', '郑州', '0', '1', '/uploads/20190415/51800a5e026a3fb5303bba43dccccff4.jpg', '2', null, null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('121', '奥斯卡影视城特价电影票（双人）', '50.00000000', '3', '1271', '/uploads/20200401/c13b36988e0f8ef564cc9fac44236b1f.jpg', '奥斯卡，让你享受不一样的视觉盛宴！', null, '2019-04-15 16:54:19', '3', '<p style=\"text-align: center;\"><span style=\"font-size: 20px;\"><strong><span style=\"color: rgb(255, 0, 0);\"><br/></span></strong></span></p><p style=\"text-align: center;\"><br/></p><p><br/></p><p></p><p><img src=\"/ueditor/php/upload/image/20200401/1585704662423450.jpg\" title=\"1585704662423450.jpg\" alt=\"timg (8).jpg\"/></p>', '郑州市金水区东风路', '18', '2', '/uploads/20200401/22a01d6460c8e8c8a1f07bf819069235.jpg', '2', '2020-04-21 16:45:44', '2020-04-21 17:03:03', null, '5', '0', '2', null);
INSERT INTO `uzf_product` VALUES ('127', '四炒精美包间（6人）', '299.00000000', '2', '0', '/uploads/20200401/709ebc02069d59dd370b09cd0b7acf4a.jfif', '四炒餐饮，满足你所有的味蕾！', null, '2019-04-30 10:20:43', '1', '<p><img src=\"/ueditor/php/upload/image/20200401/1585704879826974.jpg\" title=\"1585704879826974.jpg\" alt=\"u=87016425,2919814262&amp;fm=11&amp;gp=0.jpg\"/></p>', '郑州市金水区', '18', '2', '/uploads/20200401/7f9bdd6b6d158de77632656e4fdb1593.jfif', '2', '2020-04-24 10:15:32', null, null, null, null, '2', null);
INSERT INTO `uzf_product` VALUES ('128', '蓝钻KTV（15人）', '15.12400000', '3', '0', '/uploads/20200331/700a0b01adac1787f86628a3aa1f6fbf.jfif', '想唱就唱，唱得响亮！', null, '2019-05-05 15:14:09', '2', '<p><img src=\"/ueditor/php/upload/image/20200331/1585648845506766.jpg\" title=\"1585648845506766.jpg\" alt=\"520_430.jpg\"/></p>', '郑州市管城区', '18', '2', '/uploads/20200331/b417ab32adc306005691ea186d167209.jfif', '2', '2020-04-24 10:52:30', '2020-04-24 14:55:51', null, '5', '0', '2', '2020-04-24 12:52:30');
INSERT INTO `uzf_product` VALUES ('129', '好容颜SAP', '655.00000000', '2', '0', '/uploads/20200401/c63229bd31938f3ccc2cb7c8be7d1d66.jfif,,/uploads/20200401/c63229bd31938f3ccc2cb7c8be7d1d66.jfif', '美容养颜就选好容颜。', null, '2020-04-01 10:56:39', '5', '', '郑州市二七区', '18', '2', '/uploads/20200401/7ef61cec6a4f09db9f296d031defff2f.jfif', '2', '2020-04-24 10:15:40', null, null, '0', null, '2', null);

-- ----------------------------
-- Table structure for `uzf_role`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_role`;
CREATE TABLE `uzf_role` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ro_name` char(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `ro_description` text COMMENT '角色描述',
  `ro_status` tinyint(1) NOT NULL DEFAULT '1',
  `ro_rules` varchar(255) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台用户组，角色表';

-- ----------------------------
-- Records of uzf_role
-- ----------------------------
INSERT INTO `uzf_role` VALUES ('1', '超管', '网站所有权限', '1', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66');
INSERT INTO `uzf_role` VALUES ('2', '管理员', '普通管理员所有权限', '1', '1,2,9,10,11,12,13,14,15,19,20,21,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43');
INSERT INTO `uzf_role` VALUES ('3', '财务部门', '查看财务和会员，无数据库更新，添加权限', '1', '1,2,7,9,10,38,39,40,41,42,43');

-- ----------------------------
-- Table structure for `uzf_rule`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_rule`;
CREATE TABLE `uzf_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '方法名',
  `meth` varchar(255) DEFAULT NULL COMMENT '方法',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='规则表';

-- ----------------------------
-- Records of uzf_rule
-- ----------------------------
INSERT INTO `uzf_rule` VALUES ('1', '0', 'admin/admin', '管理列表', '');
INSERT INTO `uzf_rule` VALUES ('2', '1', 'admin/admin/index', '管理员列表', '');
INSERT INTO `uzf_rule` VALUES ('3', '1', 'admin/admin/add', '管理员添加', '');
INSERT INTO `uzf_rule` VALUES ('4', '1', 'admin/admin/edit', '管理员修改', '');
INSERT INTO `uzf_rule` VALUES ('5', '1', 'admin/admin/change', '状态变更', '');
INSERT INTO `uzf_rule` VALUES ('6', '1', 'admin/admin/deleteadmin', '管理员删除', '');
INSERT INTO `uzf_rule` VALUES ('7', '1', 'admin/admin/roleindex', '角色列表', '');
INSERT INTO `uzf_rule` VALUES ('8', '1', 'admin/admin/roleadd', '角色添加修改', '');
INSERT INTO `uzf_rule` VALUES ('9', '0', 'admin/user', '会员管理', null);
INSERT INTO `uzf_rule` VALUES ('10', '9', 'admin/user/index', '会员列表', null);
INSERT INTO `uzf_rule` VALUES ('11', '9', 'admin/user/add', '添加会员', null);
INSERT INTO `uzf_rule` VALUES ('12', '9', 'admin/user/edit', '修改会员', null);
INSERT INTO `uzf_rule` VALUES ('13', '9', 'admin/user/delete', '删除会员', null);
INSERT INTO `uzf_rule` VALUES ('28', '0', 'admin/product', '商品管理', null);
INSERT INTO `uzf_rule` VALUES ('29', '28', 'admin/product/cate', '分类列表', null);
INSERT INTO `uzf_rule` VALUES ('30', '28', 'admin/product/cate_add', '分类添加', null);
INSERT INTO `uzf_rule` VALUES ('31', '28', 'admin/product/catechange', '分类修改', null);
INSERT INTO `uzf_rule` VALUES ('32', '28', 'admin/product/catedelete', '分类删除', null);
INSERT INTO `uzf_rule` VALUES ('33', '28', 'admin/product/index', '商品列表', null);
INSERT INTO `uzf_rule` VALUES ('34', '28', 'admin/product/add', '商品添加', null);
INSERT INTO `uzf_rule` VALUES ('35', '28', 'admin/product/edit', '商品修改', null);
INSERT INTO `uzf_rule` VALUES ('36', '28', 'admin/product/change', '状态修改', null);
INSERT INTO `uzf_rule` VALUES ('37', '28', 'admin/product/dodelete', '商品删除', null);
INSERT INTO `uzf_rule` VALUES ('38', '0', 'admin/order', '订单管理', null);
INSERT INTO `uzf_rule` VALUES ('39', '38', 'admin/order/index', '订单列表', null);
INSERT INTO `uzf_rule` VALUES ('40', '38', 'admin/order/dodelete', '订单删除', null);
INSERT INTO `uzf_rule` VALUES ('41', '0', 'admin/profit', '财务管理', null);
INSERT INTO `uzf_rule` VALUES ('42', '41', 'admin/profit/commissionapply', '提现申请', null);
INSERT INTO `uzf_rule` VALUES ('43', '41', 'admin/profit/commission', '提现记录', null);
INSERT INTO `uzf_rule` VALUES ('44', '0', 'admin/setting', '系统管理', null);
INSERT INTO `uzf_rule` VALUES ('45', '44', 'admin/setting/index', '基本设置', null);
INSERT INTO `uzf_rule` VALUES ('46', '44', 'admin/notice/index', '公告管理', null);
INSERT INTO `uzf_rule` VALUES ('47', '44', 'admin/setting/shuffling', '主页轮播', null);
INSERT INTO `uzf_rule` VALUES ('49', '44', 'admin/news/index', '客户留言', null);

-- ----------------------------
-- Table structure for `uzf_search`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_search`;
CREATE TABLE `uzf_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(50) DEFAULT NULL COMMENT '搜索内容',
  `times` int(11) NOT NULL DEFAULT '1' COMMENT '搜索次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='搜索表';

-- ----------------------------
-- Records of uzf_search
-- ----------------------------
INSERT INTO `uzf_search` VALUES ('1', '小米5', '2');
INSERT INTO `uzf_search` VALUES ('2', '青岛啤酒', '3');
INSERT INTO `uzf_search` VALUES ('3', '沙发', '13');
INSERT INTO `uzf_search` VALUES ('4', '长虹电视', '2');
INSERT INTO `uzf_search` VALUES ('5', '海尔空调', '7');
INSERT INTO `uzf_search` VALUES ('6', '美的空调', '28');
INSERT INTO `uzf_search` VALUES ('7', '美的冰箱', '7');
INSERT INTO `uzf_search` VALUES ('8', '机器人', '237');
INSERT INTO `uzf_search` VALUES ('9', '4646 46 4', '1');
INSERT INTO `uzf_search` VALUES ('10', '拆迁', '1');
INSERT INTO `uzf_search` VALUES ('11', '手机', '14');
INSERT INTO `uzf_search` VALUES ('12', '干啥跟他说', '1');
INSERT INTO `uzf_search` VALUES ('13', '及', '1');
INSERT INTO `uzf_search` VALUES ('14', '老干妈', '8');
INSERT INTO `uzf_search` VALUES ('15', 'haha', '1');
INSERT INTO `uzf_search` VALUES ('16', '养蜂协会', '3');
INSERT INTO `uzf_search` VALUES ('17', '搬家公司', '3');
INSERT INTO `uzf_search` VALUES ('18', '啤酒', '1');
INSERT INTO `uzf_search` VALUES ('19', 'fsdg', '1');
INSERT INTO `uzf_search` VALUES ('20', '清香', '1');
INSERT INTO `uzf_search` VALUES ('21', 'xiaomi', '1');

-- ----------------------------
-- Table structure for `uzf_sign`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_sign`;
CREATE TABLE `uzf_sign` (
  `id` int(15) NOT NULL AUTO_INCREMENT COMMENT '签到表',
  `us_id` int(15) DEFAULT NULL COMMENT '会员id',
  `days` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '已签到天数',
  `stime` datetime DEFAULT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='签到表';

-- ----------------------------
-- Records of uzf_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `uzf_skus`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_skus`;
CREATE TABLE `uzf_skus` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `pd_name` varchar(255) NOT NULL DEFAULT '  ' COMMENT '商品名称',
  `pd_id` int(11) NOT NULL COMMENT '商品id',
  `sku_name` varchar(255) NOT NULL COMMENT '商品规格名称',
  `sku_price` float(11,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72747 DEFAULT CHARSET=utf8 COMMENT='服务（商品）sku表';

-- ----------------------------
-- Records of uzf_skus
-- ----------------------------
INSERT INTO `uzf_skus` VALUES ('72740', '彩妆一号', '108', '黑彩', '200.00');
INSERT INTO `uzf_skus` VALUES ('72741', '清香洗发露', '105', '两盒24包', '400.00');
INSERT INTO `uzf_skus` VALUES ('72742', '清香洗发露', '105', '32盒108包', '650.00');
INSERT INTO `uzf_skus` VALUES ('72743', '青岛啤酒', '112', '一箱24瓶', '100.00');
INSERT INTO `uzf_skus` VALUES ('72744', '青岛啤酒', '112', '一箱12瓶', '50.00');
INSERT INTO `uzf_skus` VALUES ('72745', '锤子（smartisan ) 坚果', '110', '两盒24包', '56.00');
INSERT INTO `uzf_skus` VALUES ('72746', '锤子（smartisan ) 坚果', '110', '32盒108包', '354.00');

-- ----------------------------
-- Table structure for `uzf_tools`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_tools`;
CREATE TABLE `uzf_tools` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '道具表',
  `name` varchar(50) DEFAULT NULL COMMENT '道具名称',
  `category` int(5) DEFAULT NULL COMMENT '道具类型：1 升级卡  2 降级卡 3 其他道具',
  `ability` int(5) DEFAULT '1' COMMENT '升降次数',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：1 上架 2 下架 ',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `picture` varchar(255) DEFAULT NULL COMMENT '道具图片',
  `introduce` varchar(255) DEFAULT NULL COMMENT '道具功能描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='道具表';

-- ----------------------------
-- Records of uzf_tools
-- ----------------------------

-- ----------------------------
-- Table structure for `uzf_user`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_user`;
CREATE TABLE `uzf_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `us_account` varchar(255) DEFAULT NULL COMMENT '用户账号',
  `us_pid` int(11) DEFAULT '0' COMMENT '父id',
  `us_tel` varchar(11) DEFAULT NULL COMMENT '用户手机号',
  `us_realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `us_nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `us_head_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `us_pw2` varchar(255) DEFAULT NULL COMMENT '二级密码',
  `us_pwd` varchar(255) DEFAULT NULL COMMENT '登录密码',
  `us_status` int(11) DEFAULT '2' COMMENT '0冻结 1正常 2 未激活',
  `us_path` text COMMENT '全路径',
  `us_add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `delete_time` datetime DEFAULT NULL COMMENT '删除时间',
  `us_apply_tel` varchar(11) DEFAULT NULL COMMENT '申请商家联系电话',
  `us_apply_addr` varchar(255) DEFAULT NULL COMMENT '申请商家时的地址',
  `us_openid` varchar(255) DEFAULT NULL COMMENT '微信openid',
  `us_delete_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '删除状态： 1存在  0删除',
  `us_level` tinyint(2) NOT NULL DEFAULT '4' COMMENT ' 1一级会员 2 二级会员 3 三级会员 4普通会员',
  `gave_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1申请成为代理商2审批后成为一级代理商3二级，4三级，5四级，6五级，7六级，8七级，9八级，10九级',
  `gave_msg` int(2) NOT NULL DEFAULT '1' COMMENT '登录提示信息:1默认，需要提示2不提示',
  `active_time` datetime DEFAULT NULL COMMENT '激活时间（会员达成条件时间）',
  `us_vip_time` datetime DEFAULT NULL COMMENT '成为商家的时间',
  `us_id_card` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证',
  `us_card_front_pic` text COMMENT '身份证正面',
  `us_card_reverse_pic` text COMMENT '身份证反面',
  `us_addr_code` varchar(50) DEFAULT NULL COMMENT '地区code',
  `us_addr_addr` varchar(100) DEFAULT NULL COMMENT '地区',
  `us_reason` varchar(200) NOT NULL DEFAULT '' COMMENT '申请理由',
  `us_apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `ali_account` varchar(255) DEFAULT '' COMMENT '支付宝账号',
  `we_account` varchar(255) DEFAULT '' COMMENT '微信账号',
  `bank_account` varchar(255) DEFAULT '' COMMENT '银行卡账号',
  `bank_branch_name` varchar(255) DEFAULT '' COMMENT '开户支行',
  `ca_id` int(11) NOT NULL DEFAULT '1' COMMENT '------申请的分类id',
  `qrcode_ca_id` int(11) DEFAULT NULL COMMENT '------扫描二维码分类id',
  `qrcode_ca_list` varchar(100) DEFAULT NULL COMMENT '------扫描过的二维码列表',
  `qrcode` varchar(100) DEFAULT NULL COMMENT '------二维码',
  `apply_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '------1用户申请 2后台注册 3后台节点新增',
  `merchant_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不是商家 1申请状态 2是商家 3驳回',
  `us_apply_shopname` varchar(100) DEFAULT NULL COMMENT '申请店铺名',
  `us_apply_shop_pic` text COMMENT '店铺图片',
  `us_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '会员类型：1会员 2商家 3系统服务商 4 超级节点',
  `qq` varchar(100) DEFAULT NULL COMMENT 'qq',
  `free_times` int(5) unsigned DEFAULT '3' COMMENT '会员每天可以免费竞价的次数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`us_account`),
  UNIQUE KEY `tel` (`us_tel`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of uzf_user
-- ----------------------------
INSERT INTO `uzf_user` VALUES ('1', 'uzf2020000001', '0', '15538927152', '', '超级节点（1）', '/uploads/20200328/2b14c61bb59996e5aba38260174a571e.jpg', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '2020-03-28 13:55:52', null, null, '', null, '1', '0', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '4', null, '3');
INSERT INTO `uzf_user` VALUES ('13', 'uzf2020000002', '0', '15538927151', null, '超级节点2', '/static/admin/img/head1.jpg', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '2020-03-28 17:10:45', null, null, null, null, '1', '4', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '4', null, '3');
INSERT INTO `uzf_user` VALUES ('14', 'uzf2020000003', '0', '13462647626', null, '超级节点3', '/static/admin/img/head1.jpg', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '2020-03-31 15:16:01', null, null, null, null, '1', '4', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '4', null, '3');
INSERT INTO `uzf_user` VALUES ('15', 'uzf2020000004', '1', '13456241524', null, '系统服务商', '/static/admin/img/head1.jpg', null, 'e10adc3949ba59abbe56e057f20f883e', '1', '0,1', '2020-03-31 15:23:13', null, null, null, null, '1', '4', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '3', null, '3');
INSERT INTO `uzf_user` VALUES ('16', 'uzf2020000005', '1', '13354687451', '王鹏宇', '系统服务商2', '/static/admin/img/head.png', null, '508df4cb2f4d8f80519256258cfb975f', '1', '0,1', '2020-03-31 15:32:57', null, null, null, null, '1', '4', '0', '1', null, null, '41132319901232155', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '3', null, '3');
INSERT INTO `uzf_user` VALUES ('17', 'uzf2020000006', '16', '13454574845', '李思思', '李明启', '/static/admin/img/head.png', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '0', '0,1,16', '2020-04-02 17:49:02', null, null, null, null, '1', '1', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '1', null, '3');
INSERT INTO `uzf_user` VALUES ('18', 'uzf2020000007', '16', '15532478451', null, '顾先生', '/static/admin/img/head.png', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '2', '0,1,16', '2020-04-02 17:49:26', null, null, null, null, '1', '1', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '2', null, '3');
INSERT INTO `uzf_user` VALUES ('19', 'uzf2020000008', '15', '15524547485', '王敬之', '王琳', '/static/admin/img/head.png', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '2', '0,1,15', '2020-04-10 10:31:36', null, null, null, null, '1', '1', '0', '1', null, null, '411323199012125222', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '1', null, '3');
INSERT INTO `uzf_user` VALUES ('20', 'uzf2020000009', '15', '15538927153', null, '赵大宝', '/static/admin/img/head.png', 'e10adc3949ba59abbe56e057f20f883e', 'e10adc3949ba59abbe56e057f20f883e', '2', '0,1,15', '2020-04-11 10:24:44', '2020-04-11 11:42:56', null, null, null, '0', '1', '0', '1', null, null, '', null, null, null, null, '', null, '', '', '', '', '1', null, null, null, '2', '0', null, null, '1', null, '3');

-- ----------------------------
-- Table structure for `uzf_user_addr`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_user_addr`;
CREATE TABLE `uzf_user_addr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr_detail` varchar(255) DEFAULT NULL COMMENT '街道信息',
  `addr_default` int(11) DEFAULT NULL COMMENT '默认',
  `us_id` int(11) DEFAULT NULL COMMENT '用户id',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `addr_tel` varchar(255) DEFAULT NULL COMMENT '收货人手机号',
  `addr_receiver` varchar(255) DEFAULT NULL COMMENT '收货人',
  `addr_code` varchar(100) DEFAULT NULL COMMENT '区域代码',
  `province` varchar(100) NOT NULL COMMENT '省',
  `city` varchar(100) NOT NULL COMMENT '市',
  `area` varchar(100) NOT NULL COMMENT '区域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Records of uzf_user_addr
-- ----------------------------
INSERT INTO `uzf_user_addr` VALUES ('11', '规土委', '1', '1', null, '2018-09-04 10:58:35', '15646161313', '人防区分', '397,398,399', '江苏', '南京', '玄武区');
INSERT INTO `uzf_user_addr` VALUES ('12', 'fawf t', '0', '1', null, '2018-09-07 11:42:50', '15646163163', 'fqwt', '1,20', '北京', '其他', '');

-- ----------------------------
-- Table structure for `uzf_vote`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_vote`;
CREATE TABLE `uzf_vote` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '投票表',
  `user_id` int(20) DEFAULT NULL COMMENT '发起人id',
  `name` varchar(50) DEFAULT NULL COMMENT '投票主题',
  `add_time` datetime DEFAULT NULL COMMENT '发起时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `total` decimal(20,8) DEFAULT NULL COMMENT '累计资金',
  `need` decimal(20,8) DEFAULT NULL COMMENT '所需资金',
  `person_num` int(20) DEFAULT NULL COMMENT '参与人数',
  `user_levels` varchar(50) DEFAULT '3,4' COMMENT '参与范围：1会员 2 商家 3 系统服务商 4 超级节点',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发起投票表';

-- ----------------------------
-- Records of uzf_vote
-- ----------------------------

-- ----------------------------
-- Table structure for `uzf_voting`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_voting`;
CREATE TABLE `uzf_voting` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '投票过程表',
  `user_id` int(20) DEFAULT NULL,
  `v_id` int(20) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='投票过程表';

-- ----------------------------
-- Records of uzf_voting
-- ----------------------------

-- ----------------------------
-- Table structure for `uzf_wallet`
-- ----------------------------
DROP TABLE IF EXISTS `uzf_wallet`;
CREATE TABLE `uzf_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '交易流水表',
  `us_id` int(11) DEFAULT NULL COMMENT '用户id',
  `wa_num` decimal(20,8) NOT NULL COMMENT '金额',
  `wa_type` int(11) DEFAULT '1' COMMENT '1uzf 2agb ',
  `wa_note` varchar(255) DEFAULT NULL COMMENT '说明',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '删除时间',
  `or_id` varchar(50) DEFAULT NULL COMMENT '相关单号',
  `status` tinyint(1) DEFAULT '1' COMMENT '1出账 2入账',
  `lock_type` tinyint(1) DEFAULT '1' COMMENT '1:正常可用资金 2 冻结资金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8 COMMENT='交易流水明细';

-- ----------------------------
-- Records of uzf_wallet
-- ----------------------------
INSERT INTO `uzf_wallet` VALUES ('10', '1', '999.00000000', '3', '1代奖励发放', '2019-04-11 15:30:13', null, '0', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('11', '1', '250.00000000', '1', '报单奖励发放', '2019-04-18 14:17:59', null, '14', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('12', '1', '250.00000000', '1', '报单奖励发放', '2019-04-18 14:37:14', null, '14', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('13', '1', '250.00000000', '1', '报单奖励发放', '2019-04-18 14:37:57', null, '14', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('14', '1', '2.50000000', '4', '复购奖励发放', '2019-04-22 14:25:08', null, '月分红', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('91', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 14:07:55', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('92', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 14:10:12', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('93', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 14:18:15', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('94', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 14:18:27', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('95', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 14:32:31', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('96', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 15:25:36', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('97', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 15:42:50', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('98', '1', '1.25000000', '4', '月底分红奖励', '2019-05-21 15:51:50', null, '05月份分红奖励', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('99', '20', '50.00000000', '1', '竞标冻结资金', null, null, '11', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('100', '20', '50.00000000', '1', '竞标冻结资金', null, null, '11', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('101', '20', '2.00000000', '1', '竞标手续费', null, null, '11', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('102', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 15:16:35', null, '12', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('103', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 15:16:35', null, '12', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('104', '20', '2.00000000', '1', '竞标手续费', '2020-04-17 15:16:35', null, '12', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('105', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 15:22:00', null, '13', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('106', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 15:22:00', null, '13', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('107', '20', '2.00000000', '1', '竞标手续费', '2020-04-17 15:22:00', null, '13', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('108', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 15:31:36', null, '16', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('109', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 15:31:36', null, '16', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('110', '20', '2.00000000', '1', '竞标手续费', '2020-04-17 15:31:36', null, '16', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('117', '20', '0.80000000', '1', '竞价分润', '2020-04-17 16:02:35', null, '24', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('118', '18', '2.00000000', '1', '竞价分润', '2020-04-17 16:02:35', null, '24', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('119', '16', '0.80000000', '1', '竞价分润', '2020-04-17 16:02:35', null, '24', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('120', '1', '0.40000000', '1', '竞价分润', '2020-04-17 16:02:35', null, '24', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('121', '20', '50.00000000', '1', '竞价解冻资金', '2020-04-17 16:02:35', null, '24', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('122', '20', '50.00000000', '1', '解冻资金', '2020-04-17 16:02:35', null, '24', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('123', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 16:02:35', null, '24', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('124', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 16:02:35', null, '24', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('125', '20', '4.00000000', '1', '竞标手续费', '2020-04-17 16:02:35', null, '24', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('126', '20', '1.60000000', '1', '竞价分润', '2020-04-17 16:07:34', null, '25', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('127', '18', '4.00000000', '1', '竞价分润', '2020-04-17 16:07:34', null, '25', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('128', '16', '1.60000000', '1', '竞价分润', '2020-04-17 16:07:34', null, '25', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('129', '1', '0.80000000', '1', '竞价分润', '2020-04-17 16:07:34', null, '25', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('130', '20', '50.00000000', '1', '竞价解冻资金', '2020-04-17 16:07:34', null, '25', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('131', '20', '50.00000000', '1', '解冻资金', '2020-04-17 16:07:34', null, '25', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('132', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 16:07:34', null, '25', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('133', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-17 16:07:34', null, '25', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('134', '20', '8.00000000', '1', '竞标手续费', '2020-04-17 16:07:34', null, '25', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('137', '20', '66.00000000', '1', '中标费用', '2020-04-20 17:29:25', null, '39', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('138', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-20 17:29:25', null, '39', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('139', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-20 17:29:25', null, '39', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('140', '20', '16.00000000', '1', '竞标手续费', '2020-04-20 17:29:25', null, '39', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('141', '19', '66.00000000', '1', '中标费用', '2020-04-21 14:17:15', null, '40', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('142', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 14:17:15', null, '40', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('143', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 14:17:15', null, '40', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('144', '19', '16.00000000', '1', '竞标手续费', '2020-04-21 14:17:15', null, '40', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('155', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:18:47', null, '48', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('156', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:18:47', null, '48', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('157', '19', '1.00000000', '1', '竞标手续费', '2020-04-21 15:18:47', null, '48', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('158', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:21:42', null, '50', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('159', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:21:42', null, '50', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('160', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:05', null, '52', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('161', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:05', null, '52', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('162', '19', '0.20000000', '1', '竞价分润', '2020-04-21 15:24:17', null, '53', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('163', '18', '0.50000000', '1', '竞价分润', '2020-04-21 15:24:17', null, '53', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('164', '16', '0.20000000', '1', '竞价分润', '2020-04-21 15:24:17', null, '53', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('165', '1', '0.10000000', '1', '竞价分润', '2020-04-21 15:24:17', null, '53', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('166', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:24:17', null, '53', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('167', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:24:17', null, '53', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('168', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:17', null, '53', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('169', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:17', null, '53', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('170', '19', '1.00000000', '1', '竞标手续费', '2020-04-21 15:24:17', null, '53', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('171', '19', '0.40000000', '1', '竞价分润', '2020-04-21 15:24:20', null, '54', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('172', '18', '1.00000000', '1', '竞价分润', '2020-04-21 15:24:20', null, '54', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('173', '16', '0.40000000', '1', '竞价分润', '2020-04-21 15:24:20', null, '54', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('174', '1', '0.20000000', '1', '竞价分润', '2020-04-21 15:24:20', null, '54', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('175', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:24:20', null, '54', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('176', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:24:20', null, '54', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('177', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:20', null, '54', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('178', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:20', null, '54', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('179', '19', '2.00000000', '1', '竞标手续费', '2020-04-21 15:24:20', null, '54', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('180', '19', '0.80000000', '1', '竞价分润', '2020-04-21 15:24:21', null, '55', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('181', '18', '2.00000000', '1', '竞价分润', '2020-04-21 15:24:21', null, '55', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('182', '16', '0.80000000', '1', '竞价分润', '2020-04-21 15:24:21', null, '55', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('183', '1', '0.40000000', '1', '竞价分润', '2020-04-21 15:24:21', null, '55', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('184', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:24:21', null, '55', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('185', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:24:21', null, '55', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('186', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:21', null, '55', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('187', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:21', null, '55', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('188', '19', '4.00000000', '1', '竞标手续费', '2020-04-21 15:24:21', null, '55', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('189', '19', '1.60000000', '1', '竞价分润', '2020-04-21 15:24:23', null, '56', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('190', '18', '4.00000000', '1', '竞价分润', '2020-04-21 15:24:23', null, '56', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('191', '16', '1.60000000', '1', '竞价分润', '2020-04-21 15:24:23', null, '56', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('192', '1', '0.80000000', '1', '竞价分润', '2020-04-21 15:24:23', null, '56', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('193', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:24:23', null, '56', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('194', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:24:23', null, '56', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('195', '19', '58.00000000', '1', '中标费用', '2020-04-21 15:24:23', null, '56', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('196', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:23', null, '56', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('197', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:24:23', null, '56', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('198', '19', '8.00000000', '1', '竞标手续费', '2020-04-21 15:24:23', null, '56', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('199', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:08', null, '57', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('200', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:08', null, '57', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('201', '19', '0.20000000', '1', '竞价分润', '2020-04-21 15:34:22', null, '58', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('202', '18', '0.50000000', '1', '竞价分润', '2020-04-21 15:34:22', null, '58', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('203', '16', '0.20000000', '1', '竞价分润', '2020-04-21 15:34:22', null, '58', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('204', '1', '0.10000000', '1', '竞价分润', '2020-04-21 15:34:22', null, '58', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('205', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:34:22', null, '58', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('206', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:34:22', null, '58', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('207', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:22', null, '58', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('208', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:22', null, '58', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('209', '19', '1.00000000', '1', '竞标手续费', '2020-04-21 15:34:22', null, '58', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('210', '19', '0.40000000', '1', '竞价分润', '2020-04-21 15:34:23', null, '59', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('211', '18', '1.00000000', '1', '竞价分润', '2020-04-21 15:34:23', null, '59', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('212', '16', '0.40000000', '1', '竞价分润', '2020-04-21 15:34:23', null, '59', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('213', '1', '0.20000000', '1', '竞价分润', '2020-04-21 15:34:23', null, '59', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('214', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:34:23', null, '59', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('215', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:34:23', null, '59', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('216', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:23', null, '59', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('217', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:23', null, '59', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('218', '19', '2.00000000', '1', '竞标手续费', '2020-04-21 15:34:23', null, '59', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('219', '19', '0.80000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '60', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('220', '18', '2.00000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '60', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('221', '16', '0.80000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '60', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('222', '1', '0.40000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '60', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('223', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:34:24', null, '60', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('224', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:34:24', null, '60', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('225', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:24', null, '60', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('226', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:24', null, '60', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('227', '19', '4.00000000', '1', '竞标手续费', '2020-04-21 15:34:24', null, '60', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('228', '19', '1.60000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '61', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('229', '18', '4.00000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '61', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('230', '16', '1.60000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '61', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('231', '1', '0.80000000', '1', '竞价分润', '2020-04-21 15:34:24', null, '61', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('232', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 15:34:24', null, '61', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('233', '19', '50.00000000', '1', '解冻资金', '2020-04-21 15:34:24', null, '61', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('234', '19', '58.00000000', '1', '中标费用', '2020-04-21 15:34:24', null, '61', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('235', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:24', null, '61', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('236', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 15:34:24', null, '61', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('237', '19', '8.00000000', '1', '竞标手续费', '2020-04-21 15:34:24', null, '61', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('238', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:45:44', null, '62', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('239', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:45:44', null, '62', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('240', '19', '0.20000000', '1', '竞价分润', '2020-04-21 16:46:00', null, '63', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('241', '18', '0.50000000', '1', '竞价分润', '2020-04-21 16:46:00', null, '63', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('242', '16', '0.20000000', '1', '竞价分润', '2020-04-21 16:46:00', null, '63', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('243', '1', '0.10000000', '1', '竞价分润', '2020-04-21 16:46:00', null, '63', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('244', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 16:46:00', null, '63', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('245', '19', '50.00000000', '1', '解冻资金', '2020-04-21 16:46:00', null, '63', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('246', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:46:00', null, '63', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('247', '19', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:46:00', null, '63', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('248', '19', '1.00000000', '1', '竞标手续费', '2020-04-21 16:46:00', null, '63', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('249', '19', '0.40000000', '1', '竞价分润', '2020-04-21 16:49:25', null, '64', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('250', '18', '1.00000000', '1', '竞价分润', '2020-04-21 16:49:25', null, '64', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('251', '16', '0.40000000', '1', '竞价分润', '2020-04-21 16:49:25', null, '64', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('252', '1', '0.20000000', '1', '竞价分润', '2020-04-21 16:49:25', null, '64', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('253', '19', '50.00000000', '1', '竞价解冻资金', '2020-04-21 16:49:25', null, '64', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('254', '19', '50.00000000', '1', '解冻资金', '2020-04-21 16:49:25', null, '64', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('255', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:49:25', null, '64', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('256', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:49:25', null, '64', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('257', '20', '2.00000000', '1', '竞标手续费', '2020-04-21 16:49:25', null, '64', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('258', '20', '0.80000000', '1', '竞价分润', '2020-04-21 16:56:18', null, '65', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('259', '18', '2.00000000', '1', '竞价分润', '2020-04-21 16:56:18', null, '65', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('260', '16', '0.80000000', '1', '竞价分润', '2020-04-21 16:56:18', null, '65', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('261', '1', '0.40000000', '1', '竞价分润', '2020-04-21 16:56:18', null, '65', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('262', '20', '50.00000000', '1', '竞价解冻资金', '2020-04-21 16:56:18', null, '65', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('263', '20', '50.00000000', '1', '解冻资金', '2020-04-21 16:56:18', null, '65', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('264', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:56:18', null, '65', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('265', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-21 16:56:18', null, '65', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('266', '20', '4.00000000', '1', '竞标手续费', '2020-04-21 16:56:18', null, '65', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('274', '20', '1.60000000', '1', '竞价分润', '2020-04-21 17:03:03', null, '67', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('275', '18', '4.00000000', '1', '竞价分润', '2020-04-21 17:03:03', null, '67', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('276', '16', '1.60000000', '1', '竞价分润', '2020-04-21 17:03:03', null, '67', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('277', '1', '0.80000000', '1', '竞价分润', '2020-04-21 17:03:03', null, '67', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('278', '20', '50.00000000', '1', '竞价解冻资金', '2020-04-21 17:03:03', null, '67', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('279', '20', '50.00000000', '1', '解冻资金', '2020-04-21 17:03:03', null, '67', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('280', '20', '58.00000000', '1', '中标费用', '2020-04-21 17:03:03', null, '67', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('281', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-21 17:03:03', null, '67', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('282', '20', '50.00000000', '1', '竞标冻结资金', '2020-04-21 17:03:03', null, '67', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('283', '20', '8.00000000', '1', '竞标手续费', '2020-04-21 17:03:03', null, '67', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('284', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:17:15', null, '68', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('285', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:17:15', null, '68', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('286', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:44:56', null, '69', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('287', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:44:56', null, '69', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('288', '20', '1.00000000', '1', '竞标手续费', '2020-04-24 10:44:56', null, '69', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('289', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:49:43', null, '71', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('290', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:49:43', null, '71', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('291', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:52:30', null, '73', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('292', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:52:30', null, '73', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('293', '20', '0.20000000', '1', '竞价分润', '2020-04-24 10:52:31', null, '74', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('294', '18', '0.50000000', '1', '竞价分润', '2020-04-24 10:52:31', null, '74', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('295', '16', '0.20000000', '1', '竞价分润', '2020-04-24 10:52:31', null, '74', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('296', '1', '0.10000000', '1', '竞价分润', '2020-04-24 10:52:31', null, '74', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('297', '20', '15.12400000', '1', '竞价解冻资金', '2020-04-24 10:52:31', null, '74', '2', '1');
INSERT INTO `uzf_wallet` VALUES ('298', '20', '15.12400000', '1', '解冻资金', '2020-04-24 10:52:31', null, '74', '1', '2');
INSERT INTO `uzf_wallet` VALUES ('299', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:52:31', null, '74', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('300', '20', '15.12400000', '1', '竞标冻结资金', '2020-04-24 10:52:31', null, '74', '2', '2');
INSERT INTO `uzf_wallet` VALUES ('301', '20', '1.00000000', '1', '竞标手续费', '2020-04-24 10:52:31', null, '74', '1', '1');
INSERT INTO `uzf_wallet` VALUES ('302', '20', '15.12400000', '1', '中标费用', '2020-04-24 14:55:51', null, '74', '1', '2');

-- ----------------------------
-- Function structure for `find`
-- ----------------------------
DROP FUNCTION IF EXISTS `find`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `find`(`id` int) RETURNS varchar(255) CHARSET utf8 COLLATE utf8_unicode_ci
BEGIN
	#Routine body goes here...
		declare var VARCHAR(255); 
		
  
		SET var = (SELECT `uzf_user`.us_nickname FROM `uzf_user` WHERE `uzf_user`.id = id);
		RETURN var;
		

END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `resetimes`
-- ----------------------------
DROP EVENT IF EXISTS `resetimes`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `resetimes` ON SCHEDULE EVERY 1 DAY STARTS '2020-04-23 15:16:00' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE uzf_user SET free_times = 3
;;
DELIMITER ;
