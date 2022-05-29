
SET hive.exec.dynamic.partition=true;
SET hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE
    ${TARGET_DATABASE}.${TARGET_TABLE}

PARTITION(DT_FOTO) 
SELECT
	id_discente,
	nome,
	ano_ingresso,
	periodo_ingresso,
	nivel,
	id_forma_ingresso,
	id_curso,
	'${DT_FOTO}' as DT_FOTO
FROM ${STAGE_DATABASE}.${STAGE_TABLE}
;
