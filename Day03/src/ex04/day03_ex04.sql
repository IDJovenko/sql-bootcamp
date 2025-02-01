WITH CTE_order AS (
	SELECT pz.name AS pizzeria_name,
  		   p.gender
	FROM person_order ord
	JOIN person p ON ord.person_id = p.id
	JOIN menu m ON ord.menu_id = m.id
	JOIN pizzeria pz ON m.pizzeria_id = pz.id
)
SELECT pizzeria_name FROM CTE_order
EXCEPT
( SELECT pizzeria_name FROM CTE_order
  WHERE gender='female'
 INTERSECT
  SELECT pizzeria_name FROM CTE_order
  WHERE gender='male'
)
ORDER BY 1;
