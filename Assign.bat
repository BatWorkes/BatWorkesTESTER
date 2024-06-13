@echo off
setlocal EnableDelayedExpansion

REM Check if user wants to save or read
echo 1. Save Username and Code
echo 2. Read Username and Code
set /p "choice=Enter your choice (1 or 2): "

if "%choice%"=="1" (
    REM Prompt user for username
    set /p "username=Enter your username: "

    REM Generate random 6-digit code
    set "code="
    setlocal EnableDelayedExpansion
    for /l %%i in (1,1,6) do (
        set /a "digit=!random! %% 10"
        set "code=!code!!digit!"
    )

    REM Save username and code to a file
    echo Username: %username% > user_code.txt
    echo Code: %code% >> user_code.txt

    echo Username and code saved to 'user_code.txt'.
) else if "%choice%"=="2" (
    REM Read username and code from file
    for /f "tokens=2*" %%a in ('findstr /c:"Username: " user_code.txt') do (
        set "username=%%b"
    )
    for /f "tokens=2*" %%a in ('findstr /c:"Code: " user_code.txt') do (
        set "code=%%b"
    )

    REM Display username and code
    echo Username: !username!
    echo Code: !code!
) else (
    echo Invalid choice. Please enter 1 or 2.
)

pause;
