/*
 * Carlos Humberto dos Santos Baqueta 7987456
 * Marina Coimbra                     7126841
 * Vanessa Apolinário de Lima         7239256
 *
 * SCC0241 - Laboratório de Base de Dados
 * Turma 03
 * Trabalho Prático 04
 *
 * Script de Geração de Relatórios < scriptSubPrograma.sql >
 * 
 */

 /*
  * Com o objetivo de criar um procedimento para geração de relatórios com base em
  certos parâmetros, sendo que este deve conter duas funções, consideramos o problema
  da recuperação dos dados financeiros de um certo evento.
  *
  * O relatório mostra as informações dos gastos com despesas e auxílios por patrocinador 
  para cada edição do evento, caso o número da edição seja Nulo, permitindo justificar 
  com o que os valores de cada patrocínio foram gastos. Caso o número da edição seja um
  valor válido para o dado evento, são mostradas as informações dos gastos com despesas
  e auxílios por patrocinador apenas para aquela edição em específico.
  *
  * Para mostrar o funcionamento da função são realizados abaixo alguns exemplos.
  * 
  */
set serveroutput on;
set verify off;
/
/
/
/*
 * Função que gera o relatório do dos gastos com despesas de um evento e edição para um certo patrocínio
 */
CREATE OR REPLACE FUNCTION relatorio_despesas(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type, 
                                              pat IN patrocinador.CNPJPat%Type) 
RETURN Number IS
  -- Cursor que recebe todas as despesas daquele patrocinador
  CURSOR cursor_despesas_pat (ev edicao.codEv%Type, ed edicao.numEd%Type, pat patrocinador.CNPJPat%Type) IS
    SELECT despesa.descricaoDesp, despesa.dataDesp, despesa.valorDesp
      FROM despesa JOIN patrocinio ON 
                 (despesa.cnpjPat = patrocinio.cnpjPat 
                  AND despesa.CODEV = patrocinio.CODEV
                  AND despesa.numEd = patrocinio.NUMED)
      WHERE despesa.codEv = ev
                  AND despesa.numEd = ed
                  AND despesa.cnpjPat = pat;
  -- Variável de acesso ao cursor
  despesa_pat_item cursor_despesas_pat%RowType;
  -- Variável que soma o total de gastos com essas despesas
  total_despesas Number(10,2) := 0;
  -- Variável temporária para verificação de erros
  tmp Number(15);
  -- Variável para receber a Razão Social do patrocinador
  nome_pat patrocinador.razaoSocialPat%Type;

  flag Varchar2(15);
  -- Exceptions
  sem_despesas EXCEPTION;
  BEGIN
    -- Verifica o evento
    flag := 'evento';
    SELECT codEv INTO tmp FROM evento WHERE codEv = ev;
    -- Verifica a edição
    flag := 'edição';
    SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;
    -- Verifica o patrocinador
    flag := 'patrocinador';
    SELECT cnpjPat, razaoSocialPat INTO tmp, nome_pat FROM patrocinador WHERE cnpjPat = pat;

    SELECT sum(despesa.valorDesp)
      INTO total_despesas
      FROM despesa JOIN patrocinio ON 
            (despesa.cnpjPat = patrocinio.cnpjPat 
             AND despesa.CODEV = patrocinio.CODEV
             AND despesa.numEd = patrocinio.NUMED)
      WHERE despesa.codEv = ev
            AND despesa.numEd = ed
            AND despesa.cnpjPat = pat;
    -- Imprime o cabeçalho
    dbms_output.put_line('Descrição                  Data da Despesa            Valor da Despesa  ');
    dbms_output.put_line('-------------------------  -------------------------  --------------------');
    -- Abre o cursor
    OPEN cursor_despesas_pat(ev, ed, pat);
      -- Imprimi todas as despesas ordenadas por data e depois por valor
      FETCH cursor_despesas_pat INTO despesa_pat_item;
      IF cursor_despesas_pat%NotFound THEN
        RAISE sem_despesas;
      END IF;
      LOOP
        dbms_output.put_line( RPAD(despesa_pat_item.descricaoDesp, 25, ' ') || '   ' || 
                              RPAD(despesa_pat_item.dataDesp, 25, ' ') || '  ' || 
                              RPAD( TO_CHAR(despesa_pat_item.valorDesp, 'FM$999,999,999,990.00'), 20, ' ') );
        FETCH cursor_despesas_pat INTO despesa_pat_item;
        EXIT WHEN cursor_despesas_pat%NotFound;
      END LOOP;
    -- Fecha o cursor
    CLOSE cursor_despesas_pat;
    
    RETURN total_despesas;
    
    -- Exceptions
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        IF flag = 'evento' THEN
          dbms_output.put_line('Evento especificado não cadastrado.');
        ELSIF flag = 'edição' THEN
          dbms_output.put_line('Edição não cadastrada para o evento.');
        ELSE
          dbms_output.put_line('Patrocinador não cadastrado.');
        END IF;
        RETURN 0;
      WHEN sem_despesas THEN
        dbms_output.put_line('Não há despesas cadastradas na edição ' ||
        ed || ' para o patrocinador ' || nome_pat || '.');
        RETURN 0;

