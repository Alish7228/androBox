@echo off

reg add HKEY_CURRENT_USER\Software\Wine /v DllOverrides /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v dxgi /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d11 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d9 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10_1 /t REG_SZ /d native,builtin /f
reg add HKEY_CURRENT_USER\Software\Wine\DllOverrides /v d3d10core /t REG_SZ /d native,builtin /f
start /unix /data/data/com.termux/files/usr/bin/install_wined3d 2.0 -partial
