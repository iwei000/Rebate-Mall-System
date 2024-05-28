/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : shop.test

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 08/12/2020 09:47:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lc_address
-- ----------------------------
DROP TABLE IF EXISTS `lc_address`;
CREATE TABLE `lc_address`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `area_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `postal_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_address
-- ----------------------------
INSERT INTO `lc_address` VALUES (11, '李可乐', '13800138001', '河北省', '石家庄市', '桥西区', '中关村大厦11520号', '130104', '', 34471);

-- ----------------------------
-- Table structure for lc_alipay_set
-- ----------------------------
DROP TABLE IF EXISTS `lc_alipay_set`;
CREATE TABLE `lc_alipay_set`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `success` int(11) NULL DEFAULT 0,
  `fail` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_article
-- ----------------------------
DROP TABLE IF EXISTS `lc_article`;
CREATE TABLE `lc_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '标题',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '文章类型',
  `keyword` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '关键词',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间',
  `show` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示，0不显示/1显示',
  `sort` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_article
-- ----------------------------
INSERT INTO `lc_article` VALUES (4, ' 公司简介', 9, '', '<p>&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介&nbsp;公司简介</p>\r\n', '2020-05-17 01:04:27', 1, 2);
INSERT INTO `lc_article` VALUES (3, ' 邀请好友活动', 9, '', '<p><img alt=\"\" src=\"/upload/18a668c35b868817/103464686a6daf17.jpg\" style=\"max-width:100%;border:0\" /></p>\r\n', '2020-05-17 01:03:35', 1, 1);
INSERT INTO `lc_article` VALUES (5, ' 转账充值教程 ', 9, '', '<p><img alt=\"\" src=\"/upload/be324044ea78035b/6cc6566e56fa2fd6.jpg\" style=\"max-width:100%;border:0\" /></p>\r\n', '2020-05-17 01:05:21', 1, 3);
INSERT INTO `lc_article` VALUES (6, ' 常见问题', 9, '', '<p>&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题&nbsp;常见问题</p>\r\n', '2020-05-17 01:06:02', 1, 4);
INSERT INTO `lc_article` VALUES (7, ' 会员等级 ', 9, '', '<p>&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;&nbsp;会员等级&nbsp;</p>\r\n', '2020-05-17 01:06:45', 1, 5);
INSERT INTO `lc_article` VALUES (8, ' 风险控制', 9, '', '<p>&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制&nbsp;风险控制</p>\r\n', '2020-05-17 01:07:06', 1, 6);
INSERT INTO `lc_article` VALUES (9, ' 银行存管 ', 9, '', '<p>银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管 银行存管</p>\r\n', '2020-05-17 01:07:21', 1, 7);
INSERT INTO `lc_article` VALUES (10, ' 营业执照', 9, '', '<p>&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照&nbsp;营业执照</p>\r\n', '2020-05-17 01:07:41', 1, 8);
INSERT INTO `lc_article` VALUES (11, ' 联系我们 ', 9, '', '<p>联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们 联系我们</p>\r\n', '2020-05-17 01:08:07', 1, 9);
INSERT INTO `lc_article` VALUES (12, ' 用户协议 ', 10, '', '<h4 data-v-7d118975=\"\">用户行为规范</h4>\r\n\r\n<p data-v-7d118975=\"\">1、用户在本网站注册时，不得使用虚假身份信息。用户应当妥善保存其账户信息和密码，由于用户泄密所导致的损失需由用户自行承担。如用户发现他人冒用或盗用其账户或密码，或其账户存在其他未经合法授权使用之情形，应立即以有效方式通知本公司。用户理解并同意本公司有权根据用户的通知、请求或依据判断，采取相应的行动或措施，包括但不限于冻结账户、限制账户功能等，本公司对采取上述行动所导致的损失不承担除法律有明确规定外的责任。</p>\r\n\r\n<p data-v-7d118975=\"\">2、用户在使用本服务时须遵守法律法规，不得利用本服务从事违法违规行为，包括但不限于：</p>\r\n\r\n<p data-v-7d118975=\"\">（1）发布、传送、传播、储存危害国家安全统一、破坏社会稳定、违反公序良俗、侮辱、诽谤、淫秽、暴力以及任何违反国家法律法规的内容；</p>\r\n\r\n<p data-v-7d118975=\"\">（2）发布、传送、传播、储存侵害他人知识产权、商业秘密等合法权利的内容；</p>\r\n\r\n<p data-v-7d118975=\"\">（3）恶意虚构事实、隐瞒真相以误导、欺骗他人；</p>\r\n\r\n<p data-v-7d118975=\"\">（4）发布、传送、传播广告信息及垃圾信息；</p>\r\n\r\n<p data-v-7d118975=\"\">（5）其他法律法规禁止的行为。</p>\r\n\r\n<p data-v-7d118975=\"\">3、用户不得利用本服务进行任何有损本公司及其关联企业之权利、利益及商誉，或其他用户合法权利之行为。</p>\r\n\r\n<p data-v-7d118975=\"\">4、用户不得基于本服务从事制作、使用、传播&ldquo;私服&rdquo;、&ldquo;外挂&rdquo;等侵害本公司合法权益的行为。如有违反，本公司将依据中国现行法律法规及本公司的相关规定予以处理。</p>\r\n\r\n<p data-v-7d118975=\"\">5、虚拟财产转移服务外，用户不得通过任何方式直接或变相进行账号资产的转移。</p>\r\n\r\n<p data-v-7d118975=\"\">6、用户不得从事作弊等损害公平性的行为。用户承诺接受本公司对其游戏数据进行分析，当本公司发现其数据异常时，本公司可根据自己的独立判断认定其为作弊。</p>\r\n\r\n<p data-v-7d118975=\"\">7、用户不得从事任何利用本公司平台系统漏洞进行有损其他用户、本公司或互联网安全的行为。</p>\r\n\r\n<p data-v-7d118975=\"\">8、用户知悉并确认，本公司通过公告、邮件、短信、账户通知以及用户在账户中登记的即时通讯工具等方式，向用户发出关于本服务的通知、规则、提示等信息，均为有效通知。该等信息一经公布或发布，即视为已送达至用户。</p>\r\n\r\n<h4 data-v-7d118975=\"\">广告信息和促销</h4>\r\n\r\n<p data-v-7d118975=\"\">1、用户同意接受本公司通过公告、邮件、短信、账户通知以及用户在账户中登记的即时通讯工具等方式发送的有关本服务，或本公司、本公司之关联企业或与本公司有合作关系的第三方相关的商品、服务促销或其他商业信息。</p>\r\n\r\n<p data-v-7d118975=\"\">2、本公司在本服务中可能提供与其他互联网之网站站点或资源的链接，本公司对存在或源于此类网站站点或资源的任何内容、广告、产品或其他资料不予保证或负责；如该链接所载的内容或搜索引擎所提供之链接的内容侵犯用户权利，本公司声明与上述内容无关，且不承担除法律有明确规定外的责任。</p>\r\n', '2020-09-05 21:20:22', 1, 0);
INSERT INTO `lc_article` VALUES (13, ' 隐私政策', 10, '', '<p data-v-046c6830=\"\">本应用尊重并保护所有使用服务用户的个人隐私权。为了给您提供更准确、更有个性化的服务，本应用会按照本隐私权政策的规定使用和披露您的个人信息。但本应用将以高度的勤勉、审慎义务对待这些信息。除本隐私权政策另有规定外，在未征得您事先许可的情况下，本应用不会将这些信息对外披露或向第三方提供。本应用会不时更新本隐私权政策。</p>\r\n\r\n<h4 data-v-046c6830=\"\">您在同意本应用服务使用协议之时，即视为您已经同意本隐私权政策全部内容。本隐私权政策属于本应用服务使用协议不可分割的一部分。</h4>\r\n\r\n<p data-v-046c6830=\"\">1. 适用范围</p>\r\n\r\n<p data-v-046c6830=\"\">(a) 在您注册本应用帐号时，您根据本应用要求提供的个人注册信息；</p>\r\n\r\n<p data-v-046c6830=\"\">(b) 在您使用本应用网络服务，或访问本应用平台网页时，本应用自动接收并记录的您的浏览器和计算机上的信息，包括但不限于您的IP地址、浏览器的类型、使用的语言、访问日期和时间、软硬件特征信息及您需求的网页记录等数据；</p>\r\n\r\n<p data-v-046c6830=\"\">(c) 本应用通过合法途径从商业伙伴处取得的用户个人数据。</p>\r\n\r\n<p data-v-046c6830=\"\">您了解并同意，以下信息不适用本隐私权政策：</p>\r\n\r\n<p data-v-046c6830=\"\">(a) 您在使用本应用平台提供的搜索服务时输入的关键字信息；</p>\r\n\r\n<p data-v-046c6830=\"\">(b) 本应用收集到的您在本应用发布的有关信息数据，包括但不限于参与活动、成交信息及评价详情；</p>\r\n\r\n<p data-v-046c6830=\"\">(c) 违反法律规定或违反本应用规则行为及本应用已对您采取的措施。</p>\r\n\r\n<p data-v-046c6830=\"\">2. 信息使用</p>\r\n\r\n<p data-v-046c6830=\"\">(a)本应用不会向任何无关第三方提供、出售、出租、分享或交易您的个人信息，除非事先得到您的许可，或该第三方和本应用（含本应用关联公司）单独或共同为您提供服务，且在该服务结束后，其将被禁止访问包括其以前能够访问的所有这些资料。</p>\r\n\r\n<p data-v-046c6830=\"\">(b) 本应用亦不允许任何第三方以任何手段收集、编辑、出售或者无偿传播您的个人信息。任何本应用平台用户如从事上述活动，一经发现，本应用有权立即终止与该用户的服务协议。</p>\r\n\r\n<p data-v-046c6830=\"\">(c) 为服务用户的目的，本应用可能通过使用您的个人信息，向您提供您感兴趣的信息，包括但不限于向您发出产品和服务信息，或者与本应用合作伙伴共享信息以便他们向您发送有关其产品和服务的信息（后者需要您的事先同意）。</p>\r\n\r\n<p data-v-046c6830=\"\">3. 信息披露</p>\r\n\r\n<h4 data-v-046c6830=\"\">在如下情况下，本应用将依据您的个人意愿或法律的规定全部或部分的披露您的个人信息：</h4>\r\n\r\n<p data-v-046c6830=\"\">(a) 经您事先同意，向第三方披露；</p>\r\n\r\n<p data-v-046c6830=\"\">(b)为提供您所要求的产品和服务，而必须和第三方分享您的个人信息；</p>\r\n\r\n<p data-v-046c6830=\"\">(c) 根据法律的有关规定，或者行政或司法机构的要求，向第三方或者行政、司法机构披露；</p>\r\n\r\n<p data-v-046c6830=\"\">(d) 如您出现违反中国有关法律、法规或者本应用服务协议或相关规则的情况，需要向第三方披露；</p>\r\n\r\n<p data-v-046c6830=\"\">(e) 如您是适格的知识产权投诉人并已提起投诉，应被投诉人要求，向被投诉人披露，以便双方处理可能的权利纠纷；</p>\r\n\r\n<p data-v-046c6830=\"\">(f) 在本应用平台上创建的某一交易中，如交易任何一方履行或部分履行了交易义务并提出信息披露请求的，本应用有权决定向该用户提供其交易对方的联络方式等必要信息，以促成交易的完成或纠纷的解决。</p>\r\n\r\n<p data-v-046c6830=\"\">(g) 其它本应用根据法律、法规或者网站政策认为合适的披露。</p>\r\n\r\n<p data-v-046c6830=\"\">4. 信息存储和交换</p>\r\n\r\n<h4 data-v-046c6830=\"\">本应用收集的有关您的信息和资料将保存在本应用及（或）其关联公司的服务器上，这些信息和资料可能传送至您所在国家、地区或本应用收集信息和资料所在地的境外并在境外被访问、存储和展示。</h4>\r\n\r\n<p data-v-046c6830=\"\">5. Cookie的使用</p>\r\n\r\n<p data-v-046c6830=\"\">(a) 在您未拒绝接受cookies的情况下，本应用会在您的计算机上设定或取用cookies ，以便您能登录或使用依赖于cookies的本应用平台服务或功能。本应用使用cookies可为您提供更加周到的个性化服务，包括推广服务。</p>\r\n\r\n<p data-v-046c6830=\"\">(b) 您有权选择接受或拒绝接受cookies。您可以通过修改浏览器设置的方式拒绝接受cookies。但如果您选择拒绝接受cookies，则您可能无法登录或使用依赖于cookies的本应用网络服务或功能。</p>\r\n\r\n<p data-v-046c6830=\"\">(c) 通过本应用所设cookies所取得的有关信息，将适用本政策。</p>\r\n\r\n<p data-v-046c6830=\"\">6. 信息安全</p>\r\n\r\n<p data-v-046c6830=\"\">(a) 本应用帐号均有安全保护功能，请妥善保管您的用户名及密码信息。本应用将通过对用户密码进行加密等安全措施确保您的信息不丢失，不被滥用和变造。尽管有前述安全措施，但同时也请您注意在信息网络上不存在&ldquo;完善的安全措施&rdquo;。</p>\r\n\r\n<p data-v-046c6830=\"\">(b) 在使用本应用网络服务进行网上交易时，您不可避免的要向交易对方或潜在的交易对</p>\r\n\r\n<p data-v-046c6830=\"\">7.本隐私政策的更改</p>\r\n\r\n<p data-v-046c6830=\"\">(a)如果决定更改隐私政策，我们会在本政策中、本公司app站中以及我们认为适当的位置发布这些更改，以便您了解我们如何收集、使用您的个人信息，哪些人可以访问这些信息，以及在什么情况下我们会透露这些信息。</p>\r\n\r\n<p data-v-046c6830=\"\">(b)本公司保留随时修改本政策的权利，因此请经常查看。如对本政策作出重大更改，本公司会通过APP通知的形式告知。</p>\r\n', '2020-09-05 21:19:55', 1, 0);
INSERT INTO `lc_article` VALUES (14, '重劵出击福利', 9, '', '<p><img alt=\"\" src=\"/upload/1a82be90b7825075/2ca199840715397d.jpg\" style=\"max-width:100%;border:0\" /></p>\r\n', '2020-09-03 14:43:41', 1, 0);

-- ----------------------------
-- Table structure for lc_article_type
-- ----------------------------
DROP TABLE IF EXISTS `lc_article_type`;
CREATE TABLE `lc_article_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `show` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示，0不显示/1显示',
  `ico` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'help' COMMENT '类型图标',
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_article_type
-- ----------------------------
INSERT INTO `lc_article_type` VALUES (10, '帮助中心', 0, 0, 'help', '2020-05-17 17:58:57');
INSERT INTO `lc_article_type` VALUES (9, '关于我们', 0, 0, 'help', '2020-05-17 01:02:40');

-- ----------------------------
-- Table structure for lc_bank
-- ----------------------------
DROP TABLE IF EXISTS `lc_bank`;
CREATE TABLE `lc_bank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `bank` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '所属银行',
  `area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无支行名称' COMMENT '支行名称',
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '银行卡号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '姓名预留',
  `mobile` int(11) NOT NULL DEFAULT 0 COMMENT '手机号 预留',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_baoku_log
-- ----------------------------
DROP TABLE IF EXISTS `lc_baoku_log`;
CREATE TABLE `lc_baoku_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `time` int(11) NULL DEFAULT NULL,
  `interest` decimal(10, 2) NULL DEFAULT 0.00,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lc_cash
-- ----------------------------
DROP TABLE IF EXISTS `lc_cash`;
CREATE TABLE `lc_cash`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '提现姓名',
  `bid` int(11) NOT NULL DEFAULT 0 COMMENT '银行卡编号',
  `bank` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '所属银行',
  `area` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无支行名称' COMMENT '支行名称',
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '银行卡号',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '提现金额',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态，0未提现/1已提现/2提现失败',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提交时间',
  `time2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '处理时间',
  `warn` int(11) NOT NULL DEFAULT 0 COMMENT '充值提醒',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_coupon
-- ----------------------------
DROP TABLE IF EXISTS `lc_coupon`;
CREATE TABLE `lc_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `xid` int(11) NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1未使用  2已使用',
  `startAt` int(11) NULL DEFAULT NULL COMMENT '领取时间',
  `endAt` int(11) NULL DEFAULT NULL COMMENT '卡失效日期 (时间戳, 单位秒)',
  `valueDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '优惠券金额',
  `value` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣券优惠金额，单位分',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资项目标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '优惠券' COMMENT '优惠券名称',
  `unitDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '元' COMMENT '单位',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '代金券只能用于投资，不能提现' COMMENT '描述信息，优惠券可用时展示',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券码',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '通用券' COMMENT '优惠券类型：1通用券;2指定项目券;3满减券',
  `full` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '满足金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_finance
-- ----------------------------
DROP TABLE IF EXISTS `lc_finance`;
CREATE TABLE `lc_finance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '类型,1收入/2支出',
  `reason` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '摘要',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '加入前余额',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_info
