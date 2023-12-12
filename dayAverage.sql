SELECT t1.transaction_time, 
       (SELECT AVG(t2.transaction_amount) 
        FROM transactions t2 
        WHERE t2.transaction_time BETWEEN t1.transaction_time AND t1.transaction_time + INTERVAL '2 day') AS promedio_3_dias
FROM transactions t1
WHERE EXTRACT(MONTH FROM t1.transaction_time) = 1 AND EXTRACT(YEAR FROM t1.transaction_time) = 2021
ORDER BY t1.transaction_time;
