INSERT INTO exemplar (isbn, standort)
SELECT isbn, 'Neu-' || standort
FROM exemplar e
WHERE (
    SELECT COUNT(*)
    FROM ausleihe a
    WHERE a.exemplar_id = e.exemplar_id
) > 1;
