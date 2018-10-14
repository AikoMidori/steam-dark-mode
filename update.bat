@echo off
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aikomidori.github.io/steam-dark-mode/webkit.css', 'webkit.css')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aikomidori.github.io/steam-dark-mode/README.md', 'README.md')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aikomidori.github.io/steam-dark-mode/installer.bat', 'installer.bat')"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://aikomidori.github.io/steam-dark-mode/Changes.txt', 'Changes.txt')"