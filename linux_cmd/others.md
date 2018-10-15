# 其他常见知识
1. **`set -e`**   
脚本可看作一个进程, `set -e`选项只作用于当前进行，不作用于其创建的子进程。

	`set -e` 命令总结：
		1. 当命令的返回值为非零状态时，则立即退出脚本的执行。
		2. 作用范围只限于脚本执行的当前进行，不作用于其创建的子进程。
		3. 当根据命令执行的返回值，输出对应的log时，最好不要采用set -e选项，而是通过配合exit 命令来达到输出log并退出执行的目的。

	测试如下：
	```
	$ cat run.sh
	#!/bin/bash
	set -e
	 
	$ ./set.sh
	$ cat ./set.sh
	#!/bin/bash
	set -e
	 
	function return1()
	{
	        return 1
	}
	function return0()
	{
	        return 0
	}
	function returnf()
	{
	        return $1
	}
	 
	echo "run start"
	return1
	if [ $? -ne 0 ];then
	   echo "cmd error"
	fi
	echo "run end !"
	```
单独执行test_dir/set.sh时打印如下：

```
$ ./set.sh
run start
```

即return1语句返回非零，立即退出执行。说明 `set -e` 选项有效。    
将 set.sh 中的 `set -e` 屏蔽掉再执行 run.sh 时:

```
$ ./run.sh
run start
cmd error
run end !
```