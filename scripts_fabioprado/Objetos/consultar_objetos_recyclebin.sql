SELECT  OBJECT_NAME, ORIGINAL_NAME, TYPE
FROM    USER_RECYCLEBIN
WHERE   BASE_OBJECT = (SELECT BASE_OBJECT FROM USER_RECYCLEBIN
WHERE   ORIGINAL_NAME = 'RECYCLETEST')
AND     ORIGINAL_NAME != 'RECYCLETEST';