-- ----------------------------
DROP TABLE IF EXISTS `lc_info`;
CREATE TABLE `lc_info`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `webname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '默认网站' COMMENT '网站名称',
  `gz_bankbz` int(11) NOT NULL DEFAULT 0,
  `gz_bankz` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `gz_bank` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '银行入款支付描述',
  `gz_bank_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行',
  `gz_bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行开户名',
  `gz_bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行账号',
  `gz_bank_status` int(11) NOT NULL DEFAULT 0 COMMENT '收款银行是否显示，0不显示/1显示',
  `domain` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'APP域名',
  `company` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '公司名称' COMMENT '公司名称',
  `tel` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '400-000-0000' COMMENT '客服电话',
  `address` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '公司地址' COMMENT '公司地址',
  `notice` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '网站公告' COMMENT '网站公告',
  `notice2` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告2',
  `service` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://www.yourdomain.com' COMMENT '客服地址',
  `app` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'http://www.yourdomain.com' COMMENT 'app下载链接',
  `appff` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'app防封下载链接',
  `icp` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '京ICP备12345678号' COMMENT '备案号',
  `wechat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '微信客服' COMMENT '微信客服',
  `qq` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '10000' COMMENT 'QQ客服',
  `cash` int(11) NOT NULL DEFAULT 0 COMMENT '最低提现金额',
  `alipay_bankbz` int(11) NOT NULL DEFAULT 0,
  `alipay_bank` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '银行入款支付描述',
  `alipay_bank_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行',
  `alipay_bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行开户名',
  `alipay_bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行账号',
  `alipay_bank_status` int(11) NOT NULL DEFAULT 0 COMMENT '收款银行是否显示，0不显示/1显示',
  `alipay_bank_give` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `ranking` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '排行榜',
  `contract` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '合同模板',
  `pay_bank` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '银行入款支付描述',
  `pay_bank_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行',
  `pay_bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行开户名',
  `pay_bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行账号',
  `pay_bank_status` int(11) NOT NULL DEFAULT 0 COMMENT '收款银行是否显示，0不显示/1显示',
  `pay_bank_give` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT '赠送比例',
  `qr_wechat` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '微信扫码支付描述',
  `qr_wechattzlj` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qr_wechat_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '微信二维码地址',
  `qr_wechat_status` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示微信扫码,0隐藏/1显示',
  `qr_wechat_statustz` int(11) NOT NULL,
  `qr_alipay` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '支付宝扫码支付描述',
  `qr_alipaytzlj` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qr_alipay_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '支付宝二维码地址',
  `qr_alipay_status` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示支付宝扫码,0隐藏/1显示',
  `qr_alipay_statustz` int(11) NOT NULL,
  `online_wechat` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示微信在线支付,0隐藏/1显示',
  `activity_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#' COMMENT '活动链接',
  `activity_status` int(11) NOT NULL DEFAULT 0 COMMENT '活动是否开启,0关闭,1开启',
  `activity_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `activity1_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `activity1_status` int(11) NOT NULL DEFAULT 0 COMMENT '活动是否开启,0关闭,1开启',
  `activity1_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#' COMMENT '活动链接',
  `jiesuan` int(11) NOT NULL DEFAULT 1 COMMENT '是否开启结算,0关闭/1开启',
  `web` int(11) NOT NULL DEFAULT 1 COMMENT '是否开启电脑版,0关闭/1开启',
  `sms` int(11) NOT NULL DEFAULT 1 COMMENT '短信开关,0关/1开',
  `reg` int(11) NOT NULL DEFAULT 1 COMMENT '注册开关',
  `cert` int(11) NOT NULL DEFAULT 0 COMMENT '实名认证接口开关，0关/1开',
  `linetoken` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实名认证token',
  `bank` int(11) NOT NULL DEFAULT 0 COMMENT '银行卡认证开关，0关/1开',
  `banktoken` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡认证token',
  `template` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'one' COMMENT '手机模板',
  `video` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '视频地址',
  `smsname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '短信签名',
  `smskeytz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `smskey` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '短信密钥',
  `token` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '程序授权码',
  `jifendh` int(11) NOT NULL DEFAULT 0 COMMENT '积分兑换开关，0关/1开',
  `huiyuanshu` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '会员显示数量',
  `pay_bankbz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '会员显示数量',
  `prize` tinyint(3) NOT NULL DEFAULT 0 COMMENT '抽奖开关，0关/1开',
  `itemclass` tinyint(3) NOT NULL DEFAULT 0 COMMENT '项目分类开关，0关/1开',
  `safesc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '安全认证代码',
  `authentication` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实名秘钥',
  `bankkey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '银行卡秘钥',
  `qdlcopen` int(1) NULL DEFAULT 0 COMMENT '签到理财开关',
  `qdnum` int(1) NULL DEFAULT 0 COMMENT '签到显示次数',
  `qdnotice` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签到满公告',
  `wx_bankbz` int(11) NOT NULL DEFAULT 0,
  `wx_bank` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '银行入款支付描述',
  `wx_bank_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行',
  `wx_bank_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行开户名',
  `wx_bank_account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '收款银行账号',
  `wx_bank_status` int(11) NOT NULL DEFAULT 0 COMMENT '收款银行是否显示，0不显示/1显示',
  `wx_bank_give` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `seal_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司章',
  `safe_seal_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保险章',
  `logo_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站LOGO',
  `app_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'APP图标',
  `login_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录图标',
  `fuli4` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `min_recharge` int(11) NULL DEFAULT 0 COMMENT '最低充值',
  `ban_ip` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fuli3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `fuli2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录背景图',
  `yuebao_rate` decimal(10, 2) NOT NULL DEFAULT 0.00,
  `fuli1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_coupon` tinyint(1) NOT NULL DEFAULT 0,
  `pc_open` tinyint(1) NOT NULL DEFAULT 0,
  `alipay_appid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `alipay_private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `alipay_public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `alipay_app_status` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_info
-- ----------------------------
INSERT INTO `lc_info` VALUES (1, '源码学习-程序仅供学习研究，请勿用于其他用途', 100, 2.00, '公账入款立返1%，平台会不定期更换收款账号，转账前请刷新或联系在线客服获取最新收款账号！', '公账入款', '公账入款2', '公账入款3', 0, 'http://jin.12306.best/', '源码学习管理有限公司', '0', '深圳市前海深港合作区前湾一路1号A栋201室', '尊敬访客：您好，该程序仅用于源码学习交流研究，请勿用于其他用途！', '尊敬访客：您好，该程序仅用于源码学习交流研究，请勿用于其他用途！', 'http://baidu.com', 'http://baidu.com', '仅供学习研究 切勿他用', '粤B2-20190944', '', '123456', 120, 10000000, '银行入款立返1.5%，平台会不定期更换收款账号，转账前请刷新或联系在线客服获取最新收款账号！', '香港汇丰银行', '张学友', '620062006200000', 1, '1.5', '', '<p>二、理财期未满，甲方不得擅自终止本协议，否则，乙方将取消为甲方的理财服务，甲方不享受任何理财收益，甲方投资时必须看清楚投资项目的一切事宜，按照公司要求进行投资，如有违反规定，甲方并承担由此所引起的一切损失。</p>\r\n\r\n<p>三、理财方式以网络投资平台的形式进行合作。理财金由甲方帐户划转到乙方的综合理财帐户上进行具体的理财操作，由于甲方全权委托乙方理财，因此在股权，房地产土地，矿权，新能源，石油，等其它实业的投资风险由乙方承担，乙方首先要考虑资金的安全性，然后才考虑资金的收益。甲方不得以任何形式干预乙方的理财操作。收益是每天发放到甲方账户，待理财投资周期到日止，乙方应将甲方之理财本金划入其在乙方开立的存款帐户上。</p>\r\n\r\n<p>四、乙方对甲方投资资金负有控制风险的责任，必须勤勉尽责。如果投资有亏损情况，则无论亏损大小由乙方承担全部损失，按合同承诺付款给甲方。如果乙方出现违约将由担保方丙方履行承诺付款给甲方。</p>\r\n\r\n<p>五、保密义务 甲乙双方对其通过接触和通过其他渠道得知的有关各方的商业机密等严格保密，对所有资料严格保密，不得向任何其他人员及机构透露。个人的信息。</p>\r\n\r\n<p>六、合同生效</p>\r\n\r\n<p>1、本协议经投资人通过投资平台点击确认投资后自动生成并签订，本协议自生成时生效。</p>\r\n\r\n<p>2、本协议履行期间，各方如发生争议或者纠纷，应友好协商解决；如协商不成，任何一方有权向乙方所在地人民法院起诉。</p>\r\n\r\n<p>3、本协议采用电子文本形式制成，各方均认可该形式的法律效力。</p>\r\n\r\n<p>七、理财协议一式三份，乙方一份，甲方一份，丙方一份，具有同等法律效力。</p>\r\n', '银行入款立返2.2%，平台会不定期更换收款账号，转账前请刷新或联系在线客服获取最新收款账号！', '香港汇丰银行', '张学友', '620062006200000', 1, 2.20, '微信充值，长按二维码保存或截图二维码，打开微信首页-点击右上角加号，打开扫一扫，选择刚保存的二维码，充值即可。温馨提示：请您在充值的时候尽量不要充值整数，比如您要充值100元，您可以选择充值100.01元或者99.99元，尽量在小数点选择比较特殊的金额，让系统更快识别您的订单，以免耽误您的投资，详细充值步骤可以看平台公告。宸宇平台祝您投资愉快！', '', '无', 1, 0, '支付宝充值，长按二维码保存或截图二维码，打开支付宝首页-点击“扫一扫”，点击右上角相册，选择刚保存的二维码，充值即可。温馨提示：请您在充值的时候尽量不要充值整数，比如您要充值100元，您可以选择充值100.01元或者99.99元，尽量在小数点选择比较特殊的金额，让系统更快识别您的订单，以免耽误您的投资，详细充值步骤可以看平台公告。宸宇平台祝您投资愉快！', '', '/upload/8755185e597296f1/77e8451f32a2c2ba.png', 0, 0, 0, '/', 1, '/upload/f4f54aa2015db2fc/d03052dbcbdaddf0.png', '/upload/e3e1f4a99a7b80fd/90345cdcd44356c3.jpg', 1, 'about/14', 1, 0, 0, 1, 0, '', 0, '', 'one', '无', '', '', '', '', 1, '30', '1', 1, 0, '', '', '', 1, 0, '', 1, '银行入款立返1.5%，平台会不定期更换收款账号，转账前请刷新或联系在线客服获取最新收款账号！', '香港汇丰银行', '张学友', '620062006200000', 0, '1.5', '/upload/aad3cbe9d7909442/cbc00716a7621571.png', '/upload/3b1a9d2135772a45/57b21be53c9c3839.png', '/upload/38b242fb9ebec0f9/d7b2102168ce416b.jpg', '/upload/cc9f39534d305575/f5760c7b59748e6d.png', '/upload/2a102cfb894f4d0c/b4add6da2ce74eb4.png', 'details/89', 50, '110.188.57.236,110.188.57.83', 'details/97', 'details/125', 0.00, 'details/129', 1, 0, '', '', '', '0');

-- ----------------------------
-- Table structure for lc_invest
-- ----------------------------
DROP TABLE IF EXISTS `lc_invest`;
CREATE TABLE `lc_invest`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '项目ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '项目标题',
  `number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '合同编号',
  `money` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '投资金额',
  `day` int(11) NOT NULL DEFAULT 0 COMMENT '项目天数',
  `rate` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '项目费率',
  `type1` int(11) NOT NULL DEFAULT 0 COMMENT '项目类型1',
  `type2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '项目类型2',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '还款状态',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '投资时间',
  `time2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '到期时间',
  `discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣金额',
  `coupon` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠券金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_invest_list
