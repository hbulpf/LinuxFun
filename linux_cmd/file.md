# 文件的权限
1. 使用 "+" 设置权限，使用 "-" 用于取消 
```
ls -lh 显示权限 
ls /tmp | pr -T5 -W$COLUMNS 将终端划分成5栏显示 
chmod ugo+rwx directory1 设置目录的所有人(u)、群组(g)以及其他人(o)以读（r ）、写(w)和执行(x)的权限 
chmod go-rwx directory1 删除群组(g)与其他人(o)对目录的读写执行权限 
chown user1 file1 改变一个文件的所有人属性 
chown -R user1 directory1 改变一个目录的所有人属性并同时改变改目录下所有文件的属性 
chgrp group1 file1 改变文件的群组 
chown user1:group1 file1 改变一个文件的所有人和群组属性 
find / -perm -u+s 罗列一个系统中所有使用了SUID控制的文件 
chmod u+s /bin/file1 设置一个二进制文件的 SUID 位 - 运行该文件的用户也被赋予和所有者同样的权限 
chmod u-s /bin/file1 禁用一个二进制文件的 SUID位 
chmod g+s /home/public 设置一个目录的SGID 位 - 类似SUID ，不过这是针对目录的 
chmod g-s /home/public 禁用一个目录的 SGID 位 
chmod o+t /home/public 设置一个文件的 STIKY 位 - 只允许合法所有人删除文件 
chmod o-t /home/public 禁用一个目录的 STIKY 位 
```

1. 设置文件权限
```
r(Read，读取)：对文件而言，具有读取文件内容的权限；对目录来说，具有浏览目 录的权限。
w(Write,写入)：对文件而言，具有新增、修改文件内容的权限；对目录来说，具有删除、移动目录内文件的权限。
x(eXecute，执行)：对文件而言，具有执行文件的权限；对目录了来说该用户具有进入目录的权限。
r: 对应数值4
w: 对应数值2
x：对应数值1
-：对应数值0
将rwx看成二进制数，如果有则有1表示，没有则有0表示，那么rwx r-x r- -则可以表示成为：　　111   101   100
再将其每三位转换成为一个十进制数，就是754。
可读     可写   可执行
自己     	是        是      -              110
同组用户    是        是      -              110
其他用户    是         -      -              100
```

1. 文件的特殊属性
 > 使用 "+" 设置权限，使用 "-" 用于取消 

	```
	chattr +a file1 只允许以追加方式读写文件 
	chattr +c file1 允许这个文件能被内核自动压缩/解压 
	chattr +d file1 在进行文件系统备份时，dump程序将忽略这个文件 
	chattr +i file1 设置成不可变的文件，不能被删除、修改、重命名或者链接 
	chattr +s file1 允许一个文件被安全地删除 
	chattr +S file1 一旦应用程序对这个文件执行了写操作，使系统立刻把修改的结果写到磁盘 
	chattr +u file1 若文件被删除，系统会允许你在以后恢复这个被删除的文件 
	lsattr 显示特殊的属性 
	```
1. 查看文件内容 
cat file1 从第一个字节开始正向查看文件的内容 
tac file1 从最后一行开始反向查看一个文件的内容 
more file1 查看一个长文件的内容 
less file1 类似于 'more' 命令，但是它允许在文件中和正向操作一样的反向操作 
head -2 file1 查看一个文件的前两行 
tail -2 file1 查看一个文件的最后两行 
tail -f /var/log/messages 实时查看被添加到一个文件中的内容 
touch file  创建文件