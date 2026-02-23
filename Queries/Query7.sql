--(20 pts) How many artists published at least 10 MPEG tracks?
SELECT a.Name AS ArtistName, COUNT(t.TrackId) AS MPEGTrackCount
FROM artists a
JOIN albums a2 ON a2.ArtistId = a.ArtistId
JOIN tracks t ON t.AlbumId = a2.AlbumId
JOIN media_types m ON m.MediaTypeId = t.MediaTypeId
WHERE m.MediaTypeId IN (1, 3)
GROUP BY a.Name
HAVING COUNT(t.TrackId) >= 10;