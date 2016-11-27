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
