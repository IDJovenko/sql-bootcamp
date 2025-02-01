SELECT p.name AS person_name,
	   m.pizza_name AS pizza_name,
       pz.name AS pizzeria_name
FROM person_order ord
LEFT JOIN person p ON ord.person_id = p.id
LEFT JOIN menu m ON ord.menu_id = m.id
LEFT JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;
