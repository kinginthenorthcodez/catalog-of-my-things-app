CREATE DATABASE MyThings;

DROP TABLE IF EXISTS source;

DROP TABLE IF EXISTS movie;

DROP TABLE IF EXISTS item;

DROP TABLE IF EXISTS author;

DROP TABLE IF EXISTS game;

DROP TABLE IF EXISTS music_album;

DROP TABLE IF EXISTS genre;


CREATE TABLE item(
  id INT NOT NULL Generated Always As Identity,
  genre_id INT,
  source_id INT,
  label_id INT,
  author_id INT,
  publish_date Date,
  archived Boolean,

  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_source FOREIGN KEY(source_id) REFERENCES source(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,

  PRIMARY KEY(id)
);

CREATE TABLE movie(
  id INT NOT NULL Generated Always As Identity,
  silent Boolean,
  publish_date Date,
  archived Boolean,
  genre_id int NULL,
  author_id int NULL,
  source_id int NULL,
  label_id int NULL,

  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id),
  CONSTRAINT fk_source FOREIGN KEY (source_id) REFERENCES source(id),

  PRIMARY KEY (id)
);

CREATE TABLE source(
  id INT NOT NULL Generated Always As Identity,
  name varchar(100) NULL,

  PRIMARY KEY (id)
);

CREATE TABLE genre(
  id INT NOT NULL Generated Always As Identity,
  name varchar(100) NULL,
  
  PRIMARY KEY (id)
);


Create Table label (
  id INT NOT NULL Generated Always As Identity,
  title Varchar(250)
  color Varchar(250)
  PRIMARY KEY (id)
)

Create TABLE book (
  id INT NOT NULL Generated Always As Identity,
  publisher Varchar(250),
  cover_state Varchar(50),
  publish_date Date,
  archived Boolean,
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id),
  CONSTRAINT fk_source FOREIGN KEY (source_id) REFERENCES source(id),
  PRIMARY KEY (id)
)

CREATE TABLE author(
  id INT NOT NULL Generated Always As Identity,
  first_name varchar(50),
  last_name varchar(50),
  items TEXT [],

  PRIMARY KEY(id)
);

CREATE TABLE game(
  id INT NOT NULL Generated Always As Identity,
  multiplayer Boolean,
  last_played_at varchar(50),
  genre_id INT,
  source_id INT,
  label_id INT,
  author_id INT,
  publish_date Date,
  archived Boolean,
  
  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_source FOREIGN KEY(source_id) REFERENCES source(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
  PRIMARY KEY(id)
);

CREATE TABLE music_album(
  id INT NOT NULL Generated Always As Identity,
  on_spotify Boolean,
  genre_id INT,
  source_id INT,
  label_id INT,
  author_id INT,
  publish_date Date,
  archived Boolean,
  
  CONSTRAINT fk_genre FOREIGN KEY(genre_id) REFERENCES genre(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_source FOREIGN KEY(source_id) REFERENCES source(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_label FOREIGN KEY(label_id) REFERENCES label(id) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT fk_author FOREIGN KEY(author_id) REFERENCES author(id) ON DELETE SET NULL ON UPDATE CASCADE,
  PRIMARY KEY(id)
);

