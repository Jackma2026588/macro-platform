@echo off
chcp 65001 >nul
echo ======================================
echo   宏澜研究平台 - GitHub Pages 部署
echo ======================================
echo.

git --version >nul 2>&1
if errorlevel 1 (
    echo [错误] 未检测到Git，请先安装Git：
    echo   下载地址: https://git-scm.com/download/win
    pause
    exit /b 1
)

echo [✓] Git 已安装

echo.
echo 步骤1: 配置GitHub信息
echo -------------------------------------
set /p github_username="请输入您的GitHub用户名: "
set /p github_email="请输入您的GitHub邮箱: "

git config user.name "%github_username%"
git config user.email "%github_email%"
echo [✓] Git用户信息已配置

echo.
echo 步骤2: 初始化Git仓库
echo -------------------------------------
if not exist ".git" (
    git init
    git branch -M main
    echo [✓] Git仓库已初始化
) else (
    echo [✓] Git仓库已存在
)

echo.
echo 步骤3: 创建配置文件
echo -------------------------------------
if not exist ".gitignore" (
    echo # 忽略操作系统文件 > .gitignore
    echo Thumbs.db >> .gitignore
    echo .DS_Store >> .gitignore
    echo. >> .gitignore
    echo # 忽略编辑器配置 >> .gitignore
    echo .vscode/ >> .gitignore
    echo. >> .gitignore
    echo # 忽略临时文件 >> .gitignore
    echo *.tmp >> .gitignore
    echo *.log >> .gitignore
    echo [✓] .gitignore 已创建
)

if not exist "README.md" (
    echo # 宏澜研究平台 > README.md
    echo. >> README.md
    echo 基于首席经济学家洪灏的宏观研究方法论构建的宏观研究估值平台。 >> README.md
    echo. >> README.md
    echo ## 访问地址 >> README.md
    echo https://%github_username%.github.io/macro-platform/ >> README.md
    echo [✓] README.md 已创建
)

echo. > .nojekyll
echo [✓] .nojekyll 已创建

echo.
echo 步骤4: 提交代码到Git
echo -------------------------------------
git add .
git commit -m "Initial commit: 宏澜研究平台 v1.0 - 基于洪灏宏观研究方法论"
echo [✓] 代码已提交

echo.
echo 步骤5: 推送到GitHub
echo -------------------------------------
echo 请访问 https://github.com/new 创建仓库，仓库名设为: macro-platform
echo.
set /p repo_url="请粘贴仓库URL (例如: https://github.com/用户名/macro-platform.git): "

git remote add origin "%repo_url%"
git push -u origin main

echo.
echo ======================================
echo   部署完成！
echo ======================================
echo.
echo 下一步操作：
echo   1. 访问 https://github.com/%github_username%/macro-platform/settings/pages
echo   2. Branch选择 "main"
echo   3. 点击 Save
echo   4. 等待1-2分钟后访问：
echo      https://%github_username%.github.io/macro-platform/
echo.
pause
