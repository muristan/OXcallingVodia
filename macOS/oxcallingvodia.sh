#!/bin/sh

# Andreas Keller, Spittelstr. 4, 67655 Kaiserslautern
# 19th april 2019
# muristan.org
# Lizenz GPL 3

if [ ${1:7:3} = "set" ];
then   
   A=${1//%20/" "}
   IFS=' ' read -r -a ARG <<< "$A"
   PBX=${ARG[1]}
   DOMAIN=${ARG[2]}
   USERID=${ARG[3]}
   PASSWORD=${ARG[4]}

   mkdir -p /Users/$USER/.config/OXcallingVodia
   echo "#!/bin/sh" > /Users/$USER/.config/OXcallingVodia/config.conf
   echo "PBX=$PBX" >> /Users/$USER/.config/OXcallingVodia/config.conf
   echo "DOMAIN=$DOMAIN" >> /Users/$USER/.config/OXcallingVodia/config.conf
   echo "USERID=$USERID" >> /Users/$USER/.config/OXcallingVodia/config.conf
   echo "PASSWORD=$PASSWORD" >> /Users/$USER/.config/OXcallingVodia/config.conf
   exit
fi


if [ ! -f "/Users/$USER/.config/OXcallingVodia/config.conf" ];
then 
  exit
fi


. /Users/$USER/.config/OXcallingVodia/config.conf
L1=${#1}
L2=$((L1-6))
PHONENUMBER=${1:7:L2}
PHONENUMBER=${PHONENUMBER/+/00}
URL="$PBX/remote_call.htm?user=$USERID%40$DOMAIN&dest=$PHONENUMBER&auth=$USERID%40$DOMAIN%3A$PASSWORD&connect=true"
open $URL


