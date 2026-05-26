PRAGMA foreign_keys = ON;

BEGIN;

-- Check: ist Exemplar 5 frei?
SELECT COUNT(*) AS open_loans
FROM ausleihe
WHERE exemplar_id = 5
AND rueckgabe_datum IS NULL;

-- Insert loan (Lea Hartmann bekommt Exemplar 5)
INSERT INTO ausleihe (ausleihe_id, exemplar_id, mitglied_id, ausleihe_datum)
VALUES (5, 5, 3, CURRENT_DATE);

COMMIT;
