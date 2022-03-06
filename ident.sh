#!/bin/bash
#Funcion error
error(){
    echo "[!] Usage: ./ident.sh <ip or domain>"
    echo "[+] Example: ./ident.sh 8.8.8.8  "
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
if [ $val -ne 0 ]; then
    error 
fi

#Variable con ttl
ttl=$(ping -c 1 $1|sed "s/ /\n /g"|grep "ttl"|cut -d "=" -f 2)

#Condicion para identifiar el S.O
if (( $ttl > 64 )) && (( $ttl<=128 )); then
    echo "Windows --> ttl:$ttl"
elif (( $ttl <=64 )); then
    echo "Linux --> ttl:$ttl"
fi
