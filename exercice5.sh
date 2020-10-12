#!/bin/bash

#ajouter ou supprimer un utilisateur

echo "Ajouter ou supprimer un utilisateur (ajouter, supprimer) : "
read choix

function ajouter_supprimer_utilisateur (){
    for user in $(cat /etc/passwd | cut -d: -f1)
    do  

        if [ $2 = $user ]
        then
            if [ $1 = "ajouter" ]
            then
                echo "L'utilisateur $2 existe deja"
            else
                sudo deluser -f $2
                echo "L'utilisateur $2 vient d'etre supprimé"
            fi
        else
            if [ $1 = "ajouter" ]
            then
                sudo adduser "$2" "$3"
                echo "L'utilisateur $2 a été ajouté"
            else
                echo "L'utilisateur $2 ne peut etre supprimé"
            fi
        fi
    done
}

case $choix in
    ajouter)
        echo "Veuillez entrer le nom d'utilisateur : "
        read user_name
        echo "Veuillez entrer le mot de passe : "
        read password
        ajouter_supprimer_utilisateur "ajouter" $user_name $password
        ;;
    supprimer)
        echo "Veuillez entrer le nom d'utilisateur : "
        read user_name
        ajouter_supprimer_utilisateur "supprimer" $user_name
esac