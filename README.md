## 文件说明
| 目录                              |         作用                                 |
| --------------------------------- | --------------------------------------------| 
| config                            | 放置.config配置文件                           | 
| customize                         | 放置自定义脚本及文件                               |
| feeds                             | 放置feeds源                                  |
| patches                           | 放置补丁文件                                  |


## SSH调试
#### 开启ssh调试
修改.github/workflows/LEDE_x86_64.yml
```
env:
  SSH_DEBUG: 'flase'  #flase修改为true
  SSH_TIME: '30m'     #定义开启ssh后多久时间后继续进行工作流
```

#### 需要定义两个Secrets
```
SSH_PW     # 定义用于ssh访问的root密码,不设置默认123
```

```
FRPC_CONFIG  # 定义frpc的配置文件,不设置将使用仓库根目录frpc.ini默认配置文件
```

#### FRPC_CONFIG示例
###### frp.freefrp.net是个公共服务器,所以可能会与他人配置冲突,需要略作修改
```
[common]
server_addr = frp.freefrp.net  #备选frp1.freefrp.net;frp2.freefrp.net
server_port = 7000
token = freefrp.net

[ssh2action]     #改成不与他人相同的唯一值,随便写就行
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 22222   #改成不与他人相同的唯一值,端口范围10001 - 50000
custom_domains = yourdomain.com #可选项
```
###### ssh连接命令
```
ssh root@frp.freefrp.net -p 22222  #端口号与配置文件一致,密码为SSH_PW定义的密码
```