END relatorio_despesas;
/
/
/
/*
 * Função que gera o relatório do dos gastos com auxílios de um evento e edição para um certo patrocínio
 */
CREATE OR REPLACE FUNCTION relatorio_auxilios (CODEV_ IN INSCRITO.CODEV%TYPE, NUMED_ IN INSCRITO.NUMED%TYPE, CNPJPAT_ IN AUXILIO.CNPJPAT%TYPE) return NUMBER
AS
  RET NUMBER;
  IDAUX ARTIGO.IDAPR%TYPE;
  
  CURSOR AUX_LIST IS 
    SELECT P.NOMEPE, ART.TITULOART, AUX.TIPOAUX, AUX.VALORAUX FROM AUXILIO AUX
      INNER JOIN INSCRITO I
        ON AUX.CODEVAPR = I.CODEV 
        AND AUX.NUMEDAPR = I.NUMED
        AND AUX.IDAPR = I.IDPART
      INNER JOIN ARTIGO ART
        ON ART.CODEV = I.CODEV
        AND ART.NUMED = I.NUMED
        AND ART.IDAPR= I.IDPART
      INNER JOIN PESSOA P
        ON I.IDPART = P.IDPE
      WHERE I.CODEV = CODEV_ AND I.NUMED = NUMED_ AND AUX.CNPJPAT = CNPJPAT_
      ORDER BY AUX.TIPOAUX, P.NOMEPE;
  AUX_INFO AUX_LIST%RowType;
  
  flag Varchar2(15); -- Usada para auxiliar na identificação das exceções de mesmo tipo
  temp NUMBER; -- Variável temporária para auxiliar no tratamento de exceções
  -- Exceptions
  sem_auxilios EXCEPTION;
