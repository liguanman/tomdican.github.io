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
  git remote set-url origin https://user@github.com/user/scripts.git

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

8. checkout remote tag
     git tag -l  (show tags)
     git checkout tags/<tag_name>
     git checkout tags/<tag_name> -b <branch_name>  
     (Even better, checkout and create a branch (otherwise you will be on a branch named after the revision number of tag))

9. git log -3           view commit log in 3 line

10. git rebase master            make current branch move new branch based on master
11. list files in a commit    
  git show --stat --oneline  9bb16939e87ef7d4b1c251ec2e7257d411e51621   

12. git delete file from branch
git checkout -b mybranch
rm myfile.txt
git commit -am "delete myfile.txt"

13. add  subdir  including .git in subdir   20170203 17:11
rm -rf subdir/.git
git rm --cached subdir/* -r
git add subdir/*


## gitlab

Git global setup
git config --global user.name "Administrator"
git config --global user.email "register@xxxx.com"

Create a new repository
git clone http://182.92.xx.xx:9090/software/pro.git
cd professi
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master  (first git pull origin master)
Existing folder or Git repository
cd existing_folder
git init
git remote add origin http://182.92.xx.xx:9090/software/profe.git
git add .
git commit
git push -u origin master
     

