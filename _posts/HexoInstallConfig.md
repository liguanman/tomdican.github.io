---
title: Hexo install config
date: 2017-01-18 18:19:46
tags: hexo,install,guide,tech
categories: Docs
toc: true
---
Welcome to [Hexo](https://hexo.io/)! This is your very first post. Check [documentation](https://hexo.io/docs/) for more info. If you get any problems when using Hexo, you can find the answer in [troubleshooting](https://hexo.io/docs/troubleshooting.html) or you can ask me on [GitHub](https://github.com/hexojs/hexo/issues).

## 1 Ready

- 安装[node.js](http://www.runoob.com/nodejs/nodejs-install-setup.html)
- 安装[git](http://git-scm.com/download/)
- markdown客户端：[小书匠](http://soft.xiaoshujiang.com/download.html)

## 2 Install&Configuration

### 2.1 start hexo server

```bashcd d:/hexo   # 新建hexo目录
$ npm install hexo-cli -g # 安装hexo
$ hexo init blog # 初始化hexo的根目录
$ cd blog
$ npm install # 安装hexo的插件包
$ ls
$ hexo g # 将source目录中MD文件，转化到public目录中HTML文件
$ hexo s # 然后使用浏览器输入http://localhost:4000/ 查看  
```

### 2.2 deploy into github
1) 新建github工程，工程名称为 xxx.github.io,我的为 tomdican.github.io;
2) 点击右上角的setting按钮，查看blog在哪个分支生效，我的在master分支有效；
3) 浏览器输入地址 http://xxx.github.io 是否生效。
4) 克隆容器和更新文章，如下所示：
```bash
$ git clone https://github.com/tomdican/tomdican.github.io.git  .deploy/tomdican.github.io
$ vi deploy.sh  # 添加如下脚本，然后保存退出
$ sh deploy.sh #运行脚本，更新github中文章内容
```
deploy.sh内容如下：

```bash
hexo clean
hexo generate #  生成结果到public中
cd .deploy/tomdican.github.io
git checkout master
git pull
cp -R ../../public/* .
git add -A
git commit -am "master update"
git push -u origin master  # 上传到github中

git checkout source   # 提交源文件到github的source分支中
cp -R ../../source/* .
git add -A
git commit -am "source update"
git push -u origin source
git checkout master
```

运行deploy.sh后，github博客中文章更新成功，然后检查是否生效。

- **notice: update from github to local before writing blog or opening markdown tool,to avoid remove remote changes.** 20170203 addition
	beforeWrite.sh source code beblow:
	
```bash
cd .deploy/tomdican.github.io
git checkout source
git pull
cp ./* ../../source/ -R
git checkout master
cd ../..
```

### 2.3 select theme

我喜欢简洁的页面，所以选择的[wixo]( https://github.com/wzpan/hexo-theme-wixo.git)主题，下面以wixo主题为例。
安装步骤：

1) install theme
```bash
$ git clone https://github.com/wzpan/hexo-theme-wixo.git themes/wixo
```

2) install hexo-generator-search
```bash
$ npm install hexo-generator-search --save
```

3) install hexo-tag-bootstrap
```bash
$ npm install hexo-tag-bootstrap --save
```

4) theme configuration
```xml
rss: atom.xml
fancybox: true
favicon: favicon.png
inverse_sort: false
fold: true
google_analytics: true
scratch_name: Others
search:
  path: search.xml
  field: all
```

5) add wixo theme to blog

```bash
cd hexo/blog
vi _config.yml # 修改主题后，双击大写Z保存退出
```
将theme: landscape这行改为theme: wixo,然后保存，修改主题成功

```bash
hexo clean # 清除缓存
hexo s # 开启服务，然后查看生效的主题
```
### 2.4 Quick Start

#### Create a new post ***

