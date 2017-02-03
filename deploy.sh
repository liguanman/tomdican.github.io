hexo clean
hexo generate
cd .deploy/tomdican.github.io
git checkout master
git pull
cp -R ../../public/* .
git add -A
git commit -m "master update"
git push -u origin master 

git checkout source
cp -R ../../source/* .
git add -A
git commit -m "source update"
git push -u origin source 
git checkout master
