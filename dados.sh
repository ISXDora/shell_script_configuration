#!/bin/bash
# dados é um script para criação dos diretórios e permissão dos usuarios da rede Ame com Feltro
# Autor: Isadora Xavier | Email: isadoraxavier@hotmail.com
echo"Criação de diretórios da rede"
[-e /srv] || mkdir -v -p /srv
mkdir -p -v /srv/amecomfeltro/financeiro criacao operacional comercial diretoria usuarios
echo

echo"Criação dos diretórios dos usuários:"
cd /srv/amecomfeltro/usuarios
mkdir -p isadora kaell maria maya ana aline fatima leonardo marcus wallyson

#Definindo regras e permissões para arquivos e diretórios:
#No direótio principal da rede ninguém pode escrever:
echo"No diretório da empresa ninguém pode gravar:`ls -l`"
chmod 555 /srv/amecomfeltro

#Criando usuarios:
echo "Lista de usuários"

sudo adduser isadora
sudo adduser kaell
sudo adduser maria
sudo adduser maya
sudo adduser ana
sudo adduser aline
sudo adduser fatima
sudo adduser leonardo
sudo adduser marcus
sudo adduser wallyson

#Criação dos grupos
echo "Setores:`cat /etc/group`"

sudo groupadd financeiro
sudo groupadd criacao
sudo groupadd diretoria
sudo groupadd operacional
sudo groupadd comercial

#Distribuindo os usuarios nos grupos:
echo "Grupos de usuários`cat /etc/passwd`"

adduser isadora diretoria
adduser maria diretoria
adduser kaell financeiro
adduser maya financeiro
adduser leonardo operacional
adduser marcus operacional
adduser ana criacao
adduser aline criacao
adduser fatima comercial
adduser wallyson comercial

#Alterando usuarios e permissões dos diretorios:
echo "Organizando grupos e diretórios:"

chown diretoria /srv/amecomfeltro/diretoria
chown criacao /srv/amecomfeltro/criacao
chown operacional /srv/amecomfeltro/operacional
chown financeiro /srv/amecomfeltro/financeiro
chown comercial /srv/amecomfeltro/comercial
cd /srv/amecomfeltro;ls -l

#No diterório de cada setor, somente os  funcionários daquele setor podem escrever, outros só
#ler e listar.
echo "Permissões do setor"
chmod 1775 /srv/amecomfeltro/diretoria
chmod 1775 /srv/amecomfeltro/criacao
chmod 1775 /srv/amecomfeltro/operacional
chmod 1775 /srv/amecomfeltro/financeiro
chmod 1775 /srv/amecomfeltro/comercial
cd /srv/amecomfeltro;ls -l

#Ninguem pode deletar
echo "Aqui permito o sticky bit funcionar"
cd /srv/amecomfeltro/
chown root diretoria
chown root operacional
chown root comercial
chown root financeiro
chown root criacao
ls -l

#Permissão diretório dos usuários:
echo "Permissões dos usuários:"
chmod 700 /srv/amecomfeltro/usuarios/isadora
chmod 700 /srv/amecomfeltro/usuarios/maria
chmod 700 /srv/amecomfeltro/usuarios/kaell
chmod 700 /srv/amecomfeltro/usuarios/maya
chmod 700 /srv/amecomfeltro/usuarios/leonardo
chmod 700 /srv/amecomfeltro/usuarios/marcus
chmod 700 /srv/amecomfeltro/usuarios/ana
chmod 700 /srv/amecomfeltro/usuarios/aline
chmod 700 /srv/amecomfeltro/usuarios/fatima
chmod 700 /srv/amecomfeltro/usuarios/wallyson
ls -l

echo "Pastas dos usuários:"
cd /srv/amecomfeltro/usuarios
chown isadora isadora
chown maria maria
chown kaell kaell
chown maya maya
chown leonardo leonardo
chown marcus marcus
chown ana ana
chown aline aline
chown fatima fatima
chown wallyson wallyson
