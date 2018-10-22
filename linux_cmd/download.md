# 下载

## 1. wget下载
1. wget下载单个文件:从网络下载一个文件并保存在当前目录，在下载的过程中会显示进度条，包含（下载完成百分比，已经下载的字节，当前下载速度，剩余下载时间）。
```
wget http://www.minjieren.com/wordpress-3.1-zh_CN.zip
```
2. `wget -O` 下载并以不同的文件名保存
```
wget -O wordpress.zip http://www.minjieren.com/download.aspx?id=1080
```
>wget默认会以最后一个符合"/"的后面的字符来命令，对于动态链接的下载通常文件名会不正确。  
错误：下面的例子会下载一个文件并以名称 `download.aspx?id=1080` 保存
```
wget http://www.minjieren.com/download?id=1
```
即使下载的文件是zip格式，它仍然以 `download.php?id=1080` 命令。
正确：为了解决这个问题，我们可以使用参数-O来指定一个文件名：
```
wget -O wordpress.zip http://www.minjieren.com/download.aspx?id=1080
```
1. `wget –limit -rate` 限速下载
```
wget --limit-rate=300k http://www.minjieren.com/wordpress-3.1-zh_CN.zip
```
>执行wget的时候，它默认会占用全部可能的宽带下载。但是当你准备下载一个大文件，而你还需要下载其它文件时就有必要限速了。

1. `wget -c` 断点续传
```
wget -c http://www.minjieren.com/wordpress-3.1-zh_CN.zip
```
>使用wget -c重新启动下载中断的文件，对于我们下载大文件时突然由于网络等原因中断非常有帮助，我们可以继续接着下载而不是重新下载一个文件。需要继续中断的下载时可以使用-c参数。

