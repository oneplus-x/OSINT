import urllib.request
import os

print()
print("\033[30142m Note: Copy and Paste Your word list on The same Directory And also include .txt")
print("\033[30142m Note: The LINk must Include / at the end like this http://www.example.com/")
print()
wor= input("\033[321m Enter Your wordlist.txt: ")
url = input("\033[321m Enter Website: ")
print()
print(":::::::::::::::::::::: Scanning PROCESS BEgains :::::::::::::::::::::::::")
print()
al = open(wor, "r")
b = []

for hani in al:
    curl = url+hani
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


