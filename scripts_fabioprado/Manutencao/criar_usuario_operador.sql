SET SERVEROUTPUT ON
DECLARE 
    v_nome_usuario VARCHAR2(30):='&NOME_USUARIO';
    v_senha_usuario VARCHAR2(30):='&SENHA_USUARIO';
    
BEGIN
    EXECUTE IMMEDIATE 'CREATE USER ' || v_nome_usuario || ' PROFILE "DEFAULT" 
            IDENTIFIED BY ' || v_senha_usuario || ' DEFAULT TABLESPACE "USERS" 
            TEMPORARY TABLESPACE "TEMP" 
            QUOTA UNLIMITED 
            ON "USERS" 
            ACCOUNT UNLOCK';
    
     EXECUTE IMMEDIATE 'GRANT SYSOPER TO ' || V_NOME_USUARIO;     
     EXECUTE IMMEDIATE 'GRANT CREATE SESSION TO ' || V_NOME_USUARIO;
     EXECUTE IMMEDIATE 'GRANT SELECT_CATALOG_ROLE TO ' || V_NOME_USUARIO;
     DBMS_OUTPUT.ENABLE(NULL);
     DBMS_OUTPUT.PUT_LINE('Usuario ''' || V_NOME_USUARIO || ''' criado com sucesso!');     
END;