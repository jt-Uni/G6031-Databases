-- Lab week 8 questions

-- Part 1

SELECT track.track_title, artist.artist_name
FROM (performs NATURAL JOIN track)
JOIN artist ON performs.artist_id = artist.id_number
ORDER BY  track_title, artist_name;

-- Part 2

SELECT COUNT(id_number) number_artists
FROM artist;

-- Part 3

SELECT released_by label, COUNT(*) num_of_releases
FROM cd
GROUP BY released_by
ORDER BY num_of_releases DESC, label;

-- Part 4

SELECT label_name label, COUNT(cd.catalog_no) num_of_releases
FROM recordlabel 
LEFT OUTER JOIN cd ON cd.released_by = recordlabel.label_name
GROUP BY label_name
ORDER BY num_of_releases DESC, label;

-- Part 5

SELECT released_by label, genre, COUNT(*) num_of_releases
from cd
NATURAL JOIN genre
GROUP BY released_by, genre
ORDER BY num_of_releases DESC, label, genre;

-- Part 6

SELECT released_by label, genre, COUNT(*) num_of_releases
from cd
NATURAL JOIN genre
GROUP BY released_by, genre
HAVING num_of_releases > 1
ORDER BY num_of_releases DESC, label, genre;

-- Part 7

SELECT catalog_no, title, COUNT(catalog_no) num_of_tracks, SEC_TO_TIME(SUM(TIME_TO_SEC(runtime))) total_runtime
from cd 
JOIN track ON cd.catalog_no = track.cd_no
GROUP BY catalog_no;

-- Part 8
SELECT catalog_no, title, COUNT(catalog_no) num_of_tracks, 
IFNULL(SEC_TO_TIME(SUM(TIME_TO_SEC(runtime))), '00:00:00') total_runtime
from cd 
JOIN track ON cd.catalog_no = track.cd_no
GROUP BY catalog_no
HAVING total_runtime IS NOT NULL;