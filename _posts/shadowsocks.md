---
title: shadowsocks-install
date: 2017-1-24  3:48:47
updated: 2017-1-24 3:48:47
tags: 翻墙,socks,代理
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

```xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ProxifierProfile version="101" platform="Windows" product_id="0" product_minver="310">
  <Options>
    <Resolve>
      <AutoModeDetection enabled="false" />
      <ViaProxy enabled="true">
        <TryLocalDnsFirst enabled="false" />
      </ViaProxy>
      <ExclusionList>%ComputerName%; localhost; *.local</ExclusionList>
    </Resolve>
    <Encryption mode="disabled" />
    <HttpProxiesSupport enabled="true" />
    <HandleDirectConnections enabled="false" />
    <ConnectionLoopDetection enabled="false" />
    <ProcessServices enabled="false" />
    <ProcessOtherUsers enabled="false" />
  </Options>
  <ProxyList>
    <Proxy id="102" type="SOCKS5">
      <Address>127.0.0.1</Address>
      <Port>1080</Port>
      <Options>48</Options>
    </Proxy>
  </ProxyList>
  <ChainList />
  <RuleList>
    <Rule enabled="true">
      <Name>118ss</Name>
      <Applications>shadowsocks.exe</Applications>
      <Ports>443</Ports>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>New</Name>
      <Targets>127.0.0.1</Targets>
      <Ports>27017</Ports>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>url</Name>
      <Targets>yeah.net;163.com;baidu.com;youku.com;qq.com;tencent.com;taobao.com;jd.com</Targets>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>New</Name>
      <Applications>firefox.exe</Applications>
      <Targets>192.168.*;::1;127.0.0.1</Targets>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>New</Name>
      <Applications>idea64.exe; idea.exe; cloudmusic.exe; java.exe; java.exe; baiduyunguanjia.exe; yodaodict.exe; robomongo.exe; sqlyogent.exe;officeclicktorun.exe; integratedoffice.exe; ospprearm.exe; ; yundetectservice.exe; baidunetdisk.exe;VirtualBox.exe;nw.exe</Applications>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>New</Name>
      <Applications>chrome.exe</Applications>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>New</Name>
      <Applications>qq.exe</Applications>
      <Action type="Direct" />
    </Rule>
    <Rule enabled="true">
      <Name>Default</Name>
      <Action type="Proxy">102</Action>
    </Rule>
  </RuleList>
</ProxifierProfile>
```
