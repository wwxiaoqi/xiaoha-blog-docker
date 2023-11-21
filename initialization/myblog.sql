/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : myblog

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 16/11/2023 15:52:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `cover` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `summary` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '文章摘要',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标志位：0：未删除 1：已删除',
  `read_num` int UNSIGNED NOT NULL DEFAULT 1 COMMENT '被阅读次数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (4, '测试标题2', 'https://img.quanxiaoha.com/quanxiaoha/193dd1504ebb4f138085acb23619e0dd.jpg', '测试摘要2', '2023-10-01 22:58:40', '2023-11-12 22:58:40', 0, 1);
INSERT INTO `t_article` VALUES (5, '测试标题3', 'https://img.quanxiaoha.com/quanxiaoha/193dd1504ebb4f138085acb23619e0dd.jpg', '测试摘要3', '2023-10-01 22:59:18', '2023-11-12 22:59:18', 0, 1);
INSERT INTO `t_article` VALUES (7, '来写bug', 'http://127.0.0.1:9000/myblog/d8296b17c271414c8603db0762081cbd.jpg', '快点来写bug把\n', '2023-11-14 15:19:37', '2023-11-14 15:19:37', 0, 1);
INSERT INTO `t_article` VALUES (8, '该开idea了', 'http://127.0.0.1:9000/myblog/f164caa6e3464d2981c84873735c3095.jpg', '速速打开idea', '2023-11-14 15:20:37', '2023-11-14 15:20:37', 0, 1);
INSERT INTO `t_article` VALUES (9, '这是啥!vscode!!!', 'http://127.0.0.1:9000/myblog/4ed0d1ed0fae4fffb83abadc411350f8.jpg', '滚过来学前端', '2023-11-14 15:21:46', '2023-11-14 15:21:46', 0, 2);
INSERT INTO `t_article` VALUES (10, '24小时候机', 'http://127.0.0.1:9000/myblog/abf092229e0f45a78787b2579a996b34.jpg', '不准休息，爬起来写代码', '2023-11-14 15:22:42', '2023-11-14 15:22:42', 0, 2);

-- ----------------------------
-- Table structure for t_article_category_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_category_rel`;
CREATE TABLE `t_article_category_rel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint UNSIGNED NOT NULL COMMENT '文章id',
  `category_id` bigint UNSIGNED NOT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_article_id`(`article_id`) USING BTREE,
  INDEX `idx_category_id`(`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章所属分类关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_category_rel
-- ----------------------------
INSERT INTO `t_article_category_rel` VALUES (3, 4, 4);
INSERT INTO `t_article_category_rel` VALUES (4, 5, 4);
INSERT INTO `t_article_category_rel` VALUES (9, 7, 12);
INSERT INTO `t_article_category_rel` VALUES (10, 8, 12);
INSERT INTO `t_article_category_rel` VALUES (11, 9, 13);
INSERT INTO `t_article_category_rel` VALUES (12, 10, 13);

-- ----------------------------
-- Table structure for t_article_content
-- ----------------------------
DROP TABLE IF EXISTS `t_article_content`;
CREATE TABLE `t_article_content`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章内容id',
  `article_id` bigint NOT NULL COMMENT '文章id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '教程正文',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章内容表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_content
