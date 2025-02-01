SELECT m.pizza_name, m.price, pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE NOT EXISTS (SELECT 0
                  FROM person_order ord
                  WHERE ord.menu_id = m.id)
ORDER BY 1, 2;