-- ----------------------------
DROP TABLE IF EXISTS `lc_invest_list`;
CREATE TABLE `lc_invest_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `iid` int(11) NOT NULL DEFAULT 0 COMMENT '投资记录ID',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '投资期数',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '项目标题',
  `money1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '待还利息',
  `money2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '待还本金',
  `time1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计还款时间',
  `time2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '实际还款时间',
  `pay1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '预计还款金额',
  `pay2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实际还款金额',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '项目记录,0未还款/1还款',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_item
-- ----------------------------
DROP TABLE IF EXISTS `lc_item`;
CREATE TABLE `lc_item`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '标题',
  `desc` varchar(144) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '项目描述',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'no_img.jpg' COMMENT '图片链接',
  `total` decimal(10, 2) NOT NULL DEFAULT 10000000.00 COMMENT '总金额',
  `rate` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '费率',
  `percent` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '模拟进度',
  `day` int(11) NOT NULL DEFAULT 0 COMMENT '期限',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '返款类型',
  `min` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '最小投资金额',
  `max` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '最大投资金额',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '最大投资次数',
  `guarantee` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '担保公司' COMMENT '担保公司',
  `limit` int(11) NOT NULL DEFAULT 0 COMMENT '最大购买分数',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `red` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '投资送红包',
  `prize` int(11) NOT NULL DEFAULT 0 COMMENT '是否开启抽奖',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '是否开启积分',
  `fixedtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '固定结算时间',
  `fixedcontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结算说明',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '开始时间',
  `sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序',
  `jfbl` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '积分比例',
  `value` int(10) NOT NULL COMMENT '积分比例',
  `invest1` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest2` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest3` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest4` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest5` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest6` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest7` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `invest8` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '分润比例',
  `class` int(11) NOT NULL DEFAULT 0 COMMENT '项目分类',
  `red1` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '邀请人一级红包',
  `red2` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '邀请人2级红包',
  `red3` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '邀请人3级红包',
  `red4` decimal(6, 2) NULL DEFAULT 0.00 COMMENT '邀请人4级红包',
  `auto` int(3) NOT NULL DEFAULT 0 COMMENT '自动拉满天数',
  `offvoucher` int(255) NULL DEFAULT 0 COMMENT '抵用券开关 1开  0关',
  `usevoucher` int(255) NULL DEFAULT 0 COMMENT '抵用券使用数量',
  `discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '折扣',
  `sales_base` int(11) NULL DEFAULT NULL COMMENT '销量',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0下架;上架',
  `is_special` tinyint(1) NULL DEFAULT 0 COMMENT '是否会员专属折扣',
  `stock` int(11) NULL DEFAULT 99999 COMMENT '库存',
  `index_type` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 139 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_item
-- ----------------------------
INSERT INTO `lc_item` VALUES (4, '【每日一单】维达(Vinda) 湿巾纸巾 杀菌洁肤卫生湿巾 80片 细菌杀灭率达99.9%', '【每日一单】维达(Vinda) 湿巾纸巾 杀菌洁肤卫生湿巾 80片 细菌杀灭率达99.9%', '/upload/674bf5b1cc45ac55/fa448a787e83d7f5.png', 10000000.00, 5.60, 0.00, 1, 1, 17.50, 1000000.00, 1, '香港汇民国际担保有限公司', 0, '', 99999.00, 0, 1, '', '', '2020-08-13 14:38:54', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.90, 33964, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (5, '【新手专享】绿联 MFi认证 苹果数据线', '【新手专享】绿联 MFi认证 苹果数据线', '/upload/7d0a0ce74d88620b/b7b8f4dec6427489.png', 10000000.00, 3.30, 0.00, 1, 1, 28.40, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 14:44:21', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 68, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 54688, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (6, '【新手专享】港荣蒸蛋糕 奶香味900g/箱 饼干蛋糕 营养早餐食品', '【新手专享】港荣蒸蛋糕 奶香味900g/箱 饼干蛋糕 营养早餐食品', '/upload/b3a54a0962b80c2d/2e76b1cfb0645cac.png', 10000000.00, 6.00, 0.00, 1, 1, 49.98, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 14:46:32', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 78, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 24492, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (7, '【下单自动领劵269元】GUCCI 古奇 女士皮质板扣式腰带皮带', '【下单自动领劵269元】GUCCI 古奇 女士皮质板扣式腰带皮带', '/upload/18cb89d3d9ad271b/cce9632dc7910fd0.jpg', 10000000.00, 0.45, 0.00, 10, 1, 2699.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 14:48:04', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 13, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 269.00, 42722, 1, 0, 99997, 2);
INSERT INTO `lc_item` VALUES (8, '【下单自动领劵599元】STTMU轻奢品牌 男士鳄鱼皮个性皮带平滑扣新款时尚腰带商务裤带', '【下单自动领劵599元】STTMU轻奢品牌 男士鳄鱼皮个性皮带平滑扣新款时尚腰带商务裤带', '/upload/d2c336258b808b79/be5906227c07bd22.jpg', 10000000.00, 0.65, 0.00, 15, 1, 5998.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 14:54:09', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 13, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 299.00, 14690, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (9, '【下单自动领劵203元】BALLY/巴利 20春夏黑色拼棕色光面牛皮字母金属徽标男士腰带皮带', '【下单自动领劵203元】BALLY/巴利 20春夏黑色拼棕色光面牛皮字母金属徽标男士腰带皮带', '/upload/62a2957a635d018a/72fa0a8f264716da.jpg', 10000000.00, 0.42, 0.00, 10, 1, 2030.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 14:57:01', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 13, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 203.00, 6694, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (10, '【下单自动领劵649元】皮带男士真皮自动扣头层牛皮腰带男裤带韩版潮时尚西裤带商务皮带', '【下单自动领劵649元】皮带男士真皮自动扣头层牛皮腰带男裤带韩版潮时尚西裤带商务皮带', '/upload/087b9d9c81bb95b6/ebb83e49c0653e3a.jpg', 10000000.00, 0.64, 0.00, 15, 1, 6494.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 14:57:34', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 13, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 649.00, 6390, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (11, '【下单自动领劵726元】男士手包2020新款手拿包真皮商务头层牛皮潮休闲男包单肩包手抓包', '【下单自动领劵726元】男士手包2020新款手拿包真皮商务头层牛皮潮休闲男包单肩包手抓包', '/upload/e494b8e464e5f649/01ede4ab3da8a9b1.jpg', 10000000.00, 0.71, 0.00, 15, 1, 7268.88, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:00:10', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 14, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 726.00, 829, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (12, '【下单自动领劵490元】欧美复古休闲真皮胸包男包牛皮斜挎包单肩包男士包包2020新款潮小', '【下单自动领劵490元】欧美复古休闲真皮胸包男包牛皮斜挎包单肩包男士包包2020新款潮小', '/upload/83618a0b6dcc9cca/9052451f1a1b31fb.jpg', 10000000.00, 0.52, 0.00, 15, 1, 4909.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:01:04', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 14, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 490.00, 3419, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (13, '【下单自动领劵468元】2019新款手工鱼皮包男士手提包商务公文包时尚全皮真皮单肩横款', '【下单自动领劵468元】2019新款手工鱼皮包男士手提包商务公文包时尚全皮真皮单肩横款', '/upload/c678ef3dffb37aa2/2de85dccc628c649.jpg', 10000000.00, 0.58, 0.00, 13, 1, 4680.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:03:06', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 14, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 468.00, 12622, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (14, '【下单自动领券938元】古驰 GUCCI 男款咖啡色印花单肩包 406374 KHN7X 9772', '【下单自动领券938元】古驰 GUCCI 男款咖啡色印花单肩包 406374 KHN7X 9772', '/upload/b6f091caca9c02f3/c065b07b5aef3a12.png', 10000000.00, 0.71, 0.00, 20, 1, 9380.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:03:59', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 14, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 938.00, 3600, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (15, '【下单自动领劵389元】COACH 单肩包包 黑色', '【下单自动领劵389元】COACH 单肩包包 黑色', '/upload/cfdc67bdd1204bf0/5c95f84b1008639e.jpg', 10000000.00, 0.51, 0.00, 10, 1, 3899.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:12:35', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 389.00, 12599, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (16, '【下单自动领劵829元】Emporio Armani/阿玛尼女士手提包单肩包真皮女包包宴会斜挎包新', '【下单自动领劵829元】Emporio Armani/阿玛尼女士手提包单肩包真皮女包包宴会斜挎包新', '/upload/d3d062fd46aa9467/826f3b3ee4a255ac.jpg', 10000000.00, 0.71, 0.00, 15, 1, 8298.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:13:52', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 829.00, 2719, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (17, '【下单自动领券1250元】 Louis Vuitton/路易威登 女包 手提单肩子母包 NEVERFULL', '【下单自动领券1250元】 Louis Vuitton/路易威登 女包 手提单肩子母包 NEVERFULL', '/upload/70755fa0ebef2f6d/17e0f4662d613947.png', 10000000.00, 0.81, 0.00, 20, 1, 12480.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:14:50', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1250.00, 42599, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (18, '【下单自动领券2180元】GUCCI 古驰 GUCCI女包 DIONYSUS系列黑色牛皮休闲女士单肩包 400249 CAOGN 8176', '【下单自动领券2180元】GUCCI 古驰 GUCCI女包 DIONYSUS系列黑色牛皮休闲女士单肩包 400249 CAOGN 8176', '/upload/baf0ebceebf657ab/6f75548758e2852d.png', 10000000.00, 0.85, 0.00, 30, 1, 21800.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:16:49', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 15, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 2180.00, 7701, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (19, '【下单自动领券36元】高尔夫GOLF防泼水旅行包休闲运动健身包手提单肩行李包男士行李袋旅游包', '【下单自动领券36元】高尔夫GOLF防泼水旅行包休闲运动健身包手提单肩行李包男士行李袋旅游包', '/upload/55960fa7f989d111/34a3d2c4dcdc69d3.png', 10000000.00, 0.32, 0.00, 5, 1, 359.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:20:28', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 16, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 36.00, 12579, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (20, '【下单自动领券138元】途加（TUPLUS）拉杆箱 男女个性PC旅行箱 24英寸静音万向轮行李箱 大容量时尚皮箱密码箱子 荼白', '【下单自动领券138元】途加（TUPLUS）拉杆箱 男女个性PC旅行箱 24英寸静音万向轮行李箱 大容量时尚皮箱密码箱子 荼白', '/upload/02c667eedc1f71a9/b89a43f1501237de.png', 10000000.00, 0.41, 0.00, 7, 1, 1380.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:21:22', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 16, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 138.00, 1599, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (21, '【下单自动领劵1212元】Rimowa/日默瓦TOPAS 拉杆箱旅行箱经典款铝镁合金登机箱原装现货', '【下单自动领劵1212元】Rimowa/日默瓦TOPAS 拉杆箱旅行箱经典款铝镁合金登机箱原装现货', '/upload/2257a149c095f898/afbabe10f9fc69a2.jpg', 10000000.00, 0.71, 0.00, 30, 1, 12120.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:23:48', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 16, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1212.00, 8799, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (22, '【下单自动领劵800元】北欧超大容量加厚铝框运动学生34寸行李箱女男拉杆箱子32寸托运', '【下单自动领劵800元】北欧超大容量加厚铝框运动学生34寸行李箱女男拉杆箱子32寸托运', '/upload/804b675d3f640d60/1ebca37e0757abc2.jpg', 10000000.00, 0.72, 0.00, 15, 1, 7073.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:24:34', 1, '0.5', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 16, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 800.00, 12588, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (23, '【下单自动领劵38元】Coach 2020春夏白色马车印花男士短袖T恤', '【下单自动领劵38元】Coach 2020春夏白色马车印花男士短袖T恤', '/upload/bf34dc5ac8d119b7/e2be1ed2645111ff.jpg', 10000000.00, 0.42, 0.00, 30, 1, 358.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:27:07', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 38.00, 22579, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (24, '【下单自动领劵158元】MCM 2020春夏新品 LOGO GROUP 男士印花短袖T恤', '【下单自动领劵158元】MCM 2020春夏新品 LOGO GROUP 男士印花短袖T恤', '/upload/5de6430ff01d5e5e/bab725f7d17c2799.jpg', 10000000.00, 0.53, 0.00, 30, 1, 1209.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:28:37', 1, '0', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 158.00, 12219, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (25, '【下单自动领劵500元】BURBERRY 专属标识图案宽松T恤衫 80174841', '【下单自动领劵500元】BURBERRY 专属标识图案宽松T恤衫 80174841', '/upload/74c5108747db3bf6/e98ef9e2989e949f.jpg', 10000000.00, 0.67, 0.00, 30, 1, 4526.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:30:05', 1, '0', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 500.00, 12219, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (26, '【下单自动领劵68元】日系Thom Browne夏季TB短裤卫裤针织裤男 女情侣款运动五分休闲裤', '【下单自动领劵68元】日系Thom Browne夏季TB短裤卫裤针织裤男 女情侣款运动五分休闲裤', '/upload/57dca1ca52c6bc41/d0023165ec959324.jpg', 10000000.00, 0.46, 0.00, 7, 1, 658.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:57:53', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 68.00, 12641, 1, 0, 99999, 2);
INSERT INTO `lc_item` VALUES (27, '【下单自动领劵128元】CK CALVIN KLEIN 2020春夏新男装梭织降落伞缎休闲短裤', '【下单自动领劵128元】CK CALVIN KLEIN 2020春夏新男装梭织降落伞缎休闲短裤', '/upload/7ef99ca8734feffb/8085e5f2c54b6ed7.jpg', 10000000.00, 0.53, 0.00, 20, 1, 1183.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:58:37', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 20, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 128.00, 5809, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (28, '【下单自动领劵288元】MCQ ALEXANDER MCQUEEN男士纯棉微弹休闲裤运动春秋新品奢侈品', '【下单自动领劵288元】MCQ ALEXANDER MCQUEEN男士纯棉微弹休闲裤运动春秋新品奢侈品', '/upload/90618dbf6c8d672b/1f1424dcaa68ff47.jpg', 10000000.00, 0.63, 0.00, 30, 1, 2580.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 15:59:24', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 288.00, 10040, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (29, '【下单自动领劵300元】Theory & J Brand联名款 2020春夏新品男装 修身牛仔裤 K050002X', '【下单自动领劵300元】Theory & J Brand联名款 2020春夏新品男装 修身牛仔裤 K050002X', '/upload/5e3953cdb85f9ec7/f8691db26172216e.jpg', 10000000.00, 0.65, 0.00, 25, 1, 2800.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:00:10', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 21, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 23590, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (30, '【下单自动领劵138元】张子枫同款 剑鱼 飞鱼 沙滩风 短袖 衬衫', '【下单自动领劵138元】张子枫同款 剑鱼 飞鱼 沙滩风 短袖 衬衫', '/upload/454ca16a4bda2217/3fa1b26dba975a7e.jpg', 10000000.00, 0.52, 0.00, 8, 1, 1280.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:01:12', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 138.00, 201634, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (31, '【下单自动领劵580元】FAITH CONNEXION2020春夏黑白色混亮丝格子花呢字母男士休闲衬衫', '【下单自动领劵580元】FAITH CONNEXION2020春夏黑白色混亮丝格子花呢字母男士休闲衬衫', '/upload/8f613543defb831c/33f159f3167f37a3.jpg', 10000000.00, 0.68, 0.00, 15, 1, 5590.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:01:50', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 580.00, 12190, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (32, '【下单自动领劵188元】高端品牌夏季男士长袖白衬衫青年商务修身型韩版帅气潮流短袖衬衣', '【下单自动领劵188元】高端品牌夏季男士长袖白衬衫青年商务修身型韩版帅气潮流短袖衬衣', '/upload/4b0d8400e66ebdde/32bdb1919e79e3b5.jpg', 10000000.00, 0.56, 0.00, 15, 1, 1688.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:05:24', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 188.00, 12278, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (33, '【下单自动领劵258元】Givenchy/纪梵希20春夏多色全棉LOGO装饰翻领男士长袖衬衫', '【下单自动领劵258元】Givenchy/纪梵希20春夏多色全棉LOGO装饰翻领男士长袖衬衫', '/upload/554821ea90fc5747/0a5b4ca1a196bc8b.jpg', 10000000.00, 0.63, 0.00, 30, 1, 2280.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:06:40', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 22, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 258.00, 22719, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (34, '【下单自动领劵44元】马克华菲女装蛋糕裙2020新款夏长款蕾丝边拼接连衣裙女神气质裙子', '【下单自动领劵44元】马克华菲女装蛋糕裙2020新款夏长款蕾丝边拼接连衣裙女神气质裙子', '/upload/983ef83970214909/6c25fc2c3407bd6a.jpg', 10000000.00, 0.31, 0.00, 5, 1, 449.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-09-17 16:07:53', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 23, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 44.00, 1533, 1, 0, 99998, 1);
INSERT INTO `lc_item` VALUES (35, '【下单自动领劵100元】夏款露脐阔腿裤套装5037', '【下单自动领劵100元】夏款露脐阔腿裤套装5037', '/upload/8db003c63d176b74/41d4ed821f88c7f5.jpg', 10000000.00, 0.48, 0.00, 8, 1, 1085.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:08:52', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 2610, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (36, '【下单自动领劵98元】卡通小熊童装2020年新款秋季女童长袖针织衫短裙套装毛衣', '【下单自动领劵98元】卡通小熊童装2020年新款秋季女童长袖针织衫短裙套装毛衣', '/upload/112320978096a10e/a91d96d61a33ecf0.jpg', 10000000.00, 0.50, 0.00, 7, 1, 898.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:09:59', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 98.00, 1434, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (37, '【下单自动领劵30元】Absorba爱之宝进口童装新生儿甜美可爱包屁衣短袖套装', '【下单自动领劵30元】Absorba爱之宝进口童装新生儿甜美可爱包屁衣短袖套装', '/upload/6b51c5decba4ccf0/0b3432a4cdda449d.jpg', 10000000.00, 0.45, 0.00, 5, 1, 499.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:10:43', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 30.00, 2629, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (38, '【下单自动领劵188元】法国正品代购 HUGO BOSS 童装 2020春夏新款 男童2件套', '【下单自动领劵188元】法国正品代购 HUGO BOSS 童装 2020春夏新款 男童2件套', '/upload/6b51c5decba4ccf0/0b3432a4cdda449d.jpg', 10000000.00, 0.53, 0.00, 15, 1, 1350.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:11:38', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 24, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 188.00, 56498, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (39, '【下单自动领劵100元】Erginio女童连衣裙2020新款夏洋气童装韩版夏季超仙网红公主裙子', '【下单自动领劵100元】Erginio女童连衣裙2020新款夏洋气童装韩版夏季超仙网红公主裙子', '/upload/c79dba67ba6c071f/073df6271f0ae3e0.jpg', 10000000.00, 0.52, 0.00, 8, 1, 1038.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:13:28', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 27590, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (40, '【下单自动领劵200元】BURBERRY童装新款 纽扣短袖外套和背心百褶裙二合一连衣裙', '【下单自动领劵200元】BURBERRY童装新款 纽扣短袖外套和背心百褶裙二合一连衣裙', '/upload/0491710c3671f168/f9e12211667d73c0.jpg', 10000000.00, 0.62, 0.00, 10, 1, 1998.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:14:18', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 25, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 52599, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (41, '【下单自动领劵128元】莫斯奇诺 20春儿童泰迪熊装饰超大T恤', '【下单自动领劵128元】莫斯奇诺 20春儿童泰迪熊装饰超大T恤', '/upload/c96133b32995e9d6/d03166dde6c8999a.jpg', 10000000.00, 0.53, 0.00, 7, 1, 1180.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:15:24', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 128.00, 1420, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (42, '【下单自动领劵38元】太平鸟童装男童哆啦A梦POLO衫F1DBA2311', '【下单自动领劵38元】太平鸟童装男童哆啦A梦POLO衫F1DBA2311', '/upload/c727bf1d10544730/5b98f0c9bd144efb.jpg', 10000000.00, 0.45, 0.00, 5, 1, 329.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:16:10', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 26, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 38.00, 2603, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (43, '【下单自动领劵200元】德铂Debo德国304不锈钢锅具套装组合厨具炊具不粘锅烹饪用具厨房', '【下单自动领劵200元】德铂Debo德国304不锈钢锅具套装组合厨具炊具不粘锅烹饪用具厨房', '/upload/89a048b4503944a1/b5344ba2fa55f4e5.jpg', 10000000.00, 0.55, 0.00, 30, 1, 1688.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:17:53', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 5326, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (44, '【下单自动领劵400元】巧慕铸铁锅具套装不粘锅三件套汤锅煎锅炒锅铁锅烹饪锅具套装组合', '【下单自动领劵400元】巧慕铸铁锅具套装不粘锅三件套汤锅煎锅炒锅铁锅烹饪锅具套装组合', '/upload/75ef977df8068eed/e9f308e8f6637a39.jpg', 10000000.00, 0.73, 0.00, 30, 1, 4148.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:19:15', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 400.00, 8000, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (45, '【下单自动领劵100元】德国STONELINE进口厨房烹饪锅具套装组合不粘三件套炒锅全套家用', '【下单自动领劵100元】德国STONELINE进口厨房烹饪锅具套装组合不粘三件套炒锅全套家用', '/upload/c077fa31f9d5cdd4/af0c2e0e733c8bf0.jpg', 10000000.00, 0.52, 0.00, 20, 1, 1059.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:20:01', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 28, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 4463, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (46, '【下单自动领劵458元】橱柜拉篮纳米干镀厨房不锈钢阻尼静音碗碟篮锅具篮2合1套装', '【下单自动领劵458元】橱柜拉篮纳米干镀厨房不锈钢阻尼静音碗碟篮锅具篮2合1套装', '/upload/2e9715aa91248b5e/49b3fb36932f70e1.jpg', 10000000.00, 0.66, 0.00, 20, 1, 4286.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:22:26', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 458.00, 599, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (47, '【下单自动领劵1188元】JOMOO九牧 进口304不锈钢厨房双槽水槽套餐02221', '【下单自动领劵1188元】JOMOO九牧 进口304不锈钢厨房双槽水槽套餐02221', '/upload/a3221cf57efce121/f1667f3635e585f8.jpg', 10000000.00, 0.89, 0.00, 50, 1, 11000.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:23:06', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 29, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1188.00, 434, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (48, '【新手专享】（MI）米家保温杯大容量500ml', '【新手专享】（MI）米家保温杯大容量500ml', '/upload/d93b29c3d20689d3/0a81705d0e8e72b7.png', 10000000.00, 3.00, 0.00, 1, 1, 97.20, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:24:58', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 21733, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (49, '【下单自动领劵400元】定制进口140支埃及长绒棉四件套欧美风家纺粉色新婚高档纯棉床上用品', '【下单自动领劵400元】定制进口140支埃及长绒棉四件套欧美风家纺粉色新婚高档纯棉床上用品', '/upload/b406b1ad72a76fa2/616a3f64fbea0e37.jpg', 10000000.00, 0.65, 0.00, 60, 1, 3680.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:26:06', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 400.00, 8709, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (50, '【下单自动领劵800元】真丝四件套重磅素绉缎100%桑蚕丝四件套丝绸高端定制真丝床上用品', '【下单自动领劵800元】真丝四件套重磅素绉缎100%桑蚕丝四件套丝绸高端定制真丝床上用品', '/upload/368502c6eddcb6d9/6b16bc3c17988e63.jpg', 10000000.00, 0.76, 0.00, 30, 1, 7656.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:26:54', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 800.00, 8832, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (51, '【下单自动领劵200元】OUROSESAN轻奢品牌床上四件套简约条纹被套床单全棉纯棉床品家纺', '【下单自动领劵200元】OUROSESAN轻奢品牌床上四件套简约条纹被套床单全棉纯棉床品家纺', '/upload/c16ea8c83c8968db/995f36b7673b6b8a.jpg', 10000000.00, 0.54, 0.00, 20, 1, 1650.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:27:55', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 31, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 24332, 1, 0, 99997, 1);
INSERT INTO `lc_item` VALUES (52, '【下单自动领劵288元】王记信号家用网红餐具美式欧美陶瓷碗盘组合创意个性碗筷北欧ins', '【下单自动领劵288元】王记信号家用网红餐具美式欧美陶瓷碗盘组合创意个性碗筷北欧ins', '/upload/8210529e872e4b25/891c12b2f058f3bd.jpg', 10000000.00, 0.62, 0.00, 30, 1, 2215.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:31:15', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 288.00, 4698, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (53, '【下单自动领劵99元】华光陶瓷欧式骨瓷餐具套装碗碟套装家用中式结婚瓷器礼盒圣托里尼', '【下单自动领劵99元】华光陶瓷欧式骨瓷餐具套装碗碟套装家用中式结婚瓷器礼盒圣托里尼', '/upload/8d89fc40a206569f/fe87266350a2cb34.jpg', 10000000.00, 0.46, 0.00, 25, 1, 998.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:32:14', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 32, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 99.00, 5629, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (54, '【下单自动领劵100元】诗萝涵朵文胸DEF码华歌尔Wacoal Trefle BBF461上托聚拢舒适', '【下单自动领劵100元】诗萝涵朵文胸DEF码华歌尔Wacoal Trefle BBF461上托聚拢舒适', '/upload/d584c3c7e85356bc/c23f8263bd74c821.jpg', 10000000.00, 0.56, 0.00, 20, 1, 1158.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:46:27', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 85, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 12602, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (55, '【下单自动领劵118元】莱特妮丝正品生物频文胸AI038养护内衣内裤官方无钢圈调整背心女', '【下单自动领劵118元】莱特妮丝正品生物频文胸AI038养护内衣内裤官方无钢圈调整背心女', '/upload/db90b04bf37acdf4/a8aaf238aefada60.jpg', 10000000.00, 0.57, 0.00, 11, 1, 1180.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:47:09', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 85, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 118.00, 9123, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (56, '【下单自动领劵100元】网纱透明超薄性感镂空短裤低腰火辣三角裤', '【下单自动领劵100元】网纱透明超薄性感镂空短裤低腰火辣三角裤', '/upload/471767a88d41e2b8/c1738693269f7012.jpg', 10000000.00, 0.57, 0.00, 15, 1, 1280.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:47:55', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 86, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 6752, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (57, '【下单自动领劵600元】迪奥新款安全裤10104', '【下单自动领劵600元】迪奥新款安全裤10104', '/upload/27c7de0ef0e2af4f/90c0429a055c25f1.jpg', 10000000.00, 0.72, 0.00, 20, 1, 5899.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:49:20', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 86, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 600.00, 24703, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (58, '【下单自动领劵300元】鼠年红色本命年红色男士纯棉内裤男平角裤结婚四角裤男人礼物', '【下单自动领劵300元】鼠年红色本命年红色男士纯棉内裤男平角裤结婚四角裤男人礼物', '/upload/f64f93fe4d33c81a/72adc403f4d0bf0d.jpg', 10000000.00, 0.62, 0.00, 10, 1, 3180.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:50:34', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 87, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 24392, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (59, '【下单自动领劵200元】VERSACE 金色印花弹力棉质男士平角内裤 2020', '【下单自动领劵200元】VERSACE 金色印花弹力棉质男士平角内裤 2020', '/upload/2740c5a0c7c225bf/c217c8bf4d1aee25.jpg', 10000000.00, 0.56, 0.00, 10, 1, 1580.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:51:13', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 87, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 8823, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (60, '【下单自动领劵100元】Tom Ford/汤姆福特 男弹力棉质三角裤内裤NET-A-PORTER', '【下单自动领劵100元】Tom Ford/汤姆福特 男弹力棉质三角裤内裤NET-A-PORTER', '/upload/27c7de0ef0e2af4f/90c0429a055c25f1.jpg', 10000000.00, 0.45, 0.00, 20, 1, 710.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:51:39', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 87, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 4408, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (61, '【下单自动领劵100元】阿迪达斯三叶草2020秋季新品男子NITEBALL休闲鞋FV4842', '【下单自动领劵100元】阿迪达斯三叶草2020秋季新品男子NITEBALL休闲鞋FV4842', '/upload/3becd581b3191d6b/2f655d688e9d39c9.jpg', 10000000.00, 0.55, 0.00, 10, 1, 1099.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:54:22', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 2602, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (62, '【下单自动领劵400元】Dunhill/登喜路 男抛光真皮酒红色德比鞋NET-A-PORTER', '【下单自动领劵400元】Dunhill/登喜路 男抛光真皮酒红色德比鞋NET-A-PORTER', '/upload/ddf761f48fe0d76d/f5c8bbfec33fe951.jpg', 10000000.00, 0.65, 0.00, 14, 1, 4280.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:55:08', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 400.00, 45460, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (63, '【下单自动领劵50元】奈瑟【暗黑系】懒人鞋山本耀司男鞋一脚蹬手工日系复古休闲皮鞋', '【下单自动领劵50元】奈瑟【暗黑系】懒人鞋山本耀司男鞋一脚蹬手工日系复古休闲皮鞋', '/upload/5bd15b11472b8b89/284390fd2800fd46.jpg', 10000000.00, 0.51, 0.00, 5, 1, 502.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:57:02', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 50.00, 54423, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (64, '【下单自动领劵200元】虎狼之狮定制高档鳄鱼皮男鞋系带时尚商务休闲鞋纯手工固特异皮鞋', '【下单自动领劵200元】虎狼之狮定制高档鳄鱼皮男鞋系带时尚商务休闲鞋纯手工固特异皮鞋', '/upload/80635f676a3c0075/994ae5b8fd140a41.jpg', 10000000.00, 0.60, 0.00, 12, 1, 2180.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 16:57:44', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 45, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 5402, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (65, '【下单自动领劵139元】Jordan 官方 AIR LATITUDE 720女子运动鞋气垫休闲鞋AV5187', '【下单自动领劵139元】Jordan 官方 AIR LATITUDE 720女子运动鞋气垫休闲鞋AV5187', '/upload/b7c3a3db3e2b79a9/01ae9e9ec92d1acf.jpg', 10000000.00, 0.58, 0.00, 10, 1, 1399.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:00:15', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 46, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 139.00, 6920, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (66, '【下单自动领劵299元】LANVIN/浪凡时尚简约潮流气质沙滩女士平跟凉鞋', '【下单自动领劵299元】LANVIN/浪凡时尚简约潮流气质沙滩女士平跟凉鞋', '/upload/886655dee2bec33c/24dcb11e3f5b6e11.jpg', 10000000.00, 0.61, 0.00, 20, 1, 2998.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:00:53', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 46, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 299.00, 4426, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (67, '【下单自动领劵500元】Nicholas Kirkwood2020春夏黑色反绒羊皮水晶树叶女士高跟凉鞋', '【下单自动领劵500元】Nicholas Kirkwood2020春夏黑色反绒羊皮水晶树叶女士高跟凉鞋', '/upload/6cc5c7cffbfffc0d/753dd9409dff6cf3.jpg', 10000000.00, 0.73, 0.00, 15, 1, 5070.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:01:41', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 46, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 500.00, 45420, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (68, '【下单自动领劵50元】CHARLES&KEITH女鞋CK1-60280165金属铆钉袢带饰女士尖头高跟鞋', '【下单自动领劵50元】CHARLES&KEITH女鞋CK1-60280165金属铆钉袢带饰女士尖头高跟鞋', '/upload/814f6112b2b6becf/a8ace4fcae9b195c.png', 10000000.00, 0.38, 0.00, 5, 1, 500.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:02:34', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 46, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 50.00, 22630, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (69, '【下单自动领劵168元】日本ITRIM保湿乳液女 补水正品滋润修复 提亮植萃馥润精华乳75ML', '【下单自动领劵168元】日本ITRIM保湿乳液女 补水正品滋润修复 提亮植萃馥润精华乳75ML', '/upload/12e12c4750b7a3b6/8b105c6f43572057.jpg', 10000000.00, 0.58, 0.00, 13, 1, 1680.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:06:44', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 47, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 168.00, 45465, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (70, '【下单自动领劵100元】OKADY二裂酵母润养修护套盒 超值6件套', '【下单自动领劵100元】OKADY二裂酵母润养修护套盒 超值6件套', '/upload/9afbf10421418629/4db4b7e9669a5611.png', 10000000.00, 0.35, 0.00, 7, 1, 1099.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:07:45', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 47, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 1452, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (71, '【下单自动领劵998元】sk-ii sk2前男友护肤面膜skii神仙水面膜 补水保湿提亮肤色', '【下单自动领劵998元】sk-ii sk2前男友护肤面膜skii神仙水面膜 补水保湿提亮肤色', '/upload/735c2b3b6d4a3efa/611838da5d869e28.png', 10000000.00, 0.73, 0.00, 15, 1, 9988.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:08:44', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 48, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 998.00, 31185, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (72, '【下单自动领劵499元】劲霸男士护肤礼盒', '【下单自动领劵499元】劲霸男士护肤礼盒', '/upload/3c071e89d54ad96e/6d677c420d679d95.jpg', 10000000.00, 0.54, 0.00, 10, 1, 4999.00, 99999999.99, 2, '香港汇民国际担保有限公司', 0, '', 99999.00, 0, 1, '', '', '2020-08-13 17:09:24', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 48, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 499.00, 52623, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (73, '【下单自动领劵700元】Dior/迪奥五色眼影盘彩妆盘', '【下单自动领劵700元】Dior/迪奥五色眼影盘彩妆盘', '/upload/82dfcee94d8881f5/2dbaaa72982f83e4.jpg', 10000000.00, 0.72, 0.00, 14, 1, 7500.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:10:26', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 49, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 700.00, 42750, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (74, '【下单自动领劵120元】心相印大卷纸卫生纸大盘卷纸厕纸3层心心相印大盘纸商用厕所纸巾10箱(120卷*733g/188米)', '【下单自动领劵120元】心相印大卷纸卫生纸大盘卷纸厕纸3层心心相印大盘纸商用厕所纸巾10箱(120卷*733g/188米)', '/upload/0b1852dea323166a/933486715a03a01f.png', 10000000.00, 0.41, 0.00, 7, 1, 1288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:11:19', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 50, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 120.00, 74390, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (75, '【下单自动领劵680元】和之初雪莲护理贴生态保养私处妇科正品女性护垫20片/盒可查防伪', '【下单自动领劵680元】和之初雪莲护理贴生态保养私处妇科正品女性护垫20片/盒可查防伪', '/upload/9afbf10421418629/4db4b7e9669a5611.png', 10000000.00, 0.73, 0.00, 12, 1, 6988.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:12:14', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 51, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 680.00, 1420, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (76, '【下单自动领劵555元】气动工业吸尘器镁粉清理用加工打磨服装食用品厂吸尘器GS1030气动吸尘器 KS3600', '【下单自动领劵555元】气动工业吸尘器镁粉清理用加工打磨服装食用品厂吸尘器GS1030气动吸尘器 KS3600', '/upload/9c7ef5e9d74b812f/6025e7beac046c9c.png', 10000000.00, 0.53, 0.00, 11, 1, 5788.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:14:40', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 52, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 555.00, 919, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (77, '【下单自动领劵287元】美容店收集桶酒店工作布草车脏衣服手推衣物E车布车清理收拾车清', '【下单自动领劵287元】美容店收集桶酒店工作布草车脏衣服手推衣物E车布车清理收拾车清', '/upload/5364a0c42e98bd1b/1c06b3860bdf5115.jpg', 10000000.00, 0.65, 0.00, 30, 1, 2988.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:15:34', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 52, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 288.00, 5419, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (78, '【下单自动领劵500元】honey安蒂花子蜂蜜滋养洗发水洗护套装洗发水', '【下单自动领劵500元】honey安蒂花子蜂蜜滋养洗发水洗护套装洗发水', '/upload/f227c8df27cd98bc/2244cfc9747bbfd7.jpg', 10000000.00, 0.68, 0.00, 15, 1, 5288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:16:47', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 53, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 500.00, 28449, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (79, '【下单自动领劵209元】安米娜新品玫瑰精萃洗护套装洗发水护发养发二合一持', '【下单自动领劵209元】安米娜新品玫瑰精萃洗护套装洗发水护发养发二合一持', '/upload/2f1b8b6524997724/57192f4853a274d9.jpg', 10000000.00, 0.58, 0.00, 11, 1, 2288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:17:33', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 53, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 209.00, 14420, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (80, '【下单自动领劵1488元】Dr.Arrivoforbody美容仪器家用身体塑形微电流美体仪', '【下单自动领劵1488元】Dr.Arrivoforbody美容仪器家用身体塑形微电流美体仪', '/upload/d77b766deff7747c/9ceb405a06a6cd31.jpg', 10000000.00, 0.85, 0.00, 30, 1, 14888.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:18:22', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 54, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1488.00, 23599, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (81, '【下单自动领劵119元】口腔护理舌头口腔镜声波式电动牙刷冲牙水牙线头套装苔清洁器', '【下单自动领劵119元】口腔护理舌头口腔镜声波式电动牙刷冲牙水牙线头套装苔清洁器', '/upload/de44bc5123de933c/6db4c51556497a65.jpg', 10000000.00, 0.35, 0.00, 7, 1, 1288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:19:25', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 119.00, 12602, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (82, '【下单自动领劵268元】日本直邮 松下EW-DE25电动充电超声波细毛牙刷 口腔护理', '【下单自动领劵268元】日本直邮 松下EW-DE25电动充电超声波细毛牙刷 口腔护理', '/upload/c419f373d7001a0f/6c08c1d83f3febf7.png', 10000000.00, 0.59, 0.00, 10, 1, 2688.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:20:01', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 55, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 268.00, 42320, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (83, '【下单自动领劵1096元】Bylure轻奢品牌智能手表男女款独立插卡4G安卓定位拍照运动手表', '【下单自动领劵1096元】Bylure轻奢品牌智能手表男女款独立插卡4G安卓定位拍照运动手表', '/upload/dec5958de0575fdc/f547947ae298a2f1.jpg', 10000000.00, 0.81, 0.00, 30, 1, 10960.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:20:54', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1096.00, 44705, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (84, '【下单自动领劵629元】Apple/苹果 Apple Watch Series 5', '【下单自动领劵629元】Apple/苹果 Apple Watch Series 5', '/upload/fae673a62ba89b68/4da6f726e7f9ee8c.jpg', 10000000.00, 0.59, 0.00, 12, 1, 6298.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:21:40', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 629.00, 42319, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (85, '【下单自动领劵788元】机械挂钟德国赫姆勒机芯时钟欧式客厅实木报时挂表复古机械钟HP02', '【下单自动领劵788元】机械挂钟德国赫姆勒机芯时钟欧式客厅实木报时挂表复古机械钟HP02', '/upload/c7b3d410cf0a5720/c15b1fac640cf042.jpg', 10000000.00, 0.75, 0.00, 20, 1, 7888.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:22:36', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 57, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 788.00, 8745, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (86, '【下单自动领劵2300元】Longines浪琴 官方正品名匠系列男士机械表瑞士手表男腕表', '【下单自动领劵2300元】Longines浪琴 官方正品名匠系列男士机械表瑞士手表男腕表', '/upload/3fee51b494887f0b/7bd61cd6d87a9686.jpg', 10000000.00, 0.89, 0.00, 25, 1, 23000.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:23:43', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 58, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 2300.00, 10420, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (87, '【下单自动领劵79元】日韩名牌正品精钢手表男士全自动机械表超薄镂空陀飞轮', '【下单自动领劵79元】日韩名牌正品精钢手表男士全自动机械表超薄镂空陀飞轮', '/upload/fa4fe4a672557458/7cac2f5b2a4cee64.jpg', 10000000.00, 0.31, 0.00, 5, 1, 798.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:26:14', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 59, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 79.00, 8755, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (88, '【下单自动领劵423元】陶瓷镶铜桌面钟摆件 复古怀旧手绘瓷器铜包瓷玄关壁炉奢华工艺品', '【下单自动领劵423元】陶瓷镶铜桌面钟摆件 复古怀旧手绘瓷器铜包瓷玄关壁炉奢华工艺品', '/upload/8ec1b8a974a28c8e/a1ce819f781bad0b.jpg', 10000000.00, 0.61, 0.00, 10, 1, 4235.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:27:00', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 60, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 423.00, 8047, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (89, '【下单自动领劵2500元】周生生足金素圈 黄金手镯女款结婚金手环', '【下单自动领劵2500元】周生生足金素圈 黄金手镯女款结婚金手环', '/upload/9513160c833da221/7d1d5028cf157e0b.png', 10000000.00, 0.89, 0.00, 30, 1, 25000.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:28:14', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 61, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 2500.00, 5936, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (90, '【下单自动领劵726元】周大福珠宝首饰婚嫁喜足金黄金手镯', '【下单自动领劵726元】周大福珠宝首饰婚嫁喜足金黄金手镯', '/upload/eef608945d32cf23/7477f196126a67dd.jpg', 10000000.00, 0.68, 0.00, 15, 1, 7260.12, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:29:21', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 61, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 726.00, 24710, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (91, '【下单自动领劵708元】KXDUN卡希盾朋克风新款银首饰品泰银霸气夸张十字架插销扣LY0818', '【下单自动领劵708元】KXDUN卡希盾朋克风新款银首饰品泰银霸气夸张十字架插销扣LY0818', '/upload/cc4be77f8be4c00a/3cb2ba19d17a6a50.jpg', 10000000.00, 0.70, 0.00, 18, 1, 7088.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:30:32', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 62, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 708.00, 5456, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (92, '【下单自动领劵1288元】海南黄花梨紫油梨小叶紫檀手串男鬼脸对眼鬼眼2.0老料蜘蛛纹108颗', '【下单自动领劵1288元】海南黄花梨紫油梨小叶紫檀手串男鬼脸对眼鬼眼2.0老料蜘蛛纹108颗', '/upload/3f6c83ad232a2d41/fb3a8e9f8094459a.jpg', 10000000.00, 0.86, 0.00, 30, 1, 12888.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:31:33', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 63, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1288.00, 75919, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (93, '【下单自动领劵1272元】浦发银行黄金竹报平安投资金条30g足金贵金属储值回购计价贺岁款', '【下单自动领劵1272元】浦发银行黄金竹报平安投资金条30g足金贵金属储值回购计价贺岁款', '/upload/c11377174c6bbdfc/9020a0388eaaf2e5.jpg', 10000000.00, 0.85, 0.00, 30, 1, 12788.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:32:39', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 64, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1272.00, 4420, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (94, '【下单自动领劵200元】天然a货翡翠葫芦吊坠女玉石项链挂件', '【下单自动领劵200元】天然a货翡翠葫芦吊坠女玉石项链挂件', '/upload/11ade424286ad860/21e97c8f99e13663.jpg', 10000000.00, 0.35, 0.00, 7, 1, 2088.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:33:43', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 65, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 8889, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (95, '【下单自动领劵4554元】DR PARIS系列挚爱款公主方求婚钻戒结婚钻石戒指婚戒女戒白18K金', '【下单自动领劵4554元】DR PARIS系列挚爱款公主方求婚钻戒结婚钻石戒指婚戒女戒白18K金', '/upload/c6f33cfc0b206413/a2f8f8b3cf223fb0.jpg', 10000000.00, 0.89, 0.00, 31, 1, 45888.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:34:38', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 66, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 4554.00, 86709, 1, 1, 99999, 3);
INSERT INTO `lc_item` VALUES (96, '【下单自动领劵798元】VENTIGA/梵蒂加18K白金钻石首饰结婚钻戒圣诞礼物求婚戒指', '【下单自动领劵798元】VENTIGA/梵蒂加18K白金钻石首饰结婚钻戒圣诞礼物求婚戒指', '/upload/d3879fa62991e4e1/af908a2543687172.jpg', 10000000.00, 0.72, 0.00, 18, 1, 7988.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:35:40', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 66, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 798.00, 6528, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (97, '【下单自动领劵1050元】Apple 苹果 iPhone 11 Pro Max', '【下单自动领劵1050元】Apple 苹果 iPhone 11 Pro Max', '/upload/025eac571399f894/779dde441067ed1c.png', 10000000.00, 0.84, 0.00, 15, 1, 10500.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:37:54', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 67, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1050.00, 86718, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (98, '【下单自动领劵200元】Huawei/华为畅享20 Pro 5G全场景SoC芯片智能手机', '【下单自动领劵200元】Huawei/华为畅享20 Pro 5G全场景SoC芯片智能手机', '/upload/c93b3f7191a35193/dbcbf4ce44ee14e5.jpg', 10000000.00, 0.65, 0.00, 10, 1, 2000.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:38:32', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 67, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 200.00, 12633, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (99, '【下单自动领劵45元】飞利浦（PHILIPS）E209 老人手机', '【下单自动领劵45元】飞利浦（PHILIPS）E209 老人手机', '/upload/5a2ef160d22f7e1f/4fa0982d3e155adf.jpg', 10000000.00, 0.31, 0.00, 5, 1, 450.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:40:07', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 67, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 45.00, 5800, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (100, '【下单自动领劵100元】荣耀Play4T 全网通6GB+128GB', '【下单自动领劵100元】荣耀Play4T 全网通6GB+128GB', '/upload/6b932ccc93746760/1951ce53b4859227.jpg', 10000000.00, 0.65, 0.00, 10, 1, 1000.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:41:14', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 67, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 7065, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (101, '【新手专享】荣耀亲选 Earbuds X1 真无线蓝牙耳机', '【新手专享】荣耀亲选 Earbuds X1 真无线蓝牙耳机', '/upload/b9ddcba0be15cd76/b88869bc89c5bcd5.png', 10000000.00, 3.50, 0.00, 1, 1, 159.00, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:42:31', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 68, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 528756, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (102, '【下单自动领劵100元】Apple/苹果AirPods 2代手机无线蓝牙耳机正品国行', '【下单自动领劵100元】Apple/苹果AirPods 2代手机无线蓝牙耳机正品国行', '/upload/eb02d8bb3e9e3c88/094f02bd489c6b6c.jpg', 10000000.00, 0.62, 0.00, 7, 1, 1288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:43:25', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 68, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 9818, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (103, '【下单自动领劵2000元】索尼（SONY）Alpha 7 III 套装（SEL24105G镜头）全画幅微单数码相机', '【下单自动领劵2000元】索尼（SONY）Alpha 7 III 套装（SEL24105G镜头）全画幅微单数码相机', '/upload/82ea33182b301805/7089e5228791753a.jpg', 10000000.00, 0.88, 0.00, 28, 1, 20599.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:44:33', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 69, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 2000.00, 5499, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (104, '【下单自动领劵300元】松下（Panasonic）GF10K微单相机', '【下单自动领劵300元】松下（Panasonic）GF10K微单相机', '/upload/4757593d2906aa61/68d6d2175cfa20a4.jpg', 10000000.00, 0.68, 0.00, 7, 1, 3000.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:45:15', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 69, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 8810, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (105, '【下单自动领劵450元】佳能（Canon）EOS M50 微单相机', '【下单自动领劵450元】佳能（Canon）EOS M50 微单相机', '/upload/62075ff5ad39b429/f8ce7396274aa696.jpg', 10000000.00, 0.78, 0.00, 10, 1, 4599.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:45:56', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 69, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 450.00, 42720, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (106, '【下单自动领劵20元】纽曼 (Newmine) MC10 手机麦克风', '【下单自动领劵20元】纽曼 (Newmine) MC10 手机麦克风', '/upload/b3fec6ababe46a71/ca11833220c4a9b4.jpg', 10000000.00, 0.58, 0.00, 7, 1, 168.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:46:47', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 70, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 20.00, 1423, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (107, '【下单自动领劵70元】先科（SAST） 15英寸便携式广场舞音响', '【下单自动领劵70元】先科（SAST） 15英寸便携式广场舞音响', '/upload/6eb9cc14f018bec7/a653df306b1b4d6d.jpg', 10000000.00, 0.58, 0.00, 10, 1, 789.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:47:38', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 70, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 70.00, 3876, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (108, '【下单自动领劵50元】思锐（SIRUI）三脚架 E1005A+G12 含云台佳能尼康单反相机三角架', '【下单自动领劵50元】思锐（SIRUI）三脚架 E1005A+G12 含云台佳能尼康单反相机三角架', '/upload/3596c03e547b7cf4/af418aeaa78a306f.png', 10000000.00, 0.58, 0.00, 10, 1, 528.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:48:23', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 71, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 50.00, 3662, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (109, '【下单自动领券230元】茅台 赖茅 传承蓝 53度 500ml*6瓶 整箱装 酱香型白酒', '【下单自动领券230元】茅台 赖茅 传承蓝 53度 500ml*6瓶 整箱装 酱香型白酒', '/upload/a76232f762588665/c05fa82f7f29416d.png', 10000000.00, 0.53, 0.00, 7, 1, 2388.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:49:08', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 77, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 230.00, 1302, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (110, '【下单自动领券32元】洋河大曲 55度 整箱装白酒 500ml*6瓶 口感绵柔浓香型', '【下单自动领券32元】洋河大曲 55度 整箱装白酒 500ml*6瓶 口感绵柔浓香型', '/upload/d25d1e3c7c7194d5/332ab9b370d2676b.png', 10000000.00, 0.30, 0.00, 5, 1, 328.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:49:54', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 77, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 32.00, 3810, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (111, '【下单自动领劵500元】联想ThinkBook 15(06CD)英特尔酷睿i5 15.6英寸轻薄笔记本电脑', '【下单自动领劵500元】联想ThinkBook 15(06CD)英特尔酷睿i5 15.6英寸轻薄笔记本电脑', '/upload/183dec20a37c5d9b/869adb8256bcf654.jpg', 10000000.00, 0.68, 0.00, 10, 1, 4599.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:50:44', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 72, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 500.00, 9849, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (112, '【下单自动领劵400元】荣耀笔记本电脑MagicBook 15 15.6英寸全面屏轻薄本', '【下单自动领劵400元】荣耀笔记本电脑MagicBook 15 15.6英寸全面屏轻薄本', '/upload/29b67c292965414b/8b625d5792ac6482.jpg', 10000000.00, 0.70, 0.00, 10, 1, 3899.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:51:29', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 72, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 400.00, 14356, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (113, '【下单自动领劵500元】惠普(HP)战99 商用办公台式电脑主机', '【下单自动领劵500元】惠普(HP)战99 商用办公台式电脑主机', '/upload/005311f7388165db/b0ff1b443a55b67d.jpg', 10000000.00, 0.73, 0.00, 15, 1, 4799.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:52:46', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 73, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 500.00, 2711, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (114, '【下单自动领劵300元】罗技（Logitech） Craft无线键盘', '【下单自动领劵300元】罗技（Logitech） Craft无线键盘', '/upload/aaee5b090a01668b/82df27c58bf97efb.png', 10000000.00, 0.65, 0.00, 10, 1, 2899.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:53:38', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 74, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 37056, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (115, '【下单自动领劵300元】华为 移动路由5G CPE Pro', '【下单自动领劵300元】华为 移动路由5G CPE Pro', '/upload/3fdd57eadcdedd03/ae3ea16c2d739599.jpg', 10000000.00, 0.63, 0.00, 20, 1, 2899.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:54:27', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 75, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 42688, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (116, '【下单自动领劵100元】爱普生（EPSON）L4158墨仓式经济款 彩色无线多功能一体机', '【下单自动领劵100元】爱普生（EPSON）L4158墨仓式经济款 彩色无线多功能一体机', '/upload/9f76fe55a4c42f60/adac712170459b57.jpg', 10000000.00, 0.58, 0.00, 15, 1, 1688.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:55:24', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 76, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 100.00, 5702, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (117, '【新手专享】蒙牛内蒙古老酸奶原味发酵乳', '【新手专享】蒙牛内蒙古老酸奶原味发酵乳', '/upload/f9aefad97234e7a9/326a3520cdc5c3a9.png', 10000000.00, 2.50, 0.00, 1, 1, 40.00, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:56:09', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 78, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 89820, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (118, '【下单自动领券26元】天福茗茶 瓷罐大红袍 武夷山特产茶 福建名茶正宗乌龙茶礼盒200g', '【下单自动领券26元】天福茗茶 瓷罐大红袍 武夷山特产茶 福建名茶正宗乌龙茶礼盒200g', '/upload/8f4339cac1a88eeb/0a2259a7f8524f85.png', 10000000.00, 0.30, 0.00, 5, 1, 288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:56:53', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 26.00, 25589, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (119, '【下单自动领券110元】马头岩乌龙茶茶叶武夷山大红袍武夷岩茶正岩猫耳石肉桂200g礼盒', '【下单自动领券110元】马头岩乌龙茶茶叶武夷山大红袍武夷岩茶正岩猫耳石肉桂200g礼盒', '/upload/6f1cdad12b413702/2dc9c050db87b53f.png', 10000000.00, 0.42, 0.00, 7, 1, 1288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:57:44', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 79, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 110.00, 8849, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (120, '【下单自动领劵400元】电视4S75英寸4k高清智能平板液晶屏电视机大屏官旗', '【下单自动领劵400元】电视4S75英寸4k高清智能平板液晶屏电视机大屏官旗', '/upload/a2d9d4070950837f/99af5e09901dd62b.jpg', 10000000.00, 0.70, 0.00, 14, 1, 4288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:58:47', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 400.00, 13076, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (121, '【下单自动领劵1000元】海信（Hisense）HZ55A8 55英寸四面无边全面屏电视机', '【下单自动领劵1000元】海信（Hisense）HZ55A8 55英寸四面无边全面屏电视机', '/upload/2311642549c17f9a/79e7a29e80b4b62c.png', 10000000.00, 0.75, 0.00, 15, 1, 99999.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 17:59:23', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 80, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 1000.00, 5409, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (122, '【下单自动领劵350元】Gree/格力KFR-35GW/FNhAc 大1.5匹挂机智能变频一级空调 品悦c', '【下单自动领劵350元】Gree/格力KFR-35GW/FNhAc 大1.5匹挂机智能变频一级空调 品悦c', '/upload/9a8a2705e281684f/a3580b78c169ec0d.jpg', 10000000.00, 0.69, 0.00, 13, 1, 3688.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:00:26', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 81, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 350.00, 8864, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (123, '【下单自动领劵500元】格力(GREE) 3匹 定频 悦风 立柜式空调', '【下单自动领劵500元】格力(GREE) 3匹 定频 悦风 立柜式空调', '/upload/fd9a8dd458db0dec/4182b8db0b35af23.png', 10000000.00, 0.75, 0.00, 15, 1, 5288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:01:44', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 81, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 500.00, 9812, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (124, '【下单自动领劵300元】小天鹅（LittleSwan）洗衣机滚筒全自动', '【下单自动领劵300元】小天鹅（LittleSwan）洗衣机滚筒全自动', '/upload/ab422d3847c6f329/91b50343b7b9105f.png', 10000000.00, 0.50, 0.00, 10, 1, 3288.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:02:35', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 82, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 45419, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (125, '【下单自动领劵150元】海尔（Haier)10公斤 全自动洗衣机', '【下单自动领劵150元】海尔（Haier)10公斤 全自动洗衣机', '/upload/9c7aa584095a3613/b31ea3c3c7348c45.png', 10000000.00, 0.55, 0.00, 7, 1, 1799.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:03:29', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 82, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 150.00, 86890, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (126, '【下单自动领劵250元】韩国现代 312升大容量 法式双对开门电冰箱家用', '【下单自动领劵250元】韩国现代 312升大容量 法式双对开门电冰箱家用', '/upload/211ecb58e671a27b/55dd700896e5bd4b.png', 10000000.00, 0.55, 0.00, 7, 1, 1388.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:04:21', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 83, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 250.00, 1424, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (127, '【下单自动领劵3800元】日立（HITACHI）日本原装进口743L真空冰温保自动制冰无霜高端镜面电冰箱', '【下单自动领劵3800元】日立（HITACHI）日本原装进口743L真空冰温保自动制冰无霜高端镜面电冰箱', '/upload/05625a4ecbfae3ef/e70ae9999c1cd980.png', 10000000.00, 0.85, 0.00, 30, 1, 38500.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:05:23', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 83, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 3800.00, 4426, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (128, '【下单自动领劵120元】苏泊尔(SUPOR)破壁机 榨汁机豆浆机果汁机辅食机', '【下单自动领劵120元】苏泊尔(SUPOR)破壁机 榨汁机豆浆机果汁机辅食机', '/upload/4be12619ba3a7b48/f3fa9b58c24bddb5.png', 10000000.00, 0.55, 0.00, 7, 1, 1249.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:06:12', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 120.00, 89809, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (129, '【下单自动领劵40元】九阳（Joyoung） 电饭煲 家用智能预约米饭锅4升电饭锅', '【下单自动领劵40元】九阳（Joyoung） 电饭煲 家用智能预约米饭锅4升电饭锅', '/upload/a4a3557e8131bde3/04ffdfa646ea5e9b.png', 10000000.00, 0.60, 0.00, 5, 1, 499.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:06:48', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 40.00, 45408, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (130, '【下单自动领劵300元】九阳 Joyoung 破壁不用手洗豆浆机 破壁无渣', '【下单自动领劵300元】九阳 Joyoung 破壁不用手洗豆浆机 破壁无渣', '/upload/4889af1885741dff/cd1c9a30a95527f0.png', 10000000.00, 0.72, 0.00, 10, 1, 3299.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:07:24', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 84, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 300.00, 28832, 1, 0, 99999, 1);
INSERT INTO `lc_item` VALUES (131, '【新手专享】天堂伞 加大加固64cm*10骨三折晴雨商务伞3311E碰藏青色', '【新手专享】天堂伞 加大加固64cm*10骨三折晴雨商务伞3311E碰藏青色', '/upload/e405e70fe3e385dc/67a717eb149309ea.png', 10000000.00, 4.50, 0.00, 1, 1, 32.50, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:09:40', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 89819, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (132, '【新手专享】帕森（PARZIN ）偏光太阳镜型男经典蛤蟆镜安全驾驶墨镜', '【新手专享】帕森（PARZIN ）偏光太阳镜型男经典蛤蟆镜安全驾驶墨镜', '/upload/fb6690bd8d5371ca/56dae4031a807325.png', 10000000.00, 3.00, 0.00, 1, 1, 106.50, 99999999.99, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-13 18:10:36', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 0.00, 52618, 1, 0, 99999, 4);
INSERT INTO `lc_item` VALUES (133, '【下单自动领劵400元】飞利浦（PHILIPS）焕新奢宠挚爱套装 送女友电动牙刷电吹风脱毛仪美容器', '【下单自动领劵400元】飞利浦（PHILIPS）焕新奢宠挚爱套装 送女友电动牙刷电吹风脱毛仪美容器', '/upload/5352babcd2019544/7078bc8f915a710b.png', 10000000.00, 0.60, 0.00, 15, 1, 3960.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-14 09:58:17', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 30, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 400.00, 21676, 1, 1, 99999, 3);
INSERT INTO `lc_item` VALUES (134, '【下单自动领券299元】iQOO Neo3 5G 8GB+128GB 极昼 高通骁龙865 144Hz竞速屏 双模5G全网通手机', '【下单自动领券299元】iQOO Neo3 5G 8GB+128GB 极昼 高通骁龙865 144Hz竞速屏 双模5G全网通手机', '/upload/b79fbc414ce3c58f/70705d4e5dbcf855.jpg', 10000000.00, 0.73, 0.00, 10, 1, 2969.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-14 09:59:42', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 67, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 299.00, 52321, 1, 1, 99998, 3);
INSERT INTO `lc_item` VALUES (135, '【下单自动领劵3000元】RADO雷达表官方瑞士进口皓星系列陶瓷手表男全自动机械男腕表', '【下单自动领劵3000元】RADO雷达表官方瑞士进口皓星系列陶瓷手表男全自动机械男腕表', '/upload/38c6116fcb0016dc/8fbf8bfdf318d674.jpg', 10000000.00, 0.89, 0.00, 27, 1, 29700.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-14 10:00:37', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 56, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 3000.00, 178, 1, 1, 99999, 3);
INSERT INTO `lc_item` VALUES (136, '【下单自动领劵3978元】老铺黄金随身六字真言嘎乌盒黄金吊坠足金项链观音佛教饰品男女款', '【下单自动领劵3978元】老铺黄金随身六字真言嘎乌盒黄金吊坠足金项链观音佛教饰品男女款', '/upload/944018f6c8ca2546/b0774f02ee2cc851.jpg', 10000000.00, 0.89, 0.00, 29, 1, 39600.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-14 10:02:04', 8, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 61, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 3978.00, 35392, 1, 1, 2, 3);
INSERT INTO `lc_item` VALUES (137, '【下单自动领劵2000元】Cartier卡地亚LOVE系列项链 玫瑰金黄金白金钻石', '【下单自动领劵2000元】Cartier卡地亚LOVE系列项链 玫瑰金黄金白金钻石', '/upload/0856c56e70a0f8d2/dff0551674b938c2.jpg', 10000000.00, 0.89, 0.00, 24, 1, 19800.00, 99999999.99, 1000, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', '', '2020-08-14 10:02:46', 2, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 66, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 2000.00, 24488, 1, 1, 99999, 3);
INSERT INTO `lc_item` VALUES (138, 'VT系列中国风旗袍改良版连衣裙两件套性感吊带长裙女', '21', '/upload/88bc501a2f2b3400/0e3c2d1e59322b09.png', 10000000.00, 0.51, 0.00, 7, 1, 1000.00, 0.00, 1, '香港汇民国际担保有限公司', 0, '', 0.00, 0, 1, '', NULL, '2020-09-05 00:00:00', 1, '1', 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 88, 0.00, 0.00, 0.00, 0.00, 1, 0, 0, 98.00, 23788, 1, 0, 99999, 4);

-- ----------------------------
-- Table structure for lc_item_cart
-- ----------------------------
DROP TABLE IF EXISTS `lc_item_cart`;
CREATE TABLE `lc_item_cart`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `item_id` int(11) NULL DEFAULT NULL COMMENT '商品ID',
  `number` int(11) NULL DEFAULT NULL COMMENT '数量',
  `uid` int(11) NULL DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lc_item_class
-- ----------------------------
DROP TABLE IF EXISTS `lc_item_class`;
CREATE TABLE `lc_item_class`  (
  `id` int(50) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `img1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `note` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `color` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#000',
  `sort` int(20) NOT NULL DEFAULT 0,
  `member_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员等级id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 89 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_item_class
-- ----------------------------
INSERT INTO `lc_item_class` VALUES (2, '箱包皮具', '/upload/393332ef82fc3d79/327c50450b243775.png', '', '2020-08-10 15:52:46', '#000', 1, '8015', 0);
INSERT INTO `lc_item_class` VALUES (3, '服装服饰', '/upload/dbff5e9e6b579142/f244032426ca51fa.png', '', '2020-08-10 15:53:19', '#000', 2, '8015', 0);
INSERT INTO `lc_item_class` VALUES (4, '家居厨房', '/upload/c5ca52eb904f5695/c720e12a55a22821.png', '', '2020-08-10 15:53:58', '#000', 3, '8015', 0);
INSERT INTO `lc_item_class` VALUES (5, '内衣配饰', '/upload/7bda46fdcef163da/71c65b7df8655576.png', '', '2020-08-10 15:54:29', '#000', 4, '8015', 0);
INSERT INTO `lc_item_class` VALUES (6, '时尚鞋靴', '/upload/f8e1c02073b9e374/520231e9fc391459.png', '', '2020-08-10 15:55:03', '#000', 5, '8015', 0);
INSERT INTO `lc_item_class` VALUES (7, '美妆洗护', '/upload/9eeae8282e71930f/0da52def4b7a85d1.png', '', '2020-08-10 15:55:48', '#000', 6, '8015', 0);
INSERT INTO `lc_item_class` VALUES (8, '手表珠宝', '/upload/76f578044e7fce1e/3ace359dce9baaa7.png', '', '2020-08-10 15:56:20', '#000', 7, '8015', 0);
INSERT INTO `lc_item_class` VALUES (9, '电子数码', '/upload/6c50a7e54477892f/d4a5c02a0f3f6012.png', '', '2020-08-10 15:56:50', '#000', 8, '8015', 0);
INSERT INTO `lc_item_class` VALUES (10, '食品酒饮', '/upload/f4d545ee24d9a85f/0137fed76366e3f2.png', '', '2020-08-10 15:57:17', '#000', 9, '8015', 0);
INSERT INTO `lc_item_class` VALUES (11, '家用电器', '/upload/cfa13292651cd01b/390fa561b7f949bc.png', '', '2020-08-10 15:57:41', '#000', 10, '8015', 0);
INSERT INTO `lc_item_class` VALUES (12, '箱包皮具', '', '', '2020-08-11 09:49:09', '#000', 0, '8015', 2);
INSERT INTO `lc_item_class` VALUES (13, '皮带', '/upload/33c82d0db5646ec3/b4321bc33680bf24.jpg', '', '2020-08-11 09:49:36', '#000', 1, '8015', 12);
INSERT INTO `lc_item_class` VALUES (14, '男包', '/upload/311294f3982223bb/c738d7afa9ab5816.jpg', '', '2020-08-11 09:50:05', '#000', 2, '8015', 12);
INSERT INTO `lc_item_class` VALUES (15, '女包', '/upload/a5ae0f938c3d15b0/e089ba7120831654.jpg', '', '2020-08-11 09:50:56', '#000', 3, '8015', 12);
INSERT INTO `lc_item_class` VALUES (16, '功能箱包', '/upload/3a42b43393404c71/736fb1291c756b3a.jpg', '', '2020-08-11 10:04:31', '#000', 4, '8015', 12);
INSERT INTO `lc_item_class` VALUES (17, '男装', '', '', '2020-08-11 10:05:15', '#000', 1, '8015', 3);
INSERT INTO `lc_item_class` VALUES (18, '女装', '', '', '2020-08-11 10:05:25', '#000', 2, '8015', 3);
INSERT INTO `lc_item_class` VALUES (19, '童装', '', '', '2020-08-11 10:05:32', '#000', 3, '8015', 3);
INSERT INTO `lc_item_class` VALUES (20, 'T恤', '/upload/2795297ceaca6f0e/06bc3dc78caa6932.jpg', '', '2020-08-11 10:08:14', '#000', 0, '8015', 17);
INSERT INTO `lc_item_class` VALUES (21, '休闲裤', '/upload/484311f908800ee4/fc5102f902be7348.jpg', '', '2020-08-11 10:08:37', '#000', 0, '8015', 17);
INSERT INTO `lc_item_class` VALUES (22, '衬衫', '/upload/da1dff4a84c1d79f/86cec7eecfc5c207.jpg', '', '2020-08-11 10:09:01', '#000', 0, '8015', 17);
INSERT INTO `lc_item_class` VALUES (23, '裙装', '/upload/f1bd447363a440bc/d7326327360d9256.jpg', '', '2020-08-11 10:10:48', '#000', 0, '8015', 18);
INSERT INTO `lc_item_class` VALUES (24, '套装', '/upload/5dd28c0f738dc102/4b9629d26dccee70.jpg', '', '2020-08-11 10:11:38', '#000', 0, '8015', 19);
INSERT INTO `lc_item_class` VALUES (25, '裙子', '/upload/9318d8935dbfeb49/48c3a2841f1f297f.jpg', '', '2020-08-11 10:12:19', '#000', 0, '8015', 19);
INSERT INTO `lc_item_class` VALUES (26, 'T恤', '/upload/e2f810fa3ccbc958/66f9909b9875397c.jpg', '', '2020-08-11 10:12:55', '#000', 0, '8015', 19);
INSERT INTO `lc_item_class` VALUES (27, '家居厨房', '', '', '2020-08-11 10:13:24', '#000', 0, '8015', 4);
INSERT INTO `lc_item_class` VALUES (28, '烹饪锅具', '/upload/e449c05fae39fcbd/9a0c59f9a3a129a1.jpg', '', '2020-08-13 16:17:30', '#000', 0, '8015', 27);
INSERT INTO `lc_item_class` VALUES (29, '厨房配件', '/upload/1d0e483f889712b6/aa12843ab68571de.jpg', '', '2020-08-11 10:14:35', '#000', 0, '8015', 27);
INSERT INTO `lc_item_class` VALUES (30, '生活日用', '/upload/7063ccfff5d1a9cd/4299392a494d3b10.jpg', '', '2020-08-11 10:15:11', '#000', 0, '8015', 27);
INSERT INTO `lc_item_class` VALUES (31, '家纺', '/upload/ff053c7377305a21/c7ea9bb07a144e98.jpg', '', '2020-08-11 10:15:39', '#000', 0, '8015', 27);
INSERT INTO `lc_item_class` VALUES (32, '餐具', '/upload/168862260f7ec357/e22fc7345f167efb.jpg', '', '2020-08-11 10:17:09', '#000', 0, '8015', 27);
INSERT INTO `lc_item_class` VALUES (33, '女性内衣', '', '', '2020-08-11 10:17:40', '#000', 0, '8015', 5);
INSERT INTO `lc_item_class` VALUES (34, '男性内衣', '', '', '2020-08-11 10:17:51', '#000', 0, '8015', 5);
INSERT INTO `lc_item_class` VALUES (35, '鞋靴', '', '', '2020-08-11 10:18:13', '#000', 0, '8015', 6);
INSERT INTO `lc_item_class` VALUES (36, '美妆护肤', '', '', '2020-08-11 10:18:26', '#000', 0, '8015', 7);
INSERT INTO `lc_item_class` VALUES (37, '洗护用品', '', '', '2020-08-11 10:18:36', '#000', 0, '8015', 7);
INSERT INTO `lc_item_class` VALUES (38, '钟表', '', '', '2020-08-11 10:18:48', '#000', 0, '8015', 8);
INSERT INTO `lc_item_class` VALUES (39, '珠宝首饰', '', '', '2020-08-11 10:19:01', '#000', 0, '8015', 8);
INSERT INTO `lc_item_class` VALUES (40, '通讯设备', '', '', '2020-08-11 10:19:18', '#000', 0, '8015', 9);
INSERT INTO `lc_item_class` VALUES (41, '数码设备', '', '', '2020-08-11 10:21:27', '#000', 0, '8015', 9);
INSERT INTO `lc_item_class` VALUES (42, '电脑设备', '', '', '2020-08-11 10:21:41', '#000', 0, '8015', 9);
INSERT INTO `lc_item_class` VALUES (43, '食品酒饮', '', '', '2020-08-11 10:22:07', '#000', 0, '8015', 10);
INSERT INTO `lc_item_class` VALUES (44, '家用电器', '', '', '2020-08-11 10:22:17', '#000', 0, '8015', 11);
INSERT INTO `lc_item_class` VALUES (45, '流行男鞋', '/upload/a480d9737c10b987/cad77fcac286abac.jpg', '', '2020-08-11 11:12:06', '#000', 0, '8015', 35);
INSERT INTO `lc_item_class` VALUES (46, '时尚女鞋', '/upload/a1fa4036ef4bfcd7/54da1754a2fe83e4.jpg', '', '2020-08-11 11:13:46', '#000', 0, '8015', 35);
INSERT INTO `lc_item_class` VALUES (47, '面部护肤', '/upload/abd622730299677c/a33accfb7f528c2b.jpg', '', '2020-08-11 11:15:16', '#000', 0, '8015', 36);
INSERT INTO `lc_item_class` VALUES (48, '男士护肤', '/upload/4fe3627fb6f8c6a1/31705c9e6ba4a683.jpg', '', '2020-08-11 11:15:45', '#000', 0, '8015', 36);
INSERT INTO `lc_item_class` VALUES (49, '彩妆', '/upload/e4b1a8ea04c60e9c/fccc228d29b250a1.jpg', '', '2020-08-11 11:16:24', '#000', 0, '8015', 36);
INSERT INTO `lc_item_class` VALUES (50, '纸巾湿巾', '/upload/6e4a8755f5fdc2c5/b884c194be15e3d7.jpg', '', '2020-08-11 11:16:53', '#000', 0, '8015', 37);
INSERT INTO `lc_item_class` VALUES (51, '女性护理', '/upload/ed5cb6f474140c35/b2a0af9d9f195eed.jpg', '', '2020-08-11 11:17:19', '#000', 0, '8015', 37);
INSERT INTO `lc_item_class` VALUES (52, '衣物清洁', '/upload/0d3d202b4d6ae059/1c66148d0ce58a90.jpg', '', '2020-08-11 11:17:40', '#000', 0, '8015', 37);
INSERT INTO `lc_item_class` VALUES (53, '洗发护发', '/upload/441c253f2c5c8474/268671ebf85d1aab.jpg', '', '2020-08-11 11:18:49', '#000', 0, '8015', 37);
INSERT INTO `lc_item_class` VALUES (54, '身体护理', '/upload/a69c5bb5614fc7c8/1da76dd10f029a32.jpg', '', '2020-08-11 11:19:12', '#000', 0, '8015', 37);
INSERT INTO `lc_item_class` VALUES (55, '口腔护理', '/upload/1efc05af9451e366/2fcb87af2836e775.jpg', '', '2020-08-11 11:19:28', '#000', 0, '8015', 37);
INSERT INTO `lc_item_class` VALUES (56, '智能手表', '/upload/96744c480af0c9f9/43989047d5c2b7c7.jpg', '', '2020-08-11 11:26:25', '#000', 0, '8015', 38);
INSERT INTO `lc_item_class` VALUES (57, '挂钟', '/upload/baa0a1e940dd1461/e5003103dacc1bc1.jpg', '', '2020-08-11 11:26:53', '#000', 0, '8015', 38);
INSERT INTO `lc_item_class` VALUES (58, '瑞表', '/upload/a822d3faf0e5a4b7/6e611680a2dbdccb.jpg', '', '2020-08-11 11:27:18', '#000', 0, '8015', 38);
INSERT INTO `lc_item_class` VALUES (59, '日韩表', '/upload/b72173d7b387f625/916cb1477a77fc34.jpg', '', '2020-08-11 11:27:48', '#000', 0, '8015', 38);
INSERT INTO `lc_item_class` VALUES (60, '闹钟', '/upload/1efd3090d07008d7/a1a33b4acd6add33.jpg', '', '2020-08-11 11:28:17', '#000', 0, '8015', 38);
INSERT INTO `lc_item_class` VALUES (61, '黄金首饰', '/upload/9992e1e9e32fdbbd/4df868779acdba7a.jpg', '', '2020-08-11 11:28:50', '#000', 0, '8015', 39);
INSERT INTO `lc_item_class` VALUES (62, '白银首饰', '/upload/a2adfe6eb9b09faf/eb2a70622d622438.jpg', '', '2020-08-11 11:29:04', '#000', 0, '8015', 39);
INSERT INTO `lc_item_class` VALUES (63, '手串把件', '/upload/c24aec55091e07b8/a75a6053d09646a3.jpg', '', '2020-08-11 11:29:21', '#000', 0, '8015', 39);
INSERT INTO `lc_item_class` VALUES (64, '投资金属', '/upload/4880c65797a751d7/18129a6945acb5ed.jpg', '', '2020-08-11 11:29:46', '#000', 0, '8015', 39);
INSERT INTO `lc_item_class` VALUES (65, '翡翠首饰', '/upload/823d1403f7068979/23b598c91c5469ed.jpg', '', '2020-08-11 11:30:11', '#000', 0, '8015', 39);
INSERT INTO `lc_item_class` VALUES (66, '钻石首饰', '/upload/1c3809f2cc7fa411/ba0e867940e315f6.jpg', '', '2020-08-11 11:30:34', '#000', 0, '8015', 39);
INSERT INTO `lc_item_class` VALUES (67, '手机', '/upload/b64e65356c8799e6/aac87f7bba0b21b0.jpg', '', '2020-08-11 11:33:12', '#000', 0, '8015', 40);
INSERT INTO `lc_item_class` VALUES (68, '手机配件', '/upload/2560e6f06470b680/20653f7de1ef2d7b.jpg', '', '2020-08-11 11:33:32', '#000', 0, '8015', 40);
INSERT INTO `lc_item_class` VALUES (69, '摄像摄影', '/upload/a5efc3aee68a7c4d/569fcb3ac643815c.jpg', '', '2020-08-11 11:34:04', '#000', 0, '8015', 41);
INSERT INTO `lc_item_class` VALUES (70, '影音娱乐', '/upload/ad6a1b8dd23ab725/4dcb4de60d9c5f5d.jpg', '', '2020-08-11 11:34:49', '#000', 0, '8015', 41);
INSERT INTO `lc_item_class` VALUES (71, '数码配件', '/upload/d0170e21a87de68e/882b1e5a33c84cfe.jpg', '', '2020-08-11 11:35:16', '#000', 0, '8015', 41);
INSERT INTO `lc_item_class` VALUES (72, '笔记本电脑', '/upload/e7234057df9ff622/a843381216629695.jpg', '', '2020-08-11 11:35:40', '#000', 0, '8015', 42);
INSERT INTO `lc_item_class` VALUES (73, '台式机', '/upload/19db685542f0d0a9/c9b9360996942aff.jpg', '', '2020-08-11 11:36:05', '#000', 0, '8015', 42);
INSERT INTO `lc_item_class` VALUES (74, '外设产品', '/upload/5a790c36f2bc04b4/b27aac2e5c2df850.jpg', '', '2020-08-11 11:36:30', '#000', 0, '8015', 42);
INSERT INTO `lc_item_class` VALUES (75, '网络产品', '/upload/d9b037cfa8eaffb1/08fe3c01b045c745.jpg', '', '2020-08-11 11:36:59', '#000', 0, '8015', 42);
INSERT INTO `lc_item_class` VALUES (76, '办公设备', '/upload/e82b0d21aca09393/febd183b1fab11f6.jpg', '', '2020-08-11 11:37:24', '#000', 0, '8015', 42);
INSERT INTO `lc_item_class` VALUES (77, '中外名酒', '/upload/c41753c207d572d0/e5955829263b4d6e.jpg', '', '2020-08-11 11:38:11', '#000', 0, '8015', 43);
INSERT INTO `lc_item_class` VALUES (78, '牛奶乳品', '/upload/52386363698a0675/0cb60654c5556be8.jpg', '', '2020-08-11 11:38:53', '#000', 0, '8015', 43);
INSERT INTO `lc_item_class` VALUES (79, '茗茶', '/upload/a010677af37180fb/2d86c208ec224150.jpg', '', '2020-08-11 11:39:17', '#000', 0, '8015', 43);
INSERT INTO `lc_item_class` VALUES (80, '电视', '/upload/4f0142dc6dc231aa/80e3c8c202b0c970.jpg', '', '2020-08-11 11:41:05', '#000', 0, '8015', 44);
INSERT INTO `lc_item_class` VALUES (81, '空调', '/upload/c9f774694de01c88/ac114591242c96bc.jpg', '', '2020-08-11 11:41:25', '#000', 0, '8015', 44);
INSERT INTO `lc_item_class` VALUES (82, '洗衣机', '/upload/0157f8e116de5bee/cd1d03ef63aeb7aa.jpg', '', '2020-08-11 11:41:43', '#000', 0, '8015', 44);
INSERT INTO `lc_item_class` VALUES (83, '冰箱', '/upload/e7a7408acfa58df2/0be8a481ad2458ee.jpg', '', '2020-08-11 11:42:03', '#000', 0, '8015', 44);
INSERT INTO `lc_item_class` VALUES (84, '厨房小电', '/upload/2a7c1ec9df15c2f2/afd0952cd52ce090.jpg', '', '2020-08-11 11:42:27', '#000', 0, '8015', 44);
INSERT INTO `lc_item_class` VALUES (85, '文胸', '/upload/2488703b6d626e77/104ee34243ef9c20.jpg', '', '2020-08-13 16:33:46', '#000', 0, '8015', 33);
INSERT INTO `lc_item_class` VALUES (86, '内裤', '/upload/43d25ded809bf77c/9a13a6b1c840964e.jpg', '', '2020-08-13 16:34:03', '#000', 0, '8015', 33);
INSERT INTO `lc_item_class` VALUES (87, '内裤', '/upload/f258e0733ea534a5/5bc24e95ae5b492a.jpg', '', '2020-08-13 16:34:36', '#000', 0, '8015', 34);
INSERT INTO `lc_item_class` VALUES (88, '女套装', '/upload/031b7b18a009cbf2/b8824983729b5b2c.png', '', '2020-09-06 10:36:38', '#000', 0, '', 18);

-- ----------------------------
-- Table structure for lc_item_type
-- ----------------------------
DROP TABLE IF EXISTS `lc_item_type`;
CREATE TABLE `lc_item_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_item_type
-- ----------------------------
INSERT INTO `lc_item_type` VALUES (1, '每日返息,到期还本');
INSERT INTO `lc_item_type` VALUES (2, '每周返息,到期还本');
INSERT INTO `lc_item_type` VALUES (3, '每月返息,到期还本');
INSERT INTO `lc_item_type` VALUES (4, '每日复利,保本保息');
INSERT INTO `lc_item_type` VALUES (5, '到期还本还息');
INSERT INTO `lc_item_type` VALUES (6, '当天投资,当天还款付息');

