-- Lab week 6 questions

-- Part 1:
CREATE TABLE genre (
    genre               VARCHAR(20),
    catalog_no          INTEGER UNSIGNED,

    PRIMARY KEY (genre, catalog_no),

    CONSTRAINT FK_genre_cd 
        FOREIGN KEY (catalog_no) REFERENCES cd(catalog_no) 
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE track (
    track_no            DECIMAL(2,0),
    cd_no               INTEGER UNSIGNED,
    track_title         VARCHAR(50) NOT NULL,
    runtime             TIME,

    PRIMARY KEY(track_no, cd_no),

    CONSTRAINT FK_track_cd
        FOREIGN KEY (cd_no) REFERENCES cd(catalog_no)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

CREATE TABLE performs (
    artist_id           INT UNSIGNED,
    track_no            DECIMAL(2,0),
    cd_no               INTEGER UNSIGNED,

    PRIMARY KEY (artist_id, track_no, cd_no),

    CONSTRAINT FK_performs_artist
        FOREIGN KEY (artist_id) REFERENCES artist(id_number)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT FK_performs_track
        FOREIGN KEY (track_no, cd_no) REFERENCES track(track_no, cd_no)
        ON DELETE CASCADE 
        ON UPDATE CASCADE
);

-- Part 2:
ALTER TABLE cd 
    ADD COLUMN rating ENUM ('favourite', 'excel-lent', 'good', 'so-so', 'poor', 'rubbish');

-- Part 3:
set foreign_key_checks=0;
ALTER TABLE artist
    MODIFY id_number INT UNSIGNED AUTO_INCREMENT ;
set foreign_key_checks=1;

-- Part 4:
INSERT INTO artist (artist_name, webpage, date_of_birth)
VALUES ('Bruce Springsteen','www.brucespringsteen.net', '1949-09-23');

-- Part 5:
SELECT id_number, bio, email 
FROM artist;

-- Part 6:
INSERT INTO record_label (label_name)
VALUES ('Columbia');

INSERT INTO cd (catalog_no, title, publication_date, released_by, is_fronted_by, rating)
VALUES ('42', 'Magic', '2010-11-02', 'Columbia', '1', 'excel-lent');

UPDATE cd 
SET publication_date = '2008-10-03'
WHERE catalog_no = 42;