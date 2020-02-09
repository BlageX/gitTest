INSERT INTO USERS(username, password,  enabled, last_password_reset_date) VALUES ('user', 'tre',  true, '2017-10-01 21:58:58.508-07')
INSERT INTO USERS(username, password,  enabled, last_password_reset_date) VALUES ('user2', 'bell', true, '2017-10-01 18:57:58.508-07')
INSERT INTO USERS(username, password,  enabled, last_password_reset_date) VALUES ('user3', 'bella', true, '2017-10-01 18:57:58.508-07')

INSERT INTO AUTHORITY(name) VALUES('ROLE_USER')
INSERT INTO AUTHORITY(name) VALUES('ROLE_ADMIN')
INSERT INTO AUTHORITY(name) VALUES('ROLE_PACIJENT')

INSERT INTO USER_AUTHORITY(user_id, authority_id) VALUES (1, 1)
INSERT INTO USER_AUTHORITY(user_id, authority_id) VALUES (2, 2)


-----------------------------------------------------------USER-----------------------------------------------------------------

--KLINIKA

INSERT INTO KLINIKA(naziv, adresa, opis, cene,  ocena) VALUES('Opšta klinika ','Neznanog i znanog junaka BB','Opsta klinika za sve vrste pregleda',' Rendgen tela - 4000; Rendgen glave - 4500; Snimanje pluca - 2500; Ispitivanje alergija - 3000; Snimak vilice  - 3000; Provera dioptrije - 3500; Merenje pritiska - 4000',  5)
INSERT INTO KLINIKA(naziv, adresa, opis, cene,  ocena) VALUES('Stomatološka klinika','Deset Jugovica','Specijalizovana klinika za stomatoloske usluge','Snimak zuba - 2000; Provera proteze - 2000; Provera implanta - 2500; Revizija starih punjenja - 3500; Snimak vilice - 3000; Merenje pritiska - 4000',  5)
INSERT INTO KLINIKA(naziv, adresa, opis, cene,  ocena) VALUES('Očna klinika','Adresa 3','Specijalizovana klinika za oftamološke usluge','Provera zenica - 2000; Provera ocnog pritiska - 2000; Kompletni oftamoloski pregled - 5000; Funckionalna elektrodijagnostika - 3000; Provera dioptrije - 3500; Merenje pritiska - 4000',  4.5)

--SALA:
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za pregled', '1', false, 1)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za pregled', '2', false, 1)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za rengenom', '1', false, 1)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za rengenom', '2', false, 1)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za ispitivanje alergija', '1', false, 1)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za operacije', '1', false, 2)

INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za pregled', '1', false, 2)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za pregled', '2', false, 2)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za snimanje zuba', '1', false, 2)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Proteticka sala', '1', false, 2)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za operacije', '1', false, 2)

INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za pregled', '1', false, 3)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za pregled', '2', false, 3)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za snimanje oka', '1', false, 3)
INSERT INTO SALA(naziv, broj, rezervisana, KLINIKA_KLINIKA_ID) values ('Sala za operacije', '1', false, 3)


--TIP PREGLEDA:
--Opsta klinika (1):
--(1)
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Rendgen tela', '4000') 
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Rendgen glave', '2000')
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Snimanje pluca', '2500')
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Ispitivanje alergija', '3000')

--Stomatoloska klinika (2):
--(2)
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Snimak zuba', '2000') 
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Provera proteze', '2000')
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Provera implanta', '2500')
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Revizija starih punjenja', '3000')

--Stomatoloska klinika (3):
--(3)
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Provera zenice', '2000') 
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Provera ocnog pritiska', '2000')
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Kompletni oftamoloski pregled', '5000')
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Funkcionalna elektrodijagnostika', '3000')

--(1,2)
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Snimak vilice', '3000') 

--(1,3)
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Provera dioptrije', '3500') 

--(1,2,3)
INSERT INTO TIP_PREGLEDA(naziv, cena) VALUES('Merenje pritiska', '4000') 

--ako hocu jos pregleda ovde ih dodavati, da ne pomeram indekse prethodnih...

