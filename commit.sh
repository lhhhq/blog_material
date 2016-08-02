hexo generate -f

echo ">>>>>>What is your commit message to blog-material repo?"
read COMMIT
git add --all
git commit -m "$COMMIT"
echo "commited"
git push
echo "pushed all to blog-material repo"

cd public

git add --all
git commit -m "$COMMIT"
echo "commited"
git push
echo "pushed all to blog repo"

cd ../
