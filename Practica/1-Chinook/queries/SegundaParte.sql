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