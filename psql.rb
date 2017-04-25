

SELECT DATE_TRUNC('week', created_at::date) AS week, count(*)
FROM organizations
WHERE created_at BETWEEN '10 Apr 2017' AND '25 Apr 2017'
GROUP BY week
ORDER BY week;



