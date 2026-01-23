@echo off
chcp 65001 >nul
title Deploy to GitHub
echo ========================================
echo    Deploy Fixed Version to GitHub
echo ========================================
echo.
echo Step 1: Copy working file to index.html
copy /Y index_working.html index.html
echo Done
echo.
echo Step 2: Add files to Git
git add -A
echo.
echo Step 3: Commit
git commit -m "Fix: Complete working version with all data displaying correctly"
echo.
echo Step 4: Push to GitHub
echo Enter your GitHub password when prompted
echo.
git push origin main
echo.
echo ========================================
echo Deployment Complete!
echo ========================================
echo.
echo Next steps:
echo   1. Go to: https://github.com/Jackma2026588/macro-platform/settings/pages
echo   2. Select branch: main
echo   3. Click Save
echo   4. Wait 1-2 minutes
echo   5. Visit: https://Jackma2026588.github.io/macro-platform/
echo.
pause
