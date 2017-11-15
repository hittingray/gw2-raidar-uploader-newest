@echo off

:: Set window title, launch directory
title Upload newest logs to Raidar
set "launchdir=%~dp0"
setlocal enabledelayedexpansion enableextensions
echo.

:: Download newest CA Certs
"%launchdir%curl.exe" -ks -o curl-ca-bundle.crt --time-cond curl-ca-bundle.crt https://curl.haxx.se/ca/cacert.pem

:: Import settings from settings.txt
for /f "delims== tokens=1,2" %%G in (settings.txt) do set %%G=%%H

:: Check username/password not blank
if "%username%." == "." goto blank
if "%password%." == "." goto blank

:: Boss list
set list="Bob" "Vale Guardian" "Gorseval the Multifarious" "Sabetha the Saboteur" "Slothasor" "Matthias Gabrel" "Keep Construct" "Xera" "Cairn the Indomitable" "Mursaat Overseer" "Samarog" "Deimos"

:: Iterate through bosses by selecting newest log in each folder
(for %%b in (%list%) do (
	if exist "%launchdir%%%~b\*.evtc*" (
		pushd "%launchdir%%%b"
		for /f "tokens=*" %%a in ('dir *.evtc* /b /od') do set newest=%%a
		echo.
		echo Now uploading %%~b log to GW2 Raidar.
		:: Call curl and write stdout to launchdir\http
		"%launchdir%curl.exe" -F "username=%username%" -F "password=%password%" -F "file=@%launchdir%%%~b\!newest!" -w "%%{http_code}" -o "%launchdir%progress"  https://www.gw2raidar.com/api/upload.json --progress-bar >> "%launchdir%http"
		:: Import HTTP status from file
		set /p status=<"%launchdir%http"
		:: Set HTTP status to null for next iteration
		copy NUL "%launchdir%http" > NUL
		
		:: Check if upload went ok or not
		if "!status!" == "400" (
			echo. 
			echo Either no file was uploaded or multiple files were uploaded. Please check the files and then try uploading again.
			pause
			)
		if "!status!" == "401" goto 401
		if "!status!" == "500" goto 500
		
		:: Output the status
		type "%launchdir%progress"
		echo.
		popd
	) else echo ERROR: Either the folder %%~b does not exist or it has no EVTC logs. No logs were uploaded from this folder.
))


echo.
echo Newest logs for each boss have been uploaded to GW2 Raidar. Now exiting.
call :cleanup
timeout /T 1 > nul
exit

:cleanup
del "%launchdir%\progress" > NUL
del "%launchdir%\http" > NUL
goto :eof

:blank
echo.
echo Either your username or password was blank. Please check settings.txt and try again.
call :cleanup
pause
exit

:401
echo.
echo Either your username or password was incorrect. Please check settings.txt and try again.
call :cleanup
pause
exit

:500
echo.
echo. Something went wrong on GW2 Raidar's side. Please try again later. If the issue persists, please contact the GW2 Raidar team.
call :cleanup
pause
exit
