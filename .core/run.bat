@echo off
setlocal enabledelayedexpansion

set MAIN_CLASS=Main

pushd "%~dp0\.."
set "PARENTDIR=%CD%"
popd

set OUTDIR="%PARENTDIR%\.debug"
set "CONFIG_FILE=..\\config.json"

for /f "tokens=2 delims=:}" %%a in ('findstr /c:"main" "%CONFIG_FILE%"') do (
    set MAIN_CLASS=%%a
)

set MAIN_CLASS=!MAIN_CLASS:~2,-7!

echo Running Java program %MAIN_CLASS%...
echo ============================================

java -cp "%PARENTDIR%\.debug" "%MAIN_CLASS%"

echo ============================================
echo Java program ran successfully...

:end
endlocal
