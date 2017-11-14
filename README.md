# GW2 Raidar Log Uploader #

This log uploader will automatically upload the newest Arc DPS log of each boss to GW2 Raidar when it is run.

## Requirements ##

This script requires Windows and the use of the "Use NPC name EVTC path" option in Arc DPS.

## Installation ##

Download the current release of this script and extract it to the base folder of your Arc DPS logs folder. By default, this will be:

    C:\Users\USERNAME\Documents\Guild Wars 2\addons\arcdps\arcdps.cbtlogs

If you are updating from a previous version, only copy `UploadNewestToRaidar.bat` and `curl.exe`. Copying `settings.txt` will overwrite your settings file and you will have to re-enter your username and password.

## Usage ##
The first time set up of this script requires you to input your GW2 username and password into `settings.txt`. The fields are currently blank and your username and password should be put after the =. Example:

    username=hittingray
    password=gw2raidar

Simply double click the UploadNewestToRaidar.bat to run the script, and all the newest logs from each boss will be uploaded. 

Please be aware that this tool simply uploads the files to GW2 Raidar and does not track them any further. Analysis of logs may take a long time, and there will be a delay before they are available on the website for viewing.

## Future updates ##

If there is interest in this tool, I have a couple more additions which I would like to add:

- A version which tracks which logs have not been uploaded since the last time the script was run can be made.
- Another version which tracks new logs while it is open and automatically uploads them. 

## Acknowledgements ##

This script requires the use of curl, which is distributed under the curl license, and the appropriate licensing documents can be found in the repository as curl_docs.zip.
