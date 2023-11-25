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
ALTER TABLE artist
    MODIFY id_number INT UNSIGNED PRIMARY KEY AUTO_INCREMENT;