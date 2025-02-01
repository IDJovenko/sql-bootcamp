SELECT m.pizza_name, pz.name
FROM person_order ord
JOIN menu m ON ord.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person p ON ord.person_id = p.id
WHERE p.name='Denis' OR p.name='Anna'
ORDER BY 1, 2;
