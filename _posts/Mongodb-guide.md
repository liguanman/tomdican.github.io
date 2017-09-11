---
title: Mongodb guide
date: 2017-01-20 02:12:11
updated: 2017-01-20 02:26:26
tags: [技术,mongo,指南]
keywords: 技术,mongo,指南
categories: Docs
toc: true
---

## Step 1 – Adding the MongoDB Repository

The mongodb-org package does not exist within the default repositories for CentOS. However, MongoDB maintains a dedicated repository. Let's add it to our server.
With the vi editor, create a .repo file for yum, the package management utility for CentOS:

	sudo vi /etc/yum.repos.d/mongodb-org.repo

Then, visit the Install on Red Hat section of MongoDB’s documentation and add the repository information for the latest stable release to the file:

	/etc/yum.repos.d/mongodb-org.repo
	[mongodb-org-3.2]
	name=MongoDB Repository
	baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
	gpgcheck=1
	enabled=1
	gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc

Save and close the file.
Before we move on, we should verify that the MongoDB repository exists within the yum utility. The repolist command displays a list of enabled repositories:

	yum repolist

Output

	repo id                          repo name
	base/7/x86_64                    CentOS-7 - Base
	extras/7/x86_64                  CentOS-7 - Extras
	mongodb-org-3.2/7/x86_64         MongoDB Repository
	updates/7/x86_64                 CentOS-7 - Updates

With the MongoDB Repository in place, let's proceed with the installation.

## Step 2 – Installing MongoDB
We can install the mongodb-org package from the third-party repository using the yum utility.

	sudo yum install mongodb-org

There are two Is this ok [y/N]: prompts. The first one permits the installation of the MongoDB packages and the second one imports a GPG key. The publisher of MongoDB signs their software and yum uses a key to confirm the integrity of the downloaded packages. At each prompt, type Y and then press the ENTER key.

Next, start the MongoDB service

	service mongod start 

configuration 

	vi /etc/mongo.conf

remote connection
comment this line

	# bindIp: 127.0.0.1
	
add below:

	security:
  	  authorization: enabled
 
 create and login admin database
	$ mongo
	> use admin
	> db.createUser(
	     {
	       user:"admin",
	       pwd:"secret",
	       roles:[{role:"root",db:"admin"}]
	     }
	  )
	> exit

	mongo -u admin -p secret -authenticationDatabase admin


## manage user

MongoDB is a nosql database server. The default installation provides you the access of database using mongo command through command line without authentication. In this tutorial you will learn how to create users in Mongodb server with proper authentications.

### Create Admin User

You can use below commands to create user with admin privileges in your MongoDB server.

```sql
$ mongo

> use admin

> db.createUser(
     {
       user:"myadmin",
       pwd:"secret",
       roles:[{role:"root",db:"admin"}]
     }
  )

> exit
```

Now try to connect with above credentials through command line.
```bash
$ mongo -u myadmin -p  --authenticationDatabase admin
```

### Add User for Database

You can also create database specific users, that user will have access to that database only. You can also specify access level for that user on database. For example we are creating a user account with read write access on mydb database.

```sql
> use mydb

> db.createUser(
    {
      user: "mydbuser",
      pwd: "mydbsecret",
      roles: ["readWrite"]
    }
 ) 

> exit
```

To verify authentication use following command. In result 1 means authentication succeeded.

```sql
> db.auth('mydbuser','mydbsecret')
```

To list all users for a database, use following command.

```sql
> db.getUsers()
```

Drop User for DatabaseYou may also remove user from database using following command.

```sql
> use mydb

> db.dropUser('mydbuser')
```

## use db

1)  查看数据库

- 查看所有数据库与mySQL查看数据库命令一样，MongoDB也是使用show dbs命令查看当前实例中所有的数据库。

```sql
> show dbs;
local         0.328GB
test          (empty)
```

- 查看当前使用数据库要查看当前正在使用的数据库，使用db命令。示例如下：

```sql
> db
test
```


如上所示，进入Mongo shell后，如果未选择（切换）任何数据库，默认工作在test数据库。


2) 新建与切换数据库MongoDB新建与切换数据库使用同一个命令use。当数据库存在时，会将工作数据库切换到对应数据库，数据库不存在时，会新建数据库。语法结构如下：

use DATABASE_NAME

- 新建数据库使用use命令新建数据库：

```sql
> use newDB
switched to db newDB
> db
newDB
```

- 新建的数据库，使用show dbs命令查看不到，要想使用可显示，需要至少插入一个文档：

```sql
> show dbs;
local         0.328GB
test          (empty)
> db.sites.insert({name:'itbilu.com'})
WriteResult({ "nInserted" : 1 })
> show dbs
local         0.328GB
newDB         0.078GB
test          (empty)
```


- 切换工作数据库use命令同样可用于切换工作数据库，示例如下：

```sql
> use test
switched to db test
> db
test
```


3) 删除数据库db表示对当前使用数据库的引用。删除数据库首先使用use命令切换到要删除的数据库，然后使用db.dropDatabase()命令删除数据库。示例如下：

```sql
> use newDB
switched to db newDB
> db.dropDatabase()
{ "dropped" : "newDB", "ok" : 1 }
> show dbs
local         0.328GB
test          (empty)
```

4) 查询数据

find的第一个参数是查询条件，其形式也是一个文档，决定了要返回哪些文档，空的査询文档{}会匹配集合的全部内容。要是不指定査询文档，默认就是{}，如同SQL中"SELECT * FROM TABLENAME"语句。

```sql
// 显示
show collections
//将返回集合中所有文档
db.collection.find()
//或者
db.collection.find({})
//重命名
db.rrecord.renameCollection("record")
```

第一个参数若为键/值对时，查询过程中就意味着执行了条件筛选，就如同我们使用Linq查询数据库一样。下面查询操作将返回user集合中age键值为16的文档集合。

```sql
//mongo db
db.user.find({age:16})
//Linq to sql
dbContext.user.select(p=>p.age==16)
```

　　上面的查询默认执行“==”操作(就如同linq中 p.age==16)，文档中若存在相同键的值和查询文档中键的值相等的话，就会返回该文档。


## import and export mongo collection


	mongoimport --db test --collection bookCategory --file bookCategory.json
	mongoexport --host localhost --port 27017 -u test -p tset --collection bookCategory   --out bookCategory.json


## backup and restore mongodb


	mongodump --host mongodb1.example.net --port 37017 --username user --password "pass" --out /opt/backup/mongodump-2011-10-24
	mongodump --archive=test.20150715.archive --db test
	mongorestore --host mongodb1.example.net --port 37017 --username user --password "pass" /opt/backup/mongodump-2011-10-24
	mongorestore --archive=test.20150715.archive --db test

You cannot use the --archive option with the --out option.detail [description](https://docs.mongodb.com/manual/reference/program/mongorestore/#bin.mongodump)
