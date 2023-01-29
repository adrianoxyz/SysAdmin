#!/bin/bash

##################################################################
# SCRIPT PARA VERIFICAR SE DETERMINADO USUÁRIO EXISTE NO SISTEMA #
##################################################################

clear

read -p "Nome do usuário a ser verificado se existe: " userCreate

resultPesquisa=$(cat /etc/passwd |grep $userCreate)

echo "Usuário encontrado: $resultPesquisa"
echo "Se retornou nome de usuário então já existe no sistema, caso contrário, usuário não existe"