#!/bin/bash
##kasutajate loomine failist
if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"	
else

  if [ -f $failinimi -a -r $failinimi ]; then
    echo "fail on korras"
    for nimi in $(cat $failinimi)
    do
      sh lisa_kasutaja $nimi
    done
  else
    echo "probleem failiga $failinimi"
  fi

fi

