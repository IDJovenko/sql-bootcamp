-- Select pizzerias vizited by Andrey
SELECT pz.name AS pizzeria_name
FROM person_visits v
JOIN person p ON v.person_id = p.id
JOIN pizzeria pz ON v.pizzeria_id = pz.id
WHERE p.name='Andrey'
EXCEPT
-- Select pizzerias where Andrey ordered
SELECT pz.name
FROM person_order ord
JOIN person p ON ord.person_id = p.id
JOIN menu m ON ord.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE p.name='Andrey'
ORDER BY 1;
