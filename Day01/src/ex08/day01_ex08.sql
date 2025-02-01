SELECT ord.order_date,
	   natural_p.name ||
       ' (age:' || natural_p.age || ')' AS person_information
FROM person_order ord
NATURAL JOIN (SELECT p.id AS person_id, p.name, p.age
              FROM person p) AS natural_p
ORDER BY ord.order_date ASC, person_information ASC;