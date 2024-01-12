## 使用说明

#### Fork 本项目  ==>  Actions  ==>  选择项目  ==>  Run Workflow
##### 需要修改编译选项的请直接修改config下对应项目文件或者开启ssh调试功能
###### 没时间弄目前就写了一个lede_x86_64所以暂时没得选

## 文件说明
| 目录                              |         作用                                 |
| --------------------------------- | --------------------------------------------| 
| config                            | 放置.config配置文件                           | 
| customize                         | 放置自定义脚本及文件                               |
| feeds                             | 放置feeds源                                  |
| patches                           | 放置补丁文件                                  |


## SSH调试
#### 开启ssh调试功能
修改.github/workflows/xxx.yml
```
env:
  SSH_DEBUG: 'flase'  #flase修改为true
  SSH_TIME: '30m'     #定义开启ssh后多久时间后继续进行工作流
```

#### 自定义选项
```
1.你fork的 GitHub 仓库。

2.点击 "Settings"： 在仓库页面右上角，点击 "Settings"（设置）。

3.选择 "Secrets"： 在左侧菜单中，选择 "Secrets"。

4.点击 "New repository secret"： 在 "Secrets" 页面，点击右上角的 "New repository secret" 按钮。

5.填写 Secret 信息： 在弹出的对话框中，填写以下信息：

    Name（名称）： 给你的 Secret 一个简洁明了的名称，如 "SSH_PW"。
    Value（值）： 输入 Secret 的具体值，比如密码或 API 密钥。

点击 "Add secret"： 填写完信息后，点击 "Add secret" 按钮保存。
```
```
SSH_PW     # 用于定义ssh访问的root密码,不设置默认123
```

```
FRPC_CONFIG  # 用于定义frpc的配置文件,不设置将自动尝试使用公共frp服务器
```

#### FRPC_CONFIG示例
###### frp.freefrp.net是个公共服务器,所以可能会与他人配置冲突,默认会随机生成端口并尝试连接
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
```
#### ssh连接命令

在工作流的setup ssh for debug步骤中会显示
```
===========frpc启动成功!==========
=========以下是SSH连接命令=========
ssh root@xxx -p xxxx
```
密码为SSH_PW定义的密码,不设置则为123

