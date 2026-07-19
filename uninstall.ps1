$installDir = "$env:LOCALAPPDATA\Programs\gaba"

if (Test-Path $installDir) {
    Remove-Item $installDir -Recurse -Force
}

$path = [Environment]::GetEnvironmentVariable("Path", "User")
$path = ($path -split ';' | Where-Object { $_ -ne $installDir }) -join ';'
[Environment]::SetEnvironmentVariable("Path", $path, "User")

Write-Host "✅ Gaba has been uninstalled."
Write-Host "Please restart your terminal."
