@echo off
title Steam Dark Mode Tool

echo Welcome to the Steam Dark Mode Tool Updater.
echo Made by Shiina.
echo Version 2.0
echo.
echo This tool helps you update the SteamDarkModeTool!
echo If you have any questions, Leave a message on our Discord: https://discord.gg/UZvkvkh
echo.
echo.

:start
echo Choose an option:
echo 1. Update Steam Dark Mode Tool.
echo 2. Exit.
echo.
set /p choice= Your choice: 
if %choice%==1 goto:update
if %choice%==5 goto:eof
echo Invalid selection, please try again.
goto:start

:update
echo.
echo Updating Files to current folder... 
    powershell -Command "Try{[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12;(New-Object Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AikoMidori/steam-dark-mode/master/SteamDarkModeTool.bat',    'SteamDarkModeTool.bat')}Catch{Write-Warning $($error[0]);pause}"
echo Tool updated, now closing!
echo.
goto:eof