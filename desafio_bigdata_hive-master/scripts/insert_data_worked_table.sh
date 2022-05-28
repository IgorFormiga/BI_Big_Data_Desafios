#!/bin/bash

TARGET_DATABASE="desafio_hive"
TARGET_TABLE="alunos_curso"
STAGE_TABLE="alunos_curso_external"
STAGE_DATABASE="desafio_hive"

DT_FOTO="$(date "+%Y-%m-%d")"

beeline -u jdbc:hive2://localhost:10000 \
 --hivevar TARGET_DATABASE="${TARGET_DATABASE}"\
 --hivevar TARGET_TABLE="${TARGET_TABLE}" \
 --hivevar STAGE_TABLE="${STAGE_TABLE}" \
 --hivevar STAGE_DATABASE="${STAGE_DATABASE}" \
 --hivevar DT_FOTO="${DT_FOTO}" \
 -f ../hqls/insert-table-alunos-wrk.hql 