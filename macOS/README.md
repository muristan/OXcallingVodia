# OXcallingVodia

This application is a click2dial app for Open Xchange App Suite and Vodia PBX. It works on macOS on all web browsers.

## Installation
Download OXcallingVodia.zip, unzip and move OXcallingVodia into you application folder.


## Configuration 

Open a browser and insert: callto:set https://yourpbxaddress extensiondomain yournumber yourpassword

This will create the configuration file /Users/$USER/.config/OXcallingVodia/config.conf
When your browser asks if use OXcallingVodia for the protocol callto, then activate the checkbox "use allways this application for callto" anc click on the application.


## Using the app

Click on a phone numer in Open Xchange App Suite. 
The link callto:[phonenumber] will be handled by the OXcallingVodia app and passed to Vodia PBX.


## Build the app

You need the free macOS developer tool Platypus to create a native macOS applications from the bash script oxcallingvodia.sh
In the package created by Platypus there is a file Info.plist - but in this file are the keys for Url handling missing. 

Add the folowing lines to Info.plist (use editors such as PLIST Editor).

	<key>CFBundleIdentifier</key>
    <string>org.muristan.OXcallingVodia</string>
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLName</key>
            <string>Pass To OXcallingVodia</string>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>callto</string>
            </array>
        </dict>
    </array> 


OR overwrite the Info.plist in the package CREATED BY PLATYBUS with the Info.plist here.

Have fun!
