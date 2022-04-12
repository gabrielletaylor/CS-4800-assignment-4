
CREATE TABLE Notown.instrument (
                name VARCHAR NOT NULL,
                pitch VARCHAR NOT NULL,
                CONSTRAINT instrument_pk PRIMARY KEY (name)
);


CREATE TABLE Notown.address (
                addressID INTEGER NOT NULL,
                number INTEGER NOT NULL,
                street1 VARCHAR NOT NULL,
                street2 VARCHAR NOT NULL,
                city VARCHAR NOT NULL,
                state VARCHAR NOT NULL,
                zipCode VARCHAR NOT NULL,
                telephone VARCHAR NOT NULL,
                CONSTRAINT address_pk PRIMARY KEY (addressID)
);


CREATE TABLE Notown.musician (
                ssn INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                addressID INTEGER NOT NULL,
                CONSTRAINT musician_pk PRIMARY KEY (ssn)
);


CREATE TABLE Notown.album (
                albumID INTEGER NOT NULL,
                title VARCHAR NOT NULL,
                release_date DATE NOT NULL,
                format VARCHAR NOT NULL,
                age INTEGER NOT NULL,
                ssn_producer INTEGER NOT NULL,
                CONSTRAINT album_pk PRIMARY KEY (albumID)
);
COMMENT ON COLUMN Notown.album.age IS 'calculated attribute';


CREATE TABLE Notown.song (
                title VARCHAR NOT NULL,
                length INTEGER NOT NULL,
                ssn_author INTEGER NOT NULL,
                albumID INTEGER NOT NULL,
                CONSTRAINT song_pk PRIMARY KEY (title)
);


CREATE TABLE Notown.performs (
                ssn INTEGER NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT performs_pk PRIMARY KEY (ssn, title)
);


CREATE TABLE Notown.uses (
                name VARCHAR NOT NULL,
                title VARCHAR NOT NULL,
                CONSTRAINT uses_pk PRIMARY KEY (name, title)
);


CREATE TABLE Notown.plays (
                ssn INTEGER NOT NULL,
                name VARCHAR NOT NULL,
                CONSTRAINT plays_pk PRIMARY KEY (ssn, name)
);


ALTER TABLE Notown.plays ADD CONSTRAINT instrument_plays_fk
FOREIGN KEY (name)
REFERENCES Notown.instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.uses ADD CONSTRAINT instrument_uses_fk
FOREIGN KEY (name)
REFERENCES Notown.instrument (name)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.musician ADD CONSTRAINT address_musician_fk
FOREIGN KEY (addressID)
REFERENCES Notown.address (addressID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.plays ADD CONSTRAINT musician_plays_fk
FOREIGN KEY (ssn)
REFERENCES Notown.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.song ADD CONSTRAINT musician_song_fk
FOREIGN KEY (ssn_author)
REFERENCES Notown.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.album ADD CONSTRAINT musician_album_fk
FOREIGN KEY (ssn_producer)
REFERENCES Notown.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.performs ADD CONSTRAINT musician_performs_fk
FOREIGN KEY (ssn)
REFERENCES Notown.musician (ssn)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.song ADD CONSTRAINT album_song_fk
FOREIGN KEY (albumID)
REFERENCES Notown.album (albumID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.uses ADD CONSTRAINT song_uses_fk
FOREIGN KEY (title)
REFERENCES Notown.song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Notown.performs ADD CONSTRAINT song_performs_fk
FOREIGN KEY (title)
REFERENCES Notown.song (title)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
