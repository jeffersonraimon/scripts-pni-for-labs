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

    sudo gobgp global rib add -a ipv6 2a03:2880:f080::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f180::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f280::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f300::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f800::/48
    sudo gobgp global rib add -a ipv6 2a03:2881::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4000::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f11f::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f21f::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f31f::/48
    sudo gobgp global rib add -a ipv6 2401:db00::/32
    sudo gobgp global rib add -a ipv6 2a03:2880:f036::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f013::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:98::/45
    sudo gobgp global rib add -a ipv6 2a03:2881:400a::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f03e::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f13e::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f23e::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f33e::/48
    sudo gobgp global rib add -a ipv6 2803:6080::/29
    sudo gobgp global rib add -a ipv6 2620:0:1cfa::/48
    sudo gobgp global rib add -a ipv6 2620:0:1cff::/48
    sudo gobgp global rib add -a ipv6 2620:0:1c00::/40
    sudo gobgp global rib add -a ipv6 2a03:2880:f059::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f159::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f259::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f001::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f011::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f019::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f021::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f029::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f031::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f26c::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f30b::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f80b::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:ff0b::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:b::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:400b::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f187::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f287::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f164::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f264::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f003::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:3::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4003::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f103::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f203::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f303::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f803::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f0a2::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f041::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f141::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f241::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f341::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:d::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:400d::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f17f::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f27f::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f31e::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:1e::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f01e::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f05c::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f15c::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f25c::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f09a::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f339::/48
    sudo gobgp global rib add -a ipv6 2a03:2880:f000::/36
    sudo gobgp global rib add -a ipv6 2a03:83e0::/32
    sudo gobgp global rib add -a ipv6 2a03:2881:16::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:e::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:6::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4006::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:19::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:11::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:48::/45
    sudo gobgp global rib add -a ipv6 2a03:2880::/36
    sudo gobgp global rib add -a ipv6 2a03:2880::/32
    sudo gobgp global rib add -a ipv6 2a03:2881:17::/48
    sudo gobgp global rib add -a ipv6 2a03:2887:ff2c::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4009::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:9::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:1::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4001::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:1c::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:14::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:c::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:400c::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4004::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:f::/48
    sudo gobgp global rib add -a ipv6 2a10:f781:10:cee0::/64
    sudo gobgp global rib add -a ipv6 2a03:2887:ff2d::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:4007::/48
    sudo gobgp global rib add -a ipv6 2a03:2881:7::/48
    sudo gobgp global rib add -a ipv6 2a03:2881::/32
    
    echo "Adicionado rotas ipv6"
