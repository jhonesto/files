#!/bin/bash

arquivo=/etc/resolv.conf
arquivoOrig=/root/prod/resolv.conf

if [ -f "$arquivo" ] 
then
    if [ -d "$arquivo" ] 
    then
#      echo "$arquivo é um diretório!"
      exit 1
    else
#      echo "$arquivo existe!"
      old_digest="$(md5sum $arquivo | cut -d ' ' -f 1)"
    fi
else
#  echo "$arquivo não existe!"
  exit 1
fi

new_digest="$(md5sum $arquivoOrig | cut	-d ' ' -f 1)"

if [ "$old_digest" != "$new_digest" ] 
then
  if cp $arquivoOrig $arquivo
  then
    echo "<6>info: O $arquivo foi substituindo pelo $arquivoOrig." > /dev/kmsg
  else
    echo "<4>warn: Erro ao substituir o arquivo $arquivo pelo $arquivoOrig." > /dev/kmsg
  fi
fi
