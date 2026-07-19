@echo off
setlocal

echo Uninstalling Gaba...

set "PS1=%TEMP%\gaba-uninstall.ps1"

curl -fsSL "https://raw.githubusercontent.com/DivanshLpu/gaba/main/uninstall.ps1" -o "%PS1%"

if errorlevel 1 (
    echo Failed to download uninstaller.
    pause
    exit /b 1
)

powershell -NoProfile -ExecutionPolicy Bypass -File "%PS1%"

del "%PS1%" >nul 2>&1

pause
