@echo off
setlocal

echo Installing Gaba...

set "PS1=%TEMP%\gaba-install.ps1"

curl -fsSL "https://raw.githubusercontent.com/DivanshLpu/gaba/main/install.ps1" -o "%PS1%"

if errorlevel 1 (
    echo.
    echo Failed to download installer.
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"

del "%PS1%" >nul 2>&1

pause
