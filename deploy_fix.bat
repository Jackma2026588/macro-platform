@echo off
cd /d "%~dp0"
echo === 部署修复版本到GitHub ===
echo.
echo 1. 添加所有更改...
git add -A
echo.
echo 2. 提交更改...
git commit -m "Fix: Add error handling and improve data loading"
echo.
echo 3. 推送到GitHub...
git push origin main
echo.
echo 4. 完成!
echo.
echo 请按 Ctrl+F5 强制刷新浏览器访问:
echo https://Jackma2026588.github.io/macro-platform/
pause
