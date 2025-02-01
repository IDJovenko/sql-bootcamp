WITH mushroom_pepperoni_menu AS (
 	SELECT m.pizza_name, m.pizzeria_id, m.price
  	FROM menu m
  	WHERE m.pizza_name='mushroom pizza' OR m.pizza_name='pepperoni pizza'
)
SELECT m.pizza_name, pz.name AS pizzeria_name, m.price
FROM pizzeria pz
LEFT JOIN mushroom_pepperoni_menu m ON pz.id = m.pizzeria_id
ORDER BY 1, 2;
