#!/bin/bash

VAR=0
tmp=0
tmpSal=0
salMaior=0
salMedio=0
salMenor=0
sala=1
i=0
w=1
pri=0
num=0
cont=0
vlr=0
resSal=1
n=0

pega() {
	clear
	echo "Digite um numero"
	read N1
	echo "Digite outro numero"
	read N2
       }

sal() {
	echo "Digite o salario ou [ 0 ] para sair"
	read din
	clear
      }

espera() {
	  echo "Pressione [ENTER] para concluir"
	  read espera
	 }

imprimiImpar() {
		while (( $N1 <= $N2 )); do
			temp=$N1
			let res=($temp%2)
			if (( $res == 1 )); then
				echo "O $N1 eh impar"
			fi
		let N1=($N1+1)
		done;
		espera
		}

impar() {
	 clear
	 if (( $N1 > $N2 )); then
	 	tmp=$N2
		N2=$N1
		N1=$tmp
		imprimiImpar
	 else
		imprimiImpar
	 fi
	}

numeros() {
	   clear
	   echo "Quantos numeros voce vai querer digitar"
	   read num
	   while (( $i != $num )); do
	   	clear
		echo "Digite um numero"
		read n
		if (( $n > $tmp )); then
			tmp=$n
		fi
	  let i=($i+1)
	  done
	  clear
	  echo "O maior numero digitado foi: $tmp"
	  espera
	 }

reSal() {
         clear
         while (( $resSal > 0 )); do
	 	sal
		res=$(echo "scale=2; $din >= 500.00" | bc)
		if (( $res == 1 )); then
			res=$(echo "scale=2; $din*1.2" | bc)
		else
			res=$(echo "scale=2; $din*1.1" | bc)
		fi
	 	clear
		comp=$(echo "scale=2; $res > 0" | bc)
		if (( $comp == 1 )); then
	 		echo "O valor reajustado eh: R$ $res"
		fi
	 	res=$(echo "scale=2; $din >= 0.01" | bc)
		if (( $res == 1 )); then
			resSal=1
	 	else
	 		resSal=$din
	 	fi
	 done
	 resSal=1
	 espera	
	}

menor() {
	 clear
	 while (( $w != 0 )); do
	 	echo "Digite um numero ou [ 0 ] para sair"
		read n
		if (( $n > 0 )); then
			let pri=($pri+1)
			if (( $pri == 1 )); then
				num=$n
			fi
			if (( $n == $num )); then
				let cont=($cont+1)
			fi
			if (( $n < $num )); then
				cont=1
				num=$n	
			fi
		fi
	 w=$n
	 done
	 echo "O menor numero digitado foi $num, $cont vez(es)"
	 espera
	 w=1
	 pri=0
	 num=0
	 cont=0
	}

salario() {
	   clear
	   while (( $sala != 0 )); do
	   	sal
		res=$(echo "scale=2; $din > $salMaior || $din > $salMedio || $din > $salMenor" | bc)
		if (( $res == 1 )); then
			tmp=$din
		fi
	   	res=$(echo "scale=2; $tmp > $salMaior" | bc)
	   	if (( $res == 1 )); then
	   		tmpSal=$salMaior
			salMaior=$tmp
	   	else
	   		tmpSal=$tmp
	   	fi
	   	res=$(echo "scale=2; $tmpSal > $salMedio && $tmpSal < $salMaior" | bc)
	   	if (( $res == 1 )); then
	   		tmp=$salMedio
			salMedio=$tmpSal
	   	else
			tmp=$tmpSal
	   	fi
           	res=$(echo "scale=2; $tmp > $salMenor && $tmp < $salMedio" | bc)
	   	if (( $res == 1 )); then
	   		salMenor=$tmp
	   	fi
	        res=$(echo "scale=2; $din >= 0.01" | bc)
	   	if (( $res == 1 )); then
	   		sala=1
	   	else
           		sala=0
           	fi
	   done
	   res=$(echo "scale=2; $salMenor > 0" | bc)
           if (( $res == 1 ));then
  	   	echo "O terceiro maior salario eh: R$ $salMenor"
           fi
	   res=$(echo "scale=2; $salMedio > 0" | bc)    
	   if (( $res == 1 )); then  
 		echo "O segundo maior salario eh: R$ $salMedio"
	   fi
	   res=$(echo "scale=2; $salMaior > 0" | bc) 
	   if (( $res == 1 )); then	
  	   	echo "O maior salario eh: R$ $salMaior"
	   fi
           espera
  	   salMaior=0
  	   salMedio=0
  	   salMenor=0
 	  }

while (( $VAR != 6 )); do
	clear
	echo "1) Imprimir os numeros impares"
	echo "2) Maior Numero"
	echo "3) Reajuste Salarial"
	echo "4) Menor Numero"
	echo "5) Os tres maiores salarios"
	echo "6) Sair"
	echo "Digite uma opcao e pressione [ENTER]"
	read VAR

	(( $VAR == 1 )) && pega && impar
	(( $VAR == 2 )) && numeros
	(( $VAR == 3 )) && reSal
	(( $VAR == 4 )) && menor
	(( $VAR == 5 )) && salario && sala=1
	(( $VAR == 6 )) 
done