-- ----------------------------
-- Table structure for lc_msg
-- ----------------------------
DROP TABLE IF EXISTS `lc_msg`;
CREATE TABLE `lc_msg`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收账号',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '消息内容',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `top` int(1) NULL DEFAULT 0 COMMENT '置顶',
  `status` int(1) NULL DEFAULT 0 COMMENT '0 未读 1已读',
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_msg
-- ----------------------------
INSERT INTO `lc_msg` VALUES (1, 0, '亲爱的用户欢迎来到又实惠', '', '<p>尊敬的用户下午好，感谢您下载【又实惠】，注册即送18元红包哦，点击APP首页新人福利（实名后即可领取代金券）每日签到1元，参与每日一单福利商品可获得1元佣金，微信分享每日1元，达到200元即可进行提现操作，连续签到和周末签到发放大量代金券最高2000元（代金券=本金）更多福利豪礼尽在叮咚好省。（如在操作的过程中遇到任何问题请及时联系在线客服进行咨询）</p>\r\n', 0, 0, 0, '2020-09-06 14:03:32');

-- ----------------------------
-- Table structure for lc_msg_is
-- ----------------------------
DROP TABLE IF EXISTS `lc_msg_is`;
CREATE TABLE `lc_msg_is`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) NOT NULL DEFAULT 0,
  `uid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of lc_msg_is
-- ----------------------------
INSERT INTO `lc_msg_is` VALUES (1, 1, 34471);

-- ----------------------------
-- Table structure for lc_prize
-- ----------------------------
DROP TABLE IF EXISTS `lc_prize`;
CREATE TABLE `lc_prize`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `credit` int(11) NOT NULL DEFAULT 0 COMMENT '所需积分',
  `endtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `rule` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '抽奖规则',
  `content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '抽奖记录',
  `name1` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '一等奖' COMMENT '一等奖名称',
  `type1` int(11) NOT NULL DEFAULT 1 COMMENT '奖品类型，1现金/2余额',
  `money1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
  `odds1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '一等奖中奖概率',
  `reason1` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '一等奖描述' COMMENT '一等奖描述',
  `name2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '二等奖' COMMENT '二等奖名称',
  `type2` int(11) NOT NULL DEFAULT 1 COMMENT '奖品类型，1现金/2余额',
  `money2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
  `odds2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '二等奖中奖概率',
  `reason2` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '二等奖描述' COMMENT '二等奖描述',
  `name3` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '三等奖' COMMENT '三等奖名称',
  `type3` int(11) NOT NULL DEFAULT 1 COMMENT '奖品类型，1现金/2余额',
  `money3` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
  `odds3` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '三等奖中奖概率',
  `reason3` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '三等奖描述' COMMENT '三等奖描述',
  `name4` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '四等奖' COMMENT '四等奖名称',
  `type4` int(11) NOT NULL DEFAULT 1 COMMENT '奖品类型，1现金/2余额',
  `money4` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
  `odds4` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '四等奖中奖概率',
  `reason4` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '四等奖描述' COMMENT '四等奖描述',
  `name5` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '五等奖' COMMENT '五等奖名称',
  `type5` int(11) NOT NULL DEFAULT 1 COMMENT '奖品类型，1现金/2余额',
  `money5` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
  `odds5` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '五等奖中奖概率',
  `reason5` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '五等奖描述' COMMENT '五等奖描述',
  `name6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '六等奖' COMMENT '六等奖名称',
  `type6` int(255) NOT NULL DEFAULT 1,
  `money6` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `odds6` decimal(11, 2) NOT NULL DEFAULT 0.00,
  `reason6` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_prize
-- ----------------------------
INSERT INTO `lc_prize` VALUES (1, 0, '2020-05-31 19:39:00', '<p>凡是投资指定项目的用户均可获得一次抽奖机会，抽奖机会可以累加！ 抽中现金的用户，奖金将自动打款到您的余额，您可以自行提现或者进行投资； 抽中实物的用户，请联系在线客服进行兑换，联系时请备注您的会员账号，以便客服查验。</p>\r\n', '', '8888元', 1, 8888.00, 0.00, '恭喜您获得价8888元现金大礼，已派送至您的会员账户！', '2020元', 1, 2020.00, 0.25, '恭喜您获得价2020元现金大礼，已派送至您的会员账户！', '888元', 1, 888.00, 0.80, '恭喜您获得价888元现金大礼，已派送至您的会员账户！', '88元', 1, 88.00, 10.00, '恭喜您获得价88元现金，已派送至您的会员账户！', '18元', 1, 18.00, 70.00, '恭喜你获得现金18元，已派送至您的会员账户！', '谢谢参与', 1, 0.00, 10.00, '谢谢参与');

-- ----------------------------
-- Table structure for lc_prize_list
-- ----------------------------
DROP TABLE IF EXISTS `lc_prize_list`;
CREATE TABLE `lc_prize_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `item` int(11) NOT NULL DEFAULT 0 COMMENT '中奖编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '中奖名称',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '中奖类型',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '中奖金额',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '抽奖时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_prize_list
-- ----------------------------
INSERT INTO `lc_prize_list` VALUES (1, 34471, 5, '18元', 1, 18.00, '2020-05-12 23:04:06');
INSERT INTO `lc_prize_list` VALUES (2, 34471, 5, '18元', 1, 18.00, '2020-05-14 23:03:30');
INSERT INTO `lc_prize_list` VALUES (3, 34471, 5, '18元', 1, 18.00, '2020-05-14 23:03:57');

