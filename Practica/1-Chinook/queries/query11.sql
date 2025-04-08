SELECT 
	billingcountry, 
	COUNT(*) AS Cantidad
FROM invoices
	GROUP BY billingcountry
	ORDER by 2 DESC;