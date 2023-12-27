# 基础镜像使用centos:7
FROM centos:7
# 维护信息
LABEL maintainer="447475489@qq.com"
LABEL version="1.0"
LABEL description="station-openapi-service,自有站务系统联网售票接口服务"
# 设置字符集
ENV LANG en_US.UTF-8
# 定义时区参数
ENV TZ=Asia/Shanghai
# 设置时区
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
# 暴露端口
EXPOSE 28520
# 设置jdk的环境变量，其他的环境变量也可以在这里设置
ENV JAVA_HOME /usr/local/jdk1.8
ENV PATH $JAVA_HOME/bin:$PATH
ENV basePath /home/Bst118
# 解压jdk包
WORKDIR /usr/local/
ADD jdk1.8.tar.gz .
# 解压e-front包
WORKDIR ${basePath}
ADD station-openapi-service.tar.gz .
# 工程启动
WORKDIR ${basePath}/station-openapi-service/
# 添加jar重命名为app.jar
RUN mv station-openapi-service-1.0.jar app.jar
# 启动命令
ENTRYPOINT ["java","-jar","app.jar"]
# HEALTHCHECK [选项] CMD <命令>：设置检查容器健康状况的命令。
# HEALTHCHECK NONE ：如果基础镜像有健康检查指令，使用这行可以屏蔽。
# --interval=<间隔>：两次健康检查的间隔，默认为 30 秒。
# --timeout=<间隔>：健康检查命令运行超时时间，如果超过这个时间，本次健康检查就被视为失败，默认 30 秒。
# --retries=<次数>：当连续失败指定次数后，则将容器状态视为 unhealthy，默认 3 次。
# --start-period=<间隔>: 应用的启动的初始化时间，在启动过程中的健康检查失效不会计入，默认 0 秒（从 V17.05 引入）。
HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f localhost:28520/openapi || exit 1



# 启动容器
docker run -d --net=host --name=station-openapi-service \
-v /home/Bst118/station-openapi-service/logs/:/home/Bst118/station-openapi-service/logs/ \
-v /home/Bst118/station-openapi-service/config/application-sqlserver.properties:/home/Bst118/station-openapi-service/config/application-sqlserver.properties \
station-openapi-service:v1.0
# /home/Bst118/station-openapi-service/config/application.properties
# -v /home/Bst118/station-openapi-service/config/application-sqlserver.properties
station-openapi-service:v1.0

/data/e-front_docker/e-front/config

/data/e-front_docker/e-front/logs
-v /home/Bst118/e-front/e-front/config/application-pro.properties:/home/Bst118/e-front/e-front/config/application-pro.properties \

docker run -d --net=host --name=station-openapi-service \
-v /home/Bst118/station-openapi-service/logs/:/home/Bst118/station-openapi-service/logs/ \
-v /home/Bst118/station-openapi-service/config/application-mysql.properties:/home/Bst118/station-openapi-service/config/application-mysql.properties \
-v /home/Bst118/station-openapi-service/config/application-sqlserver.properties:/home/Bst118/station-openapi-service/config/application-sqlserver.properties \
-v /home/Bst118/station-openapi-service/config/application.properties:/home/Bst118/station-openapi-service/config/application.properties \
registry.cn-hangzhou.aliyuncs.com/cty_jtsyb/station-openapi-service:1.1