查找日志的技巧

## 关键字搜索日志
1. 使用 less 命令 `less catalina.out`
  ```
    ctrl+c ,进入交互模式
    ？ , 要搜索的字符
    键盘上下键  ， 上下翻
    空格， 下一页
    字母 f , 下一页
    b, 上一页
    字母Q , 退出
    n（小写字母n）, 上一个关键字位置
    N(大写字母N) , 下一个关键词位置
  ```

## 查找某个时间段的日志
比如查询 2018-08-15 10:37:32到2018-08-15 10:38:01这是时间段的日志

命令： `sed -n '/starttime/,/endtaime/p' catalina.out`
```
sed  -n  '/2018-08-15 10:37:32/,/2018-08-15 10:38:01/p'  catalina.out
```

> 注意：这里的starttime和endtime都必须是日志文件中存在的

如何判定他们存在呢?
```
grep '2018-08-15 10:37:32' catalina.out
```

## 查看指定行的内容

##### head
```
head -n 3 testfile  #从头数，数三行
head -n +3 testfile  #从头数,数三行，同上
head -n -3 testfile   #从头数,数到尾部三行，-k的意义是除了最后k行的所有行
```


##### tail

```
tail -n 3  testfile  #从尾数三行
tail -n -3 testfile  #从尾数三行
tail -n +3 testfile  #输出从k行开始所有行
```


## 搜索文件中的某个关键字
方法1： `cat 路径/文件名 | grep 关键词`

```
cat  test.log | grep "http"　　# 返回test.log中包含http的所有行
```

方法2： `grep -i 关键词 路径/文件名` 

```
grep -i "http" test.log　　# 返回test.log中包含http的所有行
```