1. `wget -b` 后台下载
```
wget -b http://www.minjieren.com/wordpress-3.1-zh_CN.zip
```
>对于下载非常大的文件的时候，我们可以使用参数-b进行后台下载。
```
wget -b http://www.minjieren.com/wordpress-3.1-zh_CN.zip
```
Continuing in background, pid 1840.Output will be written to `wget-log'.
可以使用以下命令来察看下载进度：
```
tail -f wget-log
```

1. 伪装代理名称下载
```
wget --user-agent="Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16" http://www.minjieren.com/wordpress-3.1-zh_CN.zip
```
>有些网站能通过根据判断代理名称不是浏览器而拒绝你的下载请求。不过你可以通过–user-agent参数伪装。

1. `wget –spider` 测试下载链接
```
wget --spider URL
```
>当你打算进行定时下载，你应该在预定时间测试下载链接是否有效。我们可以增加–spider参数进行检查。
```
wget --spider URL
```
如果下载链接正确，将会显示
```
wget --spider URL
Spider mode enabled. Check if remote file exists.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [text/html]
Remote file exists and could contain further links,
but recursion is disabled -- not retrieving.
```
这保证了下载能在预定的时间进行，但当你给错了一个链接，将会显示如下错误
```
wget --spider url
Spider mode enabled. Check if remote file exists.
HTTP request sent, awaiting response... 404 Not Found
Remote file does not exist -- broken link!!!
```
你可以在以下几种情况下使用spider参数：   
(1)定时下载之前进行检查   
(2)间隔检测网站是否可用   
(3)检查网站页面的死链接   

1. wget –tries增加重试次数
```
wget --tries=40 URL
```
>如果网络有问题或下载一个大文件也有可能失败。wget默认重试20次连接下载文件。如果需要，使用–tries增加重试次数。

1. 使用wget -i下载多个文件
```
wget -i filelist.txt
```
>首先，保存一份下载链接文件
cat > filelist.txt
url1
url2
url3
url4
接着使用这个文件和参数-i下载

1. 使用wget –mirror镜像网站
```
wget --mirror -p --convert-links -P ./LOCAL URL
```
>下载整个网站到本地。
–miror:开户镜像下载
-p:下载所有为了html页面显示正常的文件
–convert-links:下载后，转换成本地的链接
-P ./LOCAL：保存所有文件和目录到本地指定目录

1. 使用wget –reject过滤指定格式下载
```
wget --reject=gif url
```
下载一个网站，但你不希望下载图片，可以使用以下命令。

1. 使用 `wget -o` 把下载信息存入日志文件
```
wget -o download.log URL
```
>不希望下载信息直接显示在终端而是在一个日志文件，可以使用

1. 使用 `wget -Q` 限制总下载文件大小
```
wget -Q5m -i filelist.txt
```
>当你想要下载的文件超过5M而退出下载，你可以使用。注意：这个参数对单个文件下载不起作用，只能递归下载时才有效。

1. 使用wget -r -A下载指定格式文件
```
wget -r -A.pdf url
```
>可以在以下情况使用该功能：
下载一个网站的所有图片
下载一个网站的所有视频
下载一个网站的所有PDF文件

1.使用wget FTP下载
```
wget ftp-url   #使用wget匿名ftp下载
wget --ftp-user=USERNAME --ftp-password=PASSWORD url  #使用wget用户名和密码认证的ftp下载
```
>可以使用wget来完成ftp链接的下载。


## 2. curl下载
1. 下载单个文件，默认将输出打印到标准输出中(STDOUT)中
```
curl http://www.centos.org
```
>通过-o/-O选项保存下载的文件到指定的文件中：  
-o：将文件保存为命令行中指定的文件名的文件中    
-O：使用URL中默认的文件名保存文件到本地   

1. 将文件下载到本地并命名为mygettext.html
```
curl -o mygettext.html http://www.gnu.org/software/gettext/manual/gettext.html # 将文件保存到本地并命名为gettext.html
curl -O http://www.gnu.org/software/gettext/manual/gettext.html
```
>使用转向字符">"对输出进行转向输出

1. 同时获取多个文件
```
curl -O URL1 -O URL2
```
>若同时从同一站点下载多个文件时，curl会尝试重用链接(connection)。

1. 通过-L选项进行重定向,默认情况下CURL不会发送HTTP Location headers(重定向).当一个被请求页面移动到另一个站点时，会发送一个HTTP Loaction header作为请求，然后将请求重定向到新的地址上。
例如：访问google.com时，会自动将地址重定向到google.com.hk上。
```
curl http://www.google.com
```
```
<HTML>
<HEAD>
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
    <TITLE>302 Moved</TITLE>
</HEAD>
<BODY>
    <H1>302 Moved</H1>
     The document has moved
   <A HREF="http://www.google.com.hk/url?sa=p&amp;hl=zh-CN&amp;pref=hkredirect&amp;pval=yes&amp;q=http://www.google.com.hk/&amp;ust=1379402837567135amp;usg=AFQjCNF3o7umf3jyJpNDPuF7KTibavE4aA">here</A>.
