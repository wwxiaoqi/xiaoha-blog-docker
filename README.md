# xiaoha-blog-docker

## 使用说明

1. 将专案储存至家目录

   ```shell
   cd ~
   git clone https://github.com/wwxiaoqi/xiaoha-blog-docker
   cd xiaoha-blog-docker
   ```
   
2. 设定 blog.env 内容
   必要变数设定

   ```shell
    # MYSQL ROOT 密码
	BLOG_ROOT_MYSQL_PASSWORD=E8B9L6cbT3qdBXu
	
	# MINIO 用户名称
	BLOG_MINIO_ROOT_USER=server
	# MINIO 用户密码
	BLOG_MINIO_ROOT_PASSWORD=K4MTKsqpIVZKpOYQb
   ```

3. 将 blog.env 内环境变数导入

   将下面代码加入 `~/.bashrc`

   ```shell
   set -o allexport
   source ~/xiaoha-blog-docker/blog.env 
   set +o allexport
   ```

   完成编辑后，重新载入 `.bashrc`

   ```shell
   source ~/.bashrc
   ```


4. 修改 application.yml 配置文件
将数据库连接信息修改成 docker 的 hostname 名称，例如：



   ```diff
	# mysql
	-   url: jdbc:mysql://172.17.0.1:3306/...
	+   url: jdbc:mysql://blog-mysql:3306/...
   
	# minio
	-   endpoint: http://127.0.0.1:9000
	+   endpoint: http://blog-minio:9000
   ```

配置账号密码请自行对照 blog.env


5. 将 package 编译好的 jar 复制进 xiaoha-blog-docker 路径下，并重命名为 app.jar

   ```shell
   mv quanxiaoha-v1.0.jar app.jar
   ```

6. 运行
   ```shell
   cd xiaoha-blog-docker
   docker compose up -d
   ```

