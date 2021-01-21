#!/bin/bash
# kontrollime, kas vastav teenus on installitud või mitte
echo "Teenuse kontroll. Kas on või ei ole installitud. Lisa teenuse nimi"
read nimi
teenus=$(dpkg-query -W -f='${Status}' $nimi | grep -c 'ok installed')
#teenus=$(dpkg-query -W -f="${Status}" $nimi 2>/dev/null  | grep -c "ok installed")
# kui teenust pole
if [ $teenus -eq 0 ]; then
	echo "paigaldame $teenuse"
	apt install $nimi
#kui teenus on
elif [ $teenus -eq 1 ]; then
	echo $1 " on juba paigaldatud"


fi

# skripti lõpp
