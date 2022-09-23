net stop wuauserv 
rmdir %windir%\softwaredistribution /s /q  
regsvr32 /s wuaueng.dll 
regsvr32 /s wuaueng1.dll 
regsvr32 /s atl.dll 
regsvr32 /s wups.dll 
regsvr32 /s wups2.dll 
regsvr32 /s wuweb.dll 
regsvr32 /s wucltui.dll 
net start wuauserv





