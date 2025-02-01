(SELECT ord.person_id
 FROM person_order ord
 WHERE ord.order_date = '2022-01-07')
EXCEPT ALL
(SELECT v.person_id
 FROM person_visits v
 WHERE v.visit_date = '2022-01-07');