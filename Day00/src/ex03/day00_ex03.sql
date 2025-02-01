SELECT DISTINCT p.id
FROM person p
JOIN person_visits v ON p.id = v.person_id
WHERE v.pizzeria_id = 2
   OR v.visit_date BETWEEN '2022-01-06' AND '2022-01-09'
ORDER BY p.id DESC;
