#apt update && apt install gobgpd -y
#chmod +x google
#mv google /usr/bin

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
LOCAL_AS=15169  # Altere para o AS local apropriado
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

  sudo gobgp global rib add -a ipv6 2001:4860::/32
  sudo gobgp global rib add -a ipv6 2001:4860:4820::/48
  sudo gobgp global rib add -a ipv6 2001:4860:4828::/48
  sudo gobgp global rib add -a ipv6 2404:6800::/32
  sudo gobgp global rib add -a ipv6 2404:6800:4001::/48
  sudo gobgp global rib add -a ipv6 2404:f340::/32
  sudo gobgp global rib add -a ipv6 2600:1900::/31
  sudo gobgp global rib add -a ipv6 2600:1904::/30
  sudo gobgp global rib add -a ipv6 2600:1908::/29
  sudo gobgp global rib add -a ipv6 2605:ef80::/32
  sudo gobgp global rib add -a ipv6 2606:40::/32
  sudo gobgp global rib add -a ipv6 2a00:1450:400b::/48
  sudo gobgp global rib add -a ipv6 2c0f:fb50::/32
  sudo gobgp global rib add -a ipv6 2c0f:fb50:4002::/48
    
    echo "Adicionado rotas ipv6"
else

  sudo gobgp global rib add -a ipv4 8.8.4.0/24
  sudo gobgp global rib add -a ipv4 8.8.8.0/24
  sudo gobgp global rib add -a ipv4 8.34.208.0/21
  sudo gobgp global rib add -a ipv4 23.236.48.0/20
  sudo gobgp global rib add -a ipv4 23.251.128.0/19
  sudo gobgp global rib add -a ipv4 34.1.97.0/24
  sudo gobgp global rib add -a ipv4 34.3.3.0/24
  sudo gobgp global rib add -a ipv4 74.125.21.0/24
  sudo gobgp global rib add -a ipv4 104.199.0.0/19
  sudo gobgp global rib add -a ipv4 104.199.128.0/19
  sudo gobgp global rib add -a ipv4 142.251.184.0/24
  sudo gobgp global rib add -a ipv4 142.251.185.0/24
  sudo gobgp global rib add -a ipv4 146.148.0.0/17
  sudo gobgp global rib add -a ipv4 152.65.243.0/24
  sudo gobgp global rib add -a ipv4 162.222.176.0/21
  sudo gobgp global rib add -a ipv4 172.110.32.0/21
  sudo gobgp global rib add -a ipv4 172.217.0.0/16
  sudo gobgp global rib add -a ipv4 216.239.36.0/24
  sudo gobgp global rib add -a ipv4 216.239.38.0/24
  sudo gobgp global rib add -a ipv4 216.239.39.0/24

  echo "Adicionado rotas ipv4"

fi

echo ""
echo ""
