@echo off

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f >NUL 2>&1
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f >NUL 2>&1
Z:\usr\glibc\opt\WinScripts\dxvk\install_dxvk_gplasync.bat 2.2-4
