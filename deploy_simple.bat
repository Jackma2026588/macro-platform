@echo off
chcp 65001 >nul
echo ========================================
echo    宏观估值平台 - GitHub Pages 部署工具
echo ========================================
echo.

REM 检查Git是否安装
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [错误] 未检测到Git,请先安装Git
    echo   下载地址: https://git-scm.com/download/win
    pause
    exit /b 1
)
echo [OK] Git 已安装

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
echo 步骤2: 配置用户信息
echo ========================================
echo 请输入以下信息(直接按Enter使用默认值):
set /p github_username="GitHub用户名 (例如: yourname): "
set /p github_email="GitHub邮箱 (例如: yourname@gmail.com): "

if not "%github_username%"=="" (
    git config user.name "%github_username%"
)
if not "%github_email%"=="" (
    git config user.email "%github_email%"
)
echo [OK] 用户信息已配置

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
git add .
git commit -m "Initial commit: 宏观估值平台 v1.0 - 基于洪灏宏观研究方法论"
echo [OK] 代码已提交

echo.
echo ========================================
echo 步骤5: 推送到GitHub
echo ========================================
echo.
echo 请先在浏览器中访问: https://github.com/new
echo 创建新仓库,仓库名填写: macro-platform
echo (不要勾选"Add a README file")
echo.
echo 创建完成后,复制仓库的URL(以.git结尾)
echo 例如: https://github.com/yourname/macro-platform.git
echo.
set /p repo_url="请粘贴仓库URL: "

git remote add origin "%repo_url%"
git push -u origin main

echo.
echo ========================================
echo 部署完成!
echo ========================================
echo.
echo 下一步配置GitHub Pages:
echo   1. 访问: https://github.com/%github_username%/macro-platform/settings/pages
echo   2. 在"Branch"下选择 "main"
echo   3. 点击 "Save"
echo   4. 等待1-2分钟
echo   5. 访问: https://%github_username%.github.io/macro-platform/
echo.
pause
