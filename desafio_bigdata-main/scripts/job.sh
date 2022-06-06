#!/bin/bash

echo "Verificando as datas de cada arquivo"

# Entrando no diretorio que contem os dados
cd /input/desafio_bigdata-main/dados/

# Salvando o número de diretorios dentro de uma váriavel 
n_diretorios=$(ls | wc -l)

# Obtendo o valor da data atual
d_hoje=$(date +%Y-%m-%d)
d_hoje=$(date --date=$d_hoje +%s)

for ((i=1;i<=$n_diretorios;i++)); do
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
    # Verificando a existência de arquivo no direotrio do HDFS
    isEmptyIn=$(hdfs dfs -count /dados/indiana_jones/in | awk '{print $2}')
    if [ $isEmptyIn -eq 0 ];then
        echo "Diretorio in vazio"
        hdfs dfs -put dados_cliente.txt /dados/indiana_jones/in
    else
        echo "Há arquivos no diretorio in"
        # Verifica se o diretorio process tá vazio
        isEmptyProcess=$(hdfs dfs -count /dados/indiana_jones/process | awk '{print $2}')
        if [ $isEmptyProcess -eq 0 ];then
            echo "Diretorio process vazio"
            # Movendo os arquivos do diretorio in para o process
            hdfs dfs -mv /dados/indiana_jones/in/dados_cliente.txt /dados/indiana_jones/process
            # Movendo o novo arquivo de ingestão para o diretorio in
            hdfs dfs -put dados_cliente.txt /dados/indiana_jones/in
        else
            echo "Há arquivos no diretorio process"
            # Movendo o arquivo existente no diretorio process para delete
            hdfs dfs -mv /dados/indiana_jones/process/dados_cliente.txt /dados/indiana_jones/delete
            # Movendo o arquivo eixistente no direotrio in para o process
            hdfs dfs -mv /dados/indiana_jones/in/dados_cliente.txt /dados/indiana_jones/process
            # Movendo o novo arquivo de ingestão para o diretorio in
            hdfs dfs -put dados_cliente.txt /dados/indiana_jones/in
        fi
    fi


    #Retornando ao diretorio 
    cd ..
    data_arq_mais_recent=$seg
    done
