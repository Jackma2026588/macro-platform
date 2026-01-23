@echo off
cd /d "%~dp0"
git add -A
git commit -m "Fix: Improve CDN reliability for China"
git push origin main
echo.
echo Update complete! Please refresh your browser (Ctrl+F5)
pause
