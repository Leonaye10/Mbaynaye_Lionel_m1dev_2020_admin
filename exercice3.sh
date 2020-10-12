#!/bin/bash

#verifier existence d'un utilisateur

read -p "Veuillez entrer votre nom d'utilisateur ici : " new_user

for user in $(cat /etc/passwd | cut -d: -f1)
do  
    if [ $new_user = $user ]
    then
        echo "L'utilisateur $new_user existe"
    else
        echo "L'utilisateur $new_user n'existe pas"
    fi
done