else

    sudo gobgp global rib add -a ipv4 31.13.24.0/21
    sudo gobgp global rib add -a ipv4 31.13.64.0/18
    sudo gobgp global rib add -a ipv4 147.75.208.0/20
    sudo gobgp global rib add -a ipv4 69.63.176.0/20
    sudo gobgp global rib add -a ipv4 69.171.239.0/24
    sudo gobgp global rib add -a ipv4 69.171.224.0/20
    sudo gobgp global rib add -a ipv4 157.240.239.0/24
    sudo gobgp global rib add -a ipv4 57.144.0.0/14
    sudo gobgp global rib add -a ipv4 57.141.10.0/24
    sudo gobgp global rib add -a ipv4 163.70.158.0/24
    sudo gobgp global rib add -a ipv4 163.70.142.0/24
    sudo gobgp global rib add -a ipv4 129.134.30.0/24
    sudo gobgp global rib add -a ipv4 157.240.30.0/24
    sudo gobgp global rib add -a ipv4 129.134.78.0/24
    sudo gobgp global rib add -a ipv4 157.240.14.0/24
    sudo gobgp global rib add -a ipv4 129.134.29.0/24
    sudo gobgp global rib add -a ipv4 157.240.29.0/24
    sudo gobgp global rib add -a ipv4 157.240.13.0/24
    sudo gobgp global rib add -a ipv4 57.141.13.0/24
    sudo gobgp global rib add -a ipv4 157.240.253.0/24
    sudo gobgp global rib add -a ipv4 157.240.24.0/24
    sudo gobgp global rib add -a ipv4 129.134.113.0/24
    sudo gobgp global rib add -a ipv4 157.240.237.0/24
    sudo gobgp global rib add -a ipv4 157.240.202.0/24
    sudo gobgp global rib add -a ipv4 163.70.132.0/24
    sudo gobgp global rib add -a ipv4 102.132.97.0/24
    sudo gobgp global rib add -a ipv4 157.240.97.0/24
    sudo gobgp global rib add -a ipv4 157.240.220.0/24
    sudo gobgp global rib add -a ipv4 163.70.140.0/24
    sudo gobgp global rib add -a ipv4 129.134.28.0/24
    sudo gobgp global rib add -a ipv4 157.240.221.0/24
    sudo gobgp global rib add -a ipv4 157.240.27.0/24
    sudo gobgp global rib add -a ipv4 66.220.144.0/21
    sudo gobgp global rib add -a ipv4 163.70.151.0/24
    sudo gobgp global rib add -a ipv4 157.240.205.0/24
    sudo gobgp global rib add -a ipv4 157.240.11.0/24
    sudo gobgp global rib add -a ipv4 163.70.135.0/24
    sudo gobgp global rib add -a ipv4 102.132.100.0/24
    sudo gobgp global rib add -a ipv4 157.240.100.0/24
    sudo gobgp global rib add -a ipv4 57.141.3.0/24
    sudo gobgp global rib add -a ipv4 129.134.65.0/24
    sudo gobgp global rib add -a ipv4 129.134.75.0/24
    sudo gobgp global rib add -a ipv4 45.64.40.0/22
    sudo gobgp global rib add -a ipv4 129.134.27.0/24
    sudo gobgp global rib add -a ipv4 157.240.243.0/24
    sudo gobgp global rib add -a ipv4 157.240.208.0/24
    sudo gobgp global rib add -a ipv4 163.70.138.0/24
    sudo gobgp global rib add -a ipv4 102.132.103.0/24
    sudo gobgp global rib add -a ipv4 129.134.68.0/24
    sudo gobgp global rib add -a ipv4 157.240.227.0/24
    sudo gobgp global rib add -a ipv4 157.240.192.0/24
    sudo gobgp global rib add -a ipv4 179.60.192.0/24
    sudo gobgp global rib add -a ipv4 157.240.10.0/24
    sudo gobgp global rib add -a ipv4 69.171.250.0/24
    sudo gobgp global rib add -a ipv4 157.240.250.0/24
    sudo gobgp global rib add -a ipv4 157.240.234.0/24
    sudo gobgp global rib add -a ipv4 157.240.218.0/24
    sudo gobgp global rib add -a ipv4 185.60.218.0/24
    sudo gobgp global rib add -a ipv4 185.89.218.0/24
    sudo gobgp global rib add -a ipv4 69.171.255.0/24
    sudo gobgp global rib add -a ipv4 69.171.224.0/19
    sudo gobgp global rib add -a ipv4 185.89.218.0/23
    sudo gobgp global rib add -a ipv4 185.89.216.0/22
    sudo gobgp global rib add -a ipv4 157.240.246.0/24
    sudo gobgp global rib add -a ipv4 163.70.159.0/24
    sudo gobgp global rib add -a ipv4 157.240.211.0/24
    sudo gobgp global rib add -a ipv4 157.240.17.0/24
    sudo gobgp global rib add -a ipv4 74.119.76.0/22
    sudo gobgp global rib add -a ipv4 163.70.141.0/24
    sudo gobgp global rib add -a ipv4 57.141.9.0/24
    sudo gobgp global rib add -a ipv4 129.134.71.0/24
    sudo gobgp global rib add -a ipv4 157.240.195.0/24
    sudo gobgp global rib add -a ipv4 179.60.192.0/22
    sudo gobgp global rib add -a ipv4 157.240.1.0/24
    sudo gobgp global rib add -a ipv4 163.70.153.0/24
    sudo gobgp global rib add -a ipv4 163.70.137.0/24
    sudo gobgp global rib add -a ipv4 157.240.249.0/24
    sudo gobgp global rib add -a ipv4 129.134.0.0/16
    sudo gobgp global rib add -a ipv4 163.70.128.0/17
    sudo gobgp global rib add -a ipv4 157.240.214.0/24
    sudo gobgp global rib add -a ipv4 157.240.20.0/24
    sudo gobgp global rib add -a ipv4 57.141.12.0/24
    sudo gobgp global rib add -a ipv4 157.240.233.0/24
    sudo gobgp global rib add -a ipv4 157.240.198.0/24
    sudo gobgp global rib add -a ipv4 157.240.8.0/24
    sudo gobgp global rib add -a ipv4 157.240.248.0/24
    sudo gobgp global rib add -a ipv4 157.240.232.0/24
    sudo gobgp global rib add -a ipv4 157.240.216.0/24
    sudo gobgp global rib add -a ipv4 185.60.216.0/24
    sudo gobgp global rib add -a ipv4 157.240.200.0/24
    sudo gobgp global rib add -a ipv4 157.240.252.0/24
    sudo gobgp global rib add -a ipv4 157.240.217.0/24
    sudo gobgp global rib add -a ipv4 185.60.217.0/24
    sudo gobgp global rib add -a ipv4 157.240.23.0/24
    sudo gobgp global rib add -a ipv4 157.240.236.0/24
    sudo gobgp global rib add -a ipv4 157.240.201.0/24
    sudo gobgp global rib add -a ipv4 157.240.7.0/24
    sudo gobgp global rib add -a ipv4 102.132.96.0/24
    sudo gobgp global rib add -a ipv4 157.240.247.0/24
    sudo gobgp global rib add -a ipv4 157.240.231.0/24
    sudo gobgp global rib add -a ipv4 157.240.215.0/24
    sudo gobgp global rib add -a ipv4 157.240.199.0/24
    sudo gobgp global rib add -a ipv4 157.240.0.0/16
    sudo gobgp global rib add -a ipv4 57.141.6.0/24
    sudo gobgp global rib add -a ipv4 57.141.5.0/24
    sudo gobgp global rib add -a ipv4 57.141.8.0/24
    sudo gobgp global rib add -a ipv4 57.141.11.0/24
    sudo gobgp global rib add -a ipv4 102.132.99.0/24
    sudo gobgp global rib add -a ipv4 103.4.96.0/22
    sudo gobgp global rib add -a ipv4 102.132.96.0/20
    sudo gobgp global rib add -a ipv4 163.77.128.0/17
    sudo gobgp global rib add -a ipv4 173.252.64.0/18
    sudo gobgp global rib add -a ipv4 57.141.2.0/24
    sudo gobgp global rib add -a ipv4 185.60.216.0/22
    sudo gobgp global rib add -a ipv4 57.141.1.0/24
    sudo gobgp global rib add -a ipv4 57.141.4.0/24
    sudo gobgp global rib add -a ipv4 57.141.0.0/24
    sudo gobgp global rib add -a ipv4 204.15.20.0/22
    sudo gobgp global rib add -a ipv4 57.141.7.0/24
    sudo gobgp global rib add -a ipv4 66.220.144.0/20
    echo "Adicionado rotas ipv4"

fi

echo ""
echo ""
