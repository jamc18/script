#!/bin/bash
#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

#Funcion error
error(){
    echo -e "${redColour}[!] Usage: $0 <ip or domain>${endColour}"
    echo -e "${greenColour}[+] Example: $0 8.8.8.8  ${endColour}"
    exit 1
}

#Condicion para que solo acepte un parametro
if [ $# -ne 1 ]; then
    error
fi

#Comando verificacion
ping -c 1 $1 >/dev/null 2>&1
val=$(echo $?)

#Condicion para verificar que la salida sea exitosa del comando ping
#if [ $val -ne 0 ]; then
#    error 
#fi
#Variable con ttl
ttl=$(ping -c 1 $1|sed "s/ /\n /g"|grep "ttl"|cut -d "=" -f 2)

#Condicion para identifiar el S.O
if (( $ttl > 64 )) && (( $ttl<=128 )); then
    echo "Windows --> ttl:$ttl"
elif (( $ttl <=64 )); then
    echo "Linux --> ttl:$ttl"
fi
