DROP KEYSPACE IF EXISTS filmoteka;

-- Tworzenie przestrzeni kluczy
CREATE KEYSPACE IF NOT EXISTS filmoteka WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

-- Używanie przestrzeni kluczy
USE filmoteka;

-- Tworzenie tabeli filmy
CREATE TABLE IF NOT EXISTS filmy (
    film_ID INT PRIMARY KEY,
    tytul TEXT,
    rok_produkcji INT,
    gatunek TEXT,
    rezyser_ID INT,
    ocena FLOAT
);

-- Tworzenie tabeli reżyserzy
CREATE TABLE IF NOT EXISTS rezyserzy (
    rezyser_ID INT PRIMARY KEY,
    imie TEXT,
    nazwisko TEXT,
    rok_urodzenia INT,
    kraj_pochodzenia TEXT
);

-- Wstawienie danych do tabeli reżyserzy
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (1, 'Steven', 'Spielberg', 1946, 'USA');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (2, 'Christopher', 'Nolan', 1970, 'UK');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (3, 'Quentin', 'Tarantino', 1963, 'USA');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (4, 'Martin', 'Scorsese', 1942, 'USA');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (5, 'James', 'Cameron', 1954, 'Canada');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (6, 'Ridley', 'Scott', 1937, 'UK');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (7, 'Peter', 'Jackson', 1961, 'New Zealand');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (8, 'Francis Ford', 'Coppola', 1939, 'USA');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (9, 'Stanley', 'Kubrick', 1928, 'USA');
INSERT INTO rezyserzy (rezyser_ID, imie, nazwisko, rok_urodzenia, kraj_pochodzenia) VALUES (10, 'David', 'Fincher', 1962, 'USA');

-- Wstawienie danych do tabeli filmy
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (1, 'Inception', 2010, 'Sci-Fi', 2, 8.8);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (2, 'Pulp Fiction', 1994, 'Crime', 3, 8.9);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (3, 'Jurassic Park', 1993, 'Adventure', 1, 8.1);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (4, 'The Dark Knight', 2008, 'Action', 2, 9.0);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (5, 'Avatar', 2009, 'Sci-Fi', 5, 7.8);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (6, 'Gladiator', 2000, 'Historical', 6, 8.5);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (7, 'The Lord of the Rings', 2001, 'Fantasy', 7, 8.8);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (8, 'The Godfather', 1972, 'Crime', 8, 9.2);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (9, '2001: A Space Odyssey', 1968, 'Sci-Fi', 9, 8.3);
INSERT INTO filmy (film_ID, tytul, rok_produkcji, gatunek, rezyser_ID, ocena) VALUES (10, 'Fight Club', 1999, 'Drama', 10, 8.8);

-- -- Przykładowe zapytania UPDATE, DELETE
-- UPDATE filmy SET ocena = 9.0 WHERE film_ID = 1;
-- DELETE FROM filmy WHERE film_ID = 3;

-- Wyświetlenie struktury tabeli filmy
DESCRIBE KEYSPACE filmoteka;
