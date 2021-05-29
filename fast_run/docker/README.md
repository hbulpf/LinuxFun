# Docker

## 检查 Docker状态

```
ps axf | grep docker  #查看docker daemon的运行状况

docker info #查看各个容器的信息
docker inspect {容器名}  #查看容器配置信息
docker ps # 查看容器状态
docker stats {容器名}    #查看容器资源状态：CPU，内存
docker top  {容器名}  [{-au}]   #查看容器中运行的进程
docker logs [{-f}] {容器名}  #查看容器的日志
docker volume ls  #查看挂载的卷
docker volume inspect {卷名}  #查看挂载卷信息

dokcer cp {主机文件目录}   {容器名}:{容器文件目录}  #从主机向容器拷贝文件
```

## 启动Docker

```
#方式1
sudo service docker start  #启动docker
sudo chkconfig docker on   #使docker开机启动
sudo service docker stop  #停止docker服务

#方式2
sudo systemctl start docker  #启动docker
sudo systemctl enable docker  #使docker开机启动
sudo systemctl stop docker  #停止docker服务

#重启容器服务
sudo systemctl daemon-reload  #重新加载服务
sudo systemctl restart docker   #重启docker

#建立docker用户组
sudo groupadd docker  #建立 docker 用户组
sudo usermod -aG docker $USER  #将当前用户加入 docker 用户组
```

## 列出镜像

```
docker search centos  #搜索镜像centos ，-s N 参数可以指定仅显示评价为 N 星以上的镜像

docker images  #列出已经下载下来的镜像 docker images 
docker images ubuntu  #根据仓库名列出镜像
docker images ubuntu:16.04  #列出特定的某个镜像，也就是说指定仓库名和标签

docker images -f dangling=true   #显示虚悬镜像(dangling image)
docker images -f since=mongo:3.2 #使用过滤器来列出虚悬镜像,看到在 mongo:3.2 之后建立的镜像
docker images -f before=mongo:3.2 #使用过滤器来列出虚悬镜像,看到在 mongo:3.2 之前建立的镜像
docker images -f label=com.example.version=0.1  #通过 LABEL 来过滤
docker pull [选项] [Docker Registry地址]<仓库名>:<标签>  #从 Docker Registry 获取镜像
```

## 操作 镜像 

### 镜像基本操作

```
#从dockerfile构建镜像
docker build [选项] <上下文路径/URL/->   #镜像构建docker build
docker build -t nginx:v3 .  #构建一个nginx:v3镜像

#删除镜像
docker rmi [选项] <镜像1> [<镜像2> ...]  #删除本地镜像
docker rmi centos  #删除本地镜像 centos
docker rmi $(docker images -q redis)  #删除所有仓库名为 redis 的镜像
docker rmi $(docker images -q -f before=mongo:3.2)   #删除所有在 mongo:3.2 之前的镜像

docker diff <容器ID或容器名>  #查看容器的存储层的改动
docker diff webserver   #查看对webserver的改动
docker history nginx:v2  #查看镜像nginx:latest 的历史构建记录

#上传/下载镜像
docker pull cloudman6/httpd:v1  #拉取nginx镜像，完整格式为：[username]/xxx:tag
docker push cloudman6/httpd:v1   #将镜像推送到 Docker Hub，完整格式为：[username]/xxx:tag

#标记镜像
docker tag ba58 192.168.7.26:5000/test:v1 #将ba58这个镜像重命名为192.168.7.26:5000/test:v1	
docker push 192.168.7.26:5000/test:v1   #上传镜像到私有镜像仓库 192.168.7.26:5000
curl http://192.168.7.26:5000/v1/search   #用 curl 查看仓库中的镜像
docker pull 192.168.7.26:5000/test   #到另外一台机器去下载这个镜像
```

### 导入/导出镜像文件

```
#将容器保存为镜像
docker commit [选项] <容器ID或容器名> [<仓库名>[:<标签>]] 
docker commit --author "Tao Wang <twang2218@gmail.com>" --message "修改了默认网页" webserver nginx:v2  #将 webserver 容器保存为镜像 nginx:v2

#镜像保存为归档文件
docker save alpine | gzip > alpine-latest.tar.gz  #在一台机器上将镜像保存为归档文件
docker load -i alpine-latest.tar.gz   #在另一台机器上加载镜像

#导入镜像
docker import [选项] <文件>|<URL>|- [<仓库名>[:<标签>]]   
docker import http://download.openvz.org/template/precreated/ubuntu-14.04-x86_64-minimal.tar.gz openvz/ubuntu:14.04 #从 rootfs 压缩包导入,这条命令自动下载了 ubuntu-14.04-x86_64-minimal.tar.gz 文件，并且作为根文件系统展开导入，并保存为镜像 openvz/ubuntu:14.04 

#跨主机迁移镜像
docker save <镜像名> | bzip2 | pv | ssh <用户名>@<主机名> 'cat | docker load   #写一个命令完成从一个机器将镜像迁移到另一个机器：使用Linux的管道
```

