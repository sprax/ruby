SELECT DATE_TRUNC('week', mm.date)::date AS md, COUNT(DISTINCT mm.profile_id)
FROM profile_message_metrics mm INNER JOIN (SELECT profile_id, MIN(DATE_TRUNC('week', date)::date) AS firstmd
                                            FROM profile_message_metrics GROUP BY profile_id) xx
                                ON mm.profile_id = xx.profile_id AND date_trunc('week', mm.date)::date = xx.firstmd
WHERE mm.messages > 0
GROUP BY (mm.profile_id, DATE_TRUNC('week', mm.date)::date);


# Rails/ActiveRecord: Account.where(...).select(:id).to_sql; query = User.where("users.account_id IN (#{subquery})")


# assistant_development=#
SELECT  mm.profile_id, DATE_TRUNC('week', mm.date)::date AS md, SUM(mm.messages)
FROM profile_message_metrics mm INNER JOIN (SELECT profile_id, MIN(DATE_TRUNC('week', date)::date) AS firstmd
                                            FROM profile_message_metrics GROUP BY profile_id) xx
ON mm.profile_id = xx.profile_id AND date_trunc('week', mm.date)::date = xx.firstmd
WHERE mm.messages > 0
GROUP BY (mm.profile_id, DATE_TRUNC('week', mm.date)::date);

# profile_id |     md     | sum 
#------------+------------+-----
#          1 | 2017-03-20 |  11
#          2 | 2017-01-16 |  30
#          (2 rows)



SELECT SUM(CAST(helpful AS Integer)) AS helpy, SUM(1 - CAST(helpful AS Integer)) AS nopy, (COUNT(*) - count(helpful)) AS nully from service_events;
  helpy | nopy | nully 
 -------+------+-------
      7 |    3 |  1672


SELECT DATE_TRUNC('week', created_at::date) AS week, count(*)
FROM organizations
WHERE created_at BETWEEN '10 Apr 2017' AND '25 Apr 2017'
GROUP BY week
ORDER BY week;


SELECT COUNT(*) AS total, SUM(CASE WHEN DATE_PART('dow', created_at) IN (2,6) THEN 1 ELSE 0 END) AS tues_or_sat FROM organizations where id < 150;


SELECT TO_CHAR(DATE_TRUNC('week', o.created_at::date), 'YYYY-MM-DD') AS iso_week, COUNT(DISTINCT o.id) AS oc, COUNT(DISTINCT p.id) AS pc, COUNT(DISTINCT t.id) AS tc
FROM organizations AS o JOIN profiles AS p ON p.organization_id = o.id JOIN bots ON bots.organization_id = o.id JOIN tickets AS t ON t.bot_id = bots.id
WHERE o.created_at BETWEEN '10 Apr 2017' AND '27 Apr 2017' GROUP BY iso_week ORDER BY iso_week;

SELECT TO_CHAR(DATE_TRUNC('week', o.created_at::date), 'YYYY-MM-DD') AS iso_week, COUNT(DISTINCT o.id) AS oc, COUNT(DISTINCT p.id) AS pc, COUNT(DISTINCT t.id) AS tc, SUM(DISTINCT CASE WHEN p.id = t.requestor_profile_id THEN 1 ELSE 0 END) AS apc FROM organizations AS o JOIN profiles AS p ON p.organization_id = o.id JOIN bots ON bots.organization_id = o.id JOIN tickets AS t ON t.bot_id = bots.id where o.created_at BETWEEN '10 Apr 2017' AND '27 Apr 2017' GROUP BY iso_week ORDER BY iso_week;
  iso_week | oc | pc  | tc | apc 
-----------+----+-----+----+-----
2017-04-10 | 11 | 224 | 95 |   1
2017-04-17 |  7 |  65 | 52 |   1
2017-04-24 |  8 | 210 | 54 |   1
(3 rows)

select TO_CHAR(DATE_TRUNC('week', o.created_at::date), 'YYYY-MM-DD') AS iso_week, COUNT(DISTINCT o.id) AS oc, COUNT(DISTINCT p.id) AS pc, COUNT(DISTINCT t.id) AS tc, COUNT((p.id IN (SELECT profile_id FROM workflow_states))) AS apc FROM organizations AS o JOIN profiles AS p ON p.organization_id = o.id JOIN bots ON bots.organization_id = o.id JOIN tickets AS t ON t.bot_id = bots.id where o.created_at BETWEEN '10 Apr 2017' AND '27 Apr 2017' GROUP BY iso_week ORDER BY iso_week;
  iso_week  | oc | pc  | tc | apc  
  ------------+----+-----+----+------
       2017-04-10 | 11 | 224 | 95 | 1953
   2017-04-17 |  7 |  65 | 52 |  450
    2017-04-24 | 10 | 217 | 67 | 1751
    (3 rows)



