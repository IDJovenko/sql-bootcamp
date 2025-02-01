SELECT name, SUM(count) AS total_sum
FROM ((SELECT pz.name, ord.count, 'order' AS action_type
       FROM (SELECT m.pizzeria_id, COUNT(*)
	     	 FROM person_order
	    	 JOIN menu m on menu_id = m.id
	    	 GROUP BY m.pizzeria_id) ord
  	   JOIN pizzeria pz ON ord.pizzeria_id = pz.id)
      UNION ALL
 	  (SELECT pz.name, v.count, 'visit'
  	   FROM (SELECT pizzeria_id, COUNT(*)
      		 FROM person_visits
	    	 GROUP BY pizzeria_id) v
  	   JOIN pizzeria pz ON v.pizzeria_id = pz.id))
GROUP BY name
ORDER BY total_sum DESC, name ASC;
