--ex1
SELECT 
	CONCAT(t1.firstname, ' ', t1.lastname) AS NombreCliente,
    t2.InvoiceId AS IdFactura,
    t2.InvoiceDate AS FechaFactura,
    t2.BillingCountry AS PaisFactura
FROM customers t1
INNER JOIN invoices t2 ON t1.CustomerId = t2.CustomerId
WHERE t1.country = 'Brazil'

--ex2
SELECT
	CONCAT(t1.firstname, ' ', t1.lastname) AS NombreEmpleado,
    t3.InvoiceId AS IdFactura,
    t3.InvoiceDate AS FechaFactura,
    t3.BillingCountry AS PaisFactura
FROM employees t1
INNER JOIN customers t2 ON t1.EmployeeId = t2.SupportRepId
INNER JOIN invoices t3 ON t2.CustomerId = t3.CustomerId


--ex3
SELECT
	CONCAT(t2.firstname, ' ', t2.lastname) AS NombreCliente,
    t2.Country AS PaisCliente,
    CONCAT(t1.firstname, ' ', t1.lastname) AS NombreEmpleado,
    SUM(t3.Total) AS VV,
    COUNT(t3.InvoiceId) AS NFacturas,
    SUM(t3.Total)/COUNT(t3.InvoiceId) AS CestaMedia
FROM employees t1
INNER JOIN customers t2 ON t1.EmployeeId = t2.SupportRepId
INNER JOIN invoices t3 ON t2.CustomerId = t3.CustomerId
GROUP BY 1,2,3
ORDER BY 4 DESC


--ex4
SELECT
	t1.invoicelineid,
    t1.InvoiceId,
    t2.Name
FROM invoice_items t1
INNER JOIN tracks t2 ON t1.TrackId = t2.TrackId

--ex5
SELECT
	t1.TrackId,
	t1.Name AS NombreCancion,
    t3.Name AS NombreFormato,
    t2.Title AS TituloAlbum,
    t4.Name AS NombreGenero
FROM tracks t1
INNER JOIN albums t2 ON t1.AlbumId = t2.AlbumId
INNER JOIN media_types t3 ON t1.MediaTypeId = t3.MediaTypeId
INNER JOIN genres t4 ON t1.GenreId = t4.GenreId

--ex6
SELECT
t2.PlaylistId,
t2.Name AS NombrePlaylist,
COUNT(t1.TrackId) AS NCanciones
FROM playlist_track t1 
INNER JOIN playlists t2 ON t1.PlaylistId = t2.PlaylistId
GROUP BY 1

SELECT
playlistid,
COUNT(trackid)
FROM playlist_track
GROUP BY 1


--ex7
SELECT
	employeeid,
	CONCAT(t1.firstname, ' ', t1.lastname) AS NombreEmpleado,
    SUM(t3.Total) AS VV,
    COUNT(t3.Total) AS NFacturas,
    COUNT(DISTINCT t2.CustomerId) AS NClientes
FROM employees t1
LEFT JOIN customers t2 ON t1.EmployeeId = t2.SupportRepId
LEFT JOIN invoices t3 ON t2.CustomerId = t3.CustomerId
GROUP BY 1,2
ORDER BY 3 DESC


--ex8
SELECT
	employeeid,
	CONCAT(t1.firstname, ' ', t1.lastname) AS NombreEmpleado,
    SUM(t3.Total) AS VV,
    COUNT(t3.Total) AS NFacturas,
    COUNT(DISTINCT t2.CustomerId) AS NClientes
FROM employees t1
INNER JOIN customers t2 ON t1.EmployeeId = t2.SupportRepId
INNER JOIN invoices t3 ON t2.CustomerId = t3.CustomerId
WHERE strftime('%Y', invoicedate) = '2009'
GROUP BY 1,2
ORDER BY 3 DESC

--ex9
SELECT
	t1.ArtistId,
    t1.Name,
    SUM(t4.UnitPrice * t4.Quantity) AS VV,
    COUNT(DISTINCT t5.InvoiceId) AS NCompras,
    COUNT(DISTINCT t6.CustomerId) AS NClientes
FROM artists t1
INNER JOIN albums t2 ON t1.ArtistId = t2.ArtistId
INNER JOIN tracks t3 ON t2.AlbumId = t3.AlbumId
INNER JOIN invoice_items t4 ON t3.TrackId = t4.TrackId
INNER JOIN invoices t5 ON t4.InvoiceId = t5.InvoiceId
INNER JOIN customers t6 ON t5.CustomerId = t6.CustomerId
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 3;




















