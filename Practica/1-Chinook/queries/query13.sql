SELECT 
	COUNT (invoicedate) AS Factura_Entre_2009_2011
FROM invoices
	WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2011-12-31 00:00:00';