-- ----------------------------
INSERT INTO `t_article_content` VALUES (4, 4, '```\r\n  @Test\r\n  void testLog() {\r\n      log.info(\"这是一行 Info 级别日志\");\r\n      log.warn(\"这是一行 Warn 级别日志\");\r\n      log.error(\"这是一行 Error 级别日志\");\r\n\r\n      // 占位符\r\n      String author = \"犬小哈\";\r\n      log.info(\"这是一行带有占位符日志，作者：{}\", author);\r\n  }\r\n```');
INSERT INTO `t_article_content` VALUES (5, 5, '## 👋 自我介绍\r\n\r\n> 大家好，我是小哈。前某厂中台架构，公众号小哈学 Java 作者。91年生人，码龄 9 年，先后供职于支付、共享等互联网领域，主导负责过数据传输、日志平台、任务调度、文件平台等产品，以支撑各部门业务线。喜欢分享知识，热爱技术，也不止于技术，不只是写 Java，业余也爱玩前端、Python、Android 等，是个活跃的技术折腾者。\r\n\r\n本实战项目是星球内部第一个项目，目前**已输出 17w+ 字，更新了 124 小节内容，演示图片：802 张，还在持续爆肝中，目标是将 Java 程序员生涯中，比较典型的项目都教会大家，如前后端分离博客全栈级开发、秒杀系统、在线商城、IM 即时通讯（Netty）、权限管理（Spring Security）、Spring Cloud Alibaba 微服务等等... 目前有 370+ 小伙伴已加入，一起学习打卡，一起进步！同频的人才能走的更快、更远 ！** 欢迎各位小伙伴加入哟~\r\n\r\n👉 [加入星球](https://t.zsxq.com/12h3hIayK \"加入星球\")，你将获得: <span style=\"color: #f97316; font-weight: 700;\">专属的项目实战 / Java 学习路线 / 一对一提问 / 学习打卡 / 赠书活动</span>，与一群热爱学习的小伙伴一起，将走的更快、更远! **公众号：小哈学Java, 回复【星球】**，可领取<span style=\"color: #f97316; font-weight: 700;\">专属优惠券</span>~\r\n\r\n---\r\n\r\n> 本项目 1.0 版本已部署到了阿里云服务器上，可点击下面链接进行访问，查看实际效果：\r\n>\r\n> 演示地址：[http://118.31.41.16/](http://118.31.41.16/)\r\n>\r\n> 后台登录演示账号:\r\n> \r\n> - 账号：test\r\n> - 密码：test\r\n\r\n## 🏃 关于实战项目\r\n\r\n知识星球是个私密学习圈子，我会在星球内部，出**一系列从 0 到 1 的实战项目，贴合真实的企业级项目开发规范，使用主流的企业技术栈，全程手写后端 + 前端完整代码，通过专栏的形式，把每个功能点的开发的步骤，手摸手，通过丰富的图片 + 文字，保姆级教学（PS: 同时按小节进度提供代码，不至于一上来代码量太多，不知道从哪入手）**。\r\n\r\n\r\n![](https://img.quanxiaoha.com/quanxiaoha/169361945065538)\r\n\r\n目前，我已经给自己的网站：[犬小哈教程](www.quanxiaoha.com/column \"犬小哈教程\") 新开发了专栏模块，可以让小伙伴们只需跟着实战专栏，按照章节顺序教学来，上手敲，即可搞定每个功能点的开发，成体系地完成一个独立项目。*目前加入的小伙伴，都给出了超高评价，以下了截取了部分好评*：\r\n\r\n![](https://img.quanxiaoha.com/quanxiaoha/169733756405612)\r\n\r\n![](https://img.quanxiaoha.com/quanxiaoha/169733761293187)\r\n\r\n![](https://img.quanxiaoha.com/quanxiaoha/169733762195775)\r\n\r\n另外，在跟随小节内容上手的过程中，若遇到问题，可在星球内发起 *1v1 提问，小哈亲自解答*。\r\n\r\n![\"星球内提问\"](https://img.quanxiaoha.com/quanxiaoha/169396126861858 \"星球内提问\")\r\n\r\n星球说不清楚的，项目进度因为某一块搞不定的，微信发我源码，帮忙看问题出在哪：\r\n\r\n![搞不定的，微信发我源码，帮忙看问题出在哪](https://img.quanxiaoha.com/quanxiaoha/169406285385964 \"搞不定的，微信发我源码，帮忙看问题出在哪\")\r\n\r\n\r\n陪伴式写项目，到最终部署到云服务器上，能够通过域名来访问，完成项目上线。\r\n\r\n> 💡 TIP : 后期也会尝试分享一些适合程序员的技术副业，比如开发一些小工具网站，进行推广运营，有了一定用户量，能够挣点零花钱啥的。当然，这都是后话了，前提还需要你能够自行完整的开发一个独立应用，前期还是以项目实战为主。\r\n\r\n既然小哈是准备出一系列的实战项目，我希望这些项目的难度是循序渐进的，能够让你真实的感受到自己的功力在慢慢增强。但是又不想写那种纯纯的 CRUD 型管理后台项目，太枯燥。那么，第一个项目小哈就定位在难度不大，易上手，有趣，并且非常有代表性，实际工作中也能够被频繁用到的。\r\n\r\n脑瓜子一转，想到之前好多读者问我博客的事情，今年 4 月份的时候，又有读者微信问我: *你的博客有没有开源，感觉还挺好看，也想学习、部署一个。*\r\n\r\n![](https://img.quanxiaoha.com/quanxiaoha/169355366112215)\r\n\r\n于是乎，花了点时间整了第一个实战项目 —— **前后端分离的博客 Weblog**。\r\n\r\n\r\n## 💁 项目介绍\r\n\r\n每个技术人都应该有属于自己的博客！相比较直接使用第三方博客平台，自行搭建博客更有成就感；另外就是没有平台限制，比如你想发个二维码引流啥的，平台基本都是不允许的，还有，你可以自由 `div` 定制自己想要的博客 `css` 样式，哪天 UI 看不爽了，咱就自己换；最后，*面试的时候，如果简历贴上的是自己开发博客地址，也会很加分*！\r\n\r\n### 🔗 演示地址\r\n\r\n目前 1.0 版本已经部署到了阿里云服务器上，可点击下面链接进行访问，查看实际效果：\r\n\r\n[http://118.31.41.16/](http://118.31.41.16/ \"http://118.31.41.16/\")\r\n\r\n管理后台登录账号/密码:\r\n\r\n- 账号：test\r\n- 密码：test\r\n\r\n> ⚠️ 注意：该账号的角色为*游客*角色，*仅支持查询操作*，新增、修改、删除操作会提示不允许。\r\n\r\n### ⚒️ 功能模块\r\n\r\n> 💡 TIP : 以下*只是 1.0 版本的功能，后续小哈将添加更多功能进去, 比如图库管理、知识库、在线人数统计、SSR（服务端渲染） 等等*，能够想到的高逼格功能，咱都整上，附带超详细的实战图文笔记 ...\r\n\r\n![Weblog 功能模块一览](https://img.quanxiaoha.com/quanxiaoha/169560157482464 \"Weblog 功能模块一览\")\r\n\r\n### ✏️ 技术栈\r\n\r\n![Weblog 技术栈一览](https://img.quanxiaoha.com/quanxiaoha/169560181378937 \"Weblog 技术栈一览\")\r\n\r\n## 🎉 专栏目标\r\n\r\n学完本项目，你将具备如下能力：\r\n\r\n- 掌握独立开发全栈项目的能力（*后端 + 前端*）；\r\n- 掌握 Spring Boot 相关技术栈，以及构建后端项目能力，写出符合企业级的代码规范；\r\n- 掌握 Vue 3.2 + Element Plus + Vite 4 技术构建前端工程的能力，并能够手动搭建 Admin 后台管理系统；\r\n- 掌握前端页面响应式设计（同时适配不同屏幕），排版布局，能够根据自己需求，`div` 自己想要的前端效果；\r\n- ...\r\n\r\n## 💡 专栏亮点\r\n\r\n- 在技术选型上，小哈选择了目前主流热门的技术栈，对标企业级项目开发；\r\n- 严格把控代码质量，数据库设计，写出令同事称道的代码；\r\n- 熟悉后端工程的搭建，如一些通用的基础设施：参数校验、全局异常捕获、`API` 统一出入参日志打印等等；\r\n- 能够独立完成整个网站的部署流程，从功能开发到服务器、域名选购，再到网站备案，最终公网可访问；\r\n- 对象存储 `Minio` 的使用, 能够独立搭建个人图床；\r\n- 从 0 到 1 ，通过 `Element Plus` 纯手搭 `Admin` 管理后台前端骨架；\r\n- 使用 Vue 3 `setup` 等语法糖新特性；\r\n- 博客前台页面在设计上美观大气；\r\n- ...\r\n\r\n## 📖 专栏大纲\r\n\r\n整个实战专栏，小哈按功能点开发进度来做的目录，目前已经更新到了第第五章，目录大致如下：\r\n\r\n> 💡 TIP : 如下目录不代表最终内容，只会更多，目前只是把已完成的部分详细的罗列了出来，其中大部分功能正在开发中，所属具体小节的标题也会陆续更新进来。\r\n\r\n- 一、[项目介绍](https://www.quanxiaoha.com/column/10000.html)\r\n- 二、开发环境搭建\r\n  - [2.1 【后端】环境安装&工具准备](https://www.quanxiaoha.com/column/10003.html)\r\n  - [2.2 【前端】开发环境&工具安装](https://www.quanxiaoha.com/column/10004.html)\r\n\r\n- 三、Spring Boot 后端工程搭建\r\n  - [3.1 搭建 Spring Boot 多模块工程](https://www.quanxiaoha.com/column/10005.html)\r\n  - [3.2 Spring Boot 多环境配置](https://www.quanxiaoha.com/column/10006.html)\r\n  - [3.3 配置 Lombok](https://www.quanxiaoha.com/column/10007.html)\r\n  - [3.4 Spring Boot 整合 Lockback 日志](https://www.quanxiaoha.com/column/10008.html)\r\n  - [3.5 Spring Boot 自定义注解，实现 API 请求日志切面](https://www.quanxiaoha.com/column/10009.html)\r\n  - [3.6 Spring Boot 通过 MDC 实现日志跟踪](https://www.quanxiaoha.com/column/10010.html)\r\n  - [3.7 Spring Boot 实现优雅的参数校验](https://www.quanxiaoha.com/column/10011.html)\r\n  - [3.8 Spring Boot 自定义响应工具类](https://www.quanxiaoha.com/column/10012.html)\r\n  - [3.9 Spring Boot 实现全局异常管理](https://www.quanxiaoha.com/column/10013.html)\r\n  - [3.10 全局异常处理器+参数校验（最佳实践）](https://www.quanxiaoha.com/column/10014.html)\r\n  - [3.11 整合 Knife4j：提升接口调试效率](https://www.quanxiaoha.com/column/10015.html)\r\n  - [3.12 自定义 Jackson 序列化、反序列化，支持 Java 8 日期新特性](https://www.quanxiaoha.com/column/10016.html)\r\n  - [3.13 小结](https://www.quanxiaoha.com/column/10017.html)\r\n\r\n- 四、使用 Vue 3 + Vite 4 搭建前端工程\r\n  - [4.1 Vue 3 环境安装& Weblog 项目搭建](https://www.quanxiaoha.com/column/10018.html)\r\n  - [4.2 安装 VSCode 开发工具](https://www.quanxiaoha.com/column/10019.html)\r\n  - [4.3 添加 vue-router 路由管理器](https://www.quanxiaoha.com/column/10020.html)\r\n  - [4.4 Vite 配置路径别名：更方便的引用文件](https://www.quanxiaoha.com/column/10021.html)\r\n  - [4.5 整合 Tailwind CSS](https://www.quanxiaoha.com/column/10022.html)\r\n  - [4.6 整合 Tailwind CSS 组件库：Flowbite](https://www.quanxiaoha.com/column/10023.html)\r\n  - [4.7 整合饿了么 Element Plus 组件库](https://www.quanxiaoha.com/column/10024.html)\r\n\r\n- 五、登录模块开发\r\n  - [5.1 登录页设计：支持响应式布局](https://www.quanxiaoha.com/column/10025.html)\r\n  - [5.2 登录页加点盐：通过 Animate.css 添加动画](https://www.quanxiaoha.com/column/10026.html)\r\n  - [5.3 整合 Mybatis Plus](https://www.quanxiaoha.com/column/10027.html)\r\n  - [5.4 p6spy 组件打印完整的 SQL 语句、执行耗时](https://www.quanxiaoha.com/column/10028.html)\r\n  - [5.5 整合 Spring Security](https://www.quanxiaoha.com/column/10029.html)\r\n  - [5.6 Spring Security 整合 JWT ：实现身份认证](https://www.quanxiaoha.com/column/10030.html)\r\n  - [5.7 Spring Security 整合 JWT ：实现接口鉴权](https://www.quanxiaoha.com/column/10031.html)\r\n  - [5.8 Vue 整合 Axios 实现登录功能](https://www.quanxiaoha.com/column/10032.html)\r\n  - [5.9 登录页表单验证](https://www.quanxiaoha.com/column/10033.html)\r\n  - [5.10 登录消息提示、回车键监听、按钮加载 Loading](https://www.quanxiaoha.com/column/10034.html)\r\n  - [5.11 存储 Token 到 Cookie 中](https://www.quanxiaoha.com/column/10035.html)\r\n  - [5.12 Axios 添加请求拦截器、响应拦截器](https://www.quanxiaoha.com/column/10036.html)\r\n  - [5.13 全局路由拦截：实现页面标题动态设置、后台路由跳转的登录判断](https://www.quanxiaoha.com/column/10037.html)\r\n  - [5.14 实现页面顶部加载 Loading 效果](https://www.quanxiaoha.com/column/10038.html)\r\n  - [5.15 重复登录问题优化、密码框可显示密码](https://www.quanxiaoha.com/column/10040.html)\r\n  - [5.16 角色鉴权：添加演示账号，仅支持查询操作](https://www.quanxiaoha.com/column/10089.html)\r\n  \r\n  \r\n  \r\n\r\n- 六、Element Plus 手搭 Admin 管理后台骨架\r\n  - [6.1 搭建管理后台基本布局](https://www.quanxiaoha.com/column/10039.html)\r\n  - [6.2 后台公共 Header 头：样式布局](https://www.quanxiaoha.com/column/10041.html)\r\n  - [6.3 后台公共左侧 Menu 菜单栏：样式布局](https://www.quanxiaoha.com/column/10042.html)\r\n  - [6.4 整合全局状态管理库 Pinia](https://www.quanxiaoha.com/column/10043.html)\r\n  - [6.5 左边菜单栏点击收缩、展开功能实现](https://www.quanxiaoha.com/column/10044.html)\r\n  - [6.6 支持全屏展示、页面点击刷新](https://www.quanxiaoha.com/column/10045.html)\r\n  - [6.7 标签导航栏组件实现：样式布局](https://www.quanxiaoha.com/column/10046.html)\r\n  - [6.8 标签导航栏组件实现：路由同步 (1)](https://www.quanxiaoha.com/column/10047.html)\r\n  - [6.9 标签导航栏组件实现：路由同步 (2)](https://www.quanxiaoha.com/column/10048.html)\r\n  - [6.10 标签导航栏组件实现：标签页关闭](https://www.quanxiaoha.com/column/10049.html)\r\n  - [6.11 标签导航栏组件实现：关闭其他、全部标签页](https://www.quanxiaoha.com/column/10050.html)\r\n  - [6.12 后台公共 Footer 页脚：样式布局](https://www.quanxiaoha.com/column/10051.html)\r\n  - [6.13 使用 KeepAlive 缓存组件，提高页面切换性能和响应速度](https://www.quanxiaoha.com/column/10052.html)\r\n  - [6.14 使用 Transition 组件添加全局过渡动画](https://www.quanxiaoha.com/column/10053.html)\r\n  - [6.15 修改用户密码接口开发](https://www.quanxiaoha.com/column/10054.html)\r\n  - [6.16 获取当前登录用户信息接口开发](https://www.quanxiaoha.com/column/10055.html)\r\n  - [6.17 Pinia 存储用户信息，动态显示登录用户名](https://www.quanxiaoha.com/column/10056.html)\r\n  - [6.18 使用 pinia-persist 插件实现 Pinia 数据持久化](https://www.quanxiaoha.com/column/10057.html)\r\n  - [6.19 用户修改密码、退出登录功能开发](https://www.quanxiaoha.com/column/10058.html)\r\n  - [6.20 小结](https://www.quanxiaoha.com/column/10059.html)\r\n\r\n  \r\n\r\n  \r\n- 七、管理后台：文章分类模块开发\r\n  - [7.1 分类模块接口分析](https://www.quanxiaoha.com/column/10060.html)\r\n  - [7.2 文章分类：新增接口开发](https://www.quanxiaoha.com/column/10061.html)\r\n  - [7.3 文章分类：分页接口开发](https://www.quanxiaoha.com/column/10062.html)\r\n  - [7.4 文章分类：删除接口开发](https://www.quanxiaoha.com/column/10063.html)\r\n  - [7.5 文章发布：分类 Select 下拉列表接口开发](https://www.quanxiaoha.com/column/10064.html)\r\n  - [7.6 后台分类管理页面：样式布局](https://www.quanxiaoha.com/column/10065.html)\r\n  - [7.7 Config Provider 全局配置: 实现组件中文化](https://www.quanxiaoha.com/column/10066.html)\r\n  - [7.8 文章分类：分页列表数据动态渲染](https://www.quanxiaoha.com/column/10067.html)\r\n  - [7.9 文章分类：新增功能开发](https://www.quanxiaoha.com/column/10068.html)\r\n  - [7.10 文章分类：删除功能开发](https://www.quanxiaoha.com/column/10069.html)\r\n  - [7.11 通用表单对话框组件封装](https://www.quanxiaoha.com/column/10070.html)\r\n  - [7.12 添加 Table 组件加载 Loading 、表单对话框提交按钮 Loading 动画](https://www.quanxiaoha.com/column/10071.html)\r\n  \r\n\r\n\r\n- 八、管理后台：标签模块开发\r\n  - [8.1 标签模块接口分析【视频讲解】](https://www.quanxiaoha.com/column/10072.html)\r\n  - [8.2 标签管理：新增标签接口开发【视频讲解】](https://www.quanxiaoha.com/column/10073.html)\r\n  - [8.3 标签管理：标签分页接口开发【视频讲解】](https://www.quanxiaoha.com/column/10074.html)\r\n  - [8.4 标签管理：删除标签接口开发【视频讲解】](https://www.quanxiaoha.com/column/10075.html)\r\n  - [8.5 标签关键词模糊查询 select 列表接口开发【视频讲解】](https://www.quanxiaoha.com/column/10076.html)\r\n  - [8.6 标签管理页面开发：分页列表【视频讲解】](https://www.quanxiaoha.com/column/10077.html)\r\n  - [8.7 标签管理页面开发：新增&删除标签功能【视频讲解】](https://www.quanxiaoha.com/column/10078.html)\r\n  \r\n  \r\n  \r\n- 九、管理后台：博客设置模块开发\r\n  - [9.1 博客设置模块功能分析、表设计](https://www.quanxiaoha.com/column/10079.html)\r\n  - [9.2 Docker 本地安装 Minio 对象存储](https://www.quanxiaoha.com/column/10080.html)\r\n  - [9.3 文件上传接口开发](https://www.quanxiaoha.com/column/10081.html)\r\n  - [9.4 博客设置: 更新接口开发](https://www.quanxiaoha.com/column/10082.html)\r\n  - [9.5 整合 Mapstruct : 简化属性映射](https://www.quanxiaoha.com/column/10083.html)\r\n  - [9.6 博客设置：获取详情接口开发](https://www.quanxiaoha.com/column/10084.html)\r\n  - [9.7 博客设置页面：样式布局](https://www.quanxiaoha.com/column/10085.html)\r\n  - [9.8 管理后台：滚动样式优化](https://www.quanxiaoha.com/column/10086.html)\r\n  - [9.9 博客设置页：数据渲染、图片上传](https://www.quanxiaoha.com/column/10087.html)\r\n  - [9.10 博客设置页：更新设置](https://www.quanxiaoha.com/column/10088.html)\r\n  \r\n\r\n\r\n\r\n- 十、管理后台：文章模块开发\r\n  - [10.1 文章管理模块功能分析、表设计](https://www.quanxiaoha.com/column/10090.html)\r\n  - [10.2 文章管理：文章发布接口开发（1）](https://www.quanxiaoha.com/column/10091.html)\r\n  - [10.3 文章管理：文章发布接口开发（2）—— SQL 注入器实现批量插入](https://www.quanxiaoha.com/column/10092.html)\r\n  - [10.4 文章管理：文章删除接口开发](https://www.quanxiaoha.com/column/10093.html)\r\n  - [10.5 文章管理：分页接口开发](https://www.quanxiaoha.com/column/10094.html)\r\n  - [10.6 文章管理：获取文章详情接口开发](https://www.quanxiaoha.com/column/10095.html)\r\n  - [10.7 文章管理：文章更新接口开发](https://www.quanxiaoha.com/column/10096.html)\r\n  - [10.8 文章管理：分页列表开发](https://www.quanxiaoha.com/column/10097.html)\r\n  - [10.9 文章管理页：删除文章开发](https://www.quanxiaoha.com/column/10098.html)\r\n  - [10.10 文章管理页：写文章对话框样式布局](https://www.quanxiaoha.com/column/10099.html)\r\n  - [10.11 文章管理页：文章发布功能开发](https://www.quanxiaoha.com/column/10100.html)\r\n  - [10.12 文章管理：获取所有标签 Select 列表接口开发](https://www.quanxiaoha.com/column/10101.html)\r\n  - [10.13 文章管理页：文章编辑功能开发](https://www.quanxiaoha.com/column/10102.html)\r\n  - [10.14 Bug 修复：分类、标签删除接口添加是否关联文章校验; 前端 token 过期问题 fixed](https://www.quanxiaoha.com/column/10103.html)\r\n  \r\n  \r\n  \r\n  \r\n  \r\n\r\n- 十一、博客前台：首页开发\r\n   - [11.1 前台首页、归档页接口分析](https://www.quanxiaoha.com/column/10104.html)\r\n   - [11.2 前台首页：文章分页接口开发](https://www.quanxiaoha.com/column/10105.html)\r\n   - [11.3 公共侧边栏：获取分类、标签列表接口开发](https://www.quanxiaoha.com/column/10106.html)\r\n   - [11.4 公共部分：获取博客设置信息接口开发](https://www.quanxiaoha.com/column/10107.html)\r\n   - [11.5 前台 Header 头组件封装](https://www.quanxiaoha.com/column/10108.html)   \r\n   - [11.6 首页样式布局设计（1）](https://www.quanxiaoha.com/column/10109.html)\r\n   - [11.7 首页样式布局设计（2） —— 侧边栏博主信息卡片](https://www.quanxiaoha.com/column/10110.html)\r\n   - [11.8 首页样式布局设计（3） —— 侧边栏分类、标签卡片](https://www.quanxiaoha.com/column/10111.html)\r\n   - [11.9 首页样式布局设计（4） —— Footer 组件封装](https://www.quanxiaoha.com/column/10112.html)\r\n   - [11.10 首页文章分页数据渲染](https://www.quanxiaoha.com/column/10113.html)\r\n   - [11.11 公共右边栏：博主信息卡片组件封装](https://www.quanxiaoha.com/column/10114.html)\r\n   - [11.12 公共右边栏：分类、标签卡片组件封装](https://www.quanxiaoha.com/column/10115.html)\r\n   - [11.13 公共 Header 头：跳转后台、退出登录功能开发](https://www.quanxiaoha.com/column/10116.html)\r\n   \r\n   \r\n\r\n- 十二、博客前台：归档列表页、分类列表页、标签列表页开发\r\n   - [12.1 归档页、分类列表页接口分析](https://www.quanxiaoha.com/column/10117.html)\r\n   - [12.2 文章归档分页接口开发](https://www.quanxiaoha.com/column/10118.html)\r\n   - [12.3 前台归档页：样式布局设计](https://www.quanxiaoha.com/column/10119.html)\r\n   - [12.4 前台归档页：分页列表功能开发](https://www.quanxiaoha.com/column/10120.html)\r\n   - [12.5 前台分类页开发](https://www.quanxiaoha.com/column/10121.html)\r\n   - [12.6 获取某个分类下的文章列表——分页接口开发](https://www.quanxiaoha.com/column/10122.html)\r\n   - [12.7 前台分类-文章列表页: 样式布局开发](https://www.quanxiaoha.com/column/10123.html)\r\n   - [12.8 分类-文章列表页开发](https://www.quanxiaoha.com/column/10124.html)\r\n   - [12.9 前台标签列表页：样式布局&功能开发](https://www.quanxiaoha.com/column/10125.html)\r\n   - [12.10 获取某个标签下的文章列表——分页接口开发](https://www.quanxiaoha.com/column/10130.html)\r\n   - [12.11 标签-文章列表页开发](https://www.quanxiaoha.com/column/10131.html)\r\n\r\n\r\n- 十三、博客前台：文章详情页开发\r\n   - [13.1 文章详情页接口分析](https://www.quanxiaoha.com/column/10126.html)\r\n   - [13.2 后端封装 Markdown 装换工具类](https://www.quanxiaoha.com/column/10127.html)\r\n   - [13.3 获取文章详情接口开发](https://www.quanxiaoha.com/column/10128.html)\r\n   - [13.4 文章详情页：样式布局设计](https://www.quanxiaoha.com/column/10129.html)\r\n\r\n   - *努力爆肝中，每天更新两小节, 按目前的更新速度，1.0 版本差不多还剩1个半月更新完毕...*\r\n- 十四、管理后台：仪表盘模块开发\r\n- 十五、项目部署上线\r\n  - 云服务器选购\r\n  - 相关环境安装（JDK、Docker、Nginx、Mysql）\r\n  - Nginx 配合 Spring Boot 部署\r\n  - 部署前端项目以及通过 IP 访问\r\n  - 域名选购\r\n  - 网站备案\r\n  - 域名映射，项目正式上线\r\n\r\n\r\n\r\n## 👨🏻‍💻 适用人群\r\n\r\n- **在校学生**，有一定基础，想做毕业设计，或者为找工作准备，需要实战项目加分；\r\n\r\n  > 💡 TIP: 小白也没关系，小哈将会告诉你学习路线是啥，哪里有免费的高质量学习视频可以白嫖，学完这些技术栈后再来做实战项目，或者学一点基础边实战边学习都可以。\r\n\r\n- **已经参与工作，对前后端分离感兴趣**，想学习 Vue 3 前端，对独立上线自己网站感兴趣的童鞋；\r\n- **想独立接私活**，需要同时会后端、前端技术栈的童鞋；\r\n\r\n## ✊ 如何加入？\r\n\r\n小哈已经将本站的专栏模块接入了知识星球，想要查看专栏内容，需要订阅我星球后，*微信扫码授权登录后即可解锁所有内容*。因为目前也是刚开始运营，所以价格不会太高，星球官方定价最低必须是 50 元。小哈最终定价为 <font class=\"text-xl\" style=\'color: red\'><b>限时 35 元（附 15 元的优惠券，记得扫码领取下方优惠券加入哟）</b></font>，后续随着内容慢慢的更新迭代，会慢慢涨上去，所以早加入更具性价比哟~ \r\n\r\n<font class=\"text-xl\" style=\'color: red\'><b>星球支持 3 天无理由退费</b></font>，感兴趣的小伙伴*可先加入，看看内容质量如何，不合适直接退款就行，觉得确实内容很干货，就留下来学习，无套路!*\r\n\r\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold mb-2\">扫描下方二维码加入, 星球支持 3 天无理由退款，可以先进去看看合不合适👇👇</div>\r\n\r\n![\"领取优惠券加入，更划算\"](https://img.quanxiaoha.com/quanxiaoha/169355760680941 \"领取优惠券加入，更划算\")\r\n\r\n<div class=\"flex items-center justify-center text-lg text-red-500 font-bold\">扫描上方二维码加入, 星球支持 3 天无理由退款，可以先进去看看合不合适👆👆</div>\r\n\r\n\r\n\r\n\r\n## ❓ 关于答疑\r\n\r\n小伙伴们如果在跟着专栏学习，手敲项目的过程中遇到问题，碰到无法解决的问题，**可在小哈的知识星球内部提问**，我会统一来解答, 如果星球说不清楚的，就加私人微信，打包发项目，亲自给你看哪一步有问题，保证跟上项目进度，不落下任何一个小伙伴，大家一起冲冲冲~\r\n\r\n## 😃 加微信咨询\r\n\r\n对专栏感兴趣的小伙伴，也可以加小哈私人微信来咨询，扫描下方二维码即可，记得备注【*咨询*】哟：\r\n\r\n![扫描二维码，添加小哈私人微信](https://img.quanxiaoha.com/quanxiaoha/169536889316499 \"扫描二维码，添加小哈私人微信\")');
INSERT INTO `t_article_content` VALUES (7, 7, '不是在写bug就是在写bug的路上');
INSERT INTO `t_article_content` VALUES (8, 8, 'idea在等着你！');
INSERT INTO `t_article_content` VALUES (9, 9, '学java不学前端？你在搞笑呢哥们！');
INSERT INTO `t_article_content` VALUES (10, 10, '臭码农的还有休息时间？');

