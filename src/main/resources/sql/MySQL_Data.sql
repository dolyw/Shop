-- ----------------------------
-- Records of user
-- ----------------------------
insert into user values(null,"wang","wang","admin",null,now());

-- ----------------------------
-- Records of role
-- ----------------------------
insert into role values(null,"admin");

-- ----------------------------
-- Records of user_role
-- ----------------------------
insert into user_role values(null, 1, 1);

-- ----------------------------
-- Records of permission
-- ----------------------------
insert into permission values(null,"查看用户列表",null,null,"user:list");
insert into permission values(null,"添加(修改)用户",null,null,"user:save");
insert into permission values(null,"删除用户",null,null,"user:delete");
insert into permission values(null,"查看用户搜索记录",null,null,"user:searchRecord");

insert into permission values(null,"查看商品列表",null,null,"item:list");
insert into permission values(null,"添加(修改)商品",null,null,"item:save");
insert into permission values(null,"删除商品",null,null,"item:delete");

insert into permission values(null,"查看商品大类列表",null,null,"itemCategory:list");
insert into permission values(null,"添加(修改)商品大类",null,null,"itemCategory:save");
insert into permission values(null,"删除商品大类",null,null,"itemCategory:delete");

insert into permission values(null,"查看商品小类列表",null,null,"itemCategoryDetail:list");
insert into permission values(null,"添加(修改)商品小类",null,null,"itemCategoryDetail:save");
insert into permission values(null,"删除商品小类",null,null,"itemCategoryDetail:delete");

insert into permission values(null,"查看未付款订单列表",null,null,"order:payList");
insert into permission values(null,"查看已付款订单列表",null,null,"order:courierList");
insert into permission values(null,"订单确认收款",null,null,"order:setPay");

insert into permission values(null,"主页分类设置",null,null,"system:indexCategory");

-- ----------------------------
-- Records of role_permission
-- ----------------------------
insert into role_permission values(null, 1, 1);
insert into role_permission values(null, 1, 2);
insert into role_permission values(null, 1, 3);
insert into role_permission values(null, 1, 4);
insert into role_permission values(null, 1, 5);
insert into role_permission values(null, 1, 6);
insert into role_permission values(null, 1, 7);
insert into role_permission values(null, 1, 8);
insert into role_permission values(null, 1, 9);
insert into role_permission values(null, 1, 10);
insert into role_permission values(null, 1, 11);
insert into role_permission values(null, 1, 12);
insert into role_permission values(null, 1, 13);
insert into role_permission values(null, 1, 14);
insert into role_permission values(null, 1, 15);
insert into role_permission values(null, 1, 16);
insert into role_permission values(null, 1, 17);

-- ----------------------------
-- Records of itemcategory
-- ----------------------------
INSERT INTO `itemcategory` VALUES ('1', ' 智能机器人 ', '2018-05-16 17:20:44');
INSERT INTO `itemcategory` VALUES ('2', '传感器模组', '2018-05-16 17:51:53');
INSERT INTO `itemcategory` VALUES ('3', '物联网通信', '2018-05-16 17:57:27');
INSERT INTO `itemcategory` VALUES ('4', '显示模组', '2018-05-16 18:04:44');

-- ----------------------------
-- Records of itemcategorydetail
-- ----------------------------
INSERT INTO `itemcategorydetail` VALUES ('1', '机器人礼品', '2018-05-16 17:21:32', '1');
INSERT INTO `itemcategorydetail` VALUES ('2', '气体传感器', '2018-05-16 17:52:06', '2');
INSERT INTO `itemcategorydetail` VALUES ('3', '无线通信', '2018-05-16 17:57:43', '3');
INSERT INTO `itemcategorydetail` VALUES ('4', '显示屏', '2018-05-16 18:05:00', '4');

