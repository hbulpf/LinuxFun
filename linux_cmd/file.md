# 文件夹与文件

1. 基本操作
	```
	cd /home 进入 /home 目录
	cd .. 返回上一级目录 
	cd ../.. 返回上两级目录 
	cd 进入个人的主目录 
	cd ~user1 进入个人的主目录 
	cd - 返回上次所在的目录 
	pwd 显示工作路径 

	ls 查看目录中的文件 
	ls -F 查看目录中的文件 
	ls -l 显示文件和目录的详细资料 
	ls -a 显示隐藏文件 
	ls *[0-9]* 显示包含数字的文件名和目录名 
	tree 显示文件和目录由根目录开始的树形结构(1) 
	lstree 显示文件和目录由根目录开始的树形结构(2) 

	mv dir1 new_dir 重命名/移动 一个目录 

	cp file1 file2 复制一个文件 
	cp dir/* . 复制一个目录下的所有文件到当前工作目录 
	cp -a /tmp/dir1 . 复制一个目录到当前工作目录 
	cp -a dir1 dir2 复制一个目录 
		-b 同名,备分原来的文件
		-f 强制覆盖同名文件
		-r  按递归方式保留原目录结构复制文件

	touch -t 0712250000 file1 修改一个文件或目录的时间戳 - (YYMMDDhhmm) 
	file file1  以为文本形式输出mime type
	iconv -l 列出已知的编码 
	chsh –help 改变shell
	```

1. 新建文件夹
	```
	mkdir  dirname
		-m    用于对新建目录设置存取权限，也可以用 chmod 命令进行设置。
	mkdir -m 777 test 
		-p  需要时创建上层文件夹(或目录)，如果文件夹(或目录)已经存在，则不视为错误。

	mkdir dir1 创建一个叫做 'dir1' 的目录' 
	mkdir dir1 dir2 同时创建两个目录 
	mkdir -p /tmp/dir1/dir2 创建一个目录树 
	```

1. 删除文件 文件夹

	```
	rm
		-i 删除前逐一询问确认。
		-f 即使原档案属性设为唯读，亦直接删除，无需逐一确认。
		-r 将目录及以下之档案亦逐一删除。
		很多人还是习惯用rmdir，不过一旦目录非空，就陷入深深的苦恼之中，现在使用rm -rf命令即可。直接rm就可以了，不过要加两个参数-rf 即：rm -rf 目录名字
		-r 就是向下递归，不管有多少级目录，一并删除
		-f 就是直接强行删除，不作任何提示的意思

	rm -f file1 删除一个叫做 'file1' 的文件' 
	rmdir dir1 删除一个叫做 'dir1' 的目录' 
	rm -rf dir1 删除一个叫做 'dir1' 的目录并同时删除其内容 
	rm -rf dir1 dir2 同时删除两个目录及它们的内容 
	rm -rf !(bin)   删除除bin以外的其他文件
	```

	> 提示：如果文件太多，`rm -rf *` 时提示 `-bash: /bin/rm: Argument list too long` 使用命令  `ls | xargs rm -f`   
	> **注：在linux没有回收站，在使用rm命令的时候，一定要小心些，删除之后就无法再恢复了。**

1. 建立软链接
	```
	ln -s file1 lnk1 创建一个指向文件或目录的软链接 
	ln file1 lnk1 创建一个指向文件或目录的物理链接 
	```

1. 查看文件内容 
	```
	cat file1 从第一个字节开始正向查看文件的内容 
	tac file1 从最后一行开始反向查看一个文件的内容 
	
	more file1 查看一个长文件的内容 
	less file1 类似于 'more' 命令，但是它允许在文件中和正向操作一样的反向操作 
	head -2 file1 查看一个文件的前两行 
	tail -2 file1 查看一个文件的最后两行 
	tail -f /var/log/messages 实时查看被添加到一个文件中的内容 
	
	touch file  创建文件
	```

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

   > 对 xargs 的理解: xargs 是一个把前面命令的输入作为后面命令的输出的命令，常用的场景有:   
   > 1. 小文件数量大，直接使用 rm 命令可能导致内存爆满，使用 ls / | xargs rm -f 逐个删除
   > 2. 限定范围，和find一起搜索含有某个关键字的所有文件， find /opt/etc -type f | xargs grep 'keyword'

