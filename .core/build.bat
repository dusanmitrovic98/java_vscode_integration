@echo off

set MAIN_CLASS=Main.java

pushd "%~dp0\.."
set "PARENTDIR=%CD%"
popd

set "CONFIG_FILE=config.json"
set OUTDIR="%PARENTDIR%\.debug"

if not exist "%CONFIG_FILE%" (
    echo { "main": "%MAIN_CLASS%" } > "%CONFIG_FILE%"
)

if not exist %OUTDIR% (
    mkdir %OUTDIR%
)

javac -d ".debug" "%MAIN_CLASS%"

if %errorlevel% neq 0 (
    echo Compilation failed.
    exit /b %errorlevel%
)

echo Java program built successfully...
exit
