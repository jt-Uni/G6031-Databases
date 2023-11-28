-- Lab week 9 questions

-- Part 1

-- A
SELECT artist_name
FROM artist
LEFT OUTER JOIN cd
ON artist.artist_id = cd.is_fronted_by
ORDER BY artist_name;

--B

-- Part 2

