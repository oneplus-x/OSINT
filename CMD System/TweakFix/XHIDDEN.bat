@ECHO OFF
echo Trying to repair your drive...
echo Please wait...
attrib -r -a -s -h /s /d
attrib -r -a -s -h autorun.inf
 erase autorun.inf
 copy remove.inf autorun.inf
 attrib +r +a +s +h autorun.inf
 attrib +r +a +s +h *.pif
 attrib +r +a +s +h *.exe
echo Done! All folders and files will be visible to you now.
pause
exit