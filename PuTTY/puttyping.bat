@echo off

set server=%1
set session=%2

ping -n 1 %server% > nul
if %errorlevel% neq 0 goto :labela
goto :labelb

:labela
echo [%server%] %session% is offline...
echo IP %server% not found!
pause
goto :end

:labelb
echo [%server%] %session% is online...
set /p confirm="Confirm and connect to your session? (y/n) "
if /i "%confirm%" neq "y" goto :decline
putty.exe -load %session%
goto :end

:decline
echo Not connecting to session.
pause
goto :end

:end
exit /b 0

