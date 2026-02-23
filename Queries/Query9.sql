--(25 pts) Creative addition: Define a new meaningful query using at least three tables,
--and some window function. Explain clearly what your query achieves, and what the results mean
-- For each customer, show their total spending compared to their country's average.
SELECT
    c.FirstName || ' ' || c.LastName AS CustomerName,
    c.Country,
    ROUND(SUM(ii.UnitPrice * ii.Quantity), 2) AS TotalSpent,
    ROUND((SELECT AVG(sub.CustomerTotal)
           FROM (SELECT SUM(ii2.UnitPrice * ii2.Quantity) AS CustomerTotal
                 FROM customers c2
                 JOIN invoices i2 ON c2.CustomerId = i2.CustomerId
                 JOIN invoice_items ii2 ON i2.InvoiceId = ii2.InvoiceId
                 WHERE c2.Country = c.Country
                 GROUP BY c2.CustomerId) sub), 2) AS CountryAvgSpend
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
JOIN invoice_items ii ON i.InvoiceId = ii.InvoiceId
WHERE c.Country IS NOT NULL
GROUP BY c.CustomerId, c.FirstName, c.LastName, c.Country
ORDER BY c.Country;