# 防火墙设置
1. 永久性生效，重启后不会复原
```
开启： chkconfig iptables on
关闭： chkconfig iptables off
```
1. 即时生效，重启后复原
```
开启： service iptables start
关闭： service iptables stop
```
**需要说明的是对于Linux下的其它服务都可以用以上命令执行开启和关闭操作。在开启了防火墙时，做如下设置，开启相关端口，修改/etc/sysconfig/iptables 文件，添加以下内容：
```
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
```
然后重启防火墙
```
[root@localhost ~]# service iptables restart
```
查看防火墙状态
```
[root@localhost ~]# service iptables status
```