#!/bin/bash

# Criar pastas do HDFS para 

echo "Criando HDFS de Alunos"
hdfs dfs -mkdir -p /projeto/dados_aluno/alunos


# Executar o Create Tables
echo "Criando as Tabelas de Alunos"
cd scripts/create_tables

echo "Rodando create_tables:"
bash create_tables.sh