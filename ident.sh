#!/bin/bash
ip=$1
ttl=$(ping -c 1 $1|sed 's/ /\n/g'|grep "ttl"|sed 's/=/ /'|awk 'NF{print $NF}')
if (( 64 < $ttl )) && (( 128 >= $ttl )); then
	echo "Windows->(ttl:$ttl)"
elif (( $ttl > 0 )) && (( $ttl <=64 )); then
	echo "Linux->(ttl:$ttl)"
else
	echo "El argumento es ./ident.sh <ip> o <dominio>"
fi
