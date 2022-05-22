#!/bin/bash

echo "Verificando as datas de cada arquivo"

# Entrando no diretorio que contem os dados
cd /input/desafio_bigdata-main/dados/

# Salvando o número de diretorios dentro de uma váriavel 
n_diretorios=$(ls | wc -l)

# Obtendo o valor da data atual
d_hoje=$(date +%Y-%m-%d)
d_hoje=$(date --date=$d_hoje +%s)

for ((i=1;i<=$n_diretorios;i++))
    do
    # Criando os nomes dos diretorios
    nome_diretorio=$i"_ingestao"
    echo $nome_diretorio
    # Acessando os diretorios
    cd $nome_diretorio
    # Verificando a quantos dias os arquivos foram criados
    data=$(stat -c %y "dados_cliente.txt")
    data=${data:0:10}
    data=$(date --date=$data +%s)
    seg=$(($d_hoje-$data)) 
    echo $seg

    if []


    #Retornando ao diretorio 
    cd ..
    data_arq_mais_recent=$seg
    done
