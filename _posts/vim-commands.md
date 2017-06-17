---
title: vim-commands
date: 2017-2-10  13:38:51
updated: 2017-2-10 13:38:51
tags: vim,tech,guide
categories: Docs
toc: true
---

## vim commands 

1. indent 7 lines:  7 > >

2. Recording keys for repeating jobs: q letter recording  q  @ letter



## ~~gvim config~~

~~set chinese encoding
in _vimrc file,add below lines at top~~ 
``` xml
set encoding=utf8
```
	
	
## vim installation and configuration

vim的快捷键功能很强大，插件也非常多，安装vundle后，可以从[该网站](http://vimawesome.com)下载插件；

### vim plugin management: vundle 

#### reference
- for windows path https://github.com/VundleVim/Vundle.vim/wiki/Vundle-for-Windows
- path bug https://github.com/VundleVim/Vundle.vim/issues/753
- vundle readme https://github.com/VundleVim/Vundle.vim

#### install
- env:win 7,vim 8.0
- open vim
- input':version',show all path of vim
- input':scriptnames',show the vim installation path, D:program file\vim\_vimrc
- vim _vimrc
- add  source $VIMRUNTIME/bundle.vim   at first line
- vim bundle.vim   in dir vim\vim80
- add the content below
``` xml  
set nocompatible              
filetype off                  
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
call vundle#begin('$VIM/vimfiles/bundle/Vundle.vim')
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
call vundle#end()            
filetype plugin indent on    
```
- reopen vim
- input':PluginInstall'     " install plugin 
- input':PluginList'        " list plugin
``` xml
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
```

### 设置vim保存文本格式为utf-8
- 在windows系统中，vim保存文本的格式为cp936，不是utf-8，导致其他程序打开文本时乱码，半年前设置没成功，使用其他md客户端不好用，还是喜欢使用vim，这次决心解决这个问题，保存后文本格式的问题。

#### reference
- vim相关编码概念，http://edyfox.codecarver.org/html/vim_fileencodings_detection.html
- 编码设置参考，http://www.jianshu.com/p/2d814a4dacdd
- *最终解决方案，http://blog.csdn.net/david_xtd/article/details/7732650*

#### prepare
- fileencodings是指，vim在打开文本显示之前，从fileencodings的编码列表中依次检测该文本的编码，找到后就按照该编码格式显示
- fileencoding是指，使用vim编辑文本后，在保存时，用fileencoding指定的编码格式保存文本，windows环境默认情况下，编码格式一般为~~ucs-dom~~*cp936*
- vim编码的详细介绍，可以查看参考链接	

#### install
- 首先，用vim打开一个带有中文的文本，默认显示正常
- 输入:scriptnames，找到_vimrc的路径， 我的是D:program file\vim\_vimrc
- 输入:set fileencoding，查看保存文本后的编码，默认为空
- 用vim打开_vimrc文本，然后在文本末尾添加两行命令，如下所示
``` xml
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
```
- 关闭vim后，重新打开带中文的文本，修改保存后的编码格式为utf-8,输入:set fileencoding可验证

### markdown plugin
添加此[插件](http://vimawesome.com/plugin/vim-markdown-enchanted)后，在vim中能实现markdown高亮



