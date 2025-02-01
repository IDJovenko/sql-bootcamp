SELECT m.pizza_name, m.price, pz.name, v.visit_date
FROM person_visits v
JOIN person p ON v.person_id = p.id
JOIN menu m ON v.pizzeria_id = m.pizzeria_id
JOIN pizzeria pz ON v.pizzeria_id = pz.id
WHERE p.name='Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY 1, 2, 3;
