CREATE TABLE T_TAJ_FUNCIONARIO 
    ( 
     id_funcionario       INTEGER  NOT NULL , 
     nm_funcionario       VARCHAR2 (60)  NOT NULL , 
     mail_funcionario     VARCHAR2 (60) , 
     T_TAJ_LOGIN_id_login NUMBER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX T_TAJ_FUNCIONARIO__IDX ON T_TAJ_FUNCIONARIO 
    ( 
     T_TAJ_LOGIN_id_login ASC 
    ) 
;

ALTER TABLE T_TAJ_FUNCIONARIO 
    ADD CONSTRAINT T_TAJ_FUNCIONARIO_PK PRIMARY KEY ( id_funcionario ) ;

CREATE TABLE T_TAJ_LOGIN (
    id_login    NUMBER       NOT NULL,
    user_login  VARCHAR2(50) NOT NULL,
    senha_login VARCHAR2(50) NOT NULL,
    tp_login    CHAR(1)      NOT NULL
    CONSTRAINT CK_TP_LOGIN CHECK (tp_login IN ('F', 'P'))
);

ALTER TABLE T_TAJ_LOGIN 
    ADD CONSTRAINT T_TAJ_LOGIN_PK PRIMARY KEY ( id_login ) ;

CREATE TABLE T_TAJ_PACIENTE 
    ( 
     cpf_paciente         CHAR (14)  NOT NULL , 
     nm_paciente          VARCHAR2 (60)  NOT NULL , 
     tel_paciente         VARCHAR2 (14)  NOT NULL , 
     mail_paciente        VARCHAR2 (60) , 
     rghc                 VARCHAR2 (20)  NOT NULL , 
     dt_nasc_paciente     DATE  NOT NULL , 
     T_TAJ_LOGIN_id_login NUMBER  NOT NULL 
    ) 
;
CREATE UNIQUE INDEX T_TAJ_PACIENTE__IDX ON T_TAJ_PACIENTE 
    ( 
     T_TAJ_LOGIN_id_login ASC 
    ) 
;

ALTER TABLE T_TAJ_PACIENTE 
    ADD CONSTRAINT T_TAJ_PACIENTE_PK PRIMARY KEY ( cpf_paciente ) ;

CREATE TABLE T_TAJ_PESQUISA_SATIS 
    ( 
     id_pesquisa_satis           INTEGER  NOT NULL , 
     nt_app                      INTEGER  NOT NULL , 
     nt_site                     INTEGER  NOT NULL , 
     nt_suporte                  INTEGER  NOT NULL , 
     dt_pesquisa                 DATE  NOT NULL , 
     T_TAJ_PACIENTE_cpf_paciente CHAR (14)  NOT NULL 
    ) 
;

ALTER TABLE T_TAJ_PESQUISA_SATIS 
    ADD CONSTRAINT T_TAJ_PESQUISA_SATIS_PK PRIMARY KEY ( id_pesquisa_satis ) ;

CREATE TABLE T_TAJ_TICKET 
    ( 
     id_ticket                        INTEGER  NOT NULL , 
     assunto                          VARCHAR2 (100) , 
     descricao                        VARCHAR2 (200)  NOT NULL , 
     resposta                         VARCHAR2 (300) , 
     dt_abertura                      DATE  NOT NULL , 
     dt_fechamento                    DATE , 
     status                           CHAR (1)  NOT NULL , 
     cpf_paciente      CHAR (14)  NOT NULL ,  
     id_funcionario INTEGER  NOT NULL 
    ) 
;

ALTER TABLE T_TAJ_TICKET 
    ADD CONSTRAINT T_TAJ_TICKET_PK PRIMARY KEY ( id_ticket ) ;

ALTER TABLE T_TAJ_FUNCIONARIO 
    ADD CONSTRAINT FUNCIONARIO_LOGIN_FK FOREIGN KEY 
    ( 
     T_TAJ_LOGIN_id_login
    ) 
    REFERENCES T_TAJ_LOGIN 
    ( 
     id_login
    ) 
;

ALTER TABLE T_TAJ_PACIENTE 
    ADD CONSTRAINT T_TAJ_PACIENTE_T_TAJ_LOGIN_FK FOREIGN KEY 
    ( 
     T_TAJ_LOGIN_id_login
    ) 
    REFERENCES T_TAJ_LOGIN 
    ( 
     id_login
    ) 
;
 
ALTER TABLE T_TAJ_PESQUISA_SATIS 
    ADD CONSTRAINT PESQUISA_SATIS_PACIENTE_FK FOREIGN KEY 
    ( 
     T_TAJ_PACIENTE_cpf_paciente
    ) 
    REFERENCES T_TAJ_PACIENTE 
    ( 
     cpf_paciente
    ) 
;

ALTER TABLE T_TAJ_TICKET 
    ADD CONSTRAINT TICKET_FUNCIONARIO_FK FOREIGN KEY 
    ( 
     id_funcionario
    ) 
    REFERENCES T_TAJ_FUNCIONARIO 
    ( 
     id_funcionario
    ) 
;

ALTER TABLE T_TAJ_TICKET 
    ADD CONSTRAINT T_TAJ_TICKET_T_TAJ_PACIENTE_FK FOREIGN KEY 
    ( 
     cpf_paciente
    ) 
    REFERENCES T_TAJ_PACIENTE 
    ( 
     cpf_paciente
    ) 
;


