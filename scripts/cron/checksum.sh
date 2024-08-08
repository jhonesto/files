#!/usr/bin/env bash

arquivo=${1:-/dev/null}
arquivoOrig=${2:-/dev/null}

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

if [ -f "$arquivoOrig" ] 
then
    if [ -d "$arquivoOrig" ] 
    then
#      echo "$arquivoOrig é um diretório!"
      exit 1
    else
#      echo "$arquivoOrig existe!"
      new_digest="$(md5sum $arquivoOrig | cut	-d ' ' -f 1)"
    fi
else
#  echo "$arquivoOrig não existe!"
  exit 1
fi

nomeArquivo=${arquivo##*/}
nomeArquivoOrig=${arquivoOrig##*/}

if [ "$nomeArquivo" != "$nomeArquivoOrig" ]
then
	echo "$nomeArquivo diferente de $nomeArquivoOrig"
	exit 1
fi

if [ "$old_digest" != "$new_digest" ] 
then
  if cp $arquivoOrig $arquivo
  then
    echo "<6>info: O $arquivo foi substituindo pelo $arquivoOrig." > /dev/kmsg
  else
    echo "<4>warn: Erro ao substituir o arquivo $arquivo pelo $arquivoOrig." > /dev/kmsg
  fi
fi
