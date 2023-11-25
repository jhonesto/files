#!/bin/sh


notify (){
  notify-send -t $1 -h int:value:$2 -h string:bgcolor:#f0f0f0 -h string:fgcolor:#4444ff "$3"
}

# definindo um contador de 1 a 100
for i in `seq 1 100`
do
	# enviando a notificação com o progresso da barra
	notify 150 $i "Processando ..."
	# tempo de espera entre cada notificação
	sleep 0.1
done
# mensagem de finalização
notify 300 $i "Barra de progresso finalizada com sucesso!"