--INSERT INTO KLINIKA_TIP_PREGLEDA(KLINIKA_ID,TIP_PREGLEDA_ID) VALUES(1,1),(1,2),(1,3),(1,4),(1,5),(1,16),(1,17),(1,18)
--INSERT INTO KLINIKA_TIP_PREGLEDA(KLINIKA_ID,TIP_PREGLEDA_ID) VALUES(2,6),(2,7),(2,8),(2,9),(2,10),(2,16),(2,18)
--INSERT INTO KLINIKA_TIP_PREGLEDA(KLINIKA_ID,TIP_PREGLEDA_ID) VALUES(3,11),(3,12),(3,13),(3,14),(3,15),(3,17),(3,18)

INSERT INTO KLINIKA_TIP_PREGLEDA(KLINIKA_ID,TIP_PREGLEDA_ID) VALUES(1,1),(1,2),(1,3),(1,4),(1,13),(1,14),(1,15)
INSERT INTO KLINIKA_TIP_PREGLEDA(KLINIKA_ID,TIP_PREGLEDA_ID) VALUES(2,5),(2,6),(2,7),(2,8),(2,13),(2,15)
INSERT INTO KLINIKA_TIP_PREGLEDA(KLINIKA_ID,TIP_PREGLEDA_ID) VALUES(3,9),(3,10),(3,11),(3,12),(3,14),(3,15)

--(1)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Marija' , 'Maric' 	, '8:00-21:00', 4.5, 1, 1)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Spasoje', 'Spasojev', '8:00-21:00', 4.0, 1, 1)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nikola' , 'Nikolic'	, '8:00-21:00', 3.5, 1, 2)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Divna'  , 'Spasojev', '8:00-21:00', 3.4, 1, 2)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Tamara' , 'Tamaric'	, '8:00-21:00', 2.5, 1, 3)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Goran'  , 'Goranic', '8:00-21:00', 3.4, 1, 3)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nadja' , 'Nadjic'	, '8:00-21:00', 3.3, 1, 4)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Vanja'  , 'Nadjic', '8:00-21:00', 3.4, 1, 4)

--(1,2)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Milovan' , 'Milovanovic', '8:00-21:00', 4.2, 1, 13)
--(1,3)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Jovan' , 'Cvejic', '8:00-21:00', 4.4, 1, 14)
--(1,2,3)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nikola' , 'Teslic', '8:00-21:00', 4.6, 1, 15)

--do 14 doktora svi doktori pripadaju 1. klinici

--(2)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Marija' , 'Maric'   , '8:00-21:00', 4.5, 2, 5)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Spasoje', 'Spasojev', '8:00-21:00', 4.0, 2, 5)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nikola' , 'Nikolic' , '8:00-21:00', 3.5, 2, 6)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Divna'  , 'Spasojev', '8:00-21:00', 3.4, 2, 6)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Tamara' , 'Tamaric',  '8:00-21:00', 4.5, 2, 7)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Goran'  , 'Goranic',  '8:00-21:00', 3.4, 2, 7)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nadja'  , 'Nadjic' ,  '8:00-21:00', 3.8, 2, 8)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Vanja'  , 'Nadjic' ,  '8:00-21:00', 3.4, 2, 8)

--(2,1)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Milos' , 'Glusic', '8:00-21:00', 4.2, 2, 13)
--(1,2,3)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Milos' , 'Milosevic', '8:00-21:00', 4.6, 2, 15)

--(3)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Marija' , 'Maric' 	, '8:00-21:00', 4.5, 3, 9)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Spasoje', 'Spasojev'  , '8:00-21:00', 4.0, 3, 9)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nikola' , 'Nikolic'	, '8:00-21:00', 1.8, 3, 10)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Divna'  , 'Spasojev'  , '8:00-21:00', 3.4, 3, 10)
 
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Tamara' , 'Tamaric'	, '8:00-21:00', 2.9, 3, 11)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Goran'  , 'Goranic'   , '8:00-21:00', 3.4, 3, 11)

INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nadja'  , 'Nadjic'	, '8:00-21:00', 4.1, 3, 12)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Vanja'  , 'Nadjic'	, '8:00-21:00', 3.4, 3, 12)

