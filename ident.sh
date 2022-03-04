#!/bin/bash
#Primer comando de practicas
#Programa en bash para saber a que maquina le hacemos ping windows o linux
#!/bin/bash
error(){
    echo $1
    exit 1
}
if [ $# -ne 1 ]; then
    error "[*]USO-> scrip.sh <ip objetivo o dominio>"
fi
ttl=$(ping -c 1 $1|sed "s/ /\n /g"|grep "ttl"|cut -d "=" -f 2)
if (( $ttl > 64 )) && (( $ttl<=128 )); then
    echo "Windows --> ttl:$ttl"
elif (( $ttl <=64 )); then
    echo "Linux --> ttl:$ttl"
fi
