#!/bin/bash

# Nome: Aleff Martins dos Santos
# Ra: 1411420138
# Sript para formatar pendrive
# Data: 02/11

# Função de tratamento de erro
function _erro() {
  if [[ $? -ne 0 ]]
   then
       echo
       echo "Ocorreu um erro!"
   else 
       echo
       echo "Formatação Concluída -> Dispositivo de nome $nome localizado em /dev/$dipLocal no formato $tipoFormat"
fi
}

clear # Limpa o terminal

echo "Procure na lista abaixo o local onde seu pendrive foi montado (exemplo: sda, sdb, sdc)"

echo
df -H # Lista partições e dispositivos do sistemas

echo 
echo "Informe o local: "
read dipLocal; # Captura a entrada de dados

echo 
echo "Qual o formato com que deseja formatar o seu dispositivo (exemplo: vfat, ext4, ntfs...)?"
read tipoFormat; # Captura a entrada de dados

echo 
echo "Qual o nome que deseja dar ao seu dispositivo?"
read nome; # Captura a entrada de dados

echo 
echo "Informe a senha do usuario para desmontar o pendrive: "
sudo umount /dev/$dipLocal # Demonta o dispositivo

echo 
echo "Formatando o pendrive"

if [ "$tipoFormat" == "ntfs" ]; then
        sudo mkfs.ntfs -F /dev/$dipLocal # Formata o dispotivo no formato ntfs
        _erro
    else
        sudo mkfs.$tipoFormat -n $nome -I /dev/$dipLocal # Formata o dispotivo em outros formatos
        _erro
fi
 






