---
title: git-guide
date: 2017-01-20 2:12:11
updated: 2017-01-20 2:26:26
tags: 技术,git,指南,guide
categories: Docs
toc: true
---

## git commands

1. add or update file:
  git add *
  git status
  git commit -m "scripts"
  git push -u origin master(contain git pull)

2. modify remote url:(old version git)
  git remote set-url origin 'https://user@github.com/user/scripts.git'

3. clone remote git
  git clone https://github.com/great/scripts.git
     
4. create branch ,merge branch,delete local or remote branch:
  git checkout -b master
  git push -u origin bash
  git checkout master
   git merge bash
   git push -u origin master
   git branch -d bash
   git push origin :bash(delete remote branch)

5. delete files:
  git rm readMe
  git commit -a -m "delete"
  git push -u origin master

6. update local git repo
  git pull origin master (fetch,merge)

7. cache accout
git config --global credential.helper cache
git config --global credential.helper "cache --timeout=3600"
windows：git config --system credential.helper wincred  (store)
git config --system --unset credential.helper  (reset)
20170208 add

8. checkout remote tag
     git tag -l  (show tags)
     git checkout tags/<tag_name>
     git checkout tags/<tag_name> -b <branch_name>  
     (Even better, checkout and create a branch (otherwise you will be on a branch named after the revision number of tag))

9. git log -3           view commit log in 3 line

10. git rebase master            make current branch move new branch based on master
11. list files in a commit    
```bash 
git show --stat --oneline  9bb16939e87ef7d4b1c251ec2e7257d411e51621   
```

12. git delete file from branch
git checkout -b mybranch
rm myfile.txt
git commit -am "delete myfile.txt"

13. add  subdir  including .git in subdir   20170203 17:11
rm -rf subdir/.git
git rm --cached subdir/* -r
git add subdir/*

14. change remote repo  _20170224 9:51_
git reset origin/master
git remote  set-url origin "git repo url"

15.  addd a git repo url in exit project without git repo
```bash
git init
git remote add origin http://182.92.xx.xx:9090/software/profe.git
git add -A
git commit -am "init"
git push  -u origin master
```

16. undo git add
git reset

17. git ignore  a file
add file path in .gitignore
git rm --cache 'file path'

18. create new tag
git tag v1.0
git push origin v1.0   or  git push -u \--tags origin master

## gitlab

Git global setup

```bash
git config --global user.name "Administrator"
git config --global user.email "register@xxxx.com"
```

Create a new repository
```bash
git clone http://182.92.xx.xx:9090/software/pro.git
cd professi
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master  (first git pull origin master)
```
  Existing folder or Git repository
```bash
cd existing_folder
git init
git remote add origin http://182.92.xx.xx:9090/software/profe.git
git add .
git commit
git push -u origin master
```

## install git or upgrade git 

-[**refrence link**](https://www.edureka.co/blog/install-git/)：detail install and configure step with sketch map.
-my centos is version 6 ,git is version 1.7,the version git is some problem,so upgrade git.

### upgrade steps

ready to some tools 
```bash
1. yum groupinstall "Development Tools"
2. yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel
3. yum install wget
```

download git
```bash
4. wget https://github.com/git/git/archive/v2.7.2.tar.gz -O git.tar.gz
```

install and compile git
```bash
5. tar -zxf git.tar.gz
6. cd git-2.7.2
7. make configure
8. ./configure --prefix=/usr/local
9. make install
```

check git  version
```bash
10. git --version
```

git config 
```bash
11. git config --global user.name "greatestfutility"
12. git config --global user.email "futility@yeah.net"
```

git account cache 
```bash
13. git config --global credential.helper cache
```

## problem
```
git clone https://github.com/lity/re.git
```
fatal: Unable to find remote helper for 'https'
the way1：replace https  with git 
or the way2：
$ yum install curl-devel
$ # cd to wherever the source for git is
$ make configure
$ ./configure --prefix=/usr/local
$ make install

