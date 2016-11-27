#docker-node
  
##一个简单的用Docker来运行Express的学习  
  
> * System：win7 64bit  
> * Environent：Docker Toolbox  
> * 第一次打开系统会自动创建一个docker主机，就用它来搞事吧。。

### 运行：
```
docker-machine  env
```
###注意最后两句:  
```
Run this command to configure your shell:  
     @FOR /f "tokens=*" %i IN ('docker-machine env') DO @%i  
```
### 运行： 
``` 
@FOR /f "tokens=*" %i IN ('docker-machine env') DO @%i  

```

### 创建dockerfile文件：
```
#通过 FROM 指令来指定基于的image
FROM daocloud.io/node:5

#镜像创建者
MAINTAINER me@yanbingbing.com

#设定环境变量
#ENV HTTP_PORT 3000

#拷贝项目文件,设置工作目录
COPY . /app
WORKDIR /app

#镜像操作指令
RUN npm install --registry=https://registry.npm.taobao.org

#指定端口号,嗨呀因为express设在3000端口
EXPOSE 3000

#Container启动时执行的命令，一个Dockerfile中只能有一条CMD命令，多条则只执行最后一条CMD.
CMD ["npm", "start"] 
```

### 根据dockerfile创建一个镜像：
```
docker build -t test_node .
```
可通过docker images命令查看所有镜像

### 通过镜像 test_node 创建一个helloworld容器并运行：
```
docker run -p 8081:3000 --name helloworld -it test_node /bin/bash
```
你已经进入容器的里世界了，**npm start**开启你的express吧~  
记得docker-machine  env命令里的IP地址咩。。  
不记得。。  
  
```
#访问看看所有容器
docker ps -a 

#bcc是CONTAINER ID前3位，我这是bcc，删了重run
docker rm bcc  

#嗨呀可以地址是：192.168.99.100
docker-machine  env  
```
  
打开浏览器访问：192.168.99.100:8081，通过地址的8081端口即可访问啦~  
  
容器的里世界，exit命令就能出来啦~  

