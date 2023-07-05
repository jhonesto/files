#!/bin/bash

# nome do arquivo

# le o conteudo do arquivo de entrada
while read line; do

    # descartando linhas vazias
    [[ -z "$line" ]] && continue

    # capta o tamanho da linha
    len=${#line}

    # Se possuir mais de 72 caracteres
    [ "$len" -gt 72 ] && {
        # conta quantas linhas de 72 caracteres serão necessárias
        nlines=$(( $len / 71 ))
        # pega o resto da divisão para saber se é necessário uma linha extra
        resto=$(( $len % 71))
        [ "$resto" -gt 0 ] && nlines=$((nlines+1))

        # cria o contador do for
        cnt=1

        # percorre o número de linhas necessárias
        for (( i = 0; i < "$nlines"; i++ )); do
            # extrai os 71 primeiros caracteres da linha
            line_part="${line:0:71}"
            # grava no arquivo de saida
            echo "$line_part" >> $1.new
            # reinicia a linha remove o trecho já gravado e adiciona novamente o contador
            line=" ${line:71}"
            # atualiza o contador
            cnt=$((cnt+1))
        done
    } || {
        # Se possuir menos de 71 caracteres
        echo "$line" >> $1.new
    }

done < $1
