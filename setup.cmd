@echo off
SETLOCAL

set PYTHON_ENV_DIR=%~dp0\.venv

REM Create a Python virtual environment if it doesn't exist
if not exist "%PYTHON_ENV_DIR%" (
    echo Creating Python virtual environment...
    python -m venv %PYTHON_ENV_DIR%

    IF ERRORLEVEL 1 (
        echo Failed to create virtual environment
        pause
        exit /b 1
    )
)

REM Activate the virtual environment
echo Activating virtual environment...
CALL %PYTHON_ENV_DIR%\Scripts\activate

IF ERRORLEVEL 1 (
    echo Failed to activate virtual environment
    pause
    exit /b 1
)

REM Upgrade pip
python -m pip install --upgrade pip

REM Install other required packages from requirements.txt
python -m pip install --upgrade --force-reinstall -r %~dp0\requirements.txt

IF ERRORLEVEL 1 (
    echo Failed to install required packages
    pause
    exit /b 1
)

echo Installation complete!

ENDLOCAL