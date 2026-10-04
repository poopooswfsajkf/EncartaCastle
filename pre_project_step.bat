@echo off

if not exist "%~dp0datafiles\Banks" (
    md "%~dp0datafiles\Banks"
)

copy "%~dp0FMOD\Build\Desktop\*" "%~dp0datafiles\Banks\"

exit /b 0