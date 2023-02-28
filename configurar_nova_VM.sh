#Atualizacao do SO
echo "Atualizando S.O...."
yum update

#Instalar ambiente gráfico
read -p "Deseja instalar o ambiente gráfico e deixá-lo configurado para acesso via cofre? (s/n)" respostaag
if [[ $respostaag -eq "s" || $respostaag -eq "sim" ]]
then
	echo "Instalando ambiente gráfico gnome...."
	chmod +x /tmp/startup/GUI_install.sh
	sh /tmp/startup/GUI_install.sh
else
	echo "Instalação do ambiente gráfico não realizado."
fi	

Executa script de instalacao do monitoramento Cirion
read -p "Deseja instalar o agente de monitoramento da Cirion? (s/n)" respostamon
if [[ $respostamon -eq "s" || $respostamon -eq "sim" ]]
then
	echo "Instalando o agente de monitoramento..."
	chmod +x /tmp/startup/script_hpmon.sh
	sh /tmp/startup/script_hpmon.sh
#else
#	echo "Instalação do agente de monitoramento não realizado."
#fi	

# Instala chaves da trendMicro
echo "Instalando chaves da TrendMicro. Siga procedimento no sharepoint para configuração."
yum install mokutil -y
mokutil --import /opt/ds_agent/*.der


#Remove arquivos e configurações de inicialização do script
rm -rf /tmp/startup
sed '$d' /etc/profile > /etc/profile.new
mv -f /etc/profile.new /etc/profile
history -c