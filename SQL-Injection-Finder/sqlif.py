import multiprocessing
from googlesearch import search
import requests, time, os
from colorama import Fore

from requests.models import HTTPError

def scan(query,count):
    try:
        if count == 1: result = search(query, num_results=count)

        elif count == 0: print(Fore.RED+"\n [!] Input Error !"); exit()

        elif count > 1: count -= 1; result = search(query, num_results=count)
        
        else: print(Fore.RED+"\n [!] Bye !"); exit()

        amir = 0
        for i in result:
            amir += 1
            print(Fore.LIGHTBLUE_EX+f"\n [{amir}] Testing --> {i}")
            x = i
            i = i+"'"
            
            try:
                r = requests.get(i,timeout=8)
                if "sql" in r.text or "SQL" in r.text or "Sql" in r.text:
                    print(Fore.GREEN+f"    [*] SQL Injection Founded at [ {x} ]")
                else:
                    print(Fore.RED+"    [!] SQL Injection Not Found :(")
            except:
                print(Fore.RED+"    [!] Time Out !")

            time.sleep(0.5)
        return

    except KeyboardInterrupt:
        print(Fore.RED+"\n [!] OK BYE !")
        return exit()
    except HTTPError:
        print(Fore.RED+"\n [!] Too Many Requests, Try Agan Later :)")
    except Exception as e:
        print(e)
        return exit()


if __name__ == "__main__":
    os.system("clear")
    print(Fore.RED+"""
         ,-.
        / \  `.  __..-,O
       :   \ --''_..-'.'
       |    . .-' `. '.
       :     .     .`.'
        \     `.  /  ..
         \      `.   ' .
          `,       `.   \ 
         ,|,`.        `-.\ 
        '.||  ``-...__..-`
         |  |
         |__|       --------------------------------------------
         /||\\       Coded By AmirHossein Rahmani | @TheWebSploit 
        //||\\\\                      v 1.0.1
       // || \\\\   ---------------------------------------------
    __//__||__\\\\ __
   '--------------' 

    """)
    try:
            query = str(input(Fore.GREEN+"[*]Enter Query : "))
            count = int(input(Fore.GREEN+"[*]Enter Count of Result : "))
    except KeyboardInterrupt:
        print(Fore.RED+"\n [!] Bye !")
        exit()
    except:
        print(Fore.RED+"\n [!] There is an Error !")
        exit()
    


    p1 = multiprocessing.Process(target=scan, args=(query,count))
    p1.start()
    p1.join()
