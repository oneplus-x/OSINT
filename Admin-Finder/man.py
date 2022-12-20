import urllib.request
import os
print()
print("\033[30142m Note: The LINk Must Include / at the end like this http://www.example.com/")
print()
url = input("\033[321m Enter Website: ")
print()
print("\033[321m :::::::::::::::::::::: Scanning PROCESS BEgains :::::::::::::::::::::::::")
print()
al = ('admin.php','admin/','admin1/','login.php','login','administrator/','webadmin/','adminLogin/','admin/index.php','admin/login.php','admin/admin.php','admin/login.html','admin/home.php','administrator/index.php','administrator/login.php','administrator.php','moderator/login.php','moderator.php','moderator/login.php','moderator/admin.php','controlpanel.php','admincontrol.php','admin/adminLogin.html','user.php','adminLogin.php','wp-login.php','panel-administracion/login.php','home.php','adminarea/login.php','admin/index.asp','admin/login.asp','admin/admin.asp','admin_area/admin.asp','admin/controlpanel.asp','admin.asp','index.php/home/admin')
b = []

for hani in al:
    curl = url+ hani
    try :
        openurl = urllib.request.urlopen(curl)
        print(curl + "\033[32m :::: POSSIBLE :::: ")
        b.append(curl)
        
        
    except urllib.error.URLError as msg :
        print (curl + "\033[31m :::: NOT FOUND :::: ")
print()

for i in b:
   if not b:
       print("\033[31m  ::: NO ADMIN PANNEL FOUND : ( :::")
   else:
       print(b,"\033[32m ::::: YOO ADMIN PANNEL FOUND : ) ::::")
