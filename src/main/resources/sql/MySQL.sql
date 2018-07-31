
create database shop;

use shop;

create table user (
id int primary key auto_increment COMMENT "ID",
account varchar(20) not null unique COMMENT "帐号",
password varchar(20) COMMENT "密码",
username varchar(20) COMMENT "昵称",
pic varchar(50) COMMENT "头像",
regtime datetime not null COMMENT "注册时间"
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "用户表";

CREATE TABLE role (
id int primary key auto_increment COMMENT "ID",
name varchar(128) not null unique COMMENT "角色名称"
/*available int COMMENT '是否可用,1：可用，0不可用'*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "角色表";


CREATE TABLE permission (
id int primary key auto_increment COMMENT "ID",
name varchar(128) COMMENT '资源名称',
type varchar(32) COMMENT '资源类型：menu,permission,button',
url varchar(128) COMMENT '访问url地址',
percode varchar(128) not null unique COMMENT '权限代码字符串'
/*available int COMMENT '是否可用,1：可用，0不可用'*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "资源表";


CREATE TABLE user_role (
id int primary key auto_increment COMMENT "ID",
userId int COMMENT '用户id',
role_id int COMMENT '角色id',
foreign key (userId) references user (id),
foreign key (role_id) references role (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "用户角色表";


CREATE TABLE role_permission (
id int primary key auto_increment COMMENT "ID",
role_id int COMMENT '角色id',
permission_id int COMMENT '权限id',
foreign key (role_id) references role (id),
foreign key (permission_id) references permission (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "角色资源表";

create table searchrecord (
id int primary key auto_increment COMMENT "ID",
account varchar(20) COMMENT "帐号",
username varchar(20) COMMENT "昵称",
ip varchar(40) COMMENT "IP",
keyword varchar(50) COMMENT "搜索关键字",
searchtime datetime COMMENT "搜索时间"
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "搜索记录表";

create table useraddr
(
id integer auto_increment COMMENT "ID",  
name varchar(20) not null COMMENT "姓名", 
phone varchar(30) not null COMMENT "电话", 
addr varchar(255) not null COMMENT "详细地址", 
post varchar(20) COMMENT "邮政编码", 
addtime datetime not null COMMENT "添加时间", 
defaults int not null COMMENT "默认地址 1是 0不是",
userId integer,
primary key (id),
foreign key (userId) references user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "收货地址表";


create table itemcategory (
id int primary key auto_increment COMMENT "ID",
name varchar(80) not null unique COMMENT "名称",
addtime datetime not null COMMENT "添加时间"
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "商品总分类表";

create table indexcategory (
id int primary key auto_increment COMMENT "ID",
itemCategoryId integer COMMENT "item大类外键",
foreign key (itemCategoryId) references itemCategory (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "主页分类配置表";

create table itemcategorydetail (
id int primary key auto_increment COMMENT "ID",
name varchar(80) not null unique COMMENT "名称",
addtime datetime not null COMMENT "添加时间",
itemCategoryId integer COMMENT "item外键",
foreign key (itemCategoryId) references itemCategory (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "商品详细分类表";


create table itemdetail (
id int primary key auto_increment COMMENT "ID",
picture1 varchar(80) COMMENT "图1",
picture2 varchar(80) COMMENT "图2",
picture3 varchar(80) COMMENT "图3",
picture4 varchar(80) COMMENT "图4",
picture5 varchar(80) COMMENT "图5",
intro text COMMENT "简介",
chara text COMMENT "特性",
specifi text COMMENT "规格",
list text COMMENT "清单",
downname varchar(50) COMMENT "文件名称",
download varchar(100) COMMENT "文件地址"
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "商品详细表";

create table item (
id int primary key auto_increment COMMENT "ID",
name varchar(80) not null COMMENT "名称",
price varchar(20) not null COMMENT "价格",
brand varchar(50) COMMENT "品牌",
model varchar(50) COMMENT "型号",
stock int not null COMMENT "库存",
picture varchar(80) COMMENT "主图",
addtime datetime not null COMMENT "添加时间",
itemCategoryDetailId integer COMMENT "item外键",
userId integer COMMENT "user添加外键",
itemDetailId integer COMMENT "itemDetail外键",
foreign key (itemDetailId) references itemDetail (id),
foreign key (userId) references user (id),
foreign key (itemCategoryDetailId) references itemCategoryDetail (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "商品表";

create table orders (
id int primary key auto_increment COMMENT "ID",
no varchar(80) not null unique COMMENT "订单号",
tradeNo varchar(80) not null unique COMMENT "支付宝交易号",
price varchar(20) not null COMMENT "价格合计",
state int not null COMMENT "状态1未付款 2已付款但未发货 3已发货但未确认收货 4已确认交易成功",
pay int not null COMMENT "1支付宝 2微信",
courier int not null COMMENT "1顺丰 2圆通",
courierno varchar(80) COMMENT "快递单号",
name varchar(80) not null COMMENT "收件人",
phone varchar(80) not null COMMENT "手机号",
addr varchar(80) not null COMMENT "地址",
addtime datetime not null COMMENT "添加时间",
userId integer COMMENT "user外键",
foreign key (userId) references user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "订单表";


create table orderitem (
id int primary key auto_increment COMMENT "ID",
count int not null COMMENT "数量",
price varchar(20) not null COMMENT "小计",
itemId integer COMMENT "item外键",
ordersId integer COMMENT "order外键",
foreign key (itemId) references item (id),
foreign key (ordersId) references orders (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "订单条目表";

create table usershop
(
id integer auto_increment COMMENT "ID",
count int not null COMMENT "数量",
price varchar(20) not null COMMENT "小计",
addtime datetime not null COMMENT "添加时间", 
userId integer COMMENT "user外键",
itemId integer COMMENT "item外键",
primary key (id),
foreign key (itemId) references item (id),
foreign key (userId) references user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "购物车表";

/*create table itemrecord (
id int primary key auto_increment COMMENT "ID",
userId integer,
itemId integer,
foreign key (userId) references user (id),
foreign key (itemId) references item (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "商品浏览记录表";*/

/*create table user_item 
(
id int primary key auto_increment COMMENT "ID",
userId integer,
itemId integer,
foreign key (userId) references user (id),
foreign key (itemId) references item (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "用户商品收藏表";*/

create table plate
(
id integer auto_increment COMMENT "ID",
name varchar(40) not null COMMENT "名称",
addtime datetime not null COMMENT "添加时间", 
primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "板块表";

create table post
(
id integer auto_increment COMMENT "ID",
title text not null COMMENT "标题",
cont text not null COMMENT "内容",
favorite int COMMENT "收藏数",
agree int COMMENT "点赞数",
stampede int COMMENT "踩数",
see int COMMENT "查看数",
reply int COMMENT "回复数",
lastname varchar(40) not null COMMENT "最后回复人",
lasttime datetime not null COMMENT "最后回复时间",
addtime datetime not null COMMENT "添加时间", 
userId integer COMMENT "user外键",
plate_id integer COMMENT "plate外键",
primary key (id),
foreign key (plate_id) references plate (id),
foreign key (userId) references user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "主题表";

create table reply
(
id integer auto_increment COMMENT "ID",
cont text not null COMMENT "内容",
addtime datetime not null COMMENT "添加时间", 
parent_id int  COMMENT "回复贴ID",
userId integer COMMENT "user外键",
post_id integer COMMENT "post外键",
primary key (id),
foreign key (post_id) references post (id),
foreign key (userId) references user (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT "回复表";

