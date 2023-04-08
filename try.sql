/*PART2*/
    /*2*/
    CREATE TABLESPACE SQL3_TBS 
    DATAFILE 'F:/M1 il/S2/bDA/TP/PROJET/SQL3_TBS.dbf'
    SIZE 100M
    AUTOEXTEND ON;

    CREATE TEMPORARY TABLESPACE SQL3_TempTBS 
    TEMPFILE 'F:/M1 il/S2/bDA/TP/PROJET/SQL3_TempTBS.dbf'
    SIZE 50M
    AUTOEXTEND ON;
    /*34*/
    CREATE USER SQL3 IDENTIFIED BY 123 DEFAULT TABLESPACE SQL3_TBS
    TEMPORARY TABLESPACE SQL3_TempTBS;

    GRANT ALL PRIVILEGES TO SQL3;

    ALTER USER SQL3 QUOTA UNLIMITED ON SQL3_TBS;
/*PART3*/
CREATE TYPE t_set_ref_sport as table of ref tsport;
CREATE TYPE  t_set_ref_sportifs as table of ref tsportifs;
CREATE type t_set_ref_gymnase as table of ref tgymnases;
CREATE type t_set_ref_seance as table of ref tseance;
/*5*/
CREATE TYPE tsportifs as object(
    IDSPORTIF integer,
    NOM varchar2(50),
    PRENOM varchar2(50),
    SEXE varchar(1) ,
    AGE integer
)Not Final;
/

CREATE TYPE tconseiller under tsportifs(
    IDSPORTIFCONSEILLER integer
);
/

CREATE TYPE tentraineur under tsportifs(
    IDSPORTIFENTRAINEUR integer
);
/

create type tadresse as object(
    rue             varchar2(50), 
    numero          integer, 
    ville           varchar2(50),
    pays            varchar2(50), 
    codepostal      varchar2(5)
);
/


CREATE TYPE tville AS OBJECT (
  VILLE VARCHAR(50)
  ville_gymnases t_set_ref_gymnase
);
/

CREATE TYPE tgymnases AS OBJECT (
  IDGYMNASE         INTEGER,
  NOMGYMNASE        VARCHAR(50),
  ADRESSE           tadresse,
  VILLE REF         tville,
  SURFACE           INTEGER,
  gymnases_seance   t_set_ref_seance
);
/
CREATE TYPE tsport AS OBJECT (
  IDSPORT           INTEGER,
  LIBELLE           VARCHAR(50),
  sport_sportif     t_set_ref_sportifs,
  sport_seance      t_set_ref_seance
);
/   
CREATE TYPE tseance AS OBJECT (
  IDGYMNASE             REF tgymnases,
  IDSPORT               REF tsport,
  IDSPORTIFENTRAINEUR   REF tsportifs,
  JOUR                  VARCHAR(10),
  HORAIRE               REAL,
  DUREE                 INTEGER
);
/
CREATE TYPE tjouer AS OBJECT (
  IDSPORTIF         REF tsportifs,
  IDSPORT           REF tsport
);
/
 
CREATE TYPE tarbitrer AS OBJECT (
  IDSPORTIF         REF tsportifs,
  IDSPORT           REF tsport
);
/
 
CREATE TYPE tentrainer AS OBJECT (
  IDSPORTIFENTRAINEUR   REF tsportifs,
  IDSPORT               REF tsport
);
/
/*create table*/

CREATE TABLE sportifs OF tsportifs (
    PRIMARY KEY (IDSPORTIF),
    CHECK (SEXE IN ('M', 'F'))
);
CREATE TABLE  entraineur OF tentraineur(
    PRIMARY KEY(IDSPORTIFENTRAINEUR)
);
CREATE TABLE conseiller OF tconseiller(
    PRIMARY KEY(IDSPORTIFCONSEILLER)
);
CREATE TABLE ville of tville(
    PRIMARY KEY(VILLE)
);
CREATE TABLE gymnases OF tgymnases(
    PRIMARY KEY(IDGYMNASE)
);
CREATE TABLE sport OF tsport(
    PRIMARY KEY(IDSPORT)
);
--m7btch tmchi tsma dirt hadi 
    CREATE TABLE seance OF tseance(
        PRIMARY KEY(IDGYMNASE,IDSPORT,IDSPORTIFENTRAINEUR,JOUR,HORAIRE)
    );
CREATE TABLE seance (
    IDGYMNASE     REF tgymnases,
    IDSPORT       REF tsport,
    IDSPORTIFENTRAINEUR     REF tsportifs,
    JOUR VARCHAR(10),
    HORAIRE REAL,
    DUREE INTEGER,
    PRIMARY KEY(IDGYMNASE, IDSPORT, IDSPORTIFENTRAINEUR, JOUR, HORAIRE),
    foreign key(IDGYMNASE) references gymnases,
    foreign key(IDSPORT) references sport,
    foreign key(IDSPORTIFENTRAINEUR) references sportifs
);

CREATE TABLE jourer OF tjouer(
    PRIMARY KEY(IDSPORTIF,IDSPORT)
);
CREATE TABLE arbitrer of  tarbitrer(
    PRIMARY KEY(IDSPORTIF,IDSPORT)
);
CREATE TABLE entrainer OF tentrainer(
    PRIMARY KEY(IDSPORTIFENTRAINEUR,IDSPORT)
);
/*create methode */

Alter type tsportifs add member function nbr_sport_entraine return number cascade;
create or replace type body tsportifs as member function nbr_sport_entraine return number is
nbr_s_e number;
Begin
SELECT SPORTIFS.IDSPORTIF, COUNT(*) AS nbr_s_e
FROM SPORTIFS
JOIN ENTRAINER ON SPORTIFS.IDSPORTIF = ENTRAINER.IDSPORTIFENTRAINEUR
GROUP BY SPORTIFS.IDSPORTIF;
return nbr_s_e;
end;
END;
/