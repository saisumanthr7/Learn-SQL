SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
GROUP BY albums.band_id
HAVING COUNT(albums.id) = 0;

The query is causing an error because MySQL in ONLY_FULL_GROUP_BY mode requires all selected columns that are not part of an aggregate function to be included in the GROUP BY clause.
Below is the optimized query to not use group by:

SELECT bands.name AS 'Band Name'
FROM bands
LEFT JOIN albums ON bands.id = albums.band_id
WHERE albums.band_id IS NULL;
