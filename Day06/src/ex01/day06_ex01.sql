INSERT INTO person_discounts
SELECT ROW_NUMBER() OVER() AS id,
	     ord.person_id,
       m.pizzeria_id,
       CASE
         WHEN count(*)=1 THEN 10.5
         WHEN count(*)=2 THEN 22
         ELSE 30
       END AS discount
FROM person_order ord
JOIN menu m ON ord.menu_id = m.id
GROUP BY ord.person_id, m.pizzeria_id
ORDER BY person_id;
