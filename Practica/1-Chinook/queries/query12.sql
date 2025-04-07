SELECT 
	COUNT (invoicedate) AS Factura_En_2009_2011
FROM invoices
	WHERE invoicedate BETWEEN '2009-01-01 00:00:00' AND '2009-12-31 23:59:59' 
    OR invoicedate BETWEEN '2011-01-01 00:00:00' AND '2011-12-31 23:59:59';
	