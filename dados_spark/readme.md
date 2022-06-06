# ATIVIDADE DE LIMPEZA DE DADOS UTILIZANDO SPARK

1 - Entrar no servidor do spark
$ docker.exe exec -it spark bash

2 - Criar uma pasta do HDFS dados_processamento/dados
$ hdfs dfs -mkdir dados_processamento/dados

3 - Enviar os arquivos para esta pasta ( linux -> hdfs)

4 - Processar os dados no Spark efetuando as limpezas, tratando os campos vazios

5 - Efetuar as responder as perguntas:

- quantos pedidos foram realizados
- quantos clientes tem em nossa base
- quantos clientes temos por Região
- quantidade de vendas em 2018

OBS. podem fazer a importação dos arquivos direto do hdfs não sendo necessario criar uma tabela no hive, ok?