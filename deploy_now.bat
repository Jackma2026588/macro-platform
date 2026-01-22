@echo off
chcp 65001 >nul
title 宏观估值平台 - GitHub部署工具
echo ========================================
echo    宏观估值平台 - GitHub Pages 部署工具
echo ========================================
echo.

REM 切换到脚本所在目录
cd /d "%~dp0"

REM 设置Git用户信息
git config --global user.name "Jackma2026588"
git config --global user.email "mac00276@gmail.com"
echo [OK] Git用户信息已配置

echo.
echo ========================================
echo 步骤1: 初始化Git仓库
echo ========================================
if not exist ".git" (
    git init
    git branch -M main
    echo [OK] Git仓库已初始化
) else (
    echo [OK] Git仓库已存在
)

echo.
echo ========================================
echo 步骤2: 创建配置文件
echo ========================================
echo # 忽略文件 > .gitignore
echo Thumbs.db >> .gitignore
echo .DS_Store >> .gitignore
echo .vscode/ >> .gitignore
echo *.tmp >> .gitignore
echo [OK] .gitignore 已创建

echo. > .nojekyll
echo [OK] .nojekyll 已创建

echo.
echo ========================================
echo 步骤3: 添加并提交文件
echo ========================================
git add .
git commit -m "Initial commit: 宏观估值平台 v1.0 - 基于洪灏宏观研究方法论"
echo [OK] 代码已提交

echo.
echo ========================================
echo 步骤4: 添加远程仓库并推送
echo ========================================
git remote add origin https://github.com/Jackma2026588/macro-platform.git
git push -u origin main

echo.
echo ========================================
echo 部署完成!
echo ========================================
echo.
echo 下一步配置GitHub Pages:
echo   1. 访问: https://github.com/Jackma2026588/macro-platform/settings/pages
echo   2. 在"Branch"下选择 "main"
echo   3. 点击 "Save"
echo   4. 等待1-2分钟
echo   5. 访问: https://Jackma2026588.github.io/macro-platform/
echo.
pause
