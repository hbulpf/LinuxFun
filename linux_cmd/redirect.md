# 重定向
1. 把命令运行的结果保存到文件当中：用 > 把输出转向就可以了,例子:
```
$ ls > ls.txt    ＃或者 ls-->ls.txt    ＃把ls命令的运行结果保存到文件ls.txt中
　　说明: > 是把输出转向到指定的文件，如文件已存在的话也会重新写入，文件原内容不会保留
　　     >> 是把输出附向到文件的后面，文件原内容会保留下来
```
1. 在输出信息的同时把信息记录到文件中： tee 命令　　
```
解释一下tee的作用:
　　“read from standard input and write to standard output and files”，它从标准输入读取内容并将其写到标准输出和文件中
       参数：  -a, --append，“append to the given FILEs, do not overwrite“，附加至给出的文件，而不是覆盖它,例子:
$ ls | tee ls.txt   ＃将会在终端上显示ls命令的执行结果，并把执行结果输出到ls.txt 文件中  
$ls | tee -a ls.txt   #保留ls.txt文件中原来的内容，并把ls命令的执行结果添加到ls.txt文件的后面。
```
1. 多个命令的输出都需要记录： script 命令
```
script这个命令很强大，可以记录终端的所有输出到相应的文件中
	例子:
	1.$ script
	　　Script. started, file is typescript
	2.$ ls
	　　…… 内容省略
	3.$ exit
	　　exit
	　　Script. done, file is typescript
	4. $cat typescript   ＃就会把上面绿色的部分再显示一次：
	　　说明:
	　　1,我们在启动script时没有指定文件名，它会自动记录到当前目录下一个名为 typescript的文件中。也可以用 -a参数 指定文件名
	　　例子:
	$script. -a example.txt  ＃终端的输出内容被记录到 example.txt这个文件中
	　　2,退出script时，用exit，事实上script就是启动了一个shell
```

1. 字符设置和文件格式转换 
```
dos2unix filedos.txt fileunix.txt 将一个文本文件的格式从MSDOS转换成UNIX 
unix2dos fileunix.txt filedos.txt 将一个文本文件的格式从UNIX转换成MSDOS 
recode HTML <page.txt> page.html 将一个文本文件转换成html 
recode -l | more 显示所有允许的转换格式 
```