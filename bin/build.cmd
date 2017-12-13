@ECHO OFF

SET DIR_SOUNDPACK="soundpack\"
SET DIR_DIST="dist\"
SET ARCHIVE_SOUNDPACK="dark.ts3_soundpack"
SET ZIP_PATH="C:\Program Files\7-Zip\7z.exe"

REM Switch to bin dir
pushd %~dp0

REM ------------------------------------
REM  Cleanup
REM ------------------------------------

echo.
echo Running cleanup tasks
echo.

cd ..
cd %DIR_DIST%
echo  - Removing old soundpack archive...
IF EXIST %ARCHIVE_SOUNDPACK% DEL %ARCHIVE_SOUNDPACK%

REM ------------------------------------
REM  Build Packages
REM ------------------------------------

echo.
echo Building packages
echo.

echo  - Building soundpack archive...
cd ..
cd %DIR_SOUNDPACK%
%ZIP_PATH% a -bd -tzip ..\dist\%ARCHIVE_SOUNDPACK% package.ini sound
echo.

REM Return to previous dir
popd
