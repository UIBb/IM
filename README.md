#### QQ交流群
QQ交流群：326306049

#### 软件架构

thinkphp5+layui+GatewayWorker

#### 安装教程

a>windows用户需要配置下php环境变量。php环境变量设置参见这里。


b>Linux系统可以使用以下脚本测试本机PHP环境是否满足WorkerMan运行要求。
curl -Ss http://www.workerman.net/check.php | php 上面脚本如果全部显示ok，则代表满足WorkerMan要求。 如果不是全部ok，则参考下面文档安装缺失的扩展即可。 已有PHP环境安装缺失扩展 安装pcntl和posix扩展： centos系统 如果php是通过yum安装的，则命令行运行 yum install php-process即可安装pcntl和posix扩展。 具体教程请移步这里.http://doc.workerman.net/install/install.html。


1.下载源码 
2.下载后把vendor\topthink路面下topthink.rar解压下
3.恢复数据库
4.使用说明
a>windows用户直接运行根目录下“start_for_win.bat”文件。


b>Linux系统进入源码根目录

```
启动

以debug（调试）方式启动

php start.php start

以daemon（守护进程）方式启动

php start.php start -d

停止

php start.php stop

重启

php start.php restart

Linux不会的请移步workerman说明文档。 
```

#### 目录指向
目录指向public 

#### 账户密码
后台： http://127.0.0.1/admin.php 
账号密码 admin 123456 
客户窗口： http://127.0.0.1/chat.php/index/index.html?toid=2 这里的toid 
后台添加客服的ID 客服后台： http://127.0.0.1/kefu.php 
账户密码自己在后台添加。


#### 常见问题
如果数据库问题

![输入图片说明](https://images.gitee.com/uploads/images/2021/0512/140859_01201f8c_902699.png "屏幕截图.png")

css不见了不显示问题：
解压文件static下的CSS


#### 数据库表

![输入图片说明](https://images.gitee.com/uploads/images/2021/0512/140910_a6be85af_902699.png "屏幕截图.png")


#### 运行截图图
![输入图片说明](https://images.gitee.com/uploads/images/2021/0512/140922_42b18191_902699.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/0512/140927_b824b42e_902699.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/0512/140931_dffb49b7_902699.png "屏幕截图.png")


![输入图片说明](https://images.gitee.com/uploads/images/2021/0512/140938_44e5754f_902699.png "屏幕截图.png")

