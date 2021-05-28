# LinuxFun
LinuxFun , 你可以在 本项目中发现各种 Linux 使用技巧和趣味Demo，**Hava Fun ， ^_^**!
## 1. Linux 常用命令速查

|   1   |   2   |   3   |   4   |
| :----: | :----: | :----: | :----: |
|  [系统信息](./linux_cmd/arch.md)    |   [关机 (系统的关机、重启以及登出 )](./linux_cmd/machine.md)   |  [文件操作](./linux_cmd/file.md)    |   [搜索文件](./linux_cmd/file_search.md)   |
|  arch,uname | reboot,shutdown | cd,ls,cp,rm,ln,<br/>chmod,chattr | find |
| [用户和群组](./linux_cmd/user.md) | [打包和压缩](./linux_cmd/tar.md) | [进程命令](./linux_cmd/ps.md) | [文本处理](./linux_cmd/txt.md) |
| usermod,groupmod | tar,unzip | ps,kill | cat,grep,awk,sed,sort,<br/>comm,diff,paste |
| [输入输出重定向](./linux_cmd/redirect.md) | [文件系统](./linux_cmd/fs.md) |  [包管理](./linux_cmd/package.md)    |   [wget和curl](./linux_cmd/download.md)    |
| \>,tee,dos2unix | mount,df,du,mkfs,dump | rpm,yum |  wget, curl |
|   [网络](./linux_cmd/network.md)   | [vim使用](./linux_cmd/vim.md) |    [防火墙设置](./linux_cmd/firewall.md)  |  [top](./linux_cmd/top.md)  top   |
| ifconfig,ip,ifstat,netstat,<br/>tcping,ssh,telnet | vim | firewall-cmd   |  top |
|  [软件使用](./linux_cmd/software.md)    |    [脚本调试](./linux_cmd/debug.md)  |  [其他常见知识](./linux_cmd/others.md)    |  [正则表达式](linux_cmd/regex.md)|
| lrzsz,expect | -x | others  |  regex |
|  [Linux命令全称(助记)](./linux_cmd/remember.md)   | [高频使用脚本](./linux_cmd/high_sample.md)   |    |      |



## 2. Linux 部署常见服务

### 2.1 快速脚本与微服务

#### 2.1.1 Linux服务器快速脚本
1. [aws](fast_run/aws/README.md)
2. [ceph](fast_run/ceph/README.md)
4. [docker](fast_run/docker/README.md)
5. [ftp](fast_run/ftp/README.md)
6. [gitlab](fast_run/gitlab/README.md)
7. [gnome_kde](fast_run/gnome_kde/README.md)
8. [grant](fast_run/grant/README.md)
9. [http](fast_run/http/README.md)
10. [服务器初始化](fast_run/init_run/README.md)
11. [java](fast_run/java/README.md)
12. [log](fast_run/log/README.md)
13. [邮箱服务器](fast_run/mail_server/README.md)
14. [maven](fast_run/maven/README.md)
15. [metabase](fast_run/metabase/README.md)
16. [ml](fast_run/ml/README.md)
17. [monitorix](fast_run/monitorix/README.md)
18. [mysql](fast_run/mysql/README.md)
19. [nas](fast_run/nas/README.md)
20. [nextcloud](fast_run/nextcloud/README.md)
21. [nfs](fast_run/nfs/README.md)
22. [nginx](fast_run/nginx/README.md)
23. [nodejs](fast_run/nodejs/README.md)
24. [php](fast_run/php/README.md)
25. [redis](fast_run/redis/README.md)
26. [ResQuota.md](fast_run/ResQuota.md/README.md)
27. [rsync](fast_run/rsync/README.md)
28. [service_config](fast_run/service_config/README.md)
29. [ssh](fast_run/ssh/README.md)
30. [tomcat](fast_run/tomcat/README.md)
31. [vpn](fast_run/vpn/README.md)
32. [wiznote](fast_run/wiznote/README.md)
33. [yum](fast_run/yum/README.md)
34. [zabbix](fast_run/zabbix/README.md)
35. [设置磁盘限额](fast_run/ResQuota.md)

#### 2.1.2 Devops

