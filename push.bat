@echo off
REM Quick Push Script for SkyRescue (Windows)
REM Run this after creating your GitHub repository

echo.
echo 🚀 SkyRescue - Quick Push to GitHub
echo ====================================
echo.

REM Check if remote exists
git remote get-url origin >nul 2>&1
if %errorlevel% equ 0 (
    echo ✅ Remote 'origin' already configured
    git remote -v
) else (
    echo ⚠️  Remote 'origin' not configured yet
    echo.
    echo Please run:
    echo   git remote add origin https://github.com/YOUR_USERNAME/skyrescue.git
    echo.
    echo Replace YOUR_USERNAME with your GitHub username
    exit /b 1
)

echo.
echo 📦 Pushing to GitHub...
git push -u origin main

echo.
echo ✅ Done! Check your repository at:
echo    https://github.com/YOUR_USERNAME/skyrescue
