#!/bin/bash

#Executa um sudo caso o comando não seja chamado a partir do root
[ "$UID" -ne 0 ] && echo "O comando a seguir exige permissões de adm. Insira sua senha de administrador para prosseguir:"
[ "$UID" -ne 0 ] && exec sudo -k "$0" "&@" #O -k e para forçar o pedido da senha sudo, caso o usuário a tenha utilizado recentemente.


#Criação da pasta workspace + criação das pastas de grupo
mkdir /workspace

mkdir /workspace/publico
mkdir /workspace/adm
mkdir /workspace/ven
mkdir /workspace/sec

echo -e "\e[32mPastas de grupo criadas com sucesso!!\e[0m"

#Criação dos grupos
groupadd GRP_PUB
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

echo -e "\e[32mGrupos criados com sucesso!!\e[0m"

#Criação dos usuários
useradd -s /bin/bash -c "Carlos Duarte" -m carlos #Criação do usuário, definindo o bash e criando a pasta home.
echo "carlos:senha123" | chpasswd #Adicionando uma senha. Senha essa feita apenas para o primeiro login, logo abaixo expiro a senha para que assim o próprio usuário possa cria-la.
passwd -e carlos #Comando da expiração de senha.

useradd -s /bin/bash -c "Maria dos Santos" -m maria
echo "maria:senha123" | chpasswd
passwd -e maria

useradd -s /bin/bash -c "João Ribeiro" -m joao
echo "joao:senha123" | chpasswd
passwd -e joao

useradd -s /bin/bash -c "Débora da Silva" -m debora
echo "debora:senha123" | chpasswd
passwd -e debora

useradd -s /bin/bash -c "Sebastiana Alcantra" -m sebastiana
echo "sebastiana:senha123" | chpasswd
passwd -e sebastiana

useradd -s /bin/bash -c "Roberto Carlos" -m roberto
echo "roberto:senha123" | chpasswd
passwd -e roberto

useradd -s /bin/bash -c "Josefina dos Anjos" -m josefina
echo "josefina:senha123" | chpasswd
passwd -e josefina

useradd -s /bin/bash -c "Amanda Castro" -m amanda
echo "amanda:senha123" | chpasswd
passwd -e amanda

useradd -s /bin/bash -c "Rogério de Almeida" -m rogerio
echo "rogerio:senha123" | chpasswd
passwd -e rogerio

echo -e "\e[32mUsuarios cadastrados com sucesso!!\e[0m"


#Configuração de permissões das pastas
chmod 775 /workspace/publico
chmod 770 /workspace/adm
chmod 770 /workspace/ven
chmod 770 /workspace/sec

#Adicionando os respectivos grupos a cada pasta
chown root:GRP_PUB /workspace/publico
chown root:GRP_ADM /workspace/adm
chown root:GRP_VEN /workspace/ven
chown root:GRP_SEC /workspace/sec

echo -e "\e[32mConfigurações de grupo realizadas com sucesso!!\e[0m"


#Adicionando os usuários aos seus grupos
usermod -G GRP_PUB,GRP_ADM carlos
usermod -G GRP_PUB,GRP_ADM maria
usermod -G GRP_PUB,GRP_ADM joao

usermod -G GRP_PUB,GRP_VEN debora
usermod -G GRP_PUB,GRP_VEN sebastiana
usermod -G GRP_PUB,GRP_VEN roberto

usermod -G GRP_PUB,GRP_SEC josefina
usermod -G GRP_PUB,GRP_SEC amanda
usermod -G GRP_PUB,GRP_SEC rogerio

echo -e "\e[32mUsuarios adicionados aos seus grupos com sucesso!!\e[0m"


echo "Programa finalizado."

