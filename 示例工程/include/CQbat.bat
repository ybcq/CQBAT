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
::���δ���ݲ�����������
if %1=="" exit
::������һ����������ʱ�ļ�
del /q CQrun.bat
::�����ж���ͷ��β
set "CQstartstr=::[%1]"
set "CQendstr=::[END]"
::����ģʽ(��ʾ���д��ڣ���ɾ����ʱ�ļ�)
if %2==-d (
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
exit
)
::����Ա����ģʽ
if %2==-ad (
call:Admin
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
exit
)
::ʱ��ģʽ(�̶�ʱ���ɾ����ʱ�ļ�)
if %2==-t (
call:CopyFiles
call CQrun.bat %4 %5 %6 %7 %8 %9
timeout /t %3
del /q CQrun.bat
exit
)
::����Աʱ��ģʽ
if %2==-at (
call:Admin
call:CopyFiles
call CQrun.bat %4 %5 %6 %7 %8 %9
timeout /t %3
del /q CQrun.bat
exit
)
::�ȴ�ģʽ(�ȴ�������ɺ�ɾ��)
if %2==-c (
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::����Ա�ȴ�ģʽ
if %2==-ac (
call:Admin
call:CopyFiles
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::ϵͳģʽ
if %2==-s (
call:CopySys
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::����Աϵͳģʽ
if %2==-as (
call:Admin
call:CopySys
call CQrun.bat %3 %4 %5 %6 %7 %8 %9
del /q CQrun.bat
exit
)
::�����ļ�
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
::��������Աģʽ����
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
::��������
:RunHide
echo Set win = CreateObject("Wscript.Shell") >>CQrun.vbs
echo win.run "cmd /c CQrun.bat %3",vbhide >>CQrun.vbs
cscript CQrun.vbs
del /f /q CQrun.vbs
goto:eof
::����ϵͳ
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
