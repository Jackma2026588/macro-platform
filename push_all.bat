@echo off
cd /d "%~dp0"
echo === Pushing test files ===
git status
echo.
git add test.html test2.html push_test.bat
echo.
echo After git add:
git status
echo.
git commit -m "Add diagnostic tests for debugging"
echo.
git push origin main
echo.
echo Done! Please refresh test2.html in browser.
pause
