-- Selecciona les coleccions amb un nom d’una allargada menor a 10 caràcters.
SELECT * FROM Coleccio WHERE LENGTH(Nom_Coleccio) < 10;
-- Retorna la data i hora actuals.
SELECT NOW();
-- Retorna totes les entregues on la seva data sigui en el futur (més gran que l’actual).
SELECT * FROM Entrega WHERE Data_Entrega > CURRENT_DATE();
-- Tenim una taula de nom cercles (amb) i un atribut radi. Calcula per cada un el perímetre de la circumferència (2*Pi*r).
SELECT 2*PI()*radi AS Perimetre_Circumferencia FROM  cercles;
-- Tenim una taula de productes amb el preu del producte i l’impost a aplicar. Retorna tots els preus amb l’impost corresponent aplicat.
SELECT preu+(preu*impost) AS Total_preu_impost FROM Productes;
-- Retorna elsregals que no tinguin pes assignat.
SELECT ID_Regal FROM Regal WHERE pes = NULL;
-- Retorna una llista amb es mails vàlids ( format: NOM@DOMINI.ALGO )
SELECT ID_usuari, email FROM Usuari WHERE email LIKE '_%@_%_.%';
-- Retorna les entregues que tinguin entre 50 i 60 pàgines.
SELECT Nom_Coleccio , num_pagines FROM Entrega WHERE num_pagines BETWEEN 50 AND 60;
-- Crea una vista amb el resultat d’un select dels DNI i targeta dels subscriptors associats d’aquest document.
SELECT VIEW targeta_DNI AS SELECT DNI, Num_Targeta FROM Usuari AS u, subcriptor AS s
WHERE u.id_usuari = s.id_usuari AND s.associat IS TRUE; 


-- CRATE VIEW targeta_dni AS