# 基础镜像使用centos:7
FROM centos:7
# 维护信息
LABEL maintainer="447475489@qq.com"
LABEL version="1.0"
LABEL description="bstStation服务,默认连接的MySQL的bst_station库密码是123456,其它默认不变"
# 设置字符集
ENV LANG en_US.UTF-8
#定义时区参数
ENV TZ=Asia/Shanghai
#设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
# 暴露端口
EXPOSE 28528
# 设置tomcat和jdk的环境变量，其他的环境变量也可以在这里设置
ENV CATALINA_HOME /usr/local/tomcat-7.0
ENV JAVA_HOME /usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH
# 解压jdk包
WORKDIR /usr/local/
ADD jdk1.8.tar.gz .
# 解压tomcat-tongbu包
WORKDIR /usr/local/
ADD tomcat-7.0.tar.gz .
# 解压bstStation包
WORKDIR $CATALINA_HOME/webapps/
ADD bstStation.tar.gz .
# 工程启动目录
WORKDIR $CATALINA_HOME/bin/
# 启动命令
CMD ["./catalina.sh","run"]
# HEALTHCHECK [选项] CMD <命令>：设置检查容器健康状况的命令。
# HEALTHCHECK NONE ：如果基础镜像有健康检查指令，使用这行可以屏蔽。
# --interval=<间隔>：两次健康检查的间隔，默认为 30 秒。
# --timeout=<间隔>：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被视为失败，默认 30 秒。
# --retries=<次数>：当连续失败指定次数后，则将容器状态视为 unhealthy，默认 3 次。
# --start-period=<间隔>: 应用的启动的初始化时间，在启动过程中的健康检查失效不会计入，默认 0 秒（从 V17.05 引入）。
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f localhost:28528/bstStation || exit 1



# 启动容器
docker run -d --net=host --name=bstStation \
-v /data/tomcat-7.0/logs:/usr/local/tomcat-7.0/logs \
-v /data/tomcat-7.0/conf/db.properties:/usr/local/tomcat-7.0/webapps/bstStation/WEB-INF/classes/conf/db.properties \
 bst_station:v2.7

docker run -d --net=host --name=bstStation \
-v /home/Bst118/bstStation/logs:/usr/local/tomcat-7.0/logs \
-v /home/Bst118/bstStation/conf/db.properties:/usr/local/tomcat-7.0/webapps/bstStation/WEB-INF/classes/conf/db.properties \
registry.cn-hangzhou.aliyuncs.com/cty_jtsyb/bst_station:1.0