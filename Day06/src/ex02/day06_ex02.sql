SELECT p.name,
	   m.pizza_name,
       m.price,
       (m.price - m.price*pd.discount/100)::INTEGER AS discount_price,
       pz.name AS pizzeria_name
FROM person_order ord
JOIN person p ON ord.person_id = p.id
JOIN menu m ON ord.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_discounts pd ON p.id = pd.person_id AND pz.id = pd.pizzeria_id 
ORDER BY p.name, m.pizza_name;
