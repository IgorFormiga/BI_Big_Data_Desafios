
HDFS_DIR="/projeto/dados_aluno/alunos/"
NOME_PASTA=$1
echo "------------------------------------------"
echo $NOME_PASTA
echo "------------------------------------------"

echo "Efetuando a 1 ingestão na tabela de alunos"
cd ../dados/${NOME_PASTA}
hdfs dfs -put -f alunos.csv ${HDFS_DIR}


# você devera após fazer os testes criar a segunda ingestão