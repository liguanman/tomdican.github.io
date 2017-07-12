hexo clean
hexo generate

## submit to zhanzhang.baidu.com
hexo deploy

cd .deploy/tomdican.github.io
git checkout master
git pull
cp -R ../../public/* .
git add -A
git commit -am "master update"
git push -u origin master 

git checkout source
cp -R ../../source/* .
git add -A
git commit -am "source update"
git push -u origin source 
git checkout master
cd ../..

## dropbox upload 
/e/github-pages/hexo/blog/Dropbox-Uploader/dropbox_uploader.sh upload ../ban-blog/* /blog/ban-blog/
