-- with pizzerias that didn't have any order

SELECT sub_q.address, pz.name, COALESCE(sub_q.count, 0) AS count_of_orders
FROM (SELECT CASE
		       WHEN g_ord.address IS NULL THEN g_v.address
               ELSE g_ord.address
             END AS address, CASE
         				       WHEN g_ord.pizzeria_id IS NULL THEN g_v.pizzeria_id
         				       ELSE g_ord.pizzeria_id
					         END AS pizzeria_id,
                         				         g_ord.count
      FROM (SELECT p.address, m.pizzeria_id, COUNT(*)
	        FROM person_order ord
	        JOIN person p ON ord.person_id=p.id
	        JOIN menu m ON ord.menu_id=m.id
	        GROUP BY m.pizzeria_id, p.address) g_ord
      RIGHT JOIN (SELECT p.address, v.pizzeria_id, NULL
			      FROM person_visits v
			      JOIN person p ON v.person_id=p.id
			      GROUP BY v.pizzeria_id, p.address) g_v
	        ON g_ord.address=g_v.address AND g_ord.pizzeria_id=g_v.pizzeria_id
    ) sub_q
JOIN pizzeria pz ON sub_q.pizzeria_id=pz.id
ORDER BY 1, 2;

/*
-- without pizzerias that didn't have any order
SELECT sub_q.address, pz.name, sub_q.count_of_orders
FROM (SELECT p.address, m.pizzeria_id, COUNT(*) AS count_of_orders
	  FROM person_order ord
	  JOIN person p ON ord.person_id=p.id
	  JOIN menu m ON ord.menu_id=m.id
	  GROUP BY m.pizzeria_id, p.address) sub_q
JOIN pizzeria pz ON sub_q.pizzeria_id=pz.id
ORDER BY 1, 2;
*/