</BODY>
</HTML>
```
上述输出说明所请求的档案被转移到了http://www.google.com.hk。
这是可以通过使用-L选项进行强制重定向，让curl使用地址重定向，此时会查询google.com.hk站点
```
curl -L http://www.google.com
```
1. 断点续传:通过使用-C选项可对大文件使用断点续传功能，如：当文件在下载完成之前结束该进程
```
curl -O http://www.gnu.org/software/gettext/manual/gettext.html
##############             20.1%
```
通过添加-C选项继续对该文件进行下载，已经下载过的文件不会被重新下载
```
curl -C - -O http://www.gnu.org/software/gettext/manual/gettext.html
###############            21.1%
```
1. 对CURL使用网络限速:通过--limit-rate选项对CURL的最大网络使用进行限制
```
curl --limit-rate 1000B -O http://www.gnu.org/software/gettext/manual/gettext.html  # 下载速度最大不会超过1000B/second
```
1. 下载指定时间内修改过的文件  
当下载一个文件时，可对该文件的最后修改日期进行判断，如果该文件在指定日期内修改过，就进行下载，否则不下载。该功能可通过使用-z选项来实现：
```
# 若yy.html文件在2011/12/21之后有过更新才会进行下载
curl -z 21-Dec-11 http://www.example.com/yy.html
```
1. CURL授权
在访问需要授权的页面时，可通过-u选项提供用户名和密码进行授权
```
curl -u username:password URL
```
>通常的做法是在命令行只输入用户名，之后会提示输入密码，这样可以保证在查看历史记录时不会将密码泄露
```
curl -u username URL
```
1. 从FTP服务器下载文件
CURL同样支持FTP下载,若在url中指定的是某个文件路径而非具体的某个要下载的文件名，CURL则会列出该目录下的所有文件名而并非下载该目录下的所有文件
```
curl -u ftpuser:ftppass -O ftp://ftp_server/public_html/  # 列出public_html下的所有文件夹和文件
```
1. 下载xss.php文件
```
curl -u ftpuser:ftppass -O ftp://ftp_server/public_html/xss.php
```
1. 上传文件到FTP服务器:通过 -T 选项可将指定的本地文件上传到FTP服务器上
```
curl -u ftpuser:ftppass -T myfile.txt ftp://ftp.testserver.com  # 将myfile.txt文件上传到服务器
```
1. 同时上传多个文件
```
curl -u ftpuser:ftppass -T "{file1,file2}" ftp://ftp.testserver.com
```

1. 从标准输入获取内容保存到服务器指定的文件中
```
curl -u ftpuser:ftppass -T - ftp://ftp.testserver.com/myfile_1.txt # 从标准输入获取内容保存到服务器指定的文件中
```

1. 获取更多信息:通过使用 -v 和 -trace获取更多的链接信息
通过字典查询单词
```
curl dict://dict.org/d:bash # 查询bash单词的含义
curl dict://dict.org/show:db  # 列出所有可用词典
curl dict://dict.org/d:bash:foldoc  # 在foldoc词典中查询bash单词的含义
```

1. 为CURL设置代理: -x 选项可以为CURL添加代理功能
```
curl -x proxysever.test.com:3128 http://google.co.in  # 指定代理主机和端口
```

1. 保存与使用网站cookie信息
```
curl -D sugarcookies http://localhost/sugarcrm/index.php  #将网站的cookies信息保存到sugarcookies文件中
curl -b sugarcookies http://localhost/sugarcrm/index.php  #使用上次保存的cookie信息
```

1. 传递请求数据:默认curl使用GET方式请求数据，这种方式下直接通过URL传递数据
可以通过 --data/-d 方式指定使用POST方式传递数据
```
curl -u username https://api.github.com/user?access_token=XXXXXXXXXX  # GET
curl -u username --data "param1=value1&param2=value" https://api.github.com # POST
```

1. 指定一个文件，将该文件中的内容当作数据传递给服务器端
```
curl --data @filename https://github.api.com/authorizations
```
>注：默认情况下，通过POST方式传递过去的数据中若有特殊字符，首先需要将特殊字符转义在传递给服务器端，如value值中包含有空格，则需要先将空格转换成%20，如：
```
curl -d "value%201" http://hostname.com
```
在新版本的CURL中，提供了新的选项 --data-urlencode，通过该选项提供的参数会自动转义特殊字符。
```
curl --data-urlencode "value 1" http://hostname.com
```
除了使用GET和POST协议外，还可以通过 -X 选项指定其它协议，如：
```
curl -I -X DELETE https://api.github.cim
```
上传文件
```
curl --form "fileupload=@filename.txt" http://hostname/resource
```

下载  
```
curl -F "key=value" -F "filename=@file.tar.gz" http://localhost/upload  #使用了-F参数，curl会以multipart/form-data的方式发送POST请求

curl -d "action=del" -d "id=12" http://localhost/test   #使用-d命令，curl会以application/x-www-url-encoded格式上传参数

curl -H "Content-Type: application/json" -X POST -d '{"username":"xyz","password":"xyz"}' http://localhost/api/login #以json格式上传参数，需要使用-H在命令中指定
```