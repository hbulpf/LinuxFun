# 系统信息
```
arch 显示机器的处理器架构(1) 
uname -m 显示机器的处理器架构(2) 
uname -r 显示正在使用的内核版本
uname -a 查看内核版本
dmidecode -q 显示硬件系统部件 - (SMBIOS / DMI) 
hdparm -i /dev/hda 罗列一个磁盘的架构特性 
hdparm -tT /dev/sda 在磁盘上执行测试性读取操作 
cat /proc/cpuinfo 显示CPU info的信息 
cat /proc/interrupts 显示中断 
cat /proc/meminfo 校验内存使用 
cat /proc/swaps 	显示哪些swap被使用 
cat /proc/version 显示内核的版本 
cat /proc/net/dev 显示网络适配器及统计 
cat /proc/mounts 	显示已加载的文件系统 
cat /etc/os-release 	查看系统版本（只适用rethat系列的linux）
cat /etc/{ issue }		查看系统版本（适用所有的发行版linux），如cat /etc/redhat-release
lsb_release -a		查看系统版本（适用所有的发行版linux）
lspci -tv 罗列 PCI 设备 
lsusb -tv 显示 USB 设备 
date 显示系统日期 
cal 2007 显示2007年的日历表 
date 041217002007.00 设置日期和时间 - 月日时分年.秒 
clock -w 将时间修改保存到 BIOS 
top –u oracle 查看用户oracle用户的内存情况
top 查看Linux的性能
```

系统主要目录清单
```
/bin     二进制可执行命令
/dev     设备特殊文件
/etc     系统管理和配置文件
/home   用户起始目录的基点
/lib     标准程序设计库
/sbin   系统管理命令
/tmp     公用的临时文件存贮点
/usr/Xll X-windows系统文件
/usr/adm   系统管理。数据文件
/usr/bin 其他的可执行命令
/usr/lib 库和软件包的配置文件
/usr/local/bin 本地增加的命令
/usr/local/lib 本地增加的库
/usr/local/src 本地命令的源文件
/usr/man 系统联机手册页
/usr/src/linux  Linux内核源程序文件
/var 某些大文件的溢出区
```

