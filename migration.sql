
-- 4a: neue Spalte hinzufügen
ALTER TABLE mitglied
ADD COLUMN telefon TEXT;


-- 4b: CHECK Constraint (SQLite Workaround)

-- Standard SQL (nur Kommentar):
-- ALTER TABLE buch ADD CONSTRAINT buch_jahr_plausibel
-- CHECK (erscheinungsjahr BETWEEN 1450 AND 2100);

-- SQLite Workaround:
CREATE TABLE buch_neu (
    isbn TEXT PRIMARY KEY,
    titel TEXT NOT NULL,
    erscheinungsjahr INTEGER NOT NULL CHECK (erscheinungsjahr BETWEEN 1450 AND 2100),
    verlag TEXT NOT NULL,
    tagesgebuehr NUMERIC(6,2) NOT NULL CHECK (tagesgebuehr > 0)
);

INSERT INTO buch_neu SELECT * FROM buch;
DROP TABLE buch;
ALTER TABLE buch_neu RENAME TO buch;


-- 4c: standort Länge begrenzen

-- Standard SQL (Kommentar):
-- ALTER TABLE exemplar ALTER COLUMN standort SET DATA TYPE VARCHAR(10);

-- SQLite Workaround:
CREATE TABLE exemplar_neu (
    exemplar_id INTEGER PRIMARY KEY,
    isbn TEXT NOT NULL,
    standort TEXT NOT NULL CHECK (length(standort) <= 10),
    FOREIGN KEY (isbn) REFERENCES buch(isbn)
);

INSERT INTO exemplar_neu SELECT * FROM exemplar;
DROP TABLE exemplar;
ALTER TABLE exemplar_neu RENAME TO exemplar;
