SELECT 
	billingcountry, 
	COUNT(*) AS Cantidad
FROM invoices
	GROUP BY billingcountry