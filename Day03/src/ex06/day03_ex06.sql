WITH CTE_menu AS (
SELECT m.pizza_name,
  	   pz.name AS pizzeria_name,
       m.price
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
)
SELECT m1.pizza_name,
	   m1.pizzeria_name AS pizzeria_name_1,
       m2.pizzeria_name AS pizzeria_name_2,
       m1.price
FROM CTE_menu m1
JOIN CTE_menu m2 ON m1.pizza_name = m2.pizza_name AND
				    m1.price = m2.price AND
                    m1.pizzeria_name > m2.pizzeria_name
ORDER BY pizza_name;
