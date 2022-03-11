@ECHO OFF
mode 140,70
:HEAD
COLOR 017
CLS
ECHO   .;'                     `;,    
ECHO  .;'  ,;'             `;,  `;,   Ghost-it
ECHO .;'  ,;'  ,;'     `;,  `;,  `;,   Wireless virtual Network Créator
ECHO ::   ::   :   ( )   :   ::   ::   Run Script As Admin
ECHO ':.  ':.  ':. /_\ ,:'  ,:'  ,:'  
ECHO  ':.  ':.    /___\    ,:'  ,:'
ECHO   ':.       /_____\      ,:'    
ECHO            /       \            
netsh wlan show settings
ECHO ------------------------------------------------------------------
ECHO.
ECHO 1. ON
ECHO 2. OFF
ECHO.
ECHO MAKE CHOICE :  
set /p x=
    if %x%==1 (
     goto ON
    ) else if %x%==2 (
         goto OFF
        ) else (
     goto HEAD
    )
goto HEAD
:ON
netsh wlan set hostednetwork mode=allow ssid=GhostyAP key=001122334455667788
netsh wlan start hostednetwork
ECHO [#]- AP ENABLED
ECHO [#]- BSSID = GhostyAP
ECHO [#]- WPA/PSK Key = 001122334455667788
ECHO [!]- One More Step :
ECHO  + Allow Internet for the Devices that are Connected to the AP
ECHO    - Go To [ Network and sharing Center]
ECHO    - Selcet The Propreties Of The Interface That Has Internet
ECHO    - Go To Sharing Tab And Check Allow Sharing For Your Virtual Network
ECHO      Enjoy :)...
set /p y=
GOTO HEAD
:OFF
netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=disallow
ECHO  AP Disabled -_-
set /p y=
GOTO HEAD
:QUIT
echo PRRESS ANY KET TO EXIT
set /p y=

# Digital Gangster [2015-04-02]