-- ----------------------------
-- Records of itemdetail
-- ----------------------------
INSERT INTO `itemdetail` VALUES ('1', '20180516c7ee235d.jpg', '20180516295ea5b8.jpg', '2018051671934e10.jpg', '201805160cd98ba8.jpg', '20180516f0c1059f.jpg', '<p><span style=\"font-size:16px\">玩是孩子的天性，对于&ldquo;玩&rdquo;孩子总是表现出浓厚的兴趣。兴趣是一切学习的最初动力，有了兴趣，孩子就能主动地、愉快地去学、去问、去探索。&ldquo;玩&rdquo;与&ldquo;学&rdquo;有机结合，将&ldquo;玩&rdquo;有机注入&ldquo;学&rdquo;中，对于综合实践活动尤其重要！本产品由孩子自己&ldquo;边造边玩&rdquo;培养孩子的创客精神，让孩子们在玩中学，学中创作！</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">机器人综合了多门学科知识，主要由包括数学、物理、化学、结构、建筑、地理、生物、能源、信息技术等在内的多项技能。学习机器人可以培养孩子的各种能力，包括动手、想象、创造、观察、分析、判断、归纳、理解、决策、组织、实验、计划性、条理性等。如果孩子正为这些纷繁的学科感到束手无策时，机器人技术也能让他们换个角度掌握这些知识。最重要的一点，机器人技术要比传统的基本学科的内容要丰富，而且可以将各种学科有机的结合起来。</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">本产品设计巧妙形态独特，以进口奥松木板为原材料，由激光切割而成。结构上充分利用鲁班的智慧，实现少用螺丝，为用户简化装配过程。 安装完成，装上电池这个&ldquo;配重块&rdquo;之后，充分利用了不倒翁的平衡原理，通过强劲有力的电机来改变重心，实现风火轮的运动。切割的大轮毂把轮式的敏捷的机动性表现的淋漓尽致，并且运动机制新颖有趣，呈现的运动形态也诙谐、逗趣。孩子在自行组装来复活风火轮机器人的过程中，对机械、电子等原理有更深入认识和学习，本产品可通过DFRobot出品的GOBLE手机APP实现控制。</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">注意：</span></p>\r\n\r\n<p><span style=\"font-size:16px\">1、 本品适用于8岁及以上年龄儿童和青少年，6岁以下儿童请在家长陪同下完成</span></p>\r\n\r\n<p><span style=\"font-size:16px\">2、 电池接线需再三确认，请勿接反，否则会烧坏控制板</span></p>\r\n\r\n<p><span style=\"font-size:16px\">3、 当前APP只支持iOS客户端，Android客户端正在开发中！</span></p>\r\n', null, null, null, null, null);
INSERT INTO `itemdetail` VALUES ('2', '20180516c1633aa0.jpg', '20180516f29daed4.jpg', '20180516a7730754.jpg', '201805163360904c.jpg', '20180516bac00387.jpg', '<p><span style=\"font-size:16px\">随着科技的进步，人们对生活品质的追求越来越高。健康生活作为最基础的部分，越来越受到人们关注。雾霾，PM2.5，甲醛这是近几年来最热的几个关于空气质量的话题。能够实时地检测身边的空气质量成为了现代人们一种非常迫切的需求。</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">DFRobot新出空气质量监测仪，兼容Arduino，STM32等设备，可测量PM10和PM2.5数值，同时内置甲醛以及温湿度传感器，可实时监测室内空气质量。其中颗粒（PM 10 &amp; PM 2.5）浓度使用激光散射原理，能够连续采集并计算单位体积内空气中不同大小的悬浮颗粒物数目，即颗粒物浓度分布，可以通过该数值换算成质量浓度。甲醛浓度基于电化学原理检测，具备高精度、高稳定性的特点。同时传感器内嵌入了一个瑞士生产的温/湿度一体检测芯片，能够精确的检测出温度值和湿度值。该传感器把颗粒物浓度数值、甲醛浓度数值及温度、湿度监测功能合并，利用UART接口输出相关数据帧。传感器能够嵌入各种与空气质量监测和环境空气改善相关的仪器设备，为其提供及时准确的环境参数。</span></p>\r\n', null, null, null, null, null);
INSERT INTO `itemdetail` VALUES ('3', '2018051632875576.jpg', '20180516570736da.jpg', null, null, null, '<p><span style=\"font-size:16px\">Arduino项目无线数传必备！几乎所有的传感器扩展板都会带有APC220的接口。</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">大量成熟的应用库文件和教程，让你快速上手！</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">APC220模块是高度集成半双工微功率无线数据传输模块，其嵌入高速单片机和高性能射频芯片，提供TTL电平串行接口，降低了用户在使用时，对数据打包和编码的需求。</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">Arduino爱好者可以直接使用APC220插入IO Expansion Shield(I/O扩展板)来为你的项目或者机器人提供一个较简单经济的无线数据通讯方式或遥控功能等。</span></p>\r\n\r\n<hr />\r\n<p><span style=\"font-size:16px\">注意事项：该套件中还包含一块USB to TTL转换器，以及2根无线电频天线，让您可以直接将模块与PC连接进行数据通讯，当然你也可以直接使用APC220模块进行两块MCU之间的交互。</span></p>\r\n', null, null, null, null, null);
INSERT INTO `itemdetail` VALUES ('4', '20180516d017b5a9.jpg', '201805164bd79876.jpg', '20180516e5989410.jpg', '20180516b4b5127f.jpg', null, '<p>说起LCD1602 相信大家并不陌生 方方正正的外形 绿绿的颜色 一条长长的焊排 非常复杂的接线 这是大家对于1602的最初印象。</p>\r\n\r\n<hr />\r\n<p>DFRobot Gravity I2C LCD1602液晶显示屏在外观上做了大幅度优化 增加I2C接口 符合Gravity IIC系列标准 可直接配合Gravity IO扩展使用。代码兼容Arduino控制器 不占用额外GPIO 节省管脚资源。</p>\r\n\r\n<hr />\r\n<p>LCD1602总共可显示16行x2列字符 省去了调节对比度的麻烦事儿 保留了背光可控功能 兼容3.3V和5V电压 在功能和外观的优化上带给您不一样的体验。</p>\r\n', null, null, null, null, null);

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('1', '风火轮机器人', '268', 'DFROBOT', null, '123', '201805168d7f5cbb.jpg', '2018-05-16 17:25:38', '1', null, '1');
INSERT INTO `item` VALUES ('2', '空气质量监测仪', '369', 'DFROBOT', null, '79', '201805162e9b96f6.jpg', '2018-05-16 17:55:25', '2', null, '2');
INSERT INTO `item` VALUES ('3', '无线数传', '270', 'DFROBOT', null, '230', '2018051604b034d8.jpg', '2018-05-16 18:02:42', '3', null, '3');
INSERT INTO `item` VALUES ('4', '液晶显示屏', '45', 'DFROBOT', null, '76', '20180516bb5089a1.jpg', '2018-05-16 18:06:59', '4', null, '4');

-- ----------------------------
-- Records of indexCategory
-- ----------------------------
insert into indexCategory values(null,'1');
insert into indexCategory values(null,'2');
insert into indexCategory values(null,'3');
insert into indexCategory values(null,'4');
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
insert into indexCategory values(null,null);
