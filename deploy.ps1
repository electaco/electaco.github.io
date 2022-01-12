cd hugo
hugo --minify -d ..\public\
cd ..
git commit -am "Public build"
git subtree push --prefix public origin gh-pages