-- ----------------------------
-- Table structure for lc_qrcode
-- ----------------------------
DROP TABLE IF EXISTS `lc_qrcode`;
CREATE TABLE `lc_qrcode`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `uid` int(11) NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `reward` int(10) NOT NULL,
  `bag` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 63 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_qrcode
-- ----------------------------
INSERT INTO `lc_qrcode` VALUES (61, NULL, 2, 34471, '2020-07-16 10:22:30', NULL, '13800138000', 3, 2);
INSERT INTO `lc_qrcode` VALUES (62, NULL, 2, 34471, '2020-07-16 10:22:45', NULL, '13800138000', 3, 2);

-- ----------------------------
-- Table structure for lc_recharge
-- ----------------------------
DROP TABLE IF EXISTS `lc_recharge`;
CREATE TABLE `lc_recharge`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '充值金额',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '付款方式',
  `orderid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '订单编号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '充值状态，0未充值/1已充值',
  `warn` int(11) NOT NULL DEFAULT 0 COMMENT '充值提醒',
  `reason` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '充值摘要',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '提交时间',
  `time2` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_reward
-- ----------------------------
DROP TABLE IF EXISTS `lc_reward`;
CREATE TABLE `lc_reward`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `register` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '用户注册',
  `register2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '邀请注册',
  `recharge` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '充值奖励',
  `invest1` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '投资一级奖励',
  `invest2` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '投资二级奖励',
  `invest3` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '投资三级奖励',
  `qiandao` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '每日签到奖励',
  `registerzzz` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0.00' COMMENT '用户注册',
  `shimingsong` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '每日签到奖励',
  `seetime` int(11) NOT NULL DEFAULT 0 COMMENT '观看时间',
  `newsmoney` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '观看新闻领取金额',
  `getnum` int(11) NOT NULL DEFAULT 0 COMMENT '新闻领取次数',
  `isobse` int(255) NOT NULL DEFAULT 0 COMMENT '新闻开关',
  `isvoucher` int(255) NOT NULL DEFAULT 0 COMMENT '抵用券开关',
  `voucher` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '抵用券金额',
  `vouchernum` int(11) NULL DEFAULT 0 COMMENT '首次注册送抵用券数量',
  `newsmoneytwo` decimal(10, 2) NOT NULL,
  `new_reward` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '新人福利奖励',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_reward
