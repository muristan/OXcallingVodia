#!/bin/bash

# Click2Dial App OXcallingVodia for Linux
# by Andreas Keller, Spittelstr. 4, 67655 Kaiserslautern
# Lizenz GPL 3
# 19th april 2019
# muristan.org

if [ ${1:7:3} = "set" ];
then   
   A=${1//%20/" "}
   IFS=' ' read -r -a ARG <<< "$A"
   PBX=${ARG[1]}
   DOMAIN=${ARG[2]}
   USERID=${ARG[3]}
   PASSWORD=${ARG[4]}

   mkdir -p /home/$USER/.config/OXcallingVodia
   echo "#!/bin/sh" > /home/$USER/.config/OXcallingVodia/config.conf
   echo "PBX=$PBX" >> /home/$USER/.config/OXcallingVodia/config.conf
   echo "DOMAIN=$DOMAIN" >> /home/$USER/.config/OXcallingVodia/config.conf
   echo "USERID=$USERID" >> /home/$USER/.config/OXcallingVodia/config.conf
   echo "PASSWORD=$PASSWORD" >> /home/$USER/.config/OXcallingVodia/config.conf
   exit
fi


if [ ! -f "/Users/$USER/.config/OXcallingVodia/config.conf" ];
then 
  exit
fi


. /home/$USER/.config/OXcallingVodia/config.conf
L1=${#1}
# echo Länge ganzer Ausdruck: $L1 
L2=$((L1-6))
# echo Länge Nummer +1: $L2 
PHONENUMBER=${1:7:L2}
# echo Nummer: $PHONENUMBER
PHONENUMBER=${PHONENUMBER/+/00}
URL="$PBX/remote_call.htm?user=$USERID%40$DOMAIN&dest=$PHONENUMBER&auth=$USERID%40$DOMAIN%3A$PASSWORD&connect=true"
wget "$URL"