``` bash
$ hexo new "My New Post"  # source/_posts目录中生成newPost.md文件
```
也可以不用hexo new命令，直接在source/_posts目录中创建md文件，然后添加如下开头内容：
```markdown
---
title: Hello World
date: 2017-01-18 18:19:46
tags:
categories: Docs
toc: true
---‘
```
其中：
title为博客中文章的标题；
tags为标签，我的博客没有使用标签；
categories为文章的类别，比如这篇文章在Docs类别里面，博客会自动识别然后将文章进行分类，这是关键的地方；
toc为文章中内容的目录结构；
More info: [Writing](https://hexo.io/docs/writing.html)

#### Run server

``` bash
$ hexo server
```

More info: [Server](https://hexo.io/docs/server.html)

#### Generate static files

``` bash
$ hexo generate
```

More info: [Generating](https://hexo.io/docs/generating.html)

#### Deploy to remote sites

``` bash
$ hexo deploy
```

More info: [Deployment](https://hexo.io/docs/deployment.html)



## 3 Blog Configuration（optional）

不进行博客的配置，部署到网上也能使用，影响不大，根据自己需要进行配置。

1) 修改博客标题和域名
打开hexo/blog/_config.yml文件，下面仅仅列出我修改的内容，没列出的内容保持默认就行
```xml
# Site
title: Hexo # 从title: Hexo改为title: 你的标题
url: http://tomdican.github.io  # 更改为你的域名

#search
search:
 path: search.xml
 field: all
```

2) 添加网站统计

google analytics用来收集访问用户的情况，不蒜子用来在页面显示用户访问量。

- google analytics

```bash
cd theme/wixo
vi _config.yml # 改为google_analytics: true,保存退出
vi layout\_partial\post\google_analytics.ejs #粘贴来自google analytics网站的脚本，获取脚本的步骤如下所示
```
首先登录到[google统计网站](https//analytics.google.com),添加个人的域名成功后，进入admin>user management>tracking info>tracking code后，选择website tracking中的脚本内容复制，我脚本内容的如下：
```javascript
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'xxxxxxxxxxxxxxx', 'auto');
  ga('send', 'pageview');
</script>
```
当把博客部署到网上后，就能看到google analytics的统计信息了。

- 访客统计

使用[不蒜子统计](http://busuanzi.ibruce.info/)，简单好用，我仅仅添加了本站访问总量，在wixo\layout\_partial\gooter.ejs文件中修改为如下内容：
```html
<p>
<span id="busuanzi_value_site_pv"></span> hits.
      with help from <a href="http://zespia.tw/hexo/" target="_blank">Hexo</a> and <a href="http://getbootstra
p.com/" target="_blank">Twitter Bootstrap</a>. Theme by <a href="http://github.com/wzpan/hexo-theme-wixo/">Wix
o</a>.
</p>
<script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
```

3) 添加站内搜索

需要安装sitemap插件，引导搜索引擎爬取
```bash
cd hexo/blog
npm install hexo-generator-sitemap --save
npm install hexo-generator-baidu-sitemap --save
vi  _config.yml # 添加sitemap的配置，然后保存退出
```
在_config.yml中添加sitemap配置
```xml
plugins:
- hexo-generator-sitemap

#sitemap
sitemap:
 path: sitemap.xml
baidusitemap:
 path: baidusitemap.xml 
```
重启hexo服务，输入http://localhost:4000/sitemap.xml 检查是否生效，然后更新github博客的部署。还需要在[google search](https://www.google.com/webmasters/tools/home?hl=zh-CN&authuser=0&pli=1)中进行站点添加，步骤如下：

- 确保google analytics已经加入博客中;
- 进入[google search](https://www.google.com/webmasters/tools/home?hl=zh-CN&authuser=0&pli=1)；
- 添加你的域名站点，比如我的，https://tomdican.github.io；
- 依次点击抓取>站点地图，在页面右上角点击添加站点地图；
- 在输入框中输入sitemap.xml即可，会显示网页数量。

登陆到zz.baidu.com,然后进入链接提交页面，选择自动提交选项中的sitemap，添加
第二天就能通过搜索引擎查看到你的网站。

4) 添加rss

- 首先安装rss插件

```bash
cd hexo/blog
npm install hexo-generator-feed  --save
vi _config.yml  # 添加rss内容如下
```
在_config.yml添加如下内容

```xml
#Feed Atom
feed:
 type: atom
 path: atom.xml
 limit: 20
```

- 页面样式配置
我的博客有rss功能，也有github链接，但注释掉了，只需要添加wixo\layout\_partial\footer.ejs文件的注释行就行，用于在页面显示，如下所示：

```html
<p>
      <!-- <a href="<%= config.root %><%= theme.rss %>">rss</a>
      <span class="split"></span>
      <a href="https://github.com/tomdican/tomdican.github.io">github</a>
      <span class="split"></span>
      -->
      <span id="busuanzi_value_site_pv"></span> hits.
      with help from <a href="http://zespia.tw/hexo/" target="_blank">Hexo</a> and <a href="http://getbootstra
p.com/" target="_blank">Twitter Bootstrap</a>.
      Theme by <a href="http://github.com/wzpan/hexo-theme-wixo/">Wixo</a>.

</p>
<script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>
```

修改wixo\source\css\style.css中的内容，如下css代码所示：
添加如下css代码，修饰rss和github的分隔符
```css
footer span.split{
  margin-left: 10px;
  margin-right: 10px;
  border-right: solid #bbb 2px;
}
```

5） 调整文章标题字体大小

将如下css中的2.6em修改为1.6em，用于调整标题字体太大的问题
```css
h1{
  font-size:1.6em;
  line-height:1.2em;
  margin-bottom:0.6667em;
}
```

## dropbox sync(optional)

- download
	- git clone https://github.com/andreafabrizi/Dropbox-Uploader
- config
	- in dropbox dir,run ./dropbox_uploader.sh,it will guide you for configuration to store access token;
	- dropbox command
	
```bash
## dropbox upload
~/Documents/hexo/blog/Dropbox-Uploader/dropbox_uploader.sh upload ../notes/blog-ban/sources/* /blog/ban-blog/

## dropbox download
~/Documents/hexo/blog/Dropbox-Uploader/dropbox_uploader.sh download /blog/ban-blog/ ../notes/blog-ban/sources/

```

- detail infomation from https://github.com/andreafabrizi/Dropbox-Uploader

## refrence

[1] https://github.com/wzpan/hexo-theme-wixo/tree/master
[2] https://jiji262.github.io/2016/04/15/2016-04-15-hexo-github-pages-blog/
[3] http://devlu.me/2016/01/16/Hexo博客优化配置之-为自己博客添加搜索引擎网页收录/


## bug retore

- bug1,search result can not redirect to url.**20170205 22:09**
	- in config.yml,modify to your domain,from tomdican.github.io to tomdican.xyz;
	- commit to the hexo-blog branch of github;
	- update blog;

- bug2,title can not contain & sign,because baidusitemap can not deal it;

- bug3 


