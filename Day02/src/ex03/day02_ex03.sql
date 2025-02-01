WITH date_list AS (
	SELECT generate_series('2022-01-01', '2022-01-10', '1 day'::INTERVAL) AS day
)
SELECT date_list.day::DATE AS missing_date
FROM date_list
LEFT JOIN (SELECT V.person_id, v.visit_date
		   FROM person_visits v
		   WHERE v.person_id = 1 OR v.person_id = 2) visited_d
	 ON visited_d.visit_date = date_list.day
WHERE visited_d.person_id IS NULL
ORDER BY missing_date ASC;
