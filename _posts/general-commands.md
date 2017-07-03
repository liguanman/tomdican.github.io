---
title: general-tech-tricks
date: 2017-2-23  13:51:25
updated: 2017-07-04 01:43:08
tags: guide,command
categories: Docs
toc: true
---


## centos

1.Diagnosing Network
- test the network speed
``` bash
yum install epel-release
yum install python2-speedtest-cli
```
  or
``` bash
pip install speedtest
```
  show download and upload speed,run `speedtest-cli`

- `mtr` represents an evolution of the `traceroute` command by providing a greater data sample
``` bash
yum install mtr
mtr -rw youku.com
```

## shell

1.go to the specified dir
```bash
. ./cd.sh
```

2. 
[refrence](https://liuxd.github.io/posts/Command.html)

- watch 监控命令输出内容。
eg: watch 'ps -ef|grep php'
- wc 计算输出的行数或字符数等。
eg: cat test.txt|wc -l
- curl 发http请求。
eg: curl "http://baidu.com" -H "Host: baidu.com"
eg: curl -I http://google.com 只获得头信息。
eg: curl "http://google.com" -x 10.10.100.12 指定IP
eg: curl ipinfo.io 获得公网出口IP。
- rsync 文件同步。
eg: rsync -av --delete-before /home/www/release/ -e ssh evans@app10-099:/home/www/release/
eg: rsync -av --delete-before foler1/ folder2/ #注意：后面的斜杠很重要，如果没有则在folder2中建立folder1文件夹。
- dd 转换并复制文件。
- script 记录终端会话的内容。
- tee 从标准输出读取并写入到文件内。
- w 显示当前登录用户的行为。
- zcat 可以察看gz压缩文件的内容。
eg: zcat test.gz
- seq 获得等差数列。
eg: seq 2 20
- renice 修改进程优先级。
eg: renice -n 2 -p 3432。-n，后面是优先级的值；-p，是进程号。
- tree 现实目录结构。
eg: tree -N $path 正确显示中文。
- httpd -S 察看apache使用的配置文件路径
- bc 计算器。
- du 计算每个文件的磁盘用量，目录则取总量。
eg: du -sh ＊ 获得目录下所有文件／文件夹的容量。
- df 显示文件系统的信息。
eg: df -h
- find 文件搜索。
eg: find ./mexec/ -name "*.php" |xargs cat|grep -v ^$|wc -l 统计php文件的代码行数，不包括空行。
eg: find . -type d -name ".svn"|xargs rm -rf 删除".svn"文件夹。
eg: find . -maxdepth 1 -name 'error.log*' -print0|xargs -0 sudo rm 批量删除当前目录的文件。
eg: find /home -size +2000k 找出/home文件夹下大于200M的文件。
eg: find . -newer filename 表示比 filename 要新的文件。
- realpath 获得文件的完整路径。
eg: realpath test.php
- sed 文本替换
eg: sed -e 's/foo/bar/' myfile.txt 将myfile.txt中的foo都改成bar。
- wget 下载
eg: wget -U "Mozilla/4.0 \(compatible; MSIE 7.0; Windows NT 5.1; GTB5\)" -r -p -k -nc -o down.log http://www.nintendo.co.jp/fe/fe_museum/ 整站下载
eg: wget http://members.3322.org/dyndns/getip 获得本地的外网IP。
- nl 带行号的cat
eg: nl -b a text.txt 带行号的显示文件内容。
- last 显示用户登录历史
- whoami 显示当前用户。
- chsh 修改默认shell。
eg: chsh -s /bin/zsh
- grep 正则匹配。
eg: grep -v "ignore" 不包含某个字符串。
- select-editor 修改crontab的文本编辑器
- ntpdate 校正时间。
sudo ntpdate -u time.apple.com 校正苹果电脑的时间。
- scutil 管理Mac系统的配置参数
sudo scutil --set HostName yourname
- iconv 编码转换。
iconv -f GB18030 -t UTF-8 old.txt > new.txt
- netstat 显示网络状态。
netstat -nltp 查看所有占用的端口号。
- awk 字符串处理。
cat test.txt|awk '{print $1","$2}' 打印test.txt的第一列和第二列，用逗号隔开。
awk '{sum += $1};END {print sum}' sum.txt 按列求和。
- cut 文件截取。
echo "liuxd"|cut -c1-3 截取字符串。
- md5 & md5sum 计算文件的md5值。md5 - MacOS，md5sum - Linux
md5 test.txt
- split 切割文件。
split -l 500000 url.csv sp_ 切割url.csv文件，每个文件500000行。前缀是“sp_”
- file 识别文件类型和编码。
file -i test.txt 检查test.txt的编码。
- sshpass 带密码的ssh登录
sshpass -p 123456 ssh root@192.168.11.20
- noti 终端命令提醒器
noti echo 123

- 别名
	- alias dns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say DNS cache flushed'
	- alias ds='find . -name ".DS_Store" -print0 |xargs -0 rm'
	- alias subl="'/Applications/Sublime.app/Contents/SharedSupport/bin/subl'"
	- alias p='ps -ef|grep'

4.check port
netstat -anp | grep 834
lsof -i | grep 888

5.recall the last argument of the pre command,`Alt+.` or `!$`



## vim
1.Search in a folder
```bash
:cd /path/to/your/folder/
:vim "searchme" **/*.php
```

2.Delete the lines

- delete the matched
```bash
:g/pattern/d
```
- delete the not matched
```bash
:v/pattern/d
```
3.[ide install]( https://github.com/liuxd/VimIDE.git)
4.insert the current time with 'F5',detail config of [vimrc file](http://vim.wikia.com/wiki/Insert_current_date_or_time)
```vim(http://vim.wikia.com/wiki/Insert_current_date_or_time)
" <F5> to produce date in normal mode
:nnoremap <F5> "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
" in insert mode
:inoremap <F5> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
```

## docker
[refrence:](https://liuxd.github.io/posts/Docker.html)


## jquery-css

1. different from val(),text(),html();

2. selector
	- first-child()
	- eq(),gt(),lt()

3. button press style（bootstrap）
	- .btn-default:hover,.btn-default:active,.btn-default:focus {
		  background-color: gray;
		  box-shadow: none;
  }

4. input validation（bootstrap）
	- [refrence](https://stackoverflow.com/questions/32933165/validate-input-fields-on-bootstrap-modal-window-button-clicks-using-angular)
	- disable input validation , remove control-lable class
	
5. stack order of the element
		z-index: 1;z-index:-1
		
6. jquery change  css value，$( this ).css( "width", "+=200" )

7. jquery add event to new element
```html
$("#search-info").on("click","button",function () {
    console.log("1");
	var p = $(this).parent();
    var bookReferrerWeiboUrl = p.find("a").attr("href");
});
```
8. url编码，encodeURI(url)
9. get parameter from url
```javascript
// get parameter from url address
function GetQueryString(name) {
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if(r!=null)
		return unescape(r[2]);
	return null;
}
```
10.button  ouline  
11.

## java
1. DOM child tag operator
```java
public static Element getDirectChild(Element parent, String name)
{
    for(Node child = parent.getFirstChild(); child != null; child = child.getNextSibling())
    {
        if(child instanceof Element && name.equals(child.getNodeName())) return (Element) child;
    }
    return null;
}
```

2. class to string
```java
System.out.println(ToStringBuilder.reflectionToString(p));
```

## nginx
1. 禁用缓存方式
	sendfile  off ；（/etc/nginx/nginx.conf)

2. 
