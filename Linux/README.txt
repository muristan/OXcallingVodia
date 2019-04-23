INSTRUCTIONS


INSTALL

as root:
apt-get install -y wget
cp oxcallingvodia.sh /usr/local/bin
chmod +x /usr/local/bin/oxcallingvodia.sh



CONFIG FIREFOX

as user:
Open Firefox. Type about:config into the Location Bar (address bar) and press Enter.
Right-click -> New -> Boolean -> Name: network.protocol-handler.expose.callto -> Value -> false


Next time you click a link of protocol-type callto you will be asked which application to open it with.
It must be a LINK, such as
data:text/html,%3Ca href="callto%3A01513276530"%3E%26lt;callto:01513276530%26gt;%3C/a%3E 

Attention! If you just insert callto:01513276530 into the Firefox address bar, then Firefox will send the unknown expression to google.



CONFIG oxcallingvodia

Insert in Firefox address bar: 
callto:set https://yourpbxaddress extensiondomain yournumber yourpassword 

This will create the configuration file /home/$USER/.config/OXcallingVodia/config.conf


Now when you click a link in Open Xchange callto:0151-123456789 Firefox will pass it to oxcallingvodia and Vodia PBX will dial the number.