## Docker 容器操作 
### 容器运行/启动/终止  

```bash
#运行容器
docker run -d ubuntu:14.04 /bin/sh -c "while true; do echo hello world; sleep 1; done"   #docker启动一个ubuntu容器并在守护态运行
#注： docker run 的时候如果添加 --rm 标记，则容器在终止后会立刻删除,--rm 和 -d 参数不能同时使用
docker run --name webserver --rm -p 80:80 nginx #启动一个nginx容器，容器终止即删除容器
docker run --name webserver -d -p 80:80 nginx  #启动一个nginx容器，守护进程运行

#容器启动/终止
docker start {容器ID或容器名}  #启动一个终止态的容器
docker stop {容器ID或容器名}  #终止一个运行中的容器 
docker restart {容器ID或容器名}  #重启一个容器

#删除容器
docker rm  {容器ID或容器名} 
docker rm trusting_newton  #删除一个处于终止状态的容器

docker rm $(docker ps -qf status=exited)  #清理全部终止状态的容器
docker container prune -f    #清理全部终止状态的容器
```

### 查看容器状态
```
docker ps   #查看容器信息
docker ps -a  #查看所有容器信息，包括终止的容器

docker logs  {容器名} #获取容器的日志信息

docker stats {容器ID或容器名}  #在宿主机查看某个容器cpu、内存、网络、io情况
docker stats   #在宿主机查看全部容器cpu、内存、网络、io情况
```

### 进入容器与容器交互

```
#进入容器与容器交互
docker exec -it {容器ID或容器名} /bin/bash  # #交互式终端方式进入,注：对容器来说，这将重启一个终端
docker exec -it webserver bash  #交互式终端方式进入 webserver 容器，并执行了 bash 命令
docker attach {容器ID或容器名} #将当前终端attach到启动容器的终端
docker run -it {容器ID或容器名}  #以交互式的方式创建容器
```

### 导入/导出容器
```
#导出容器快照为tar包
docker export {容器ID或容器名} > ubuntu.tar  #导出容器为容器快照,ubuntu.tar	

#从tar包快照导入为容器	
cat ubuntu.tar | docker import - test/ubuntu:v1.0  #从容器快照文件中再导入为镜像

docker import http://example.com/exampleimage.tgz example/imagerepo  #指定 URL 或者某个目录,从容器快照文件中再导入为镜像
```

## Registry
```
#登录公共 Registry
docker login -u {username}  #登录 docker.io
```

## 数据卷
```
docker run -d -P --name web -v /src/webapp:/opt/webapp training/webapp python app.py #使用 bind mount 挂载一个主机目录作为数据卷:主机的 /src/webapp 目录到容器的 /opt/webapp 目录
docker run -d -P --name web -v /opt/webapp training/webapp python app.py   #使用 docker managed volume 挂载容器数据卷，将在主机上 /var/lib/docker/volumes/ 为容器建立一个数据卷目录,可以使用 docker inspect web 查看 Mounts - Source 的内容即为主机目录，即使删除容器，数据卷目录页不会被删除
```

## 容器网络
```
#随机端口映射
docker run -d -P training/webapp python app.py #使用 -P 标记，Docker 会随机映射一个 49000~49900 的端口到内部容器开放的网络端口

#映射特定端口
docker run -d -p 5000:5000 training/webapp python app.py #-p（小写的）可以指定要映射的端口,-p 可以使用多次
docker run -d -p 5000:5000 -p 3000:80 training/webapp python app.py
docker run -d -p 127.0.0.1::5000 training/webapp python app.py #使用 ip::containerPort 绑定 localhost 的任意端口到容器的 5000 端口，本地主机会自动分配一个端口

#查看端口映射
docker port {容器ID或容器名}  #查看映射端口配置，也可以通过 docker ps -a 查看

#链接容器
docker run -d -P --name web --link db:db training/webapp python app.py  #创建一个新的 web 容器，并将它连接到 db 容器
```

## 容器访问控制
```
sysctl net.ipv4.ip_forward   #检查转发是否打开
sysctl -w net.ipv4.ip_forward=1  #手动开启转发

brctl show   #查看网桥和端口连接信息

ip addr  #查看 IP 地址配置

ip route  #查看路由信息

ifconfig {网卡名}  #查看路由信息
```

## 容器空间清理 `prune`

