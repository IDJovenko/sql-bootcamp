SELECT p.name, cv.count_of_visits
FROM (SELECT person_id, COUNT(*) AS count_of_visits
	  FROM person_visits
	  GROUP BY person_id
	  ORDER BY count_of_visits DESC, person_id ASC) cv
JOIN person p ON cv.person_id = p.id
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;
