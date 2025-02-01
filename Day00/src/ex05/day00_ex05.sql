SELECT
	(SELECT p.name FROM person p
     WHERE P.id = ord.person_id
     ) AS NAME
FROM person_order ord
WHERE (ord.menu_id = 13 OR ord.menu_id = 14 OR ord.menu_id = 18) AND ord.order_date = '2022-01-07';

/* 
-- Only with IN and JOIN
SELECT DISTINCT
	(SELECT p.name
     FROM person p
     JOIN person_order ord_subq ON ord_subq.person_id = p.id AND ord_subq.id = ord.id and ord_subq.order_date IN ('2022-01-07')
     JOIN menu m_subq ON ord_subq.menu_id = m_subq.id AND m_subq.id IN (13, 14, 18)) AS NAME
FROM person_order ord
JOIN person_order ord_2 ON ord.order_date IN ('2022-01-07')
JOIN menu m ON ord.menu_id = M.id AND M.id IN (13, 14, 18)
*/
