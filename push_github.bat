@echo off
title Push Project to GitHub
color 0A

cd /d "%~dp0"

echo.
echo ============================================
echo        GitHub Push Script
echo ============================================
echo.

:: Check if Git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo Git is not installed or not in PATH.
    pause
    exit /b
)

:: Check if this is a Git repository
if not exist ".git" (
    echo This folder is not a Git repository.
    pause
    exit /b
)

echo Current Status:
git status

echo.
set /p msg=Enter commit message: 

if "%msg%"=="" set msg=Update project

echo.
echo Adding all files...
git add .

echo.
echo Creating commit...
git commit -m "%msg%"

echo.
echo Pushing to GitHub...
git push

echo.
echo ============================================
echo Push completed.
echo ============================================
pause