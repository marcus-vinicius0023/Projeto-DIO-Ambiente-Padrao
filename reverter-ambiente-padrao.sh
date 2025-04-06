#!/bin/bash

#Testa se o usuario e o root, caso não seja ira executar o comando sudo.
if [ "$UID" -ne 0 ]; then
        echo "Permissões de administrador são requisitadas."
        sudo "$0" "$@"
        exit
fi

#Caso o usuario sejá root - ou após a execução do sudo -, irá pedir uma confirmação, se de fato o usuário dejesa executar o script.
if [ "$UID" = 0 ];then

        echo "O comando a seguir ira remover todas as adições feitas pelo código de ambiente padrão. Deseja prosseguir? S/N:"
        read resposta

        while true; do
                if [[ "$resposta" == "s" ||  "$resposta" == "n" ]]; then
                         break
                fi
                echo -e "\e[31mDigite um valor valido!! Use 's' ou 'n':\e[0m" 
                read resposta
        done

        [ "$resposta" = "n" ] && exit
fi


#Remoção de todos os usuários
userdel -r -f carlos
userdel -r -f maria
userdel -r -f joao
userdel -r -f debora
userdel -r -f sebastiana
userdel -r -f roberto
userdel -r -f josefina
userdel -r -f amanda
userdel -r -f rogerio

echo -e "\e[31mTodos usuários foram aniquilados!\e[0m"


#Apaga a pasta workspace, junto com todos os diretórios contidos dentro dela
rm -rfv /workspace

echo -e "\e[31mPasta workspace obliterada, junto com tudo que havia dentro!\e[0m"


#Remoção de todos os grupos
groupdel -f GRP_PUB
echo "Grupo pub, esmagado"
groupdel -f GRP_ADM
echo "Grupo amd. Acabou.."
groupdel -f GRP_VEN
echo "Grupo ven, já era"
groupdel -f GRP_SEC
echo "Grupo sec não respira mais"

echo -e "\e[31mTodos os grupos foram destroçados!\e[0m"


echo -e "\e[32mPrograma finalizado com sucesso!!\e[0m"
echo -e "\e[32mTenha um bom dia!\e[0m"