-- ----------------------------
INSERT INTO `lc_reward` VALUES (1, 48.00, 0.00, 0.00, 2.00, 1.00, 0.50, 2.22, '0', 1.00, 0, 0.00, 0, 0, 0, 0.00, 0, 0.00, 20.00);

-- ----------------------------
-- Table structure for lc_see_log
-- ----------------------------
DROP TABLE IF EXISTS `lc_see_log`;
CREATE TABLE `lc_see_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `dateline` bigint(20) NOT NULL,
  `money` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for lc_share
-- ----------------------------
DROP TABLE IF EXISTS `lc_share`;
CREATE TABLE `lc_share`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `money` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '文章类型',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '关键词',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '时间',
  `sort` int(11) NOT NULL DEFAULT 0,
  `share` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_share
-- ----------------------------
INSERT INTO `lc_share` VALUES (1, '分享微信朋友圈', 1.00, '/upload/c449d4aac6f19db4/ae1d225bb543691c.jpg', '购物神器，下单全额返，注册即送18元，每日签到再送1元，连续签到最高可得2000元代金劵，我已经领取了你呢？', '2020-09-04 12:01:44', 0, '/upload/81341ca993c9e9d3/86c7c32109a00ef0.jpg', '【分享操作流程】：进入分享渠道点击“立即分享”一键保存分享文案和个人二维码海报于手机相册内，登入微信朋友圈进行粘贴分享已保存的文案和海报，分享成功截屏朋友圈返回商城“上传图片”即可获得分享奖励。<每日限一次>');

-- ----------------------------
-- Table structure for lc_share_list
-- ----------------------------
DROP TABLE IF EXISTS `lc_share_list`;
CREATE TABLE `lc_share_list`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `sid` int(11) NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_shop
-- ----------------------------
DROP TABLE IF EXISTS `lc_shop`;
CREATE TABLE `lc_shop`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '标题',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '类型,1现金/2实物',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '积分送现金',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '所需积分',
  `num` int(11) NOT NULL DEFAULT 0 COMMENT '剩余数量',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'noimg.jpg' COMMENT '封面',
  `content` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `cid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_shop
