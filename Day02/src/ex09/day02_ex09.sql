SELECT DISTINCT p.name
FROM person_order ord
JOIN person p ON ord.person_id = p.id
JOIN menu m ON ord.menu_id = m.id
WHERE p.gender='female' AND
	 (m.pizza_name='pepperoni pizza' OR m.pizza_name='cheese pizza')
ORDER BY 1 ASC;
