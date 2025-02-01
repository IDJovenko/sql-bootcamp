SELECT pz.name, pz.rating
FROM pizzeria pz
LEFT JOIN person_visits v ON pz.id = v.pizzeria_id
WHERE v.id IS NULL;