-- ----------------------------
INSERT INTO `lc_shop` VALUES (1, '芒果', 2, 9999.00, 3000000, 997, '/upload/bb98261db4acebf3/64bd0b7b00fe7d2d.jpg', '<p>新鲜大芒果</p>\r\n', 0, 1);
INSERT INTO `lc_shop` VALUES (2, '苹果', 2, 0.00, 2999989, 999, '/upload/7262def6495c693a/c789282a9e783fdf.jpg', '<p>新鲜大苹果</p>\r\n', 0, 1);
INSERT INTO `lc_shop` VALUES (4, '榴莲', 2, 0.00, 99999, 993, '/upload/cdeca8a095a4733d/de8485abc1642aa6.jpg', '<p>榴莲</p>\r\n', 0, 1);

-- ----------------------------
-- Table structure for lc_shop_class
-- ----------------------------
DROP TABLE IF EXISTS `lc_shop_class`;
CREATE TABLE `lc_shop_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `show` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示，0不显示/1显示',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'help' COMMENT '类型图标',
  `add_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_shop_class
-- ----------------------------
INSERT INTO `lc_shop_class` VALUES (1, '水果', 0, 0, '/upload/2c4d82cdae6dba65/f51c4214f7ed5a34.jpg', '2020-05-16 12:55:43');

-- ----------------------------
-- Table structure for lc_shop_order
-- ----------------------------
DROP TABLE IF EXISTS `lc_shop_order`;
CREATE TABLE `lc_shop_order`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员ID',
  `gid` int(11) NOT NULL DEFAULT 0 COMMENT '商品ID',
  `goods` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '商品名称',
  `img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'noimg.jpg' COMMENT '商品图片',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '商品类型',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '兑换现金',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '兑换时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '兑换状态：0未发货;已发货',
  `num` int(11) NULL DEFAULT 1 COMMENT '商品数量',
  `courier_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `customer_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `customer_tel` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lc_sign_reward
-- ----------------------------
DROP TABLE IF EXISTS `lc_sign_reward`;
CREATE TABLE `lc_sign_reward`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `days` int(10) NULL DEFAULT NULL,
  `reward_type` tinyint(1) NULL DEFAULT 1 COMMENT '奖励类型：1红包;2代金券',
  `reward_num` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '奖励金额',
  `coupon_day` int(10) NULL DEFAULT 3 COMMENT '奖励代金券有效期',
  `coupon_xid` int(11) NULL DEFAULT 0 COMMENT '代金券指定商品ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of lc_sign_reward
-- ----------------------------
INSERT INTO `lc_sign_reward` VALUES (1, 3, 1, 8.00, 0, 0);
INSERT INTO `lc_sign_reward` VALUES (2, 7, 2, 58.00, 3, 0);
INSERT INTO `lc_sign_reward` VALUES (3, 15, 2, 188.00, 3, 0);
INSERT INTO `lc_sign_reward` VALUES (4, 20, 2, 288.00, 3, 0);
INSERT INTO `lc_sign_reward` VALUES (5, 25, 2, 388.00, 3, 0);
INSERT INTO `lc_sign_reward` VALUES (6, 30, 2, 588.00, 3, 97);
INSERT INTO `lc_sign_reward` VALUES (7, 50, 2, 1088.00, 5, 95);

-- ----------------------------
-- Table structure for lc_slide
-- ----------------------------
DROP TABLE IF EXISTS `lc_slide`;
CREATE TABLE `lc_slide`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `path` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#' COMMENT '图片路径',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '#' COMMENT '图片链接',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '图片类型，1电脑/2手机',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `show` int(11) NOT NULL DEFAULT 0 COMMENT '显示，0不显示/1显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_slide
-- ----------------------------
INSERT INTO `lc_slide` VALUES (3, '/upload/abf5bf299e4c74aa/0992a6db24d25e81.jpg', '#', 0, 0, 1);
INSERT INTO `lc_slide` VALUES (4, '/upload/60c40023e53fa740/dacfcf6011314ab9.jpg', '#', 0, 0, 1);
INSERT INTO `lc_slide` VALUES (5, '/upload/6d2dc3c45e12b2e3/5d1b6392c5930737.jpg', '#', 0, 0, 1);

-- ----------------------------
-- Table structure for lc_sms
-- ----------------------------
DROP TABLE IF EXISTS `lc_sms`;
CREATE TABLE `lc_sms`  (
  `id` int(10) UNSIGNED NOT NULL COMMENT '序号',
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '短信类型',
  `msg` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '内容',
  `code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '编码',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '短息状态',
  `template_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_sms
-- ----------------------------
INSERT INTO `lc_sms` VALUES (1, '用户注册', '您的验证码是###，如非本人操作，请忽略本短信', '18001', 1, '');
INSERT INTO `lc_sms` VALUES (2, '投资成功', '您购买的“###”项目已成功！', '18002', 0, NULL);
INSERT INTO `lc_sms` VALUES (3, '收益提醒', '您的收益###元已到账，请登录会员中心查看！', '18003', 0, NULL);
INSERT INTO `lc_sms` VALUES (4, '找回密码', '您本次找回密码的验证码是：###，如非本人操作，请忽略本信息！', '18004', 1, NULL);
INSERT INTO `lc_sms` VALUES (5, '充值成功提醒', '您充值的###元已到账，请登入会员中心查收！', '18005', 0, NULL);
INSERT INTO `lc_sms` VALUES (6, '充值失败提醒', '尊敬的会员：您充值的###元未支付成功，请提交订单后用微　信支付宝或手机银行进行付款，支付对应金额（请忽略风控提示放心支付），如有疑问，请咨询在线客服！', '18006', 0, NULL);
INSERT INTO `lc_sms` VALUES (7, '提现成功提醒', '您申请的提现###元已到账，请您核实查收！', '18007', 0, NULL);
INSERT INTO `lc_sms` VALUES (8, '提现失败提现', '您申请的提现###元未成功，请联系在线客服！', '18008', 0, NULL);
INSERT INTO `lc_sms` VALUES (9, '提现确定短信', '您的提现验证码是：###，如非本人操作，请忽泄露信息！', '18009', 0, NULL);

-- ----------------------------
-- Table structure for lc_sms_list
-- ----------------------------
DROP TABLE IF EXISTS `lc_sms_list`;
CREATE TABLE `lc_sms_list`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '手机号码',
  `msg` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '短信记录',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '返回代码',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT 'IP',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '短信记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_sms_list
-- ----------------------------
INSERT INTO `lc_sms_list` VALUES (1, '13824453454', '【得宝网络】您的验证码是5746，如非本人操作，请忽略本短信', '短信所使用签名场景非法#未知错误', '5746', '2020-12-07 13:53:37');
INSERT INTO `lc_sms_list` VALUES (2, '13824453455', '【得宝网络】您的验证码是4596，如非本人操作，请忽略本短信', '短信所使用签名场景非法#未知错误', '4596', '2020-12-07 13:54:11');
INSERT INTO `lc_sms_list` VALUES (3, '13824453457', '【得宝网络】您的验证码是3101，如非本人操作，请忽略本短信', '短信所使用签名场景非法#未知错误', '3101', '2020-12-07 13:54:51');

-- ----------------------------
-- Table structure for lc_user
-- ----------------------------
DROP TABLE IF EXISTS `lc_user`;
CREATE TABLE `lc_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '手机号 账号',
  `alipay` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '身份证号码',
  `auth` int(11) NOT NULL DEFAULT 0 COMMENT '是否认证,0未认证/1已认证',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '登录密码',
  `password2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '交易密码',
  `top` int(11) NOT NULL DEFAULT 0 COMMENT '推荐人',
  `qq` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'qq',
  `member` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `frozenmoney` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '冻结金额',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT '成长值',
  `income` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总收益金额',
  `logintime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '登录时间',
  `clock` int(11) NOT NULL DEFAULT 0 COMMENT '是否锁定,0否/1是',
  `qiandao` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '签到时间',
  `integral` int(11) NOT NULL DEFAULT 0 COMMENT '积分',
  `prize` int(11) NOT NULL DEFAULT 0 COMMENT '抽奖次数',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT 'IP',
  `time` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '注册时间',
  `mwpassword` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '登录密码',
  `mwpassword2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `country` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '国家',
  `region` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '省份',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '城市',
  `county` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '县',
  `msgcount` int(11) NULL DEFAULT 0 COMMENT '未读消息',
  `qdnum` int(10) NULL DEFAULT 0 COMMENT '签到次数',
  `water` int(10) NOT NULL DEFAULT 1 COMMENT '浇水次数',
  `manure` int(10) NOT NULL DEFAULT 0 COMMENT '施肥次数',
  `tree` int(11) NOT NULL DEFAULT 0 COMMENT '树等级',
  `tree_progress` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '种树进度',
  `baoku_money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '宝库余额',
  `baoku_update_time` int(11) NULL DEFAULT 0 COMMENT '宝库更新时间',
  `is_new_reward` tinyint(1) NULL DEFAULT 0 COMMENT '是否领取新人福利',
  `reward` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '累计奖励',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34487 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_user
-- ----------------------------
INSERT INTO `lc_user` VALUES (34471, '13800138000', '13800138000@qq.com', '李可乐', '41020419940127201X', 1, 'e10adc3949ba59abbe56e057f20f883e', '00c66aaf5f2c3f49946f15c1ad2ea0d3', 0, '0', 8003, 11645.23, 0.00, 16164, 755.80, '1607320980', 1, '2020-09-08 10:30:25', 603641, 99, '112.250.201.100', '2020-04-15 14:40:34', '123456', '123455', '', '', '', '', -138, 9, 8, 15, 5, 10.00, 0.00, 0, 1, 14.66);

-- ----------------------------
-- Table structure for lc_user_member
-- ----------------------------
DROP TABLE IF EXISTS `lc_user_member`;
CREATE TABLE `lc_user_member`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '序号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '无' COMMENT '等级名称',
  `value` int(11) NOT NULL DEFAULT 0 COMMENT '等级积分',
  `rate` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '等级加息利率',
  `discount` decimal(10, 2) NULL DEFAULT 100.00 COMMENT '折扣',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8016 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_user_member
-- ----------------------------
INSERT INTO `lc_user_member` VALUES (8003, 'VIP1', 5000, 0.02, 99.00);
INSERT INTO `lc_user_member` VALUES (8004, 'VIP2', 30000, 0.05, 98.00);
INSERT INTO `lc_user_member` VALUES (8008, 'VIP3', 80000, 0.10, 97.00);
INSERT INTO `lc_user_member` VALUES (8009, 'VIP4', 100000, 0.30, 96.00);
INSERT INTO `lc_user_member` VALUES (8010, 'VIP5', 2000000, 0.50, 95.00);
INSERT INTO `lc_user_member` VALUES (8011, 'VIP6', 5000000, 1.00, 94.00);
INSERT INTO `lc_user_member` VALUES (8012, 'VIP7', 1000000, 3.00, 93.00);
INSERT INTO `lc_user_member` VALUES (8014, 'VIP8', 5000000, 5.00, 92.00);
INSERT INTO `lc_user_member` VALUES (8015, '普通会员', 0, 0.00, 100.00);

