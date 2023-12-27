### 
 # @Author: Tongxing
 # @Date: 2023-11-07 15:41:42
 # @LastEditTime: 2023-11-10 10:21:54
 # @LastEditors: Tongxing
 # @Description: 
 # @FilePath: \workspace\docker\e-front\docker-entrypoint.sh
 # 可以输入预定的版权声明、个性签名、空行等
### 
#!/bin/bash
# 停止服务
./home/Bst118/e-front/shutdown.sh
# 启动服务
./home/Bst118/e-front/startup.sh

#tail -F logs/node.log
exec $@