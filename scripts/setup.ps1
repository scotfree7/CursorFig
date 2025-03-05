# Setup script for Windows systems
# Requires PowerShell 7.0 or later

# Error handling
$ErrorActionPreference = "Stop"

# Check if running as administrator
$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
if (-not $isAdmin) {
    Write-Error "Please run this script as Administrator"
    exit 1
}

# Check prerequisites
try {
    node --version | Out-Null
    npm --version | Out-Null
}
catch {
    Write-Error "Node.js and npm are required but not installed. Please install them first."
    exit 1
}

# Create necessary directories
$cursorDir = "$env:USERPROFILE\.cursor"
$vsCodeDir = "$env:USERPROFILE\.vscode"

New-Item -ItemType Directory -Force -Path "$cursorDir\config" | Out-Null
New-Item -ItemType Directory -Force -Path "$vsCodeDir\extensions" | Out-Null

# Copy Windows-specific configurations
Copy-Item -Path "platform\windows\*" -Destination $cursorDir -Recurse -Force

# Copy common configurations
Copy-Item -Path "config\*" -Destination "$cursorDir\config" -Recurse -Force
Copy-Item -Path ".vscode\*" -Destination $vsCodeDir -Recurse -Force

# Set correct permissions
$acl = Get-Acl $cursorDir
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    "$env:USERDOMAIN\$env:USERNAME",
    "FullControl",
    "ContainerInherit,ObjectInherit",
    "None",
    "Allow"
)
$acl.SetAccessRule($rule)
Set-Acl $cursorDir $acl

# Install dependencies
npm install --global typescript @typescript-eslint/parser @typescript-eslint/eslint-plugin

# Check WSL installation
$wslInstalled = $false
try {
    wsl --status | Out-Null
    $wslInstalled = $true
}
catch {
    Write-Warning "WSL is not installed. For best experience, please install WSL2"
}

Write-Host "Configuration setup complete for Windows"
if ($wslInstalled) {
    Write-Host "WSL detected - configurations will work in both Windows and WSL environments"
}
Write-Host "Please restart your IDE for changes to take effect"
