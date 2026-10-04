@echo off

set "PROJECT=%~dp0"

if not exist "%PROJECT%datafiles\Banks" (
    md "%PROJECT%datafiles\Banks"
)

xcopy "%PROJECT%Encarta-FMOD\Build\Desktop\*" "%PROJECT%datafiles\Banks\" /E /I /Y

exit /b 0