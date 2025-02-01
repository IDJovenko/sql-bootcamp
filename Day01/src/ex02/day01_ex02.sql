(SELECT m.pizza_name
FROM menu m)
UNION
(SELECT m.pizza_name
FROM menu m)
ORDER BY pizza_name DESC;
