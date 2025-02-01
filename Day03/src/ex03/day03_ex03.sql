WITH CTE_visits AS (
  SELECT pz.name AS pizzeria_name,
         p.gender
  FROM person_visits v
  JOIN person p ON v.person_id = p.id
  JOIN pizzeria pz ON v.pizzeria_id = pz.id
),   CTE_male_female_intersect AS (
  (SELECT pizzeria_name
   FROM CTE_visits
   WHERE gender='male')
  INTERSECT ALL
  (SELECT pizzeria_name
   FROM CTE_visits
   WHERE gender='female')
)
 SELECT pizzeria_name
 FROM CTE_visits
EXCEPT ALL
(
 (SELECT pizzeria_name
  FROM CTE_male_female_intersect)
 UNION ALL
 (SELECT pizzeria_name
  FROM CTE_male_female_intersect)
)
ORDER BY 1;
 