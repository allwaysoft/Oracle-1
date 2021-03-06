SELECT    TO_CHAR(FIRST_TIME,'YYYY/MM/DD') DAY,
          TO_CHAR(FIRST_TIME,'HH24:MI') HOUR,
          COUNT(*) TOTAL
FROM      V$LOG_HISTORY
GROUP BY  TO_CHAR(FIRST_TIME,'YYYY/MM/DD'),TO_CHAR(FIRST_TIME,'HH24:MI')
ORDER BY  1 DESC,2 DESC;