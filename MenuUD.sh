#!/bin/bash

##############################################################################
#                    TODAS FUNCOES DE TODOS OS MENU                          #
##############################################################################

########################### MENU PRINCIPAL ###################################
function mprin() {
clear

mhome=$(dialog --stdout --title "Gerenciamento do Sistema"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Gerenciar Usuarios"	        \
2 "Gerenciar Grupos"		\
3 "Gerenciar Arquivos"		\
4 "Gerenciar Rede Local"	\
5 "Gerenciar Dispositivos"	\
6 "Gerenciar Repositorio"	\
7 "Gerenciar Permissionamento"	\
8 "Gerenciar Script"		\
9 "Sair")

case $mhome in

1) gusur ;;
2) ggrup ;;
3) gfile ;;
4) grede ;;
5) gdisp ;;
6) grpto ;;
7) gperm ;;
8) gprgm ;;
9) exit ;;
esac
}
######################## FIM DO MENU PRINCIPAL ###############################

####################### MENU GERENCIAMENTO DE USUARIO ########################
gusur(){
musur=$(dialog --stdout --title "Gerenciamento de Usuarios"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Criar usuarios"		\
2 "Excluir usuarios"		\
3 "Alterar nome do usuario"	\
4 "Alterar senha do usuario"	\
5 "Listar usuarios"		\
6 "Voltar")

case $musur in

1) criu ;;
2) excu ;;
3) altn ;;
4) alts ;;
5) list ;;
6) volu ;;
esac
}
################### FIM DO MENU GERENCIAMENTO DE USUARIO ######################

###################### MENU GERENCIAMENTO DE GRUPOS ###########################
ggrup(){
mgrup=$(dialog --stdout --title "Gerenciamento de Grupos"\
	    --menu "Escolha uma opcao" 0 0 0 \
1 "Criar Grupo"			\
2 "Excluir Grupo"		\
3 "Adicionar Usuario no Grupo"	\
4 "Remover Usuario no Grupo"	\
5 "Listar Grupos"		\
6 "Voltar")

case $mgrup in

1) crig ;;
2) excg ;;
3) adug ;;
4) exug ;;
5) lisg ;;
6) volu ;;
esac
}
################## FIM DO MENU GERENCIAMENTO DE GRUPOS ########################

#################### MENU GERENCIAMENTO DE ARQUIVOS ###########################
gfile(){
mfile=$(dialog --stdout --title "Gerenciamento de Arquivos"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Criar Arquivo"		\
2 "Excluir Arquivo"		\
3 "Movimentar Arquivo"		\
4 "Compactar Arquivo"		\
5 "Descompactar Arquivo"	\
6 "Voltar")

case $mfile in

1) crif ;;
2) excf ;;
3) movf ;;
4) comf ;;
5) desf ;;
6) volu ;;
esac

}
################## FIM DO MENU GERENIAMENTO DE ARQUIVOS ######################

################## MENU GERENCIAMENTO DE REDES ######################
grede(){
mrede=$(dialog --stdout --title "Gerenciamento de Interface de Rede"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Configurar IP"		 \
2 "Configurar Mask"		 \
3 "Configurar Gateway"		 \
4 "Configurar Brodcast"		 \
5 "Configurar ID da rede"	 \
6 "Configurar o Nome da Maquina" \
7 "Voltar")

case $mrede in

1) coip ;;
2) coma ;;
3) coga ;;
4) cobr ;;
5) coid ;;
6) conh ;;
7) volu ;;
esac
}
##################### FIM DO MENU GERENCIAMENTO DE REDES ######################

##################### MENU GERENCIAMENTO DE DISPOSITIVO #######################
gdisp(){
	dialog --stdout --msgbox "dispositivo" 0 0
}
################ FIM DO MENU GERENCIAMENTO DE DISPOSITIVO #####################

###################### MENU GERENCIAMENTO DE PACOTES ##########################
grpto(){
	dialog --stdout --msgbox "pacote" 0 0
}
##################### FIM MENU GERENCIAMENTO DE PACOTES #######################

################### MENU GERENCIAMENTO DE PERMISIONAMENTO #####################
gperm(){
	dialog --stdout --msgbox "permissionamento" 0 0	
}
################ FIM DO MENU GERENCIAMENTO DE PERMISSIONAMENTO ################

###################### MENU GERENCIAMENTO DE PROGRAMA #########################
gprgm(){
	dialog --stdout --msgbox "shell" 0 0	
}
#################### FIM DO MENU GERENCIAMENTO DE PROGRAMA #####################


