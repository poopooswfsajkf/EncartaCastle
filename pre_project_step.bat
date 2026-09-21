@echo off

:: Copy over the banks to the datafiles folder.
if not exist "%YYprojectDir%\datafiles\Banks" (
    md "%YYprojectDir%\datafiles\Banks"
)

if not exist "%YYprojectDir%\Encarta-FMOD\Build\Desktop" (
    echo ERROR: FMOD Build\Desktop folder does not exist:
    echo "%YYprojectDir%\Encarta-FMOD\Build\Desktop"
    exit /b 1
)

xcopy "%YYprojectDir%\Encarta-FMOD\Build\Desktop\*" "%YYprojectDir%\datafiles\Banks\" /E /I /Y

if errorlevel 1 (
    echo ERROR: Failed to copy FMOD banks.
    exit /b 1
)

echo FMOD banks copied successfully.
exit /b 0