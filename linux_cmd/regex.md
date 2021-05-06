## Linux正则表达式

正则表达式是对字符串操作的一种逻辑公式，就是用事先定义好的一些特定字符、及这些特定字符的组合，组成一个“规则字符串”，这个“规则字符串”用来表达对字符串的一种过滤逻辑。

### 正则表达式特定字符

#### 匹配操作符

| 操作符                 | 作用                                         |
| ---------------------- | :------------------------------------------- |
| \                      | 转义字符                                     |
| .                      | 匹配任意单个字符                             |
| [1249a], [\^12], [a-k] | 字符序列单字符占位                           |
| ^                      | 行首                                         |
| $                      | 行尾                                         |
| \\<，\\>               | 单词首尾边界，例如\\<hello\\>表示hello单词｜ |
| ｜                     | 连接操作符                                   |
| (,)                    | 选择操作符                                   |
| \\n                    | 反向引用                                     |

#### 重复操作符

| 操作符 | 作用        |
| ------ | ----------- |
| ?      | 匹配0到1次  |
| *      | 匹配0到多次 |
| +      | 匹配1到多次 |
| {n}    | 匹配n次     |
| {n,}   | 匹配n到多次 |
| {n,m}  | 匹配n到m次  |

### 正则表达式练习

Linux中通过`grep`命令使用正则表达式来匹配信息，`grep`命令会将文本中符合正则表达式的行打印出来。

```txt
# 以下是练习文本，此文本的文件名是 regularizationTest
hello msb
hello angelababy
hello dilireba
iiii250 wyf
hello zhangxinyi
11 hel mhellosbjy lo
h2341123i bj
iiii521 fanbingbing
111 hello 222
wo ai bj tam
hiahelloahiahello
```

1. 查找出包含hello的行

   `grep "hello" regularizationTest`

2. 包含hello这个单词的行

   `grep -E "\<hello\> regularizationTest"`

3. 查找包好了2或者5的行

   `grep -E "2|5" regularizationTest`

   或`grep [25] regularizationTest`

4. 查找包含3位数的行，注：{}是扩展正则表达式的字符，需要使用\转义，或使用`grep -E`

   `grep -E [0-9]{3} regularizationTest`

5. 查找出包含整百数（三位数，例如123，不能是0123）的行

   分析：整百数是三位数，第一位数前面的字符不能是数字，第三位数后面的字符不能是数字。

   第一位数字满足：`[^0-9][1-9]|^[1-9]`

   第二位数字满足：`[0-9]`

   第三位数字满足：`[0-9]$|[0-9][^0-9]`

   于是，正则表达式就是：

   `grep -E ([^0-9][1-9]|^[1-9])[0-9]([0-9]$|[0-9][^0-9]) regularizationTest`

6. 查找出hello为单词词首的行（例如，hello，hellowjw都是符合要求的）

   `grep -E "\<hello" regularizationTest`

7. 查找出出现2-3次l（即，ll或lll）的行

   `grep -E "l{2,3}" regularizationTest`

8. 查找出hi hello hi hello的行，（例如，hi hello hi hello，hi**hello333hi@@hello）

   `grep -E "hi.*hello.*hi.*hello" regularizationTest`

   或者

   `grep -E "(hi.*)(hello.*).*\1.*\2" regularizationTest`