-- ----------------------------
-- Table structure for lc_user_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `lc_user_sign_log`;
CREATE TABLE `lc_user_sign_log`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lc_user_sign_log
-- ----------------------------
INSERT INTO `lc_user_sign_log` VALUES (1, '2020-09-03', 34471);
INSERT INTO `lc_user_sign_log` VALUES (2, '2020-09-04', 34471);
INSERT INTO `lc_user_sign_log` VALUES (5, '2020-09-05', 34471);
INSERT INTO `lc_user_sign_log` VALUES (6, '2020-09-05', 34485);
INSERT INTO `lc_user_sign_log` VALUES (7, '2020-09-05', 34486);
INSERT INTO `lc_user_sign_log` VALUES (8, '2020-09-06', 34471);
INSERT INTO `lc_user_sign_log` VALUES (9, '2020-09-08', 34471);

-- ----------------------------
-- Table structure for lc_voucher
-- ----------------------------
DROP TABLE IF EXISTS `lc_voucher`;
CREATE TABLE `lc_voucher`  (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `money` decimal(10, 0) NOT NULL DEFAULT 0 COMMENT '优惠券金额',
  `dateline` bigint(20) NOT NULL COMMENT '领取时间',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1未使用  2已使用',
  `xid` int(11) NULL DEFAULT NULL COMMENT '投资项目ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '投资项目标题',
  PRIMARY KEY (`vid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '权限状态',
  `sort` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '排序权重',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_auth_status`(`status`) USING BTREE,
  INDEX `idx_system_auth_title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES (1, '审核人员', 1, 0, '审核人员', '2020-05-12 23:19:42');

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '角色',
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_auth_auth`(`auth`) USING BTREE,
  INDEX `idx_system_auth_node`(`node`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-权限-授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置名',
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_config_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 93 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'app_name', '商城');
INSERT INTO `system_config` VALUES (2, 'site_name', '商城返佣源码-仅供学习研究，请勿用于其他用途');
INSERT INTO `system_config` VALUES (3, 'app_version', 'TP5.3');
INSERT INTO `system_config` VALUES (4, 'site_copy', '©版权所有 2014-2020 商城');
INSERT INTO `system_config` VALUES (5, 'site_icon', '/upload/decb0fe26fa3f486/b3f6521bf29403c8.png');
INSERT INTO `system_config` VALUES (7, 'miitbeian', '粤ICP备88888888号-8');
INSERT INTO `system_config` VALUES (8, 'storage_type', 'local');
INSERT INTO `system_config` VALUES (9, 'storage_local_exts', 'jpg,png');
INSERT INTO `system_config` VALUES (10, 'storage_qiniu_bucket', 'https');
INSERT INTO `system_config` VALUES (11, 'storage_qiniu_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES (12, 'storage_qiniu_access_key', '用你自己的吧');
INSERT INTO `system_config` VALUES (13, 'storage_qiniu_secret_key', '用你自己的吧');
INSERT INTO `system_config` VALUES (14, 'storage_oss_bucket', 'cuci-mytest');
INSERT INTO `system_config` VALUES (15, 'storage_oss_endpoint', 'oss-cn-hangzhou.aliyuncs.com');
INSERT INTO `system_config` VALUES (16, 'storage_oss_domain', '用你自己的吧');
INSERT INTO `system_config` VALUES (17, 'storage_oss_keyid', '用你自己的吧');
INSERT INTO `system_config` VALUES (18, 'storage_oss_secret', '用你自己的吧');
INSERT INTO `system_config` VALUES (36, 'storage_oss_is_https', 'http');
INSERT INTO `system_config` VALUES (43, 'storage_qiniu_region', '华东');
INSERT INTO `system_config` VALUES (44, 'storage_qiniu_is_https', 'https');
INSERT INTO `system_config` VALUES (45, 'wechat_mch_id', '1332187001');
INSERT INTO `system_config` VALUES (46, 'wechat_mch_key', 'A82DC5BD1F3359081049C568D8502BC5');
INSERT INTO `system_config` VALUES (47, 'wechat_mch_ssl_type', 'p12');
INSERT INTO `system_config` VALUES (48, 'wechat_mch_ssl_p12', '65b8e4f56718182d/1bc857ee646aa15d.p12');
INSERT INTO `system_config` VALUES (49, 'wechat_mch_ssl_key', 'cc2e3e1345123930/c407d033294f283d.pem');
INSERT INTO `system_config` VALUES (50, 'wechat_mch_ssl_cer', '966eaf89299e9c95/7014872cc109b29a.pem');
INSERT INTO `system_config` VALUES (51, 'wechat_token', 'mytoken');
INSERT INTO `system_config` VALUES (52, 'wechat_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES (53, 'wechat_appsecret', '9978422e0e431643d4b42868d183d60b');
INSERT INTO `system_config` VALUES (54, 'wechat_encodingaeskey', '');
INSERT INTO `system_config` VALUES (55, 'wechat_push_url', '消息推送地址：http://127.0.0.1:8000/wechat/api.push');
INSERT INTO `system_config` VALUES (56, 'wechat_type', 'thr');
INSERT INTO `system_config` VALUES (57, 'wechat_thr_appid', 'wx60a43dd8161666d4');
INSERT INTO `system_config` VALUES (58, 'wechat_thr_appkey', '5caf4b0727f6e46a7e6ccbe773cc955d');
INSERT INTO `system_config` VALUES (60, 'wechat_thr_appurl', '消息推送地址：http://127.0.0.1:2314/wechat/api.push');
INSERT INTO `system_config` VALUES (61, 'component_appid', 'wx28b58798480874f9');
INSERT INTO `system_config` VALUES (62, 'component_appsecret', '8d0e1ec14ea0adc5027dd0ad82c64bc9');
INSERT INTO `system_config` VALUES (63, 'component_token', 'P8QHTIxpBEq88IrxatqhgpBm2OAQROkI');
INSERT INTO `system_config` VALUES (64, 'component_encodingaeskey', 'L5uFIa0U6KLalPyXckyqoVIJYLhsfrg8k9YzybZIHsx');
INSERT INTO `system_config` VALUES (65, 'system_message_state', '0');
INSERT INTO `system_config` VALUES (66, 'sms_zt_username', '可以找CUCI申请');
INSERT INTO `system_config` VALUES (67, 'sms_zt_password', '可以找CUCI申请');
INSERT INTO `system_config` VALUES (68, 'sms_reg_template', '您的验证码为{code}，请在十分钟内完成操作！');
INSERT INTO `system_config` VALUES (69, 'sms_secure', '可以找CUCI申请');
INSERT INTO `system_config` VALUES (70, 'store_title', '测试商城');
INSERT INTO `system_config` VALUES (71, 'store_order_wait_time', '0.50');
INSERT INTO `system_config` VALUES (72, 'store_order_clear_time', '24.00');
INSERT INTO `system_config` VALUES (73, 'store_order_confirm_time', '60.00');
INSERT INTO `system_config` VALUES (74, 'sms_zt_username2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES (75, 'sms_zt_password2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES (76, 'sms_secure2', '可以找CUCI申请2');
INSERT INTO `system_config` VALUES (77, 'sms_reg_template2', '您的验证码为{code}，请在十分钟内完成操作！2');
INSERT INTO `system_config` VALUES (78, 'michat_appid', '2882303761518074614');
INSERT INTO `system_config` VALUES (79, 'michat_appkey', '5861807470614');
INSERT INTO `system_config` VALUES (80, 'michat_appsecert', 'CP/WUTUgDuyOxgLQ5ztesg==');
INSERT INTO `system_config` VALUES (81, '_token_', 'csrf5fcdc56c2e01b');
INSERT INTO `system_config` VALUES (82, 'yunpian_key', '');
INSERT INTO `system_config` VALUES (83, 'yunpian_sign', '');
INSERT INTO `system_config` VALUES (84, 'kuaidi_key', '');
INSERT INTO `system_config` VALUES (85, 'sms_api_type', '4');
INSERT INTO `system_config` VALUES (86, 'wj_user', '');
INSERT INTO `system_config` VALUES (87, 'wj_key', '');
INSERT INTO `system_config` VALUES (88, 'yunpian_tkey', '');
INSERT INTO `system_config` VALUES (89, 'smsbao_user', '');
INSERT INTO `system_config` VALUES (90, 'smsbao_pass', '');
INSERT INTO `system_config` VALUES (91, 'aliyun_key_id', '');
INSERT INTO `system_config` VALUES (92, 'aliyun_key_secret', '');

-- ----------------------------
-- Table structure for system_data
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置名',
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_data_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_data
-- ----------------------------
INSERT INTO `system_data` VALUES (1, 'menudata', '[{\"name\":\"请输入名称\",\"type\":\"scancode_push\",\"key\":\"scancode_push\"}]');

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_log
-- ----------------------------
INSERT INTO `system_log` VALUES (21, 'admin/login/index', '127.0.0.1', '系统管理', '用户登录系统后台成功', 'admin', '2020-12-07 10:04:42');

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '父ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称',
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节点代码',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '链接',
  `params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_menu_node`(`node`(191)) USING BTREE,
  INDEX `idx_system_menu_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, 0, '后台首页', '', '', 'admin/index/main', '', '_self', 500, 1, '2018-09-05 17:59:38');
INSERT INTO `system_menu` VALUES (2, 0, '系统管理', '', '', '#', '', '_self', 300, 1, '2018-09-05 18:04:52');
INSERT INTO `system_menu` VALUES (3, 4, '系统菜单管理', '', 'layui-icon layui-icon-layouts', 'admin/menu/index', '', '_self', 1, 1, '2018-09-05 18:05:26');
INSERT INTO `system_menu` VALUES (4, 2, '程序配置', '', '', '#', '', '_self', 20, 1, '2018-09-05 18:07:17');
INSERT INTO `system_menu` VALUES (5, 12, '系统用户管理', '', 'layui-icon layui-icon-username', 'admin/user/index', '', '_self', 1, 1, '2018-09-06 11:10:42');
INSERT INTO `system_menu` VALUES (7, 12, '访问权限管理', '', 'layui-icon layui-icon-vercode', 'admin/auth/index', '', '_self', 2, 1, '2018-09-06 15:17:14');
INSERT INTO `system_menu` VALUES (11, 4, '程序参数配置', '', '', 'admin/config/info', '', '_self', 4, 1, '2018-09-06 16:43:47');
INSERT INTO `system_menu` VALUES (12, 2, '权限管理', '', '', '#', '', '_self', 10, 1, '2018-09-06 18:01:31');
INSERT INTO `system_menu` VALUES (49, 4, '系统日志管理', '', 'layui-icon layui-icon-form', 'admin/oplog/index', '', '_self', 2, 1, '2019-02-18 12:56:56');
INSERT INTO `system_menu` VALUES (62, 0, '商品管理', '', '', '#', '', '_self', 400, 1, '2020-05-11 18:29:00');
INSERT INTO `system_menu` VALUES (63, 62, '商品设置', '', '', '#', '', '_self', 20, 1, '2020-05-11 18:29:37');
INSERT INTO `system_menu` VALUES (64, 63, '商品列表', '', '', 'admin/item/index', '', '_self', 2, 1, '2020-05-11 18:30:13');
INSERT INTO `system_menu` VALUES (65, 63, '商品分类', '', '', 'admin/item_class/index', '', '_self', 1, 1, '2020-05-11 18:30:44');
INSERT INTO `system_menu` VALUES (66, 62, '购买记录', '', '', '#', '', '_self', 0, 1, '2020-05-11 23:41:30');
INSERT INTO `system_menu` VALUES (67, 66, '已投项目', '', 'layui-icon layui-icon-flag', 'admin/invest/index', '', '_self', 0, 1, '2020-05-11 23:42:03');
INSERT INTO `system_menu` VALUES (68, 66, '还款详情', '', 'layui-icon layui-icon-dollar', 'admin/invest_list/index', '', '_self', 0, 1, '2020-05-11 23:42:39');
INSERT INTO `system_menu` VALUES (69, 0, '用户中心', '', '', '#', '', '_self', 400, 1, '2020-05-12 00:31:55');
INSERT INTO `system_menu` VALUES (70, 69, '财务管理', '', '', '#', '', '_self', 0, 1, '2020-05-12 00:32:24');
INSERT INTO `system_menu` VALUES (71, 70, '流水记录', '', 'layui-icon layui-icon-rmb', 'admin/finance/index', '', '_self', 0, 1, '2020-05-12 00:33:02');
INSERT INTO `system_menu` VALUES (72, 70, '充值记录', '', 'fa fa-cc-paypal', 'admin/recharge/index', '', '_self', 0, 1, '2020-05-12 10:47:08');
INSERT INTO `system_menu` VALUES (73, 70, '提现记录', '', 'fa fa-credit-card-alt', 'admin/cash/index', '', '_self', 0, 1, '2020-05-12 10:47:49');
INSERT INTO `system_menu` VALUES (74, 69, '会员管理', '', '', '#', '', '_self', 1, 1, '2020-05-12 10:59:17');
INSERT INTO `system_menu` VALUES (75, 74, '会员列表', '', 'layui-icon layui-icon-username', 'admin/users/index', '', '_self', 0, 1, '2020-05-12 13:27:12');
INSERT INTO `system_menu` VALUES (76, 74, '等级设置', '', 'layui-icon layui-icon-star', 'admin/member/index', '', '_self', 0, 1, '2020-05-12 14:37:37');
INSERT INTO `system_menu` VALUES (77, 74, '银行卡列表', '', 'fa fa-credit-card', 'admin/bank/index', '', '_self', 0, 1, '2020-05-12 16:22:05');
INSERT INTO `system_menu` VALUES (78, 0, '信息管理', '', '', '#', '', '_self', 400, 1, '2020-05-12 17:08:00');
INSERT INTO `system_menu` VALUES (79, 78, '文章配置', '', '', '#', '', '_self', 0, 1, '2020-05-12 17:08:20');
INSERT INTO `system_menu` VALUES (80, 79, '文章列表', '', 'layui-icon layui-icon-read', 'admin/article/index', '', '_self', 0, 1, '2020-05-12 17:09:07');
INSERT INTO `system_menu` VALUES (81, 79, '文章分类', '', 'layui-icon layui-icon-note', 'admin/article_type/index', '', '_self', 0, 1, '2020-05-12 17:09:45');
INSERT INTO `system_menu` VALUES (82, 78, '站内信管理', '', '', '#', '', '_self', 0, 1, '2020-05-12 17:52:08');
INSERT INTO `system_menu` VALUES (83, 82, '站内信列表', '', 'layui-icon layui-icon-release', 'admin/msg/index', '', '_self', 0, 1, '2020-05-12 17:53:15');
INSERT INTO `system_menu` VALUES (84, 0, '奖励管理', '', '', '#', '', '_self', 400, 1, '2020-05-12 22:11:15');
INSERT INTO `system_menu` VALUES (91, 2, '系统配置', '', '', '#', '', '_self', 30, 1, '2020-05-12 23:27:03');
INSERT INTO `system_menu` VALUES (92, 91, '网站信息', '', 'layui-icon layui-icon-console', 'admin/info/set', 'id=1', '_self', 8, 1, '2020-05-12 23:42:08');
INSERT INTO `system_menu` VALUES (93, 91, '奖励设置', '', 'layui-icon layui-icon-rate', 'admin/info/reward', 'id=1', '_self', 7, 1, '2020-05-13 00:06:54');
INSERT INTO `system_menu` VALUES (94, 91, '支付设置', '', 'fa fa-money', 'admin/info/pay', 'id=1', '_self', 6, 1, '2020-05-13 00:22:17');
INSERT INTO `system_menu` VALUES (95, 91, '轮播图设置', '', 'layui-icon layui-icon-picture', 'admin/slide/index', '', '_self', 4, 1, '2020-05-13 01:13:57');
INSERT INTO `system_menu` VALUES (96, 91, '系统图片设置', '', 'layui-icon layui-icon-set', 'admin/info/img', 'id=1', '_self', 3, 1, '2020-05-13 10:27:30');
INSERT INTO `system_menu` VALUES (99, 84, '分享管理', '', '', '#', '', '_self', 0, 1, '2020-05-17 18:46:05');
INSERT INTO `system_menu` VALUES (100, 99, '分享设置', '', 'fa fa-random', 'admin/share/index', '', '_self', 0, 1, '2020-05-17 18:46:53');
INSERT INTO `system_menu` VALUES (101, 99, '分享记录', '', 'layui-icon layui-icon-senior', 'admin/share_list/index', '', '_self', 0, 1, '2020-05-17 21:14:10');
INSERT INTO `system_menu` VALUES (102, 91, '短信设置', '', 'layui-icon layui-icon-dialogue', 'admin/sms/index', '', '_self', 2, 1, '2020-07-28 10:28:05');
INSERT INTO `system_menu` VALUES (103, 69, '代金券管理', '', '', '#', '', '_self', 0, 1, '2020-07-28 10:42:01');
INSERT INTO `system_menu` VALUES (104, 103, '代金券', '', '', 'admin/coupon/index', '', '_self', 0, 1, '2020-07-28 10:43:37');
INSERT INTO `system_menu` VALUES (105, 74, '会员关系网', '', '', 'admin/users/user_relation', '', '_self', 0, 1, '2020-07-28 12:15:44');
INSERT INTO `system_menu` VALUES (106, 84, '签到管理', '', '', '#', '', '_self', 0, 1, '2020-09-05 17:13:35');
INSERT INTO `system_menu` VALUES (107, 106, '签到奖励', '', '', 'admin/sign_reward/index', '', '_self', 0, 1, '2020-09-05 17:15:21');
INSERT INTO `system_menu` VALUES (108, 91, 'APP支付配置', '', 'layui-icon layui-icon-vercode', 'admin/alipay_set/index', '', '_self', 5, 1, '2020-12-07 17:37:10');

-- ----------------------------
-- Table structure for system_queue
-- ----------------------------
DROP TABLE IF EXISTS `system_queue`;
CREATE TABLE `system_queue`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行参数',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `preload` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '执行内容',
  `time` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '执行时间',
  `double` tinyint(1) NULL DEFAULT 1 COMMENT '单例模式',
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '状态描述',
  `start_at` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '开始时间',
  `end_at` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '结束时间',
  `create_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_queue_double`(`double`) USING BTREE,
  INDEX `idx_system_queue_time`(`time`) USING BTREE,
  INDEX `idx_system_queue_title`(`title`) USING BTREE,
  INDEX `idx_system_queue_create_at`(`create_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户密码',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系QQ',
  `mail` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系邮箱',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系手机',
  `login_at` datetime(0) NULL DEFAULT NULL COMMENT '登录时间',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP',
  `login_num` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '登录次数',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '权限授权',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户标签',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '删除(1删除,0未删)',
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_system_user_username`(`username`) USING BTREE,
  INDEX `idx_system_user_status`(`status`) USING BTREE,
  INDEX `idx_system_user_deleted`(`is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (10000, 'admin', 'dc483e80a7a0bd9ef71d8cf973673924', '22222222', '', '', '2020-12-07 10:04:41', '127.0.0.1', 741, '', '', '', 1, 0, '2015-11-13 15:14:22');

SET FOREIGN_KEY_CHECKS = 1;
