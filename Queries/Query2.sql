--(5 pts) What are the names of each album and the artist who created it?
SELECT a.Title, a2.Name
FROM albums a
JOIN artists a2 ON a.artistid = a2.artistid