flutter build web --release || { echo "Flutter build failed!"; exit 1; }
cd build/web || { echo "cd to build/web failed!"; exit 1; }
git add . || { echo "git add failed!"; exit 1; }
git commit -m 'release' || { echo "git commit failed!"; exit 1; }
git push || { echo "git push failed!"; exit 1; }

echo "Release process complete."