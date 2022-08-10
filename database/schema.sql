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
  CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES author(id),
  CONSTRAINT fk_label FOREIGN KEY (label_id) REFERENCES label(id),
  CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES genre(id),
  CONSTRAINT fk_source FOREIGN KEY (source_id) REFERENCES source(id),
  PRIMARY KEY (id)
)