BEGIN
  
  -- Checa se existe um evento com CODEV informado:
  flag := 'evento';
  SELECT Ev.CODEV INTO temp FROM evento Ev WHERE Ev.CODEV = CODEV_;
  
  -- Checa se existe uma edição com NUMED informado, associada ao evento com CODEV informado:
  flag := 'edicao';
  SELECT Ed.NUMED INTO temp FROM edicao Ed WHERE Ed.CODEV = CODEV_ AND Ed.NUMED = NUMED_;
  
  -- Checa se existe um patrocinador com o CNPJ informado que patrocinou o evento com código CODEV_
  flag := 'patEv';
  SELECT distinct Pa.CNPJPAT INTO temp FROM patrocinio Pa WHERE Pa.CNPJPAT = CNPJPAT_ AND Pa.CODEV = CODEV_;
  
    dbms_output.put_line('Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor');
    dbms_output.put_line('-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------');
    
  OPEN AUX_LIST;
  FETCH AUX_LIST INTO AUX_INFO; 
  IF AUX_LIST%NOTFOUND THEN
      RAISE sem_auxilios;
  END IF;
  LOOP
    dbms_output.put_line( RPAD(AUX_INFO.NOMEPE, 25, ' ') || '   ' || 
                          RPAD(AUX_INFO.TITULOART, 90, ' ') || '  ' || 
                          RPAD(AUX_INFO.TIPOAUX, 25, ' ') || '  ' || 
                          RPAD( TO_CHAR(AUX_INFO.VALORAUX, 'FM$999,999,999,990.00'), 20, ' ') );
  
    FETCH AUX_LIST INTO AUX_INFO; 
    EXIT WHEN AUX_LIST%NOTFOUND;    -- Condição de parada

  END LOOP;
  CLOSE AUX_LIST;
  
  -- CALCULA O VALOR TOTAL GASTO EM AUXÍLIO, REFERENTE A UM PATROCÍNIO DE UM PATROCINADOR, DADO UM EVENTO E UMA EDICAO (FUNÇÃO DE AGRUPAMENTO SUM())
  SELECT SUM(AUX.VALORAUX) INTO RET FROM AUXILIO AUX WHERE AUX.CODEVAPR = CODEV_  AND AUX.NUMEDAPR = NUMED_ AND AUX.CNPJPAT = CNPJPAT_; 
  
  RETURN RET;
  
  EXCEPTION
  WHEN no_data_found THEN 
     IF flag = 'evento' THEN 
        dbms_output.put_line (' Não há nenhum evento válido com o código ' || CODEV_ ||'.'); 
      END IF;
      IF flag = 'edicao' THEN
        dbms_output.put_line (' Não há nenhuma edição válida com número '|| NUMED_ || ' associada ao evento de código ' || CODEV_ ||'.');
      END IF;
      IF flag = 'patEv' THEN
        dbms_output.put_line (' O CNPJ informado não corresponde a um patrocinador válido que tenha patrocinado o evento de código ' || CODEV_ ||'.');
      END IF;
      RETURN 0;
  WHEN sem_auxilios THEN
      dbms_output.put_line('Não há auxílios cadastrados na edição ' || NUMED_ || '.');
      RETURN 0;
END relatorio_auxilios;
/
/
/
/*
 * Procedimento que gera o relatório do evento e edição para um certo patrocínio
 */
CREATE OR REPLACE PROCEDURE relatorio_patrocinio(ev IN edicao.codEv%Type,ed IN edicao.numEd%Type) IS
 nomePat Patrocinador.razaosocialpat%TYPE;
 totalPat NUMBER(10,2);
 totalGeral NUMBER(10,2);
 CURSOR c_pat IS SELECT DISTINCT CNPJPAT FROM PATROCINIO WHERE CODEV = ev and NUMED = ed ORDER BY CNPJPAT;
  var_cursor c_pat%ROWTYPE;

 -- Variáveis para verificação de exceptions
 tmp Number(15);
 flag Varchar2(15);
BEGIN
  flag := 'evento';
  SELECT codEv INTO tmp FROM evento WHERE codEv = ev;

  flag := 'edição';
  SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;

  totalGeral := 0;
  OPEN c_pat; 
      LOOP
        FETCH c_pat INTO var_cursor;
        EXIT WHEN c_pat%NotFound;
        SELECT razaosocialpat into nomePat from Patrocinador where CNPJPAT = var_cursor.cnpjpat;
        dbms_output.put_line('----------------------------------------------------------- ');
        dbms_output.put_line(' PATROCINADOR: ' || nomePat);
        dbms_output.put_line('----------------------------------------------------------- ');
        totalPat := 0;
        totalPat := totalPat + relatorio_despesas(ev, ed, var_cursor.cnpjpat);
        totalPat := totalPat + relatorio_auxilios(ev, ed, var_cursor.cnpjpat);
        dbms_output.put_line('----------------------------------------------------------- ');
        dbms_output.put_line('TOTAL GASTOS                                     ' || TO_CHAR(totalPat, 'FM$999,999,999,990.00'));
        dbms_output.put_line('----------------------------------------------------------- ');
        totalGeral := totalGeral + totalPat;
      END LOOP;
      CLOSE c_pat;
      dbms_output.put_line('----------------------------------------------------------- ');
      dbms_output.put_line('TOTAL EDICAO                                     ' || TO_CHAR(totalGeral, 'FM$999,999,999,990.00'));
      dbms_output.put_line('----------------------------------------------------------- ');

  -- Exceptions
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      IF flag = 'evento' THEN
        dbms_output.put_line('Evento não cadastrado.');
      ELSE
        dbms_output.put_line('Edição não cadastrada para o evento.');
      END IF;