```
#移除容器
docker container prune  #清除所有停止的容器
docker container prune --filter "until=24h"  #删除停止超过24小时的容器
#其他方式式，兼容旧版本
docker rm $(docker ps -qf status=exited) #清除所有已停止的容器
docker rm `docker ps -a|grep Exited|awk '{print $1}'`  #清除所有已停止的容器
docker rm $(docker ps -a -q)   #尝试清除所有已停止的容器,运行中的容器被保护不能被清理

#移除镜像
docker image prune   #清除状态为dangling的镜像
docker image prune -a  #移除所有未被使用的镜像
docker image prune -a --filter "until=24h"  #删除停止创建超过24小时的镜像
#其他方式式，兼容旧版本
docker rmi $(docker images -q -f "dangling=true") #清除状态为dangling的镜像(未被打标签和没有被任何容器引用的镜像)

#移除存储卷
docker volume prune  #删除所有的未被使用的存储卷
docker volume prune --filter "label!=keep" #删除label值为keep的存储卷
#其他方式，兼容旧版本
docker volume rm $(docker volume ls -q -f dangling=true)

#移除网络: docker网络并不会占据磁盘空间，但是会创建iptables规则，桥网络设备和路由表
docker network prune  #删除所有的未被使用的网络
docker network prune --filter "until=24h"  #删除未被使用超过24小时的网络
docker system prune #删除所有的未被使用的对象,包括镜像、容器、网络和存储卷
# 注：在docker 17.06.1之后，需要通过设置–volumes字段，才会同时清理存储卷
docker system prune --volumes
```

> `-f` 参数强制执行   
> `-a` 参数查看所有   
> `--filter` 参数，筛选特定资源   

## swarm（待修改）

```
docker pull swarm  #下载镜像
	
docker run --rm swarm -v  #查看 Swarm 版本,验证是否成功下载 Swarm 镜像

配置节点,添加 Dockerdaemon 的网络监听
docker daemon -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock
启动集群,Docker 集群管理需要使用服务发现（Service Discover） 功能,启动 consul 服务容器，映射到主机的 8500 端口
docker run -d -p 8500:8500 --name=consul progrium/consul -server -bootstrap
启动管理节点,启动一个主管理节点，映射到主机的 4000 端口
docker run -d -p 4000:4000 swarm manage -H :4000 --replication --advertise <manager0_ip>:4000 consul://<consul_ip>:8500
启动工作节点,需要在每个工作节点上启动 agent 服务,获取节点的主机地址为 <node_ip> ，并指定前面获取到的 consel 服务地址。
docker run -d swarm join --advertise=<node_ip>:2375 consul://<consul_ip>:8500

创建集群 id,在任意一台安装了 Swarm 的机器上执行 swarm create 命令来在 DockerHub 服务上进行注册。
docker run --rm swarm create
配置集群节点,在所有要加入集群的普通节点上面执行 swarm join 命令，表示把这台机器加入指定集群当中。
docker run --rm swarm join --addr=192.168.0.2:2375 token://946d65606f7c2f49766e4dddac5b4365 
配置管理节点,启动 manager 服务，默认监听到 2375 端口【本地的 2375 端口已经被 Docker Daemon 占用,将manager 服务监听端口映射到本地一个空闲的 12375 端口】
docker run -d -p 12375:2375 swarm manage token://946d65606f7c2f49766e4dddac5b4365

查看集群节点列表
docker run --rm swarm list token://946d65606f7c2f49766e4dddac5b4365
```

# 常见问题

1. `Cannot start container eb9d501f56bc142d9bf75ddfc7ad88383b7388ca6a5959309af2165f1fff6292: iptables failed: iptables --wait -t nat -A DOCKER -p tcp -d 0/0 --dport 8081 -j DNAT --to-destination 172.17.0.164:8080 ! -i docker0: iptables: No chain/target/match by that name. (exit status 1)` 

	解决：   

	在宿主机执行：
	```
	pkill docker 
	iptables -t nat -F 
	ifconfig docker0 down 
	brctl delbr docker0 
	docker -d 
	systmctl restart docker重启docker服务
	```

2. `docker 修改容器启动配置`<br>

	方法1:<br>
	```
	docker container update --restart=always <containername>
	```

	方法2:<br>
	修改配置文件 `/var/lib/docker/containers/容器ID/hostconfig.json`,在改文件中搜索关键字restart,修改文件前要把容器停止,不然无法写入。
	当前配置 `"RestartPolicy":{"Name":"no","MaximumRetryCount":0}` 修改为后 `"RestartPolicy":{"Name":"always","MaximumRetryCount":0}`
	重启docker 服务即可

# 参考

1. [Docker — 从入门到实践](https://github.com/yeasy/docker_practice)
2. [每天5分钟玩转 Docker 容器技术](https://mp.weixin.qq.com/s/7o8QxGydMTUe4Q7Tz46Diw)