-- ----------------------------
-- Table structure for t_article_tag_rel
-- ----------------------------
DROP TABLE IF EXISTS `t_article_tag_rel`;
CREATE TABLE `t_article_tag_rel`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `article_id` bigint UNSIGNED NOT NULL COMMENT '文章id',
  `tag_id` bigint UNSIGNED NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_article_id`(`article_id`) USING BTREE,
  INDEX `idx_tag_id`(`tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章对应标签关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_article_tag_rel
-- ----------------------------
INSERT INTO `t_article_tag_rel` VALUES (5, 4, 12);
INSERT INTO `t_article_tag_rel` VALUES (6, 4, 13);
INSERT INTO `t_article_tag_rel` VALUES (7, 4, 14);
INSERT INTO `t_article_tag_rel` VALUES (8, 5, 12);
INSERT INTO `t_article_tag_rel` VALUES (9, 5, 13);
INSERT INTO `t_article_tag_rel` VALUES (10, 5, 15);
INSERT INTO `t_article_tag_rel` VALUES (21, 7, 17);
INSERT INTO `t_article_tag_rel` VALUES (22, 7, 18);
INSERT INTO `t_article_tag_rel` VALUES (23, 8, 4);
INSERT INTO `t_article_tag_rel` VALUES (24, 8, 6);
INSERT INTO `t_article_tag_rel` VALUES (25, 8, 19);
INSERT INTO `t_article_tag_rel` VALUES (26, 9, 20);
INSERT INTO `t_article_tag_rel` VALUES (27, 9, 21);
INSERT INTO `t_article_tag_rel` VALUES (28, 9, 22);
INSERT INTO `t_article_tag_rel` VALUES (29, 10, 20);
INSERT INTO `t_article_tag_rel` VALUES (30, 10, 4);
INSERT INTO `t_article_tag_rel` VALUES (31, 10, 23);

