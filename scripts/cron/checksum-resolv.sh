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
  echo "O $arquivo foi alterado, substituindo pelo $arquivoOrig" > /dev/kmsg
  cp "$arquivoOrig" "$arquivo"
fi
