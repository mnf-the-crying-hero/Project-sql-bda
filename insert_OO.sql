 
insert into VILLE values(TVILLE('Alger centre',t_set_ref_tgymnases()));
 

insert into gymnases values(TGYMNASES(1,'Five Gym Club',tadresse('Boulevard Mohamed 5',null),(SELECT ref(v) from VILLE v WHERE v.ville='Alger centre') ,200,t_set_ref_tseance()));

--maj pour l'insertion ville
insert into table (select ville_gymnases from VILLE where ville='Alger centre')values((select ref (e) from gymnases e where e.VILLE.ville='Alger centre'));



insert into seance values(TSEANCE((SELECT ref(g) FROM gymnases g WHERE g.idgymnase=1) ,(SELECT ref(sp) FROM SPORTS sp WHERE sp.idsport=1),(SELECT ref(spf) FROM SPORTIFS spf WHERE spf.idsportifentraineur=149),'Samedi',9.0,60))
--maj pour l'insertion gymnases
insert into table(
    SELECT gymnases_seance FROM  GYMNASES where idgymnase=1
    )values(
        (select ref(se) from SEANCE se where se.idgymnase.idgymnase=1)
    );