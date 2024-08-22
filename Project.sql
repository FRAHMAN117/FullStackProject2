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



INSERT INTO songs (name, artist, year, playlists_id)
VALUES ('Mo Ghilear Mear', 'Celtic Women', 2007, 1),
	   ('The Dollhouse', 'Cécile Corbel', 2010, 2),
       ('Pump it', 'Meet bros', 2016, 3);
