 SELECT ROUND(SUM(GETS)/(SUM(GETS)+SUM(GETMISSES)) * 100,2) DICT
 FROM V$ROWCACHE;