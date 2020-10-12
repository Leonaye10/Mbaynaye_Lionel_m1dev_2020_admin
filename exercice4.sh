#!/bin/bash

#verifier existence d'un groupe

read -p "Veuillez entrer le nom groupe ici : " new_group

for group in $(cat /etc/group | cut -d: -f1)
do  
    if [ $new_group = $group ]
    then
        echo "Le groupe $new_group existe"
    else
        echo "Le groupe $new_group n'existe pas"
    fi
done
