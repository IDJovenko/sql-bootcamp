SELECT pz.name,
	   count AS count_of_orders,
       ROUND(avg,2) AS average_price,
       max AS max_price,
       min AS min_price
FROM (SELECT pizzeria_id, 
	   	     COUNT(*),
       		 AVG(price),
       		 MAX(price),
       		 MIN(price)
	  FROM person_order ord
	  JOIN menu m ON menu_id=m.id
	  GROUP BY pizzeria_id) pz_mtrcs
JOIN pizzeria pz ON pizzeria_id=pz.id
ORDER BY name ASC;
