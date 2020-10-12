#!/bin/bash

#Verifier nombre des arguments et l'existence des fichiers

function verifier_existence_fichiers (){
    for param in $@
    do
        if [ -e "$param" ]
        then
            echo "Cet $param existe."
        else 
            echo "Cet $param n'existe pas."
        fi
    done
}

function verifier_nombre_arguments (){
    if [ "$1" -ne 1 ]
    then
        exit 2
    else
        verifier_existence_fichiers "$2"
    fi
}

verifier_nombre_arguments "$#" "$*"