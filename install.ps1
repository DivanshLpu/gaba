$ErrorActionPreference = "Stop"

$OWNER = "DivanshLpu"
$REPO = "gaba"

Write-Host "Installing Gaba..."

$release = Invoke-RestMethod "https://api.github.com/repos/$OWNER/$REPO/releases"

$asset = $release[0].assets | Where-Object {
    $_.name -like "*windows.zip"
} | Select-Object -First 1

if (-not $asset) {
    Write-Host "No Windows release found."
    exit 1
}

$temp = New-Item -ItemType Directory -Force -Path "$env:TEMP\gaba-install"

$zip = "$($temp.FullName)\gaba.zip"

Write-Host "Downloading $($asset.browser_download_url)..."

Invoke-WebRequest $asset.browser_download_url -OutFile $zip

Expand-Archive $zip -DestinationPath $temp.FullName -Force

$exe = Get-ChildItem $temp.FullName -Recurse -Filter "gaba.exe" | Select-Object -First 1

if (-not $exe) {
    Write-Host "gaba.exe not found."
    exit 1
}

$installDir = "$env:LOCALAPPDATA\Programs\gaba"

New-Item -ItemType Directory -Force -Path $installDir | Out-Null

Copy-Item $exe.FullName "$installDir\gaba.exe" -Force

$current = [Environment]::GetEnvironmentVariable("Path", "User")

if ($current -notlike "*$installDir*") {
    [Environment]::SetEnvironmentVariable(
        "Path",
        "$current;$installDir",
        "User"
    )
}

Write-Host ""
Write-Host "✅ Gaba installed successfully!"
Write-Host "Restart your terminal and run:"
Write-Host ""
Write-Host "gaba"
