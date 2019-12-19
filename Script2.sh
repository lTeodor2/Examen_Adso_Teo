#!/bin/bash 
read -p "Introduce el primer numero: " num1
read -p "Introduce el segundo numero: " num2
if ((num1<num2));
then
	num=$num1
	num1=$num2
	num2=$num
fi
menu(){
	echo "1) Sumar"
	echo "2) Restar"
	echo "3) Multiplicar"
	echo "4) Dividir"
	echo "5) Porcentaje"
	echo "0) Salir"

	read -p "Elige la operacion:" option
}
while true; do
	menu
	case $option in
		1)
			$num = $((num1 + num2))
			echo 'El resultado de la suma de los operadores '$num1' y '$num2' es '$num
		;;
		2)
			$num = $((num1-num2))
			echo 'El resultado de la resta de los operadores '$num1' y '$num2' es '$num
		;;
		3)
			 $num = $((num1*num2))
			 echo 'El resultado de la multiplicacion de los operadores '$num1' y '$num2' es '$num

		;;
		4)
			if ((num2 = 0));
			then
				exit
			fi
			 $num = $((num1/num2))
			echo 'El resultado de la division de los operadores '$num1' y '$num2' es '$num

		;;
		5)
			$num3=100
			$num= $((num1*num2/num3))
			echo 'El resultado del porcentaje de los operadores '$num1' , '$num2' , '$num3' es '$num

		;;
		0) exit ;;
	esac
done
