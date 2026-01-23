@echo off
chcp 437 >nul
cd /d "%~dp0"
git add -A
git commit -m "Restore complete version with all data and tables"
git push origin main
pause
