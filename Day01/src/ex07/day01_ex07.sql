SELECT ord.order_date,
	   p.name ||
       ' (age:' || p.age || ')' AS person_information
FROM person_order ord
JOIN person p ON ord.person_id = p.id
ORDER BY ord.order_date ASC, person_information ASC;