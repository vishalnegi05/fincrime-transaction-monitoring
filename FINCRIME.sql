-- QUESTION 1: Structuring Detection

SELECT customer_id,'Structuring' AS alert
	FROM transactions
    WHERE type = 'deposit'
    AND amount < 10000
    GROUP BY 1 
    HAVING COUNT(*) >= 5;
    
-- QUESTION 2: Pass-Through (Mule Account Detection)

SELECT customer_id,
		SUM(CASE WHEN type = 'credit' THEN amount ELSE 0 END) AS total_in,
        SUM(CASE WHEN type = 'debit' THEN amount ELSE 0 END) AS total_out
FROM transactions
GROUP BY 1
HAVING total_in > 100000
AND  total_out > 100000
AND ABS( total_in - total_out) < 10000;

-- QUESTION 3: Sudden Spike Detection
        
SELECT customer_id,
		MAX(amount) AS max_transaction,
        AVG(amount) AS avg_transaction
FROM transactions
GROUP BY 1
HAVING MAX(amount) > 1.5*AVG(amount);

-- QUESTION 4: Profile Mismatch Detection

SELECT t.customer_id,
		c.monthly_income,
        t.amount
FROM transactions t JOIN customers c ON
t.customer_id = c.customer_id
WHERE t.amount > 5*c.monthly_income
;

-- FINAL AML SYSTEM QUERY

SELECT customer_id, 'Structuring' AS alert
FROM transactions
WHERE type = 'deposit' AND amount < 10000
GROUP BY customer_id
HAVING COUNT(*) >= 5

UNION

SELECT customer_id, 'Pass-Through' AS alert
FROM (
    SELECT 
        customer_id,
        SUM(CASE WHEN type='credit' THEN amount ELSE 0 END) AS total_in,
        SUM(CASE WHEN type='debit' THEN amount ELSE 0 END) AS total_out
    FROM transactions
    GROUP BY customer_id
) t
WHERE total_in > 100000 
AND total_out > 100000 
AND ABS(total_in - total_out) < 10000

UNION

SELECT t.customer_id, 'Profile Mismatch' AS alert
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.type = 'credit'
AND t.amount > 5 * c.monthly_income;
        