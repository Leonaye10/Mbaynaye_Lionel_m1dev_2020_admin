#!/bin/bash

#ajouter ou supprimer un fichier

echo "Ajouter ou supprimer un fichier (ajouter, supprimer) : "
read choix 

function verifier_fichier (){
    if [ -e "$2" -a "$21" == "supprimer" ]
    then
        rm $2
        echo "Le fichier $ vient d'etre suprimé"
    elif [ ! -e "$2" -a "$1" == "supprimer" ]
    then
        echo "Le fichier $ ne peut pas etre supprimé"
    elif [ -e "$2" -a "$1" == "ajouter" ]
    then
        echo "Le fichier $ existe deja"
    elif [ ! -e "$2" -a "$1" == "ajouter" ]
    then
        touch $2
        echo "Le fichier $2 vient d'etre crée"
    fi
}

case $choix in 
    ajouter)
        echo "Veuillez entrer le nom d'utilisateur : "
        read fichier 
        verifier_fichier "ajouter" $fichier
        ;;
    supprimer)
        echo "Veuillez entrer le nom d'utilisateur : "
        read fichier
        verifier_fichier "suppimer" $fichier
        ;;
esac

