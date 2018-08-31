# 网络
```
ifconfig eth0	显示一个以太网卡的配置 
ifup eth0 		启用一个 'eth0' 网络设备 
ifdown eth0 	禁用一个 'eth0' 网络设备 
ifconfig eth0 192.168.1.1 netmask 255.255.255.0	设置eth0的IP和子网掩码
hostname 		显示系统hostname
host www.example.com  	lookup hostname to resolve name to ip address and viceversa 
nslookup www.example.com  lookup hostname to resolve name to ip address and viceversa 
whois www.example.com  	lookup on Whois database 
ifconfig eth0 promisc	设置 'eth0' 成混杂模式以嗅探数据包 (sniffing) 
dhclient eth0	以dhcp模式启用 'eth0' 
route -n		show routing table 
route add -net 0/0 gw IP_Gateway  	configura default gateway 
route add -net 192.168.0.0 netmask 255.255.0.0 gw 192.168.1.1	 configure static route to reach network '192.168.0.0/16' 
route del 0/0 gw IP_gateway    remove static route 
echo "1" > /proc/sys/net/ipv4/ip_forward activate ip routing 
ip link show 	show link status of all interfaces 
mii-tool eth0	 show link status of 'eth0' 
ethtool eth0 	show statistics of network card 'eth0' 
netstat -tup 	show all active network connections and their PID 
netstat -tupl 	show all network services listening on the system and their PID 
tcpdump tcp port 80 	show all HTTP traffic 
iwlist scan  	show wireless networks 
iwconfig eth1  show configuration of a wireless network card 
more /etc/reslov.conf   查看DNS
ip addr		显示所有ip地址信息
ip addr show eth0	显示eth0 的ip地址信息
ip route	显示路由信息
brctl show	查看桥接信息
netstat  -lnp|grep 88	查看88端口占用的进程

nethogs	按进程查看流量占用
iptraf	按连接/端口查看流量
ifstat	按设备查看流量
ethtool	诊断工具
tcpdump		抓包工具
ss	连接查看工具
其他: dstat, slurm, nload, bmon
Watch -n 1 “ifstat”	一秒查看一次流量

hostname host_name	临时使host_name生效
hostname  /etc/hostname	永久修改hostname，使host_name生效
/etc/profile 是来保存系统启动的配置文件的
当前用户的配置文件保存在 .bash_profile 中

ping ip/ host_name 检测远程服务器网络是否连通
tcping ip/ host_name port 检测远程服务器端口是否处于监听状态
telnet ip/ host_name port 检测远程服务器端口是否处于监听状态
切换用户命令：su  -  x1
ssh远程登录： ssh 192.168.1.254
telnet服务远程登录： telnet 192.168.1.254(telnet不安全，默认不允许root用户登录)
在linux下一ping就ping个没完，怎么让它停下来？
Ctrl+c 停止   Ctrl+z 暂停
netstat –apn
netstat –ntlp

	常见参数
	-a (all)显示所有选项，默认不显示LISTEN相关
	-t (tcp)仅显示tcp相关选项
	-u (udp)仅显示udp相关选项
	-n 拒绝显示别名，能显示数字的全部转化成数字。
	-l 仅列出有在 Listen (监听) 的服務状态
	-p 显示建立相关链接的程序名
	-r 显示路由信息，路由表
	-e 显示扩展信息，例如uid等
	-s 按各个协议进行统计
	-c 每隔一个固定时间，执行该netstat命令。
```