#!/bin/bash
OUTPUT="/tmp/input.txt"
#Nos pide el nombre de la tarjeta de red
tar_red(){
	dialog --title "Tarjeta red"  \
		--inputbox "Escribe el nombre de la tarjeta de red: " 8 60 2>$OUTPUT
	nom_tar=$(cat $OUTPUT)
}
#Direccion de red
dir_red(){
	dialog --title "Direccion IP"  \
		--inputbox "Escribe la direccion IP que quieres usar: " 8 60 2>$OUTPUT
	dir_ip=$(cat $OUTPUT)
}
#Mascara
mascara(){
	dialog --title "Mascara"  \
		--inputbox "Escribe la mascara: " 8 60 2>$OUTPUT
	mask=$(cat $OUTPUT)
}
#Puerta de enlace
puerta(){
	dialog --title "Puerta enlace"  \
		--inputbox "Escribe la puerta de enlace: " 8 60 2>$OUTPUT
	gateway=$(cat $OUTPUT)
}
#Direccion de DNS1
dns1(){
	dialog --title "DNS1"  \
		--inputbox "DNS 1: " 8 60 2>$OUTPUT
	dns1=$(cat $OUTPUT)
}
#Direccion de DNS2
dns2(){
	dialog --title "DNS2"  \
		--inputbox "DNS 2: " 8 60 2>$OUTPUT
	dns2=$(cat $OUTPUT)
}
#Visualizar el todo los datos insertados en los anteriores input
ver_datos(){
	dialog --title "Datos introducidos"  \
		--msgbox "Nombre de tarjeta: "$nom_tar" Direccion IP: "$dir_ip" Mascara: "$mask" Puerta de enlace: "$gateway" DNS: "$dns1" "$dns2"" 0 0 
		
}
#Añadimos la configuracion obtenida al archivo interfaces
anadir(){
	echo auto $nom_tar >> /etc/network/interfaces
	echo iface $nom_tar inet static >> /etc/network/interfaces	
	echo address $dir_ip >> /etc/network/interfaces
	echo netmask $mask >> /etc/network/interfaces
	echo gateway $gateway >> /etc/network/interfaces
	echo dns-nameservers $dns1 $dns2 >> /etc/network/interfaces
	echo -e >> /etc/network/interfaces
	echo -e >> /etc/network/interfaces
}
#Visualizamos el contenido del archivo interfaces
ver_cont(){
	dialog --title "Ver archivo de red"  \
		--textbox /etc/network/interfaces2 0 0
}
#Dibujar interfaz	
while true
do
tar_red
dir_red
mascara
puerta
dns1
dns2
ver_datos
anadir
ver_cont
done
