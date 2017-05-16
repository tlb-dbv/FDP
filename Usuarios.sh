#!/bin/bash 
######################## Função Menu Principal ###########################
function menu(){
clear
mn=$(dialog --stdout --title "Gerenciamento do Sistema"		\
	    --menu "Escolha uma opção" 0 0 0			\
1 "Gerenciamento de Usuários"					\
2 "Gerenciamento de Arquivos"					\
3 "Gerenciamento de Rede Local"					\
4 "Gerenciamento de Dispositivos"				\
5 "Gerenciamento de Repositórios" 				\
6 "Sair")

case "$mn" in

1)menu1;;
#2) chamar a função grupos
3)menu3;;
#4) chamar a função rede local
#5) chamar função dispositivos

6)clear; #Função que apresenta a barra de progresso de finalizacao do programa 
(
while :
do
cat << EOF
XXX
$counter
Finalizando Processos ( $counter% ):
XXX
EOF
(( counter+=50 ))
[ $counter == 100 ] && break
sleep 1
done
) |
dialog --title "Aguarde um momento" --gauge "Please wait" 7 70 0
clear
exit
########### Fim da função da barra de progresso ########
esac

} 

################ Função Menu Usuário ###########################
function menu1(){
clear
mn1=$(dialog --stdout --title "O que você deseja fazer?"	\
	     --menu "Escolha uma opção" 0 0 0			\
1 "Criar usuário"						\
2 "Deletar usuário"						\
3 "Renomear usuário"						\
4 "Listar usuários"					\
5 "Voltar")

case $mn1 in
1)cuser ;;
2)ruser ;;
3)mvuser ;;
4)lsuser ;;
5)menu ;;

esac
} 
menu
######################## Função Criar Usuário ######################
function cuser(){
clear

user=$(dialog --stdout							\
	      --inputbox "Digite o nome do usuário a ser criado:" 0 50)

	if [ -z $user ]; then
		dialog --aspect 45 --backtitle "Atenção" --msgbox "O campo nome de usuário é obrigatório!!!" 0 0 
		cuser
	fi

################# Solicitação da senha ###############################

	senha=$(dialog --stdout --insecure 		\
		--passwordbox "Digite a senha:" 0 0 )

	if [ -z $senha ]; then
		dialog --aspect 45 --backtitle "Atenção" --msgbox "O campo senha é obrigatório! Tente novamente!" 0 0 
		if [ "$?" == "0" ]; then
		menu1
		else
		menu1
		fi
	fi

	senha1=$(dialog --stdout --insecure		\
		--passwordbox "Confirme a senha:" 0 0 )	\

#################### Comparação das senhas ##########################

	if [ $senha != "$senha1" ]; then
		dialog --yesno "A senha informada não confere!!! \
		Deseja tentar novamente?" 7 40

		if [ "$?" == "0" ]; then
		menu1
		else
		menu1
		fi
	fi

########## Solicitação da confirmação da criação do usuário ##############

	dialog  --title "Confirmação"		\
		--backtitle "Atenção"		\
		--yesno "Você tem certeza que deseja criar o usuário "$user" ?" 7 60

################# Comparação da escolha do usuário Sim ou Não  ##################

if [ "$?" == "0" ]; then

useradd -m -d /home/$user -r -s /bin/bash $user;
(echo $senha; echo $senha) | passwd $user;
dialog	--aspect 45 --msgbox "Usuário "$user" criado com sucesso!" 0 0

else

dialog --msgbox --aspect 45 "Procedimento Cancelado!" 0 0

fi

tail -f /etc/passwd > out &
dialog --title "Lista de usuários" --tailbox out 0 0

menu1
}
menu1

########################### Função Deletar Usuário #####################
function ruser(){
clear

tail -f /etc/passwd > out1 &
dialog --title "Lista de usuários" --tailbox out1 0 0

user=$(dialog --stdout							\
	      --inputbox "Digite o nome do usuário a ser deletado:" 0 50)

################## Verifica se o usuario digitou na caixa de dialogo ######

		if [ -z $user ]; then
		dialog --aspect 40 --backtitle "Atenção" --msgbox "Nome obrigatório!!!" 0 0 
		ruser
		fi
#################### Confirmação  da exclusão do usuario #################

dialog --title "Confirmação"		\
	--backtitle "Atenção"		\
	--yesno "Você tem ceteza que deseja deletar o usuário "$user" ?" 7 50

if [ $? == "0" ]; then

deluser $user

dialog --aspect 50 --msgbox "Usuário "$user" deletado com sucesso!" 0 0

else

dialog --aspect 45 --msgbox "Procedimento Cancelado!" 0 0

fi

########## Lista os usuarios existentes #######################

tail -f /etc/passwd > out1 &
dialog --title "Lista de usuários" --tailbox out1 0 0

menu1

}
menu1
########################### Função Renomear Usuário #####################
function mvuser() {
clear

user=$(dialog --stdout							\
	      --inputbox "Digite o nome do usuário a ser modificado o nome:" 0 60)
mvuser=$(dialog --stdout						\
	        --inputbox "Digite o novo nome do usuário:" 0 50)

dialog --title " Confirmação"	\
	--backtitle "Atenção"	\
	--yesno "Você tem certeza que deseja renomear o usuário "$user" ?" 7 60

##################### Comando para renomear usuário ################

if [ "$?" == "0" ]; then

usermod -l $mvuser $user

dialog --aspect 50 --msgbox "Usuário "$user" renomeado com sucesso!" 0 0

tail -f /etc/passwd > out2 &
dialog --title "Lista de usuários" --tailbox out out2 0 0 

else

dialog --msgbox "Procedimento Cancelado!" 0 0

tail -f /etc/passwd > out2 &
dialog --title "Lista de usuários" --tailbox out out2 0 0 

fi

menu1

}

menu1
########################### Função Listar Usuário #####################
function lsuser(){
clear

tail -f /etc/passwd > out03 &
dialog --title "Lista de usuários" --tailbox out03 0 0

menu1
}
menu1
