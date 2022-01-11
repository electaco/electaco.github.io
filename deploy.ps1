cd hugo
hugo --minify -d ..\public\
cd ..
git subtree push --prefix public origin gh-pages
