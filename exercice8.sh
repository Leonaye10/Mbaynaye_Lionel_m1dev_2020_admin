#!/bin/bash

#modifier les droits de propriété d'un fichier

echo "Veuillez remplir les parametre suivants : "
echo "L'utilisateur : "
read utilisateur
echo "Le groupe : "
read groupe
echo "Le fichier : "
read fichier

function modifier_droits_fichier (){
  if [ -e $1 ]
  then 
    sudo chown $3:$2 $1
    echo "les droits de proprieté du fichier $1 ont été modifié"
  else
    echo "Le fichier $1 n'existe pas"
  fi
}

modifier_droits_fichier $fichier $groupe $utilisateur