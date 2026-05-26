
-- DELETE 1: alte Ausleihen (> 30 Tage zurück)
BEGIN;

DELETE FROM ausleihe
WHERE rueckgabe_datum IS NOT NULL
AND julianday(CURRENT_DATE) - julianday(rueckgabe_datum) > 30;

SELECT * FROM ausleihe;

COMMIT;


-- DELETE 2: Versuch exemplar 3 löschen (Fehler erwartet)
BEGIN;

DELETE FROM exemplar
WHERE exemplar_id = 3;

SELECT * FROM exemplar;

ROLLBACK;


-- DELETE 3: zuerst abhängige Loans löschen, dann exemplar 3
BEGIN;

DELETE FROM ausleihe
WHERE exemplar_id = 3;

DELETE FROM exemplar
WHERE exemplar_id = 3;

SELECT * FROM exemplar;

COMMIT;
