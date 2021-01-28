# 用户和群组

## 用户

```
useradd -c "Name Surname " -g admin -d /home/user1 -s /bin/bash user1 #创建一个属于 "admin" 用户组的用户 
useradd user1   #创建一个新用户 

usermod -c "User FTP" -g system -d /ftp/user1 -s /bin/nologin user1    #修改用户属性 
usermod -aG docker $USER   #将当前用户加入到 docker 群组

userdel -r user1    #删除一个用户 ( '-r' 排除主目录) 
find / -name "*user1*" |xargs rm -rf   #删除 user1 后再删除其对应的信息
```

## 群组

```
groupadd group_name  #创建一个新用户组 
groupdel group_name  #删除一个用户组 
groupmod -n new_group_name old_group_name  #重命名一个用户组 
```

## 密码
```
passwd   #修改口令 
passwd user1   #修改一个用户的口令 (只允许root执行) 
chage -E 2005-12-31 user1   #设置用户口令的失效期限 
pwck 检查 '/etc/passwd' 的文件格式和语法修正以及存在的用户 
grpck 检查 '/etc/passwd' 的文件格式和语法修正以及存在的群组 
newgrp group_name   #登陆进一个新的群组以改变新创建文件的预设群组 
```

## 示例

1. 添加一个账户 yao 同时赋予 `sudo` 权限， 再加入 docker 群组
```
useradd -d /home/yao -m yao
echo "yao@cros"| passwd --stdin yao 
sed -i "/^root/a\yao ALL = (ALL:ALL) NOPASSWD:ALL" /etc/sudoers
usermod -aG docker "yao"
```