#apt update && apt install gobgpd -y
#chmod +x facebook.sh

#!/bin/bash

# Verifica se o número correto de argumentos foi fornecido
if [ "$#" -ne 5 ]; then
    echo "Uso: $0 <INT> <IP> <CIDR> <NEIGHBOR_IP> <REMOTE_AS>"
    exit 1
fi

# Atribui os argumentos a variáveis
INT=$1
IP=$2
CIDR=$3
NEIGHBOR_IP=$4
REMOTE_AS=$5

gobgpd &
echo ""

# Configura o BGP com o gobgp
echo "Configurando BGP com o gobgp..."

# Adiciona o AS local
LOCAL_AS=32934  # Altere para o AS local apropriado
sudo gobgp global as $LOCAL_AS router-id 10.99.99.99 listen-port 179

# Adiciona o IP à interface de rede (supondo que a interface seja eth0; ajuste conforme necessário)
echo "Adicionando IP $IP à interface $INT..."

if [[ $IP == *:* ]]; then
    sudo ip -6 addr add $IP/$CIDR dev $INT
    v6=1

else
    sudo ip addr add $IP/$CIDR dev $INT

fi

# Adiciona o vizinho
sudo gobgp neighbor add $NEIGHBOR_IP as $REMOTE_AS

# Verifica a configuração
echo "Verificando configuração BGP..."
sudo gobgp neighbor

echo "Configuração concluída!"

if [[ $v6 == 1 ]]; then

    sudo gobgp global rib add -a ipv6 2620:10d:c090::/44
    sudo gobgp global rib add -a ipv6 2620:10d:c09a::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f005::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f048::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f105::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f148::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f1fc::/47
    sudo gobgp global rib add -a ipv6 2a03:2880:f1fc::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f205::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f248::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:ff0c::/48
    sudo gobgp global rib add -a ipv6 2a03:2881::/32
    
    echo "Adicionado rotas ipv6"
else

    sudo gobgp global rib add -a ipv4 31.13.85.0/24
    sudo gobgp global rib add -a ipv4 129.134.29.0/24
    sudo gobgp global rib add -a ipv4 157.240.12.0/24
    sudo gobgp global rib add -a ipv4 157.240.222.0/24
    sudo gobgp global rib add -a ipv4 157.240.226.0/24
    sudo gobgp global rib add -a ipv4 163.114.128.0/20
    sudo gobgp global rib add -a ipv4 163.114.136.0/24
    sudo gobgp global rib add -a ipv4 185.89.218.0/23
    sudo gobgp global rib add -a ipv4 185.89.218.0/24
    sudo gobgp global rib add -a ipv4 199.201.64.0/22

echo "Adicionado rotas ipv4"

fi

echo ""
echo ""
