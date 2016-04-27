-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-04-01 10:56:28
-- 服务器版本： 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `easyframework`
--

-- --------------------------------------------------------

--
-- 表的结构 `bcc_achievement`
--

DROP TABLE IF EXISTS `bcc_achievement`;
CREATE TABLE IF NOT EXISTS `bcc_achievement` (
`id` int(11) NOT NULL COMMENT 'ID',
  `enid` int(11) NOT NULL COMMENT '所属单位ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '成果名称',
  `type` int(11) DEFAULT NULL COMMENT '业务类别',
  `format` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成果形式',
  `fee` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参考收费标准',
  `introduction` mediumtext COLLATE utf8_unicode_ci COMMENT '简介',
  `maturity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '成熟度',
  `expectation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预期效果',
  `application` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '适用范围',
  `cooperation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '合作方式',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `abstract` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '摘要',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='科学成果';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_audit`
--

DROP TABLE IF EXISTS `bcc_audit`;
CREATE TABLE IF NOT EXISTS `bcc_audit` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `ver` int(11) DEFAULT NULL COMMENT '版本',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `class` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '类名',
  `table` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '表名',
  `xml` mediumtext COLLATE utf8_unicode_ci COMMENT '数据',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='审核';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_button`
--

DROP TABLE IF EXISTS `bcc_button`;
CREATE TABLE IF NOT EXISTS `bcc_button` (
`id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `button` varchar(200) DEFAULT NULL COMMENT '按钮',
  `description` varchar(100) DEFAULT NULL COMMENT '描述'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_button`
--

INSERT INTO `bcc_button` (`id`, `name`, `button`, `description`) VALUES
(1, '新增', '<button type="button" id="addFun" class="btn btn-primary marR10">新增</button>', ''),
(2, '编辑', '<button type="button" id="editFun" class="btn btn-info marR10">编辑</button>', NULL),
(3, '删除', '<button type="button" id="delFun" class="btn btn-danger marR10">删除</button>', NULL),
(4, '上传', '<button type="button" id="upLoad" class="btn btn-primary marR10">上传</button>', NULL),
(5, '下载', '<button type="button" id="downLoad" class="btn btn-primary marR10">下载</button>', NULL),
(6, '上移', '<button type="button" id="bccGridUp" class="btn btn-success marR10">上移</button>', NULL),
(7, '下移', '<button type="button" id="bccGridDown" class="btn btn btn-grey marR10">下移</button>', NULL),
(8, '分配权限', '<button type="button" id="permissions" class="btn btn btn-grey marR10">分配权限</button>', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_category`
--

DROP TABLE IF EXISTS `bcc_category`;
CREATE TABLE IF NOT EXISTS `bcc_category` (
`id` int(11) unsigned NOT NULL COMMENT 'Id',
  `type` int(11) unsigned DEFAULT '0' COMMENT '类别',
  `modelid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模型id',
  `parentid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父栏目id',
  `catname` varchar(30) NOT NULL COMMENT '名称',
  `style` varchar(5) DEFAULT NULL COMMENT '风格',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `description` mediumtext COMMENT '描述',
  `setting` mediumtext COMMENT '其他设置',
  `usable_type` varchar(255) DEFAULT NULL COMMENT '是否可用',
  `listorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  `onindex` int(11) DEFAULT '1' COMMENT '是否首页显示',
  `indexurl` varchar(255) DEFAULT NULL COMMENT '导航栏url'
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_category`
--

INSERT INTO `bcc_category` (`id`, `type`, `modelid`, `parentid`, `catname`, `style`, `image`, `description`, `setting`, `usable_type`, `listorder`, `onindex`, `indexurl`) VALUES
(174, 0, 0, 0, '大型仪器', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(175, 0, 0, 0, '专家信息', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(176, 0, 0, 0, '科技成果', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(177, 0, 0, 0, '服务机构', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(178, 0, 0, 0, '政策法规', NULL, NULL, NULL, NULL, NULL, 0, 0, NULL),
(179, 0, 0, 0, '关于北科院', '', '', '', '', '', 0, 0, ''),
(181, 1, 1, 1, '1', '', '', '', '', NULL, 0, 0, ''),
(182, 1, 1, 177, 'ggg', 'hhhh', '', '', '', NULL, 0, 0, ''),
(183, NULL, 0, 174, 'cccc', '', '', '', '', NULL, 0, 0, ''),
(184, 1, 1, 178, 'dddd', 'dddd', 'dd', 'ddd', 'dddd', NULL, 0, 0, 'ddd'),
(185, 1, 1, 184, 'ccccc', '', '', '', '', NULL, 0, 0, ''),
(186, 0, 0, 175, 'mmmmm', '', '', '', '', NULL, 0, 0, ''),
(187, 1, 1, 176, 'ddd', '', '', '', '', NULL, 0, 0, ''),
(188, 0, 0, 190, '的顶顶顶顶顶', '', '', '', '', NULL, 0, 0, ''),
(189, 1, 1, 175, 'bbbbbb', 'xxxx', '', '', '', NULL, 0, 1, ''),
(190, 1, 1, 179, '改变', 'ddd', '', '', '', NULL, 0, 0, ''),
(193, 1, 34, 174, 'aaa', '', '', '', '', NULL, NULL, NULL, ''),
(194, 1, 34, 185, 'testUrl', '', '1.jpg', '', '', NULL, NULL, NULL, ''),
(195, 1, 1, 186, 'hjhhghhgg', '', '/img/1458809249_bg.jpg', '', '', NULL, 0, 0, ''),
(196, 1, 1, 189, 'xxxxxx', 'yyyyy', '1457936385_本周计划.png', '', '', NULL, NULL, NULL, ''),
(197, 1, 1, 195, 'yyyy', 'yyyyy', '/img/1458637638_bg.jpg', '', '', NULL, 0, 0, ''),
(198, 1, 1, 197, 'aaaaa', 'aaaaa', '/img/1457938009_bg.jpg', '', '', NULL, 0, 0, ''),
(200, NULL, 33, 0, '首页', '', '', '', '', NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_content`
--

DROP TABLE IF EXISTS `bcc_content`;
CREATE TABLE IF NOT EXISTS `bcc_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '文章内容',
  `content` text COMMENT '内容',
  `author` varchar(40) DEFAULT NULL,
  `key_words` varchar(255) DEFAULT NULL COMMENT '关键词',
  `abstract` varchar(255) DEFAULT NULL COMMENT '摘要',
  `picture_path` varchar(255) DEFAULT NULL,
  `add_time` int(12) DEFAULT NULL COMMENT '发布时间',
  `category_type` int(11) DEFAULT NULL COMMENT '栏目类别',
  `remark` text COMMENT '备注',
  `unit` varchar(50) NOT NULL COMMENT '制定单位',
  `code` varchar(20) NOT NULL COMMENT '制度编号',
  `pub_time` date NOT NULL COMMENT '发布日期',
  `start_time` date NOT NULL COMMENT '实施日期',
  `attachment` varchar(50) NOT NULL COMMENT '附件',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `delete_flag` int(11) NOT NULL COMMENT '删除标志',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bcc_demand`
--

DROP TABLE IF EXISTS `bcc_demand`;
CREATE TABLE IF NOT EXISTS `bcc_demand` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `title` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '需求标题',
  `type` int(11) DEFAULT NULL COMMENT '业务分类',
  `funds` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '可投入的研发经费',
  `description` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `send_time` timestamp NULL DEFAULT NULL COMMENT '发送时间',
  `answer_status` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '回复状态',
  `answer_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `answer_uid` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '答复人ID',
  `answer` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '回复内容',
  `contact_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人姓名',
  `contact_unit` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人单位',
  `contact_email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='需求';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_enterprise`
--

DROP TABLE IF EXISTS `bcc_enterprise`;
CREATE TABLE IF NOT EXISTS `bcc_enterprise` (
`id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '仪器中心名称',
  `address1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '省（自治区、直辖市）',
  `address2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '市',
  `address3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '区（县）',
  `address4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '街道（乡镇，含门牌号）',
  `url` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仪器中心网址',
  `org_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '组织机构代码',
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `logo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'logo',
  `introduction` mediumtext COLLATE utf8_unicode_ci COMMENT '简介',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `muid` int(11) DEFAULT NULL COMMENT '上级主管单位id',
  `attribute` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位属性',
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `postcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `ver` int(11) DEFAULT NULL COMMENT '版本',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='供应方';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_en_qualification`
--

DROP TABLE IF EXISTS `bcc_en_qualification`;
CREATE TABLE IF NOT EXISTS `bcc_en_qualification` (
  `enid` int(11) NOT NULL COMMENT '供应方id',
  `picture` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '资质图片',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资质标题',
  `des` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资质描述'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='资质';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_equipment`
--

DROP TABLE IF EXISTS `bcc_equipment`;
CREATE TABLE IF NOT EXISTS `bcc_equipment` (
`id` int(11) NOT NULL COMMENT 'ID',
  `enid` int(11) NOT NULL COMMENT '所属单位ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '装置名称（中文）',
  `eng_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '英文名称',
  `url` int(50) DEFAULT NULL COMMENT '装置网站网址',
  `original_cost` float DEFAULT NULL COMMENT '原值',
  `conutry` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产地国别',
  `start_date` date DEFAULT NULL COMMENT '启用日期',
  `type` int(11) DEFAULT NULL COMMENT '业务类别',
  `use_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '装置类别',
  `function` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要功能',
  `discipline` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要学科领域',
  `service_content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务内容',
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `work_status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '运行状态',
  `introduction` mediumtext COLLATE utf8_unicode_ci COMMENT '简介',
  `fee` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参考收费标准',
  `lay_address1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(省）',
  `lay_address2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(市）',
  `lay_address3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(区）',
  `lay_address4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(街道）',
  `count` int(11) DEFAULT NULL COMMENT '数量',
  `parameter` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其他参数',
  `standard` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `type_code` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '设备分类编码',
  `source` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '仪器设备来源',
  `customs_supervision` tinyint(1) DEFAULT NULL COMMENT '海关监管情况',
  `manufacturer` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '生产制造商',
  `qualification` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要技术指标',
  `model` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格型号',
  `abstract` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '摘要',
  `ver` int(11) DEFAULT NULL COMMENT '版本',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='仪器设备';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_expert`
--

DROP TABLE IF EXISTS `bcc_expert`;
CREATE TABLE IF NOT EXISTS `bcc_expert` (
`id` int(11) NOT NULL COMMENT 'ID',
  `enid` int(11) NOT NULL COMMENT '所属单位ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '成果名称',
  `type` int(11) DEFAULT NULL COMMENT '业务类别',
  `workplace` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作单位',
  `department` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门',
  `introduction` mediumtext COLLATE utf8_unicode_ci COMMENT '简介',
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职务',
  `title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职称',
  `glory` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专家称号',
  `profession` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '擅长领域',
  `add_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `abstract` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '摘要',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='科学成果';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_index`
--

DROP TABLE IF EXISTS `bcc_index`;
CREATE TABLE IF NOT EXISTS `bcc_index` (
`id` int(11) NOT NULL COMMENT 'ID',
  `name` varchar(30) DEFAULT NULL COMMENT '栏目名',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `url` varchar(100) DEFAULT NULL COMMENT '地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bcc_indexlist`
--

DROP TABLE IF EXISTS `bcc_indexlist`;
CREATE TABLE IF NOT EXISTS `bcc_indexlist` (
`id` int(11) NOT NULL COMMENT 'ID',
  `inid` int(11) NOT NULL DEFAULT '0' COMMENT '首页栏目id',
  `title` varchar(500) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类别',
  `image` varchar(100) DEFAULT NULL COMMENT '图片',
  `url` varchar(100) DEFAULT NULL COMMENT '地址',
  `fee` varchar(100) DEFAULT NULL COMMENT '资源价格'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bcc_log`
--

DROP TABLE IF EXISTS `bcc_log`;
CREATE TABLE IF NOT EXISTS `bcc_log` (
`id` int(11) NOT NULL COMMENT 'Id',
  `accountName` varchar(30) DEFAULT NULL COMMENT '账号',
  `module` varchar(30) DEFAULT NULL COMMENT '模块',
  `methods` varchar(255) DEFAULT NULL COMMENT '操作',
  `actionTime` int(11) DEFAULT NULL COMMENT '响应时间',
  `userIP` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `operTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `description` varchar(5000) DEFAULT NULL COMMENT '描述'
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_log`
--

INSERT INTO `bcc_log` (`id`, `accountName`, `module`, `methods`, `actionTime`, `userIP`, `operTime`, `description`) VALUES
(135, 'admin', '系统管理', '用户管理-新增用户', 10, '0:0:0:0:0:0:0:1', '2015-12-18 14:49:55', '执行成功!'),
(136, 'admin', '系统管理', '用户管理/组管理-修改权限', 109, '0:0:0:0:0:0:0:1', '2015-12-18 14:53:18', '执行成功!'),
(137, 'admin', '系统管理', '用户管理-修改用户', 114, '0:0:0:0:0:0:0:1', '2015-12-18 14:54:03', '执行成功!'),
(138, 'admin', '系统管理', '用户管理/组管理-修改权限', 5, '0:0:0:0:0:0:0:1', '2015-12-18 14:56:11', '执行成功!'),
(139, 'admin', '系统管理', '资源管理-新增资源', 6, '0:0:0:0:0:0:0:1', '2015-12-18 15:40:08', '执行成功!'),
(140, 'admin', '系统管理', '资源管理-新增资源', 4, '0:0:0:0:0:0:0:1', '2015-12-18 15:42:22', '执行成功!'),
(141, 'admin', '系统管理', '资源管理-修改资源', 3, '0:0:0:0:0:0:0:1', '2015-12-18 15:42:58', '执行成功!'),
(142, 'admin', '系统管理', '资源管理-修改资源', 3, '0:0:0:0:0:0:0:1', '2015-12-18 15:43:19', '执行成功!'),
(143, 'admin', '系统管理', '资源管理-修改资源', 5, '0:0:0:0:0:0:0:1', '2015-12-18 15:43:41', '执行成功!'),
(144, 'admin', '系统管理', '用户管理/组管理-修改权限', 6, '0:0:0:0:0:0:0:1', '2015-12-18 15:46:40', '执行成功!'),
(146, 'admin', '系统管理', '用户管理/组管理-修改权限', 11, '0:0:0:0:0:0:0:1', '2015-12-18 17:47:47', '执行成功!'),
(147, 'admin', '系统管理', '用户管理-删除用户', 6, '0:0:0:0:0:0:0:1', '2015-12-18 19:47:22', '执行成功!'),
(148, 'admin', '系统管理', '用户管理/组管理-修改权限', 7, '0:0:0:0:0:0:0:1', '2015-12-18 19:47:30', '执行成功!'),
(149, 'admin', '系统管理', '用户管理-新增用户', 8, '0:0:0:0:0:0:0:1', '2015-12-20 15:21:38', '执行成功!'),
(150, 'admin', '系统管理', '用户管理-修改用户', 140, '0:0:0:0:0:0:0:1', '2015-12-20 15:22:43', '执行成功!'),
(151, 'admin', '系统管理', '资源管理-新增资源', 6, '0:0:0:0:0:0:0:1', '2015-12-21 14:30:10', '执行成功!'),
(152, 'admin', '系统管理', '资源管理-修改资源', 2, '0:0:0:0:0:0:0:1', '2015-12-21 14:30:37', '执行成功!'),
(153, 'admin', '系统管理', '资源管理-新增资源', 3, '0:0:0:0:0:0:0:1', '2015-12-21 14:31:10', '执行成功!'),
(154, 'admin', '系统管理', '用户管理/组管理-修改权限', 1, '0:0:0:0:0:0:0:1', '2015-12-21 14:31:54', '执行成功!'),
(155, 'admin', '系统管理', '用户管理/组管理-修改权限', 2, '0:0:0:0:0:0:0:1', '2015-12-21 14:32:01', '执行成功!'),
(156, 'admin', '系统管理', '资源管理-删除资源', 132, '0:0:0:0:0:0:0:1', '2015-12-21 14:32:59', '执行成功!'),
(157, 'admin', '系统管理', '用户管理/组管理-修改权限', 109, '0:0:0:0:0:0:0:1', '2015-12-21 14:34:40', '执行成功!'),
(158, 'admin', '系统管理', '资源管理-修改资源', 7, '0:0:0:0:0:0:0:1', '2015-12-21 16:03:25', '执行成功!'),
(159, 'admin', '系统管理', '资源管理-新增资源', 2, '0:0:0:0:0:0:0:1', '2015-12-21 16:04:35', '执行成功!'),
(160, 'admin', '系统管理', '用户管理-删除用户', 8, '0:0:0:0:0:0:0:1', '2015-12-21 16:15:35', '执行成功!'),
(161, 'admin', '系统管理', '用户管理/组管理-修改权限', 6, '0:0:0:0:0:0:0:1', '2015-12-21 16:15:42', '执行成功!'),
(162, 'admin', '系统管理', '用户管理/组管理-修改权限', 3, '0:0:0:0:0:0:0:1', '2015-12-21 16:15:59', '执行成功!'),
(163, 'admin', '系统管理', '资源管理-新增资源', 31, '0:0:0:0:0:0:0:1', '2016-02-03 09:58:46', '执行成功!'),
(164, 'admin', '系统管理', '资源管理-新增资源', 28, '0:0:0:0:0:0:0:1', '2016-02-03 09:59:16', '执行成功!'),
(165, 'admin', '系统管理', '资源管理-新增资源', 18, '0:0:0:0:0:0:0:1', '2016-02-21 16:03:12', '执行成功!'),
(166, 'admin', '系统管理', '资源管理-修改资源', 5, '0:0:0:0:0:0:0:1', '2016-02-22 14:10:31', '执行成功!'),
(167, 'admin', '系统管理', '资源管理-修改资源', 15, '0:0:0:0:0:0:0:1', '2016-02-22 14:14:42', '执行成功!'),
(168, 'admin', '系统管理', '资源管理-删除资源', 74, '0:0:0:0:0:0:0:1', '2016-02-22 14:25:23', '执行成功!'),
(169, 'admin', '系统管理', '资源管理-新增资源', 22, '0:0:0:0:0:0:0:1', '2016-03-06 16:52:37', '执行成功!'),
(170, 'admin', '系统管理', '资源管理-修改资源', 27, '0:0:0:0:0:0:0:1', '2016-03-06 16:53:07', '执行成功!'),
(171, 'admin', '系统管理', '资源管理-修改资源', 20, '0:0:0:0:0:0:0:1', '2016-03-06 16:53:23', '执行成功!'),
(172, 'admin', '系统管理', '角色管理/组管理-修改权限', 70, '0:0:0:0:0:0:0:1', '2016-03-07 10:12:18', '执行成功!'),
(173, 'admin', '系统管理', '角色管理/组管理-修改权限', 71, '0:0:0:0:0:0:0:1', '2016-03-07 10:12:44', '执行成功!'),
(174, 'admin', '系统管理', '角色管理/组管理-修改权限', 83, '0:0:0:0:0:0:0:1', '2016-03-08 21:13:24', '执行成功!'),
(175, 'admin', '系统管理', '资源管理-新增资源', 20, '0:0:0:0:0:0:0:1', '2016-03-10 00:40:13', '执行成功!'),
(176, 'admin', '系统管理', '资源管理-修改资源', 13, '0:0:0:0:0:0:0:1', '2016-03-10 00:40:40', '执行成功!'),
(177, 'admin', '系统管理', '资源管理-新增资源', 21, '0:0:0:0:0:0:0:1', '2016-03-10 00:47:43', '执行成功!'),
(178, 'admin', '系统管理', '角色管理/组管理-修改权限', 66, '0:0:0:0:0:0:0:1', '2016-03-10 00:59:30', '执行成功!'),
(179, 'admin', '系统管理', '资源管理-修改资源', 18, '0:0:0:0:0:0:0:1', '2016-03-10 01:00:02', '执行成功!'),
(180, 'admin', '系统管理', '角色管理/组管理-修改权限', 36, '0:0:0:0:0:0:0:1', '2016-03-10 01:00:18', '执行成功!'),
(181, 'admin', '系统管理', '角色管理/组管理-修改权限', 45, '127.0.0.1', '2016-03-10 17:48:33', '执行成功!'),
(182, 'admin', '系统管理', '资源管理-新增资源', 35, '0:0:0:0:0:0:0:1', '2016-03-10 18:30:35', '执行成功!'),
(183, 'admin', '系统管理', '资源管理-修改资源', 3, '0:0:0:0:0:0:0:1', '2016-03-10 18:33:04', '执行成功!'),
(184, 'admin', '系统管理', '资源管理-新增资源', 19, '0:0:0:0:0:0:0:1', '2016-03-10 19:30:43', '执行成功!'),
(185, 'admin', '系统管理', '角色管理/组管理-修改权限', 99, '0:0:0:0:0:0:0:1', '2016-03-10 19:31:39', '执行成功!'),
(186, 'admin', '系统管理', '角色管理/组管理-修改权限', 52, '127.0.0.1', '2016-03-13 23:31:47', '执行成功!'),
(187, 'admin', '系统管理', '角色管理/组管理-修改权限', 36, '127.0.0.1', '2016-03-13 23:33:41', '执行成功!'),
(188, 'admin', '系统管理', '角色管理/组管理-修改权限', 40, '127.0.0.1', '2016-03-13 23:34:33', '执行成功!'),
(189, 'admin', '系统管理', '角色管理/组管理-修改权限', 37, '127.0.0.1', '2016-03-13 23:35:13', '执行成功!'),
(190, 'admin', '系统管理', '角色管理/组管理-修改权限', 61, '127.0.0.1', '2016-03-13 23:35:33', '执行成功!'),
(191, 'admin', '系统管理', '角色管理/组管理-修改权限', 42, '127.0.0.1', '2016-03-13 23:36:52', '执行成功!'),
(192, 'admin', '系统管理', '角色管理/组管理-修改权限', 45, '127.0.0.1', '2016-03-13 23:37:43', '执行成功!'),
(193, 'admin', '系统管理', '角色管理/组管理-修改权限', 41, '127.0.0.1', '2016-03-13 23:38:48', '执行成功!'),
(194, 'admin', '系统管理', '角色管理/组管理-修改权限', 42, '127.0.0.1', '2016-03-13 23:41:22', '执行成功!'),
(195, 'admin', '系统管理', '角色管理/组管理-修改权限', 43, '127.0.0.1', '2016-03-13 23:42:32', '执行成功!'),
(196, 'admin', '系统管理', '角色管理/组管理-修改权限', 32, '127.0.0.1', '2016-03-13 23:44:38', '执行成功!'),
(197, 'admin', '系统管理', '角色管理/组管理-修改权限', 39, '127.0.0.1', '2016-03-13 23:45:48', '执行成功!'),
(198, 'admin', '系统管理', '角色管理/组管理-修改权限', 42, '127.0.0.1', '2016-03-13 23:47:00', '执行成功!'),
(199, 'admin', '系统管理', '角色管理/组管理-修改权限', 49, '127.0.0.1', '2016-03-13 23:48:00', '执行成功!'),
(200, 'admin', '系统管理', '角色管理/组管理-修改权限', 59, '127.0.0.1', '2016-03-13 23:48:46', '执行成功!'),
(201, 'admin', '系统管理', '角色管理/组管理-修改权限', 42, '127.0.0.1', '2016-03-13 23:50:38', '执行成功!'),
(202, 'admin', '系统管理', '角色管理/组管理-修改权限', 40, '127.0.0.1', '2016-03-13 23:52:16', '执行成功!'),
(203, 'admin', '系统管理', '角色管理/组管理-修改权限', 20, '127.0.0.1', '2016-03-13 23:54:11', '执行成功!'),
(204, 'admin', '系统管理', '角色管理/组管理-修改权限', 24, '127.0.0.1', '2016-03-13 23:54:14', '执行成功!'),
(205, 'admin', '系统管理', '角色管理/组管理-修改权限', 29, '127.0.0.1', '2016-03-13 23:56:21', '执行成功!'),
(206, 'admin', '系统管理', '角色管理/组管理-修改权限', 27, '127.0.0.1', '2016-03-13 23:57:05', '执行成功!'),
(207, 'admin', '系统管理', '角色管理/组管理-修改权限', 26, '127.0.0.1', '2016-03-13 23:58:06', '执行成功!'),
(208, 'admin', '系统管理', '角色管理/组管理-修改权限', 33, '127.0.0.1', '2016-03-13 23:58:54', '执行成功!'),
(209, 'admin', '系统管理', '角色管理/组管理-修改权限', 39, '127.0.0.1', '2016-03-14 00:00:48', '执行成功!'),
(210, 'admin', '系统管理', '角色管理/组管理-修改权限', 33, '127.0.0.1', '2016-03-14 00:03:48', '执行成功!'),
(211, 'admin', '系统管理', '角色管理/组管理-修改权限', 28, '127.0.0.1', '2016-03-14 00:04:20', '执行成功!'),
(212, 'admin', '系统管理', '角色管理/组管理-修改权限', 39, '127.0.0.1', '2016-03-14 00:04:51', '执行成功!'),
(213, 'admin', '系统管理', '角色管理/组管理-修改权限', 31, '127.0.0.1', '2016-03-14 00:06:05', '执行成功!'),
(214, 'admin', '系统管理', '角色管理/组管理-修改权限', 52, '127.0.0.1', '2016-03-14 00:07:28', '执行成功!'),
(215, 'admin', '系统管理', '角色管理/组管理-修改权限', 26, '127.0.0.1', '2016-03-14 00:09:22', '执行成功!'),
(216, 'admin', '系统管理', '角色管理/组管理-修改权限', 49, '127.0.0.1', '2016-03-14 00:11:03', '执行成功!'),
(217, 'admin', '系统管理', '角色管理/组管理-修改权限', 35, '127.0.0.1', '2016-03-14 00:13:21', '执行成功!'),
(218, 'admin', '系统管理', '角色管理/组管理-修改权限', 25, '127.0.0.1', '2016-03-14 00:16:19', '执行成功!'),
(219, 'admin', '系统管理', '角色管理/组管理-修改权限', 23, '127.0.0.1', '2016-03-14 00:17:29', '执行成功!'),
(220, 'admin', '系统管理', '角色管理/组管理-修改权限', 29, '127.0.0.1', '2016-03-14 00:25:31', '执行成功!'),
(221, 'admin', '系统管理', '角色管理/组管理-修改权限', 40, '127.0.0.1', '2016-03-14 00:30:33', '执行成功!'),
(222, 'admin', '系统管理', '角色管理/组管理-修改权限', 34, '127.0.0.1', '2016-03-14 00:38:25', '执行成功!'),
(223, 'admin', '系统管理', '角色管理/组管理-修改权限', 24, '127.0.0.1', '2016-03-14 00:40:02', '执行成功!'),
(224, 'admin', '系统管理', '角色管理/组管理-修改权限', 23, '127.0.0.1', '2016-03-14 00:41:47', '执行成功!'),
(225, 'admin', '系统管理', '角色管理/组管理-修改权限', 40, '127.0.0.1', '2016-03-14 00:44:14', '执行成功!'),
(226, 'admin', '系统管理', '角色管理/组管理-修改权限', 32, '0:0:0:0:0:0:0:1', '2016-03-14 00:55:05', '执行成功!'),
(227, 'admin', '系统管理', '角色管理/组管理-修改权限', 18, '0:0:0:0:0:0:0:1', '2016-03-14 00:57:27', '执行成功!'),
(228, 'admin', '系统管理', '角色管理/组管理-修改权限', 22, '0:0:0:0:0:0:0:1', '2016-03-14 00:57:41', '执行成功!'),
(229, 'admin', '系统管理', '角色管理/组管理-修改权限', 43, '127.0.0.1', '2016-03-14 01:03:51', '执行成功!'),
(230, 'admin', '系统管理', '角色管理/组管理-修改权限', 50, '127.0.0.1', '2016-03-14 01:05:07', '执行成功!'),
(231, 'admin', '系统管理', '资源管理-新增资源', 15, '0:0:0:0:0:0:0:1', '2016-03-14 01:13:25', '执行成功!'),
(232, 'admin', '系统管理', '资源管理-修改资源', 1, '0:0:0:0:0:0:0:1', '2016-03-14 01:13:48', '执行成功!'),
(233, 'admin', '系统管理', '资源管理-新增资源', 12, '0:0:0:0:0:0:0:1', '2016-03-14 01:16:08', '执行成功!'),
(234, 'admin', '系统管理', '资源管理-修改资源', 2, '0:0:0:0:0:0:0:1', '2016-03-14 01:16:33', '执行成功!'),
(235, 'admin', '系统管理', '资源管理-新增资源', 19, '0:0:0:0:0:0:0:1', '2016-03-14 01:17:37', '执行成功!'),
(236, 'admin', '系统管理', '资源管理-新增资源', 11, '0:0:0:0:0:0:0:1', '2016-03-14 01:18:40', '执行成功!'),
(237, 'admin', '系统管理', '角色管理/组管理-修改权限', 83, '0:0:0:0:0:0:0:1', '2016-03-14 01:19:19', '执行成功!'),
(238, 'admin', '系统管理', '角色管理/组管理-修改权限', 35, '127.0.0.1', '2016-03-14 17:33:49', '执行成功!'),
(239, 'admin', '角色管理', '角色管理-添加角色', 83, '127.0.0.1', '2016-03-15 00:17:38', '执行成功!'),
(240, 'admin', '系统管理', '角色管理/组管理-修改权限', 35, '0:0:0:0:0:0:0:1', '2016-03-15 01:15:30', '执行成功!'),
(241, 'admin', '用户管理', '用户管理-修改用户', 175, '127.0.0.1', '2016-03-15 19:04:13', '执行成功!'),
(242, 'admin', '用户管理', '用户管理-修改用户', 232, '127.0.0.1', '2016-03-15 19:06:02', '执行成功!'),
(243, 'admin', '用户管理', '用户管理-修改用户', 235, '127.0.0.1', '2016-03-15 19:08:13', '执行成功!'),
(244, 'admin', '系统管理', '角色管理/组管理-修改权限', 121, '0:0:0:0:0:0:0:1', '2016-03-15 19:08:37', '执行成功!'),
(245, 'admin', '用户管理', '用户管理-新增用户', 185, '127.0.0.1', '2016-03-15 21:41:00', '执行成功!'),
(246, 'admin', '用户管理', '用户管理-新增用户', 158, '127.0.0.1', '2016-03-15 21:45:46', '执行成功!'),
(247, 'admin', '系统管理', '资源管理-新增资源', 17, '0:0:0:0:0:0:0:1', '2016-03-15 21:45:48', '执行成功!'),
(248, 'admin', '系统管理', '资源管理-新增资源', 26, '0:0:0:0:0:0:0:1', '2016-03-15 21:47:05', '执行成功!'),
(249, 'admin', '系统管理', '资源管理-新增资源', 18, '0:0:0:0:0:0:0:1', '2016-03-15 21:48:24', '执行成功!'),
(250, 'admin', '系统管理', '资源管理-新增资源', 23, '0:0:0:0:0:0:0:1', '2016-03-15 21:49:31', '执行成功!'),
(251, 'admin', '系统管理', '角色管理/组管理-修改权限', 74, '0:0:0:0:0:0:0:1', '2016-03-15 21:49:46', '执行成功!'),
(252, 'admin', '系统管理', '资源管理-修改资源', 6, '0:0:0:0:0:0:0:1', '2016-03-15 22:42:43', '执行成功!'),
(253, 'admin', '系统管理', '资源管理-新增资源', 14, '127.0.0.1', '2016-03-17 07:23:16', '执行成功!'),
(254, 'admin', '系统管理', '资源管理-新增资源', 13, '127.0.0.1', '2016-03-17 07:24:10', '执行成功!'),
(255, 'admin', '系统管理', '资源管理-新增资源', 10, '127.0.0.1', '2016-03-17 07:24:45', '执行成功!'),
(256, 'admin', '系统管理', '资源管理-新增资源', 15, '127.0.0.1', '2016-03-17 07:25:16', '执行成功!'),
(257, 'admin', '系统管理', '角色管理/组管理-修改权限', 231, '127.0.0.1', '2016-03-17 07:25:33', '执行成功!'),
(258, 'admin', '角色管理', '角色管理-删除角色', 63, '127.0.0.1', '2016-03-17 09:14:50', '执行成功!'),
(259, 'admin', '系统管理', '资源管理-修改资源', 51, '127.0.0.1', '2016-03-21 06:19:43', '执行成功!'),
(260, 'admin', '系统管理', '资源管理-新增资源', 24, '127.0.0.1', '2016-03-21 06:22:00', '执行成功!'),
(261, 'admin', '系统管理', '角色管理/组管理-修改权限', 396, '127.0.0.1', '2016-03-21 06:22:34', '执行成功!'),
(262, 'admin', '系统管理', '资源管理-新增资源', 17, '127.0.0.1', '2016-03-21 06:28:29', '执行成功!'),
(263, 'admin', '系统管理', '资源管理-新增资源', 29, '127.0.0.1', '2016-03-21 06:35:29', '执行成功!'),
(264, 'admin', '系统管理', '资源管理-新增资源', 14, '127.0.0.1', '2016-03-21 06:36:28', '执行成功!'),
(265, 'admin', '系统管理', '角色管理/组管理-修改权限', 425, '127.0.0.1', '2016-03-21 06:45:49', '执行成功!'),
(266, 'admin', '角色管理', '角色管理-添加角色', 182, '127.0.0.1', '2016-03-21 07:38:05', '执行成功!'),
(267, 'admin', '角色管理', '角色管理-删除角色', 154, '127.0.0.1', '2016-03-21 07:39:19', '执行成功!'),
(268, 'admin', '用户管理', '用户管理-删除用户', 531, '127.0.0.1', '2016-03-21 09:22:50', '执行成功!'),
(269, 'admin', '角色管理', '角色管理-删除角色', 471, '127.0.0.1', '2016-03-21 09:23:01', '执行成功!'),
(270, 'admin', '角色管理', '角色管理-删除角色', 291, '127.0.0.1', '2016-03-21 09:23:06', '执行成功!'),
(271, 'admin', '角色管理', '角色管理-删除角色', 232, '127.0.0.1', '2016-03-21 09:23:12', '执行成功!'),
(272, 'admin', '角色管理', '角色管理-删除角色', 15, '127.0.0.1', '2016-03-22 09:06:15', '执行成功!'),
(273, 'admin', '角色管理', '角色管理-修改角色', 70, '127.0.0.1', '2016-03-22 09:06:23', '执行成功!'),
(274, 'admin', '角色管理', '角色管理-修改角色', 80, '127.0.0.1', '2016-03-22 09:06:28', '执行成功!'),
(275, 'admin', '角色管理', '角色管理-修改角色', 64, '127.0.0.1', '2016-03-22 09:06:48', '执行成功!'),
(276, 'admin', '角色管理', '角色管理-添加角色', 194, '127.0.0.1', '2016-03-23 03:04:28', '执行成功!'),
(277, 'admin', '系统管理', '角色管理/组管理-修改权限', 76, '127.0.0.1', '2016-03-23 03:06:15', '执行成功!'),
(278, 'admin', '用户管理', '用户管理-删除用户', 581, '127.0.0.1', '2016-03-23 03:06:32', '执行成功!'),
(279, 'admin', '用户管理', '用户管理-删除用户', 503, '127.0.0.1', '2016-03-23 03:06:40', '执行成功!'),
(280, 'admin', '用户管理', '用户管理-删除用户', 99, '127.0.0.1', '2016-03-23 04:18:51', '执行成功!'),
(281, '1@bcc.ac.cn', '用户管理', '用户管理-新增用户', 382, '127.0.0.1', '2016-03-23 08:19:47', '执行成功!'),
(282, 'admin', '系统管理', '资源管理-新增资源', 19, '0:0:0:0:0:0:0:1', '2016-03-24 05:29:10', '执行成功!'),
(283, 'admin', '系统管理', '资源管理-新增资源', 12, '0:0:0:0:0:0:0:1', '2016-03-24 05:30:39', '执行成功!'),
(284, 'admin', '系统管理', '角色管理/组管理-修改权限', 95, '0:0:0:0:0:0:0:1', '2016-03-24 05:31:08', '执行成功!'),
(285, 'admin', '系统管理', '资源管理-新增资源', 13, '0:0:0:0:0:0:0:1', '2016-03-24 05:53:28', '执行成功!'),
(286, 'admin', '系统管理', '角色管理/组管理-修改权限', 170, '0:0:0:0:0:0:0:1', '2016-03-24 05:55:33', '执行成功!'),
(287, 'admin', '用户管理', '用户管理-新增用户', 1495, '127.0.0.1', '2016-03-24 06:02:11', '执行成功!'),
(288, 'admin', '用户管理', '用户管理-新增用户', 244, '127.0.0.1', '2016-03-24 06:04:45', '执行成功!'),
(289, 'admin', '系统管理', '资源管理-新增资源', 17, '0:0:0:0:0:0:0:1', '2016-03-24 06:05:34', '执行成功!'),
(290, 'admin', '用户管理', '用户管理-新增用户', 398, '127.0.0.1', '2016-03-24 06:06:10', '执行成功!'),
(291, 'admin', '系统管理', '资源管理-新增资源', 17, '0:0:0:0:0:0:0:1', '2016-03-24 06:07:26', '执行成功!'),
(292, 'admin', '系统管理', '角色管理/组管理-修改权限', 72, '0:0:0:0:0:0:0:1', '2016-03-24 06:07:56', '执行成功!'),
(293, 'admin', '角色管理', '角色管理-删除角色', 14, '0:0:0:0:0:0:0:1', '2016-03-24 06:08:13', '执行成功!'),
(294, 'admin', '用户管理', '用户管理-新增用户', 30057, '127.0.0.1', '2016-03-24 06:15:19', '执行成功!'),
(295, 'admin', '用户管理', '用户管理-删除用户', 4015, '127.0.0.1', '2016-03-24 06:15:41', '执行成功!'),
(296, 'admin', '用户管理', '用户管理-删除用户', 20621, '127.0.0.1', '2016-03-24 06:16:12', '执行成功!'),
(297, 'admin', '用户管理', '用户管理-删除用户', 26174, '127.0.0.1', '2016-03-24 06:17:15', '执行成功!'),
(298, 'admin', '用户管理', '用户管理-修改用户', 297, '127.0.0.1', '2016-03-24 07:29:48', '执行成功!'),
(299, 'admin', '用户管理', '用户管理-修改用户', 447, '127.0.0.1', '2016-03-24 07:30:06', '执行成功!'),
(300, 'admin', '用户管理', '用户管理-修改用户', 395, '127.0.0.1', '2016-03-24 07:30:29', '执行成功!'),
(301, 'admin', '用户管理', '用户管理-修改用户', 325, '127.0.0.1', '2016-03-24 07:30:47', '执行成功!'),
(302, 'admin', '用户管理', '用户管理-修改用户', 137, '127.0.0.1', '2016-03-24 07:30:55', '执行成功!'),
(303, 'admin', '角色管理', '角色管理-修改角色', 80, '127.0.0.1', '2016-03-24 07:32:35', '执行成功!'),
(304, 'admin', '角色管理', '角色管理-修改角色', 81, '127.0.0.1', '2016-03-24 07:32:47', '执行成功!'),
(305, 'admin', '角色管理', '角色管理-修改角色', 102, '127.0.0.1', '2016-03-24 07:32:57', '执行成功!'),
(306, 'admin', '角色管理', '角色管理-修改角色', 69, '127.0.0.1', '2016-03-24 07:33:01', '执行成功!'),
(307, 'admin', '用户管理', '用户管理-修改用户', 134, '127.0.0.1', '2016-03-24 07:40:14', '执行成功!'),
(308, 'admin', '用户管理', '用户管理-修改用户', 267, '127.0.0.1', '2016-03-24 09:24:22', '执行成功!'),
(309, 'admin', '用户管理', '用户管理-修改用户', 129, '127.0.0.1', '2016-03-24 09:24:30', '执行成功!'),
(310, 'admin', '角色管理', '角色管理-删除角色', 70, '127.0.0.1', '2016-03-25 01:42:01', '执行成功!'),
(311, 'admin', '系统管理', '资源管理-新增资源', 44, '127.0.0.1', '2016-03-25 06:10:23', '执行成功!'),
(312, 'admin', '系统管理', '资源管理-修改资源', 2, '127.0.0.1', '2016-03-25 06:10:43', '执行成功!'),
(313, 'admin', '系统管理', '资源管理-新增资源', 22, '127.0.0.1', '2016-03-25 06:18:12', '执行成功!'),
(314, 'admin', '系统管理', '角色管理/组管理-修改权限', 127, '127.0.0.1', '2016-03-25 06:20:11', '执行成功!'),
(315, 'admin', '系统管理', '角色管理/组管理-修改权限', 91, '127.0.0.1', '2016-03-25 06:21:24', '执行成功!'),
(316, 'admin', '用户管理', '用户管理-修改用户', 243, '127.0.0.1', '2016-03-25 06:23:06', '执行成功!'),
(317, 'admin', '用户管理', '用户管理-修改用户', 199, '127.0.0.1', '2016-03-25 06:24:04', '执行成功!'),
(318, 'admin', '用户管理', '用户管理-修改用户', 154, '127.0.0.1', '2016-03-25 06:24:28', '执行成功!'),
(319, 'admin', '系统管理', '角色管理/组管理-修改权限', 118, '127.0.0.1', '2016-03-25 06:24:55', '执行成功!'),
(320, 'admin', '用户管理', '用户管理-修改用户', 170, '127.0.0.1', '2016-03-25 06:35:47', '执行成功!'),
(321, 'admin', '用户管理', '用户管理-修改用户', 155, '127.0.0.1', '2016-03-25 06:36:09', '执行成功!'),
(322, 'admin', '系统管理', '资源管理-修改资源', 5, '127.0.0.1', '2016-03-25 07:07:06', '执行成功!'),
(323, 'admin', '系统管理', '资源管理-修改资源', 3, '127.0.0.1', '2016-03-25 07:09:45', '执行成功!'),
(324, 'admin', '用户管理', '用户管理-修改用户', 266, '127.0.0.1', '2016-03-25 07:19:08', '执行成功!'),
(325, 'admin', '用户管理', '用户管理-修改用户', 297, '127.0.0.1', '2016-03-25 07:23:30', '执行成功!'),
(326, 'admin', '用户管理', '用户管理-修改用户', 267, '127.0.0.1', '2016-03-25 08:17:07', '执行成功!'),
(327, 'admin', '用户管理', '用户管理-修改用户', 289, '127.0.0.1', '2016-03-25 08:17:42', '执行成功!'),
(328, 'admin', '用户管理', '用户管理-修改用户', 283, '127.0.0.1', '2016-03-25 08:19:34', '执行成功!'),
(329, 'admin', '角色管理', '角色管理-修改角色', 26, '127.0.0.1', '2016-03-25 08:23:57', '执行成功!'),
(330, 'admin', '角色管理', '角色管理-修改角色', 25, '127.0.0.1', '2016-03-25 08:24:26', '执行成功!'),
(331, 'admin', '角色管理', '角色管理-修改角色', 133, '127.0.0.1', '2016-03-25 08:25:19', '执行成功!'),
(332, 'admin', '用户管理', '用户管理-修改用户', 236, '127.0.0.1', '2016-03-25 08:30:31', '执行成功!'),
(333, 'admin', '用户管理', '用户管理-修改用户', 341, '127.0.0.1', '2016-03-25 08:47:53', '执行成功!'),
(334, 'admin', '用户管理', '用户管理-修改用户', 204, '127.0.0.1', '2016-03-25 08:49:09', '执行成功!'),
(335, 'admin', '角色管理', '角色管理-修改角色', 77, '127.0.0.1', '2016-03-25 08:51:21', '执行成功!'),
(336, 'admin', '角色管理', '角色管理-修改角色', 62, '127.0.0.1', '2016-03-25 08:51:28', '执行成功!'),
(337, 'admin', '用户管理', '用户管理-修改用户', 252, '127.0.0.1', '2016-03-25 08:51:51', '执行成功!'),
(338, 'admin', '用户管理', '用户管理-修改用户', 386, '127.0.0.1', '2016-03-25 08:52:07', '执行成功!'),
(339, 'admin', '用户管理', '用户管理-修改用户', 327, '127.0.0.1', '2016-03-25 08:52:47', '执行成功!'),
(340, 'admin', '角色管理', '角色管理-修改角色', 60, '127.0.0.1', '2016-03-25 08:56:17', '执行成功!'),
(341, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:36:51', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(342, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:37:17', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(343, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:37:50', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(344, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:38:53', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(345, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:42:09', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(346, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:43:08', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(347, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:45:06', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(348, 'admin', '角色管理', '角色管理-修改角色', 63, '127.0.0.1', '2016-03-25 09:45:39', '执行成功!'),
(349, 'admin', '角色管理', '角色管理-修改角色', 52, '127.0.0.1', '2016-03-25 09:45:55', '执行成功!'),
(350, 'admin', '角色管理', '角色管理-修改角色', 35, '127.0.0.1', '2016-03-25 09:46:06', '执行成功!'),
(351, 'admin', '角色管理', '角色管理-修改角色', 68, '127.0.0.1', '2016-03-25 09:46:18', '执行成功!'),
(352, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:46:28', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(353, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:46:52', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(354, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:49:03', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(355, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:49:57', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(356, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:50:11', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(357, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:51:36', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(358, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:51:55', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(359, 'admin', '用户管理', '用户管理-修改用户', 667, '127.0.0.1', '2016-03-25 09:52:11', '执行成功!'),
(360, 'admin', '用户管理', '用户管理-修改用户', 304, '127.0.0.1', '2016-03-25 09:52:24', '执行成功!'),
(361, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:53:05', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(362, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:54:27', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(363, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:54:48', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(364, 'admin', '用户管理', '用户管理-修改用户', 158, '127.0.0.1', '2016-03-25 09:54:55', '执行成功!'),
(365, 'admin', '用户管理', '用户管理-修改用户', 252, '127.0.0.1', '2016-03-25 09:55:06', '执行成功!'),
(366, 'admin', '用户管理', '用户管理-修改用户', 249, '127.0.0.1', '2016-03-25 09:55:31', '执行成功!'),
(367, 'admin', '用户管理', '用户管理-修改用户', 290, '127.0.0.1', '2016-03-25 09:55:43', '执行成功!'),
(368, 'admin', '用户管理', '用户管理-修改用户', 244, '127.0.0.1', '2016-03-25 09:55:58', '执行成功!'),
(369, 'admin', '用户管理', '用户管理-修改用户', 270, '127.0.0.1', '2016-03-25 09:56:12', '执行成功!'),
(370, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:56:25', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(371, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:56:38', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(372, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:57:33', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(373, 'admin', '用户管理', '用户管理-修改用户', 176, '127.0.0.1', '2016-03-25 09:57:39', '执行成功!'),
(374, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 09:59:21', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(375, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 10:02:12', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(376, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 10:03:11', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(377, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-25 10:06:04', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(378, 'admin', '用户管理', '用户管理-修改用户', 429, '127.0.0.1', '2016-03-29 01:20:52', '执行成功!'),
(379, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:09:45', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(380, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:11:55', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(381, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:12:38', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(382, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:13:14', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(383, 'admin', '用户管理', '用户管理-修改用户', 201, '127.0.0.1', '2016-03-29 06:15:26', '执行成功!'),
(384, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:16:13', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(385, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:20:47', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(386, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:21:59', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(387, 'admin', '用户管理', '用户管理-修改用户', 201, '127.0.0.1', '2016-03-29 06:23:59', '执行成功!'),
(388, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:26:54', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(389, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:29:17', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(390, 'admin', '用户管理', '用户管理-修改用户', 258, '127.0.0.1', '2016-03-29 06:33:12', '执行成功!'),
(391, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:34:53', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(392, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:35:51', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(393, 'admin', '用户管理', '用户管理-修改用户', 350, '127.0.0.1', '2016-03-29 06:38:34', '执行成功!'),
(394, 'admin', '用户管理', '用户管理-修改用户', 315, '127.0.0.1', '2016-03-29 06:38:45', '执行成功!'),
(395, 'admin', '用户管理', '用户管理-修改用户', 298, '127.0.0.1', '2016-03-29 06:38:56', '执行成功!'),
(396, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:39:05', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(397, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:40:27', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(398, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:42:52', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(399, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:44:22', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(400, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:46:40', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: A JSONArray text must start with ''['' at character 0 of </font>'),
(401, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:51:10', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(402, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:51:46', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(403, 'admin', '用户管理', '用户管理-修改用户', 114, '127.0.0.1', '2016-03-29 06:52:02', '执行成功!'),
(404, 'admin', '用户管理', '<font color="red">执行方法异常:-->用户管理-修改用户</font>', 0, '127.0.0.1', '2016-03-29 06:53:40', '<font color="red">执行方法异常:-->java.lang.RuntimeException: net.sf.json.JSONException: JSONArray[0] is not a number.</font>'),
(405, 'admin', '用户管理', '用户管理-修改用户', 163, '127.0.0.1', '2016-03-29 06:53:51', '执行成功!'),
(406, 'admin', '用户管理', '用户管理-修改用户', 194, '127.0.0.1', '2016-03-29 06:54:45', '执行成功!'),
(407, 'admin', '用户管理', '用户管理-修改用户', 207, '127.0.0.1', '2016-03-29 06:54:50', '执行成功!'),
(408, 'admin', '用户管理', '用户管理-修改用户', 250, '127.0.0.1', '2016-03-29 06:54:55', '执行成功!');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_management_unit`
--

DROP TABLE IF EXISTS `bcc_management_unit`;
CREATE TABLE IF NOT EXISTS `bcc_management_unit` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位名称',
  `organizing_code` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '组织机构代码',
  `superior_charge_id` int(11) DEFAULT NULL COMMENT '上级主管id',
  `superior_charge_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '上级主管单位名称',
  `type` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '单位属性，分为1企业、2高等学校、3科研机构、4检测机构、5医疗机构、6其他',
  `introduce` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位简介',
  `website` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '在线服务平台网址',
  `contact_id` int(11) DEFAULT NULL COMMENT '联系人，management_contact表id',
  `contact_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人电话',
  `contact_fax` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系人传真',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '单位地址',
  `zip_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮政编码',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '是否删除，0未删除，1已删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='管理单位';

--
-- 转存表中的数据 `bcc_management_unit`
--

INSERT INTO `bcc_management_unit` (`id`, `name`, `organizing_code`, `superior_charge_id`, `superior_charge_name`, `type`, `introduce`, `website`, `contact_id`, `contact_name`, `contact_phone`, `contact_fax`, `email`, `address`, `zip_code`, `delete_status`) VALUES
(13, 'hncjccc', 'hncj', NULL, 'dkkd', '2', 'dddd', 'http://www.cuc.edu.cn', 17, '李福明', 'ddd', '037512966', 'dddd', '北京市海淀区永丰产业基地', '100086', 0),
(16, '对对', '对对对', NULL, '对对对', '1', '等等等等', 'disscuss.reactjs.top', 20, 'ddd', '', '', '', '', '', 0),
(18, '北科院', 'AAAAAAA', NULL, '北京市科委', '2', '北京市科学技术研究院', 'www.baidu.com', 22, 'AAA', '12930190', '230490', '1@bcc.ac.cn', '西三环', '10086', 0);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_model`
--

DROP TABLE IF EXISTS `bcc_model`;
CREATE TABLE IF NOT EXISTS `bcc_model` (
`id` int(11) unsigned NOT NULL COMMENT 'ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tablename` varchar(20) DEFAULT NULL COMMENT '表名',
  `setting` varchar(500) DEFAULT NULL COMMENT '设置',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `items` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'items',
  `enablesearch` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '允许搜索',
  `disabled` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `default_style` varchar(30) DEFAULT NULL COMMENT '默认风格',
  `category_template` varchar(30) DEFAULT NULL COMMENT '首页模板',
  `list_template` varchar(30) DEFAULT NULL COMMENT '列表页模板',
  `show_template` varchar(30) DEFAULT NULL COMMENT '详情页模板',
  `js_template` varchar(30) DEFAULT NULL COMMENT 'js模板',
  `admin_list_template` varchar(30) DEFAULT NULL COMMENT '管理列表页模板',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(3) NOT NULL DEFAULT '0' COMMENT '类别'
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_model`
--

INSERT INTO `bcc_model` (`id`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `admin_list_template`, `listorder`, `type`) VALUES
(106, '1', '1', '11', '2', 1, 1, 1, 0, '1', '1', '1', '1', '1', '1', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_model_field`
--

DROP TABLE IF EXISTS `bcc_model_field`;
CREATE TABLE IF NOT EXISTS `bcc_model_field` (
`id` int(11) unsigned NOT NULL COMMENT 'ID',
  `modelid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '模板ID',
  `field` varchar(20) NOT NULL COMMENT '字段名',
  `name` varchar(30) NOT NULL COMMENT '中文名',
  `css` varchar(30) DEFAULT NULL COMMENT 'css',
  `formtype` varchar(20) DEFAULT NULL COMMENT '表单类型',
  `readOnly` tinyint(1) unsigned DEFAULT '0' COMMENT '只读',
  `dataUrl` varchar(100) DEFAULT NULL COMMENT '数据初始化地址',
  `initValue` varchar(255) DEFAULT NULL COMMENT '初始化数据',
  `keyValue` varchar(255) DEFAULT NULL COMMENT '初始化文本数据',
  `minlength` int(10) unsigned DEFAULT '0' COMMENT '最小长度',
  `maxlength` int(10) unsigned DEFAULT '0' COMMENT '最大长度',
  `placeholder` varchar(255) DEFAULT NULL COMMENT '占位符',
  `message` varchar(255) DEFAULT NULL COMMENT '错误提示',
  `validator` varchar(255) DEFAULT NULL COMMENT '判断条件',
  `setting` varchar(255) DEFAULT NULL COMMENT '其他设置'
) ENGINE=MyISAM AUTO_INCREMENT=1984 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_model_field`
--

INSERT INTO `bcc_model_field` (`id`, `modelid`, `field`, `name`, `css`, `formtype`, `readOnly`, `dataUrl`, `initValue`, `keyValue`, `minlength`, `maxlength`, `placeholder`, `message`, `validator`, `setting`) VALUES
(1981, 1, 'id', 'ID', '', 'id', NULL, NULL, NULL, NULL, 0, 0, '', '', '', 'int(11) unsigned NOT NULL AUTO_INCREMENT'),
(1982, 1, 'content', '内容', '', 'text', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', ''),
(1983, 1, 'author', '作者', '', 'text', NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_model_manager`
--

DROP TABLE IF EXISTS `bcc_model_manager`;
CREATE TABLE IF NOT EXISTS `bcc_model_manager` (
`id` int(11) unsigned NOT NULL COMMENT 'ID',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `tablename` varchar(20) DEFAULT NULL COMMENT '表名',
  `setting` varchar(500) DEFAULT NULL COMMENT '设置',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '添加时间',
  `items` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'items',
  `enablesearch` int(3) unsigned NOT NULL DEFAULT '1' COMMENT '允许搜索',
  `disabled` int(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否可用',
  `default_style` varchar(30) DEFAULT NULL COMMENT '默认风格',
  `category_template` varchar(30) DEFAULT NULL COMMENT '首页模板',
  `list_template` varchar(30) DEFAULT NULL COMMENT '列表页模板',
  `show_template` varchar(30) DEFAULT NULL COMMENT '详情页模板',
  `js_template` varchar(30) DEFAULT NULL COMMENT 'js模板',
  `admin_list_template` varchar(30) DEFAULT NULL COMMENT '管理列表页模板',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序',
  `type` int(3) NOT NULL DEFAULT '0' COMMENT '类别'
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_model_manager`
--

INSERT INTO `bcc_model_manager` (`id`, `name`, `description`, `tablename`, `setting`, `addtime`, `items`, `enablesearch`, `disabled`, `default_style`, `category_template`, `list_template`, `show_template`, `js_template`, `admin_list_template`, `listorder`, `type`) VALUES
(1, '资讯', '资讯', 'bcc_content', NULL, '2016-03-16 00:05:51', 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_regulations`
--

DROP TABLE IF EXISTS `bcc_regulations`;
CREATE TABLE IF NOT EXISTS `bcc_regulations` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `enid` int(11) DEFAULT NULL COMMENT '所属单位id',
  `content` mediumtext COLLATE utf8_unicode_ci COMMENT '对外开放共享规定',
  `title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '制度名称',
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '制度编号',
  `abstract` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '摘要',
  `keywords` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '关键词',
  `pub_time` date NOT NULL COMMENT '发布日期',
  `start_time` date NOT NULL COMMENT '实施日期',
  `attachment` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '附件',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='开放共享规定';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_resources`
--

DROP TABLE IF EXISTS `bcc_resources`;
CREATE TABLE IF NOT EXISTS `bcc_resources` (
`id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `resKey` varchar(50) DEFAULT NULL,
  `type` varchar(40) DEFAULT NULL,
  `resUrl` varchar(200) DEFAULT NULL,
  `level` int(4) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `ishide` int(3) DEFAULT '0',
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_resources`
--

INSERT INTO `bcc_resources` (`id`, `name`, `parentId`, `resKey`, `type`, `resUrl`, `level`, `icon`, `ishide`, `description`) VALUES
(1, '系统基础管理', 0, 'system', '0', 'system', 1, 'fa-desktop', 0, '系统基础管理'),
(2, '管理员管理', 1, 'account', '1', '/user/search.shtml', NULL, '', 0, 'search'),
(3, '角色管理', 1, 'role', '1', '/role/search.shtml', 7, 'fa-list', 0, 'search'),
(4, '菜单管理', 1, 'bcc_resources', '1', '/resources/list.shtml', 12, 'fa-list-alt', 0, '菜单管理'),
(5, '新增用户', 2, 'account_add', '2', '/user/add.shtml', 3, NULL, 0, 'add'),
(6, '修改用户', 2, 'account_edit', '2', '/user/modify.shtml', 4, NULL, 0, 'modify'),
(7, '删除用户', 2, 'account_delete', '2', '/user/delete.shtml', 5, NULL, 0, 'delete'),
(8, '新增角色', 3, 'role_add', '2', '/role/add.shtml', 8, NULL, 0, 'add'),
(9, '修改角色', 3, 'role_edit', '2', '/role/modify.shtml', 9, NULL, 0, 'modify'),
(10, '删除角色', 3, 'role_delete', '2', '/role/delete.shtml', 10, NULL, 0, 'delete'),
(11, '分配权限', 3, 'role_perss', '2', '/resources/permissions.shtml', 11, '无', 0, 'permissions'),
(25, '登陆信息管理', 0, 'bcc_login', '0', 'bcc_login', 18, 'fa-calendar', 0, '登陆信息管理'),
(26, '用户登录记录', 25, 'bcc_log_list', '1', '/userlogin/search.shtml', 19, NULL, 0, '用户登录记录'),
(27, '操作日志管理', 0, 'bcc_log', '0', 'bcc_log', 20, 'fa-picture-o', 1, '操作日志管理'),
(28, '日志查询', 27, 'bcc_log', '1', '/logs/search.shtml', 21, NULL, 0, NULL),
(29, '新增菜单资源', 4, 'bcc_resources_add', '2', '/resources/add.shtml', 13, NULL, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;addFun&quot;&nbsp;class=&quot;btn&nbsp;btn-primary&nbsp;marR10&quot;&gt;新增&lt;/button&gt;'),
(30, '修改菜单资源', 4, 'bcc_resources_edit', '2', '/resources/modify.shtml', 14, NULL, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;editFun&quot;&nbsp;class=&quot;btn&nbsp;btn-info&nbsp;marR10&quot;&gt;编辑&lt;/button&gt;'),
(31, '删除菜单资源', 4, 'bcc_resources_delete', '2', '/resources/delete.shtml', 15, NULL, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;delFun&quot;&nbsp;class=&quot;btn&nbsp;btn-danger&nbsp;marR10&quot;&gt;删除&lt;/button&gt;'),
(32, '系统监控管理', 0, 'monitor', '0', 'monitor', 16, 'fa-tag', 0, '系统监控管理'),
(33, '实时监控', 32, 'sysmonitor', '1', '/monitor/monitor.shtml', 17, NULL, 0, '实时监控'),
(34, '分配权限', 2, 'permissions', '2', '/resources/permissions.shtml', 6, NULL, 0, '&lt;button&nbsp;type=&quot;button&quot;&nbsp;id=&quot;permissions&quot;&nbsp;class=&quot;btn&nbsp;btn&nbsp;btn-grey&nbsp;marR10&quot;&gt;分配权限&lt;/button&gt;'),
(35, '告警列表', 32, 'monitor_warn', '1', '/monitor/list.shtml', NULL, NULL, 0, '告警列表'),
(38, '搜索记录', 0, 'search', '0', '/front/search.shtml', 30, NULL, 0, '搜索记录'),
(39, '设备配置管理', 0, 'device', '0', 'device', 25, 'fa-picture-o', 0, NULL),
(40, '配置管理', 39, 'device_list', '1', '/device/list.shtml', NULL, NULL, 0, NULL),
(41, '实时采集', 0, 'realtime', '0', '/front/realtime.shtml', 31, NULL, 0, NULL),
(43, '前台管理', 0, 'front', '0', '/test/list.shtml', 32, 'fa-desktop', 0, ''),
(48, '栏目管理', 43, 'category', '1', '/category/search.shtml', NULL, '', 0, 'search'),
(49, '新增栏目', 48, 'category_add', '2', '/category/add.shtml', 34, '', 0, 'add'),
(50, '类别管理', 43, 'type', '1', '/type/treeList.shtml?url=/type/search.shtml', 35, NULL, 0, 'search'),
(51, '新增类别', 50, 'type_add', '2', '/type/add.shtml', 36, NULL, 0, 'add'),
(52, '修改栏目', 48, 'category_modify', '2', '/category/modify.shtml', NULL, '', 0, 'modify'),
(53, '删除栏目', 48, 'category_delete', '2', '/category/delete.shtml', NULL, '', 0, 'delete'),
(54, '修改类别', 50, 'type_modify', '2', '/type/modify.shtml', NULL, '', 0, 'modify'),
(55, '删除类别', 50, 'type_delete', '2', '/type/delete.shtml', NULL, '', 0, 'delete'),
(56, '模板管理', 43, 'modelmanager', '1', '/modelmanager/search.shtml', NULL, '', 0, 'search'),
(57, '新增模板', 56, 'modelmanager_add', '2', '/modelmanager/add.shtml', NULL, '', 0, 'add'),
(58, '修改模板', 56, 'modelmanager_modify', '2', '/modelmanager/modify.shtml', NULL, '', 0, 'modify'),
(59, '删除模板', 56, 'modelmanager_delete', '2', '/modelmanager/delete.shtml', NULL, '', 0, 'delete'),
(60, '模型管理', 43, 'modelfield_search', '0', '/modelmanager/treeList.shtml?url=/modelfield/search.shtml', NULL, '', 0, 'search'),
(61, '新增模型字段', 60, 'modelfield_add', '2', '/modelfield/add.shtml', NULL, '', 0, 'add'),
(62, '修改模型字段', 60, 'modelfield_modify', '0', '/modelfield/modify.shtml', NULL, '', 0, 'modify'),
(63, '删除模型字段', 60, 'modelfield_delete', '2', '/modelfield/delete.shtml', NULL, '', 0, 'delete'),
(64, '内容管理', 43, 'content', '1', '/content/search.shtml', NULL, '', 0, 'search'),
(65, '增加内容', 64, 'content_add', '2', '/content/addUI.shtml', NULL, '', 0, 'add'),
(66, '修改内容', 64, 'content_modify', '2', '/content/modify.shtml', NULL, '', 0, 'modify'),
(67, '删除内容', 64, 'content_delete', '2', '/content/delete.shtml', NULL, '', 0, 'delete'),
(68, '管理单位管理', 1, 'management_unit', '1', '/managementunit/search.shtml', NULL, '', 0, 'search'),
(69, '添加管理单位', 68, 'managementunit_add', '2', '/managementunit/add.shtml', NULL, '', 0, 'add'),
(70, '修改管理单位', 68, 'managementunit_modify', '2', '/managementunit/modify.shtml', NULL, '', 0, 'modify'),
(71, '删除管理单位', 68, 'managementunit_delete', '2', '/managementunit/delete.shtml', NULL, '', 0, 'delete'),
(72, '开放资源管理', 0, 'resource', '0', '/', NULL, 'fa-tag', 0, '开放资源管理'),
(73, '仪器设备管理', 72, 'equipment', '1', '/equipment/search.shtml', NULL, '', 0, 'search'),
(74, '新增设备', 73, 'equipment_add', '2', '/equipment/add.shtml', NULL, '', 0, 'add'),
(75, '修改设备', 73, 'equipment_modify', '2', '/equipment/modify.shtml', NULL, '', 0, 'modify'),
(76, '删除设备', 73, 'equipment_delete', '2', '/equipment/delete.shtml', NULL, '', 0, 'delete'),
(77, '用户需求管理', 0, 'demand', '0', 'demand', NULL, 'fa-tag', 0, '用户需求管理'),
(78, '需求管理', 77, 'need', '1', '/demand/search.shtml', NULL, '', 0, 'search');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_res_role`
--

DROP TABLE IF EXISTS `bcc_res_role`;
CREATE TABLE IF NOT EXISTS `bcc_res_role` (
  `resId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_res_role`
--

INSERT INTO `bcc_res_role` (`resId`, `roleId`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(29, 1),
(30, 1),
(31, 1),
(34, 1),
(1, 2),
(2, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(43, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(1, 4),
(2, 4),
(5, 4),
(6, 4),
(7, 4),
(34, 4),
(1, 5),
(2, 5),
(3, 5),
(4, 5),
(5, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(11, 5),
(29, 5),
(30, 5),
(31, 5),
(34, 5),
(1, 9),
(2, 9),
(3, 9),
(4, 9),
(5, 9),
(6, 9),
(7, 9),
(8, 9),
(9, 9),
(10, 9),
(11, 9),
(29, 9),
(30, 9),
(31, 9),
(34, 9),
(1, 10),
(2, 10),
(3, 10),
(4, 10),
(5, 10),
(6, 10),
(7, 10),
(8, 10),
(9, 10),
(10, 10),
(11, 10),
(29, 10),
(30, 10),
(31, 10),
(34, 10),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(29, 11),
(30, 11),
(31, 11),
(34, 11);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_role`
--

DROP TABLE IF EXISTS `bcc_role`;
CREATE TABLE IF NOT EXISTS `bcc_role` (
`id` int(11) NOT NULL,
  `state` varchar(3) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `roleKey` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_role`
--

INSERT INTO `bcc_role` (`id`, `state`, `name`, `roleKey`, `description`) VALUES
(1, '1', '管理员tes', 'cuc', '管理员'),
(2, '0', '普通', 'smkk', '普通角色'),
(3, '1', '超级ccc', 'rootbcc', '超级管理员'),
(4, '0', '管理单位', 'management', '管理单位联系人管理');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_server_info`
--

DROP TABLE IF EXISTS `bcc_server_info`;
CREATE TABLE IF NOT EXISTS `bcc_server_info` (
`id` int(11) NOT NULL,
  `cpuUsage` varchar(255) DEFAULT NULL,
  `setCpuUsage` varchar(255) DEFAULT NULL,
  `jvmUsage` varchar(255) DEFAULT NULL,
  `setJvmUsage` varchar(255) DEFAULT NULL,
  `ramUsage` varchar(255) DEFAULT NULL,
  `setRamUsage` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `operTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_server_info`
--

INSERT INTO `bcc_server_info` (`id`, `cpuUsage`, `setCpuUsage`, `jvmUsage`, `setJvmUsage`, `ramUsage`, `setRamUsage`, `email`, `operTime`, `mark`) VALUES
(5, '18', '40', '49', '40', '71', '40', '121261494@qq.com', '2015-04-24 18:07:02', '<font color="red">JVM当前：49%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>'),
(6, '3', '40', '50', '40', '71', '40', '121261494@qq.com', '2015-04-24 18:08:03', '<font color="red">JVM当前：50%,超出预设值 40%<br>内存当前：71%,超出预设值  40%</font>'),
(7, '5', '40', '50', '40', '70', '40', '121261494@qq.com', '2015-04-24 18:09:02', '<font color="red">JVM当前：50%,超出预设值 40%<br>内存当前：70%,超出预设值  40%</font>'),
(8, '5', '40', '52', '40', '69', '40', '121261494@qq.com', '2015-04-24 18:10:03', '<font color="red">JVM当前：52%,超出预设值 40%<br>内存当前：69%,超出预设值  40%</font>'),
(9, '2', '40', '52', '40', '68', '40', '121261494@qq.com', '2015-04-24 18:11:02', '<font color="red">JVM当前：52%,超出预设值 40%<br>内存当前：68%,超出预设值  40%</font>'),
(10, '7', '40', '53', '40', '67', '40', '121261494@qq.com', '2015-04-24 18:12:02', '<font color="red">JVM当前：53%,超出预设值 40%<br>内存当前：67%,超出预设值  40%</font>'),
(11, '5', '40', '54', '40', '67', '40', '121261494@qq.com', '2015-04-24 18:13:02', '<font color="red">JVM当前：54%,超出预设值 40%<br>内存当前：67%,超出预设值  40%</font>'),
(12, '16', '40', '55', '40', '66', '40', '121261494@qq.com', '2015-04-24 18:14:02', '<font color="red">JVM当前：55%,超出预设值 40%<br>内存当前：66%,超出预设值  40%</font>'),
(13, '5', '40', '56', '40', '65', '40', '121261494@qq.com', '2015-04-24 18:15:02', '<font color="red">JVM当前：56%,超出预设值 40%<br>内存当前：65%,超出预设值  40%</font>'),
(14, '8', '40', '57', '40', '64', '40', '121261494@qq.com', '2015-04-24 18:16:02', '<font color="red">JVM当前：57%,超出预设值 40%<br>内存当前：64%,超出预设值  40%</font>'),
(15, '3', '40', '58', '40', '63', '40', '121261494@qq.com', '2015-04-24 18:17:02', '<font color="red">JVM当前：58%,超出预设值 40%<br>内存当前：63%,超出预设值  40%</font>'),
(16, '6', '40', '59', '40', '62', '40', '121261494@qq.com', '2015-04-24 18:18:03', '<font color="red">JVM当前：59%,超出预设值 40%<br>内存当前：62%,超出预设值  40%</font>'),
(17, '1', '40', '60', '40', '61', '40', '121261494@qq.com', '2015-04-24 18:19:02', '<font color="red">JVM当前：60%,超出预设值 40%<br>内存当前：61%,超出预设值  40%</font>'),
(18, '5', '40', '61', '40', '61', '40', '121261494@qq.com', '2015-04-24 18:20:02', '<font color="red">JVM当前：61%,超出预设值 40%<br>内存当前：61%,超出预设值  40%</font>'),
(19, '5', '40', '38', '40', '61', '40', '121261494@qq.com', '2015-04-24 18:21:02', '<font color="red">内存当前：61%,超出预设值  40%</font>'),
(20, '5', '40', '39', '40', '60', '40', '121261494@qq.com', '2015-04-24 18:22:02', '<font color="red">内存当前：60%,超出预设值  40%</font>'),
(21, '4', '40', '40', '40', '59', '40', '121261494@qq.com', '2015-04-24 18:23:02', '<font color="red">内存当前：59%,超出预设值  40%</font>'),
(22, '32', '80', '41', '80', '81', '80', '121261494@qq.com', '2015-04-25 01:43:05', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
(23, '55', '80', '55', '80', '81', '80', '121261494@qq.com', '2015-04-25 01:50:03', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
(24, '13', '80', '53', '80', '81', '80', '121261494@qq.com', '2015-04-25 01:59:08', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
(25, '85', '80', '58', '80', '72', '80', '121261494@qq.com', '2015-04-25 02:46:06', '<font color="red">CPU当前：85%,超出预设值  80%<br></font>'),
(26, '34', '80', '59', '80', '81', '80', '121261494@qq.com', '2015-04-26 00:29:06', '<font color="red">内存当前：81%,超出预设值  80%</font>'),
(27, '92', '80', '47', '80', '64', '80', '121261494@qq.com', '2015-04-26 00:44:07', '<font color="red">CPU当前：92%,超出预设值  80%<br></font>'),
(28, '85', '80', '49', '80', '68', '80', '121261494@qq.com', '2015-04-26 23:38:04', '<font color="red">CPU当前：85%,超出预设值  80%<br></font>'),
(29, '94', '80', '69', '80', '73', '80', '121261494@qq.com', '2015-04-27 01:35:03', '<font color="red">CPU当前：94%,超出预设值  80%<br></font>'),
(30, '6', '80', '43', '80', '87', '80', '121261494@qq.com', '2015-05-08 00:00:08', '<font color="red">内存当前：87%,超出预设值  80%</font>'),
(31, '88', '80', '59', '80', '87', '80', '121261494@qq.com', '2015-05-08 00:01:14', '<font color="red">CPU当前：88%,超出预设值  80%<br>内存当前：87%,超出预设值  80%</font>');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_service`
--

DROP TABLE IF EXISTS `bcc_service`;
CREATE TABLE IF NOT EXISTS `bcc_service` (
`id` int(11) NOT NULL COMMENT 'ID',
  `enid` int(11) NOT NULL COMMENT '所属单位ID',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT '服务单元名称',
  `url` int(50) DEFAULT NULL COMMENT '服务网址',
  `start_date` date DEFAULT NULL COMMENT '成立日期',
  `type` int(11) DEFAULT NULL COMMENT '业务类别',
  `use_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务单元类别',
  `function` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要功能',
  `discipline` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '主要学科领域',
  `service_content` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务内容',
  `picture` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片',
  `fee` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '参考收费标准',
  `lay_address1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(省）',
  `lay_address2` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(市）',
  `lay_address3` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(区）',
  `lay_address4` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '安放地址(街道）',
  `parameter` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其他参数',
  `standard` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '规格',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态',
  `introduction` mediumtext COLLATE utf8_unicode_ci COMMENT '简介',
  `abstract` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT '摘要',
  `ver` int(11) DEFAULT NULL COMMENT '版本',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除标记'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='技术服务';

-- --------------------------------------------------------

--
-- 表的结构 `bcc_type`
--

DROP TABLE IF EXISTS `bcc_type`;
CREATE TABLE IF NOT EXISTS `bcc_type` (
`id` int(11) unsigned NOT NULL COMMENT 'Id',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `parentid` int(11) unsigned DEFAULT '0' COMMENT '父类别id',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `keyword` varchar(80) NOT NULL DEFAULT '' COMMENT '关键词',
  `listorder` int(11) DEFAULT '0' COMMENT '显示顺序',
  `onindex` int(11) DEFAULT '1' COMMENT '是否首页显示'
) ENGINE=MyISAM AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_type`
--

INSERT INTO `bcc_type` (`id`, `name`, `parentid`, `description`, `keyword`, `listorder`, `onindex`) VALUES
(140, '生物医药及器械', 0, '生物医药及器械', '', 0, 1),
(141, '化学化工', 0, '化学化工', '', 1, 1),
(142, '金属材料', 0, '金属材料', '', 2, 1),
(143, '电子器械及机械', 0, '电子器械及机械', '', 3, 1),
(144, '电磁兼容（EMC）', 0, '电磁兼容（EMC）', '', 4, 1),
(145, '软件信息', 0, '软件信息', '', 5, 1),
(146, '药物代谢', 140, '药物代谢', '', 0, 1),
(147, '高通量筛选', 140, '高通量筛选', '', 1, 1),
(148, '化合物', 141, '化合物', '', 0, 1),
(149, '中间体', 141, '中间体', '', 1, 1),
(150, '高分子材料', 141, '高分子材料', '', 2, 1),
(151, '金相检验', 142, '金相检验', '', 0, 1),
(152, '失效分析', 142, '失效分析', '', 1, 1),
(153, 'LED', 143, 'LED', '', 0, 1),
(154, '集成电路', 143, '集成电路', '', 1, 1),
(155, '微系统', 143, '微系统', '', 2, 1),
(156, 'EMI', 144, 'EMI', '', 0, 1),
(157, 'EMS', 144, 'EMS', '', 1, 1),
(158, 'RFID', 144, 'RFID', '', 2, 1),
(159, '软件测试', 145, '软件测试', '', 0, 1),
(160, '云计算', 145, '云计算', '', 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_user`
--

DROP TABLE IF EXISTS `bcc_user`;
CREATE TABLE IF NOT EXISTS `bcc_user` (
`id` int(11) NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `credentialsSalt` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `description` varchar(100) DEFAULT NULL,
  `locked` varchar(3) DEFAULT '0',
  `unit_id` varchar(255) DEFAULT NULL COMMENT '所属管理单位id，若为空，则不属于任何管理单位，若不为空，那么其只能对属于同一个unit_id的用户进行相关操作',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delete_status` int(1) DEFAULT '0' COMMENT '逻辑删除状态0:存在1:删除'
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_user`
--

INSERT INTO `bcc_user` (`id`, `userName`, `accountName`, `password`, `credentialsSalt`, `email`, `telephone`, `description`, `locked`, `unit_id`, `createTime`, `delete_status`) VALUES
(3, 'tesd', 'admin', '78e21a6eb88529eab722793a448ed394', '4157c3feef4a6ed91b2c28cf4392f2d1', NULL, NULL, '3434', '1', NULL, '2016-03-25 09:55:43', 0),
(4, '超级管理员', 'root', '70dbfaba9062f51b8f2129e2668add80', '2a52bb8d776f848f7da9380c1811983d', NULL, NULL, '超级管理员账号', '1', NULL, '2016-03-23 04:18:51', 1),
(6, 'tesaa', 'ad', 'cc575cac799e6176d3779af9b5901185', '36deed6cbee1e1ec16f09d7b9d57d0dc', NULL, NULL, 'ad', '1', NULL, '2016-03-25 08:26:16', 0),
(20, 'ddccc', '', '8cf122d79069ae7f983da78831bb11ba', '45362c9845bd70dd0a5820f5265e65ba', '', NULL, 'xxxxxcucc', '0', '16', '2016-03-29 01:20:52', 0),
(22, 'cxxx', '1@bcc.ac.cn', '42010b8a793bc30cf9c3354a57f258b0', '5cc2a1ce242ba0dd9da806d10d30abed', '1@bcc.ac.cn', NULL, 'xx休息休', '1', '18', '2016-03-29 06:54:54', 0),
(23, 'lifm', 'lifm', '3fcf704bd5856b2cfa0233fccf9490a0', 'aafc3616957d686907385b6d7df27cca', NULL, NULL, 'hahaha', '1', '18', '2016-03-25 09:52:23', 0),
(24, 'lifm11', 'lifm1', '184a4168c59fb93ad90e0bc1cc288c36', '3c37186a3b478395d739e6e06400fee2', NULL, NULL, 'lifm11', '1', NULL, '2016-03-25 10:03:42', 0),
(25, 'lifm2', 'lifm2', '5c836a599a04ee6de0b8a412d928660f', 'ff05f49e249e7af18676004f2849b407', NULL, NULL, 'lifm2', '1', NULL, '2016-03-24 06:15:37', 1),
(26, 'lifm3', 'lifm3', 'a078aa0c4f298953224a486dd04b130a', '30d199af0d91b0fb54d29ffbb0e82796', NULL, NULL, 'lifm3', '1', NULL, '2016-03-24 06:15:37', 1),
(27, 'lifm4', 'lifm4', 'b2120c32c4a35d9901fa9283ba391072', 'c602dc92803d1ea08602b195509bc116', NULL, NULL, 'lifm4', '1', NULL, '2016-03-24 06:15:37', 1);

-- --------------------------------------------------------

--
-- 表的结构 `bcc_userlogin`
--

DROP TABLE IF EXISTS `bcc_userlogin`;
CREATE TABLE IF NOT EXISTS `bcc_userlogin` (
`id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `accountName` varchar(20) DEFAULT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `loginIP` varchar(40) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_userlogin`
--

INSERT INTO `bcc_userlogin` (`id`, `userId`, `accountName`, `loginTime`, `loginIP`) VALUES
(143, 3, 'admin', '2015-12-17 11:30:42', '0:0:0:0:0:0:0:1'),
(144, 3, 'admin', '2015-12-17 12:04:21', '0:0:0:0:0:0:0:1'),
(145, 3, 'admin', '2015-12-17 12:42:24', '0:0:0:0:0:0:0:1'),
(146, 3, 'admin', '2015-12-17 13:22:00', '0:0:0:0:0:0:0:1'),
(147, 3, 'admin', '2015-12-17 21:01:51', '0:0:0:0:0:0:0:1'),
(148, 3, 'admin', '2015-12-17 21:05:37', '0:0:0:0:0:0:0:1'),
(149, 3, 'admin', '2016-02-02 16:10:43', '0:0:0:0:0:0:0:1'),
(150, 3, 'admin', '2016-02-02 16:13:50', '0:0:0:0:0:0:0:1'),
(151, 3, 'admin', '2016-02-02 16:30:31', '0:0:0:0:0:0:0:1'),
(152, 3, 'admin', '2016-02-02 16:34:23', '0:0:0:0:0:0:0:1'),
(153, 3, 'admin', '2016-02-02 16:37:14', '0:0:0:0:0:0:0:1'),
(154, 3, 'admin', '2016-02-02 16:41:56', '0:0:0:0:0:0:0:1'),
(155, 3, 'admin', '2016-02-02 16:52:24', '0:0:0:0:0:0:0:1'),
(156, 3, 'admin', '2016-02-02 17:06:25', '0:0:0:0:0:0:0:1'),
(157, 3, 'admin', '2016-02-02 17:08:09', '0:0:0:0:0:0:0:1'),
(158, 3, 'admin', '2016-02-02 17:14:40', '0:0:0:0:0:0:0:1'),
(159, 3, 'admin', '2016-02-02 17:26:19', '0:0:0:0:0:0:0:1'),
(160, 3, 'admin', '2016-02-03 09:00:55', '0:0:0:0:0:0:0:1'),
(161, 3, 'admin', '2016-02-03 09:07:43', '0:0:0:0:0:0:0:1'),
(162, 3, 'admin', '2016-02-03 09:12:17', '0:0:0:0:0:0:0:1'),
(163, 3, 'admin', '2016-02-03 09:12:30', '0:0:0:0:0:0:0:1'),
(164, 3, 'admin', '2016-02-03 09:24:19', '0:0:0:0:0:0:0:1'),
(165, 3, 'admin', '2016-02-03 09:58:58', '0:0:0:0:0:0:0:1'),
(166, 3, 'admin', '2016-02-03 12:56:03', '0:0:0:0:0:0:0:1'),
(167, 3, 'admin', '2016-02-03 12:58:39', '0:0:0:0:0:0:0:1'),
(168, 3, 'admin', '2016-02-03 13:01:55', '0:0:0:0:0:0:0:1'),
(169, 3, 'admin', '2016-02-21 13:28:24', '0:0:0:0:0:0:0:1'),
(170, 3, 'admin', '2016-02-21 13:30:41', '0:0:0:0:0:0:0:1'),
(171, 3, 'admin', '2016-02-21 14:22:50', '0:0:0:0:0:0:0:1'),
(172, 3, 'admin', '2016-02-21 16:02:28', '0:0:0:0:0:0:0:1'),
(173, 3, 'admin', '2016-02-21 16:34:01', '0:0:0:0:0:0:0:1'),
(174, 3, 'admin', '2016-02-21 16:36:52', '0:0:0:0:0:0:0:1'),
(175, 3, 'admin', '2016-02-22 11:16:49', '0:0:0:0:0:0:0:1'),
(176, 3, 'admin', '2016-02-22 12:41:14', '0:0:0:0:0:0:0:1'),
(177, 3, 'admin', '2016-02-22 12:41:31', '0:0:0:0:0:0:0:1'),
(178, 3, 'admin', '2016-02-22 12:49:51', '0:0:0:0:0:0:0:1'),
(179, 3, 'admin', '2016-02-22 12:57:53', '0:0:0:0:0:0:0:1'),
(180, 3, 'admin', '2016-02-22 13:25:45', '0:0:0:0:0:0:0:1'),
(181, 3, 'admin', '2016-02-22 13:33:13', '0:0:0:0:0:0:0:1'),
(182, 3, 'admin', '2016-02-22 14:07:49', '0:0:0:0:0:0:0:1'),
(183, 3, 'admin', '2016-02-22 14:14:20', '0:0:0:0:0:0:0:1'),
(184, 3, 'admin', '2016-02-22 14:24:07', '0:0:0:0:0:0:0:1'),
(185, 3, 'admin', '2016-02-22 14:25:14', '0:0:0:0:0:0:0:1'),
(186, 3, 'admin', '2016-02-22 15:17:48', '0:0:0:0:0:0:0:1'),
(187, 3, 'admin', '2016-02-22 16:14:28', '0:0:0:0:0:0:0:1'),
(188, 3, 'admin', '2016-03-02 09:38:39', '0:0:0:0:0:0:0:1'),
(189, 3, 'admin', '2016-03-02 09:38:41', '0:0:0:0:0:0:0:1'),
(190, 3, 'admin', '2016-03-02 09:38:51', '0:0:0:0:0:0:0:1'),
(191, 3, 'admin', '2016-03-02 09:44:45', '0:0:0:0:0:0:0:1'),
(192, 3, 'admin', '2016-03-02 09:44:47', '0:0:0:0:0:0:0:1'),
(193, 3, 'admin', '2016-03-02 09:44:54', '0:0:0:0:0:0:0:1'),
(194, 3, 'admin', '2016-03-02 09:44:55', '0:0:0:0:0:0:0:1'),
(195, 3, 'admin', '2016-03-02 09:45:11', '0:0:0:0:0:0:0:1'),
(196, 3, 'admin', '2016-03-02 09:46:48', '0:0:0:0:0:0:0:1'),
(197, 3, 'admin', '2016-03-02 09:50:56', '0:0:0:0:0:0:0:1'),
(198, 3, 'admin', '2016-03-02 09:55:56', '0:0:0:0:0:0:0:1'),
(199, 3, 'admin', '2016-03-02 09:57:19', '0:0:0:0:0:0:0:1'),
(200, 3, 'admin', '2016-03-02 13:56:59', '0:0:0:0:0:0:0:1'),
(201, 3, 'admin', '2016-03-02 13:57:06', '0:0:0:0:0:0:0:1'),
(202, 3, 'admin', '2016-03-02 13:57:06', '0:0:0:0:0:0:0:1'),
(203, 3, 'admin', '2016-03-02 13:58:29', '0:0:0:0:0:0:0:1'),
(204, 3, 'admin', '2016-03-02 14:01:15', '0:0:0:0:0:0:0:1'),
(205, 3, 'admin', '2016-03-02 14:07:34', '0:0:0:0:0:0:0:1'),
(206, 3, 'admin', '2016-03-02 14:07:41', '0:0:0:0:0:0:0:1'),
(207, 3, 'admin', '2016-03-02 14:42:02', '0:0:0:0:0:0:0:1'),
(208, 3, 'admin', '2016-03-02 14:42:05', '0:0:0:0:0:0:0:1'),
(209, 3, 'admin', '2016-03-02 14:42:36', '0:0:0:0:0:0:0:1'),
(210, 3, 'admin', '2016-03-02 14:48:38', '0:0:0:0:0:0:0:1'),
(211, 3, 'admin', '2016-03-02 14:50:16', '0:0:0:0:0:0:0:1'),
(212, 3, 'admin', '2016-03-06 15:34:10', '0:0:0:0:0:0:0:1'),
(213, 3, 'admin', '2016-03-06 16:46:17', '0:0:0:0:0:0:0:1'),
(214, 3, 'admin', '2016-03-06 16:59:55', '0:0:0:0:0:0:0:1'),
(215, 3, 'admin', '2016-03-06 17:19:30', '0:0:0:0:0:0:0:1'),
(216, 3, 'admin', '2016-03-06 17:20:25', '0:0:0:0:0:0:0:1'),
(217, 3, 'admin', '2016-03-06 17:41:24', '0:0:0:0:0:0:0:1'),
(218, 3, 'admin', '2016-03-06 17:48:28', '0:0:0:0:0:0:0:1'),
(219, 3, 'admin', '2016-03-06 17:53:23', '0:0:0:0:0:0:0:1'),
(220, 3, 'admin', '2016-03-06 17:56:29', '0:0:0:0:0:0:0:1'),
(221, 3, 'admin', '2016-03-07 09:46:17', '0:0:0:0:0:0:0:1'),
(222, 3, 'admin', '2016-03-07 09:56:28', '0:0:0:0:0:0:0:1'),
(223, 3, 'admin', '2016-03-07 10:21:32', '0:0:0:0:0:0:0:1'),
(224, 3, 'admin', '2016-03-07 10:22:24', '0:0:0:0:0:0:0:1'),
(225, 3, 'admin', '2016-03-07 12:43:02', '0:0:0:0:0:0:0:1'),
(226, 3, 'admin', '2016-03-07 16:22:28', '0:0:0:0:0:0:0:1'),
(227, 3, 'admin', '2016-03-07 16:58:04', '0:0:0:0:0:0:0:1'),
(228, 3, 'admin', '2016-03-08 09:51:42', '0:0:0:0:0:0:0:1'),
(229, 3, 'admin', '2016-03-08 20:18:27', '127.0.0.1'),
(230, 3, 'admin', '2016-03-08 20:21:29', '127.0.0.1'),
(231, 3, 'admin', '2016-03-08 20:29:34', '127.0.0.1'),
(232, 3, 'admin', '2016-03-08 20:31:48', '127.0.0.1'),
(233, 3, 'admin', '2016-03-08 20:49:18', '0:0:0:0:0:0:0:1'),
(234, 3, 'admin', '2016-03-08 21:10:55', '0:0:0:0:0:0:0:1'),
(235, 3, 'admin', '2016-03-08 21:15:43', '0:0:0:0:0:0:0:1'),
(236, 3, 'admin', '2016-03-08 21:17:12', '0:0:0:0:0:0:0:1'),
(237, 3, 'admin', '2016-03-08 21:21:17', '0:0:0:0:0:0:0:1'),
(238, 3, 'admin', '2016-03-09 19:00:53', '0:0:0:0:0:0:0:1'),
(239, 3, 'admin', '2016-03-09 21:59:48', '127.0.0.1'),
(240, 3, 'admin', '2016-03-09 23:56:23', '127.0.0.1'),
(241, 3, 'admin', '2016-03-10 00:33:46', '0:0:0:0:0:0:0:1'),
(242, 3, 'admin', '2016-03-10 01:13:28', '0:0:0:0:0:0:0:1'),
(243, 3, 'admin', '2016-03-10 01:14:53', '0:0:0:0:0:0:0:1'),
(244, 3, 'admin', '2016-03-10 01:35:03', '127.0.0.1'),
(245, 3, 'admin', '2016-03-10 01:35:49', '127.0.0.1'),
(246, 3, 'admin', '2016-03-10 01:36:35', '127.0.0.1'),
(247, 3, 'admin', '2016-03-10 01:36:55', '127.0.0.1'),
(248, 3, 'admin', '2016-03-10 01:39:43', '0:0:0:0:0:0:0:1'),
(249, 3, 'admin', '2016-03-10 01:48:36', '127.0.0.1'),
(250, 3, 'admin', '2016-03-10 01:51:56', '127.0.0.1'),
(251, 3, 'admin', '2016-03-10 17:04:13', '127.0.0.1'),
(252, 3, 'admin', '2016-03-10 17:14:42', '127.0.0.1'),
(253, 3, 'admin', '2016-03-10 17:46:42', '0:0:0:0:0:0:0:1'),
(254, 3, 'admin', '2016-03-10 17:57:00', '127.0.0.1'),
(255, 3, 'admin', '2016-03-10 18:29:36', '0:0:0:0:0:0:0:1'),
(256, 3, 'admin', '2016-03-10 19:11:06', '127.0.0.1'),
(257, 3, 'admin', '2016-03-10 19:29:14', '0:0:0:0:0:0:0:1'),
(258, 3, 'admin', '2016-03-10 19:38:11', '0:0:0:0:0:0:0:1'),
(259, 3, 'admin', '2016-03-10 20:16:47', '127.0.0.1'),
(260, 3, 'admin', '2016-03-10 21:13:12', '127.0.0.1'),
(261, 3, 'admin', '2016-03-10 21:26:10', '0:0:0:0:0:0:0:1'),
(262, 3, 'admin', '2016-03-11 00:03:28', '0:0:0:0:0:0:0:1'),
(263, 3, 'admin', '2016-03-11 00:18:08', '127.0.0.1'),
(264, 3, 'admin', '2016-03-11 00:18:20', '127.0.0.1'),
(265, 3, 'admin', '2016-03-11 00:18:33', '127.0.0.1'),
(266, 3, 'admin', '2016-03-11 00:32:24', '0:0:0:0:0:0:0:1'),
(267, 3, 'admin', '2016-03-11 01:32:08', '127.0.0.1'),
(268, 3, 'admin', '2016-03-11 01:32:13', '0:0:0:0:0:0:0:1'),
(269, 3, 'admin', '2016-03-13 17:16:51', '127.0.0.1'),
(270, 3, 'admin', '2016-03-13 17:24:28', '127.0.0.1'),
(271, 3, 'admin', '2016-03-13 18:38:15', '127.0.0.1'),
(272, 3, 'admin', '2016-03-13 18:51:30', '127.0.0.1'),
(273, 3, 'admin', '2016-03-13 18:54:38', '127.0.0.1'),
(274, 3, 'admin', '2016-03-13 18:54:42', '0:0:0:0:0:0:0:1'),
(275, 3, 'admin', '2016-03-13 19:00:53', '0:0:0:0:0:0:0:1'),
(276, 3, 'admin', '2016-03-13 19:02:31', '0:0:0:0:0:0:0:1'),
(277, 3, 'admin', '2016-03-13 19:06:25', '0:0:0:0:0:0:0:1'),
(278, 3, 'admin', '2016-03-13 21:20:22', '0:0:0:0:0:0:0:1'),
(279, 3, 'admin', '2016-03-13 21:37:41', '0:0:0:0:0:0:0:1'),
(280, 3, 'admin', '2016-03-13 21:39:42', '0:0:0:0:0:0:0:1'),
(281, 3, 'admin', '2016-03-13 21:42:31', '0:0:0:0:0:0:0:1'),
(282, 3, 'admin', '2016-03-13 21:45:47', '0:0:0:0:0:0:0:1'),
(283, 3, 'admin', '2016-03-13 22:08:43', '127.0.0.1'),
(284, 3, 'admin', '2016-03-13 22:14:09', '127.0.0.1'),
(285, 3, 'admin', '2016-03-13 22:18:08', '127.0.0.1'),
(286, 3, 'admin', '2016-03-13 22:18:51', '127.0.0.1'),
(287, 3, 'admin', '2016-03-13 22:22:02', '127.0.0.1'),
(288, 3, 'admin', '2016-03-13 22:23:20', '127.0.0.1'),
(289, 3, 'admin', '2016-03-13 22:38:26', '127.0.0.1'),
(290, 3, 'admin', '2016-03-13 22:41:08', '127.0.0.1'),
(291, 3, 'admin', '2016-03-13 22:46:41', '127.0.0.1'),
(292, 3, 'admin', '2016-03-13 23:18:41', '0:0:0:0:0:0:0:1'),
(293, 3, 'admin', '2016-03-13 23:21:22', '0:0:0:0:0:0:0:1'),
(294, 3, 'admin', '2016-03-13 23:25:28', '0:0:0:0:0:0:0:1'),
(295, 3, 'admin', '2016-03-13 23:26:51', '0:0:0:0:0:0:0:1'),
(296, 3, 'admin', '2016-03-13 23:29:16', '0:0:0:0:0:0:0:1'),
(297, 3, 'admin', '2016-03-13 23:30:40', '0:0:0:0:0:0:0:1'),
(298, 3, 'admin', '2016-03-13 23:36:35', '127.0.0.1'),
(299, 3, 'admin', '2016-03-13 23:37:12', '127.0.0.1'),
(300, 3, 'admin', '2016-03-13 23:40:42', '127.0.0.1'),
(301, 3, 'admin', '2016-03-13 23:44:30', '127.0.0.1'),
(302, 3, 'admin', '2016-03-13 23:56:32', '0:0:0:0:0:0:0:1'),
(303, 3, 'admin', '2016-03-13 23:58:14', '0:0:0:0:0:0:0:1'),
(304, 3, 'admin', '2016-03-14 00:17:22', '127.0.0.1'),
(305, 3, 'admin', '2016-03-14 00:31:09', '0:0:0:0:0:0:0:1'),
(306, 3, 'admin', '2016-03-14 01:02:19', '127.0.0.1'),
(307, 3, 'admin', '2016-03-14 01:03:39', '127.0.0.1'),
(308, 3, 'admin', '2016-03-14 01:19:01', '0:0:0:0:0:0:0:1'),
(309, 3, 'admin', '2016-03-14 01:22:12', '0:0:0:0:0:0:0:1'),
(310, 3, 'admin', '2016-03-14 01:29:51', '0:0:0:0:0:0:0:1'),
(311, 3, 'admin', '2016-03-14 01:33:51', '0:0:0:0:0:0:0:1'),
(312, 3, 'admin', '2016-03-14 01:36:03', '0:0:0:0:0:0:0:1'),
(313, 3, 'admin', '2016-03-14 01:37:10', '0:0:0:0:0:0:0:1'),
(314, 3, 'admin', '2016-03-14 01:51:37', '0:0:0:0:0:0:0:1'),
(315, 3, 'admin', '2016-03-14 01:52:20', '0:0:0:0:0:0:0:1'),
(316, 3, 'admin', '2016-03-14 01:55:33', '127.0.0.1'),
(317, 3, 'admin', '2016-03-14 17:32:43', '127.0.0.1'),
(318, 3, 'admin', '2016-03-14 17:33:26', '127.0.0.1'),
(319, 3, 'admin', '2016-03-14 17:49:25', '127.0.0.1'),
(320, 3, 'admin', '2016-03-14 18:11:58', '0:0:0:0:0:0:0:1'),
(321, 3, 'admin', '2016-03-14 18:39:09', '127.0.0.1'),
(322, 3, 'admin', '2016-03-14 18:54:34', '0:0:0:0:0:0:0:1'),
(323, 3, 'admin', '2016-03-14 19:01:16', '127.0.0.1'),
(324, 3, 'admin', '2016-03-14 19:06:19', '127.0.0.1'),
(325, 3, 'admin', '2016-03-14 19:07:14', '0:0:0:0:0:0:0:1'),
(326, 3, 'admin', '2016-03-14 21:28:43', '127.0.0.1'),
(327, 3, 'admin', '2016-03-14 21:49:32', '0:0:0:0:0:0:0:1'),
(328, 3, 'admin', '2016-03-14 22:20:02', '0:0:0:0:0:0:0:1'),
(329, 3, 'admin', '2016-03-14 22:23:27', '0:0:0:0:0:0:0:1'),
(330, 3, 'admin', '2016-03-14 22:27:25', '127.0.0.1'),
(331, 3, 'admin', '2016-03-14 22:28:48', '127.0.0.1'),
(332, 3, 'admin', '2016-03-14 23:08:28', '0:0:0:0:0:0:0:1'),
(333, 3, 'admin', '2016-03-14 23:11:07', '0:0:0:0:0:0:0:1'),
(334, 3, 'admin', '2016-03-14 23:27:28', '127.0.0.1'),
(335, 3, 'admin', '2016-03-15 00:18:10', '0:0:0:0:0:0:0:1'),
(336, 3, 'admin', '2016-03-15 00:26:48', '0:0:0:0:0:0:0:1'),
(337, 3, 'admin', '2016-03-15 00:32:35', '0:0:0:0:0:0:0:1'),
(338, 3, 'admin', '2016-03-15 01:04:09', '0:0:0:0:0:0:0:1'),
(339, 3, 'admin', '2016-03-15 01:07:19', '127.0.0.1'),
(340, 3, 'admin', '2016-03-15 01:48:29', '0:0:0:0:0:0:0:1'),
(341, 3, 'admin', '2016-03-15 01:52:53', '127.0.0.1'),
(342, 3, 'admin', '2016-03-15 01:55:43', '127.0.0.1'),
(343, 3, 'admin', '2016-03-15 17:22:17', '0:0:0:0:0:0:0:1'),
(344, 3, 'admin', '2016-03-15 17:27:49', '127.0.0.1'),
(345, 3, 'admin', '2016-03-15 18:00:17', '127.0.0.1'),
(346, 3, 'admin', '2016-03-15 18:02:40', '0:0:0:0:0:0:0:1'),
(347, 3, 'admin', '2016-03-15 18:06:52', '127.0.0.1'),
(348, 3, 'admin', '2016-03-15 18:43:51', '127.0.0.1'),
(349, 3, 'admin', '2016-03-15 19:06:55', '127.0.0.1'),
(350, 3, 'admin', '2016-03-15 19:07:30', '0:0:0:0:0:0:0:1'),
(351, 3, 'admin', '2016-03-15 19:18:09', '0:0:0:0:0:0:0:1'),
(352, 3, 'admin', '2016-03-15 19:23:07', '127.0.0.1'),
(353, 3, 'admin', '2016-03-15 20:15:28', '127.0.0.1'),
(354, 3, 'admin', '2016-03-15 21:03:30', '127.0.0.1'),
(355, 3, 'admin', '2016-03-15 21:19:16', '0:0:0:0:0:0:0:1'),
(356, 3, 'admin', '2016-03-15 21:42:09', '127.0.0.1'),
(357, 3, 'admin', '2016-03-15 21:44:11', '127.0.0.1'),
(358, 3, 'admin', '2016-03-15 21:50:36', '0:0:0:0:0:0:0:1'),
(359, 3, 'admin', '2016-03-15 21:52:04', '0:0:0:0:0:0:0:1'),
(360, 3, 'admin', '2016-03-15 22:12:01', '127.0.0.1'),
(361, 3, 'admin', '2016-03-15 22:19:56', '0:0:0:0:0:0:0:1'),
(362, 3, 'admin', '2016-03-15 22:21:34', '127.0.0.1'),
(363, 3, 'admin', '2016-03-15 22:27:06', '0:0:0:0:0:0:0:1'),
(364, 3, 'admin', '2016-03-15 22:31:28', '127.0.0.1'),
(365, 3, 'admin', '2016-03-15 22:41:54', '0:0:0:0:0:0:0:1'),
(366, 3, 'admin', '2016-03-15 23:13:29', '127.0.0.1'),
(367, 3, 'admin', '2016-03-15 23:37:18', '0:0:0:0:0:0:0:1'),
(368, 3, 'admin', '2016-03-16 00:43:51', '127.0.0.1'),
(369, 3, 'admin', '2016-03-16 00:44:59', '0:0:0:0:0:0:0:1'),
(370, 3, 'admin', '2016-03-16 00:49:45', '0:0:0:0:0:0:0:1'),
(371, 3, 'admin', '2016-03-16 01:00:59', '127.0.0.1'),
(372, 3, 'admin', '2016-03-16 01:10:47', '127.0.0.1'),
(373, 3, 'admin', '2016-03-16 01:12:02', '127.0.0.1'),
(374, 3, 'admin', '2016-03-16 01:13:10', '0:0:0:0:0:0:0:1'),
(375, 3, 'admin', '2016-03-16 01:17:51', '0:0:0:0:0:0:0:1'),
(376, 3, 'admin', '2016-03-16 01:37:26', '127.0.0.1'),
(377, 3, 'admin', '2016-03-17 07:21:04', '127.0.0.1'),
(378, 3, 'admin', '2016-03-17 07:25:42', '127.0.0.1'),
(379, 3, 'admin', '2016-03-17 08:41:11', '0:0:0:0:0:0:0:1'),
(380, 3, 'admin', '2016-03-17 08:45:43', '0:0:0:0:0:0:0:1'),
(381, 3, 'admin', '2016-03-17 08:49:16', '0:0:0:0:0:0:0:1'),
(382, 3, 'admin', '2016-03-17 08:50:01', '0:0:0:0:0:0:0:1'),
(383, 3, 'admin', '2016-03-17 08:53:02', '0:0:0:0:0:0:0:1'),
(384, 3, 'admin', '2016-03-17 08:54:01', '127.0.0.1'),
(385, 3, 'admin', '2016-03-17 08:59:36', '127.0.0.1'),
(386, 3, 'admin', '2016-03-17 09:00:05', '127.0.0.1'),
(387, 3, 'admin', '2016-03-17 09:00:59', '0:0:0:0:0:0:0:1'),
(388, 3, 'admin', '2016-03-17 09:01:15', '127.0.0.1'),
(389, 3, 'admin', '2016-03-17 09:02:24', '127.0.0.1'),
(390, 3, 'admin', '2016-03-17 09:03:28', '127.0.0.1'),
(391, 3, 'admin', '2016-03-17 09:04:29', '127.0.0.1'),
(392, 3, 'admin', '2016-03-17 09:09:56', '127.0.0.1'),
(393, 3, 'admin', '2016-03-18 01:24:59', '127.0.0.1'),
(394, 3, 'admin', '2016-03-18 01:36:25', '0:0:0:0:0:0:0:1'),
(395, 3, 'admin', '2016-03-18 04:57:42', '127.0.0.1'),
(396, 3, 'admin', '2016-03-18 09:02:08', '0:0:0:0:0:0:0:1'),
(397, 3, 'admin', '2016-03-18 09:03:55', '127.0.0.1'),
(398, 3, 'admin', '2016-03-21 01:59:04', '127.0.0.1'),
(399, 3, 'admin', '2016-03-21 02:11:23', '127.0.0.1'),
(400, 3, 'admin', '2016-03-21 02:11:26', '127.0.0.1'),
(401, 3, 'admin', '2016-03-21 02:11:54', '127.0.0.1'),
(402, 3, 'admin', '2016-03-21 02:11:56', '127.0.0.1'),
(403, 3, 'admin', '2016-03-21 02:11:59', '127.0.0.1'),
(404, 3, 'admin', '2016-03-21 02:12:45', '127.0.0.1'),
(405, 3, 'admin', '2016-03-21 02:12:48', '127.0.0.1'),
(406, 3, 'admin', '2016-03-21 02:13:37', '127.0.0.1'),
(407, 3, 'admin', '2016-03-21 02:13:54', '127.0.0.1'),
(408, 3, 'admin', '2016-03-21 02:14:02', '127.0.0.1'),
(409, 3, 'admin', '2016-03-21 02:14:05', '127.0.0.1'),
(410, 3, 'admin', '2016-03-21 02:14:07', '127.0.0.1'),
(411, 3, 'admin', '2016-03-21 02:14:10', '127.0.0.1'),
(412, 3, 'admin', '2016-03-21 02:14:30', '127.0.0.1'),
(413, 3, 'admin', '2016-03-21 02:15:17', '127.0.0.1'),
(414, 3, 'admin', '2016-03-21 02:15:30', '127.0.0.1'),
(415, 3, 'admin', '2016-03-21 02:15:38', '127.0.0.1'),
(416, 3, 'admin', '2016-03-21 02:17:03', '127.0.0.1'),
(417, 3, 'admin', '2016-03-21 02:17:10', '127.0.0.1'),
(418, 3, 'admin', '2016-03-21 02:18:06', '127.0.0.1'),
(419, 3, 'admin', '2016-03-21 02:53:04', '127.0.0.1'),
(420, 3, 'admin', '2016-03-21 02:53:14', '127.0.0.1'),
(421, 3, 'admin', '2016-03-21 06:18:48', '127.0.0.1'),
(422, 3, 'admin', '2016-03-21 06:19:50', '127.0.0.1'),
(423, 3, 'admin', '2016-03-21 06:22:11', '127.0.0.1'),
(424, 3, 'admin', '2016-03-21 06:22:40', '127.0.0.1'),
(425, 3, 'admin', '2016-03-21 06:26:04', '127.0.0.1'),
(426, 3, 'admin', '2016-03-21 06:34:22', '127.0.0.1'),
(427, 3, 'admin', '2016-03-21 06:37:41', '127.0.0.1'),
(428, 3, 'admin', '2016-03-21 06:44:34', '127.0.0.1'),
(429, 3, 'admin', '2016-03-21 06:46:45', '127.0.0.1'),
(430, 3, 'admin', '2016-03-21 06:53:31', '127.0.0.1'),
(431, 3, 'admin', '2016-03-21 07:11:35', '127.0.0.1'),
(432, 3, 'admin', '2016-03-21 07:32:18', '127.0.0.1'),
(433, 3, 'admin', '2016-03-21 07:37:42', '127.0.0.1'),
(434, 3, 'admin', '2016-03-21 07:44:23', '127.0.0.1'),
(435, 3, 'admin', '2016-03-21 07:49:32', '127.0.0.1'),
(436, 3, 'admin', '2016-03-21 08:37:32', '127.0.0.1'),
(437, 3, 'admin', '2016-03-21 08:41:56', '127.0.0.1'),
(438, 3, 'admin', '2016-03-21 09:13:21', '127.0.0.1'),
(439, 3, 'admin', '2016-03-22 01:06:11', '127.0.0.1'),
(440, 3, 'admin', '2016-03-22 01:31:08', '127.0.0.1'),
(441, 3, 'admin', '2016-03-22 01:40:50', '127.0.0.1'),
(442, 3, 'admin', '2016-03-22 02:26:26', '127.0.0.1'),
(443, 3, 'admin', '2016-03-22 02:35:12', '127.0.0.1'),
(444, 3, 'admin', '2016-03-22 02:52:57', '127.0.0.1'),
(445, 3, 'admin', '2016-03-22 02:56:50', '127.0.0.1'),
(446, 3, 'admin', '2016-03-22 05:36:33', '127.0.0.1'),
(447, 3, 'admin', '2016-03-22 05:38:45', '127.0.0.1'),
(448, 3, 'admin', '2016-03-22 05:42:35', '127.0.0.1'),
(449, 3, 'admin', '2016-03-22 06:07:21', '127.0.0.1'),
(450, 3, 'admin', '2016-03-22 06:22:03', '127.0.0.1'),
(451, 3, 'admin', '2016-03-22 06:24:41', '127.0.0.1'),
(452, 3, 'admin', '2016-03-22 06:36:47', '127.0.0.1'),
(453, 3, 'admin', '2016-03-22 07:06:57', '127.0.0.1'),
(454, 3, 'admin', '2016-03-22 07:48:23', '127.0.0.1'),
(455, 3, 'admin', '2016-03-22 08:12:36', '127.0.0.1'),
(456, 3, 'admin', '2016-03-22 08:52:21', '127.0.0.1'),
(457, 3, 'admin', '2016-03-22 08:56:43', '127.0.0.1'),
(458, 3, 'admin', '2016-03-22 09:06:07', '127.0.0.1'),
(459, 3, 'admin', '2016-03-22 09:18:50', '127.0.0.1'),
(460, 3, 'admin', '2016-03-22 09:22:18', '127.0.0.1'),
(461, 3, 'admin', '2016-03-22 09:26:25', '127.0.0.1'),
(462, 3, 'admin', '2016-03-22 09:31:10', '127.0.0.1'),
(463, 3, 'admin', '2016-03-22 09:37:20', '127.0.0.1'),
(464, 3, 'admin', '2016-03-22 09:43:30', '127.0.0.1'),
(465, 3, 'admin', '2016-03-22 09:44:40', '127.0.0.1'),
(466, 3, 'admin', '2016-03-22 09:45:24', '127.0.0.1'),
(467, 3, 'admin', '2016-03-22 09:48:25', '127.0.0.1'),
(468, 3, 'admin', '2016-03-22 09:51:24', '127.0.0.1'),
(469, 3, 'admin', '2016-03-23 01:17:26', '127.0.0.1'),
(470, 3, 'admin', '2016-03-23 02:26:10', '127.0.0.1'),
(471, 3, 'admin', '2016-03-23 02:45:33', '127.0.0.1'),
(472, 3, 'admin', '2016-03-23 02:46:58', '127.0.0.1'),
(473, 3, 'admin', '2016-03-23 03:03:21', '127.0.0.1'),
(474, 3, 'admin', '2016-03-23 03:14:41', '127.0.0.1'),
(475, 3, 'admin', '2016-03-23 03:15:15', '127.0.0.1'),
(476, 3, 'admin', '2016-03-23 03:20:00', '127.0.0.1'),
(477, 3, 'admin', '2016-03-23 03:22:16', '127.0.0.1'),
(478, 3, 'admin', '2016-03-23 03:31:19', '127.0.0.1'),
(479, 3, 'admin', '2016-03-23 04:12:00', '127.0.0.1'),
(480, 3, 'admin', '2016-03-23 04:23:46', '127.0.0.1'),
(481, 3, 'admin', '2016-03-23 04:27:49', '127.0.0.1'),
(482, 3, 'admin', '2016-03-23 04:29:14', '127.0.0.1'),
(483, 3, 'admin', '2016-03-23 05:34:04', '127.0.0.1'),
(484, 3, 'admin', '2016-03-23 06:25:03', '127.0.0.1'),
(485, 3, 'admin', '2016-03-23 06:40:22', '127.0.0.1'),
(486, 22, '1@bcc.ac.cn', '2016-03-23 06:43:20', '127.0.0.1'),
(487, 3, 'admin', '2016-03-23 06:55:49', '127.0.0.1'),
(488, 22, '1@bcc.ac.cn', '2016-03-23 08:00:22', '127.0.0.1'),
(489, 3, 'admin', '2016-03-23 08:09:20', '127.0.0.1'),
(490, 22, '1@bcc.ac.cn', '2016-03-23 08:09:59', '127.0.0.1'),
(491, 3, 'admin', '2016-03-23 08:15:42', '127.0.0.1'),
(492, 22, '1@bcc.ac.cn', '2016-03-23 08:16:35', '127.0.0.1'),
(493, 23, 'lifm', '2016-03-23 08:20:00', '127.0.0.1'),
(494, 3, 'admin', '2016-03-23 08:22:01', '127.0.0.1'),
(495, 3, 'admin', '2016-03-23 08:24:13', '127.0.0.1'),
(496, 3, 'admin', '2016-03-23 08:26:45', '127.0.0.1'),
(497, 3, 'admin', '2016-03-24 01:35:49', '127.0.0.1'),
(498, 3, 'admin', '2016-03-24 01:40:09', '127.0.0.1'),
(499, 3, 'admin', '2016-03-24 01:57:39', '127.0.0.1'),
(500, 3, 'admin', '2016-03-24 02:01:39', '127.0.0.1'),
(501, 3, 'admin', '2016-03-24 02:25:59', '127.0.0.1'),
(502, 3, 'admin', '2016-03-24 02:26:57', '127.0.0.1'),
(503, 3, 'admin', '2016-03-24 03:37:10', '127.0.0.1'),
(504, 3, 'admin', '2016-03-24 03:37:15', '127.0.0.1'),
(505, 3, 'admin', '2016-03-24 03:38:49', '127.0.0.1'),
(506, 3, 'admin', '2016-03-24 03:39:43', '127.0.0.1'),
(507, 3, 'admin', '2016-03-24 03:47:29', '0:0:0:0:0:0:0:1'),
(508, 3, 'admin', '2016-03-24 04:14:51', '127.0.0.1'),
(509, 3, 'admin', '2016-03-24 04:16:37', '127.0.0.1'),
(510, 3, 'admin', '2016-03-24 04:33:26', '0:0:0:0:0:0:0:1'),
(511, 3, 'admin', '2016-03-24 04:34:42', '127.0.0.1'),
(512, 3, 'admin', '2016-03-24 04:43:31', '127.0.0.1'),
(513, 3, 'admin', '2016-03-24 05:01:03', '127.0.0.1'),
(514, 3, 'admin', '2016-03-24 05:13:09', '127.0.0.1'),
(515, 3, 'admin', '2016-03-24 05:24:59', '127.0.0.1'),
(516, 3, 'admin', '2016-03-24 05:24:59', '127.0.0.1'),
(517, 3, 'admin', '2016-03-24 05:26:55', '0:0:0:0:0:0:0:1'),
(518, 3, 'admin', '2016-03-24 06:07:29', '127.0.0.1'),
(519, 3, 'admin', '2016-03-24 06:14:17', '127.0.0.1'),
(520, 3, 'admin', '2016-03-24 06:25:55', '127.0.0.1'),
(521, 3, 'admin', '2016-03-24 06:44:05', '127.0.0.1'),
(522, 3, 'admin', '2016-03-24 06:46:00', '127.0.0.1'),
(523, 3, 'admin', '2016-03-24 06:53:45', '127.0.0.1'),
(524, 3, 'admin', '2016-03-24 06:55:22', '127.0.0.1'),
(525, 3, 'admin', '2016-03-24 06:57:25', '127.0.0.1'),
(526, 3, 'admin', '2016-03-24 07:02:12', '127.0.0.1'),
(527, 3, 'admin', '2016-03-24 07:04:43', '127.0.0.1'),
(528, 3, 'admin', '2016-03-24 07:08:47', '127.0.0.1'),
(529, 3, 'admin', '2016-03-24 07:17:12', '127.0.0.1'),
(530, 3, 'admin', '2016-03-24 07:19:59', '127.0.0.1'),
(531, 3, 'admin', '2016-03-24 07:33:47', '127.0.0.1'),
(532, 3, 'admin', '2016-03-24 07:38:04', '127.0.0.1'),
(533, 3, 'admin', '2016-03-24 07:40:22', '127.0.0.1'),
(534, 3, 'admin', '2016-03-24 07:46:22', '0:0:0:0:0:0:0:1'),
(535, 3, 'admin', '2016-03-24 07:51:48', '127.0.0.1'),
(536, 3, 'admin', '2016-03-24 08:02:20', '127.0.0.1'),
(537, 3, 'admin', '2016-03-24 08:05:36', '127.0.0.1'),
(538, 3, 'admin', '2016-03-24 08:08:51', '127.0.0.1'),
(539, 3, 'admin', '2016-03-24 08:11:28', '127.0.0.1'),
(540, 3, 'admin', '2016-03-24 08:18:17', '127.0.0.1'),
(541, 3, 'admin', '2016-03-24 08:18:45', '127.0.0.1'),
(542, 3, 'admin', '2016-03-24 08:22:21', '127.0.0.1'),
(543, 3, 'admin', '2016-03-24 08:33:37', '127.0.0.1'),
(544, 3, 'admin', '2016-03-24 08:34:43', '127.0.0.1'),
(545, 3, 'admin', '2016-03-24 09:44:43', '127.0.0.1'),
(546, 3, 'admin', '2016-03-25 01:16:15', '127.0.0.1'),
(547, 3, 'admin', '2016-03-25 01:39:39', '127.0.0.1'),
(548, 3, 'admin', '2016-03-25 01:41:38', '127.0.0.1'),
(549, 3, 'admin', '2016-03-25 01:42:40', '127.0.0.1'),
(550, 3, 'admin', '2016-03-25 01:50:34', '127.0.0.1'),
(551, 3, 'admin', '2016-03-25 01:54:49', '127.0.0.1'),
(552, 3, 'admin', '2016-03-25 01:56:03', '127.0.0.1'),
(553, 3, 'admin', '2016-03-25 01:58:11', '127.0.0.1'),
(554, 3, 'admin', '2016-03-25 02:23:04', '127.0.0.1'),
(555, 3, 'admin', '2016-03-25 03:14:03', '127.0.0.1'),
(556, 3, 'admin', '2016-03-25 03:14:06', '127.0.0.1'),
(557, 3, 'admin', '2016-03-25 03:17:45', '127.0.0.1'),
(558, 3, 'admin', '2016-03-25 03:19:55', '127.0.0.1'),
(559, 3, 'admin', '2016-03-25 04:40:22', '127.0.0.1'),
(560, 3, 'admin', '2016-03-25 05:01:16', '127.0.0.1'),
(561, 3, 'admin', '2016-03-25 05:34:45', '127.0.0.1'),
(562, 3, 'admin', '2016-03-25 05:48:24', '127.0.0.1'),
(563, 3, 'admin', '2016-03-25 06:22:42', '127.0.0.1'),
(564, 3, 'admin', '2016-03-25 06:35:19', '127.0.0.1'),
(565, 3, 'admin', '2016-03-25 06:44:14', '127.0.0.1'),
(566, 3, 'admin', '2016-03-25 07:56:52', '127.0.0.1'),
(567, 3, 'admin', '2016-03-25 08:16:27', '127.0.0.1'),
(568, 3, 'admin', '2016-03-25 08:17:14', '127.0.0.1'),
(569, 3, 'admin', '2016-03-25 08:27:12', '127.0.0.1'),
(570, 3, 'admin', '2016-03-25 08:27:50', '127.0.0.1'),
(571, 3, 'admin', '2016-03-25 08:36:31', '127.0.0.1'),
(572, 3, 'admin', '2016-03-25 08:46:58', '127.0.0.1'),
(573, 3, 'admin', '2016-03-25 09:36:40', '127.0.0.1'),
(574, 3, 'admin', '2016-03-25 09:38:51', '127.0.0.1'),
(575, 3, 'admin', '2016-03-25 09:40:35', '127.0.0.1'),
(576, 3, 'admin', '2016-03-25 09:40:35', '127.0.0.1'),
(577, 3, 'admin', '2016-03-25 09:45:31', '127.0.0.1'),
(578, 3, 'admin', '2016-03-25 09:49:46', '127.0.0.1'),
(579, 3, 'admin', '2016-03-28 01:26:45', '127.0.0.1'),
(580, 3, 'admin', '2016-03-29 01:20:18', '127.0.0.1'),
(581, 3, 'admin', '2016-03-29 01:21:05', '127.0.0.1'),
(582, 3, 'admin', '2016-03-29 03:27:53', '127.0.0.1'),
(583, 3, 'admin', '2016-03-29 05:55:14', '127.0.0.1'),
(584, 3, 'admin', '2016-04-01 07:39:13', '0:0:0:0:0:0:0:1'),
(585, 3, 'admin', '2016-04-01 08:04:10', '0:0:0:0:0:0:0:1'),
(586, 3, 'admin', '2016-04-01 08:13:52', '0:0:0:0:0:0:0:1'),
(587, 3, 'admin', '2016-04-01 08:18:38', '0:0:0:0:0:0:0:1'),
(588, 3, 'admin', '2016-04-01 08:30:42', '0:0:0:0:0:0:0:1'),
(589, 3, 'admin', '2016-04-01 08:32:00', '0:0:0:0:0:0:0:1'),
(590, 3, 'admin', '2016-04-01 08:33:16', '0:0:0:0:0:0:0:1'),
(591, 3, 'admin', '2016-04-01 08:35:20', '0:0:0:0:0:0:0:1'),
(592, 3, 'admin', '2016-04-01 08:43:14', '0:0:0:0:0:0:0:1'),
(593, 3, 'admin', '2016-04-01 08:45:13', '0:0:0:0:0:0:0:1');

-- --------------------------------------------------------

--
-- 表的结构 `bcc_user_role`
--

DROP TABLE IF EXISTS `bcc_user_role`;
CREATE TABLE IF NOT EXISTS `bcc_user_role` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bcc_user_role`
--

INSERT INTO `bcc_user_role` (`userId`, `roleId`) VALUES
(3, 1),
(3, 3),
(5, 1),
(6, 3),
(20, 1),
(20, 2),
(20, 3),
(22, 1),
(22, 2),
(22, 3),
(23, 1),
(23, 2),
(23, 3),
(23, 4),
(24, 1),
(24, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bcc_achievement`
--
ALTER TABLE `bcc_achievement`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_button`
--
ALTER TABLE `bcc_button`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_category`
--
ALTER TABLE `bcc_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_enterprise`
--
ALTER TABLE `bcc_enterprise`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_equipment`
--
ALTER TABLE `bcc_equipment`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_expert`
--
ALTER TABLE `bcc_expert`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_index`
--
ALTER TABLE `bcc_index`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_indexlist`
--
ALTER TABLE `bcc_indexlist`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_log`
--
ALTER TABLE `bcc_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_management_unit`
--
ALTER TABLE `bcc_management_unit`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_model`
--
ALTER TABLE `bcc_model`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_model_field`
--
ALTER TABLE `bcc_model_field`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_model_manager`
--
ALTER TABLE `bcc_model_manager`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_resources`
--
ALTER TABLE `bcc_resources`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_res_role`
--
ALTER TABLE `bcc_res_role`
 ADD PRIMARY KEY (`roleId`,`resId`);

--
-- Indexes for table `bcc_role`
--
ALTER TABLE `bcc_role`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_server_info`
--
ALTER TABLE `bcc_server_info`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_service`
--
ALTER TABLE `bcc_service`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_type`
--
ALTER TABLE `bcc_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_user`
--
ALTER TABLE `bcc_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bcc_userlogin`
--
ALTER TABLE `bcc_userlogin`
 ADD PRIMARY KEY (`id`), ADD KEY `bcc_user_loginlist` (`id`) USING BTREE;

--
-- Indexes for table `bcc_user_role`
--
ALTER TABLE `bcc_user_role`
 ADD PRIMARY KEY (`userId`,`roleId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bcc_achievement`
--
ALTER TABLE `bcc_achievement`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_button`
--
ALTER TABLE `bcc_button`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `bcc_category`
--
ALTER TABLE `bcc_category`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',AUTO_INCREMENT=201;
--
-- AUTO_INCREMENT for table `bcc_enterprise`
--
ALTER TABLE `bcc_enterprise`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_equipment`
--
ALTER TABLE `bcc_equipment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_expert`
--
ALTER TABLE `bcc_expert`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_index`
--
ALTER TABLE `bcc_index`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_indexlist`
--
ALTER TABLE `bcc_indexlist`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_log`
--
ALTER TABLE `bcc_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',AUTO_INCREMENT=409;
--
-- AUTO_INCREMENT for table `bcc_management_unit`
--
ALTER TABLE `bcc_management_unit`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bcc_model`
--
ALTER TABLE `bcc_model`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `bcc_model_field`
--
ALTER TABLE `bcc_model_field`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=1984;
--
-- AUTO_INCREMENT for table `bcc_model_manager`
--
ALTER TABLE `bcc_model_manager`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT for table `bcc_resources`
--
ALTER TABLE `bcc_resources`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `bcc_role`
--
ALTER TABLE `bcc_role`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bcc_server_info`
--
ALTER TABLE `bcc_server_info`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `bcc_service`
--
ALTER TABLE `bcc_service`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID';
--
-- AUTO_INCREMENT for table `bcc_type`
--
ALTER TABLE `bcc_type`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `bcc_user`
--
ALTER TABLE `bcc_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `bcc_userlogin`
--
ALTER TABLE `bcc_userlogin`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=594;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
