cd .deploy/tomdican.github.io
git checkout source 
git pull
cp ./* ../../source/ -R
git checkout master
cd ../..

## dropbox
~/Documents/hexo/dropbox/Dropbox-Uploader/dropbox_uploader.sh download /blog/ban-blog/ ../notes/blog-ban/sources/
