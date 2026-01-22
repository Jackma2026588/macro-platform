@echo off
chcp 437 >nul
title Macro Platform - GitHub Deployment
echo ========================================
echo    Macro Platform - GitHub Pages Deploy
echo ========================================
echo.

cd /d "%~dp0"

if not exist "index.html" (
    echo [ERROR] index.html not found!
    echo Please run this script in macro-platform folder
    pause
    exit /b 1
)
echo [OK] index.html found

echo.
echo Step 1: Configure Git
echo ----------------------
git config --global user.name "Jackma2026588"
git config --global user.email "mac00276@gmail.com"
echo [OK] Git configured

echo.
echo Step 2: Initialize Git repository
echo -----------------------------------
if not exist ".git" (
    git init
    git branch -M main
    echo [OK] Git repository initialized
) else (
    echo [OK] Git repository exists
)

echo.
echo Step 3: Create config files
echo ----------------------------
echo # Ignore files > .gitignore
echo Thumbs.db >> .gitignore
echo .DS_Store >> .gitignore
echo .vscode/ >> .gitignore
echo *.tmp >> .gitignore
echo [OK] .gitignore created

echo. > .nojekyll
echo [OK] .nojekyll created

echo.
echo Step 4: Commit files
echo ---------------------
git add .
git commit -m "Initial commit: Macro Platform v1.0"
echo [OK] Files committed

echo.
echo Step 5: Configure remote repository
echo -------------------------------------
git remote remove origin 2>nul
git remote add origin https://github.com/Jackma2026588/macro-platform.git
echo [OK] Remote repository configured

echo.
echo Step 6: Push to GitHub
echo -----------------------
echo If authentication window appears, enter your GitHub password or token
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push failed!
    echo Possible causes:
    echo   1. Repository does not exist
    echo   2. Authentication failed
    echo   3. Repository conflicts
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Deployment completed!
echo ========================================
echo.
echo Next steps - Configure GitHub Pages:
echo   1. Go to: https://github.com/Jackma2026588/macro-platform/settings/pages
echo   2. Select Branch: main
echo   3. Click Save
echo   4. Wait 1-2 minutes
echo   5. Visit: https://Jackma2026588.github.io/macro-platform/
echo.
pause
