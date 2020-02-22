# 内核命令


## trap

trap命令用于指定在接收到信号后将要采取的动作，常见的用途是在脚本程序被中断时完成清理工作。当shell接收到sigspec指定的信号时，arg参数（命令）将会被读取，并被执行。例如：

```
trap "exit 1" HUP INT PIPE QUIT TERM
```
表示当shell收到 HUP INT PIPE QUIT TERM 这几个命令时，当前执行的程序会读取参数“exit 1”，并将它作为命令执行。


##### 参考
1. trap命令 . http://man.linuxde.net/trap