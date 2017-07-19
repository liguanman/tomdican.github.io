---
title: shadowsocks installation
date: 2017-1-24  3:48:47
updated: 2017-1-24 3:48:47
tags: [翻墙,socks,代理]
keywords: 翻墙,socks,代理
categories: Docs
toc: true
---

## shadowsocks使用比较方便：
### 1) 服务端安装：

in centos 6

yum update 
yum install python34-setuptools  or  yum install python-setuptools
easy_install pip
pip install shadowsocks
- 配置：
1. vi /etc/shadowsocks.json
{
"server":"xxx.193.234.xx",
"server_port":443,
"local_address": "127.0.0.1",
"local_port":1080,
"password":"xxxx",
"timeout":600,
"method":"rc4-md5",
"workers":2
}

2. vi .bashrc
alias ssserverstart='ssserver -c /etc/shadowsocks.json -d start'
alias ssserverstop='ssserver -c /etc/shadowsocks.json -d stop'
source .bashrc

3. vi /etc/rc.local     ### startup
ssserver -c /etc/shadowsocks.json -d start

4. ssserverstart


### 2)  客户端
- [安卓](https://github.com/shadowsocks/shadowsocks-android/releases)（通过PC下载）
-  各种环境[客户端都有](https://shadowsocks.org/en/download/clients.html)
注意：在手机端需要将应用的所有权限打开，不能连接时，清空缓存，多试几次。


## [proxifier](http://www.proxifier.com/documentation/v3/http-proxy.htm)

步骤如下：
- 1. 点击profile > proxy server ,可以添加shadowsocks的代理
- 2. 点击 profile > proxification rules ,可以添加规则，必须将默认的规则放在最下面，Action选择socks的代理，其他的规则包括用程序名称映射，也有用iP映射。

本人windows环境配置文件，后缀名为ppx。shadowsocks客户端的远程端口为443。仅作为参考，建议自己配置。
我的配置[文件](https://github.com/tomdican/config/blob/master/proxifier)
