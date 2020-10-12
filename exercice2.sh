#!/bin/bash

#verifier existence d'un fichier et ensuite le copier, supprimer ou lire

function verifier_existence_fichier (){
    if [ -e "$1" ]
    then
        case "$2" in
            lire)
                cat "$1"
                ;;
            copier)
                cp "$1" /tmp/
                ;;
            supprimer)
                rm "$1"
                ;;            
        esac
    else 
        echo "Le fichier $1 n'existe pas."
    fi
}

verifier_existence_fichier "$1" "$2"