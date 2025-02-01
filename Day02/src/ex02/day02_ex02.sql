SELECT COALESCE(p.name, '-') AS person_name,
				v.visit_date,
                COALESCE(pz.name, '-') AS pizzeria_name
FROM person p
FULL JOIN (SELECT id, person_id, pizzeria_id, visit_date
           FROM person_visits
           WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
          ) v ON p.id = v.person_id
FULL JOIN pizzeria pz ON v.pizzeria_id = pz.id
ORDER BY 1, 2, 3;