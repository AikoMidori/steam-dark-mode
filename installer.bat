@echo off
title Steam Dark Mode Installer

echo Checking for Steam directory and current skin...
for /f "tokens=1,2*" %%E in ('reg query HKEY_CURRENT_USER\Software\Valve\Steam\') do (
    if %%E==SteamPath set SteamPath=%%G
    if %%E==SkinV4 set SteamSkin=%%G
)

if exist "%SteamPath%" (echo Steam directory found! && echo.) else (echo Steam directory not found. && echo Confirm Steam is installed and try running this file as administrator. && pause && goto:eof)

if [%SteamSkin%]==[] echo No Steam Skin found... && set WebKitPath=%SteamPath%/skins/SteamDarkMode/resource/webkit.css
if not [%SteamSkin%]==[] set WebkitPath=%SteamPath%/skins/%SteamSkin%/resource/webkit.css

echo Checking for write access to Steam directory...

mkdir "%SteamPath%/tmp"
if exist "%SteamPath%/tmp" (rmdir "%SteamPath%/tmp" && echo Success! && echo.) else (echo Write access denied, try running this file as administrator. && pause && goto:eof)

echo Downloading Steam Dark Mode skin to Skin directory...
if [%SteamSkin%]==[] (
    reg add HKEY_CURRENT_USER\Software\Valve\Steam /v SkinV4 /t REG_SZ /d "SteamDarkMode" /f >nul
    mkdir "%SteamPath%/skins/SteamDarkMode/resource" >nul
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/webkit.css', '%WebkitPath%')}Catch{Write-Warning $($error[0]);pause}"
)
if not [%SteamSkin%]==[] powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/webkit.css', '%WebkitPath%')}Catch{Write-Warning $($error[0]);pause}"


echo Finished. Restart Steam to see changes.