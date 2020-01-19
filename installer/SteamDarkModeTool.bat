@echo off
title Steam Dark Mode Tool

echo Welcome to the Steam Dark Mode Tool.
echo Made by PhantomGamers and Shiina.
echo Version 3.0 (webkit.css installer)
echo.
echo This tool helps you update and install the Dark Mode for Steam!
echo It also creates a skin for you if you didn't had one installed yet.
echo If you have any questions, Leave a message on our Discord: https://discord.gg/UZvkvkh
echo.
echo.

echo Checking for Steam directory...
for /f "tokens=1,2*" %%E in ('reg query HKEY_CURRENT_USER\Software\Valve\Steam\') do if %%E==SteamPath set SteamPath=%%G

if exist "%SteamPath%" (echo Steam directory found! && echo.) else (echo Steam directory not found. && echo Confirm Steam is installed and try running this file as administrator. && pause && goto:eof)

:start
echo Choose an option:
echo 1. Update all files to current folder.
echo 2. Replace webkit to Steam Skin.
echo 3. Update and replace webkit to steam skin.
echo 4. Restart Steam for changes to take effect.
echo 5. Exit.
echo.
set /p choice= Your choice: 
if %choice%==1 goto:update
if %choice%==2 goto:replace
if %choice%==3 goto:updatereplace
if %choice%==4 goto:restartsteam
if %choice%==5 goto:eof
echo Invalid selection, please try again.
goto:start

:update
echo.
echo Updating Files to current folder... 
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/webkit.css',    'webkit.css')}Catch{Write-Warning $($error[0]);pause}"
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/installer/ToolUpdater.bat',   'ToolUpdater.bat')}Catch{Write-Warning $($error[0]);pause}"
echo Files updated!
echo.
goto:start

:replace
echo.
if not exist webkit.css (echo webkit.css not found, make sure it's in the same directory as this installer. && echo. && goto:start)

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

echo Moving Steam Dark Mode skin to Skin directory...
if [%SteamSkin%]==[] (
    reg add HKEY_CURRENT_USER\Software\Valve\Steam /v SkinV4 /t REG_SZ /d "SteamDarkMode" /f >nul
    mkdir "%SteamPath%/skins/SteamDarkMode/resource" >nul
    copy /Y webkit.css "%WebkitPath%" >nul
)
if not [%SteamSkin%]==[] copy /Y webkit.css "%WebkitPath%" >nul
echo.
goto:start

:updatereplace
echo.
echo Updating Files to current folder... 
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/webkit.css',    'webkit.css')}Catch{Write-Warning $($error[0]);pause}"
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/installer/ToolUpdater.bat',   'ToolUpdater.bat')}Catch{Write-Warning $($error[0]);pause}"
echo Files updated!
echo.

echo Now checking for Steam directory and current skin...
for /f "tokens=1,2*" %%E in ('reg query HKEY_CURRENT_USER\Software\Valve\Steam\') do (
    if %%E==SteamPath set SteamPath=%%G
    if %%E==SkinV4 set SteamSkin=%%G
)

if exist "%SteamPath%" (echo Steam directory found. && echo.) else (echo Steam directory not found. && echo Confirm Steam is installed and try running this file as administrator. && pause && goto:eof)

if [%SteamSkin%]==[] echo No Steam Skin found... && set WebKitPath=%SteamPath%/skins/SteamDarkMode/resource/webkit.css
if not [%SteamSkin%]==[] set WebkitPath=%SteamPath%/skins/%SteamSkin%/resource/webkit.css

echo Checking for write access to Steam directory...

mkdir "%SteamPath%/tmp"
if exist "%SteamPath%/tmp" (rmdir "%SteamPath%/tmp" && echo Write access granted! && echo.) else (echo Write access denied, try running this file as administrator. && pause && goto:eof)

echo Downloading Steam Dark Mode skin to Skin directory...
if [%SteamSkin%]==[] (
    reg add HKEY_CURRENT_USER\Software\Valve\Steam /v SkinV4 /t REG_SZ /d "SteamDarkMode" /f >nul
    mkdir "%SteamPath%/skins/SteamDarkMode/resource" >nul
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/webkit.css', '%WebkitPath%')}Catch{Write-Warning $($error[0]);pause}"
)
if not [%SteamSkin%]==[] powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/webkit.css', '%WebkitPath%')}Catch{Write-Warning $($error[0]);pause}"
echo.
goto:start

:restartsteam
echo.
echo Restarting Steam...
TASKLIST | FIND /I "steam" >nul 2>&1
IF ERRORLEVEL 0 ( start /b /w " " "%SteamPath%/Steam.exe" -shutdown )
goto:LOOP

:startsteam
echo.
start /b " " "%SteamPath%/Steam.exe"
goto:pause

:LOOP
TASKLIST | FIND /I "steam" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO startsteam
) ELSE (
  TIMEOUT /T 3 >nul 2>&1
  GOTO LOOP
)

:pause
Pause&Exit
