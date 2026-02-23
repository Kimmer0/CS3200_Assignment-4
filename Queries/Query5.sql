--(10 pts) What are the names of the artists who made an album containing the substring "symphony" in the album title?
SELECT DISTINCT a.Name AS ArtistName
FROM artists a
JOIN albums a2 ON a.ArtistId = a2.ArtistId
WHERE a2.Title LIKE "%symphony%";