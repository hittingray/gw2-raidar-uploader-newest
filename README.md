# GW2 Raidar Log Uploader #

This log uploader will automatically upload the newest Arc DPS log of each boss to GW2 Raidar when it is run.

## Requirements ##

This script requires Windows and the use of the "Use NPC name EVTC path" option in Arc DPS.

## Installation ##

Download the current release of this script and extract it to the base folder of your Arc DPS logs folder. By default, this will be:

    C:\Users\USERNAME\Documents\Guild Wars 2\addons\arcdps\arcdps.cbtlogs

If you are updating from a previous version, only copy `UploadNewestToRaidar.bat` and `curl.exe`. Copying `settings.txt` will overwrite your settings file and you will have to re-enter your username and password.

If you are paranoid about your username/password, you may verify that my included version of curl is the same as documented in the release notes via a checksum, or you may download it again yourself. 

## Usage ##
The first time set up of this script requires you to input your GW2 username and password into `settings.txt`. The fields are currently blank and your username and password should be put after the =. Example:

    username=hittingray
    password=gw2raidar

Simply double click the UploadNewestToRaidar.bat to run the script, and all the newest logs from each boss will be uploaded. 

Please be aware that this tool simply uploads the files to GW2 Raidar and does not track them any further. Analysis of logs may take a long time, and there may be a delay before they are available on the website for viewing.

## Future updates ##

If there is interest in this tool, I have a couple more additions which I would like to add:

- A version which tracks which logs have not been uploaded since the last time the script was run
- Another version which tracks new logs while the script is running and automatically uploads them

At this point in time, I have no intention of writing a hook into the GW2 client. Although it may be slightly more convenient for the end user, a batch file or PowerShell script has numerous advantages:

- It is transparent. The end users can easily verify that I am not stealing their passwords. 
- It is open source. Current hooks into the client are not allowed to share their code due to ArenaNet's policies. This also prevents the users from believing their personal information, including passwords, is bring stolen in a closed source .dll.
- I don't have the time to maintain a hook into the client anyway. Game updates break these hooks regularly and/or crash clients. 
- Saves me compiling binaries and ensuring they run across multiple versions of Windows.

## Acknowledgements ##

This script requires the use of curl, which is distributed under the curl license, and the appropriate licensing documents can be found in the repository as curl_docs.zip.
