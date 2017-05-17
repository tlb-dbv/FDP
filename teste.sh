#!/bin/bash

##############################################################################
#                    TODAS FUNCOES DE TODOS OS MENUS                         # 
##############################################################################

########################### MENU PRINCIPAL ###################################
function mprin() {
clear

mhome=$(dialog --stdout --title "Gerenciamento do Sistema"\
	    --menu "Escolha uma opção" 0 0 0 	\
1 "Gerenciar Usuários"	        \
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

mprin
