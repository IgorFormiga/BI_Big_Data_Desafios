#!/bin/bash

echo "Carregando Variáveis"
HDFS_DIR="/projeto/dados_aluno/alunos"
TARGET_DATABASE="desafio_hive"
TARGET_TABLE_EXTERNAL="alunos_curso_external"
TARGET_TABLE="alunos_curso"
DT_FOTO="$(date --date="-1 day" "+%Y-%m-%d")"


# Script eh usado para efetuar a criação das tabelas

# CRIACAO DA TABELA EXTERNA
echo "Criando tabela externa"
beeline -u jdbc:hive2://localhost:10000 \
 --hivevar TARGET_DATABASE="${TARGET_DATABASE}"\
 --hivevar HDFS_DIR="${HDFS_DIR}"\
 --hivevar TARGET_TABLE="${TARGET_TABLE_EXTERNAL}"\
 -f ../../hqls/create-external-table-alunos-stg.hql 

# CRIACAO DA TABELA WORKED
echo "Criando tabela worked"
beeline -u jdbc:hive2://localhost:10000 \
 --hivevar TARGET_DATABASE="${TARGET_DATABASE}"\
 --hivevar TARGET_TABLE="${TARGET_TABLE}" \
 -f ../../hqls/create-managed-table-alunos-wrk.hql 