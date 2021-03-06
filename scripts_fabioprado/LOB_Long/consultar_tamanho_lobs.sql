-- consulta tamanhos dos LOBs de um determinado tablespace:
SELECT      S.OWNER,  L.TABLE_NAME, L.COLUMN_NAME, S.SEGMENT_NAME, S.BLOCKS, S.EXTENTS,  ROUND(S.BYTES/1024/1024,2) MBYTES 
FROM        DBA_SEGMENTS S
INNER JOIN  DBA_LOBS L
    ON      L.SEGMENT_NAME   = S.SEGMENT_NAME
WHERE       L.TABLESPACE_NAME = '&TABLESPACE_NAME'
ORDER BY    7 DESC;