@echo off

title Arcane Solutions Permanent Virtualizer (UDUDDUDUDUDUD)
echo Please Wait While Our Virtualizer Begins The Spoofing Process.


echo.

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Run as admin..
    pause
    exit /b
)

cd /d "%~dp0"

echo Spoofing... 

for /f "delims=" %%i in ('call randstr.bat 10') do set "output9=%%i"
for /f "delims=" %%i in ('call randstr.bat 14') do set "output91=%%i"
for /f "delims=" %%i in ('call randstr.bat 10') do set "output92=%%i"

cd /d "%~dp0"


AMIDEWINx64.EXE /IVN "AMI"
AMIDEWINx64.EXE /SM "System manufacturer"
AMIDEWINx64.EXE /SP "System product name"
AMIDEWINx64.EXE /SV "System version"
AMIDEWINx64.EXE /SS %output9%
AMIDEWINx64.EXE /SU AUTO
AMIDEWINx64.EXE /SK "To Be Filled By O.E.M"
AMIDEWINx64.EXE /SF "To Be Filled By O.E.M."
AMIDEWINx64.EXE /BM "ASRock"
AMIDEWINx64.EXE /BP "B560M-C"
AMIDEWINx64.EXE /BV " "
AMIDEWINx64.EXE /BS %output91%
AMIDEWINx64.EXE /BT "Default string"
AMIDEWINx64.EXE /BLC "Default string"
AMIDEWINx64.EXE /CM "Default string"
AMIDEWINx64.EXE /CV "Default string"
AMIDEWINx64.EXE /CS %output92%
AMIDEWINx64.EXE /CA "Default string"
AMIDEWINx64.EXE /CSK "SKU"
AMIDEWINx64.EXE /PSN "To Be Filled By O.E.M."
AMIDEWINx64.EXE /PAT "To Be Filled By O.E.M."
AMIDEWINx64.EXE /PPN "To Be Filled By O.E.M."

echo Spoofed Serials...

)



echo Volumeid Spoofing..

cd ..
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output3=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output31=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output32=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output33=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output34=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output35=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output36=%%i"
for /f "delims=" %%i in ('call randstr.bat 4 /v') do set "output37=%%i"
cd /d "%~dp0"

Volumeid64.exe C: %output3%-%output31% /accepteula
Volumeid64.exe D: %output32%-%output33% /accepteula
Volumeid64.exe E: %output34%-%output35% /accepteula
Volumeid64.exe F: %output36%-%output37% /accepteula

echo Volumeid Spoofed!
echo MAC Spoofing..

cd ..
cd /d "%~dp0"
call MAC.bat

echo MAC Spoofed!
echo Clearing Network...

netsh winsock reset
netsh winsock reset catalog
netsh int ip reset
netsh advfirewall reset
netsh int reset all
netsh int ipv4 reset
netsh int ipv6 reset
ipconfig /release
ipconfig /flushdns
ipconfig /renew
ipconfig /flushdns
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL DISABLE >nul 2>&1
WMIC PATH WIN32_NETWORKADAPTER WHERE PHYSICALADAPTER=TRUE CALL ENABLE >nul 2>&1
arp -d
net stop winmgmt /y
net start winmgmt
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\TPM\WMI\Endorsement" /f
reg delete "HKLM\SYSTEM\ControlSet001\Services\TPM\WMI\Endorsement" /f
powershell -Command "Disable-TPMAutoProvisioning"
powershell -Command "Clear-Tpm"

echo SID Spoofing..

cd ..
cd /d "%~dp0"

SIDCHG64.exe /KEY="76KEP-8V9JO-S23UR-dv" /F /R /OD /RESETALLAPPS

echo Successfully Spoofed! Please Restart Ur PC
pause