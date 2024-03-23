::[ADMIN]
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
"%TEMP%\Getadmin.vbs"
DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
Exit /b
)
::[END]
::[ADD]
%echo off
cls
set add1=%1
set add2=%2
set /a sum=add1+add2
set msg="结果是%sum%"
mshta vbscript:msgbox(Replace(%msg%,"\n",vbCrLf),6,"计算结果")(window.close)
exit
::[END]
