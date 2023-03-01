@echo off

set server=%1
set session=%2
:: set countdown=5

ping -n 1 %server% > nul
if %errorlevel% neq 0 (
    goto :labela
) else (
    goto :labelb
)

:labela
echo [%server%] %session% is offline
echo IP %server% not found or not accessible!
goto :end

:labelb
echo [%server%] %session% is online
set /p confirm="Confirm and connect to your session? (y/n) "
if /i "%confirm%" equ "y" (
    echo Connecting to your session...
    putty.exe -load %session%
    echo Session ended.
) else (
    echo Not connecting to session.
)
goto :end

:: Can also just change end with pause and exit /b 0
:: but always forgets to close the window after so I 
:: added a timer also, but ended up not liking it so much

:end
:: echo Application will automatically close in %countdown%
:: goto :loop
pause
exit /b 0

:loop
echo %countdown%
set /a countdown-=1
timeout /t 1 /nobreak > nul
if %countdown% gtr 0 goto :loop

exit /b 0
