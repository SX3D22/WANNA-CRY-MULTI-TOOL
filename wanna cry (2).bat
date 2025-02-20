@echo off
title WANNA CRY MADE BY SX3D
chcp 65001 >nul
cd files
color 4
:start
call :ban
:ban
                                                  
echo ░██╗░░░░░░░██╗░█████╗░███╗░░██╗███╗░░██╗░█████╗░  ░█████╗░██████╗░██╗░░░██╗
echo ░██║░░██╗░░██║██╔══██╗████╗░██║████╗░██║██╔══██╗  ██╔══██╗██╔══██╗╚██╗░██╔╝
echo ░╚██╗████╗██╔╝███████║██╔██╗██║██╔██╗██║███████║  ██║░░╚═╝██████╔╝░╚████╔╝░
echo ░░████╔═████║░██╔══██║██║╚████║██║╚████║██╔══██║  ██║░░██╗██╔══██╗░░╚██╔╝░░
echo ░░╚██╔╝░╚██╔╝░██║░░██║██║░╚███║██║░╚███║██║░░██║  ╚█████╔╝██║░░██║░░░██║░░░
echo ░░░╚═╝░░░╚═╝░░╚═╝░░╚═╝╚═╝░░╚══╝╚═╝░░╚══╝╚═╝░░╚═╝  ░╚════╝░╚═╝░░╚═╝░░░╚═╝░░░



:menu
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [40;32m        ╔═(1) ip look up 2[0m  
echo [40;32m        ║[0m  
echo [40;32m        ╠══(2) ip ping[0m  
echo [40;32m        ║[0m  
echo [40;32m        ╠═══(3) URL LOOK UP[0m  
echo [40;32m        ║[0m  
echo [40;32m        ╚╦═══(4) next [0m  
echo [40;32m         ║[0m  
set /p input=.%BS% [40;32m        ╚══════^>[0m  
if /I %input% EQU 1 goto lookup
if /I %input% EQU 2 goto ping
if /I %input% EQU 3 goto URL
if /I %input% EQU 4 goto men2 
cls
goto start


:lookup
set /p ipAddress=Enter IP address to look up: 
set apiUrl=https://ipinfo.io/%ipAddress%/json

rem Use PowerShell to send request to the API and display the result
powershell -Command "Invoke-RestMethod -Uri '%apiUrl%'"
pause
goto menu

:ping
echo Enter the IP address or hostname to ping:
set /p ipAddress=IP Address or Hostname: 

echo Pinging %ipAddress% 4 times...
ping %ipAddress% -n 4 -w 1000

pause
goto menu

:URL
echo Enter the URL to look up:
set /p url=URL: 

echo Looking up IP address for %url%...
nslookup %url%

pause
goto menu




                                                  
                                                  
                                                  






:men2
for /f %%A in ('"prompt $H &echo on &for %%B in (1) do rem"') do set BS=%%A
echo.
echo.
echo [38;2;255;255;0m        ╔═(1) Trace Mac Address[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠══(2) Trace DNS[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╠═══(3) Port Scan[0m  
echo [38;2;255;255;0m        ║[0m  
echo [38;2;255;255;0m        ╚╦═══(4) DDOS  [0m  
echo [38;2;255;255;0m         ║[0m  
set /p input=.%BS% [38;2;255;255;0m        ╚══════^>[0m  
if /I %input% EQU 1 goto Macaddr
if /I %input% EQU 2 goto tracedns
if /I %input% EQU 3 goto port
if /I %input% EQU 4 goto ddos 
cls
goto start





:Macaddr
cls
echo.
set /p ip=Enter IP Address: 
ping -w 1 %ip% >nul
for /f "tokens=2 delims= " %%a in ('arp -a ^| find "%ip%"') do set macaddr=%%a
for /f "usebackq delims=" %%I in (`powershell "\"%macaddr%\".toUpper()"`) do set "upper=%%~I"
cls
echo.
echo Mac Address: %upper%
echo.
pause
cls
goto men2

:tracedns
cls
echo.
set /p ip=IP Address: 
cls
for /f "tokens=2 delims= " %%a in ('nslookup %ip% ^| find "Name"') do set dns=%%a
echo.
echo Domain Name: %dns%
echo.
pause
goto men2


:ddos
cls
echo.
echo 1) https://freestresser.so/
echo 2) https://hardstresser.com/
echo 3) https://stresser.net/
echo 4) https://str3ssed.co/
echo 5) https://projectdeltastress.com/
echo 6) Back
echo.
set /p ddosinput=
if /I "%ddosinput%" EQU "1" start https://freestresser.so/
if /I "%ddosinput%" EQU "2" start https://hardstresser.com/
if /I "%ddosinput%" EQU "3" start https://stresser.net/
if /I "%ddosinput%" EQU "4" start https://str3ssed.co/
if /I "%ddosinput%" EQU "5" start https://projectdeltastress.com/
if /I "%ddosinput%" EQU "6" goto men3
goto men3

:port
:: Port Scanner Batch Script

set /p ip="Enter the IP address to scan: "
set /p start_port="Enter the starting port: "
set /p end_port="Enter the ending port: "

echo Scanning IP: %ip% from port %start_port% to %end_port%...

:: Loop through the range of ports and check if each one is open
for /L %%p in (%start_port%,1,%end_port%) do (
    powershell -Command "Test-NetConnection -ComputerName %ip% -Port %%p -WarningAction SilentlyContinue"
    if %errorlevel% equ 0 (
        echo Port %%p is OPEN.
    ) else (
        echo Port %%p is CLOSED.
    )
)

echo Scan complete.
pause
goto men2



