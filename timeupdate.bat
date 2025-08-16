@echo off
echo Updating system time from internet...
net stop w32time
w32tm /config /manualpeerlist:"pool.ntp.org time.google.com time.nist.gov" /syncfromflags:manual /reliable:YES /update
net start w32time
w32tm /resync /force
if %ERRORLEVEL% EQU 0 (
    echo Time synchronization successful.
) else (
    echo Time synchronization failed. Check internet connection or try different servers.
)
exit
