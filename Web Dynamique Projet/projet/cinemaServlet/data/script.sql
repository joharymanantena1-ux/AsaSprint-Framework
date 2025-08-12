\c postgres;
drop database cinemadb;
create database cinemadb;
\c cinemadb;

CREATE TABLE films (
    id_film SERIAL PRIMARY KEY,
    titre VARCHAR(255) NOT NULL,
    realisateur VARCHAR(100),
    annee_sortie INTEGER,
    genre VARCHAR(100)
);

CREATE TABLE clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telephone VARCHAR(20),
    mdp VARCHAR(100)
);

CREATE TABLE seances (
    id_seance SERIAL PRIMARY KEY,
    id_film INTEGER REFERENCES films(id_film),
    date_seance DATE,
    heure_debut TIME,
    heure_fin TIME,
    salle VARCHAR(50)
);

CREATE TABLE reservations (
    id_reservation SERIAL PRIMARY KEY,
    id_seance INTEGER REFERENCES seances(id_seance),
    id_client INTEGER REFERENCES clients(id_client),
    nombre_tickets INTEGER
);



-- Insertion dans la table films
INSERT INTO films (titre, realisateur, annee_sortie, genre) VALUES
('Inception', 'Christopher Nolan', 2010, 'Science Fiction'),
('The Godfather', 'Francis Ford Coppola', 1972, 'Crime'),
('The Dark Knight', 'Christopher Nolan', 2008, 'Action'),
('Pulp Fiction', 'Quentin Tarantino', 1994, 'Crime'),
('The Shawshank Redemption', 'Frank Darabont', 1994, 'Drama'),
('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama'),
('Fight Club', 'David Fincher', 1999, 'Drama'),
('The Matrix', 'Lana Wachowski, Lilly Wachowski', 1999, 'Action'),
('The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 2001, 'Adventure'),
('The Lord of the Rings: The Two Towers', 'Peter Jackson', 2002, 'Adventure'),
('The Lord of the Rings: The Return of the King', 'Peter Jackson', 2003, 'Adventure'),
('Gladiator', 'Ridley Scott', 2000, 'Action'),
('The Silence of the Lambs', 'Jonathan Demme', 1991, 'Crime'),
('Schindler''s List', 'Steven Spielberg', 1993, 'Biography'),
('The Departed', 'Martin Scorsese', 2006, 'Crime'),
('Goodfellas', 'Martin Scorsese', 1990, 'Biography'),
('Inglourious Basterds', 'Quentin Tarantino', 2009, 'Adventure'),
('The Prestige', 'Christopher Nolan', 2006, 'Drama'),
('Memento', 'Christopher Nolan', 2000, 'Mystery'),
('Interstellar', 'Christopher Nolan', 2014, 'Adventure');

-- Insertion dans la table seances
INSERT INTO seances (id_film, date_seance, heure_debut, heure_fin, salle) VALUES
(1, '2024-07-01', '18:00:00', '20:30:00', 'Salle 1'),
(2, '2024-07-02', '20:00:00', '23:00:00', 'Salle 2'),
(3, '2024-07-03', '16:00:00', '18:45:00', 'Salle 3'),
(4, '2024-07-04', '17:30:00', '19:45:00', 'Salle 1'),
(5, '2024-07-05', '19:00:00', '21:30:00', 'Salle 2'),
(6, '2024-07-06', '15:00:00', '17:45:00', 'Salle 3'),
(7, '2024-07-07', '18:30:00', '21:00:00', 'Salle 1'),
(8, '2024-07-08', '20:15:00', '23:00:00', 'Salle 2'),
(9, '2024-07-09', '14:00:00', '16:30:00', 'Salle 3'),
(10, '2024-07-10', '19:30:00', '22:00:00', 'Salle 1'),
(11, '2024-07-11', '21:00:00', '23:45:00', 'Salle 2'),
(12, '2024-07-12', '16:45:00', '19:15:00', 'Salle 3'),
(13, '2024-07-13', '18:00:00', '20:30:00', 'Salle 1'),
(14, '2024-07-14', '19:45:00', '22:15:00', 'Salle 2'),
(15, '2024-07-15', '15:30:00', '18:00:00', 'Salle 3'),
(16, '2024-07-16', '17:00:00', '19:30:00', 'Salle 1'),
(17, '2024-07-17', '20:30:00', '23:15:00', 'Salle 2'),
(18, '2024-07-18', '14:45:00', '17:00:00', 'Salle 3'),
(19, '2024-07-19', '18:15:00', '20:45:00', 'Salle 1'),
(20, '2024-07-20', '19:00:00', '21:30:00', 'Salle 2');

-- Insertion dans la table clients
INSERT INTO clients (nom, prenom, email, telephone, mdp) VALUES
('Razafindrakoto', 'Haja', 'haja.razafindrakoto@example.com', '0123456789', 'password123'),
('Rakotomalala', 'Fitiavana', 'fitiavana.rakotomalala@example.com', '0987654321', 'password456'),
('Rasolofonirina', 'Andry', 'andry.rasolofonirina@example.com', '0123456789', 'password789'),
('Rabearivelo', 'Jean', 'jean.rabearivelo@example.com', '0987654321', 'passwordabc'),
('Rajao', 'Fidisoa', 'fidisoa.rajao@example.com', '0123456789', 'passworddef'),
('Ramananarivo', 'Rija', 'rija.ramananarivo@example.com', '0987654321', 'passwordghi'),
('Rakotonirina', 'Hery', 'hery.rakotonirina@example.com', '0123456789', 'passwordjkl'),
('Rasoanaivo', 'Tahiry', 'tahiry.rasoanaivo@example.com', '0987654321', 'passwordmno'),
('Rakotondramanana', 'Tiana', 'tiana.rakotondramanana@example.com', '0123456789', 'passwordpqr'),
('Randriamamonjy', 'Mialy', 'mialy.randriamamonjy@example.com', '0987654321', 'passwordstu'),
('Razanamalala', 'Dina', 'dina.razanamalala@example.com', '0123456789', 'passwordvwx'),
('Rajemison', 'Tojo', 'tojo.rajemison@example.com', '0987654321', 'passwordyz'),
('Rakotomalala', 'Hery', 'hery.rakotomalala@example.com', '0123456789', 'password123'),
('Ratovonirina', 'Mamy', 'mamy.ratovonirina@example.com', '0987654321', 'password456'),
('Rajaonarivelo', 'Zo', 'zo.rajaonarivelo@example.com', '0123456789', 'password789'),
('Razafimahatratra', 'Ando', 'ando.razafimahatratra@example.com', '0987654321', 'passwordabc'),
('Rakotonirina', 'Fanja', 'fanja.rakotonirina@example.com', '0123456789', 'passworddef'),
('Ravelomanantsoa', 'Tantely', 'tantely.ravelomanantsoa@example.com', '0987654321', 'passwordghi'),
('Razanakoto', 'Lanto', 'lanto.razanakoto@example.com', '0123456789', 'passwordjkl'),
('Rakotondrabe', 'Tovo', 'tovo.rakotondrabe@example.com', '0987654321', 'passwordmno');


INSERT INTO clients (nom, prenom, email, telephone, mdp) VALUES
('Manantena', 'Johary', 'johary.manantena@gmail.com', '555896522', 'ETU2404');

-- Insertion dans la table reservations
INSERT INTO reservations (id_seance, id_client, nombre_tickets) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 1),
(4, 4, 2),
(5, 5, 3),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2),
(11, 11, 3),
(12, 12, 1),
(13, 13, 2),
(14, 14, 3),
(15, 15, 1),
(16, 16, 2),
(17, 17, 3),
(18, 18, 1),
(19, 19, 2),
(20, 20, 3);




-- STATISTIQUE Nombre de clients par genre de film
SELECT f.genre AS Genre, COUNT(DISTINCT r.id_client) AS Nombre_Clients
FROM films f
JOIN seances s ON f.id_film = s.id_film
JOIN reservations r ON s.id_seance = r.id_seance
GROUP BY f.genre
ORDER BY Nombre_Clients DESC LIMIT 5;

   genre   | nombre_clients
-----------+----------------
 Adventure |              5
 Crime     |              4
 Drama     |              4
 Action    |              3
 Biography |              2
(5 lignes)


