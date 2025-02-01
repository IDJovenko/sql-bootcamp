SELECT DISTINCT p.name
FROM person_order ord
JOIN person p ON ord.person_id = p.id
JOIN menu m ON ord.menu_id = m.id
WHERE p.gender='male' AND (p.address='Moscow' OR p.address='Samara') AND
	 (m.pizza_name='pepperoni pizza' OR m.pizza_name='mushroom pizza')
ORDER BY 1 DESC;