########################## MENU CRIACAO DE USUARIOS ############################
criu(){
	clear

	user=$(dialog --stdout	\
	--inputbox "Digite o nome do usuario a ser criado:" 0 50)
	t=$?
	if (( $t == 0 )); then
		if [ -z $user ]; then
			dialog --aspect 45 --backtitle "Atencao" --msgbox "O campo nome de usuario e obrigatorio!!!" 0 0 
			criu
		fi
	else
		gusur
	fi
		cris
}
################# Solicitacao da senha ###############################

cris(){
	senha=$(dialog --stdout --insecure 		\
		--passwordbox "Digite a senha:" 0 0 )
		t=$?
	if (( $t == 0 )); then
		if [ -z $senha ]; then
			dialog --aspect 45 --backtitle "Atencao" --msgbox "O campo senha e obrigatorio! Tente novamente!" 0 0
			cris
		else
			reps
		fi
	else
		gusur
	fi
}

reps(){
	senha1=$(dialog --stdout --insecure 		\
		--passwordbox "Confirme a senha:" 0 0 )
		t=$?
	if (( $t == 0 )); then
		if [ -z $senha ]; then
			dialog --aspect 45 --backtitle "Atencao" --msgbox "E obrigatorio repetir a senha! Tente novamente!" 0 0
			reps
		else
			cons
		fi
	else
		gusur
	fi
}
cons() {
	if [ "$senha" != "$senha1" ]; then
		dialog --yes-label Sim --no-label Nao --yesno "As senhas nao sao iguais!!! \
		Deseja tentar novamente?" 7 40
		t=$?
		if (( $t == 0 )); then
			cris
		else
			gusur
		fi
	else
		conc
	fi
}
conc() {
	dialog --title "Confirmação" \
	       --backtitle "Atenção" \
	       --yes-label Sim --no-label Nao --yesno "Voce tem certeza que deseja criar o usuario "$user" ?" 7 60
	t=$?
	#dialog --msgbox "$t" 0 0
	if [ "$t" == "0" ]; then
		useradd -m -d /home/$user -r -s /bin/bash $user
		(echo $senha; echo $senha) | passwd $user
		dialog --msgbox --aspect 45 "Usuario $user criado com sucesso!" 0 0
		tail -f /etc/passwd > out &
		dialog --title "Lista de usuarios" --textbox out 30 30
		gusur
	else
		dialog --msgbox --aspect 45 "Procedimento cancelado!" 0 0
		gusur
	fi
}
######################### FIM DO MENU CRIACAO DE USUARIO ######################

######################## MENU PARA EXCLUIR USUARIOS ###########################
excu(){
	clear

	tail -f /etc/passwd > out1 &
	dialog --title "Lista de usuarios" --tailbox out1 0 0
	user=$(dialog --stdout	\
		--inputbox "Digite o nome do usuario a ser deletado:" 0 50)

################## Verifica se o usuario digitou na caixa de dialogo ######

		if [ -z $user ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Nome obrigatorio!!!" 0 0 
			excu
		fi
#################### Confirmacao  da exclusao do usuario #################

	dialog --title "Confirmacao"		\
		--backtitle "Atencao"		\
		--yesno "Voce tem ceteza que deseja deletar o usuario "$user" ?" 7 50

	if [ "$?" == "0" ]; then
		deluser $user
		t=$?
		if (( $t != 0 )); then
			dialog --aspect 50 --msgbox "Usuario "$user" nao existe!" 0 0
			gusur
		else
			dialog --aspect 50 --msgbox "Usuario "$user" deletado com sucesso!" 0 0
			gusur

		fi
	else

		dialog --aspect 45 --msgbox "Procedimento Cancelado!" 0 0
		gusur
	fi
}
###################### FIM DO MENU PARA EXCLUIR USUARIOS ######################

######################## MENU ALTERAR NOME DE USUARIOS ########################
altn(){
	dialog --stdout --msgbox "3" 0 0
}
##################### FIM DO MENU ALTERAR NOME DE USUARIOS ####################

####################### MENU ALTERAR SENHA DE USUARIOS ########################
alts(){
	dialog --stdout --msgbox "4" 0 0
}
################### FIM DO MENU ALTERAR SENHA DE USUARIOS #####################

######################## MENU LISTAR TODOS OS USUARIOS #########################
list(){
	dialog --stdout --msgbox "5" 0 0
}
##################### FIM DO MENU LISTAR TODOS OS USUARIOS #####################

################################# MENU VOLTAR ##################################
volu(){
	mprin
}
############################## FIM DO MENU VOLTAR ##############################
mprin


####################### MENU PERMISSIONAMENTO DE USUARIOS #######################
#perm(){
#	dialog --stdout --msgbox "1" 0 0
#}
#################### FIM DO MENU PERMISSIONAMENTO DE USUARIO ###################

##############################################################################
#                 FIM DAS FUNCOES DO MENU PRINCIPAL	                     #
##############################################################################


















