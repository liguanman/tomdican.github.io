---
title: tools-install
date: 2017-3-4  23:56:17
updated: 2017-3-4 23:56:17
tags: tool,install
categories: Docs
toc: true
---

## 去中心下载工具resilio
该软件从官网免费下载，方便翻墙来下载资料。

## 屏幕录制软件bandicam
该软件非常好用，下载地址：链接：http://pan.baidu.com/s/1dEE4eTb 密码：6d3e
解压打开软件后，然后关闭，打开注册机输入任意邮箱地址，软件已经注册成功。

## jdk8 install
-  OS: _centos6_x64_
-  refrence:
	-  http://www.mkyong.com/java/how-to-install-oracle-jdk-8-on-centos/
	-  https://tecadmin.net/install-java-8-on-centos-rhel-and-fedora/
	
-  1. download
```bash
$ wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.tar.gz"
$ tar xzf jdk-8u121-linux-x64.tar.gz
 
 ```
Note: If Above wget command does not work for you watch this [example video](https://www.youtube.com/watch?v=McuF7g14hYw) to download java source archive using terminal.

- 2. config
	- JAVA_HOME Environment Variables,This is good practice to set the JAVA_HOME environment variable.
	- Edit the .bash_profile, and append the export JAVA_HOME at the end of the file, for example :

```bash
vi /root/.bash_profile
```
- edit .bash_profile
```bash
# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export JAVA_HOME=/opt/jdk1.8.0_121/
export JRE_HOME=/opt/jdk1.8.0_121/jre

PATH=$PATH:$HOME/bin:$JAVA_HOME/bin

export PATH
```
- take effect
```bash
$ source /root/.bash_profile
```
- test java
```bash
$ java -version
```

- 3. Multiple JDK installed

If the CentOS has multiple JDK installed, you can use the alternatives command to set the default java
```bash
$ sudo alternatives --config java

There are 2 programs which provide 'java'.

  Selection    Command
-----------------------------------------------
   1           /usr/lib/jvm/jre-1.6.0-openjdk.x86_64/bin/java
*+ 2           /opt/jdk1.8.0_121/jre/bin/java

Enter to keep the current selection[+], or type selection number:
```

## install maven

- OS:centos6_x64
- require:jdk8
- refrence
	- https://tecadmin.net/install-apache-maven-on-centos/

- install steps
- 1. download
```bash
cd /opt
wget http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
tar xzf apache-maven-3.3.9-bin.tar.gz
```

- 2. config
```bash
$ vi /etc/profile.d/maven.sh
```
- add content below to maven.sh file
```bash
export M2_HOME=/opt/ apache-maven-3.3.9
export PATH=${M2_HOME}/bin:${PATH}
```
- take effect
```bash
$ source /etc/profiel.d/maven.sh
```

- 3. test maven
```bash
mvn -version
```

## nginx install
- OS：centos6_x64
- refrence:[https://www.godaddy.com/garage/tech/config/how-to-install-and-configure-nginx-on-centos-7/](https://www.godaddy.com/garage/tech/config/how-to-install-and-configure-nginx-on-centos-7/)

## get dynamical ip
1. login ssh server without permission
2. get public ip ,  curl ipinfo.io
3. write  scripts,github