END relatorio_patrocinio;
/
/
/
/*
 * Procedimento principal que gera o relatório de gastos de um dado o código de um evento e uma dada edição, se 
 esta for diferente de nula.
 */
CREATE OR REPLACE PROCEDURE relatorio_evento(ev IN NUMBER, ed IN NUMBER) IS
 CURSOR c_edicao IS SELECT DISTINCT NUMED FROM edicao WHERE CODEV = ev ORDER BY NUMED;
 var_cursor c_edicao%ROWTYPE;
 nomeEvento evento.nomeEv%TYPE;
 -- Variáveis para verificação de exceptions
 tmp Number(15);
 flag Varchar2(15);
BEGIN
  flag := 'evento';
  SELECT nomeEv into nomeEvento from evento where codEv = ev;
  dbms_output.put_line('----------------------------------------------------------- ');
  dbms_output.put_line('                    RELATORIO PATROCINIO                    ');
  dbms_output.put_line(' EVENTO: ' ||  RPAD(nomeEvento, 50, ' '));
  IF ed IS NOT NULL THEN
       flag := 'edição';
       SELECT numEd INTO tmp FROM edicao WHERE codEv = ev AND numEd = ed;
       dbms_output.put_line('  EDICAO: ' || ed);
       relatorio_Patrocinio(ev, ed);
  END IF;
  IF ed IS NULL THEN
   dbms_output.put_line('----------------------------------------------------------- ');
    OPEN c_edicao; 
      LOOP
        FETCH c_edicao INTO var_cursor;
        EXIT WHEN c_edicao%NotFound;
        dbms_output.put_line('----------------------------------------------------------- ');
        dbms_output.put_line(' EDICAO: ' || var_cursor.numed);
        dbms_output.put_line('----------------------------------------------------------- ');
        relatorio_Patrocinio(ev, var_cursor.numed);
      END LOOP;
    CLOSE c_edicao;
  END IF;

-- Exceptions
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      IF flag = 'evento' THEN
        dbms_output.put_line('Evento não cadastrado.');
      ELSE
        dbms_output.put_line('Edição não cadastrada para o evento ' || nomeEvento || '.');
      END IF;
END relatorio_evento;
/
/
/
/*
 * TESTE 01: 
    - Edição não existente
    - SAÍDA:
----------------------------------------------------------- 
                    RELATORIO PATROCINIO                    
 EVENTO: International Conference on Very Large Data Bases 
Edição não cadastrada para o evento International Conference on Very Large Data Bases.
 */
EXECUTE relatorio_evento(1, 10);
/
/*
 * TESTE 02: 
    - Evento não cadastradi
    - SAÍDA:
Evento não cadastrado.
 */
