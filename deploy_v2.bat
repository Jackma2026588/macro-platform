@echo off
chcp 65001 >nul
title 宏观估值平台 - GitHub部署工具
echo ========================================
echo    宏观估值平台 - GitHub Pages 部署工具
echo ========================================
echo.

REM 切换到脚本所在目录
cd /d "%~dp0"
echo 当前目录: %cd%
echo.

REM 检查index.html是否存在
if not exist "index.html" (
    echo [错误] index.html 文件不存在!
    echo 请确保脚本在 macro-platform 目录下运行
    pause
    exit /b 1
)
echo [OK] index.html 文件存在

REM 设置Git用户信息
echo ========================================
echo 步骤1: 配置Git用户信息
echo ========================================
git config --global user.name "Jackma2026588"
git config --global user.email "mac00276@gmail.com"
echo [OK] Git用户信息已配置

echo.
echo ========================================
echo 步骤2: 初始化Git仓库
echo ========================================
if not exist ".git" (
    echo 正在初始化Git仓库...
    git init
    git branch -M main
    echo [OK] Git仓库已初始化
) else (
    echo [OK] Git仓库已存在，跳过初始化
)

echo.
echo ========================================
echo 步骤3: 创建配置文件
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
echo 步骤4: 添加并提交文件
echo ========================================
echo 正在添加文件...
git add .
echo 正在提交...
git commit -m "Initial commit: 宏观估值平台 v1.0 - 基于洪灏宏观研究方法论"
echo [OK] 文件已提交

echo.
echo ========================================
echo 步骤5: 配置远程仓库
echo ========================================
echo 移除旧的远程仓库配置(如果有)...
git remote remove origin 2>nul

echo 添加远程仓库...
git remote add origin https://github.com/Jackma2026588/macro-platform.git
echo [OK] 远程仓库已配置

echo.
echo ========================================
echo 步骤6: 推送到GitHub
echo ========================================
echo 正在推送到GitHub...
echo 如果弹出认证窗口，请输入GitHub密码或Token
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo [错误] 推送失败!
    echo 可能的原因:
    echo   1. 仓库不存在，请先在GitHub创建
    echo   2. 认证失败，请检查用户名和密码
    echo   3. 仓库已存在且有冲突
    echo.
    echo 解决方法:
    echo   1. 访问 https://github.com/new 创建仓库 macro-platform
    echo   2. 不要勾选"Add a README file"
    echo   3. 重新运行此脚本
    pause
    exit /b 1
)

echo.
echo ========================================
echo  部署完成!
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
