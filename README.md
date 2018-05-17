# Shop

#### 项目介绍

简单商城，Nginx + Tomcat动静分离，也可单独在Tomcat运行

#### 软件架构

##### 技术选型

1、后端<br/>
* 核心框架：Spring Framework<br/>
* 视图框架：Spring MVC<br/>
* 持久层框架：Mybatis、MyBatis Plus<br/>
* 安全框架：Apache Shiro<br/>
* 数据库连接池：Alibaba Druid<br/>
* 缓存框架：Ehcache<br/>
* 日志管理：Slf4j、Log4j<br/>
* 工具类：Apache Commons、Alibaba FastJson<br/>

2、前端<br/>
* JS框架：JQuery<br/>
* CSS框架：Bootstrap、LayUI<br/>
* 数据表格：Bootstrap Table<br/>
* 对话提示框：Layer、SweetAlert<br/>
* 富文本编辑器：Ckeditor<br/>
* 图片延迟加载：JQuery LazyLoad<br/>
* 文件上传工具:Bootstrap FileInput<br/>

##### 环境介绍

* Jdk8.0+: JDK环境<br/>
* MySql5.7+: 数据库<br/>
* Tomcat8.0+: 应用服务器<br/>
* Nginx1.13+: 反向代理服务器<br/>
* Maven3.3+: 项目构建<br/>
* Eclipse、IntelliJ IDEA: 开发IDE<br/>
* Git2.6+: 版本管理<br/>
* Navicat for MySQL: 数据库客户端<br/>

#### 安装教程

1. 解压后执行src\main\resources\sql\MySQL.sql,MySQL_Data.sql脚本创建数据库和表及数据
2. 单独在Tomcat运行正常启动即可，如果是IDEA请设置访问路径为shop，即http://ip:port/shop，port为Tomcat的端口，即http://localhost:8080/shop
3. 后台管理路径http://ip:port/shop/adminManager，帐号密码都是wang，即http://localhost:8080/shop/adminManager
4. Nginx + Tomcat动静分离，正常安装配置Nginx，可以参考我的Nginx配置，把项目路径和端口号修改为你的就可以了
5. 启动Tomcat和Nginx，直接访问Nginx即可，一般地址为http://ip:port/shop，port为Nginx的端口，即http://localhost:80/shop，静态文件Nginx处理，动态请求反向代理给Tomcat处理
```Xml
#user  nobody;
worker_processes  2;

events {
    worker_connections  2048;
}

http {
		
	gzip on;
    gzip_vary on;
    gzip_disable "MSIE [1-6]\.";
    gzip_proxied any;
    gzip_min_length 1k;
    gzip_comp_level 4;
    gzip_types text/plain text/css application/json application/x-javascript application/javascript text/javascript application/xml text/xml image/jpeg image/png image/gif;
		
    include       mime.types;
    default_type  application/octet-stream;
    sendfile        on;
    keepalive_timeout  65;

    server {
        listen       80;
        server_name  localhost;
        index index.html index.htm index.jsp;

        location ^~ /static/ {
				    root E:\Work\Shop\src\main\webapp;
				}
        
        location / {
            proxy_pass http://localhost:8080;
		        proxy_redirect off;
		        proxy_set_header Host $host;
		        proxy_set_header X-Real-IP $remote_addr;
		        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
        
        error_page   500 502 503 504  /50x.html;
        location = /50x.html {
            root   html;
        }
    }
}
```

#### 使用说明

1. 短信验证码默认为wang，需要使用云短信功能请自行修改com.wang.util.AliSmsUtil.java配置信息，切换接口
2. 支付默认为我自己的沙箱配置，需要使用支付功能请自行修改com.wang.util.AlipayConfig.java配置信息
3. 支付成功同步异步都有做订单处理，正常情况下应该只有异步做处理的

#### 参与贡献

1. Fork 本项目
2. 新建 Feat_xxx 分支
3. 提交代码
4. 新建 Pull Request
