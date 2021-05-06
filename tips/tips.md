# 各类小技巧

1. linux删除文件夹下除了某一个文件之外的所有文件及find用法
    比如一个目录下有1,2,3,4,5这五个文件，需要删除除了2以外的所有文件，可以使用
    ```
    find . ! -name 2 -exec rm -f {} \;
    ```
    如果是文件夹，将递归删除除目录名外的所有文件。因此要配合 `-maxdepth` 来更精准的删除.
    ```
    find . -maxdepth 1 ! -name "kubernetes" -exec rm -f {} \; #删除当前目录下除 kubernetes 的目录和文件
    find . -mindepth 3 -maxdepth 5 ! -name passwd  -exec rm -rf {} \;
    ```

2. 对 xargs 的理解: xargs 是一个把前面命令的输入作为后面命令的输出的命令，常用的场景有:   
	1. 小文件数量大，直接使用 rm 命令可能导致内存爆满，使用 ls / | xargs rm -f 逐个删除
	2. 限定范围，和find一起搜索含有某个关键字的所有文件， find /opt/etc -type f | xargs grep 'keyword'
