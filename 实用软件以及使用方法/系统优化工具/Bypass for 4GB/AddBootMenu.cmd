@ECHO off

:: This script is come whit "ReadyFor4GB"
:: Function:		Add a new entry to BCD, and set it boot from kernel ntkr128g.exe
:: last modified:	2009.04.21
:: Autohr:		deepxw

:: //////////////////////////////////////////////////////////////

:_Menu
CLS
ECHO This script is come with "ReadyFor4GB".
ECHO Autohr:		deepxw
ECHO Blog:		http://deepxw.blogspot.com (English)
ECHO      		http://deepxw.lingd.net (Chinese)
ECHO.
ECHO   #----------------------------------------------------------------------#
ECHO   #   添加启动项至开机菜单，并设置该启动项从新内核 ntkr128g.exe 启动。   #
ECHO   #   请以右键点本脚本文件，选择以管理员身份运行！！                     #
ECHO   #----------------------------------------------------------------------#
ECHO   #   Add a new entry to BCD, and set it boot from kernel ntkr128g.exe   #
ECHO   #   Please right click this cmd, and select run as administrator!!     #
ECHO   #----------------------------------------------------------------------#
ECHO.
set choice=
set /p choice=[Press "Y" to apply，  Press "Q" to quit.]?
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='y' goto _INSTALL
if '%choice%'=='Y' goto _INSTALL
if '%choice%'=='q' goto _End
if '%choice%'=='Q' goto _End
ECHO "%choice%" is not valid please try again
ECHO.
goto _Menu

:: //////////////////////////////////////////////////////////////

:_Install

:: if not exist %SystemRoot%\ntkr128g.exe goto _NotFoundNewKernel


set OS_NAME=

ver > osinfo.txt
type osinfo.txt | find "Microsoft" > nul && goto _SuccessGetOsName
goto _SetDefaultOsName

:_SetDefaultOsName
set OS_NAME=Windows 32-bit (x86)
goto :SetEntryDesc

:: ///// Get OS info success, come on  ///////

:_SuccessGetOsName

set num=0
setlocal enabledelayedexpansion
for,/f,"delims=",%%i, In (osinfo.txt) Do (
set /a num+=1
if !num! equ 1 set OS_NAME=%%i
)

:SetEntryDesc
ECHO.
ECHO OK, OS name is : %OS_NAME%
ECHO.

set MY_ENTRY_DESC="%OS_NAME% [128GB with ntkr128g.exe]"

del osinfo.txt > nul

:: //////////////////////////////////////////////////////////////

bcdedit | find "128GB" > nul && goto _FoundOldEntry
bcdedit | find "ntkr128g.exe" > nul && goto _FoundOldEntry

ECHO.
ECHO Create a new entry from current...
bcdedit -copy {current} /d %MY_ENTRY_DESC% > mybcdguid.txt

type mybcdguid.txt | find "{" > nul && goto _SuccessCreat
goto _FailedCopy


:: ///// Create new entry success, come on  ///////

:_SuccessCreat

set ENTRY_GUID=

for,/f,"tokens=2 delims={",%%i,In (mybcdguid.txt) Do (
set ENTRY_GUID_START=%%i
)

for,/f,"tokens=1 delims=}",%%i,In ("%ENTRY_GUID_START%") Do (
set ENTRY_GUID={%%i}
)

ECHO.
ECHO OK, New entry GUID is : %ENTRY_GUID%
ECHO.

bcdedit /set %ENTRY_GUID% testsigning on
bcdedit /set %ENTRY_GUID% pae forceenable
bcdedit /set %ENTRY_GUID% kernel ntkr128g.exe

:: 以下可选
bcdedit -timeout 12
bcdedit -displayorder %ENTRY_GUID% -addfirst

REM bcdedit -default %ENTRY_GUID%

REM del mybcdguid.txt > nul

goto _End

:: //////////////////////////////////////////////////////////////

:_NotFoundNewKernel
ECHO.
ECHO 没有发现新内核文件 ntkr128g.exe 。
ECHO Not found the new kernel file [ntkr128g.exe].
goto _End

:: //////////////////////////////////////////////////////////////

:_FoundOldEntry
ECHO.
ECHO 启动项已经存在，无需再次添加。
ECHO Found old entry in boot menu, no need to do it again.
goto _End

:: //////////////////////////////////////////////////////////////
:_FailedCopy
ECHO.
ECHO 复制、创建新启动菜单失败！，请检查权限，以管理员身份运行本脚本。
ECHO Fail to Create boot menu. Please as this script as administrator!
goto _End

:: //////////////////////////////////////////////////////////////

:_End
ECHO.
pause


