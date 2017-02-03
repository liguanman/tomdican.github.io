cd .deploy/tomdican.github.io
git checkout source 
git pull
cp ./* ../../source/ -R
git checkout master
cd ../..