--(3,1)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Milovan' , 'Nemanjic', '8:00-21:00', 4.2, 3, 14)
--(1,2,3)
INSERT INTO Doktor(ime, prezime, radno_vreme, ocena, KLINIKA_KLINIKA_ID, TIP_PREGLEDA_ID) VALUES('Nikola' , 'Kolic', '8:00-21:00', 4.6, 3, 15)

--klinika(1):
--doktor(1)
--da ne radi kadjam za 9 tj. sutra;
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 1)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 1)

--doktor(2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 2)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 2)

--doktor(3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 3)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 3)

--doktor(4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 4)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 4)

--doktor(5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 5)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 5)

--doktor(6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 6)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 6)

--doktor(7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 7)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 7)

--doktor(8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 8)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 8)

--doktor(9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 9)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 9)

--doktor(10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 10)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 10)

--doktor(11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 11)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 11)


--klinika(2):
--doktor(12)
--da ne radi kadjam za 9 tj. sutra;
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 12)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 12)

--doktor(13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 13)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 13)



--doktor(14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 14)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 14)

--doktor(15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 15)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 15)

--doktor(16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 16)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 16)

--doktor(17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 17)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 17)

--doktor(18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 18)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 18)

--doktor(19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 19)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 19)

--doktor(20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 20)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 20)

--doktor(21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 21)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 21)

--klinika(3):
--doktor(22)
--da ne radi gadjam za 9 tj. sutra;
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 22)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 22)

--doktor(23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 23)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 23)


--doktor(24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 24)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 24)

--doktor(25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 25)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 25)


--doktor(26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 26)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 26)

--doktor(27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 27)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 27)

--doktor(28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 28)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 28)

--doktor(29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 29)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 29)

--doktor(30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 30)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 30)

