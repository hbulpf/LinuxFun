# 软件下载与使用
1. VNC [一键安装VNC Server脚本](https://github.com/hbulpf/ServerOps/blob/master/fast_run/gnome_kde/vncserver-gnome.md)
```
vncserver :2	#临时开启vncserver的第2连接桌面
vncpasswd       #修改连接的用户的密码
```

1. lrzsz
```
sz中的s意为send（发送）
rz中的r意为received（接收）
```

1. expect  
使用expect实现自动登录主机的脚本: `cat jump.exp`   
```
#!/usr/bin/expect
set timeout 30
spawn /usr/bin/ssh -p 2200  -l wangshibo 111.133.132.144
expect "password:"
send "shai3raesh2Uici\r"
interact
```
运行以上脚本:
```
chmod u+x jump.exp
./jump.exp
```

    - expect扩展阅读：
 1. [expect解释 . http://www.cnblogs.com/zhenbianshu/p/5867440.html](http://www.cnblogs.com/zhenbianshu/p/5867440.html)
 1. [expect环境安装以及简单脚本测试 . http://www.cnblogs.com/kevingrace/p/5900303.html](http://www.cnblogs.com/kevingrace/p/5900303.html)
