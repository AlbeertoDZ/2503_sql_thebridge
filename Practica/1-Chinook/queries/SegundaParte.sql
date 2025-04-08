--1

SELECT DISTINCT
	customers.FirstName||' '|| customers.LastName AS NombreCompleto, --Nombre cliente
    invoices.InvoiceId, --ID Factura
    invoices.InvoiceDate, --Fecha factura
    invoices.BillingCountry --Pais de la factura
From invoices
INNER JOIN customers
on customers.CustomerId = invoices.CustomerId
WHERE customers.Country = 'Brazil';

--2

SELECT 
	invoices.InvoiceId AS FacturaAsociada,
	employees.FirstName || ' ' || employees.LastName AS NombreCompleto
FROM invoices 
INNER JOIN customers
ON invoices.CustomerId = customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId;


--3
SELECT 
	COunt(invoices.InvoiceId) AS Total,
    employees.FirstName||' '||employees.LastName AS NombreEmpleado,
    customers.FirstName||' '||customers.LastName AS NombreCliente,
    customers.Country AS PaisCliente
FROM invoices
INNER JOIN customers
ON invoices.CustomerId = customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId
GROUP BY 3;

--4
SELECT invoice_items.InvoiceLineId, tracks.Name
FROM invoice_items
INNER JOIN tracks
ON invoice_items.TrackId = tracks.TrackId
order by tracks.Name ASC;

--5
SELECT 
	tracks.Name AS Cancion,
	media_types.Name AS Formato,
    albums.Title AS Album,
    genres.Name AS Genero
FROM tracks
INNER JOIN media_types
ON tracks.MediaTypeId = media_types.MediaTypeId
INNER JOIN albums
ON tracks.AlbumId = albums.AlbumId
INNER JOin genres
ON tracks.GenreId = genres.GenreId;

--6
SELECt playlists.Name, COUNT(playlist_track.TrackId)
FROM playlists
INNER JOIN playlist_track
ON playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.Name
ORDER BY 2 ASC;

--7
SELECT 
	COUNT(invoices.InvoiceId), 
	employees.FirstName||' '|| employees.LastName
FROM invoices
INNER JOIN customers
ON invoices.CustomerId = customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId
GROUP BY 2;

--8
SELECT 
	COUNT(invoices.InvoiceId), 
	employees.FirstName||' '|| employees.LastName
FROM invoices
INNER JOIN customers
ON invoices.CustomerId = customers.CustomerId
INNER JOIN employees
ON customers.SupportRepId = employees.EmployeeId
WHERE employees.Title = 'Sales Support Agent' AND invoices.InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31'
GROUP BY 2
ORDER by 1 DESC
LIMIT 1;

--9
SELECT 
	COUNT(invoices.InvoiceId),
	artists.Name AS NombreGrupo
FROM invoices
INNER JOIN invoice_items
ON invoices.InvoiceId = invoice_items.InvoiceId
INNER JOIN tracks
ON invoice_items.TrackId = tracks.TrackId
INNER JOIN albums
ON albums.AlbumId = tracks.AlbumId
INNER JOIN artists
ON artists.ArtistId = albums.ArtistId
GROUP BY 2
ORDER BY 1 DESC
LIMIT 3;