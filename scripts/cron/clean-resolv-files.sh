#!/usr/bin/env sh

if ls /etc/resolv.conf.* &>/dev/null; then

  echo "<6>info: Execução da limpeza semanal dos arquivos resolv.conf.* iniciada" > /dev/kmsg

  if rm /etc/resolv.conf.* &>/dev/null; then
  
    echo "<6>info: Uma limpeza nos arquivos /etc/resolv.conf.* foi realizada com sucesso!" > /dev/kmsg

  else

    echo "<4>warn: Erro ao remover arquivos /etc/resolv.conf.*" > /dev/kmsg

  fi

fi