EXECUTE relatorio_evento(5, NULL);
/
/*
 * TESTE 03: 
    - Consulta normal para o evento 01
    - SAÍDA:
----------------------------------------------------------- 
                    RELATORIO PATROCINIO                    
 EVENTO: International Conference on Very Large Data Bases 
----------------------------------------------------------- 
----------------------------------------------------------- 
 EDICAO: 37
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: GOOGLE BRASIL INTERNET LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Material de divulgação e    01/07/11                   $3,000.00           
Palestrantes                20/07/11                   $2,000.00           
Limpeza do local            20/08/11                   $1,000.00           
Jantar de encerramento      13/07/11                   $3,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Da Yan                      Efficient Algorithms for Finding Optimal Meeting Point on Road Networks                     Flight ticket aid          $400.00             
João Rocha-Junior           Efficient Processing of Top-k Spatial Preference Queries                                    Flight ticket aid          $400.00             
Nan Wang                    On Triangulation-based Dense Neighborhood Graph Discovery                                   Flight ticket aid          $400.00             
Thomas Bernecker            Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data         Flight ticket aid          $400.00             
Guy Sagy                    Distributed Threshold Querying of General Functions by a Difference of Monotonic Represent  Food aid                   $50.00              
Panagiotis Papadimitriou    Output URL Bidding                                                                          Food aid                   $50.00              
Sudarshan Kadambi           Where in the World is My Data?                                                              Food aid                   $50.00              
Da Yan                      Efficient Algorithms for Finding Optimal Meeting Point on Road Networks                     Hosting aid                $100.00             
João Rocha-Junior           Efficient Processing of Top-k Spatial Preference Queries                                    Hosting aid                $100.00             
Thomas Bernecker            Efficient Probabilistic Reverse Nearest Neighbor Query Processing on Uncertain Data         Hosting aid                $100.00             
Michael Rice                Graph Indexing of Road Networks for Shortest Path Queries with Label Restrictions           Transportation aid         $75.00              
Sanjeev Khanna              Queries with Difference on Probabilistic Databases                                          Transportation aid         $75.00              
Zhao Cao                    Distributed Inference and Query Processing for RFID Tracking and Monitoring                 Transportation aid         $75.00              
----------------------------------------------------------- 
TOTAL GASTOS                                     $11,275.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Facebook Serviços Online do Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Construção de stands        25/07/11                   $5,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Não há auxílios cadastrados na edição 37.
----------------------------------------------------------- 
TOTAL GASTOS                                     $5,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Oracle do Brasil Sistemas Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Coffee Break                17/07/11                   $9,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Não há auxílios cadastrados na edição 37.
----------------------------------------------------------- 
TOTAL GASTOS                                     $9,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Microsoft Informatica Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Aluguel da sala de confer   25/07/11                   $20,000.00          
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Não há auxílios cadastrados na edição 37.
----------------------------------------------------------- 
TOTAL GASTOS                                     $20,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Hewlett-Packard Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Empréstimo de equipamento   10/08/11                   $1,000.00           
Mestre de Cerimônias        15/07/11                   $1,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Não há auxílios cadastrados na edição 37.
----------------------------------------------------------- 
TOTAL GASTOS                                     $2,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
TOTAL EDICAO                                     $47,275.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 EDICAO: 38
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: GOOGLE BRASIL INTERNET LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Kit do evento               30/06/12                   $3,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Cheng Sheng                 Optimal Algorithms for Crawling a Hidden Database in the Web                                Flight ticket aid          $400.00             
Robert Fink                 Aggregation in Probabilistic Databases via Knowledge Compilation                            Flight ticket aid          $400.00             
Svilen R. Mihaylov          REX: Recursive, Delta-Based Data-Centric Computation                                        Flight ticket aid          $400.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $4,200.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Vmware Software e Servicos Brasil LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Aluguel do espaço           21/06/12                   $9,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Alvin Cheung                Automatic Partitioning of Database Applications                                             Hosting aid                $500.00             
Bahman Bahmani              Scalable K-Means++                                                                          Hosting aid                $500.00             
Jeffrey Jestes              Ranking Large Temporal Data                                                                 Hosting aid                $500.00             
Venu Satuluri               Bayesian Locality Sensitive Hashing for Fast Similarity Search                              Hosting aid                $500.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $11,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Intel Semicondutores do Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Coffee Break                27/06/12                   $3,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Dan R. K. Ports             Serializable Snapshot Isolation in PostgreSQL                                               Transportation aid         $400.00             
Wei Lu                      Efficient Processing of k Nearest Neighbor Joins using MapReduce                            Transportation aid         $400.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $3,800.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Oracle do Brasil Sistemas Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Hospedagem palestrante      02/07/12                   $1,500.00           
Serviço de e-commerce       25/06/12                   $400.00             
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Rishabh Singh               Learning Semantic String Transformations from Examples                                      Food aid                   $200.00             
Sayan Ranu                  Answering Top-k Queries Over a Mixture of Attractive and Repulsive Dimensions               Food aid                   $200.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $2,300.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Microsoft Informatica Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Serviço de Transporte       01/07/12                   $2,000.00           
Construção de stands        29/06/12                   $1,700.00           
Limpeza do local            20/06/12                   $1,000.00           
Empréstimo de equipamento   19/06/12                   $2,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Não há auxílios cadastrados na edição 38.
----------------------------------------------------------- 
TOTAL GASTOS                                     $6,700.00
----------------------------------------------------------- 
----------------------------------------------------------- 
TOTAL EDICAO                                     $28,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 EDICAO: 39
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: GOOGLE BRASIL INTERNET LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Kit do evento               30/06/13                   $3,000.00           
Marketing digital           21/06/13                   $1,500.00           
Serviço de e-commerce       25/06/13                   $400.00             
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Ahmed El-Roby               RACE: A Scalable and Elastic Parallel System for Discovering Repeats in Very Long Sequence  Food aid                   $200.00             
Guimei Liu                  A Performance Study of Three Disk-based Structures for Indexing and Querying Frequent Item  Food aid                   $200.00             
Hatem Mahmoud               Low-latency multi-datacenter databases using replicated commit                              Food aid                   $200.00             
Maheswaran Sathiamoorthy    XORing Elephants: Novel Erasure Codes for Big Data                                          Food aid                   $200.00             
Yun Chi                     Distribution-Based Query Scheduling                                                         Food aid                   $200.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $5,900.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Vmware Software e Servicos Brasil LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Limpeza do local            20/06/13                   $1,000.00           
Empréstimo de equipamento   19/06/13                   $2,000.00           
Serviços de Transporte      19/06/13                   $4,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Radu Stoica                 Improving Flash Write Performance by Using Update Frequency                                 Flight ticket aid          $500.00             
Jiong HE                    Revisiting Co-Processing for Hash Joins on the Coupled CPU-GPU Architecture                 Hosting aid                $500.00             
Max Heimel                  Hardware-Oblivious Parallelism for In-Memory Column-Stores                                  Hosting aid                $500.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $8,500.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: IBM Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Aluguel do hotel para Con   27/06/13                   $7,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Yuan Yuan                   The Yin and Yang of Processing Data Warehousing Queries on GPU Devices                      Flight ticket aid          $500.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $7,500.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Intel Semicondutores do Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Limpeza do espaço           01/07/13                   $1,000.00           
Construção de stands        29/06/13                   $1,900.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Ada Wai-Chee Fu             IS-LABEL: an Independent-Set based Labeling Scheme for Point-to-Point Distance Querying     Flight ticket aid          $400.00             
Dayu Yuan                   Mining and Indexing Graphs For Supergraph Search                                            Hosting aid                $800.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $4,100.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Hewlett-Packard Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Visita turística para ins   02/07/13                   $1,500.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Jian Pei                    A Data-adaptive and Dynamic Segmentation Index for Whole Matching on Time Series            Flight ticket aid          $500.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $2,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
TOTAL EDICAO                                     $28,000.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 EDICAO: 40
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: GOOGLE BRASIL INTERNET LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Kit do evento               30/06/14                   $3,000.00           
Empréstimo de equipamento   19/06/14                   $2,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Huanhuan Wu                 Path Problems in Temporal Graphs                                                            Food aid                   $100.00             
Jennie Duggan               The Case for Personal Data-Driven Decision Making                                           Food aid                   $100.00             
Ruoming Jin                 Simple, Fast, and Scalable Reachability Oracle                                              Food aid                   $100.00             
Guoping Wang                Multi-Query Optimization in MapReduce Framework                                             Hosting aid                $800.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $6,100.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Vmware Software e Servicos Brasil LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Aluguel do espaço           21/06/14                   $8,500.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Kanat Tangwongsan           Counting and Sampling Triangles from a Graph Stream                                         Transportation aid         $500.00             
Yajun Yang                  Finding the Cost-Optimal Path with Time Constraint over Time-Dependent Graphs               Transportation aid         $500.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $9,500.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: IBM Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Hospedagem palestrante      02/07/14                   $1,500.00           
Construção de stands        29/06/14                   $1,700.00           
Serviço de e-commerce       25/06/14                   $400.00             
Limpeza do local            20/06/14                   $1,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Akash Das Sarma             ClusterJoin: A Similarity Joins Framework using Map-Reduce                                  Food aid                   $100.00             
Matthias Boehm              Hybrid Parallelization Strategies for Large-Scale Machine Learning in SystemML              Hosting aid                $800.00             
Yinan Li                    WideTable: An Accelerator for Analytical Data Processing                                    Hosting aid                $400.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $5,900.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Intel Semicondutores do Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Coffee Break                27/06/14                   $3,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Supriya Nirkhiwale          A Sampling Algebra for Aggregate Estimation                                                 Hosting aid                $800.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $3,800.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Hewlett-Packard Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Serviço de Transporte       01/07/14                   $2,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Wolf Roediger               Instant Loading for Main Memory Databases                                                   Food aid                   $200.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $2,200.00
----------------------------------------------------------- 
----------------------------------------------------------- 
TOTAL EDICAO                                     $27,500.00
----------------------------------------------------------- 
 */
