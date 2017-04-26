

SELECT DATE_TRUNC('week', created_at::date) AS week, count(*)
FROM organizations
WHERE created_at BETWEEN '10 Apr 2017' AND '25 Apr 2017'
GROUP BY week
ORDER BY week;


SELECT COUNT(*) AS total, SUM(CASE WHEN DATE_PART('dow', created_at) IN (2,6) THEN 1 ELSE 0 END) AS tues_or_sat FROM organizations where id < 150;


