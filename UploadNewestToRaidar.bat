@echo off

:: Set window title, launch directory
title Upload newest logs to Raidar
set "launchdir=%~dp0"
setlocal enabledelayedexpansion

:: Download newest CA Certs
curl -ks -o curl-ca-bundle.crt --time-cond curl-ca-bundle.crt https://curl.haxx.se/ca/cacert.pem

:: Import settings from settings.txt
for /f "delims== tokens=1,2" %%G in (settings.txt) do set %%G=%%H

:: Boss list
set list="Vale Guardian" "Gorseval the Multifarious" "Sabetha the Saboteur" "Slothasor" "Matthias Gabrel" "Keep Construct" "Xera" "Cairn the Indomitable" "Mursaat Overseer" "Samarog" "Deimos"

:: Iterate through bosses by selecting newest log in each folder
(for %%b in (%list%) do ( 
	pushd "%launchdir%%%b"
	for /f "tokens=*" %%a in ('dir /b /od') do set newest=%%a
	echo.
	echo Now uploading %%~b log to GW2 Raidar.
	curl -F "username=%username%" -F "password=%password%" -F "file=@%launchdir%%%~b\!newest!" -o progress https://www.gw2raidar.com/api/upload.json --progress-bar
	echo.
	popd
))

echo.
echo Newest logs for each boss have been uploaded to GW2 Raidar. Now exiting.
timeout /T 1 > nul
exit