::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCuDJGmW+0UiKRYUeAGPLFeZN5c93Li1vda8JYnH0DzU/VgeXXxlHWblDcE/oxDQNPK6dUPs6SdRcBGnewsxlX1bpSqMNMj8
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCuDJGmW+0UiKRYUeAGPLFeZN5c93Li1vda8JYnH0DzU/VgeXXxlHWblDcE/oxDQNPK6dUPs6SdqewGXTT42qHoMs3yAVw==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
::如果未传递参数，则不运行
if %1=="" exit
::清理上一个残留的临时文件
del /q CQrun.bat
::用于判断字头字尾
set "CQstartstr=::[%1]"
set "CQendstr=::[END]"
::调试模式(显示所有窗口，不删除临时文件)
if %2==-d (
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
exit
)
::管理员调试模式
if %2==-ad (
call:Admin
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
exit
)
::时间模式(固定时间后删除临时文件)
if %2==-t (
call:CopyFiles
call CQrun.bat %4 %5 %6 %7 %8 %9
timeout /t %3
del /q CQrun.bat
exit
)
::管理员时间模式
if %2==-at (
call:Admin
call:CopyFiles
call CQrun.bat %4 %5 %6 %7 %8 %9
timeout /t %3
del /q CQrun.bat
exit
)
::等待模式(等待运行完成后删除)
if %2==-c (
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::管理员等待模式
if %2==-ac (
call:Admin
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::系统模式
if %2==-s (
call:CopySys
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::管理员系统模式
if %2==-as (
call:Admin
call:CopySys
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::拷贝文件
:CopyFiles
for /f "tokens=*" %%i in (CQbat.dos) do (
        if "%%i"=="%CQstartstr%" (
                set flag=1
                )
        if !flag!==1 echo %%i>>CQrun.bat
        if "%%i"=="%CQendstr%" (
                set flag=0
                )
)
goto:eof
::拷贝管理员模式代码
:Admin
for /f "tokens=*" %%i in (CQSetup.sys) do (
        if "%%i"=="::[ADMIN]" (
                set flag=1
                )
        if !flag!==1 echo %%i>>CQrun.bat
        if "%%i"=="%CQendstr%" (
                set flag=0
                )
)
goto:eof
::隐藏运行
:RunHide
echo Set win = CreateObject("Wscript.Shell") >>CQrun.vbs
echo win.run "cmd /c CQrun.bat %3",vbhide >>CQrun.vbs
cscript CQrun.vbs
del /f /q CQrun.vbs
goto:eof
::拷贝系统
:CopySys
for /f "tokens=*" %%i in (CQSetup.sys) do (
        if "%%i"=="%CQstartstr%" (
                set flag=1
                )
        if !flag!==1 echo %%i>>CQrun.bat
        if "%%i"=="%CQendstr%" (
                set flag=0
                )
)
goto:eof
