@echo off
echo Set the name and ip address of your printer
set /p name="Name: "
set /p ipaddress="IP Address: "
set portname=IP_%ipaddress%

@ping -n 2 -w 100 %ipaddress%
if %ERRORLEVEL%==0 goto goodip
if %ERRORLEVEL%==1 goto badip

 :badip
 echo %ipaddress% IP address not detected
 goto end

 :goodip
 cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\Prnport.vbs" -a -r %portname% -h %ipaddress% -o raw -n 9100
 cscript "C:\Windows\System32\Printing_Admin_Scripts\en-US\prnmngr.vbs" -a -p %name% -m "Generic / Text Only" -r %portname%
 echo Printer %name% added
 goto end

 :end
pause
