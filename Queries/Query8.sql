--(25 pts) What is the total length of each playlist in hours? List the playlist id
--and name of only those playlists that are longer than 2 hours, along with the length in hours rounded to two decimals.
SELECT p.PlaylistId, p.Name AS PlaylistName, ROUND(SUM(t.Milliseconds) / 3600000.0, 2) AS LengthInHours
FROM playlists p
JOIN playlist_track pt ON pt.PlaylistId = p.PlaylistId
JOIN tracks t ON t.TrackId = pt.TrackId
GROUP BY p.PlaylistId, p.Name
HAVING SUM(t.Milliseconds) / 3600000.0 > 2
ORDER BY p.PlaylistId;