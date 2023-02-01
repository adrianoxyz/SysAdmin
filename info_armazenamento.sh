#!/bin/bash

################################################################
# SCRIPT QUE RETORNA INFORMAÇÕES DA PARTIÇÃO CASO ESTEJA CHEIO #
################################################################

a=$(df -h| grep sda5 | cut -d"%" -f1|tr -s " " | cut -d " " -f5)
if [ $a -gt 80 ]
then
	echo "O Armazenamento desta máquina está com uma lotação de $a%"
else
	echo "O Armazenamento não está com lotação"
fi