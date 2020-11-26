#!/bin/bash
# kasutajate lisamise skript
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"	
else
 failinimi=$1
 if [ -f $failinimi -a -r $failinimi ]; then
    echo "fail on korras"
    for rida in $(cat $failinimi)
    do
      # sellega peaks faili sisu olema nähtav, kui fail on kätte saadav ja nüüd echo asemel tuleb kutsuda vajalik skript
      # echo $nimi
     kasutajanimi=$(echo "$rida" | cut -f1 -d":")
 sh lisa_kasutaja.sh $kasutajanimi # sellega me laseme lisa_kasutaja skript tööle
  echo "$rida" | chpasswd 
done
  else
    echo "probleem failiga $failinimi"
  fi
# parameetrite kontrolli lõpp
fi

