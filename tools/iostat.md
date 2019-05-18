**iostat查看linux硬盘IO性能**

# iostat
```
rrqm/s:   每秒进行 merge 的读操作数目。即 delta(rmerge)/s
wrqm/s:  每秒进行 merge 的写操作数目。即 delta(wmerge)/s
r/s:           每秒完成的读 I/O 设备次数。即 delta(rio)/s
w/s:         每秒完成的写 I/O 设备次数。即 delta(wio)/s
rsec/s:    每秒读扇区数。即 delta(rsect)/s
wsec/s:  每秒写扇区数。即 delta(wsect)/s
rkB/s:     每秒读K字节数。是 rsect/s 的一半，因为每扇区大小为512字节。(需要计算)
wkB/s:    每秒写K字节数。是 wsect/s 的一半。(需要计算)
avgrq-sz: 平均每次设备I/O操作的数据大小 (扇区)。delta(rsect+wsect)/delta(rio+wio)
avgqu-sz:平均I/O队列长度。即 delta(aveq)/s/1000 (因为aveq的单位为毫秒)。
await:    平均每次设备I/O操作的等待时间 (毫秒)。即 delta(ruse+wuse)/delta(rio+wio)
svctm:   平均每次设备I/O操作的服务时间 (毫秒)。即 delta(use)/delta(rio+wio)
%util:      一秒中有百分之多少的时间用于 I/O 操作，或者说一秒中有多少时间 I/O 队列是非空的。即 delta(use)/s/1000 (因为use的单位为毫秒)

如果 %util 接近 100%，说明产生的I/O请求太多，I/O系统已经满负荷，该磁盘
可能存在瓶颈。
idle小于70% IO压力就较大了,一般读取速度有较多的wait.
同时可以结合vmstat 查看查看b参数()和wa参数()
```


```
# iostat -x 1

avg-cpu:  %user   %nice    %sys   %idle
16.24    0.00    4.31   79.44
Device:                rrqm/s wrqm/s   r/s   w/s      rsec/s  wsec/s    rkB/s  wkB/s    avgrq-sz avgqu-sz   await  svctm  %util
/dev/cciss/c0d0     0.00    44.90    1.02 27.55    8.16  579.59     4.08   289.80    20.57    22.35        78.21   5.00  14.29
/dev/cciss/c0d0p1 0.00    44.90     1.02 27.55    8.16  579.59     4.08   289.80    20.57    22.35        78.21   5.00  14.29
/dev/cciss/c0d0p2 0.00   0.00  0.00  0.00    0.00    0.00     0.00     0.00     0.00     0.00    0.00   0.00   0.00
```

```
上面的 iostat 输出表明秒有 28.57 次设备 I/O 操作: 总IO(io)/s = r/s(读) +w/s(写) = 1.02+27.55 = 28.57 (次/秒) 其中写操作占了主体 (w:r = 27:1)。

平均每次设备 I/O 操作只需要 5ms 就可以完成，但每个 I/O 请求却需要等上 78ms，为什么? 因为发出的 I/O 请求太多 (每秒钟约 29 个)，假设这些请求是同时发出的，那么平均等待时间可以这样计算:

平均等待时间 = 单个 I/O 服务时间 * ( 1 + 2 + … + 请求总数-1) / 请求总数

应用到上面的例子: 平均等待时间 = 5ms * (1+2+…+28)/29 = 70ms，和 iostat 给出的78ms 的平均等待时间很接近。这反过来表明 I/O 是同时发起的。

每秒发出的 I/O 请求很多 (约 29 个)，平均队列却不长 (只有 2 个 左右)，这表明这 29 个请求的到来并不均匀，大部分时间 I/O 是空闲的。

一秒中有 14.29% 的时间 I/O 队列中是有请求的，也就是说，85.71% 的时间里 I/O 系统无事可做，所有 29 个 I/O 请求都在142毫秒之内处理掉了。

delta(ruse+wuse)/delta(io)  = await = 78.21 => delta(ruse+wuse)/s =78.21 * delta(io)/s =  78.21*28.57 = 2232.8，表明每秒内的I/O请求总共需要等待2232.8ms。所以平均队列长度应为  2232.8ms/1000ms = 2.23，而 iostat 给出的平均队列长度 (avgqu-sz) 却为 22.35，为什么?! 因为  iostat 中有 bug，avgqu-sz 值应为 2.23，而不是 22.35。
```

# 参考
1. iostat查看linux硬盘IO性能 . https://www.cnblogs.com/tommyli/p/3623284.html