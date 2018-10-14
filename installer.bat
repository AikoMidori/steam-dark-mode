@echo off
title Steam Dark Mode Installer

echo Checking for Steam directory and current skin...
for /f "tokens=1,2*" %%E in ('reg query HKEY_CURRENT_USER\Software\Valve\Steam\') do (
    if %%E==SteamPath set SteamPath=%%G
    if %%E==SkinV4 set SteamSkin=%%G
)

set WebkitPath=%SteamPath%/skins/%SteamSkin%/resource/webkit.css

if exist "%SteamPath%" (echo Steam directory found! && echo.) else (echo Steam directory not found. && echo Confirm Steam is installed and try running this file as administrator. && pause && goto:eof)

echo Checking for write access to Steam directory...

mkdir "%SteamPath%/tmp"
if exist "%SteamPath%/tmp" (rmdir "%SteamPath%/tmp" && echo Success! && echo.) else (echo Write access denied, try running this file as administrator. && pause && goto:eof)

echo Copying Steam Dark Mode skin to Skin directory...
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://github.io/aikomidori/steam-dark-mode/webkit.css', '%WebkitPath%')"

echo Finished.