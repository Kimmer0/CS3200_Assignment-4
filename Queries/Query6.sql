--(15 pts) What are the names of all artists who performed MPEG (video or audio) tracks in
--either the "Brazilian Music" or the "Grunge" playlists?
SELECT DISTINCT a.Name AS ArtistName
FROM artists a
JOIN albums a2 ON a2.ArtistId = a.ArtistId
JOIN tracks t ON t.AlbumId = a2.AlbumId
JOIN media_types m ON m.MediaTypeId = t.MediaTypeId
JOIN playlist_track pt ON pt.TrackId = t.TrackId
JOIN playlists p ON p.PlaylistId = pt.PlaylistId
WHERE m.MediaTypeId IN (1,3) AND p.PlaylistId IN (11, 16);