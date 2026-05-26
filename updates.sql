
-- UPDATE 1: Verlag ändern
BEGIN;

UPDATE buch
SET verlag = 'Deutscher Taschenbuch Verlag'
WHERE verlag = 'dtv';

SELECT * FROM buch;

COMMIT;


-- UPDATE 2: Rückgabe setzen
BEGIN;

UPDATE ausleihe
SET rueckgabe_datum = CURRENT_DATE
WHERE ausleihe_id = 2;

SELECT * FROM ausleihe;

COMMIT;


-- UPDATE 3: Gebühr erhöhen
BEGIN;

UPDATE buch
SET tagesgebuehr = tagesgebuehr + 0.10
WHERE erscheinungsjahr < 1960;

SELECT * FROM buch;

COMMIT;
