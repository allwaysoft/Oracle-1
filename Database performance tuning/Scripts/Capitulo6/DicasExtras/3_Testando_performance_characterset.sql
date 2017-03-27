/*
Para melhor performance do BD, escolha o database character set mais �fechado� (com a mais eficiente codifica��o) para a linguagem das suas aplica��es;

Character sets Single-byte requerem menos espa�o de armazenamento para os dados e consequentemente s�o mais r�pidos. 
Exemplo: WE8ISO8859P1 (conjunto de caracteres mais utilizado para o idioma  americano e que � a op��o default da instala��o do BD).

Character sets UNICODE s�o �timos para suporte � globaliza��o, por�m utilizam m�ltiplos bytes (Multibyte) para representar um caractere, e consequentemente, s�o menos perform�ticos!
Exemplo: AL32UTF8.


Obs.: � poss�vel ter suporte �  globaliza��o com National Character Sets.
*/

-- Cria tabelas com character set single byte e multi byte
create table hr.tabela_single (col1 varchar2(100));
create table hr.tabela_multi (col1 nvarchar2(100));


-- testando performance carga
SET SERVEROUTPUT ON
DECLARE
  V_START NUMBER;
BEGIN
  V_START := DBMS_UTILITY.GET_TIME;
  
  for i in 1..99999
  loop
    INSERT INTO HR.tabela_single VALUES ('FABIO PRADO');
  end loop;  
  COMMIT;
    
  DBMS_OUTPUT.PUT_LINE('Tempo de insercao na tabela single: ' || (DBMS_UTILITY.GET_TIME - V_START) || 'cs');
  DBMS_STATS.GATHER_TABLE_STATS('HR','TABELA_SINGLE',ESTIMATE_PERCENT=>100);
  V_START := DBMS_UTILITY.GET_TIME;
 
  for i in 1..99999
  loop
    INSERT INTO HR.tabela_multi VALUES ('FABIO PRADO');
  end loop;
  COMMIT;  
  
  DBMS_STATS.GATHER_TABLE_STATS('HR','TABELA_MULTI',ESTIMATE_PERCENT=>100);
  DBMS_OUTPUT.PUT_LINE('Tempo de insercao na tabela multi: ' || (DBMS_UTILITY.GET_TIME - V_START) || 'cs');   
END;

-- Compare o plano de execucao das consultas nas 2 tabelas
EXPLAIN PLAN FOR
    SELECT * FROM HR.tabela_single;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

EXPLAIN PLAN FOR
    SELECT * FROM HR.tabela_multi;
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);

