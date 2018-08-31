# 包管理
1. RPM 包 - （Fedora, Redhat及类似系统)
```
rpm -ivh package.rpm 安装一个rpm包 
rpm -ivh --nodeeps package.rpm 安装一个rpm包而忽略依赖关系警告 
rpm -U package.rpm 更新一个rpm包但不改变其配置文件 
rpm -F package.rpm 更新一个确定已经安装的rpm包 
rpm -e package_name.rpm 删除一个rpm包 
rpm -qa 显示系统中所有已经安装的rpm包 
rpm -qa | grep httpd 显示所有名称中包含 "httpd" 字样的rpm包 
rpm -qi package_name 获取一个已安装包的特殊信息 
rpm -qg "System Environment/Daemons" 显示一个组件的rpm包 
rpm -ql package_name 显示一个已经安装的rpm包提供的文件列表 
rpm -qc package_name 显示一个已经安装的rpm包提供的配置文件列表 
rpm -q package_name --whatrequires 显示与一个rpm包存在依赖关系的列表 
rpm -q package_name --whatprovides 显示一个rpm包所占的体积 
rpm -q package_name --scripts 显示在安装/删除期间所执行的脚本l 
rpm -q package_name --changelog 显示一个rpm包的修改历史 
rpm -qf /etc/httpd/conf/httpd.conf 确认所给的文件由哪个rpm包所提供 
rpm -qp package.rpm -l 显示由一个尚未安装的rpm包提供的文件列表 
rpm --import /media/cdrom/RPM-GPG-KEY 导入公钥数字证书 
rpm --checksig package.rpm 确认一个rpm包的完整性 
rpm -qa gpg-pubkey 确认已安装的所有rpm包的完整性 
rpm -V package_name 检查文件尺寸、 许可、类型、所有者、群组、MD5检查以及最后修改时间 
rpm -Va 检查系统中所有已安装的rpm包- 小心使用 
rpm -Vp package.rpm 确认一个rpm包还未安装 
rpm2cpio package.rpm | cpio --extract --make-directories *bin* 从一个rpm包运行可执行文件 
rpm -ivh /usr/src/redhat/RPMS/`arch`/package.rpm 从一个rpm源码安装一个构建好的包 
rpmbuild --rebuild package_name.src.rpm 从一个rpm源码构建一个 rpm 包 
```

1. YUM 软件包升级器 （Fedora, RedHat及类似系统） 
	1. 安装卸载
		>  使用yum安装和卸载软件，有个前提是yum安装的软件包都是rpm格式的。

		```
	     用YUM安装软件包命令：
	     yum install {package_name}
	     用YUM删除软件包命令：
	     yum remove {package_name}
	      1.使用YUM在rpm仓库查找相关的软件包
	     yum search {package_name}
	      2.列出所有可安装的软件包
	     yum list
	      3.列出所有可更新的软件包
	     yum list updates
	      4.列出所有已安装的软件包
	     yum list installed
	      5.列出所有已安装但不在Yum Repository 內的软件包
	     yum list extras
	      6.列出所指定软件包
	     yum list {package_name}
	      7.使用YUM获取软件包相关的信息
	     yum info {package_name}
	      8.列出所有软件包的信息
	     yum info
	      9.列出所有可更新的软件包信息
	     yum info updates
	      10.列出所有已安裝的软件包信息
	     yum info installed
	      11.列出所有已安裝但不在Yum Repository 內的软件包信息
	     yum info extras
	      12.列出软件包提供哪些文件
	     yum provides {package_name}
		```
	
	1. 清除YUM缓存    
	    yum 会把下载的软件包和header存储在cache中，而不会自动删除。如果我们觉得它们占用了磁盘空间，可以使用yum clean指令进行清除，更精确的用法是yum clean headers清除header，yum clean packages清除下载的rpm包，yum clean all 清除所有。
		```
	     1.清除缓存目录(/var/cache/yum)下的软件包
	    yum clean packages
	     2.清除缓存目录(/var/cache/yum)下的 headers
	    yum clean headers
	     3.清除缓存目录(/var/cache/yum)下旧的 headers
	    yum clean oldheaders
	     4.清除缓存目录(/var/cache/yum)下的软件包及旧的headers
	    yum clean, yum clean all (= yum clean packages; yum clean oldheaders)
	    ```

	1. yum命令工具使用举例
		```
	     yum update  升级系统
	     yum install  {package_name} 安装指定软件包
		 yum install  {package_name} -y	安装指定软件包，全部步骤选择yes选项
		 yum localinstall {package_name} 从硬盘安装rpm包并使用yum解决依赖
	     yum update {package_name} 升级指定软件包
	     yum remove {package_name} 卸载指定软件
	     yum grouplist   查看系统中已经安装的和可用的软件组，可用的可以安装
	     yum grooupinstall {package_name}安装上一个命令显示的可用的软件组中的一个
	     yum grooupupdate {package_name}更新指定软件组的软件包
	     yum grooupremove {package_name} 卸载指定软件组中的软件包
	     yum deplist {package_name} 查询指定软件包的依赖关系
	     yum list yum\* 列出所有以yum开头的软件包
	    ```

1. DEB 包 (Debian, Ubuntu 以及类似系统) 
	```
	dpkg -i package.deb 安装/更新一个 deb 包 
	dpkg -r package_name 从系统删除一个 deb 包 
	dpkg -l 显示系统中所有已经安装的 deb 包 
	dpkg -l | grep httpd 显示所有名称中包含 "httpd" 字样的deb包 
	dpkg -s package_name 获得已经安装在系统中一个特殊包的信息 
	dpkg -L package_name 显示系统中已经安装的一个deb包所提供的文件列表 
	dpkg --contents package.deb 显示尚未安装的一个包所提供的文件列表 
	dpkg -S /bin/ping 确认所给的文件由哪个deb包提供 
	```

1. APT 软件工具 (Debian, Ubuntu 以及类似系统) 
	```
	apt-get install package_name 安装/更新一个 deb 包 
	apt-cdrom install package_name 从光盘安装/更新一个 deb 包 
	apt-get update 升级列表中的软件包 
	apt-get upgrade 升级所有已安装的软件 
	apt-get remove package_name 从系统删除一个deb包 
	apt-get check 确认依赖的软件仓库正确 
	apt-get clean 从下载的软件包中清理缓存 
	apt-cache search searched-package 返回包含所要搜索字符串的软件包名称 
	```