--doktor(31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('9/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('25/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '08:00', '10:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '11:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '16:00', '17:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('26/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('27/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('28/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('29/2/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('1/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '12:00', '13:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '14:00', '16:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '17:00', '19:00' ,true, 31)
INSERT INTO TERMIN(datum, pocetak_termina, kraj_termina, slobodan, DOKTOR_DOKTOR_ID) VALUES (TO_DATE('2/3/2020', 'DD/MM/YYYY'), '20:00', '21:00' ,true, 31)

--Administrator klinike:
INSERT INTO Administrator_klinike(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Milica','Milicic',1)
INSERT INTO Administrator_klinike(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Dragan','Draganic',2)
INSERT INTO Administrator_klinike(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Jelena','Jelenic',3)

--Sestra:
INSERT INTO Medicinska_Sestra(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Ana','Anic',1)
INSERT INTO Medicinska_Sestra(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Tanja','Tanjic',1)
INSERT INTO Medicinska_Sestra(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Sanja','Sanjic',2)
INSERT INTO Medicinska_Sestra(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Vojislava','Sanjic',2)
INSERT INTO Medicinska_Sestra(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Vojislav','Vojic',3)
INSERT INTO Medicinska_Sestra(ime, prezime, KLINIKA_KLINIKA_ID) VALUES('Nikolina','Nikolic',3)

-----ZDRAVSTVENI KARTON
INSERT INTO ZDRAVSTVENI_KARTON(alergija,dioptrija,visina,tezina,krvna_grupa) VALUES('prasinu, polen','-0.5','183','80','A')
--INSERT INTO ZDRAVSTVENI_KARTON(alergija,dioptrija,visina,tezina,krvna_grupa) VALUES('polen','','190','90','0')
--INSERT INTO ZDRAVSTVENI_KARTON(alergija,dioptrija,visina,tezina,krvna_grupa) VALUES('','-1','168','75','B')

--Kada dodam user klasu:
INSERT INTO Pacijent(ID, first_name, last_name, address, city, country, phone_number, insurance_number, ZDRAVSTVENI_KARTON_ID) VALUES(1,'Test 1','Testovic','23. Avgusta', 'Ruma', 'Srbija', '02224242','1231412',1)
--INSERT INTO Pacijent(ID, first_name, last_name, address, city, country, phone_number, insurance_number, ZDRAVSTVENI_KARTON_ID) VALUES(2,'Test 2','Blagojevic','19. Septembra', 'Ruma', 'Novi Sad', '02124242','1212331412',2)
--INSERT INTO Pacijent(ID, first_name, last_name, address, city, country, phone_number, insurance_number, ZDRAVSTVENI_KARTON_ID) VALUES(3,'Test 3','Testovic','Kralja Petra', 'Beograd', 'Srbija', '01124242','12321321412',3)


--------REPORT

--Lek
INSERT INTO Lek(naziv) VALUES('Probiotic')
INSERT INTO Lek(naziv) VALUES('Probiotic forte')
INSERT INTO Lek(naziv) VALUES('Bromazepam')
INSERT INTO Lek(naziv) VALUES('Paracetamol')
INSERT INTO Lek(naziv) VALUES('Aspirin')
INSERT INTO Lek(naziv) VALUES('Tylol Hot')
INSERT INTO Lek(naziv) VALUES('Panadol')
INSERT INTO Lek(naziv) VALUES('Panadol Extra')

--za zube
INSERT INTO Lek(naziv) VALUES('Fuji 9')
--vestacke suze
INSERT INTO Lek(naziv) VALUES('Hylocomid')
-- protiv glaukoma - ocnog pritiska
INSERT INTO Lek(naziv) VALUES('Vitaminiski mix')

INSERT INTO Lek(naziv) VALUES('Dioptrijsko pomagalo')



--Recept

--klinika(1):

--prvi recept prvoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(1) 
--drugi recept prvoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(1) 

--prvi recept drugoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(2) 
--drugi recept drugoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(2) 


--klinika(2):

--prvi recept trecoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(3)
--drugi recept trecoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(3)

--prvi recept cetvrtoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(4)
--drugi recept cetvrtoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(4)


--klinika(3):

--prvi recept petoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(5)
--drugi recept petoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(5)

--prvi recept sestoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(6)
--drugi recept sestoj sestri
INSERT INTO recept(MED_SESTRA_ID) VALUES(6)


--Se prepisuje recept i lekovi:
--klinika(1):
--probiotic,probiotic forte, pracetamol u prvi recept prvoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(1,1),(1,2),(1,4)
--bromazepam, paracetamol u drugi recept prvoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(2, 3),(2, 4)

--taylol hot, panadol extra u prvi recept drugoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(3,6),(3,8)
--panadol, aspirin u drugi recept drugoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(4,5),(4,7)


--klinika(2):
-- PanadolExtra, Fuji 9 u prvi recept trecoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(5,8),(5,9)
--paracetamol, Fuji 9 u drugi recept trecoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(6, 4),(6, 9)

--aspirin, panadol, paracetamol u  prvi recept cetvrtoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(7,4),(7,5),(7,7)
--aspirin, panadol, paracetamol u drugi recept cetvr sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(8,4),(8,5),(8,7)


--klinika(3):
-- Aspirin, Vitaminiski mix u prvi recept trecoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(9,5),(9,11)
--Hylocomid u drugi recept trecoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(10, 10)

-- u  Vitaminiski mix prvi recept cetvrtoj sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(11,11)
--aspirin, panadol, paracetamol u drugi recept cetvr sestri
INSERT INTO se_prepisuje(RECEPT_ID, LEK_ID) VALUES(12,12)

--Dijagnoza

--(1)
INSERT INTO Dijagnoza(naziv) VALUES('Lenja creva')
INSERT INTO Dijagnoza(naziv) VALUES('Pomeren zeludac')
INSERT INTO Dijagnoza(naziv) VALUES('Upala pluca')
INSERT INTO Dijagnoza(naziv) VALUES('Bronhitis')
INSERT INTO Dijagnoza(naziv) VALUES('Kamen u bubregu')

INSERT INTO Dijagnoza(naziv) VALUES('Migrena')
INSERT INTO Dijagnoza(naziv) VALUES('Upala sinusa')

INSERT INTO Dijagnoza(naziv) VALUES('Alergija na polen')
INSERT INTO Dijagnoza(naziv) VALUES('Alergija na hranu')
INSERT INTO Dijagnoza(naziv) VALUES('Alergija na prasinu')

--(2)
INSERT INTO Dijagnoza(naziv) VALUES('Slomljen zub')
INSERT INTO Dijagnoza(naziv) VALUES('Slomljena krunica')
INSERT INTO Dijagnoza(naziv) VALUES('Ispala plomba')
INSERT INTO Dijagnoza(naziv) VALUES('Potrebna proteza')
INSERT INTO Dijagnoza(naziv) VALUES('Upala zuba usled implanta')
INSERT INTO Dijagnoza(naziv) VALUES('Upala desni usled implanta')


--(3)
INSERT INTO Dijagnoza(naziv) VALUES('Upala ocnog zivca')
INSERT INTO Dijagnoza(naziv) VALUES('Rasirene zenice')
INSERT INTO Dijagnoza(naziv) VALUES('Kratkovidost')
INSERT INTO Dijagnoza(naziv) VALUES('Dalekovidost')
INSERT INTO Dijagnoza(naziv) VALUES('Poviseni ocni pritisak')

--(1,2,3)
INSERT INTO Dijagnoza(naziv) VALUES('Visok pritisak')
INSERT INTO Dijagnoza(naziv) VALUES('Poviseni pritisak')
INSERT INTO Dijagnoza(naziv) VALUES('Nizak pritisak')
INSERT INTO Dijagnoza(naziv) VALUES('Srcana aritmija')


--Izvestaj pregleda:
--Za dijagnozu lenja creva recept je  probiotic,probiotic forte i pracetamol i on pripada zdravstvenom kartonu 1
 
--Za dijagnozu lenja creva recept je  probiotic,probiotic forte i pracetamol i on isto pripada zdravstvenom kartonu 1
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis drugog pregleda u izvestaju drugog pregleda.', 1, 2) 

--Za dijagnozu pomeren zeludac recept je  pracetamol i on  pripada zdravstvenom kartonu 2
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis treceg pregleda izvestaju treceg pregleda.', 1, 1) 

--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis cetvrtog pregleda u izvestaju cetvrtog pregleda.', 1, 1) 

--klinika(1):
--probiotic,probiotic forte, pracetamol u prvi recept prvoj sestri za lenja creva
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Probiotic,probiotic forte, pracetamol u prvi recept prvoj sestri za lenja creva.', 1, 1)
--bromazepam, paracetamol u drugi recept prvoj sestri za pomeren zeludac
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('bromazepam, paracetamol u drugi recept prvoj sestri za pomeren zeludac.', 2, 2)

--taylol hot, panadol extra u prvi recept drugoj sestri za upalu sinusa
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Taylol hot, panadol extra u prvi recept drugoj sestri za upalu sinusa.', 7, 3)
--panadol, aspirin u drugi recept drugoj sestri za alergiju na polen
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Panadol, aspirin u drugi recept drugoj sestri za alergiju na polen.', 8, 4)

--klinika(2):
-- PanadolExtra, Fuji 9 u prvi recept trecoj sestri za slomljeni zub
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('PanadolExtra, Fuji 9 u prvi recept trecoj sestri za slomljeni zub.', 11, 5)
--paracetamol, Fuji 9 u drugi recept trecoj sestri za ispalu plombu 
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Paracetamol, Fuji 9 u drugi recept trecoj sestri za ispalu plombu.', 13, 6)

--aspirin, panadol, paracetamol u  prvi recept cetvrtoj sestri za upalu zuba
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Aspirin, panadol, paracetamol u  prvi recept cetvrtoj sestri za upalu zuba.', 15, 7)
--aspirin, panadol, paracetamol u drugi recept cetvr sestri za upalu desni
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('aspirin, panadol, paracetamol u drugi recept cetvr sestri za upalu desni.', 16, 8)

--klinika(3):
--Aspirin, Vitaminiski mix u prvi recept trecoj sestri za upalu ocnog zivca
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Aspirin, Vitaminiski mix u prvi recept trecoj sestri za upalu ocnog zivca.', 17, 9)
--Hylocomid u drugi recept trecoj sestri za poviseni ocni pritisak
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Hylocomid u drugi recept trecoj sestri za poviseni ocni pritisak.', 21, 10)

-- u  Vitaminiski mix prvi recept cetvrtoj sestri za rasirene zenice
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Vitaminiski mix prvi recept cetvrtoj sestri za rasirene zenice.', 18, 11)
--aspirin, panadol, paracetamol u drugi recept cetvr sestri za kratkovidost
INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Aspirin, panadol, paracetamol u drugi recept cetvr sestri za kratkovidost.', 19, 12)


--predef pregledi za brzo zakazivanje
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis petog pregleda u izvestaju petog pregleda.', 1, 1) 
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis sestog pregleda u izvestaju sestog pregleda.', 1, 1) 
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis sedmog pregleda u izvestaju sedmog pregleda.', 1, 1) 
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis osmog pregleda u izvestaju osmog pregleda.', 1, 1) 
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis devetog pregleda u izvestaju devetog pregleda.', 1, 1) 
--INSERT INTO IZVESTAJ_PREGLEDA(opis_pregleda, DIJAGNOZA_ID, RECEPT_ID) VALUES('Opis desetog pregleda u izvestaju desetog pregleda.', 1, 1) 


--PredefinisaniPregledi:
--INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('20/2/2020', 'DD/MM/YYYY'), '12:00', 1, '2500', false, 1, 3, 2 , 1, 1, 1)
--INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('24/2/2020', 'DD/MM/YYYY'), '10:00', 2, '4500', false, 1, 5, 3 , 2, 2, 1)
--INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('24/2/2020', 'DD/MM/YYYY'), '10:00', 2, '4500', false, 2, 5, 3 ,2, 3, 1)
--INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('02/3/2020', 'DD/MM/YYYY'), '13:00', 1, '1500', false, 2, 3, 2 , 1, 4, 1)

--za test pre komitovanja:
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('8/3/2020', 'DD/MM/YYYY'),  '13:00', 1, '1500',false, 1, 1, 1 , 3, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('9/2/2020', 'DD/MM/YYYY'),  '14:00', 2, '2500',false, 1, 2, 2 , 4, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('10/2/2020', 'DD/MM/YYYY'), '17:00', 2.5,'2500',false, 1, 2, 3 , 5, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('11/2/2020', 'DD/MM/YYYY'), '12:00', 2.5,'3500',false, 2, 3, 3 , 1, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('12/2/2020', 'DD/MM/YYYY'), '11:00', 3,  '4000',false, 2, 4, 2 , 2, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('13/2/2020', 'DD/MM/YYYY'), '13:00', 1.5,'1000',false, 2, 5, 1 , 3, 10,NULL)


--Klinik(1)
--tipPregleda (1)/ izvestaj pregelda 1 i 2
--doktor(1)																																																						kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 1, 1, 1 , 1, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 2, 1 , 1, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 3, 1 , 1, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 1, 1, 1 , 1, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 1, 2, 1 , 1, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 3, 1 , 1, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 1, 1 , 1, 1, NULL)

--doktor(2)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 1, 1, 2 , 1, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 1, 1, 2 , 1, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 1, 1, 2 , 1, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 1, 1, 2 , 1, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 1, 1, 2 , 1, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 1, 1, 2 , 1, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 1, 1, 2 , 1, 1, NULL)

--tipPregleda (2); 
--doktor(3)		
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 1, 1, 3 , 2, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 2, 3 , 2, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 3, 3 , 2, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 1, 1, 3 , 2, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 1, 2, 3 , 2, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 3, 3 , 2, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 1, 3 , 2, 1, NULL)

--doktor(4)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 1, 1, 4 , 2, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 1, 1, 4 , 2, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 1, 1, 4 , 2, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 1, 1, 4 , 2, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 1, 1, 4 , 2, 1, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 1, 1, 4 , 2, 2, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 1, 1, 4 , 2, 1, NULL)

--tipPregleda (3);  izvestaj pregelda 3 i 4
--doktor(5)	
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 1, 1, 5 , 3, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 2, 5 , 3, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 3, 5 , 3, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 1, 1, 5 , 3, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 1, 2, 5 , 3, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 3, 5 , 3, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 1, 5 , 3, 3, NULL)	

--doktor(6)	
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 1, 1, 6 , 3, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 2, 6 , 3, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 3, 6 , 3, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 1, 1, 6 , 3, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 1, 2, 6 , 3, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 3, 6 , 3, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 1, 6 , 3, 3, NULL)	

