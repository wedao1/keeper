# keeper
简单基于crontab的docker脚本守护管理工具

## 使用方法：
#### 启动守护进程
在宿主机crontab添加

```
* * * * *  ./keeper.sh -a "docker_phptest1" -b "docker exec -i docker_php php phptest1.php"
* * * * *  ./keeper.sh -a "docker_phptest2" -b "docker exec -i docker_php php phptest2.php" 
```

#### 展示正在运行的脚本

命令行运行  
`./show.sh` 
输出结果：
```
running scripts

docker_phptest1: pid:64773 running
docker_phptest2: pid:64759 running

Enter name to kill script >
```

#### 重启正在运行的脚本

命令行运行 
`./kill.sh docker_phptest1` 


#### 重启所有正在运行的脚本

命令行运行 
`./killall.sh`



