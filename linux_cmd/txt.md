# 文本处理 
## cat
```
cat file1 file2 ... | command <> file1_in.txt_or_file1_out.txt general syntax for text manipulation using PIPE, STDIN and STDOUT 
cat file1 | command( sed, grep, awk, grep, etc...) > result.txt 合并一个文件的详细说明文本，并将简介写入一个新文件中 
cat file1 | command( sed, grep, awk, grep, etc...) >> result.txt 合并一个文件的详细说明文本，并将简介写入一个已有的文件中 

cat -n file1 标示文件的行数 
cat example.txt | awk 'NR%2==1' 删除example.txt文件中的所有偶数行 
```

## grep   
```
grep -n "hello"  *
* : 表示当前目录所有文件，也可以是某个文件名
-r 是递归查找
-n 是显示行号
-R 查找所有文件包含子目录
-i 忽略大小写

下面是一些有意思的命令行参数：
grep -i pattern files ：不区分大小写地搜索。默认情况区分大小写， 
grep -l pattern files ：只列出匹配的文件名， 
grep -L pattern files ：列出不匹配的文件名， 
grep -w pattern files ：只匹配整个单词，而不是字符串的一部分（如匹配‘magic’，而不是‘magical’）， 
grep -C number pattern files ：匹配的上下文分别显示[number]行， 
grep pattern1 | pattern2 files ：显示匹配 pattern1 或 pattern2 的行， 
grep pattern1 files | grep pattern2 ：显示既匹配 pattern1 又匹配 pattern2 的行。 

还有些用于搜索的特殊符号：
\< 和 \> 分别标注单词的开始与结尾。
例如： 
grep man * 会匹配 ‘Batman’、‘manic’、‘man’等， 
grep '\<man' * 匹配‘manic’和‘man’，但不是‘Batman’， 
grep '\<man\>' 只匹配‘man’，而不是‘Batman’或‘manic’等其他的字符串。 
'^'：指匹配的字符串在行首
 '$'：指匹配的字符串在行尾，  ^root 以root为开头（^）root$,以root结尾（$）
-v：不包括的几行（取反）
grep -n -v ^# /etc/vsftpd/vsftpd.conf  
grep --color=tty dump intstall.log  彩色显示

grep Aug /var/log/messages 在文件 '/var/log/messages'中查找关键词"Aug" 
grep ^Aug /var/log/messages 在文件 '/var/log/messages'中查找以"Aug"开始的词汇 
grep [0-9] /var/log/messages 选择 '/var/log/messages' 文件中所有包含数字的行 
grep Aug -R /var/log/* 在目录 '/var/log' 及随后的目录中搜索字符串"Aug" 

xargs配合grep查找
find -type f -name '*.php'|xargs grep 'GroupRecord'
```

## awk
```
echo a b c | awk '{print $1}' #查看一行第一栏 
echo a b c | awk '{print $1,$3}' #查看一行的第一和第三栏 
    awk -F ':' word #使用自定义的分隔符
```
如文件
```
zhc-123|zhang
hongchangfirst-99|zhang
hongchang-100|zhang
```

## sed
```
sed 's/stringa1/stringa2/g' example.txt 将example.txt文件中的 "string1" 替换成 "string2" 
sed '/^$/d' example.txt 从example.txt文件中删除所有空白行 
sed '/ *#/d; /^$/d' example.txt 从example.txt文件中删除所有注释和空白行 
echo 'esempio' | tr '[:lower:]' '[:upper:]' 合并上下单元格内容 
sed -e '1d' result.txt 从文件example.txt 中排除第一行 
sed -n '/stringa1/p' 查看只包含词汇 "string1"的行 
sed -e 's/ *$//' example.txt 删除每一行最后的空白字符 
sed -e 's/stringa1//g' example.txt 从文档中只删除词汇 "string1" 并保留剩余全部 
sed -n '1,5p;5q' example.txt 查看从第一行到第5行内容 
sed -n '5p;5q' example.txt 查看第5行 
sed -e 's/00*/0/g' example.txt 用单个零替换多个零 

#以'# bic'开头 删除注释
sed -i 's/^#\([ ]*bic\)/\1/' zimu.txt  #\1的就类似于前面的'bic'，'()'里面是一个整体,\1就是复制这个位置的内容,如果有第2个,那么\2就是复制第2个位置的内容

#以'bic'开头 添加注释
sed -i 's/^[ ]*bic/#&/' zimu.txt  # '&'是匹配任意字符（就是啥都行），这条命令是替换以'bic'开头的为 '#bic'

sed -i "/^\(#[ ]\)*external_url/c\external_url \'http://scnu-george.cn\'" /etc/gitlab/gitlab.rb  #将含有以 '#external_url' 或 空格external_url 开头的行替换为 external_url 'http://scnu-george.cn'

sed -i "/^root/a\\${user} ALL = (ALL:ALL) NOPASSWD:ALL" /etc/sudoers  #在以 `root` 开头的行下面插入
```

## sort
```
sort file1 file2 排序两个文件的内容 
sort file1 file2 | uniq 取出两个文件的并集(重复的行只保留一份) 
sort file1 file2 | uniq -u 删除交集，留下其他的行 
sort file1 file2 | uniq -d 取出两个文件的交集(只留下同时存在于两个文件中的文件) 
```

## comm
```
comm -1 file1 file2 比较两个文件的内容只删除 'file1' 所包含的内容 
comm -2 file1 file2 比较两个文件的内容只删除 'file2' 所包含的内容 
comm -3 file1 file2 比较两个文件的内容只删除两个文件共有的部分 
```

## diff
```
diff file1 file2  #比较两个文件显示不同部分
```

## paste
```
paste file1 file2 合并两个文件或两栏的内容 
paste -d '+' file1 file2 合并两个文件或两栏的内容，中间用"+"区分 
```

