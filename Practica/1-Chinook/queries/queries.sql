--ex11
SELECT
	billingcountry,
    COUNT(invoiceid) AS NFacturas
FROM invoices
GROUP BY 1
ORDER BY 2 DESC;

--ex12
SELECT 
	strftime('%Y', invoicedate) AS Año,
    COUNT(invoiceid)
FROM invoices
WHERE Año IN ('2009', '2011')
GROUP BY 1;

--ex13
SELECT 
	CAST(strftime('%Y', invoicedate) AS int) AS Año,
    COUNT(invoiceid)
FROM invoices
WHERE Año BETWEEN 2009 AND 2011
GROUP BY 1;

--ex14
SELECT SUM(NClientes)
FROM
(SELECT
country,
COUNT(customerid) AS NClientes
FROM customers
WHERE country IN ('Brazil','Spain')
GROUP BY 1);

SELECT
COUNT(customerid) AS NClientes
FROM customers
WHERE country IN ('Brazil','Spain');

--ex15
SELECT
*
FROM tracks
WHERE LOWER(name) LIKE 'you %';