--tipPregleda (4);
--doktor(7)		
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 1, 1, 7 , 4, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 2, 7 , 4, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 3, 7 , 4, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 1, 1, 7 , 4, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 1, 2, 7 , 4, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 3, 7 , 4, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 1, 7 , 4, 3, NULL)	
--doktor(8)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 1, 1, 8 , 4, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 2, 8 , 4, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 1, 3, 8 , 4, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 1, 1, 8 , 4, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 1, 2, 8 , 4, 3, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 3, 8 , 4, 4, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 1, 1, 8 , 4, 3, NULL)	



--Klinika(2)
--tipPregleda(5) / izvestaj pregelda 5 i 6
--doktor(12)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 2, 1, 12 , 5, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 2, 12 , 5, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 3, 12 , 5, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 2, 1, 12 , 5, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 2, 2, 12 , 5, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 3, 12 , 5, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 1, 12 , 5, 5, NULL)	

--doktor(13)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 2, 1, 13 , 5, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 2, 13 , 5, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 3, 13 , 5, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 2, 1, 13 , 5, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 2, 2, 13 , 5, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 3, 13 , 5, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 1, 13 , 5, 5, NULL)	

--tipPregleda(6)
--doktor(14)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 2, 1, 14 , 6, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 2, 14 , 6, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 3, 14 , 6, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 2, 1, 14 , 6, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 2, 2, 14 , 6, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 3, 14 , 6, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 1, 14 , 6, 5, NULL)	