-- ----------------------------
-- Table structure for t_blog_settings
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_settings`;
CREATE TABLE `t_blog_settings`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `logo` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '博客Logo',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '博客名称',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '作者名',
  `introduction` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '介绍语',
  `avatar` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '作者头像',
  `github_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'GitHub 主页访问地址',
  `csdn_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'CSDN 主页访问地址',
  `gitee_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT 'Gitee 主页访问地址',
  `zhihu_homepage` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '知乎主页访问地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_blog_settings
-- ----------------------------
INSERT INTO `t_blog_settings` VALUES (1, 'http://127.0.0.1:9000/myblog/a8fd0d52e7fc4cf58b8d97d9aac2789f.png', 'myblog', 'jyp_java', '好好读书', 'http://127.0.0.1:9000/myblog/076bcddc84ca40b7852db1a3bc019046.jpg', 'https://github.com/jjjjjjj9/myblog', '', '', '');

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (2, 'cpp', '2023-11-07 17:41:45', '2023-11-07 17:41:45', 0);
INSERT INTO `t_category` VALUES (4, '算法', '2023-11-07 17:41:57', '2023-11-07 17:41:57', 0);
INSERT INTO `t_category` VALUES (5, 'mysql', '2023-11-07 17:42:02', '2023-11-07 17:42:02', 0);
INSERT INTO `t_category` VALUES (12, 'sss', '2023-11-08 09:03:36', '2023-11-08 09:03:36', 0);
INSERT INTO `t_category` VALUES (13, 'aaa', '2023-11-08 09:04:37', '2023-11-08 09:04:37', 0);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除标志位：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`name`) USING BTREE,
  INDEX `idx_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文章标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES (3, '标签2', '2023-11-08 16:36:30', '2023-11-08 16:36:30', 0);
INSERT INTO `t_tag` VALUES (4, 'java', '2023-11-09 00:42:26', '2023-11-09 00:42:26', 0);
INSERT INTO `t_tag` VALUES (6, 'JAVA!', '2023-11-09 00:42:55', '2023-11-09 00:42:55', 0);
INSERT INTO `t_tag` VALUES (8, '标签1', '2023-11-09 00:42:55', '2023-11-09 00:42:55', 0);
INSERT INTO `t_tag` VALUES (9, '标签3', '2023-11-09 00:42:55', '2023-11-09 00:42:55', 0);
INSERT INTO `t_tag` VALUES (11, '新的标签2', '2023-11-12 22:48:25', '2023-11-12 22:48:25', 0);
INSERT INTO `t_tag` VALUES (12, '新的标签3', '2023-11-12 22:58:14', '2023-11-12 22:58:14', 0);
INSERT INTO `t_tag` VALUES (13, '新的标签4', '2023-11-12 22:58:14', '2023-11-12 22:58:14', 0);
INSERT INTO `t_tag` VALUES (14, '新的标签5', '2023-11-12 22:58:40', '2023-11-12 22:58:40', 0);
INSERT INTO `t_tag` VALUES (15, '新的标签6', '2023-11-12 23:26:54', '2023-11-12 23:26:54', 0);
INSERT INTO `t_tag` VALUES (17, 'bug', '2023-11-14 15:19:38', '2023-11-14 15:19:38', 0);
INSERT INTO `t_tag` VALUES (18, '新', '2023-11-14 15:19:38', '2023-11-14 15:19:38', 0);
INSERT INTO `t_tag` VALUES (19, '快点来学java', '2023-11-14 15:20:37', '2023-11-14 15:20:37', 0);
INSERT INTO `t_tag` VALUES (20, '前端', '2023-11-14 15:21:46', '2023-11-14 15:21:46', 0);
INSERT INTO `t_tag` VALUES (21, 'vue', '2023-11-14 15:21:46', '2023-11-14 15:21:46', 0);
INSERT INTO `t_tag` VALUES (22, 'nodejs', '2023-11-14 15:21:46', '2023-11-14 15:21:46', 0);
INSERT INTO `t_tag` VALUES (23, '写代码', '2023-11-14 15:22:42', '2023-11-14 15:22:42', 0);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后一次更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除：0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (3, 'admin', '$2a$10$LG9McjQa/XiTtDaO0DG26.Mgvicf4QwW7APg1ktLhG4dcrvl7/t26', '2023-10-27 18:02:26', '2023-11-08 09:34:33', 0);
INSERT INTO `t_user` VALUES (4, 'test', '$2a$10$I52bKlZc9JPskzaXO4FrWu9Or9H/HlXiYl90.dcGKO68muBVP2g6S', '2023-10-29 17:55:50', '2023-10-29 17:55:50', 0);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `role` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 'admin', 'ROLE_ADMIN', '2023-07-07 01:21:15');
INSERT INTO `t_user_role` VALUES (2, 'test', 'ROLE_VISITOR', '2023-07-07 01:23:33');
INSERT INTO `t_user_role` VALUES (3, 'dwa', 'ROLR_ADMIN', '2023-10-30 00:10:00');
INSERT INTO `t_user_role` VALUES (4, 'admin', 'ROLE_VISTOR', '2023-10-30 00:12:20');

SET FOREIGN_KEY_CHECKS = 1;
