#!/bin/bash

##############################################################################
#                    TODAS FUNCOES DE TODOS OS MENU           		     #
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
t=$?
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
4 "Renomear Arquivo"		\
5 "Criar Diretorio"		\
6 "Excluir Diretorio"		\
7 "Compactar Arquivo"		\
8 "Descompactar Arquivo"	\
9 "Voltar")

case $mfile in

1) crif ;;
2) excf ;;
3) movf ;;
4) crid ;;
5) deld ;;
6) renf ;; 
7) comf ;;
8) desf ;;
9) volu ;;
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
mdisp=$(dialog --stdout --title "Gerenciamento de Dispositivo"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Montar Dispositivo"		 \
2 "Desmontar Dispositivo"		 \
3 "Dispositivo Instalado"		 \
4 "Voltar")

case $mdisp in

1) mond ;;
2) desd ;;
3) disi ;;
4) volu ;;
esac
}
################ FIM DO MENU GERENCIAMENTO DE DISPOSITIVO #####################

###################### MENU GERENCIAMENTO DE PACOTES ##########################
grpto(){
mrpto=$(dialog --stdout --title "Gerenciamento de Pacotes"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Instalar Pacote"		 \
2 "Desinstalar Pacote"		 \
3 "Listar Pacotes"		 \
4 "Voltar")

case $mrpto in

1) ipct ;;
2) dpct ;;
3) lpct ;;
4) volu ;;
esac
}
##################### FIM MENU GERENCIAMENTO DE PACOTES #######################

################### MENU GERENCIAMENTO DE PERMISIONAMENTO #####################
gperm(){
mperm=$(dialog --stdout --title "Gerenciamento de Pacotes"\
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Dono de um arquivo"				 \
2 "Grupo de um arquivo"				 \
3 "Permissao de usuario em um arquivo"		 \
4 "Permissao de um grupo em um arquivo"		 \ 
5 "Voltar")

case $mperm in

1) darq ;;
2) garq ;;
3) pusu ;;
4) pgru ;;
5) volu ;;
esac
}
################ FIM DO MENU GERENCIAMENTO DE PERMISSIONAMENTO ################

###################### MENU GERENCIAMENTO DE PROGRAMA #########################
gprgm(){
mprgm=$(dialog --stdout --title "Gerenciamento do Script" \
	    --menu "Escolha uma opcao" 0 0 0 	\
1 "Criar usuario para o script"	 \
2 "Alterar Usuario do script"	 \
3 "Alterar Senha do script"	 \
4 "Deletar Usuario do script"	 \
5 "Nivel de acesso"		 \
6 "Listar Usuarios do script"	 \
7 "Voltar")

case $mprgm in

1) cusp ;;
2) ausp ;;
3) asep ;;
4) dusp ;;
5) nacp ;;
6) lusp ;;
7) volu ;;
esac
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
	dialog --title "Confirma��o" \
	       --backtitle "Aten��o" \
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
		if (( $? == 0 )); then
			if [ -z $user ]; then
				dialog --aspect 40 --backtitle "Atencao" --msgbox "Nome obrigatorio!!!" 0 0 
				excu
			else
				dialog --title "Confirmacao"		\
				--backtitle "Atencao"		\
				--yesno "Voce tem ceteza que deseja deletar o usuario "$user" ?" 7 50
			fi
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
		else
			gusur
		fi
}
###################### FIM DO MENU PARA EXCLUIR USUARIOS ######################

