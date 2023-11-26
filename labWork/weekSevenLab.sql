-- Lab week 7 questions

-- Part 1

SET SQL_SAFE_UPDATES = 0;
UPDATE cd
SET publication_date = '2007-10-01'
WHERE title = 'Magic';
SET SQL_SAFE_UPDATES = 1;

-- Part 3 

SELECT artist_name, webpage
FROM artist

-- Part 4

SELECT title, is_fronted_by 
FROM cd
JOIN artist ON cd.is_fronted_by = artist.id_number;

-- Part 5

SELECT title
FROM cd 
JOIN artist ON cd.is_fronted_by = artist.id_number
WHERE artist_name LIKE BINARY 'B%'
ORDER BY artist_name;

-- Part 6

SELECT UPPER (title)
FROM cd 
JOIN artist ON cd.is_fronted_by = artist.id_number
WHERE artist_name LIKE BINARY 'B%'
ORDER BY artist_name;

-- Part 7

SELECT artist_name
FROM cd 
JOIN artist ON cd.is_fronted_by = artist.id_number
WHERE DATE_SUB(CURDATE(),INTERVAL 10 YEAR) <= publication_date
ORDER BY artist_name;

-- Part 8

SELECT CONCAT(LEFT(bio,15),'. . .', RIGHT(bio,15)) AS ShortBio
FROM artist;