SELECT acts.action_date, p.name
FROM 
	((SELECT v.visit_date AS action_date, v.person_id
        FROM person_visits v)
        INTERSECT
       (SELECT ord.order_date, ord.person_id
        FROM person_order ord)) AS acts
JOIN person p ON acts.person_id = p.id
ORDER BY acts.action_date ASC, p.name DESC;