######################## MENU ALTERAR NOME DE USUARIOS ########################
altn(){
clear
	tail -f /etc/passwd > out1 &
	dialog --title "Lista de usuarios" --tailbox out1 0 0
	user=$(dialog --stdout	\
	      --inputbox "Digite o nome do usu�rio a ser modificado:" 0 60)
		if (( $? == 0 )); then
			if [ -z $user ]; then
				dialog --aspect 40 --backtitle "Atencao" --msgbox "Nome obrigatorio!!!" 0 0 
				altn
			else
				musu
			fi
		else
			gusur
		fi
}
musu(){
	mvuser=$(dialog --stdout	\
       		--inputbox "Digite o novo nome do usu�rio:" 0 50)
	if (( $? == 0 )); then
		if [ -z $user ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Nome obrigatorio!!!" 0 0
			musu
		else 
			dialog --title " Confirma��o"	\
				--backtitle "Aten��o"	\
				--yesno "Voc� tem certeza que deseja renomear o usu�rio "$user" ?" 7 60
			if (( $? == 0 )); then
				rena
			else
				gusur
			fi
		fi
	else
		gusur
	fi
}
##################### Comando para renomear usu�rio ################
rena() {
	usermod -l $mvuser $user
	t=$?
	if (( $t != 0 )); then
		dialog --aspect 50 --msgbox "Usu�rio "$user" nao existe!" 0 0
			gusur
 
	else
		dialog --aspect 50 --msgbox "Usu�rio "$user" renomeado para $mvuser" 0 0
		gusur
	fi
#	else
#		dialog --msgbox "Procedimento Cancelado!" 0 0
#		gusur
#	fi

}

##################### FIM DO MENU ALTERAR NOME DE USUARIOS ####################

####################### MENU ALTERAR SENHA DE USUARIOS ########################
alts(){
	dialog --stdout --msgbox "4" 0 0
}
################### FIM DO MENU ALTERAR SENHA DE USUARIOS #####################

######################## MENU LISTAR TODOS OS USUARIOS #########################
list(){
	tail -f /etc/passwd > out1 &
	dialog --title "Lista de usuarios" --tailbox out1 0 0
	gusur
}
##################### FIM DO MENU LISTAR TODOS OS USUARIOS #####################

################################# MENU VOLTAR ##################################
volu(){
	mprin
}
############################## FIM DO MENU VOLTAR ##############################

################### MENU CRIAR ARQUIVO ##############################
crif (){
	clear
	arq=$(dialog --stdout \
		--inputbox "Digite o nome do arquivo a ser criado:" 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $arq ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Digite um nome para o arquivo!!!" 0 0
			crif
		else
			caminho=$(dialog --title "Criar arquivo" \
			--stdout --title "Selecione o local onde sera salvo o arquivo" \
			--fselect /home/ 0 0)

			dialog --title "Confirma��o" \
			--backtitle "Aten��o" \
			--yesno "Voc� tem certeza que deseja criar o arquivo? $arq no $caminho" 7 50
		fi
	else
		gfile
	fi
		if [ "$?" == "0" ]; then
			> $caminho$arq
			dialog --msgbox "Arquivo criado com sucesso!" 0 0
			ls -la $caminho$arq > out4 &
			dialog --title "Lista de arquivos" --tailbox out4 0 0
			gfile
		else
			dialog --msgbox "Procedimento Cancelado!" 0 0
			gfile
		fi
}

################################ Fun��o Deletar Arquivos ####################################
	
excf (){
	clear
		delf=$(dialog --title "Deletar arquivo" \
		--stdout --title "Selecione o arquivo a ser deletado" \
		--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $delf ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um arquivo a ser deletado!" 0 0
			excf
		else
			dialog --title "Confirma��o" \
			--backtitle "Aten��o" \
			--yesno "Voc� tem certeza que deseja deletar o arquivo?" 7 50
			if [ "$?" == "0" ]; then
				rm $delf
				dialog --msgbox "Arquivo deletado com sucesso!" 0 0
				ls -la $delf > out5 &
				dialog --title "Lista de arquivos" --tailbox out5 0 0
				gfile	
			else
				dialog --msgbox "Procedimento Cancelado!" 0 0
				gfile
			fi
		fi
	else
		gfile
	fi
}
########################### Fun��o Mover Arquivos ####################################
movf (){
	clear
	mova=$(dialog --title "Mover arquivo" \
	--stdout --title "Selecione o arquivo a ser movido" \
	--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $mova ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha o arquivo!" 0 0
			movf
		else
			locf
		fi
	else
		gfile
	fi
}
locf (){
	loca=$(dialog --title "Local da movimentacao do arquivo" \
	--stdout --title "Selecione o local que o arquivo sera movido" \
	--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $loca ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um local!" 0 0
			locf
		else	
			dialog --title "Confirma��o" \
			--backtitle "Aten��o" \
			--yesno "Voc� tem certeza que deseja mover o arquivo $mova para o local $loca ?" 7 50
		fi
		if [ "$?" == "0" ]; then
			mv $mova $loca	
			dialog --msgbox "Arquivo renomeado com sucesso!" 0 0
			ls -la $loca > out6 &
			dialog --title "Lista de arquivos" --tailbox out6 0 0
			gfile
		else
			dialog --msgbox "Procedimento Cancelado!" 0 0
			gfile
		fi
	else
		gfile
	fi
}
################################ Fun��o Renomear Arquivos ####################################
renf() {
	rena=$(dialog --title "Renomear arquivo" \
	--stdout --title "Selecione o arquivo que sera renomeado" \
	--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $rena ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um arquivo!" 0 0
			renf
		else
			filr
		fi
	else
		gfile
	fi
}
filr() {
	arqn=$(dialog --stdout \
		--inputbox "Digite o novo nome do arquivo:" 0 0)
		t=$?
	if (( $t == 0 )); then
		if [ -z $arqn ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um novo nome para o arquivo!" 0 0
			filr
		else
			dialog --title "Confirma��o" \
			--backtitle "Aten��o" \
			--yesno "Voc� tem certeza que deseja renomear o arquivo $rena para o local $arqn ?" 7 50
		fi
		if [ "$?" == "0" ]; then
			cp $rena $arqn
			rm $rena	
			dialog --msgbox "Arquivo renomeado com sucesso!" 0 0
			gfile
		else
			dialog --msgbox "Procedimento Cancelado!" 0 0
			gfile
		fi
	else
		gfile
	fi
}

#crid() {

#}

#deld() {

#}
####################### Compactar Arquivo #############################	
comf() {
	comp=$(dialog --title "Compactar arquivo" \
	--stdout --title "Selecione o arquivo que sera compactado" \
	--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $comp ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um arquivo!" 0 0
			comf
		else
			coma
		fi
	else
		gfile
	fi	
}
coma() {
	narq=$(dialog --stdout \
	--inputbox "Digite o novo nome do arquivo:" 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $narq ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um nome para o arquivo compactado!" 0 0
			coma
		else
			arql
		fi
	else
		gfile
	fi
}
arql() {
	loar=$(dialog --title "Compactar arquivo" \
	--stdout --title "Selecione o local que sera armazenado o arquivo compactado" \
	--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $loar ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um arquivo!" 0 0
			arql
		else
			tar -cvf $loar/$narq $comp
			t=$?
			if (( $t == 2 ));then
				dialog --title "Confirma��o" \
				--backtitle "Aten��o" \
				--yesno "Gostaria de criar o diretorio ?" 7 50
				if (( $? == 0 )); then
					mkdir $loar
					tar -cvf $loar/$narq $comp
					gfile
				else
					gfile
				fi
			else
				dialog --aspect 40 --backtitle "Atencao" --msgbox "Arquivo compactado com sucesso"
				gfile
			fi
		fi
		gfile
	fi
}

desf() {
desc=$(dialog --title "Descompactar arquivo" \
	      --stdout --title "Selecione o arquivo a ser descompactado" \
	      --fselect /home/ 0 0)
	      t=$?
	      if (( $t == 0 )); then
			if [ -z $desc ]; then
				dialog --aspect 40 --backtitle "Atencao" --msgbox "Escolha um arquivo a ser descompactado!" 0 0
				desf
			else
				desl
			fi
	      else
			gfile
	      fi
}
desl() {
locd=$(dialog --title "Descompactar arquivo" \
	--stdout --title "Selecione o destino da descompacta��o do arquivo" \
	--fselect /home/ 0 0)
	t=$?
	if (( $t == 0 )); then
		if [ -z $locd ]; then
			dialog --aspect 40 --backtitle "Atencao" --msgbox "E necessario escolher um local!" 0 0
			desl
		else
			tar -xvf $desc -C $locd
			gfile
		fi
	else
		gfile
	fi
}
mprin


####################### MENU PERMISSIONAMENTO DE USUARIOS #######################
#perm(){
#	dialog --stdout --msgbox "1" 0 0
#}
#################### FIM DO MENU PERMISSIONAMENTO DE USUARIO ###################

##############################################################################
#                 FIM DAS FUNCOES DO MENU PRINCIPAL	                     #
##############################################################################


################################ Fun��o Criar Arquivos ####################################
