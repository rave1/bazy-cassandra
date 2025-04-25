DROP KEYSPACE IF EXISTS kina;

-- Tworzenie przestrzeni kluczy kina
CREATE KEYSPACE IF NOT EXISTS kina WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3};

-- Używanie przestrzeni kluczy
USE kina;

-- Tworzenie tabel
CREATE TABLE IF NOT EXISTS sale_kinowe (
    sala_ID INT PRIMARY KEY,
    nazwa TEXT,
    liczba_miejsc INT
);

CREATE TABLE IF NOT EXISTS seanse (
    seans_ID INT PRIMARY KEY,

    film TEXT,
    data_seansu TIMESTAMP,
    sala_ID INT
);

CREATE TABLE IF NOT EXISTS bilety (
    bilet_ID INT PRIMARY KEY,
    seans_ID INT,
    miejsce INT,
    cena DECIMAL
);

CREATE TABLE IF NOT EXISTS pracownicy (
    pracownik_ID INT PRIMARY KEY,
    imie TEXT,
    nazwisko TEXT,
    stanowisko TEXT
);

CREATE TABLE IF NOT EXISTS kontrahenci (
    kontrahent_ID INT PRIMARY KEY,
    nazwa TEXT,
    adres TEXT,
    numer_telefonu TEXT
);

-- Wstawianie przykładowych danych
INSERT INTO sale_kinowe (sala_ID, nazwa, liczba_miejsc) VALUES (1, 'Sala 1', 100);
INSERT INTO sale_kinowe (sala_ID, nazwa, liczba_miejsc) VALUES (2, 'Sala 2', 150);
INSERT INTO sale_kinowe (sala_ID, nazwa, liczba_miejsc) VALUES (3, 'Sala 3', 80);
INSERT INTO sale_kinowe (sala_ID, nazwa, liczba_miejsc) VALUES (4, 'Sala 4', 120);
INSERT INTO sale_kinowe (sala_ID, nazwa, liczba_miejsc) VALUES (5, 'Sala 5', 90);

INSERT INTO seanse (seans_ID, film, data_seansu, sala_ID) VALUES (1, 'Inception', '2025-04-10 18:00:00', 1);
INSERT INTO seanse (seans_ID, film, data_seansu, sala_ID) VALUES (2, 'Avatar', '2025-04-11 20:00:00', 2);
INSERT INTO seanse (seans_ID, film, data_seansu, sala_ID) VALUES (3, 'Gladiator', '2025-04-12 17:30:00', 3);
INSERT INTO seanse (seans_ID, film, data_seansu, sala_ID) VALUES (4, 'Pulp Fiction', '2025-04-13 21:00:00', 4);
INSERT INTO seanse (seans_ID, film, data_seansu, sala_ID) VALUES (5, 'The Dark Knight', '2025-04-14 19:00:00', 5);

INSERT INTO bilety (bilet_ID, seans_ID, miejsce, cena) VALUES (1, 1, 10, 25.00);
INSERT INTO bilety (bilet_ID, seans_ID, miejsce, cena) VALUES (2, 2, 15, 30.00);
INSERT INTO bilety (bilet_ID, seans_ID, miejsce, cena) VALUES (3, 3, 5, 20.00);
INSERT INTO bilety (bilet_ID, seans_ID, miejsce, cena) VALUES (4, 4, 22, 28.00);
INSERT INTO bilety (bilet_ID, seans_ID, miejsce, cena) VALUES (5, 5, 30, 35.00);

INSERT INTO pracownicy (pracownik_ID, imie, nazwisko, stanowisko) VALUES (1, 'Jan', 'Kowalski', 'Kasjer');
INSERT INTO pracownicy (pracownik_ID, imie, nazwisko, stanowisko) VALUES (2, 'Anna', 'Nowak', 'Menadżer');
INSERT INTO pracownicy (pracownik_ID, imie, nazwisko, stanowisko) VALUES (3, 'Piotr', 'Zieliński', 'Ochroniarz');
INSERT INTO pracownicy (pracownik_ID, imie, nazwisko, stanowisko) VALUES (4, 'Marta', 'Wiśniewska', 'Sprzedawca');
INSERT INTO pracownicy (pracownik_ID, imie, nazwisko, stanowisko) VALUES (5, 'Tomasz', 'Lewandowski', 'Sprzątacz');

INSERT INTO kontrahenci (kontrahent_ID, nazwa, adres, numer_telefonu) VALUES (1, 'FilmCorp', 'Warszawa, ul. Kino 1', '123-456-789');
INSERT INTO kontrahenci (kontrahent_ID, nazwa, adres, numer_telefonu) VALUES (2, 'PopcornMax', 'Kraków, ul. Smakowa 2', '987-654-321');
INSERT INTO kontrahenci (kontrahent_ID, nazwa, adres, numer_telefonu) VALUES (3, 'CineTech', 'Wrocław, ul. Techniczna 3', '456-789-123');
INSERT INTO kontrahenci (kontrahent_ID, nazwa, adres, numer_telefonu) VALUES (4, 'ScreenVision', 'Poznań, ul. Ekranowa 4', '321-654-987');
INSERT INTO kontrahenci (kontrahent_ID, nazwa, adres, numer_telefonu) VALUES (5, 'LightSound', 'Gdańsk, ul. Dźwiękowa 5', '654-321-987');
