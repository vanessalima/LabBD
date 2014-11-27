DROP TABLE result_next_ed;
CREATE TABLE result_next_ed(id number(10), text varchar2(500));

CREATE OR REPLACE PACKAGE relatorio_ed AS
PROCEDURE pot_org (ev IN NUMBER, place IN VARCHAR2);
PROCEDURE next_edition (ev IN NUMBER);
end relatorio_ed;

CREATE OR REPLACE PACKAGE BODY relatorio_ed AS
  num Number(10);

PROCEDURE pot_org (ev IN NUMBER, place IN VARCHAR2) IS
  g_chair pessoa.idpe%TYPE;
  CURSOR c_org IS select idAut, nomepe from (select e.idAut, p.nomepe, count(e.idArt)
  FROM escreve E, pessoa P, artigo A
  WHERE E.idAut = P.idpe 
    and upper(P.nacionalidadepe) = place
    and a.codev = ev 
    and e.idart = a.idart
    group by e.idAut, p.nomepe
    order by count(e.idArt) desc) where rownum <= 4;
    var_cursor c_org%ROWTYPE;
    n_count NUMBER;
BEGIN
n_count := 0;
OPEN c_org; 
  LOOP
    FETCH c_org INTO var_cursor;
    EXIT WHEN c_org%NotFound;
    IF n_count = 1 THEN
        INSERT INTO result_next_ed values(num,'PROGRAM CHAIR:' || var_cursor.nomepe);
        num := num + 1;
    END IF;
    IF n_count = 0 THEN 
          INSERT INTO result_next_ed values(num,'GENERAL CHAIR:' || var_cursor.nomepe);
          num := num +1;
          n_count := 1;
    END IF;
  END LOOP;
  EXCEPTION
      WHEN OTHERS
        THEN dbms_output.put_line('Ocorreu um erro no processo.');
END pot_org;

PROCEDURE next_edition (ev IN NUMBER) IS
  place pessoa.nacionalidadepe%TYPE;
  edition edicao.numed%TYPE;
BEGIN
  num := 0;
  SELECT nacionalidade, ed INTO place, edition FROM (SELECT i.codev, E.max_num as ed, UPPER(Nacionalidadepe) as nacionalidade, count(idpe)
    FROM inscrito I, pessoa P, (SELECT codev, max(numed) as max_num from edicao  where codev = ev group by codev ) E 
    WHERE i.idpart = p.idpe 
      and i.codev = E.codev
      and i.numed = E.max_num
    group by i.codev, E.max_num, UPPER(nacionalidadepe)
    order by count(idpe) desc) A WHERE rownum <= 1;

    INSERT INTO result_next_ed values(num, '----------------------------------------------');
    num := num + 1;
    INSERT INTO result_next_ed values(num, 'Evento: '|| ev);
    num := num + 1;
    edition := edition + 1;
    INSERT INTO result_next_ed values(num, 'Edicao: '|| edition );
    num := num + 1;
    INSERT INTO result_next_ed values(num, 'Nacionalidade Escolhida: ' || place );
    num := num + 1;
    INSERT INTO result_next_ed values(num, 'Potenciais Organizadores:');
    num := num + 1;
    pot_org(ev, place);
    INSERT INTO result_next_ed values(num, '----------------------------------------------');
    num := num + 1;
    EXCEPTION
      WHEN NO_DATA_FOUND 
        THEN INSERT INTO result_next_ed values(num, 'A operação falhou. Verifique o numero da do evento');
      WHEN TOO_MANY_ROWS 
        THEN INSERT INTO result_next_ed values(num,'A operação falhou.');
      WHEN OTHERS
        THEN INSERT INTO result_next_ed values(num,'Ocorreu um erro no processo.');
END next_edition;

END relatorio_ed;
/
BEGIN relatorio_ed.next_edition(2);END;
select text from result_next_ed order by id;
delete result_next_ed;
