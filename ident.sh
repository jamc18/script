#!/bin/bash
#Primer comando de practicas
#Programa en bash para saber a que maquina le hacemos ping windows o linux
ttl=$(ping -c 1 $1|sed 's/ /\n/g'|grep "ttl"|sed 's/=/ /'|awk 'NF{print $NF}')
if (( 64 < $ttl )) && (( 128 >= $ttl )); then
	echo "Windows->(ttl:$ttl)"
elif (( $ttl > 0 )) && (( $ttl <=64 )); then
	echo "Linux->(ttl:$ttl)"
else
	echo "El argumento es ./ident.sh <ip> o <dominio>"
fi