1. [VirtualBox实践](DevOps/VirtualBox/README.md)
   - [VirtualBox配置CentOS虚拟机](DevOps/VirtualBox/VirtualBox配置CentOS虚拟机.md)
   - [虚拟机硬盘扩容](DevOps/VirtualBox/VirtualBox_ResizeStorage.md)
   - [VirtualBox 命令行](DevOps/VirtualBox/VirtualBoxCMD.md)
2. [DevOps实践](DevOps/README.md)
   - [jenkins](DevOps/jenkins/README.md)
   - [jumpser](DevOps/jumpser/README.md)
   - [微服务](DevOps/microservice/README.md)
   - [webhook](DevOps/webhook/gitee码云使用webhook.md)

### 2.2 常见服务操作
#### 2.2.1  **CentOS/RedHat** 

1. CentOS 安装 mysql5.7: [自动化安装脚本](https://github.com/hbulpf/ServerOps/tree/master/fast_run/mysql)  /  [文字安装教程](https://www.cnblogs.com/brianzhu/p/8575243.html)
1. [CentOS 安装自定义的Service ](http://www.cnblogs.com/wutao666/p/9781567.html)
1. [各种系统安装ShadowSocks](https://github.com/Shadowsocks-Wiki/shadowsocks)
1. 小技巧
	- [日志搜索](tips/log_search.md)
	
#### 2.2.2  **Ubuntu/Debian**

#### 2.2.3  **SUSE**

## 3. Linux 小工具
1. 终端复用/关闭终端保持进程: [Tmux](./tools/tmux.md)
2. 终端上传下载工具: lrzsz

## 4. Linux 工具函数库
1. [Linux 函数库](./func_lib)

## 5. 推荐 List
1. [开源镜像](./mirrors.md)

2. BookList
	- [鸟哥的 Linux 私房菜](https://book.douban.com/subject/4889838/)；在线网站：[鸟哥的私房菜](http://cn.linux.vbird.org/)
	- [现代操作系统](https://book.douban.com/subject/3852290/)
	- [深入理解计算机系统](https://book.douban.com/subject/26912767/)
	- [Unix 环境高级编程](https://book.douban.com/subject/25900403/)
	- [Unix/Linux 编程实践教程](https://book.douban.com/subject/1219329/)

3. Linux学习技术仓库
	- [the-art-of-command-line](https://github.com/jlevy/the-art-of-command-line)：命令行的艺术
	- [awesome-shell](https://github.com/alebcay/awesome-shell)：一份精心组织的命令行工具及资源的列表。
	- [awesome-osx-command-line](https://github.com/herrbischoff/awesome-osx-command-line)：一份针对 OS X 命令行的更深入的指南。
	- [Strict mode](http://redsymbol.net/articles/unofficial-bash-strict-mode/)：为了编写更好的脚本文件。
	- [shellcheck](https://github.com/koalaman/shellcheck)：一个静态 shell 脚本分析工具，本质上是 bash／sh／zsh 的 lint。
	- [Filenames and Pathnames in Shell](http://www.dwheeler.com/essays/filenames-in-shell.html)：有关如何在 shell 脚本里正确处理文件名的细枝末节。
	- [Data Science at the Command Line](http://datascienceatthecommandline.com/#tools)：用于数据科学的一些命令和工具，摘自同名书籍。
	
4. 在线手册
    - [Linux 菜鸟教程](http://www.runoob.com/linux/linux-command-manual.html)
    - [Linux 命令大全](http://man.linuxde.net/) 

5. 有很多工具库网站
    - [Linux运维日志](https://www.centos.bz/)
    - [Linux运维部落（马哥运维）](http://www.178linux.com/)

----------------------------------------

**项目规范**

本文使用 [`Markdown`](https://www.markdownguide.org/basic-syntax) 编写, 排版符合[`中文技术文档写作规范`](https://github.com/hbulpf/document-style-guide)。Find Me On [**Github**](https://github.com/hbulpf/LinuxFun) , [**Gitee**](https://gitee.com/sifangcloud/LinuxFun)

**友情贡献**

@[**RunAtWorld**](http://www.github.com/RunAtWorld)  &nbsp;  @[**persuez**](https://github.com/persuez) &nbsp;  @[**Clock966**](http://www.github.com/Clock966) 


#### 关注公众号 『四方云和』 获取更多优质文章 ~

![sfyh_qrcode](sfyh_qrcode.jpg)