--doktor(15)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 2, 1, 15 , 6, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 2, 15 , 6, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 3, 15 , 6, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 2, 1, 15 , 6, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 2, 2, 15 , 6, 5, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 3, 15 , 6, 6, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 1, 15 , 6, 5, NULL)	


--tipPregleda(7) /  izvestaj pregelda 7 i 8 
--doktor(16)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 2, 1, 16 , 7, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 2, 16 , 7, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 3, 16 , 7, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 2, 1, 16 , 7, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 2, 2, 16 , 7, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 3, 16 , 7, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 1, 16 , 7, 7, NULL)	

--doktor(17)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 2, 1, 17 , 7, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 2, 17 , 7, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 3, 17 , 7, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 2, 1, 17 , 7, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 2, 2, 17 , 7, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 3, 17 , 7, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 1, 17 , 7, 7, NULL)	

--tipPregleda(8) 
--doktor(18)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 2, 1, 18 , 8, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 2, 18 , 8, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 2, 3, 18 , 8, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 2, 1, 18 , 8, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 2, 2, 18 , 8, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 3, 18 , 8, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 2, 1, 18 , 8, 7, NULL)	

--doktor(19)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 2, 1, 19 , 8, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 2, 19 , 8, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 2, 3, 19 , 8, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 2, 1, 19 , 8, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 2, 2, 19 , 8, 7, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 3, 19 , 8, 8, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 2, 1, 19 , 8, 7, NULL)	


