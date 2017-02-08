hexo clean
hexo generate
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
~/Documents/hexo/dropbox/Dropbox-Uploader/dropbox_uploader.sh upload ../notes/blog-ban/sources/* /blog/ban-blog/
