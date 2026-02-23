--(10 pts) What are the total number of unique customers for each state, ordered alphabetically by state?
SELECT c.State, COUNT(DISTINCT c.CustomerId) AS UniqueCustomers
FROM customers c
WHERE c.State IS NOT NULL
GROUP BY c.State
ORDER BY c.State;