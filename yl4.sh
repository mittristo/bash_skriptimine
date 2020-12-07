#!/bin/bash

if [ $# -ne 2 ];then
    echo "Kasutusjuhend: $0 kasutajad.txt paroolid.txt"
else
        kasutajad=$1
        paroolid=$2
        paste -d":" $kasutajad $paroolid > kaspas.txt
        if [ -f $kasutajad -a -r $kasutajad ] && [ -f $paroolid -a -r $paroolid ]; then
        #kontrollib failide olemasolu, kui k6ik on korras, l2heb edasi
                echo "Fail $kasutajad kasutajatega ja $paroolid paroolidega on korras!"
                for  kas in $(cat $kasutajad); do # kasutajate loomine
                useradd $kas -m -s /bin/bash
                echo "Kasutajad $kas sai loodud"
#               more /etc/shadow | grep "$kas" # kontroll, kas kasutja on loodud
                done
                for pas in $(cat kaspas.txt); do
                echo $pas | chpasswd
                kas2=$(echo $pas | cut -fi -d":")
                echo "Kasutajale $kas2 sai parool m22ratud!"
#               more /etc/shadow | grep "$kas"
                done
                rm kaspas.txt
        else
                echo "Viga failide lugemisel."
        fi
fi

