<Unicode File>

注意： 
部分旧式驱动程序不支持超过4GB内存寻址，从而导致不能正常工作，甚至蓝屏死机。
请设置系统错误报告生成内存转存文件*.dmp，分析dmp，找出是哪个驱动程序有问题，更新之，或禁用之。
部分主板的附加功能也会不支持4GB而造成蓝屏。

蓝屏与Windows、以及补丁没有直接关系。Windows Vista/7 自身完全支持超过4GB大内存。
同样的硬件在2003或2008上也会出现同样问题。


本程序仅用于理论研究测试，禁止在生产环境中使用！使用者自行承担由于更改使用许可而造成的法律问题。


程序功能： 
查看32位 Vista/Windows 7 的内存容量许可限制；
破解Windows PAE 内核文件 ntkrnlpa.exe，绕过 ZwQueryLicenseValue API 函数的许可限制，使工作站版本 32位 x86 的 Vista/Windows 7 支持超过 4GB 物理内存。

详细的内容请看原文：
http://www.geoffchappell.com/viewer.htm?doc=notes/windows/license/memory.htm

本程序只是将修改过程自动化，并增加从内核中直接读取当前的内存容量许可上限。
本程序的修改及做数字签名都是直接系统API操作，无需使用其它辅助工具。
驱动程序viewmem-x86.sys，用于读取内存限制数据。

所有SP版本的Vista、Windows 7 应该都支持。


本程序只完成修改文件的工作，请自行用bcdedit编辑启动菜单加载新的内核文件。
你可以运行AddBootMenu.cmd 自动添加启动菜单的脚本，请右键点脚本文件，选择以管理员身份运行。

完成后，重启系统。
在出现开机菜单时，选择 "Windows 7 x86  [ 128GB with ntkr128g.exe ]" 进入系统，就可以完整使用所有的物理内存了。


/////////////////////////////////////////////////////////////////////////////////////////

bcdedit操作过程参考：
右键点开始菜单中的命令提示符，选择以管理员身份运行。

bcdedit -copy {current} /d "Windows 7 x86  [ 128GB with ntkr128g.exe ]"
The entry was successfully copied to {61b1399a-24cd-11de-a4c4-ca27f4abce37}.

以下请根据上面返回的{GUID}输入。
bcdedit /set {61b1399a-24cd-11de-a4c4-ca27f4abce37} testsigning on
bcdedit /set {61b1399a-24cd-11de-a4c4-ca27f4abce37} pae forceenable
bcdedit /set {61b1399a-24cd-11de-a4c4-ca27f4abce37} kernel ntkr128g.exe

以下可选
bcdedit -timeout 10
bcdedit -displayorder {61b1399a-24cd-11de-a4c4-ca27f4abce37} -addfirst
bcdedit -default {61b1399a-24cd-11de-a4c4-ca27f4abce37}


更新历史：
2009.04.11 V1.1.0.2
  * 上一版本程序中会漏一处修改，现已修正。

2009.04.12 V1.1.0.3
  * 去除自动在当前环境设置testsigning。

2009.04.20 V1.2.0.6
  + 增加显示内存容量、使用量等；增加显示Windows默认的内存许可容量，以及破解后的实际上限。

2009.04.22 V1.3.0.9
  + 增加显示内存模组的地址范围；增加显示PCI设备的最高地址范围，帮助判断内存重影射是否处于启用。