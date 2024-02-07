Updating Windows System Image Manager for Windows 10, Version 1903 

Checking to see if your system is affected:
=================================================================================
1. If the host system that is running the ADK is 32-bit, you are not affected and do not need to update anything.
2. If the host system that is running the ADK is 64-bit, you are affected need to follow the steps below.



Updating ImgMgr.exe and ImageCat.exe (script):
=========================================================
3. Unzip the contents of the .zip archive by right clicking on it and selecting Extract All...

5. From an elevated command line, move into the root of the folder that contains the contents of the expanded zip
   and then run the following command:

   UpdateWSIM.cmd



Updating ImgMgr.exe and ImageCat.exe (manual):
=========================================================
3. Install the Windows 10 Version 1903 ADK if you have not already installed it; note down the path you are installing 
   the ADK to. If you already installed the ADK, locate its path by running the following from a command window

dir /s /b imgmgr.exe

4. Unzip the contents of the .zip archive by right clicking on it and selecting Extract All...

5. From an elevated command line, assuming that the ADK is installed in the default path of: 

C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools

   move into the root of the folder that contains the contents of the expanded zip and then run the following commands:

xcopy /Y imagecat.exe "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\WSIM\imagecat.exe"
xcopy /Y imgmgr.exe "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\WSIM\imgmgr.exe"

   If the ADK was not installed in the default location, then please make sure to update the above paths appropriately based
   on the path determined in Step 3.
