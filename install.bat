@echo off
echo Installing Gaba...

powershell -ExecutionPolicy Bypass -NoProfile -Command ^
"irm https://raw.githubusercontent.com/DivanshLpu/gaba/main/install.ps1 | iex"

pause
