#!/bin/bash

echo "aqui vc usara para colocar toda a criação de pastas que vc achar necessario"

echo "Criando as pastas no HDFS"
hdfs dfs -mkdir -p /dados
hdfs dfs -mkdir -p /dados/indiana_jones
hdfs dfs -mkdir -p /dados/indiana_jones/in
hdfs dfs -mkdir -p /dados/indiana_jones/process
hdfs dfs -mkdir -p /dados/indiana_jones/delete

echo "Criacao de pastas concluida"

echo "Dando permissao para o job"

chmod +x job.sh

echo "Permissao concedida com sucesso"
