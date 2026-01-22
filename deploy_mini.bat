@echo off
chcp 437
cd /d "%~dp0"
echo Step 1: Git config
git config --global user.name Jackma2026588
git config --global user.email mac00276@gmail.com
echo Done
echo.
echo Step 2: Init repo
if not exist ".git" git init
git branch -M main
echo Done
echo.
echo Step 3: Create files
echo # > .gitignore
echo Thumbs.db >> .gitignore
echo .DS_Store >> .gitignore
echo .vscode/ >> .gitignore
echo *.tmp >> .gitignore
echo. > .nojekyll
echo Done
echo.
echo Step 4: Commit
git add .
git commit -m "Initial commit"
echo Done
echo.
echo Step 5: Push
git remote remove origin 2>nul
git remote add origin https://github.com/Jackma2026588/macro-platform.git
git push -u origin main
echo.
echo Deployment complete!
echo.
echo Next: Go to https://github.com/Jackma2026588/macro-platform/settings/pages
echo Select branch: main, click Save
echo Visit: https://Jackma2026588.github.io/macro-platform/
pause