--Klinika(3)
--tipPregleda(9) / izvestaj pregelda 9 i 10
--doktor(22)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 3, 1, 22 , 9, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 2, 22 , 9, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 3, 22 , 9, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 3, 1, 22 , 9, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 3, 2, 22 , 9, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 3, 22 , 9, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 1, 22 , 9, 9, NULL)	

--doktor(23)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 3, 1, 23 , 9, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 2, 23 , 9, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 3, 23 , 9, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 3, 1, 23 , 9, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 3, 2, 23 , 9, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 3, 23 , 9, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 1, 23 , 9, 9, NULL)	


--tipPregleda(10)
--doktor(24)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 3, 1, 24 , 10, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 2, 24 , 10, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 3, 24 , 10, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 3, 1, 24 , 10, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 3, 2, 24 , 10, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 3, 24 , 10, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 1, 24 , 10, 9, NULL)	

--doktor(25)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 3, 1, 25 , 10, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 2, 25 , 10, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 3, 25 , 10, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 3, 1, 25 , 10, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 3, 2, 25 , 10, 9, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 3, 25 , 10, 10, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 1, 25 , 10, 9, NULL)	


--tipPregleda(11)   / izvestaj pregelda 11 i 12
--doktor(26)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 3, 1, 26 , 11, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 2, 26 , 11, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 3, 26 , 11, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 3, 1, 26 , 11, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 3, 2, 26 , 11, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 3, 26 , 11, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 1, 26 , 11, 11, NULL)	

