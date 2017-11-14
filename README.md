# GW2 Raidar Log Uploader #

This log uploader will automatically upload the newest Arc DPS log of each boss to GW2 Raidar when it is run.

## Requirements ##

This script requires Windows and the use of the "Use NPC name EVTC path" option in Arc DPS.

## Installation ##

Download the current release of this script and extract it to the base folder of your Arc DPS logs folder. By default, this will be:

    C:\Users\USERNAME\Documents\Guild Wars 2\addons\arcdps\arcdps.cbtlogs

## Usage ##

Simply double click the UploadNewestToRaidar.bat to run the script, and all the newest logs from each boss will be uploaded. 

Please be aware that this tool simply uploads the files to GW2 Raidar and does not track them any further. Analysis of logs may take a long time, and there will be a delay before they are available on the website for viewing.

## Acknowledgements ##

This script requires the use of curl, which is distributed under the curl license, and the appropriate licensing documents can be found in the repository as curl_docs.zip.