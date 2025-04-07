SELECT 
	COUNT (country) AS España_Y_Brasil
FROM customers
	WHERE country = 'Spain' OR country = 'Brazil';