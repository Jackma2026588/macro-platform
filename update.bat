@echo off
cd /d "%~dp0"
git add index.html
git commit -m "Fix: Ensure data loads correctly"
git push origin main
echo Done! Refresh your browser.
pause
