@echo off

setlocal enableextensions
setlocal EnableDelayedExpansion

setlocal

set PATH=%PATH%;F:\

echo Installing...

if NOT EXIST "T:\PhysX_9.10.0513_SystemSoftware.exe"\ (

curl.exe -sL -O --output-dir T:\ https://us.download.nvidia.com/Windows/9.10.0513/PhysX_9.10.0513_SystemSoftware.exe

)

start /W T:\PhysX_9.10.0513_SystemSoftware.exe

endlocal
