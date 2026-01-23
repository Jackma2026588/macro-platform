@echo off
cd /d "%~dp0"
git add test.html test2.html
git commit -m "Add detailed diagnostic tests"
git push origin main
pause
