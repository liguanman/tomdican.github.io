cd .deploy/tomdican.github.io
git pull
git checkout source 
cp ./* ../../source/ -R
git checkout master
cd ../..
