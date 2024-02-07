@Echo off

REM
REM Query the 32-bit and 64-bit Registry hive for KitsRoot
REM

SET regKeyPathFound=1
SET wowRegKeyPathFound=1
SET KitsRootRegValueName=KitsRoot10

REG QUERY "HKLM\Software\Wow6432Node\Microsoft\Windows Kits\Installed Roots" /v %KitsRootRegValueName% 1>NUL 2>NUL || SET wowRegKeyPathFound=0
REG QUERY "HKLM\Software\Microsoft\Windows Kits\Installed Roots" /v %KitsRootRegValueName% 1>NUL 2>NUL || SET regKeyPathFound=0

if %wowRegKeyPathFound% EQU 0 (
  if %regKeyPathFound% EQU 0 (
    @echo KitsRoot not found, can't set common path for Deployment Tools
  ) else (
    @echo Running in 32-bit environment, update to Windows System Image Manager binaries not needed
  )
  goto :EOF 
)

SET regKeyPath=HKLM\Software\Wow6432Node\Microsoft\Windows Kits\Installed Roots
FOR /F "skip=2 tokens=2*" %%i IN ('REG QUERY "%regKeyPath%" /v %KitsRootRegValueName%') DO (SET KitsRoot=%%j)


REM
REM Build the D&I Root from the queried KitsRoot
REM
SET DandIRoot=%KitsRoot%Assessment and Deployment Kit\Deployment Tools

REM
REM Set WSIM path. WSIM is 32-bit only and ships in architecture-independent path
REM
SET WSIMRoot=%DandIRoot%\WSIM


REM
REM Check whether D&I root path exists
REM

if not exist "%DandIRoot%" (
  @echo Deployment Tools not found in the expected location, can't update Windows System Image Manager binaries
  goto :EOF 
)

REM
REM Check whether WSIM root path exists
REM

if not exist "%WSIMRoot%" (
  @echo Windows System Image Manager directory not found in the expected location, can't update
  goto :EOF 
)

xcopy /Y .\ImageCat.exe "%WSIMRoot%\"
xcopy /Y .\ImgMgr.exe "%WSIMRoot%\"
