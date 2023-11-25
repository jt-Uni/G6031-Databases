-- Lab week 5 questions

CREATE TABLE record_label (
    label_name      VARCHAR(30) PRIMARY KEY,
    webpage         VARCHAR(40),
    house           CHAR(6),
    street          VARCHAR(50),
    postcode        CHAR(8),
    country         VARCHAR(30),
    email           VARCHAR(50),
    town            VARCHAR(25)
);

CREATE TABLE artist (
    id_number       INTEGER UNSIGNED PRIMARY KEY,
    artist_name     VARCHAR(50),
    bio             TEXT,
    email           VARCHAR(50),
    webpage         VARCHAR(50),
    date_of_birth   DATE
);

CREATE TABLE cd (
    catalog_no          INTEGER UNSIGNED PRIMARY KEY,
    title               VARCHAR(50) NOT NULL,
    publication_date    DATE,
    released_by         VARCHAR(30) NOT NULL,
    original            INTEGER UNSIGNED,
    is_fronted_by       INTEGER UNSIGNED,

    CONSTRAINT fk_cd_label_
        FOREIGN KEY (released_by) REFERENCES record_label(label_name),

    CONSTRAINT fk_cd_artist_
        FOREIGN KEY (is_fronted_by) REFERENCES artist(id_number),

    CONSTRAINT fk_cd_original_
        FOREIGN KEY (original) REFERENCES cd(catalog_no)
);