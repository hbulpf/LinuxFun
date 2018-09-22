# 打包和压缩文件
```
bunzip2 file1.bz2 解压一个叫做 'file1.bz2'的文件 
bzip2 file1 压缩一个叫做 'file1' 的文件 
gunzip file1.gz 解压一个叫做 'file1.gz'的文件 
gzip file1 压缩一个叫做 'file1'的文件 
gzip -9 file1 最大程度压缩 
rar a file1.rar test_file 创建一个叫做 'file1.rar' 的包 
rar a file1.rar file1 file2 dir1 同时压缩 'file1', 'file2' 以及目录 'dir1' 
rar x file1.rar 解压rar包 
unrar x file1.rar 解压rar包 

tar -cvf archive.tar file1 创建一个非压缩的 tarball 
tar -cvf archive.tar file1 file2 dir1 创建一个包含了 'file1', 'file2' 以及 'dir1'的档案文件 
tar -tf archive.tar 显示一个包中的内容 
tar -xvf archive.tar 释放一个包 
tar -xvf archive.tar -C /tmp 将压缩包释放到 /tmp目录下 

tar -cvjf archive.tar.bz2 dir1 创建一个bzip2格式的压缩包 
tar -xvjf archive.tar.bz2 解压一个bzip2格式的压缩包 

tar -cvzf archive.tar.gz dir1 创建一个gzip格式的压缩包 
tar xvfz archive.tar.gz 解压一个gzip格式的压缩包 
tar xvfz archive.tar.gz  –C  dir1 解压一个gzip格式的压缩包到目录dir1 

zip file1.zip file1 创建一个zip格式的压缩包 
zip -r file1.zip file1 file2 dir1 将几个文件和目录同时压缩成一个zip格式的压缩包 
unzip file1.zip 解压一个zip格式压缩包 
注意：
	-z 解压gz
	-v 冗余输出verbose
	-x 释放extract	-c 创建create
	-f 文件file
	-C 目录directory	
```
> `-f` 后面接的一定是压缩后的文件名而不是被压缩的文件！如果是解压的话，那么 `-f` 后面接的一定是压缩文件名，而不是解压缩后的文件名。也可以这么说，`-f` 后面就是接的压缩或打包文件。
> 
**常见问题**   
1. `tar -xvjf ceph_cluster-rc_v13.2.1.tar.bz2` 报以下错误:
```
tar (child): bzip2: Cannot exec: No such file or directory
tar (child): Error is not recoverable: exiting now
tar: Child returned status 2
tar: Error is not recoverable: exiting now
```
解决:
```
yum install bzip2
```