EXECUTE relatorio_evento(1, NULL);
/
/*
 * TESTE 04: 
    - Consulta normal para o evento 01 edição 40
    - SAÍDA:
----------------------------------------------------------- 
                    RELATORIO PATROCINIO                    
 EVENTO: International Conference on Very Large Data Bases 
  EDICAO: 40
----------------------------------------------------------- 
 PATROCINADOR: GOOGLE BRASIL INTERNET LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Kit do evento               30/06/14                   $3,000.00           
Empréstimo de equipamento   19/06/14                   $2,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Huanhuan Wu                 Path Problems in Temporal Graphs                                                            Food aid                   $100.00             
Jennie Duggan               The Case for Personal Data-Driven Decision Making                                           Food aid                   $100.00             
Ruoming Jin                 Simple, Fast, and Scalable Reachability Oracle                                              Food aid                   $100.00             
Guoping Wang                Multi-Query Optimization in MapReduce Framework                                             Hosting aid                $800.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $6,100.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Vmware Software e Servicos Brasil LTDA.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Aluguel do espaço           21/06/14                   $8,500.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Kanat Tangwongsan           Counting and Sampling Triangles from a Graph Stream                                         Transportation aid         $500.00             
Yajun Yang                  Finding the Cost-Optimal Path with Time Constraint over Time-Dependent Graphs               Transportation aid         $500.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $9,500.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: IBM Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Hospedagem palestrante      02/07/14                   $1,500.00           
Construção de stands        29/06/14                   $1,700.00           
Serviço de e-commerce       25/06/14                   $400.00             
Limpeza do local            20/06/14                   $1,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Akash Das Sarma             ClusterJoin: A Similarity Joins Framework using Map-Reduce                                  Food aid                   $100.00             
Matthias Boehm              Hybrid Parallelization Strategies for Large-Scale Machine Learning in SystemML              Hosting aid                $800.00             
Yinan Li                    WideTable: An Accelerator for Analytical Data Processing                                    Hosting aid                $400.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $5,900.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Intel Semicondutores do Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Coffee Break                27/06/14                   $3,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Supriya Nirkhiwale          A Sampling Algebra for Aggregate Estimation                                                 Hosting aid                $800.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $3,800.00
----------------------------------------------------------- 
----------------------------------------------------------- 
 PATROCINADOR: Hewlett-Packard Brasil Ltda.
----------------------------------------------------------- 
Descrição                  Data da Despesa            Valor da Despesa  
-------------------------  -------------------------  --------------------
Serviço de Transporte       01/07/14                   $2,000.00           
Apresentador                Título do artigo apresentado                                                                Tipo do auxílio            Valor
-------------------------   -----------------------------------------------------------------------------------------   -----------------------    ----------------
Wolf Roediger               Instant Loading for Main Memory Databases                                                   Food aid                   $200.00             
----------------------------------------------------------- 
TOTAL GASTOS                                     $2,200.00
----------------------------------------------------------- 
----------------------------------------------------------- 
TOTAL EDICAO                                     $27,500.00
----------------------------------------------------------- 
 */
EXECUTE relatorio_evento(1, 40);
/
/
/