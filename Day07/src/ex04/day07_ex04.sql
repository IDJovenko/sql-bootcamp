SELECT p.name, cv.count AS count_of_visits
FROM (SELECT person_id, COUNT(*)
	  FROM person_visits
	  GROUP BY person_id
      HAVING count(*)>3) cv
JOIN person p ON cv.person_id = p.id;
