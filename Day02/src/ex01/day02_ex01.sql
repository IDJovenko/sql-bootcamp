SELECT date_list::DATE AS missing_date
FROM generate_series('2022-01-01', '2022-01-10', '1 day'::INTERVAL) AS date_list
LEFT JOIN (SELECT V.person_id, v.visit_date
		   FROM person_visits v
		   WHERE v.person_id = 1 OR v.person_id = 2) visited_d
	 ON visited_d.visit_date = date_list
WHERE visited_d.person_id IS NULL
ORDER BY missing_date ASC;