--doktor(27)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 3, 1, 27 , 11, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 2, 27 , 11, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 3, 27 , 11, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 3, 1, 27 , 11, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 3, 2, 27 , 11, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 3, 27 , 11, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 1, 27 , 11, 11, NULL)	


--doktor(28)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '14:00', 1, '1500',false, 3, 1, 28 , 12, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 2, 28 , 12, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '14:00', 1, '2500',false, 3, 3, 28 , 12, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '14:00', 1, '3500',false, 3, 1, 28 , 12, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '14:00', 1, '4000',false, 3, 2, 28 , 12, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 3, 28 , 12, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '14:00', 1, '1000',false, 3, 1, 28 , 12, 11, NULL)	

--doktor(29)																																																					kli|sal|dok|tp|izP|pac
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('25/2/2020', 'DD/MM/YYYY'), '18:00', 1, '1500',false, 3, 1, 29 , 12, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('26/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 2, 29 , 12, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('27/2/2020', 'DD/MM/YYYY'), '18:00', 1, '2500',false, 3, 3, 29 , 12, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('28/2/2020', 'DD/MM/YYYY'), '18:00', 1, '3500',false, 3, 1, 29 , 12, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('29/2/2020', 'DD/MM/YYYY'), '18:00', 1, '4000',false, 3, 2, 29 , 12, 11, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('1/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 3, 29 , 12, 12, NULL)
INSERT INTO PREGLED(datum, vreme, trajanje, cena, prosao, KLINIKA_KLINIKA_ID, SALA_ID, DOKTOR_DOKTOR_ID, TIP_PREGLEDA_ID, IZVESTAJ_PREGLEDA_ID, PACIJENT_ID) VALUES(TO_DATE('2/3/2020', 'DD/MM/YYYY'),  '18:00', 1, '1000',false, 3, 1, 29 , 12, 11, NULL)






--OPERACIJA:
--prvi pacijent u sali 2 
INSERT INTO OPERACIJA(datum, vreme, trajanje, PACIJENT_ID, SALA_ID) VALUES('20.2.2020', '12:00',  '1', 1 ,2)

--prvi pacijent u sali 1 
INSERT INTO OPERACIJA(datum, vreme, trajanje, PACIJENT_ID, SALA_ID) VALUES('20.2.2020', '12:00', '1', 1, 1)

--prvi pacijent u sali 2 
INSERT INTO OPERACIJA(datum, vreme, trajanje, PACIJENT_ID, SALA_ID) VALUES('20.2.2020', '12:00', '1', 1, 2)

--prvi pacijent u sali 2 
INSERT INTO OPERACIJA(datum, vreme, trajanje, PACIJENT_ID, SALA_ID) VALUES('20.2.2020', '12:00', '1', 1, 2)

-----DOKTOR_OPERACIJA
--Za sve pacijent ce biti iste operacije prikazane cisto radi prikaza...
--sva 3 lekara
--klinika(1)
INSERT INTO VRSI_OPERACIJU(OPERACIJA_ID, DOKTOR_ID) VALUES (1,1),(1,2),(1,3) 
INSERT INTO VRSI_OPERACIJU(OPERACIJA_ID, DOKTOR_ID) VALUES (2,2),(2,3)
--klinika(2)
INSERT INTO VRSI_OPERACIJU(OPERACIJA_ID, DOKTOR_ID) VALUES (3,22),(3,23)
--klinika(3)
INSERT INTO VRSI_OPERACIJU(OPERACIJA_ID, DOKTOR_ID) VALUES (4,28),(3,29)