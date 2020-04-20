-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    duration_in_seconds INT NOT NULL,
    release_date DATE NOT NULL,
    album INT NOT NULL,
);

CREATE TABLE artists (
    artistID SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
);

CREATE TABLE albums (
    albumID SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    release_date DATE NOT NULL,
);

CREATE TABLE producers (
    producerID SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
);

CREATE TABLE song_artists (
    song_artistsID SERIAL PRIMARY KEY,
    song INT NOT NULL,
    artist INT NOT NULL,
);

CREATE TABLE song_producers (
    song_producersID SERIAL PRIMARY KEY,
    song INT NOT NULL,
    producer INT NOT NULL,
);

ALTER TABLE songs ADD CONSTRAINT fk_songs_album FOREIGN KEY(album)
REFERENCES albums (albumID);

ALTER TABLE song_artists ADD CONSTRAINT fk_song_artists_song FOREIGN KEY(song)
REFERENCES songs (id);

ALTER TABLE song_artists ADD CONSTRAINT fk_song_artists_artist FOREIGN KEY(artist)
REFERENCES artists (artistID);

ALTER TABLE song_producers ADD CONSTRAINT fk_song_producers_song FOREIGN KEY(song)
REFERENCES songs (id);

ALTER TABLE song_producers ADD CONSTRAINT fk_song_producers_producer FOREIGN KEY(producer)
REFERENCES producers (producerID);


