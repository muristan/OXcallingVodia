# OXcallingVodia

This application is a click2dial app for Open Xchange App Suite and Vodia PBX. It works on Mac=S on all web browsers.


To register the app in MacOS you need OXcallingVodia.zip


Unzip the file OXcallingVodia.zip and put the app into your application folder.

First use
Open a browser and insert: callto:set https://yourpbxaddress extensiondomain yournumber yourpassword
This will create the configuration file /Users/$USER/.config/OXcallingVodia/config.conf
When your browser asks if use OXcallingVodia click yes.


Using the app

Click on a phone numer in Open Xchange App Suite. 
The link callto:[phonenumber] will be handled by the OXcallingVodia app and passed to Vodia PBX.


To build the app
You need the MacOS developer tool Platypus to create a native Mac applications from the bash script oxcallingvodia.sh
In the package created by Platypus there is a file Info.plist - but in this file are the keys for Url handling missing. 
So overwrite the Info.plist in the package with the Info.plist here.

Have fun!
