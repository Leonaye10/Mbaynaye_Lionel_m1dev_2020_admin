#!/bin/bash

#ajouter ou supprimer un groupe

echo "Ajouter ou supprimer un group (ajouter, supprimer) : "
read choix

function ajouter_supprimer_group (){
    for group in $(cat /etc/group | cut -d: -f1)
    do  
        if [ $2 = $group ]
        then
            if [ $1 = "ajouter" ]
            then
                echo "Le groupe $2 existe deja"
            else
                sudo delgroup $2
                echo "Le groupe $2 vient d'etre supprimé"
            fi
        else
            if [ $1 = "ajouter" ]
            then
                sudo addgroup "$2"
                echo "Le groupe $2 a été ajouté"
            else
                echo "Le groupe $2 ne peut etre supprimé"
            fi
        fi
    done
}

case $choix in
    ajouter)
        echo "Veuillez entrer le nom du groupe : "
        read group_name
        ajouter_supprimer_group "ajouter" $groupe
        ;;
    supprimer)
        echo "Veuillez entrer le nom de groupe : "
        read group_name
        ajouter_supprimer_group "supprimer" $groupe
esac