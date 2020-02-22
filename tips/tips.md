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