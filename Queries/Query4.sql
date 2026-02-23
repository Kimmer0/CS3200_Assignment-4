--(10 pts) Which states have more than 10 unique customers?
SElECT c.State, COUNT(DISTINCT c.CustomerId) AS UniqueCustomers
FROM customers c
WHERE c.State IS NOT NULL
GROUP BY c.State
HAVING COUNT(DISTINCT c.CustomerId) > 10
ORDER BY c.State;