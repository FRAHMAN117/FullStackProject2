CREATE DATABASE playlist;
USE playlist;
CREATE TABLE playlists(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);
CREATE TABLE songs (
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
artist VARCHAR(255) NOT NULL,
year INT,
playlists_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (playlists_id) REFERENCES playlists(id)
);

INSERT INTO playlists (name)
VALUES ('Celtic Women');
INSERT INTO playlists (name)
VALUES('Study Playlist'), ('Workout Playlist'), ('Sleeping Music');

SELECT * FROM playlists;
SELECT name FROM playlists;
SELECT id AS 'ID', name AS 'Playlist Name'
FROM playlists;
SELECT * FROM playlists ORDER BY name;

INSERT INTO songs (name, artist, year, playlists_id)
VALUES ('Mo Ghilear Mear', 'Celtic Women', 2007, 1),
	   ('The Dollhouse', 'Cécile Corbel', 2010, 2),
       ('Pump it', 'Meet bros', 2016, 3);
SELECT * FROM songs;
SELECT DISTINCT name FROM playlists;
SELECT * FROM songs;
SELECT * FROM playlists;
SELECT * FROM songs;
SELECT * FROM songs;
SELECT * FROM songs;
SELECT * FROM songs
WHERE year=2007 AND playlists_id= 1;
SELECT * FROM songs
WHERE name IS NOT NULL;

SELECT playlists.name AS Playlist_Name;
SELECT * FROM playlists
LEFT JOIN songs ON playlists.id = songs.playlists_id;