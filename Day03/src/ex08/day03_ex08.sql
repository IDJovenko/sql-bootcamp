INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES ((SELECT MAX(m.id) + 1 FROM menu m),
       (SELECT pz.id FROM pizzeria pz WHERE pz.name='Dominos'),
       'sicilian pizza',
       900);

/*-- Show result
SELECT m.id, m.pizzeria_id, M.pizza_name, m.price
FROM menu m
WHERE m.id = 19;
*/
